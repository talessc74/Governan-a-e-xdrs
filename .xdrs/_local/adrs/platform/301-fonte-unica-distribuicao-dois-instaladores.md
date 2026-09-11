---
name: _local-adr-policy-301-fonte-unica-distribuicao-dois-instaladores
description: Estabelece este repositório (argus-xdrs-governance) como fonte única de verdade das seeds e do protocolo ARGUS, com dois canais de instalação independentes (npm para projetos Node, um repositório instalador leve para projetos sem Node) que buscam do mesmo conteúdo ao vivo. Use ao decidir onde uma seed deve ser editada, ou ao criar um novo canal de distribuição da governança.
apply-to: Todo projeto que consome a governança ARGUS, via npm ou via instalador sem npm
valid-from: 2026-09-11
---

# _local-adr-policy-301: Fonte única de distribuição com dois instaladores

## Context and Problem Statement

Um projeto consumidor (`radiokactus`) instalava a governança via um segundo repositório (`argus-governance`), que mantinha cópias estáticas próprias de 18 seeds — desatualizadas em relação a este repositório havia múltiplas versões: sem o fix de autorização do GHOST e sem a Galera do Design inteira. As duas cópias divergiram silenciosamente porque nada as sincronizava.

Question: Como impedir que um segundo canal de distribuição fique permanentemente desatualizado em relação à fonte?

## Decision Outcome

**`argus-governance` deixa de guardar seeds próprias; passa a buscá-las ao vivo deste repositório a cada instalação**

Este repositório (`Governan-a-e-xdrs`, publicado no npm como `argus-xdrs-governance`) é a única fonte de verdade de `.seeds/**` e do protocolo ARGUS. `argus-governance` vira um instalador fino para projetos sem Node/npm: seu slash command (`/governance-install`) e script (`setup-governance.sh`) buscam `.seeds/ARGUS.md` e todos os seed JSONs direto de `raw.githubusercontent.com/talessc74/Governan-a-e-xdrs/main/...` a cada execução, nunca de uma cópia local. Só o `CLAUDE.md` (documento de entrada, com framing sem XDRS/npm) continua mantido dentro do próprio `argus-governance`.

### Details

- Fluxo pro consumidor Node: `npm update argus-xdrs-governance && npx argus-xdrs-governance install`.
- Fluxo pro consumidor sem Node: `/governance-install` (ou `bash setup-governance.sh`) — sem necessidade de publish prévio, já que busca direto do `main` deste repositório via HTTP.
- Bug corrigido no mesmo esforço: a documentação e o `Makefile` deste repositório referenciavam um comando `extract` que não existe na ferramenta real (`filedist` só reconhece `install/check/list/remove/init/presets/update`); todo `npx argus-xdrs-governance extract` falhava com "Cannot pass a package argument when invoked from a data package bin shim". Corrigido para `install` em `README.md`, `docs/architecture.md` e no corpo do target `extract` do `Makefile` (nome do target mantido por ser só um apelido local).
- Consequência aceita: o canal sem npm nunca fica desatualizado por falta de publish (busca ao vivo), mas também nunca resolve conflitos de versão — sempre pega o `main` mais atual, sem possibilidade de fixar uma versão anterior. Aceitável dado o perfil de uso (projetos simples, sem gestão de dependência formal).
- Versão publicada no npm nesta mudança: `1.5.0` → `1.5.1` (fix do `extract`/`install` exigiu republish porque o README com a instrução errada já estava empacotado na 1.5.0).

## References

- PRs: talessc74/Governan-a-e-xdrs#8, #9; talessc74/argus-governance#4; talessc74/radiokactus#42
