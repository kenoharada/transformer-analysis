## Contents
Reference: [A Primer on the Inner Workings of Transformer-based Language Models](https://arxiv.org/abs/2405.00208)  

- Analyze attribute
    - attention map
    - attention rollout
    - [Measuring the Mixing of Contextual Information in the Transformer](https://arxiv.org/abs/2203.04212)
    - [Analyzing Feed-Forward Blocks in Transformers through the Lens of Attention Maps](https://arxiv.org/abs/2302.00456)
    - Logit lens

- Analyze circuit
    - Induction head
    - Activation patching
    - Information flow routes

- Intervention
    - Language neuron
    - Inferrence time intervention
    - Knockout
    - SAE, feature steering
    - task vector/function vector

## Setup
### Docker
```
docker build \
  --build-arg user_name=$(id -un) \
  --build-arg group_name=$(id -gn) \
  --build-arg uid=$(id -u) \
  --build-arg gid=$(id -g) \
  --no-cache \
  -t research .


docker run --env-file .env --mount type=bind,src=$PWD,dst=$PWD --workdir $PWD -it --ipc host --gpus all --rm --name `whoami`_research research /bin/bash

# コンテナにアタッチ
docker exec -it $(whoami)_research /bin/bash
```