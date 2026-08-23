# XDRS: Decision Records

XDRS é o formato em que as decisões convergidas pela mesa ARGUS são
arquivadas — nunca ficam só na conversa. Cobre três tipos de registro:

- **ADR** (Architectural Decision Record) — decisões técnicas e estruturais
- **BDR** (Business Decision Record) — decisões de processo e estratégia de negócio
- **EDR** (Engineering Decision Record) — decisões de workflow e ferramental de engenharia

## Índice raiz

[`.xdrs/index.md`](../.xdrs/index.md) é o ponto de entrada — todo agente
deve consultá-lo antes de qualquer ação (regra sem exceções, ver
[`AGENTS.md`](../AGENTS.md)). Ele aponta para dois escopos:

### `_core` (externo, gerenciado)

Define a estrutura do próprio framework XDRS: tipos de documento,
versionamento, padrões. Vem do pacote npm `xdrs-core` — composto neste
repositório via `filedist` (ver [`architecture.md`](architecture.md)) e
**nunca editado localmente**. Se você precisa mudar algo em `_core`,
a mudança vai upstream, no `xdrs-core`, não aqui.

### `_local` (deste projeto)

Decisões criadas pelas deliberações ARGUS neste repositório específico.
Ficam só neste workspace — não são distribuídas para outros projetos que
instalem este pacote. Decisões em `_local` têm prioridade sobre `_core`
quando os dois se sobrepõem.

```
.xdrs/_local/
  index.md         ← overview do escopo local
  adrs/index.md    ← Architectural Decision Records
  bdrs/index.md    ← Business Decision Records
  edrs/index.md    ← Engineering Decision Records
```

Cada tipo tem subjects predefinidos. Por exemplo, ADRs cobrem:
`principles`, `application`, `data`, `integration`, `platform`, `controls`,
`operations`. BDRs e EDRs têm seus próprios conjuntos — ver os respectivos
`index.md` em `_local/`.

**Escopos listados por último sobrescrevem os primeiros** — `_local`
sobrescreve `_core`.

## Do zero até o arquivamento

```
Deliberação ARGUS converge (todas as seeds ativas assinam)
    ↓
[Se a decisão deve persistir como policy]
    ↓
SCRIBE identifica tipo (ADR/BDR/EDR), subject, caminho canônico
SCRIBE estrutura o frontmatter, verifica numeração disponível no namespace
    ↓
HERALD avalia impacto em implementações existentes
HERALD define valid-from (fast-track se não há impacto; prazo maior se há)
HERALD verifica conflito com policy ativa no mesmo escopo
    ↓
Rascunho entregue ao humano para validação final
    ↓
Humano valida → documento salvo em .xdrs/_local/<tipo>/
    ↓
SCRIBE executa lint (xdrs-core lint) e atualiza o índice canônico
```

SCRIBE e HERALD **não participam da deliberação de conteúdo** — só entram
depois da convergência, na fase de persistência. Se a decisão não vai ser
arquivada como policy, a Galera de Governança nem é convocada.

## Regras que SCRIBE e HERALD aplicam

Da seed `SCRIBE` (`.seeds/SCRIBE.json`):
- Sem critério de aceitação verificável → retém arquivamento, volta pra mesa
- Número de documento já existe no namespace → usa o próximo disponível, nunca reutiliza numeração de documento removido (gaps são esperados)
- Lint com erro → bloqueia arquivamento até o lint passar
- Pedido de pular etapa ou remover campo obrigatório → recusa

Da seed `HERALD` (`.seeds/HERALD.json`):
- Nova policy sem impacto em código/infra existente → fast-track, `valid-from` pode ser imediato
- Nova policy com impacto em código/infra existente e `valid-from` imediato solicitado → tensiona, exige análise de impacto e prazo de adaptação
- Policy nova conflita com policy ativa no mesmo escopo → bloqueia até resolver o conflito, nunca deixa duas policies conflitantes ativas
- Remoção de policy com referências em outros documentos → bloqueia até as referências serem atualizadas

## Verificação local

```bash
make lint        # lint de todos os documentos XDRS locais (exclui _core)
make lint-all     # lint incluindo escopos externos
```

## Ver também

- [`argus-protocol.md`](argus-protocol.md) — como a deliberação chega até aqui
- [`architecture.md`](architecture.md) — como `_core` chega neste repositório via `xdrs-core`
