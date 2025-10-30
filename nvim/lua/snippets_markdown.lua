local luasnip = require("luasnip")

luasnip.snippets = {
  markdown = {
    luasnip.snippet(
      {
        trig = "gasto",
        dscr = "Create a new expend note",
      },
      {
        -- Placeholder values
        t("---"),
        t("title: "),
        i(1, "{{title}}"),
        t("\ndate:  "),
        f(function()
          return os.date("%Y-%m-%d")
        end),
        t("\ntime:  "),
        f(function()
          return os.date("%H:%M")
        end),
        t("---\n"),
        t("\n# Gasto\n"),
        t("\n## Valor\n"),
        t("\n## Data\n"),
        f(function()
          return os.date("%Y-%m-%d")
        end),
        t("\n## Horario\n"),
        f(function()
          return os.date("%H:%M")
        end),
        t("\n## Categoria\n"),
        t("\n--Mercado,Casa,Lazer, Alimentação, Transporte, Compra, Diversos, Aluguel, Impostos, Investimentos, Compras planejadas, Contas Fixas--"),
        t("\n## Subcategoria\n"),
        t("\n--ifood,feira,pao de açúcar, saída,"),
        t("\n## Descricao\n"),
        t("\n## Share\n0"),
      }
    ),
  },
}
