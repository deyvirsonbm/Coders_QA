


Dado(/^que tenho um endpoint clientes$/) do
  # lista para o endpoint clientes em endpoints.json
end

Quando(/^realizar uma requisição GET para o endpoint "([^"]*)"$/) do |endpoint|
  @response = HTTParty.get 'http://localhost:3000/' + endpoint
end

Entao(/^retorna a lista com as informacoes dos clientes$/) do
  @validator=Helper.new
  @validator.validation_of_type @response [0] ["id"], Fixnum , "id" , 1
  @validator.validation_of_type @response [0] ["nome"], String , "nome" , "Maria"
  @validator.validation_of_type @response [0] ["cpf"], String , "cpf" , "XXXXXXXX"
  @validator.validation_of_type @response [0] ["sexo"], String , "sexo" , "Feminino"
  @validator.validation_of_type @response [0] ["altura"], Float , "altura" , 1.75

end

E(/^o status code '(\d+)'$/) do |status_code|
  status_code = status_code.to_i
  expect(@response.code).to eq status_code
end
