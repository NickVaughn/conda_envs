
ISOFIT_REPO=$HOME/repos/isofit
##Get current isofit
####################
git clone https://<USER>:<KEY>@github.com/ASU-GDCS/isofit $ISOFIT_REPO
cd ~/repos/isofit
git remote add upstream https://github.com/isofit/isofit.git
git fetch upstream
git branch --track main upstream/main
git branch --track dev upstream/dev
git checkout --track origin/gaomain
git checkout --track origin/gaodev



##Install working conda environment
###################################
mamba create --name isofit_env --file linux64/isofit_env_explicit_list.txt
conda activate isofit_env

##This conda environment was originally made with this command
## mamba create -c conda-forge -n isofit_env python\>=3.6 pip numpy\<1.22,\>=1.11 llvmlite\<0.39,\>=0.38.0 numba\>=0.38.0 scipy\>=1.3.0 matplotlib\>=2.2.2 scikit-learn\>=0.19.1 scikit-image\>=0.17.0 pep8\>=1.7.1 pyyaml\>=5.1.2 pandas\>=0.24 tensorflow\>=2.0.1 spectral\>=0.19 pytest\>=3.5.1 gdal\>=2.0.0 rasterio

##Get the rest of the things with pip
cd $ISOFIT_REPO
$(dirname $(which python))/pip install . 
##Will modify/install some other packages with pip

##Successfully installed MarkupSafe-2.1.3 absl-py-2.0.0 aiosignal-1.3.1 astunparse-1.6.3 cachetools-5.3.2 flatbuffers-23.5.26 frozenlist-1.4.0 gast-0.4.0 google-auth-2.23.4 google-auth-oauthlib-0.4.6 google-pasta-0.2.0 grpcio-1.59.2 h5py-3.10.0 isofit-2.10.0.2 jsonschema-4.19.2 jsonschema-specifications-2023.7.1 keras-2.11.0 libclang-16.0.6 markdown-3.5.1 msgpack-1.0.7 ndsplines-0.1.5 oauthlib-3.2.2 opt-einsum-3.3.0 pyasn1-0.5.0 pyasn1-modules-0.3.0 ray-2.7.1 referencing-0.30.2 requests-oauthlib-1.3.1 rpds-py-0.10.6 rsa-4.9 tensorboard-2.11.2 tensorboard-data-server-0.6.1 tensorboard-plugin-wit-1.8.1 tensorflow-2.11.1 tensorflow-estimator-2.11.0 tensorflow-io-gcs-filesystem-0.34.0 termcolor-2.3.0 werkzeug-3.0.1 wrapt-1.15.0 xxhash-3.4.1


##Make sure needed environment variables are set
##Note, if you move the repo this will make isofit not work
pushd $CONDA_PREFIX
mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d
echo '#!/bin/sh' > ./etc/conda/activate.d/env_vars.sh
#echo 'export ISOFIT_BASE=$CONDA_PREFIX/opt/isofit.git/isofit' >> ./etc/conda/activate.d/env_vars.sh
#echo 'export ISOFIT_BASE=$GAOACTIVE/support/software/isofit/isofit' >> ./etc/conda/activate.d/env_vars.sh
echo "export ISOFIT_BASE=$ISOFIT_REPO/isofit" >> ./etc/conda/activate.d/env_vars.sh
echo "export ISOFIT_DIR=$ISOFIT_REPO" >> ./etc/conda/activate.d/env_vars.sh
echo '#!/bin/sh' > ./etc/conda/deactivate.d/env_vars.sh
echo 'unset ISOFIT_BASE' >> ./etc/conda/deactivate.d/env_vars.sh
echo 'unset ISOFIT_DIR' >> ./etc/conda/deactivate.d/env_vars.sh
popd
popd

##Also need shapely
mamba install -c conda-forge shapely




