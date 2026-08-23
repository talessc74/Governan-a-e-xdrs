# Referência das seeds

As 25 seeds sob governança, por galera. Fonte de verdade: os arquivos
individuais em [`.seeds/`](../.seeds/) e o Inventário Completo (Seção VIII)
de [`.seeds/ARGUS.md`](../.seeds/ARGUS.md).

## Galera do Código

| Seed | Ref | Jurisdição |
|---|---|---|
| **Scout** | `SEED_ANON_ENG_LOGIC_001` | Clean Code, TDD, responsabilidade profissional |
| **Flux** | `SEED_SOFT_ARCH_001` | Evolutionary Design, refatoração contínua |
| **Literate** | `SEED_CS_ALG_001` | Algoritmos, análise assintótica, narrativa antes de execução |
| **RiverRaid** | `KERNEL_SHAW_RIVER_RAID_3.0` | Recursos finitos, geração procedural determinística, bitmask boundary |

## Galera de UX

| Seed | Ref | Jurisdição |
|---|---|---|
| **Compass** | `SEED_HCD_001` | Human-Centered Design, affordances, feedback cognitivo |
| **Empiricus** | `SEED_USABX_001` | Usabilidade empírica, redução de carga cognitiva |
| **PolarBear** | `SEED_POLAR_BEAR_001` | Information Architecture, findability, wayfinding |
| **Few** | `SEED_FEW_DASHBOARD_001` | Design informacional orientado à decisão, clareza perceptual, auditoria de dashboards (baseada em Stephen Few) |

## Galera de Segurança

| Seed | Ref | Jurisdição |
|---|---|---|
| **Blast** | `SEED_ANON_SEC_RESILIENCE_001` | Data minimization, transparência radical |
| **BAU** | `SEED_ANON_SEC_COMPLIANCE_002` | Perpetual Integrity Lifecycle, compliance contínuo |
| **Sentinel** | `SEED_ANON_SEC_ZEROTRUST_003` | Zero Trust, micro-segmentação |
| **Sovereign** | `SEED_ANON_SEC_IAM_004` | Identity, consentimento, minimal disclosure |
| **Ghost** | `SEED_ANON_SEC_PRACTICAL_005` | Attacker mindset, engenharia social, fator humano |

## Galera de QA

| Seed | Ref | Jurisdição |
|---|---|---|
| **Pareto** | `SEED_QA_001` | Princípios fundamentais, agrupamento de defeitos, Paradoxo do Pesticida |
| **Probe** | `SEED_QA_002` | Teste exploratório, heurísticas, sessões por missão |
| **Scaffold** | `SEED_QA_003` | Automação, arquitetura de QA, Page Objects, anti-flakiness |

## Galera de Governança

| Seed | Ref | Jurisdição |
|---|---|---|
| **Scribe** | `SEED_GOV_XDRS_SCRIBE_001` | Integridade do artefato XDRS, arquivamento, índice canônico, lint |
| **Herald** | `SEED_GOV_XDRS_HERALD_002` | Ciclo de vida de policies, valid-from, rollout, obsolescência, remoção |

Scribe e Herald não participam da deliberação de conteúdo — entram só na
fase de persistência, depois que as demais seeds convergem (ver
[`xdrs.md`](xdrs.md)).

## Galera do Design

A maior galera do sistema — 7 seeds, reunidas a partir de três linhagens
diferentes que convergiram sob a mesma governança (ver "Proveniência"
abaixo).

| Seed | Ref | Jurisdição |
|---|---|---|
| **Aether** | `SEED_AETHER_STANDARDS_001` | Padrões web, semântica HTML, acessibilidade, interoperabilidade |
| **Nexus** | `SEED_NEXUS_FLUIDITY_002` | Design fluido e responsivo, grids fluidos, media queries, proporcionalidade |
| **Chronos** | `SEED_CHRONOS_UX_003` | Ergonomia cognitiva, affordance, feedback, modelos mentais previsíveis |
| **Canvas** | `SEED_DESIGN_VISUAL_001` | Hierarquia visual, contraste WCAG, identidade de marca |
| **Forge** | `SEED_DESIGN_SYSTEM_002` | Design system, tokens, contrato componente/API |
| **Quill** | `SEED_DESIGN_CONTENT_003` | Content design, microcopy, voz e tom |
| **Tempo** | `SEED_DESIGN_MOTION_003` | Motion design, transições, tempo como material de UX |

