# _local ADRs Index

Architectural and technical decisions for this project, created through ARGUS deliberation.

## Subjects

- `principles` — Cross-cutting architecture and policy foundations
- `application` — System and service design decisions
- `data` — Data architecture and information modeling
- `integration` — Communication between internal/external systems
- `platform` — Platform-level runtime and enabling capabilities
- `controls` — Architecture controls for risk, security, and compliance
- `operations` — Operational architecture decisions

## Application

- [_local-adr-policy-101](application/101-expansao-galera-design-anti-generico.md) - Expansão da Galera do Design com THRESHOLD, EMPATH, SKEPTIC
- [_local-adr-policy-102](application/102-expansao-galera-codigo-confiabilidade-escopo.md) - Expansão da Galera do Código com VIGIL, SURGEON
- [_local-adr-policy-103](application/103-redesenho-agentes-curadoria-sgcco.md) - Redesenho dos agentes de IA da Fase de Curadoria do SGCCCO (3 agentes autônomos → Captura + Busca de Referência)

## Data

- [_local-adr-policy-201](data/201-modelo-dados-fluxo-sgcco-assinatura-galpao-grafo.md) - Modelo de dados do fluxo SGCCCO: assinatura universal, nível Galpão e Agente Grafo incremental

## Integration

- [_local-adr-policy-401](integration/401-arquitetura-captura-voz-pop-verbal.md) - Arquitetura de captura por voz do SGCCCO (POP verbal): ASR/TTS de terceiro + LLM só para extração

## Platform

- [_local-adr-policy-301](platform/301-fonte-unica-distribuicao-dois-instaladores.md) - Fonte única de distribuição (npm + instalador sem npm)
