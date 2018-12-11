FROM bde2020/spark-worker:2.3.2-hadoop3.1.1-java8

RUN echo "alias python=python3" >> ~/.bashrc
RUN echo "alias pip=python3" >> ~/.bashrc
RUN echo 'alias ipython=ipython3' >> ~/.bashrc
RUN bash ~/.bashrc
RUN ln -sf /bin/bash /bin/sh

# remove all old python versions
RUN apt-get purge -y python.*

# install
# remove all old python versions
RUN apt-get purge -y python.*

RUN apt-get update && apt-get install -y apt-utils 

# install
RUN apt-get update && apt-get install -y  python3-dev python3-pip python3-numpy python3-scipy
RUN pip3 install --upgrade  pip
RUN pip3 install -U virtualenv  # system-wide install
RUN pip install sympy numpy scipy

RUN ln -s /usr/bin/python3 /usr/local/bin/python

# Install PIP
RUN pip install --upgrade pip

# locales
#RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8


RUN ln -s /usr/bin/python3 /usr/local/bin/python

RUN python --version

RUN pip3 install --upgrade  pip

RUN apt-get install pandoc -y

# Install other packages
RUN pip install --upgrade wheel
RUN pip install --upgrade oauthenticator hdfs

RUN pip install --upgrade findspark pyspark



# locales
#RUN locale-gen en_US.UTF-8
#RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#    dpkg-reconfigure --frontend=noninteractive locales && \
#    update-locale LANG=en_US.UTF-8

#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US.UTF-8
#ENV LC_ALL en_US.UTF-8

SHELL ["/bin/bash", "-c"]
