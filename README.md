# CholeraeFinder
===================

This project documents the CholeraeFinder service


Documentation
=============

The CholeraeFinder service contains one python script choleraefinder.py which is the script of the latest
version of the CholeraeFinder service. CholeraeFinder identifies important genes in total or partial sequenced
isolates of Vibrio Choleraes, and attempts to describe the specimen.


## Content of the repository
1. choleraefinder.py      - the program
2. README.md
3. Dockerfile   - dockerfile for building the choleraefinder docker container


## Installation

Instructions below are for installation in either Docker or Anaconda.

**Warning:** Due to bugs in BioPython 1.74, do not use that version if not using Python 3.7 or above.

Check out the sources:

```bash
# Go to wanted location for choleraefinder
cd /path/above/choleraefinder

# Clone and enter the choleraefinder directory
git clone https://bitbucket.org/genomicepidemiology/choleraefinder.git
cd choleraefinder
```

#### Install in Docker container

```bash
# Build container
docker build -t choleraefinder .
```

#### Install in Conda environment

```bash
# Create a Conda environment with python and biopython
# You may need to first add channels:
conda config --add channels bioconda conda-forge
conda create -n choleraefinder python==3.8 biopython
conda activate choleraefinder

# Add the remaining deps with pip
pip install cgetools==1.5.5 argparse tabulate
conda deactivate
```

### Install the Database

This requires KMA for indexing the database.  For installation instruction,
see <https://bitbucket.org/genomicepidemiology/kma.git>.

```bash
# Go to the directory where you want to store the cholearefinder database
cd /path/above/database
# Clone database from git repository
git clone https://bitbucket.org/genomicepidemiology/choleraefinder_db.git

cd choleraefinder_db
CHOLERAE_DB=$(pwd -P)

# Index the CholeraeFinder database with kma_index program
python3 INSTALL.py kma_index
```

## Usage

The program can be invoked with the -h option to get help and more information of the service.
Run Docker container:

#### Run Docker container

```bash
# Run choleraefinder container
docker run --rm -it \
       -v $CHOLERAE_DB:/database \
       -v $(pwd -P):/workdir \
       choleraefinder -i [INPUTFILE] -o [OUTDIR] [-p] [-mp] [-l] [-t] [-tmp] [-x]
```

When running the docker file you must mount 2 directories: 

 1. The directory containing the CholeraeFinder _database_ (`$CHOLERAE_DB` above)
 2. An output/input folder from where the input file(s) can be reached and output can saved. 
 
Above we mount the current working directory (using `$pwd -P`).  The input file(s)
must be reachable from this directory. The path to the infile and outfile directories
should be relative to the monuted current working directory.

#### Run Conda environment

```bash
conda activate choleraefinder
/path/to/choleraefinder/choleraefinder.py --help
```


`-i INPUTFILE	input file (fasta or fastq) relative to pwd, up to 2 files`

`-o OUTDIR	output directory relative to pwd`

`-p DATABASE_PATH    set path to database, default is /database`

`-mp METHOD_PATH    set path to method (blast or kma)`

`-l MIN_COV    set threshold for minimum coverage`

`-t THRESHOLD set threshold for mininum blast identity`

`-tmp    temporary directory for storage of the results from the external software`

`-x    extended output: Give extented output with allignment files, template and query hits in fasta and a tab seperated file with gene profile results`

`-q    don't show results `

## Web-server

A webserver implementing the methods is available at the [CGE website](http://www.genomicepidemiology.org/) and can be found here:
https://cge.cbs.dtu.dk/services/CholeraeFinder/

Citation
=======

When using the method please cite:

Characterization and Genetic Variation of Vibrio cholerae Isolated from Clinical and Environmental Sources in Thailand.
Siriphap A, Leekitcharoenphon P, Kaas RS, Theethakaew C, Aarestrup FM, Sutheinkul O, Hendriksen RS.
PLoS One. 2017 Jan 19;12(1):e0169324. doi: 10.1371/journal.pone.0169324. eCollection 2017.
[Epub ahead of print]

References
=======

1. Camacho C, Coulouris G, Avagyan V, Ma N, Papadopoulos J, Bealer K, Madden TL. BLAST+: architecture and applications. BMC Bioinformatics 2009; 10:421. 
2. Clausen PTLC, Aarestrup FM, Lund O. Rapid and precise alignment of raw reads against redundant databases with KMA. BMC Bioinformatics 2018; 19:307. 

License
=======

Copyright (c) 2014, Ole Lund, Technical University of Denmark
All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


