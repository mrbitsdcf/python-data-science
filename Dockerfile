FROM ubuntu
LABEL "Maintainer"="MrBiTs"
LABEL "e-mail"="mrbits@mrbits.com.br"
LABEL "version"="0.0.1"

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y wget bzip2

RUN wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
RUN bash Anaconda3-5.3.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.3.1-Linux-x86_64.sh
ENV PATH /root/anaconda3/bin:$PATH

RUN conda update conda
RUN conda update anaconda
RUN conda update --all

RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
