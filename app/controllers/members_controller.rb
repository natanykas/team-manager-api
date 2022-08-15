# frozen_string_literal: true

class MembersController < ApplicationController

  def create
    member = Member.new(permited_params)

    member.currency = fetch_currency[:parsed_response_body] if fetch_currency[:success]

    if member.save
      render json: { message: 'Member generated successfully', member: member }
    else
      render json: { message: 'Member could not be generated' }, status: :unprocessable_entity
    end
  end

  def update
    member = Member.find(params[:id])

    member.currency = fetch_currency[:parsed_response_body] if fetch_currency[:success]

    if member.update(permited_params)
      render json: { message: 'Member updated successfully', member: member }
    else
      render json: { message: 'Member could not be updated' }, status: :unprocessable_entity
    end
  end

  def show
    member = Member.find_by_id(params[:id])

    if member.present?
      render json: { member: member }
    else
      render json: { message: 'Member not found' }, status: :not_found
    end
  end

  def destroy
    member = Member.find(params[:id])

    if member.destroy
      render json: { message: 'Member destroyed' }
    else
      render json: { message: 'Member could not be destroyed' }, status: :unprocessable_entity
    end
  end

  private

  def permited_params
    params.require(:member).permit(:name, :salary_per_year, :country, tags: [], type_contract_attributes: [:name, :duration, :role])
  end

  def fetch_currency
    RestCountries::FetchCurrency.execute(params[:country])
  end
end
