# Python References
Some helpful tricks for working with the python language.

## Installing TensorFlow on Mac M1 Apple Silicon Chip
https://stackoverflow.com/questions/48720833/could-not-find-a-version-that-satisfies-the-requirement-tensorflow  

https://developer.apple.com/metal/tensorflow-plugin/  

https://anaconda.org/apple/tensorflow-deps  

https://stackoverflow.com/questions/70221643/got-stuck-trying-to-install-tensorflow-on-mac-m1  

## arm64 : Apple Silicon
```bash
chmod +x ~/Downloads/Miniforge3-MacOSX-arm64.sh
sh ~/Downloads/Miniforge3-MacOSX-arm64.sh
source ~/miniforge3/bin/activate
```

## Installing Jupyter for Data Science

https://tilcode.blog/2021/06/14/how-to-install-numpy-and-pandas-for-data-science-in-a-m1-macbook/  

https://stackoverflow.com/questions/65084318/trouble-installing-pandas-on-new-macbook-air-m1/66048187#66048187  

```shell
arch -arm64 brew install jupyter

pip3 install Cython
pip3 install --no-binary :all: --no-use-pep517 numpy
pip3 install pandas
pip3 install ib_insync

python3 -m pip install virtualenv
virtualenv -p python3.8 venv
source venv/bin/activate
pip install --upgrade pip
pip install numpy cython
git clone https://github.com/pandas-dev/pandas.git
cd pandas
python3 setup.py install
```
