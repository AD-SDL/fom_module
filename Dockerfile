FROM ghcr.io/ad-sdl/wei

LABEL org.opencontainers.image.source=https://github.com/AD-SDL/fom_module
LABEL org.opencontainers.image.description="Drivers and REST API's for the FOM devices"
LABEL org.opencontainers.image.licenses=MIT

#########################################
# Module specific logic goes below here #
#########################################

RUN mkdir -p fom_module

COPY ./src fom_module/src
COPY ./README.md fom_module/README.md
COPY ./pyproject.toml fom_module/pyproject.toml
COPY ./tests fom_module/tests

# RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN --mount=type=cache,target=/root/.cache \
    pip install -e ./fom_module

CMD ["python", "fom_module/src/fom_rest_node.py"]

#########################################
