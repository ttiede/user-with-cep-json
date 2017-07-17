 
***Projeto CRUD JSON Usuarios passando apenas CEP e populando***
------------------------------
----------
Obs: Nao foi utilizado o padrao JSON API:
http://jsonapi.org

A estrutura das mensagens para um POST junto com as boas praticas recomendas pelo JSON API, nao se tornam viaveis dado a estrutura do RAILS utilizando SERIALIZACAO.
Para tal a estrutura proposta foi essa:

Modelo de a requisição com lista dos usuários

 >http://localhost:3000/v1/users/
Chamar a URL acima utilizando o verbo GET sem grandes necessidades


Modelo de a requisição para exibir dados de um usuário específico

 >http://localhost:3000/v1/users/ID_USUARIO
Chamar a URL acima utilizando o verbo GET sem grandes necessidades


Modelo de a requisição da exclusao de usuário
 >http://localhost:3000/v1/users/ID_USUARIO
Chamar a URL acima utilizando o verbo DELETE passando o valor do id do usuario

Modelo de a requisição de criação de  usuários
 >http://localhost:3000/v1/users
Chamar a URL acima utilizando o verbo POST passando o conteúdo

    { 
    "user":{
       "name":"NOME DO USUARO",
       "email":"EMAIL DO USUARIO",
       "address_attributes":{  
          "zipcode":"CEP DO USUARIO"
       }
    	}	
    }


Modelo de a requisição de atualização de usuário
 >http://localhost:3000/v1/users/ID_USUARIO
Chamar a URL acima utilizando o verbo PUT/PATCH passando o conteúdo

    { 
    "user":{
	    "id": ID_USER
       "name":"NOME DO USUARO",
       "email":"EMAIL DO USUARIO",
       "address_attributes":{ 
	      "id": ADDRESS ID 
          "zipcode":"CEP DO USUARIO"
       }
    	}	
    }
OBS: O uso dos IDS conforme o exemplo,  é considerada boa prática 



----------
**Dependências**

----------


 - Ruby 2.4.0p0
 - Rails 5.1
 - Bundler 1.15.1


----------
***Orientações***

----------

Antes de executar o backend é necessário instalar as dependências:

 >   bundle install

Para iniciar o  servidor execute o comando:

   >  rails server


Acesso ao callpointers disponibilizado pelo backend:

Lista dos usuarios.
http://localhost:3000/v1/users/




Para testes executar o comando abaixo:

 >   bundle exec rspec spec