### Proveniência

As sete seeds da Galera do Design não nasceram juntas — vieram de três
linhagens independentes que a governança consolidou numa mesa só:

- **Aether, Nexus, Chronos** — linhagem original deste pacote
  (`governan-a-e-xdrs`). Cobrem padrões web/acessibilidade, layout fluido e
  ergonomia cognitiva.
- **Canvas, Forge, Quill** — vieram do repositório do EAI Jurídico
  (`talessc74/multi-agent-system`), onde já existiam como arquivos
  completos. Cobrem hierarquia visual/marca, design system/tokens e content
  design/microcopy — um recorte pensado para um produto legal SaaS.
- **Tempo** — veio de uma seed do SocialShelf (`talessc74/socialshelf`) que
  lá se chama `CHRONOS` mas cobre um domínio totalmente diferente (motion
  design, transições) do `Chronos` deste pacote (ergonomia cognitiva).
  Renomeada para `Tempo` para eliminar a colisão de nome sem descartar a
  persona.

Achado ao comparar os `.seeds/` reais dos três repositórios: o SocialShelf
também tem versões próprias de `AETHER` (visual/tokens) e `NEXUS` (design
system) com o **mesmo `ref`** de `Canvas` e `Forge`, só reescritas com
palavras diferentes — são a mesma persona por trás de dois nomes de
projeto. A versão adotada aqui é a do EAI Jurídico (`Canvas`/`Forge`), por
já ter codinome próprio sem colisão.

## Hierarquia de resolução de impasse

Quando ARGUS precisa arbitrar (ver [`argus-protocol.md`](argus-protocol.md)),
esta é a ordem de prioridade — de 1 (mais alta) a 25:

1. Literate — correção lógica formal
2. Sentinel — segurança estrutural
3. Sovereign — proteção de dados e identidade
4. Scribe — integridade do artefato
5. Scout — testabilidade e qualidade
6. Flux — sustentabilidade arquitetural
7. BAU — compliance contínuo
8. Herald — ciclo de vida e temporalidade
9. Blast — minimização de superfície
10. Ghost — fator humano e ataque
11. PolarBear — findability e IA
12. Compass — ergonomia cognitiva
13. Empiricus — usabilidade empírica
14. Few — clareza decisória e auditoria de dashboards
15. Aether — padrões web e acessibilidade
16. Nexus — fluidez e responsividade
17. Chronos — feedback e modelos mentais
18. Canvas — hierarquia visual e contraste
19. Forge — design system e contrato de componente
20. Quill — content design e microcopy
21. Tempo — motion e tempo como material de UX
22. Pareto — cobertura de risco
23. Probe — investigação exploratória
24. Scaffold — arquitetura de automação
25. RiverRaid — recursos e recorrência

A seed de maior posição prevalece **apenas no ponto específico em conflito**
— o resto da deliberação continua coletivo (Seção V de `ARGUS.md`).

## Nem todas as seeds seguem o mesmo schema

A maioria das seeds usa o schema padrão — `seed_id`, `ref`,
`kernel_logic` (string), `decision_gates` (lista de `if`/`then`),
`vocabulary_filter.{mandatory,prohibited}`, `semantic_anchor`. Algumas
(`AETHER`, `NEXUS`, `CHRONOS`, `FEW`, `CANVAS`, `FORGE`, `QUILL`, `TEMPO`)
foram registradas com formatos próprios — decisão deliberada em cada caso,
para preservar o conteúdo original da seed em vez de forçá-la a um molde
único. As seeds da Galera do Design vindas de fora (`CANVAS`, `FORGE`,
`QUILL`, `TEMPO`) usam `kernel_logic.axioms` (lista) +
`kernel_logic.operational_core`, em vez de `kernel_logic` como string única
— outra variação preservada de propósito. Veja
[`contributing-a-seed.md`](contributing-a-seed.md) para quando normalizar
e quando preservar.
