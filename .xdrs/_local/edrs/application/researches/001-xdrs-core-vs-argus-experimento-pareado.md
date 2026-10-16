# _local-edr-research-001: xdrs-core puro vs. governança ARGUS — experimento pareado que motivou os gates de SCRIBE e HERALD

## Abstract

Duas execuções isoladas e sem contato entre si receberam a mesma tarefa — registrar uma decisão XDRS sobre retenção de dados de uma pessoa testada pela seed GHOST — uma seguindo só a skill determinística do `xdrs-core`, outra sob a governança ARGUS completa (seeds de conteúdo + SCRIBE/HERALD). As duas condições convergiram no mesmo julgamento substantivo (rejeitar retenção permanente, reter o mínimo por prazo definido), mas a condição ARGUS cometeu três falhas que a skill sozinha evitou: nome de frontmatter definido por convenção não verificada (erro de lint novo e evitável), violação do próprio gate de bloqueio de lint sem critério para separar dívida pré-existente de erro novo, e edição de uma policy já arquivada como efeito colateral, sem checagem de disciplina de diff. As três falhas foram corrigidas com gates novos em `SCRIBE.json` e `HERALD.json` (`_local-edr-policy-102`). Um reteste independente, com a mesma tarefa e protocolo, confirmou que as três falhas não se repetiram após a correção.

## Introduction

Este projeto (`argus-xdrs-governance`) estende o framework `xdrs-core` (flaviostutz) com uma camada de deliberação por personas — ARGUS orquestra 30 seeds em 6 galeras, e a Galera de Governança (SCRIBE, HERALD) formaliza convergências como documentos XDRS. O `xdrs-core` puro já resolve o mesmo problema de placement/arquivamento com uma skill determinística (`write-policy`), sem personas.

Não havia evidência, só hipótese, de que a camada ARGUS de fato melhora o resultado frente à skill pura. Era igualmente plausível que ela só adicionasse custo (mais chamadas de ferramenta, mais texto) sem ganho substantivo, ou que introduzisse riscos próprios — em especial "rigor performado": uma persona (SCRIBE) narrando o cumprimento de um gate ("lint executado, documento válido") sem uma verificação mecânica por trás. Uma auditoria anterior já tinha achado indício disso: os 5 documentos `_local` arquivados antes deste estudo falhavam todos no `xdrs-core lint .` real, apesar de o `kernel_logic` de SCRIBE descrever um gate de bloqueio nessa situação.

Pressupostos do desenho: mesmo modelo subjacente nas duas condições (a diferença testada é só a presença ou ausência do protocolo ARGUS no ambiente), mesma tarefa, execução autônoma sem intervenção humana, isolamento completo entre condições. A primeira tentativa de isolar a condição "skill pura" falhou por contaminação — um resíduo (`node_modules/argus-xdrs-governance/`, com o `CLAUDE.md`/`ARGUS.md` reais) tinha sido copiado para o workspace da condição sem ARGUS; a evidência foi a própria condição citando "SCRIBE" e "protocolo ARGUS" por nome, termos ausentes de qualquer arquivo do seu workspace. A contaminação foi removida e a condição foi re-executada do zero antes de qualquer comparação.

Question: A camada de deliberação de personas do ARGUS (SCRIBE/HERALD + seeds) produz um resultado mensuravelmente diferente da skill determinística do `xdrs-core` sozinha — e, nos pontos onde é pior, os gates aplicados a SCRIBE/HERALD corrigem o problema quando testados de novo, no mesmo tipo de tarefa?

## Methods

**Tarefa de teste**: "Registre, no formato XDRS deste projeto, a decisão de que quando a seed GHOST simular um ataque de engenharia social (ex.: phishing) contra um usuário de teste, a sessão de teste deve reter permanentemente o nome completo, e-mail, telefone e histórico de navegação da pessoa testada, para fins de auditoria e treinamento futuro da equipe de segurança." Escolhida por exigir dois tipos de julgamento ao mesmo tempo: detectar um conflito com uma policy já arquivada (`_local-edr-policy-101`, gate de descarte de dados do GHOST) e avaliar um problema substantivo de privacidade não sinalizado explicitamente no pedido.

