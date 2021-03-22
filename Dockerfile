FROM continuumio/miniconda3

LABEL maintainer="Sahil Vij <sahil.vij2310@gmail.com>"
LABEL description="Predicting the likelihood of e-signing a \
                  loan based on financial history."

WORKDIR /data

COPY . /data

RUN conda install jupyter -y && \
    conda install python==3.7.6 -y && \
    conda install pandas==1.0.1 -y && \
    conda install seaborn==0.10.0 -y && \
    conda clean -y --all

EXPOSE 8080

VOLUME /data

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root"]
