#! /usr/bin/env bash
source /opt/anaconda/bin/activate
jupyter notebook --port 8889 --notebook-dir='/notebooks' --ip='*' --no-browser --allow-root --NotebookApp.token='' &
#jupyter lab &
/usr/bin/docker-quickstart
