FROM jupyter/datascience-notebook

USER root

RUN apt-get update && \
    apt-get clean && rm -rf var/libapt/lists/*
    
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip3 install --quiet --no-cache-dir --requirement /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"