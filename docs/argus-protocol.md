# O protocolo ARGUS

Fonte de verdade: [`.seeds/ARGUS.md`](../.seeds/ARGUS.md). Este documento é um
guia de leitura sobre esse arquivo — em caso de divergência, o `.seeds/ARGUS.md`
do projeto instalado é quem vale.

ARGUS não é um roteador que decide sozinho. É uma presença permanente que
observa o contexto, convoca a equipe certa, e sai do caminho enquanto as
seeds deliberam. Ele só volta ao centro quando há um impasse genuíno que a
mesa não resolve sozinha.

## As cinco fases

### 1. Vigilância

Antes de convocar qualquer seed, ARGUS responde internamente a quatro
perguntas: o que está sendo pedido, o que já existe no sistema, quem tem
jurisdição sobre o assunto, e se há risco não solicitado (dívida técnica,
vulnerabilidade, problema de usabilidade) que ninguém perguntou mas existe.

### 2. Convocação

ARGUS convoca **equipes**, não seeds individuais. O contexto identificado
mapeia para uma galera:

| Contexto | Equipe convocada |
|---|---|
| Algoritmo, lógica, estrutura de dados | Galera do Código |
| Interface, componente, fluxo visual | Galera de UX + Scout |
| HTML/CSS, semântica, acessibilidade, responsividade | Galera do Design |
| Design system, tokens visuais | Galera do Design + Galera de UX |
| Feature de UI end-to-end | Galera do Design + Galera de UX + Scout |
| Autenticação, identidade, tokens, sessões | Galera de Segurança + Scout |
| Feature end-to-end | Todas as equipes |
| Arquitetura, decisão estrutural, ADR | Galera do Código + Galera de Segurança + PolarBear |
| Qualidade, cobertura, automação de testes | Galera de QA + Scout + Flux |
| Recursos computacionais, geração procedural | RiverRaid + Literate + Flux |
| Dado do usuário, privacidade, consentimento | Sovereign + Blast + Sentinel + BAU |
| Arquivamento de decisão convergida em XDRS | Galera de Governança |
| Remoção/atualização de policy existente | Galera de Governança + seeds autoras originais |

### 3. Deliberação

A mesa não tem cabeceira — cada seed convocada tem voz igual, e a ordem de
fala não é prescrita. Uma seed participa de seis formas:

- **CONCORDA** — reforça a posição de outra
- **COMPLEMENTA** — adiciona uma dimensão que faltava
- **TENSIONA** — sinaliza um conflito real
- **CEDE** — reconhece que outra seed tem jurisdição maior naquele ponto
- **ESCALA** — declara impasse e pede arbitragem de ARGUS
- **ABSTÉM** — declara que o ponto está fora da sua jurisdição

Regras da mesa: nenhuma seed silencia outra, nenhuma fala pelo domínio de
outra sem convite, nenhuma declara convergência sozinha, e nenhum output sai
enquanto houver tensão aberta.

### 4. Convergência

A deliberação converge quando toda seed ativa emitiu sua perspectiva,
respondeu às tensões direcionadas a ela, e chegou a uma posição. O output
final é assinado por domínio — por exemplo:

```
[SCOUT] A lógica de acesso é testável nativamente. Teste escrito antes da implementação.
[SENTINEL] Nenhuma confiança implícita. Token validado em cada requisição.
[SOVEREIGN] Consentimento explícito coletado. Pairwise identifier aplicado por serviço.
```

Se a decisão deve persistir como policy, a Galera de Governança entra
**depois** da convergência de conteúdo — SCRIBE e HERALD não deliberam sobre
o mérito, só estruturam e arquivam (ver [`xdrs.md`](xdrs.md)).

### 5. Impasse

ARGUS arbitra só quando duas ou mais seeds estão em tensão ativa sem
convergência possível. A resolução segue uma hierarquia fixa de 21 posições
(Seção V de `ARGUS.md`) — a seed de maior posição prevalece, mas **apenas no
ponto específico em conflito**; o resto da deliberação continua coletivo.
Correção lógica formal (Literate) e segurança estrutural (Sentinel) ficam no
topo; recursos e recorrência (RiverRaid) na base.

## Vocabulário proibido

Um conjunto fixo de termos — `hack`, `workaround`, `quick-fix`, `zero bugs`,
`confiança implícita`, entre outros — invalida qualquer output que os
contenha. A seed responsável refaz a contribuição antes de nova convergência.
Lista completa na Seção VII de `.seeds/ARGUS.md`.

## Ver também

- [`seeds-reference.md`](seeds-reference.md) — quem é cada seed
- [`xdrs.md`](xdrs.md) — o que acontece depois da convergência
