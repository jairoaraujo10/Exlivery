defmodule Exlivery.Users.User do
  @keys [:name, :email, :cpf, :age, :address]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email, cpf, age, address)
      when age >= 18 and is_bitstring(cpf) do
    {
      :ok,
      %__MODULE__{
        name: name,
        cpf: cpf,
        age: age,
        address: address,
        email: email
      }
    }
  end

  def build(_name, _email, _cpf, _age, _address), do: {:error, "Invalid parameters"}
end
