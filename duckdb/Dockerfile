# A duckdb playground based on Ubuntu.
# Build using: docker build -t duckdb-pg .
# Run using: docker run -it -v ($pwd):/app duckdb-pg /bin/zsh
 
FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update 
RUN apt install -y --no-install-recommends \
    ca-certificates curl gnupg apt-transport-https \
    vim git curl \ 
    && rm -rf /var/lib/apt/lists/*

# Default powerline10k theme, no plugins installed
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)"

ENV PATH=/venv/bin:$PATH
ENV PATH=/root/.cargo/bin:$PATH
ENV PATH="/root/.local/bin/:$PATH"

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# set up a virtual env to use for whatever app is destined for this container.
# RUN uv venv --python 3.13.0 --seed /venv
RUN uv venv --python 3.13.0 /venv

RUN echo "\nsource /venv/bin/activate\n" >> /root/.zshrc
RUN uv --version


# Install some handy utilities if you want them for debugging within the container
RUN --mount=type=cache,target=/root/.cache uv pip install httpie glances pls duckdb pandas 'polars[pyarrow]' 


# Install some of the common packages that (many) don't change often so later images build faster.

RUN echo "We're good:"
RUN /venv/bin/python --version

WORKDIR /app
CMD ["/bin/zsh"]