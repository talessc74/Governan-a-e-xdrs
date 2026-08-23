# Arquitetura de distribuição

Este repositório **é** o pacote npm `argus-xdrs-governance` — não um
consumidor dele. O que está aqui é a fonte; `filedist` é a ferramenta que
compõe e distribui esse conteúdo para outros projetos.

## O pacote

```json
{
  "name": "argus-xdrs-governance",
  "bin": { "argus-xdrs-governance": "bin/filedist.js" },
  "dependencies": {
    "filedist": "^0.35.0",
    "xdrs-core": "^0.28.4"
  }
}
```

`bin/filedist.js` é um wrapper de quatro linhas que delega tudo para o
pacote `filedist`:

```js
require('filedist').binpkg(__dirname, process.argv.slice(2));
```

## O que é distribuído — `.filedist-package.yml`

Este arquivo define três conjuntos (`sets`) de arquivos, cada um com sua
própria regra:

1. **Conteúdo `_core` do `xdrs-core`** — composto a partir da dependência
   `xdrs-core`, com alguns arquivos de teste excluídos. Inclui symlinks que
   expõem skills do XDRS em `.github/skills`. **Managed** — não editar
   localmente; qualquer mudança precisa ir para o `xdrs-core` upstream.

2. **Arquivos de governança** — `CLAUDE.md`, `AGENTS.md`, `.seeds/**`.
   **Managed** — são a fonte deste repositório mesmo, editados aqui e
   propagados para quem instala o pacote.

3. **`.xdrs/index.md`** — explicitamente `managed: false`. É o único
   arquivo que o projeto consumidor edita livremente, para listar suas
   próprias policies locais.

Um projeto que instala `argus-xdrs-governance` recebe um `.filedist.lock`
que rastreia quais arquivos vieram do pacote — nunca editar os arquivos
listados nele (`AGENTS.md` reforça essa regra explicitamente).

## Comandos (`Makefile`)

| Comando | O que faz |
|---|---|
| `make install` | `npm install` |
| `make build` | instala e empacota o tarball distribuível em `./dist` |
| `make lint` | `xdrs-core lint .` — valida documentos XDRS locais |
| `make lint-all` | lint incluindo escopos externos (`_core`) |
| `make check` | verifica se os arquivos managed estão em sincronia com o pacote publicado |
| `make extract` | grava os arquivos de governança no projeto atual |
| `make clean` | remove `dist/`, `node_modules/`, `.filedist.lock` |

Em um projeto consumidor, sem o `Makefile` copiado, os comandos equivalentes
via `npx` são `npx argus-xdrs-governance check` e
`npx argus-xdrs-governance extract`.

## Fluxo de atualização

Quando este repositório muda (nova seed, protocolo atualizado):

1. Bump de versão em `package.json`, `CLAUDE.md`, `.seeds/ARGUS.md`
2. `make build` gera o tarball / publica o pacote
3. Projetos consumidores rodam `npm update argus-xdrs-governance && npx argus-xdrs-governance extract`
   (ou `make check` primeiro, para confirmar que há algo novo antes de sobrescrever)

Isso é deliberadamente diferente do fluxo mais simples usado por outros
repositórios de governança ARGUS que só copiam arquivo por arquivo via
script — aqui a composição via `filedist` garante que o conteúdo `_core`
do XDRS (mantido em outro pacote, `xdrs-core`) chegue versionado e
sincronizado, sem duplicar a fonte.

## Ver também

- [`xdrs.md`](xdrs.md) — o que `_core` define e por que ele não é editado aqui
- [`../.filedist-package.yml`](../.filedist-package.yml) — a configuração completa
