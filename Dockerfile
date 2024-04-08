FROM ghcr.io/ad-sdl/wei

LABEL org.opencontainers.image.source=https://github.com/AD-SDL/kla_module
LABEL org.opencontainers.image.description="Drivers and REST API's for the KLA devices"
LABEL org.opencontainers.image.licenses=MIT

#########################################
# Module specific logic goes below here #
#########################################

RUN mkdir -p kla_module

COPY ./src kla_module/src
COPY ./README.md kla_module/README.md
COPY ./pyproject.toml kla_module/pyproject.toml
COPY ./tests kla_module/tests

# RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN --mount=type=cache,target=/root/.cache \
    pip install -e ./kla_module

CMD ["python", "kla_module/src/kla_rest_node.py"]

#########################################
