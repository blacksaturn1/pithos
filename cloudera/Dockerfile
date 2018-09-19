FROM cloudera/quickstart:latest

ENV SPARK_HOME=/workspace/spark
ENV ANACONDA_HOME=/opt/anaconda
ARG ANACONDA_VERSION=4.2.12
ARG PYTHON_VERSION=3.5.2

# working dir

#RUN mkdir /home/cloudera




# Install linux development tools
RUN echo 'Install Development Tools'
RUN yum clean all
RUN rpm --rebuilddb; yum install -y yum-plugin-ovl
RUN yum groupinstall -y 'Development Tools'

# Install and update miniconda and other packages
RUN yum clean all \
  && rm -rf /var/lib/apt/lists/* \
  && curl https://repo.continuum.io/miniconda/Miniconda3-${ANACONDA_VERSION}-Linux-x86_64.sh > /tmp/anaconda.sh \
  && chmod a+rx /tmp/anaconda.sh \
  && /tmp/anaconda.sh -f -b -p ${ANACONDA_HOME} \
  && rm -f /tmp/anaconda.sh


ENV PATH ${ANACONDA_HOME}/bin:$PATH

RUN conda update conda -y

RUN conda install -q python=${PYTHON_VERSION}
RUN pip install --upgrade pip
# install jupyter lab

RUN pip3 install --upgrade  pip
RUN pip install sympy numpy scipy

RUN  ln -s /etc/hive/conf/hive-site.xml /etc/spark/conf

# install Jupyter
RUN pip install --upgrade notebook jupyterhub jupyterlab oauthenticator hdfs && \
    pip install findspark pyspark

# nbpresent
RUN pip install nbpresent
RUN jupyter nbextension install nbpresent --py --overwrite
RUN jupyter-nbextension enable nbpresent --py --sys-prefix
RUN jupyter-serverextension enable nbpresent --py --sys-prefix

#Add Spark progress bar extension
RUN pip install jupyter-spark
RUN jupyter serverextension enable --py jupyter_spark
RUN jupyter nbextension install --py jupyter_spark
RUN jupyter nbextension enable --py jupyter_spark
RUN jupyter nbextension enable --py widgetsnbextension
RUN mkdir /notebooks

# remove auth
RUN mkdir -p ~/.jupyter/

RUN echo "c.NotebookApp.token = u''" > ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.notebook_dir = '/workspace/notebook'" >> ~/.jupyter/jupyter_notebook_config.py

COPY requirements.txt ./
COPY start.sh /root/

RUN chmod 777 /root/start.sh

# install packages
RUN pip install -r requirements.txt

# variables
ENV SPARK_HOME /usr/lib/spark
ENV PYSPARK_PYTHON python3.5
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.9-src.zip

