# SQL Server 
FROM rocker/rstudio

RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    tdsodbc \
    libsqliteodbc \
    gnupg \
    unixodbc \
    unixodbc-dev \
    ## clean up
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/ \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list \
 && apt-get update \
 && ACCEPT_EULA=Y apt-get install --yes --no-install-recommends msodbcsql17 msodbcsql18 mssql-tools18 \
 && install2.r odbc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/*

RUN Rscript -e 'install.packages(c("DBI","odbc"))'

# MYsql
FROM rocker/rstudio

RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    tdsodbc \
    libsqliteodbc \
    gnupg \
    unixodbc \
    unixodbc-dev \
    ## clean up
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/ \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN wget https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-8.0.19-linux-debian9-x86-64bit.tar.gz \
 && tar xvf mysql-connector-odbc-8.0.19-linux-debian9-x86-64bit.tar.gz \
 && cp mysql-connector-odbc-8.0.19-linux-debian9-x86-64bit/bin/* /usr/local/bin \
 && cp mysql-connector-odbc-8.0.19-linux-debian9-x86-64bit/lib/* /usr/local/lib \
 && sudo apt-get update \
 && apt-get install --yes libodbc1 odbcinst1debian2 \
 && chmod 777 /usr/local/lib/libmy*

RUN myodbc-installer -a -d -n "MySQL ODBC 8.0 Driver" -t "Driver=/usr/local/lib/libmyodbc8w.so" \
 && myodbc-installer -a -d -n "MySQL ODBC 8.0" -t "Driver=/usr/local/lib/libmyodbc8a.so"

RUN Rscript -e 'install.packages(c("DBI","odbc"))'
