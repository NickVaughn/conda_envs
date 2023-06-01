mamba create -n lidarproc -c conda-forge fastkml "gdal>=3.0" geos lastools libkml numpy pdal "proj>=2.0" pyproj scipy shapely spectral zlib pandas geopandas ipython
conda activate lidarproc

##Install lazrs
$CONDA_PREFIX/bin/pip install --prefix $CONDA_PREFIX lazrs

##Install lastools laszip and libs
module load cmake/3.19.6
module load gcc/11.1.0
git clone https://github.com/LAStools/LAStools lastools_build
pushd lastools_build  
mkdir -p build
pushd build
cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX
make install
popd
popd

##Install laspy with both bindings
$CONDA_PREFIX/bin/pip install --prefix $CONDA_PREFIX laspy[lazrs,laszip]