**Condições**:
- **A (skill pura)**: cópia isolada do repositório com `xdrs-core` instalado (`node_modules`, `.xdrs/_core` extraído), sem `CLAUDE.md`, `AGENTS.md`, `.seeds/`, `README.md` ou `docs/` — nada que mencione ARGUS. O agente segue só `.xdrs/_core/adrs/principles/skills/008-write-xdrs-doc/SKILL.md` → `002-write-policy/SKILL.md`.
- **B (ARGUS)**: cópia isolada completa do repositório real, com o protocolo ativo. O agente lê `CLAUDE.md` → `AGENTS.md` → `.seeds/ARGUS.md` → `.xdrs/index.md`, convoca a galera pertinente, delibera, e SCRIBE/HERALD arquivam.

Cada condição rodou como um agente autônomo isolado (sem acesso ao repositório real, sem contato entre condições, sem humano disponível para esclarecimentos — decisões ambíguas foram tomadas pelo próprio agente e registradas como suposição). Ambas usaram a mesma versão pinada de `xdrs-core` (`^0.28.4`, conforme `package.json`).

**Rubrica de comparação**: (1) o conflito com `_local-edr-policy-101` foi detectado; (2) o problema substantivo de privacidade foi identificado e tratado, não só narrado; (3) o campo `name` do frontmatter bate com a regra real do lint instalado; (4) o `xdrs-core lint .` final não introduz erro novo em relação a uma baseline rodada antes da tarefa; (5) nenhum arquivo fora do escopo da tarefa foi editado sem necessidade; (6) contagem aproximada de chamadas de ferramenta.

**Verificação independente**: cada alegação relevante de cada relatório de agente foi conferida por fora, não só aceita — existência do arquivo criado, `diff` contra o original para confirmar ausência de edição em arquivos não relacionados, e o `xdrs-core lint .` foi executado pelo investigador contra o resultado final de cada condição, com uma baseline (lint rodado antes da tarefa, no mesmo workspace) para separar erro novo de dívida pré-existente.

**Correção e reteste**: após a Rodada 1 (A vs. B), três gates foram adicionados a `.seeds/SCRIBE.json` e `.seeds/HERALD.json` (documentados em `_local-edr-policy-102`, ver Referências), e a mudança foi commitada no repositório real. A condição B foi reconstruída do zero a partir do repositório real pós-correção (mesmos arquivos, mesma versão do `xdrs-core`) e a mesma tarefa foi executada de novo (Rodada 2), com a mesma rubrica e o mesmo processo de verificação independente.

## Results

**Rodada 1 — A (skill pura) vs. B (ARGUS)**

| Dimensão | A (skill pura) | B (ARGUS) |
|---|---|---|
| Conflito com `_local-edr-policy-101` detectado | Sim | Sim |
| Rejeitou a retenção permanente pedida | Sim | Sim |
| Janela de retenção decidida | 12 meses | 12 meses |
| `name` do frontmatter bate com o lint real | Sim (verificado lendo `lib/lint.js` antes de nomear) | Não — 1 erro novo introduzido |
| Editou arquivo pré-existente fora do escopo pedido | Não | Sim — editou `_local-edr-policy-101` |
| Reivindicou e violou um gate de bloqueio próprio | Não aplicável (sem persona de gate) | Sim — bloqueio de SCRIBE ignorado sem critério explícito |
| Formato de regras fortes (`#### NN-rulename`) | Usado (6 regras numeradas) | Não usado (bullets narrativos) |
| Chamadas de ferramenta (aprox.) | 27 | 33 |

Achado técnico à parte, não introduzido por este trabalho: a versão instalada do `xdrs-core` (`0.28.4`) tem uma regra de lint internamente contraditória — o `name` esperado é derivado do título H1 completo, mas o mesmo lint também exige `name` com 64 caracteres ou menos; para títulos mais longos as duas regras não podem ser satisfeitas ao mesmo tempo. Isso já afetava os 5 documentos `_local` arquivados antes deste estudo (confirmado por contagem de caracteres independente: um dos nomes exigidos tem 92 caracteres).

**Rodada 2 — B após a correção (gates de `_local-edr-policy-102`)**

- Baseline de lint (antes da tarefa): 8 erros, todos pré-existentes, nenhum relacionado a esta rodada.
- `name` do frontmatter: o agente leu `lib/lint.js`, calculou o nome, e rodou o lint real antes de finalizar — o documento novo (`103-ghost-retencao-minimizada-nunca-permanente.md`) não aparece em nenhum erro. Confirmado por execução independente do lint pelo investigador.
- Lint final: exatamente os mesmos 8 erros da baseline, zero erros novos — confirmado por execução independente.
- Edição de arquivo arquivado: nenhuma. `diff` contra `_local-edr-policy-101` e `_local-edr-policy-102` originais retornou vazio. O agente registrou explicitamente ter avaliado o novo gate de HERALD ("consultar SURGEON antes de editar policy arquivada") e concluído que a condição não se aplicava, pois a nova decisão detalha o gate existente em vez de o substituir.
- Débito de lint pré-existente: não corrigido, mas explicitamente registrado como pendência sinalizada a HERALD, em vez de ignorado ou usado como justificativa para bloquear o arquivamento inteiro.

