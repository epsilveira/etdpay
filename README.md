<h1 align="center">Etdpay</h1>

<p align="center">
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-como-executar">Como executar</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-saiba-mais">Saiba mais</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-licença">Licença</a>
</p>

<p align="center">
  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT&color=8257E5&labelColor=000000">

 <img src="https://img.shields.io/static/v1?label=NLW&message=04&color=8257E5&labelColor=000000" alt="NLW 04" />
</p>

## ✨ Tecnologias

Esse projeto foi desenvolvido durante a NLW4 (Rocketseat) com as seguintes tecnologias:

- [Elixir](https://github.com/elixir-lang/elixir)
- [Phoenix](https://github.com/phoenixframework/phoenix)
- [Ecto](https://github.com/elixir-ecto/ecto)
- [ExUnit](https://github.com/elixir-lang/elixir/blob/master/lib/ex_unit/lib/ex_unit.ex)

## 💻 Projeto

O Etdpay é uma aplicação que simula uma API de pagamentos entre usuários, sendo possível realizar depósitos, saques e transferências.

## 🚀 Como executar

Para iniciar o seu servidor Phoenix:

- Necessário instalar: Elixir, Phoenix, Postgres
- Na pasta config, confirme as configurações do banco de dados em dev.exs, test.exs e do Basic Auth no config.exs
      Ou crie o arquivo .env na raiz com o padrão:       
        > export DB_USERNAME="usuario"
        > export DB_PASSWORD="senha"
        > export DB_HOSTNAME="endereco"
        > export AUTH_USERNAME="banana"
        > export AUTH_PASSWORD="nanica123"
      Execute <b>source .env</b> antes de iniciar o server.
- Instale as dependências com `mix deps.get`
- Crie o banco de dados e rode as migrations rodando `mix ecto.setup`
- Inicie o servidor Phoenix com `mix phx.server`

Agora você pode acessar [`localhost:4000`](http://localhost:4000) do seu navegador.

Pronto para colocar em produção? Dá uma olhada nos [guias de deploy](https://hexdocs.pm/phoenix/deployment.html).

## ⚡️ Saiba mais

- Website oficial: [https://www.phoenixframework.org](https://www.phoenixframework.org/)
- Guias: [https://hexdocs.pm/phoenix/overview.html](https://hexdocs.pm/phoenix/overview.html)
- Documentação: [https://hexdocs.pm/phoenix](https://hexdocs.pm/phoenix)
- Fórum: [https://elixirforum.com/c/phoenix-forum](https://elixirforum.com/c/phoenix-forum)
- GitHub: [https://github.com/phoenixframework/phoenix](https://github.com/phoenixframework/phoenix)

## 📄 Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.

---

Este README foi baseado no [README do projeto da Rocketseat](https://github.com/rocketseat-education/nlw-04-elixir/blob/master/README.md)