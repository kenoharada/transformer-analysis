FROM nvcr.io/nvidia/pytorch:24.04-py3

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y sudo 

# 必要なパッケージをインストール
RUN pip install setuptools wandb transformers deepspeed openai tiktoken PyYAML accelerate datasets einops evaluate peft protobuf scikit-learn scipy sentencepiece fire mpi4py jupyterlab
RUN pip install python-dotenv xopen rouge-score
RUN pip install ipywidgets transformer_lens circuitsvis plotly
# ビルド時の引数としてユーザー名とグループ名、ユーザーID、グループIDを受け取る
ARG user_name
ARG group_name
ARG uid
ARG gid

# グループとユーザーを作成
RUN groupadd -g ${gid} ${group_name} && \
    useradd -m -u ${uid} -g ${gid} -s /bin/bash ${user_name}

# ユーザーにsudo権限を付与
RUN mkdir -p /etc/sudoers.d && \
    echo "${user_name} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user_name} && \
    chmod 0440 /etc/sudoers.d/${user_name}

# ユーザーに切り替える
USER ${user_name}