# Installation

### Requirements
All the codes are tested in the following environment:
* Linux (tested on Ubuntu 14.04/16.04/18.04/20.04/21.04/24.04)
* Python 3.6+
* PyTorch 1.1 or higher (tested on PyTorch 1.1, 1,3, 1,5~1.10, 2.8)
* CUDA 9.0 or higher (PyTorch 1.3+ needs CUDA 9.2+)
* [`spconv v1.0 (commit 8da6f96)`](https://github.com/traveller59/spconv/tree/8da6f967fb9a054d8870c3515b1b44eca2103634) or [`spconv v1.2`](https://github.com/traveller59/spconv) or [`spconv v2.x`](https://github.com/traveller59/spconv)


### Install `pcdet v0.5`
NOTE: Please re-install `pcdet v0.5` by running `pip install -e .` even if you have already installed previous version.

a. Clone this repository.
```shell
git clone https://github.com/open-mmlab/OpenPCDet.git
```

b. Install the dependent libraries as follows:

* Install the dependent python libraries: 
```shell
pip install -r requirements.txt --upgrade
```
* Install the SparseConv library, we use the implementation from [`[spconv]`](https://github.com/traveller59/spconv). 
    * If you use PyTorch 1.1, then make sure you install the `spconv v1.0` with ([commit 8da6f96](https://github.com/traveller59/spconv/tree/8da6f967fb9a054d8870c3515b1b44eca2103634)) instead of the latest one.
    * If you use PyTorch 1.3+, then you need to install the `spconv v1.2`. As mentioned by the author of [`spconv`](https://github.com/traveller59/spconv), you need to use their docker if you use PyTorch 1.4+. 
    * You could also install latest `spconv v2.x` with pip, see the official documents of [spconv](https://github.com/traveller59/spconv).
  
c. Install this `pcdet` library and its dependent libraries by running the following command:
```shell
pip install -e .
```
* To build the wheel only, run the following command:
```shell
pip wheel . -w whl --no-deps --extra-index-url https://download.pytorch.org/whl/${CUDA_VERSION}
```
You can find the latest `CUDA_VERSION` from [PyTorch](https://pytorch.org/get-started/locally/). In case you want to build the wheel with `build` package:
```shell
pip install build
python -m build --wheel
```
The usage of `pip wheel` is preferred, as the `build` package does not support `--extra-index-url` option. So if you have installed PyTorch with the extra index above, `pip wheel` can use cached packages to speed up the building process, but `build` will download PyTorch from PyPI, which is much slower and may cause version mismatch, unless you build the package in the current environment:
```shell
# For pip wheel
pip wheel . -w whl --no-deps --no-build-isolation
# For build
python -m build --wheel --no-isolation
```
* To install the built wheel, run the following command:
```shell
# For pip wheel
pip install whl/*.whl
# For build
pip install dist/*.whl
```
