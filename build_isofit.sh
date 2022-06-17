conda create -c conda-forge -n isofit python\>=3.6 pip numpy\<=1.19,\>=1.11 llvmlite\<0.39,\>=0.38.0 numba\>=0.38.0 scipy\>=1.3.0 matplotlib\>=2.2.2 scikit-learn\>=0.19.1 scikit-image\>=0.17.0 pep8\>=1.7.1 pyyaml\>=5.1.2 pandas\>=0.24 tensorflow\>=2.0.1 spectral\>=0.19 pytest\>=3.5.1 gdal\>=2.0.0

conda activate isofit

##Get the rest of the things with pip
$(dirname $(which python))/pip install isofit 


##The above overwrites numpy 1.19 with numpy 1.22, this message is shown:
# Installing collected packages: msgpack, distlib, xxhash, pyrsistent, platformdirs, numpy, importlib-resources, filelock, virtualenv, jsonschema, ray, isofit
#   Attempting uninstall: numpy
#     Found existing installation: numpy 1.19.0
#     Uninstalling numpy-1.19.0:
#       Successfully uninstalled numpy-1.19.0
# ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
# numba 0.55.1 requires numpy<1.22,>=1.18, but you have numpy 1.22.4 which is incompatible.

##Since numpy requirement was only >= 1.20 as reported in the script, let's try just replacing with a lower version
$(dirname $(which python))/pip install --force-reinstall numpy==1.21