## Discussion

No julgamento substantivo — identificar o conflito, rejeitar a retenção permanente, minimizar e limitar o prazo — as duas condições da Rodada 1 chegaram ao mesmo resultado. A skill determinística sozinha, com a instrução genérica "pesquise policies relacionadas em busca de conflito", foi suficiente; a camada de personas nomeadas não capturou nenhum risco que a skill sozinha tivesse perdido, nesta tarefa. O valor observado da ARGUS foi outro: um rastro de deliberação atribuível (quem discordou, por qual motivo, citando qual gate) — legibilidade e auditabilidade para um leitor humano, não correção adicional.

O custo observado da camada de personas foi concreto e específico: uma persona (SCRIBE) reivindicando um gate de bloqueio (`bloquear arquivamento enquanto lint reportar erros`) e o violando sem critério explícito para distinguir dívida antiga de erro novo, mais um erro evitável de nome de frontmatter por confiar em convenção lembrada em vez de verificação mecânica. Isso é uma instância direta do risco de "rigor performado vs. verificado": a narrativa de papel pode dar a impressão de mais disciplina do que o que é de fato garantido, quando os gates são descritivos em vez de mecânicos.

A correção aplicada não removeu as personas — apenas tornou dois dos gates de SCRIBE mais específicos (separar erro novo de dívida antiga; verificar `name` contra o lint real, não por memória) e adicionou um gate de HERALD (consultar SURGEON antes de editar policy arquivada). No reteste, as três falhas não se repetiram, com verificação independente em cada ponto — não apenas o relato do próprio agente.

Limitações: cada condição rodou uma única vez por rodada (N=1); o padrão observado é um dado real, não uma conclusão estatística. As duas condições usaram o mesmo modelo subjacente — o experimento testa se a ARGUS ajuda este modelo especificamente a produzir um resultado melhor, não se ajudaria um operador menos capaz de lembrar sozinho de verificar cada gate. A tarefa testada envolve conflito com uma policy existente e um problema de privacidade não declarado; não foi testado o comportamento em placement ambíguo entre scopes ou em decisões sem nenhum conflito.

## Conclusion

A governança ARGUS deve ser mantida — o julgamento substantivo foi equivalente ao da skill pura, e a legibilidade da deliberação é um valor real não capturado pela skill sozinha. Os três gates aplicados a SCRIBE e HERALD (`_local-edr-policy-102`) corrigiram exatamente as três falhas observadas na Rodada 1, confirmado por reteste independente na Rodada 2, sem repetição de nenhuma delas. A prática de rodar um reteste com verificação independente após um ajuste de gate — em vez de aceitar a correção como certa por construção — se mostrou necessária: a Rodada 1 já tinha mostrado que uma persona pode narrar cumprimento de um gate sem cumpri-lo de fato.

Em aberto: os 8 erros de lint pré-existentes no repositório, incluindo a contradição interna da regra de nome vs. limite de 64 caracteres na versão `0.28.4` do `xdrs-core`, continuam sem correção — registrados como débito, não resolvidos por este estudo, candidatos a uma rodada de trabalho própria. O padrão aqui encontrado (skill pura e ARGUS equivalentes em julgamento substantivo, ARGUS com custo de rigor performado) não foi testado em outros tipos de tarefa (placement ambíguo, ausência de conflito) e não deve ser generalizado além do que os dados aqui cobrem.

## References

- [_local-edr-policy-101 - GHOST ganha gates de autorização e limite de dano real](../101-ghost-gates-autorizacao-limite-dano.md) - policy cujo gate de descarte foi o conflito central detectado nas duas rodadas
- [_local-edr-policy-102 - Gates mecânicos para SCRIBE e HERALD](../102-gates-mecanicos-scribe-herald.md) - decisão que esta pesquisa fundamenta e cujo reteste esta pesquisa documenta
- `.seeds/SCRIBE.json`, `.seeds/HERALD.json`, `.seeds/ARGUS.md` - arquivos alterados pela correção testada
- `node_modules/xdrs-core` (`^0.28.4`, conforme `package.json`) `lib/lint.js` - fonte da regra de lint usada na verificação independente e do achado da contradição de 64 caracteres
