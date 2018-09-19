FROM bde2020/spark-submit:2.1.0-hadoop2.7

WORKDIR /opt

RUN echo "alias python=python3" >> ~/.bashrc
RUN echo "alias pip=python3" >> ~/.bashrc
RUN echo 'alias ipython=ipython3' >> ~/.bashrc
RUN bash ~/.bashrc
RUN ln -sf /bin/bash /bin/sh

# remove all old python versions
RUN apt-get purge -y python.*

# install
RUN apt-get update && apt-get install -y \
  git \
  python3 \
  python3-pip \
  python3-all-dev \
  python3-setuptools \
  build-essential \
  python3-wheel \
  python3-scipy \
  python3-numpy-dev \
  python3-numpy \
  locales

# locales
RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN ln -s /usr/bin/python3 /usr/local/bin/python

RUN pip3 install --upgrade  pip
RUN pip install sympy numpy scipy

RUN apt-get update && apt-get install gcc -y && \
    apt-get install make  -y && \
    apt-get install zlib1g-dev -y && \
    apt-get -y install python-smbus libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev

# Install NodeJS
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs

# Install PIP
RUN pip install --upgrade pip

# Install Jupyter
RUN pip install jupyter ipywidgets jupyterlab-widgets ipyvolume ipywidgets

# Install JupyterLab
RUN pip install notebook jupyterhub jupyterlab jupyterthemes
RUN jupyter lab clean
RUN jupyter lab build



# spark
RUN pip install --upgrade wheel
RUN apt-get install pandoc -y

# Install other packages
RUN pip install --upgrade oauthenticator hdfs findspark pyspark
RUN pip install jupyter-spark

# Add Spark progress bar extension
RUN jupyter nbextension enable --py jupyter_spark
RUN jupyter serverextension enable --py jupyter_spark
RUN jupyter nbextension install --py jupyter_spark
RUN jupyter nbextension enable --py jupyter_spark
RUN jupyter nbextension enable --py widgetsnbextension

## Jupyterlab Extensions
RUN jupyter labextension install @jupyterlab/hub-extension
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install @mflevine/jupyterlab_html
RUN jupyter labextension install @jupyterlab/latex
RUN jupyter serverextension enable --sys-prefix jupyterlab_latex
RUN jupyter labextension install @jupyterlab/plotly-extension
RUN jupyter labextension install jupyterlab_bokeh
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install bqplot
RUN jupyter labextension install @jupyterlab/geojson-extension
RUN jupyter labextension install jupyterlab_bokeh
RUN jupyter labextension install qgrid
RUN jupyter labextension install @jpmorganchase/perspective-jupyterlab

# Notebook extensions
RUN pip install nbpresent
RUN jupyter nbextension install nbpresent --py --overwrite
RUN jupyter-nbextension enable nbpresent --py --sys-prefix
RUN jupyter-serverextension enable nbpresent --py --sys-prefix
RUN jupyter nbextension enable --sys-prefix comment-uncomment/main
RUN jupyter nbextension enable --sys-prefix hide_input/main
RUN jupyter nbextension enable --sys-prefix splitcell/splitcell
RUN jupyter nbextension enable --sys-prefix tree-filter/index
RUN jupyter nbextension enable --sys-prefix rubberband/main
RUN jupyter nbextension enable --sys-prefix toc2/main
RUN jupyter nbextension enable --sys-prefix export_embedded/main
RUN jupyter nbextension enable --sys-prefix hide_header/main

# locales
RUN locale-gen en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install other packages
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Expose Jupyter port & cmd
EXPOSE 8888
RUN mkdir -p /opt/app/data
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root
