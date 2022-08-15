<h1>Team Manager</h1>

Features and Requirements:

A member has:
<ul>
<li>name</li>
<li>salary_per_year</li>
<li>type: it can be either an employee or a contractor.</li>
<li>If it's a contractor, we want to store the duration of the contract as an integer.</li>
<li>If it's an employee, we need to store their role, for instance: Software Engineer, Project Manager and so on.</li>
<li>A member can be tagged, for instance: C#, Angular, General Frontend, Seasoned Leader and so on. (Tags will likely be used as filters later, so keep that in mind)</li>
<li>A member lives in a Country. When we receive the request to create the member we should receive the "country" attribute, from it we should fetch the currency of the country that you should get from https://restcountries.com/, see the following example: https://restcountries.com/v3.1/name/brasil, where "brasil" is the name of the country. we need to store the currency together with the country information so our HR team knows which currency to pay the member.</li>
</ul>

Dependencies

* Docker
* Docker-compose

*Build your enviorment*

```
docker-compose build
```

*Create your Data base*

```
docker-compose run web rake db:create db:migrate
```

*Run the project*

```
docker-compose up
```

http://0.0.0.0:3000

*Testing the project*

```
docker-compose run web rake spec PGUSER=postgres RAILS_ENV=test
```

*Colection Postman*

https://www.getpostman.com/collections/7fdecab4bb9bc6d9d14f
