require './lib/integrations/rest_countries/fetch_currency'

class ApplicationService
  def self.execute(*args, **kwargs, &block)
    service = new(*args, **kwargs)

    service.execute(&block) if service.execute?
  end

  def execute
    raise('Missing #execute method definition')
  end

  def execute?
    true
  end
end
