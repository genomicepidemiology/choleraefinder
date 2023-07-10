  GNU nano 6.2                                                                                        download-virulence-db.sh
#!/usr/bin/env bash

echo "Downloading lastest version of the choleraefinder database to current directory..."

mkdir choleraefinder_db
cd choleraefinder_db

wget https://bitbucket.org/genomicepidemiology/choleraefinder_db/get/master.tar.gz
tar -xvf master.tar.gz --strip-components 1

echo "Installing the CholeraeFinder database with KMA"
python INSTALL.py

echo "The CholeraeFinder database has been downloaded and installed."

exit 0
