FROM centos:7
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    subscription-manager repos --enablerepo "rhel-*-optional-rpms" && \
    yum install -y yum-utils && \
    yum-config-manager --enablerepo "rhel-*-optional-rpms" && \
    export R_VERSION=4.0.5 && \
    curl -O https://cdn.rstudio.com/r/centos-7/pkgs/R-${R_VERSION}-1-1.x86_64.rpm && \
    yum install -y R-${R_VERSION}-1-1.x86_64.rpm && \
    /opt/R/${R_VERSION}/bin/R --version && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
RUN mkdir /opt/python && \
    curl -fsSL -o /opt/python/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod 755 /opt/python/miniconda.sh && \
    /opt/python/miniconda.sh -b -p /opt/python/miniconda && \
    export PYTHON_VERSION="3.7.7" && \
    /opt/python/miniconda/bin/conda create --quiet --yes \
        --prefix /opt/python/"${PYTHON_VERSION}" \
        --channel conda-forge \
      python="${PYTHON_VERSION}"  "pip<20.1" && \
    /opt/python/"${PYTHON_VERSION}"/bin/python --version && \
    /opt/python/"${PYTHON_VERSION}"/bin/pip install --upgrade \
        pip setuptools wheel && \
    echo "PATH=/opt/python/"${PYTHON_VERSION}"/bin:$PATH" > /etc/profile.d/python.sh && \
    /opt/python/${PYTHON_VERSION}/bin/pip install ipykernel && \
    /opt/python/${PYTHON_VERSION}/bin/python -m ipykernel install --name py${PYTHON_VERSION} --display-name "Python ${PYTHON_VERSION}" && \
    opt/python/"${PYTHON_VERSION}"/bin/pip install jupyterlab

RUN curl -O https://download2.rstudio.org/server/centos7/x86_64/rstudio-server-rhel-2022.02.0-443-x86_64.rpm && \
    yum install -y rstudio-server-rhel-2022.02.0-443-x86_64.rpm \
        initscripts && \
    useradd -d /home/rstudio -m rstudio && \
    echo "rstudio:Kqb1WRQ33Y" | chpasswd && \
   # /opt/python/"${PYTHON_VERSION}"/bin/jupyter server --generate-config && \
   # echo "password" | jupyter server password && \
    mkdir -p $HOME/notebooks
COPY --chown=root:root startup.sh startup.sh
RUN mkdir /home/rstudio/src && chown -R rstudio:rstudio /home/rstudio/src
ENTRYPOINT [ "./startup.sh" ]
