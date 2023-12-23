conda create -n git_isofit python=3.10 pip
# conda create -c conda-forge -n isofit python\>=3.6 pip numpy\<=1.19,\>=1.11 llvmlite\<0.39,\>=0.38.0 numba\>=0.38.0 scipy\>=1.3.0 matplotlib\>=2.2.2 scikit-learn\>=0.19.1 scikit-image\>=0.17.0 pep8\>=1.7.1 pyyaml\>=5.1.2 pandas\>=0.24 tensorflow\>=2.0.1 spectral\>=0.19 pytest\>=3.5.1 gdal\>=2.0.0

conda activate git_isofit
##pip failed to build wheel for gdal package
conda install -c conda-forge gdal\>=3.2

##Get the repo
git clone https://github.com/isofit/isofit.git $CONDA_PREFIX/opt/isofit.git
pushd $CONDA_PREFIX/opt/isofit.git
git branch --track current-release origin/current-release
# git checkout master
git pull --all
git checkout current-release
popd


##Install
$CONDA_PREFIX/bin/pip install --editable $CONDA_PREFIX/opt/isofit.git --use-feature=2020-resolver


##Make sure environment variables are set
pushd $CONDA_PREFIX
mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d
echo '#!/bin/sh' > ./etc/conda/activate.d/env_vars.sh
echo 'export ISOFIT_BASE=$CONDA_PREFIX/opt/isofit.git/isofit' >> ./etc/conda/activate.d/env_vars.sh
echo '#!/bin/sh' > ./etc/conda/deactivate.d/env_vars.sh
echo 'unset ISOFIT_BASE' >> ./etc/conda/deactivate.d/env_vars.sh
popd
