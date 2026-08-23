# Referência das seeds

As 21 seeds sob governança, por galera. Fonte de verdade: os arquivos
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

| Seed | Ref | Jurisdição |
|---|---|---|
| **Aether** | `SEED_AETHER_STANDARDS_001` | Padrões web, semântica HTML, acessibilidade, interoperabilidade |
| **Nexus** | `SEED_NEXUS_FLUIDITY_002` | Design fluido e responsivo, grids fluidos, media queries, proporcionalidade |
| **Chronos** | `SEED_CHRONOS_UX_003` | Ergonomia cognitiva, affordance, feedback, modelos mentais previsíveis |

## Hierarquia de resolução de impasse

Quando ARGUS precisa arbitrar (ver [`argus-protocol.md`](argus-protocol.md)),
esta é a ordem de prioridade — de 1 (mais alta) a 21:

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
18. Pareto — cobertura de risco
19. Probe — investigação exploratória
20. Scaffold — arquitetura de automação
21. RiverRaid — recursos e recorrência

A seed de maior posição prevalece **apenas no ponto específico em conflito**
— o resto da deliberação continua coletivo (Seção V de `ARGUS.md`).

## Nem todas as seeds seguem o mesmo schema

A maioria das seeds usa o schema padrão — `seed_id`, `ref`,
`kernel_logic` (string), `decision_gates` (lista de `if`/`then`),
`vocabulary_filter.{mandatory,prohibited}`, `semantic_anchor`. Algumas
(`AETHER`, `NEXUS`, `CHRONOS`, `FEW`) foram registradas com formatos
próprios — decisão deliberada em cada caso, para preservar o conteúdo
original da seed em vez de forçá-la a um molde único. Veja
[`contributing-a-seed.md`](contributing-a-seed.md) para quando normalizar
e quando preservar.
