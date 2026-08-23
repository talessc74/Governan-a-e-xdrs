# Como adicionar uma nova seed

Checklist baseado no processo real usado para adicionar `FEW` (Galera de
UX) e `AETHER`/`NEXUS`/`CHRONOS` (Galera do Design) a este repositório.

## 1. Defina identidade e jurisdição

Toda seed precisa de:
- **Codinome** curto, uma palavra (`SCOUT`, `FLUX`, `FEW`) — vira o nome do
  arquivo `.seeds/<CODINOME>.json` e a forma como ARGUS se refere a ela
- **Galera** — a qual das seis equipes ela pertence (Código, UX, Segurança,
  QA, Governança, Design)
- **Jurisdição** — uma frase curta do que ela defende na mesa

## 2. Escolha o schema: normalizar ou preservar

A maioria das seeds usa o schema padrão:

```json
{
  "seed_id": "CODINOME",
  "ref": "SEED_<DOMINIO>_<NNN>",
  "kernel_logic": "A crença central e inegociável — o porquê a seed existe, em uma frase.",
  "decision_gates": [
    { "if": "condição observada", "then": "postura que a seed toma" }
  ],
  "vocabulary_filter": {
    "mandatory": ["termos que a seed deve usar"],
    "prohibited": ["termos que a seed nunca pode usar"]
  },
  "semantic_anchor": "Frase-síntese da jurisdição da seed."
}
```

Isso é o que `ARGUS.md` espera conseguir ler de qualquer seed na mesa —
`kernel_logic` como uma frase (não uma lista), `vocabulary_filter.prohibited`
(não `forbidden`), e um `semantic_anchor` que resume a jurisdição.

**Se a seed vier de uma especificação mais rica** (múltiplos modos de
operação, exemplos, métricas — como `FEW`), a decisão correta nem sempre é
forçar tudo no schema mínimo. Pergunte: o conteúdo original perde algo
essencial se for comprimido? Se sim, prefira preservar o formato original
quase intacto, acrescentando só o mínimo necessário para integração — na
prática, um campo `seed_id` no topo, para que ARGUS consiga correlacionar
o arquivo com o codinome usado nas tabelas e comandos. Documente a escolha
(veja como `AETHER`/`NEXUS`/`CHRONOS` e `FEW` fizeram isso de formas
diferentes — nenhuma segue o schema padrão à risca).

Essa é uma decisão editorial, não técnica — vale conversar com quem está
pedindo a seed nova antes de reestruturar o conteúdo dela.

## 3. Escreva o arquivo

`.seeds/<CODINOME>.json` — na raiz de `.seeds/`, junto com as demais.

## 4. Registre em todos os pontos de referência

Uma seed que existe só como arquivo é uma seed órfã — ARGUS nunca a convoca
e ela nunca entra na arbitragem de impasse. Ela precisa aparecer em:

- **`CLAUDE.md`**
  - Header: contagem total de seeds e tamanho da galera (`# Seeds under governance: N`, `Galera de X (N)`)
  - "Como acionar ARGUS": comando de convocação da galera (`"Argus, chama a galera de X"`)
  - "Como acionar ARGUS": `"Argus, chama todo mundo"` → `todas as N seeds`
  - "Seeds disponíveis": linha `- .seeds/<CODINOME>.json → <jurisdição>` sob a galera certa
  - "Estrutura de arquivos": nome do arquivo na árvore

- **`.seeds/ARGUS.md`**
  - Header: mesma contagem e tamanho de galera do `CLAUDE.md`
  - Seção II: comando de convocação da galera
  - Seção II: `"Argus, chama todo mundo"` → nova contagem
  - Seção V: posição na hierarquia de resolução de impasse — decida onde ela
    entra relativa às seeds vizinhas de prioridade (ver
    [`seeds-reference.md`](seeds-reference.md) para a ordem atual)
  - Seção VIII: linha na tabela de Inventário Completo, sob a galera certa

- **`README.md`** — se o repositório documentar a lista publicamente, o mesmo
  vale aqui: tabela de galeras, comando de convocação, contagem total

- **`docs/seeds-reference.md`** — linha na tabela da galera e na hierarquia de impasse

- **`package.json`** — se a contagem de seeds aparecer na `description`

Depois de registrar, bump de versão em `CLAUDE.md`, `.seeds/ARGUS.md` e
`package.json` (patch ou minor — adicionar uma seed é aditivo).

## 5. Valide

```bash
node -e "JSON.parse(require('fs').readFileSync('.seeds/<CODINOME>.json'))"  # JSON válido
grep -rn "<CODINOME>" CLAUDE.md .seeds/ARGUS.md README.md docs/seeds-reference.md  # apareceu em todos os pontos?
```

Confira também que as contagens (`N seeds`, `Galera de X (N)`) batem entre
`CLAUDE.md`, `.seeds/ARGUS.md` e `package.json`.
