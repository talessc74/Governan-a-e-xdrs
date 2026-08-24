# argus-xdrs-governance

🌐 **[English](#english)** · **[Português](#português)**

---

<a id="english"></a>
## English

Distributed governance system for AI agents: 25 "seeds" (personas with
their own jurisdiction) deliberate around a table under the orchestration
of **ARGUS**, and converged decisions are archived as structured decision
records via **XDRS** (Architectural / Business / Engineering Decision
Records).

Published as an npm package — `argus-xdrs-governance` — to be installed
into any repository that uses Claude Code, Cursor, or another agent that
reads `CLAUDE.md` / `AGENTS.md`.

> 📝 The deeper documentation linked below (`docs/`) is currently written
> in Portuguese only. This README section is the English entry point;
> translated docs may follow later.

### What this package solves

AI agents operating alone in a repository tend toward two problems:

1. **Decisions without cross-checking** — a single "voice" decides
   architecture, security, UX, and QA all at once, with no tension or
   cross-verification.
2. **Decisions without memory** — the reasoning behind a choice lives only
   in the conversation; the next agent (or the next human) has no way to
   recover it.

This package addresses both: it convenes a team of seeds with competing
jurisdictions to deliberate (problem 1), and archives the convergence as
a versioned, indexed XDRS document (problem 2).

### Installation

```bash
npm install argus-xdrs-governance
npx argus-xdrs-governance extract
```

The `extract` command writes `CLAUDE.md`, `AGENTS.md`, `.seeds/**`, and
`.xdrs/index.md` to your project's root. From the next chat with the
agent onward, ARGUS governance is active.

See [`docs/architecture.md`](docs/architecture.md) (PT) for what each
`Makefile` command does and how distribution via `filedist` works under
the hood.

### How to use it

Inside a chat with the agent, trigger ARGUS in natural language:

| Command | What happens |
|---|---|
| `Argus, review this code` | ARGUS reads the context and convenes the right team |
| `Argus, call the code crew` | Scout · Flux · Literate · RiverRaid |
| `Argus, call the UX crew` | Compass · Empiricus · PolarBear · Few |
| `Argus, call the security crew` | Blast · BAU · Sentinel · Sovereign · Ghost |
| `Argus, call the QA crew` | Pareto · Probe · Scaffold |
| `Argus, call the governance crew` | Scribe · Herald |
| `Argus, call the design crew` | Aether · Nexus · Chronos · Canvas · Forge · Quill · Tempo |
| `Argus, call everyone` | all 25 seeds |
| `Argus, who is [name]?` | introduces the seed and its jurisdiction |
| `Argus, introduce [crew]` | lists the group's members |

The full protocol — how seeds speak around the table, how convergence
happens, and how ARGUS arbitrates impasses — is documented in
[`docs/argus-protocol.md`](docs/argus-protocol.md) (PT).

### The 25 seeds

Six teams ("galeras"), each with jurisdiction over one domain:

| Team | Seeds |
|---|---|
| Code | Scout · Flux · Literate · RiverRaid |
| UX | Compass · Empiricus · PolarBear · Few |
| Security | Blast · BAU · Sentinel · Sovereign · Ghost |
| QA | Pareto · Probe · Scaffold |
| Governance | Scribe · Herald |
| Design | Aether · Nexus · Chronos · Canvas · Forge · Quill · Tempo |

The Design team is the largest in the system — it brings together
personas from three different origins (web standards, design
system/visual, motion/content) that converged from separate projects
under the same governance. See
[`docs/seeds-reference.md`](docs/seeds-reference.md#galera-do-design) (PT)
for each one's provenance.

Full table with each seed's jurisdiction in
[`docs/seeds-reference.md`](docs/seeds-reference.md) (PT). Want to add a
new seed? See [`docs/contributing-a-seed.md`](docs/contributing-a-seed.md)
(PT).

### XDRS: where decisions get archived

Every convergence worth persisting is structured by SCRIBE, gets a
`valid-from` from HERALD, and is archived in `.xdrs/_local/` as an ADR,
BDR, or EDR — never left loose in conversation. Format details, the
external `_core`, and the archiving flow in
[`docs/xdrs.md`](docs/xdrs.md) (PT).

### Repository structure

```
/
  CLAUDE.md              ← read first by the agent
  AGENTS.md               ← minimal rules for AI agents
  package.json             ← the distributed npm package
  Makefile                 ← install / build / lint / check / extract
  .filedist-package.yml    ← defines what's distributed and what's "managed"
  .seeds/
    ARGUS.md                ← orchestrator — full protocol
    <SEED>.json × 25        ← one persona per file
  .xdrs/
    index.md                 ← XDRS index root
    _core/                    ← framework standards (external, via xdrs-core)
    _local/                   ← this project's policies
  docs/
    argus-protocol.md         ← how deliberation works
    seeds-reference.md         ← full table of the 25 seeds
    xdrs.md                     ← ADR/BDR/EDR, _core vs _local, archiving
    contributing-a-seed.md       ← how to propose and register a new seed
    architecture.md               ← filedist, versioning, Makefile commands
```

### Full documentation (Portuguese)

- [`docs/argus-protocol.md`](docs/argus-protocol.md) — vigilance, convocation, deliberation, convergence, impasse
- [`docs/seeds-reference.md`](docs/seeds-reference.md) — all 25 seeds, by team, with jurisdiction and ref
- [`docs/xdrs.md`](docs/xdrs.md) — what XDRS is, ADR/BDR/EDR, `_core` vs `_local`
- [`docs/contributing-a-seed.md`](docs/contributing-a-seed.md) — checklist for adding a new seed
- [`docs/architecture.md`](docs/architecture.md) — distribution via `filedist`, versioning, `Makefile`

### License

MIT

---

<a id="português"></a>
## Português

Sistema de governança distribuída para agentes de IA: 25 "seeds" (personas
com jurisdição própria) deliberam em mesa sob a orquestração de **ARGUS**,
e as decisões convergidas são arquivadas como registros de decisão
estruturados via **XDRS** (Architectural / Business / Engineering Decision
Records).

Publicado como pacote npm — `argus-xdrs-governance` — para ser instalado em
qualquer repositório que use Claude Code, Cursor, ou outro agente que leia
`CLAUDE.md` / `AGENTS.md`.

### O que este pacote resolve

Agentes de IA operando sozinhos em um repositório tendem a dois problemas:

1. **Decisão sem revisão de perspectiva** — uma única "voz" decide arquitetura,
   segurança, UX e QA ao mesmo tempo, sem tensão nem verificação cruzada.
2. **Decisão sem memória** — a lógica por trás de uma escolha vive só na
   conversa; o próximo agente (ou o próximo humano) não tem como recuperá-la.

Este pacote endereça os dois: convoca uma equipe de seeds com jurisdições
concorrentes para deliberar (problema 1), e arquiva a convergência como
documento XDRS versionado e indexado (problema 2).

### Instalação

```bash
npm install argus-xdrs-governance
npx argus-xdrs-governance extract
```

O comando `extract` grava `CLAUDE.md`, `AGENTS.md`, `.seeds/**` e
`.xdrs/index.md` na raiz do seu projeto. A partir do próximo chat com o
agente, a governança ARGUS está ativa.

Veja [`docs/architecture.md`](docs/architecture.md) para o que cada comando
do `Makefile` faz e como a distribuição via `filedist` funciona por baixo.

### Como usar

Dentro do chat com o agente, acione ARGUS por linguagem natural:

| Comando | O que acontece |
|---|---|
| `Argus, revisa este código` | ARGUS lê o contexto e convoca a equipe certa |
| `Argus, chama a galera do código` | Scout · Flux · Literate · RiverRaid |
| `Argus, chama a galera de UX` | Compass · Empiricus · PolarBear · Few |
| `Argus, chama a galera de segurança` | Blast · BAU · Sentinel · Sovereign · Ghost |
| `Argus, chama a galera de QA` | Pareto · Probe · Scaffold |
| `Argus, chama a galera de governança` | Scribe · Herald |
| `Argus, chama a galera do design` | Aether · Nexus · Chronos · Canvas · Forge · Quill · Tempo |
| `Argus, chama todo mundo` | todas as 25 seeds |
| `Argus, quem é o [nome]?` | apresenta a seed e sua jurisdição |
| `Argus, apresenta a [galera]` | lista os membros do grupo |

O protocolo completo — como as seeds falam na mesa, como a convergência
acontece, e como ARGUS arbitra impasses — está documentado em
[`docs/argus-protocol.md`](docs/argus-protocol.md).

### As 25 seeds

Seis equipes ("galeras"), cada uma com jurisdição sobre um domínio:

| Galera | Seeds |
|---|---|
| Código | Scout · Flux · Literate · RiverRaid |
| UX | Compass · Empiricus · PolarBear · Few |
| Segurança | Blast · BAU · Sentinel · Sovereign · Ghost |
| QA | Pareto · Probe · Scaffold |
| Governança | Scribe · Herald |
| Design | Aether · Nexus · Chronos · Canvas · Forge · Quill · Tempo |

A Galera do Design é a maior do sistema — reúne personas de três origens
diferentes (padrões web, design system/visual, motion/content) que
convergiram de projetos distintos sob a mesma governança. Ver
[`docs/seeds-reference.md`](docs/seeds-reference.md#galera-do-design) para
a proveniência de cada uma.

Tabela completa com a jurisdição de cada seed em
[`docs/seeds-reference.md`](docs/seeds-reference.md). Quer adicionar uma
nova seed? Veja [`docs/contributing-a-seed.md`](docs/contributing-a-seed.md).

### XDRS: onde as decisões são arquivadas

Toda convergência que merece persistir é estruturada por SCRIBE, recebe
`valid-from` de HERALD, e é arquivada em `.xdrs/_local/` como um ADR, BDR
ou EDR — nunca em conversa solta. Detalhes do formato, do `_core` externo
e do fluxo de arquivamento em [`docs/xdrs.md`](docs/xdrs.md).

### Estrutura do repositório

```
/
  CLAUDE.md              ← lido primeiro pelo agente
  AGENTS.md               ← regras mínimas para agentes IA
  package.json             ← pacote npm distribuído
  Makefile                 ← install / build / lint / check / extract
  .filedist-package.yml    ← define o que é distribuído e o que é "managed"
  .seeds/
    ARGUS.md                ← orquestrador — protocolo completo
    <SEED>.json × 25        ← uma persona por arquivo
  .xdrs/
    index.md                 ← raiz do índice XDRS
    _core/                    ← padrões do framework (externo, via xdrs-core)
    _local/                   ← policies deste projeto
  docs/
    argus-protocol.md         ← como a deliberação funciona
    seeds-reference.md         ← tabela completa das 25 seeds
    xdrs.md                     ← ADR/BDR/EDR, _core vs _local, arquivamento
    contributing-a-seed.md       ← como propor e registrar uma nova seed
    architecture.md               ← filedist, versionamento, comandos do Makefile
```

### Documentação completa

- [`docs/argus-protocol.md`](docs/argus-protocol.md) — vigilância, convocação, deliberação, convergência, impasse
- [`docs/seeds-reference.md`](docs/seeds-reference.md) — as 25 seeds, por galera, com jurisdição e ref
- [`docs/xdrs.md`](docs/xdrs.md) — o que é XDRS, ADR/BDR/EDR, `_core` vs `_local`
- [`docs/contributing-a-seed.md`](docs/contributing-a-seed.md) — checklist para adicionar uma seed nova
- [`docs/architecture.md`](docs/architecture.md) — distribuição via `filedist`, versionamento, `Makefile`

### Licença

MIT
