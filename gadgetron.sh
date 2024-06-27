#!/usr/bin/env bash
set -ev

conda update -n base -c conda-forge conda
conda init
conda env create -f gadgetron.yml
source /opt/conda/bin/activate gadgetron

