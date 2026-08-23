# argus-xdrs-governance

Sistema de governança distribuída para agentes de IA: 21 "seeds" (personas
com jurisdição própria) deliberam em mesa sob a orquestração de **ARGUS**,
e as decisões convergidas são arquivadas como registros de decisão
estruturados via **XDRS** (Architectural / Business / Engineering Decision
Records).

Publicado como pacote npm — `argus-xdrs-governance` — para ser instalado em
qualquer repositório que use Claude Code, Cursor, ou outro agente que leia
`CLAUDE.md` / `AGENTS.md`.

---

## O que este pacote resolve

Agentes de IA operando sozinhos em um repositório tendem a dois problemas:

1. **Decisão sem revisão de perspectiva** — uma única "voz" decide arquitetura,
   segurança, UX e QA ao mesmo tempo, sem tensão nem verificação cruzada.
2. **Decisão sem memória** — a lógica por trás de uma escolha vive só na
   conversa; o próximo agente (ou o próximo humano) não tem como recuperá-la.

Este pacote endereça os dois: convoca uma equipe de seeds com jurisdições
concorrentes para deliberar (problema 1), e arquiva a convergência como
documento XDRS versionado e indexado (problema 2).

---

## Instalação

```bash
npm install argus-xdrs-governance
npx argus-xdrs-governance extract
```

O comando `extract` grava `CLAUDE.md`, `AGENTS.md`, `.seeds/**` e
`.xdrs/index.md` na raiz do seu projeto. A partir do próximo chat com o
agente, a governança ARGUS está ativa.

Veja [`docs/architecture.md`](docs/architecture.md) para o que cada comando
do `Makefile` faz e como a distribuição via `filedist` funciona por baixo.

---

## Como usar

Dentro do chat com o agente, acione ARGUS por linguagem natural:

| Comando | O que acontece |
|---|---|
| `Argus, revisa este código` | ARGUS lê o contexto e convoca a equipe certa |
| `Argus, chama a galera do código` | Scout · Flux · Literate · RiverRaid |
| `Argus, chama a galera de UX` | Compass · Empiricus · PolarBear · Few |
| `Argus, chama a galera de segurança` | Blast · BAU · Sentinel · Sovereign · Ghost |
| `Argus, chama a galera de QA` | Pareto · Probe · Scaffold |
| `Argus, chama a galera de governança` | Scribe · Herald |
| `Argus, chama a galera do design` | Aether · Nexus · Chronos |
| `Argus, chama todo mundo` | todas as 21 seeds |
| `Argus, quem é o [nome]?` | apresenta a seed e sua jurisdição |
| `Argus, apresenta a [galera]` | lista os membros do grupo |

O protocolo completo — como as seeds falam na mesa, como a convergência
acontece, e como ARGUS arbitra impasses — está documentado em
[`docs/argus-protocol.md`](docs/argus-protocol.md).

---

## As 21 seeds

Seis equipes ("galeras"), cada uma com jurisdição sobre um domínio:

| Galera | Seeds |
|---|---|
| Código | Scout · Flux · Literate · RiverRaid |
| UX | Compass · Empiricus · PolarBear · Few |
| Segurança | Blast · BAU · Sentinel · Sovereign · Ghost |
| QA | Pareto · Probe · Scaffold |
| Governança | Scribe · Herald |
| Design | Aether · Nexus · Chronos |

Tabela completa com a jurisdição de cada seed em
[`docs/seeds-reference.md`](docs/seeds-reference.md). Quer adicionar uma
nova seed? Veja [`docs/contributing-a-seed.md`](docs/contributing-a-seed.md).

---

## XDRS: onde as decisões são arquivadas

Toda convergência que merece persistir é estruturada por SCRIBE, recebe
`valid-from` de HERALD, e é arquivada em `.xdrs/_local/` como um ADR, BDR
ou EDR — nunca em conversa solta. Detalhes do formato, do `_core` externo
e do fluxo de arquivamento em [`docs/xdrs.md`](docs/xdrs.md).

---

## Estrutura do repositório

```
/
  CLAUDE.md              ← lido primeiro pelo agente
  AGENTS.md               ← regras mínimas para agentes IA
  package.json             ← pacote npm distribuído
  Makefile                 ← install / build / lint / check / extract
  .filedist-package.yml    ← define o que é distribuído e o que é "managed"
  .seeds/
    ARGUS.md                ← orquestrador — protocolo completo
    <SEED>.json × 21        ← uma persona por arquivo
  .xdrs/
    index.md                 ← raiz do índice XDRS
    _core/                    ← padrões do framework (externo, via xdrs-core)
    _local/                   ← policies deste projeto
  docs/
    argus-protocol.md         ← como a deliberação funciona
    seeds-reference.md         ← tabela completa das 21 seeds
    xdrs.md                     ← ADR/BDR/EDR, _core vs _local, arquivamento
    contributing-a-seed.md       ← como propor e registrar uma nova seed
    architecture.md               ← filedist, versionamento, comandos do Makefile
```

---

## Documentação completa

- [`docs/argus-protocol.md`](docs/argus-protocol.md) — vigilância, convocação, deliberação, convergência, impasse
- [`docs/seeds-reference.md`](docs/seeds-reference.md) — as 21 seeds, por galera, com jurisdição e ref
- [`docs/xdrs.md`](docs/xdrs.md) — o que é XDRS, ADR/BDR/EDR, `_core` vs `_local`
- [`docs/contributing-a-seed.md`](docs/contributing-a-seed.md) — checklist para adicionar uma seed nova
- [`docs/architecture.md`](docs/architecture.md) — distribuição via `filedist`, versionamento, `Makefile`

## Licença

MIT
