# argus-xdrs-governance

Governance layer for any project. Installs 17 deliberating seeds under the ARGUS orchestration protocol, integrated with XDRS decision records.

## What it does

- Drops `CLAUDE.md` and `AGENTS.md` — mandatory reading for every AI agent session
- Drops `.seeds/` — 17 seed definitions across 5 teams (Code, UX, Security, QA, Governance)
- Drops `.seeds/ARGUS.md` — the full deliberation protocol
- Drops `.xdrs/_core/` — XDRS framework standards (managed, do not edit)
- Drops `.xdrs/index.md` — root index (yours to extend)
- Drops `.xdrs/_local/` — empty decision record skeleton (yours to fill)

## Adoption (new project)

```bash
# 1. Install
npm install --save-dev argus-xdrs-governance

# 2. Extract governance files
npx argus-xdrs-governance

# 3. Verify everything is in sync
npx argus-xdrs-governance check
```

That's it. The project now operates under ARGUS + XDRS governance.

## Staying up to date

```bash
# Update to latest governance version
npx argus-xdrs-governance update

# Re-verify after update
npx argus-xdrs-governance check
```

## Makefile shortcuts (optional)

If you copy the `Makefile` from this repo into your project:

```bash
make extract   # extract / update governance files
make check     # verify managed files are in sync
make lint      # lint your local XDRS decision records
make lint-all  # lint including _core standards
```

## What gets tracked vs. what you own

| Path | Managed? | Description |
|---|---|---|
| `CLAUDE.md` | yes | AI agent instructions — updated with package |
| `AGENTS.md` | yes | Agent workflow rules — updated with package |
| `.seeds/**` | yes | All seed definitions — updated with package |
| `.xdrs/_core/**` | yes | XDRS framework standards — updated with package |
| `.xdrs/index.md` | **no** | Root index — you extend this |
| `.xdrs/_local/**` | **no** | Your project's decision records — you write these |

Managed files come from the package. Never edit them directly — submit upstream changes instead. Files marked **no** are yours; the package creates them once and never touches them again.

## ARGUS quick reference

| Trigger phrase | What happens |
|---|---|
| `"Argus, revisa este código"` | ARGUS reads context, convenes the right team |
| `"Argus, chama a galera do código"` | Scout · Flux · Literate · RiverRaid |
| `"Argus, chama a galera de UX"` | Compass · Empiricus · PolarBear |
| `"Argus, chama a galera de segurança"` | Blast · BAU · Sentinel · Sovereign · Ghost |
| `"Argus, chama a galera de QA"` | Pareto · Probe · Scaffold |
| `"Argus, chama a galera de governança"` | Scribe · Herald |
| `"Argus, chama todo mundo"` | All 17 seeds |

## License

MIT
