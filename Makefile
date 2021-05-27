# @Author: juan
# @Date:   2019-01-29T12:06:08+09:00
# @Last modified by:   juan
# @Last modified time: 2019-01-29T12:06:37+09:00

.PHONY: clean install

## GLOBALS ##

ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
ACT=$(shell which activate)
PY=$(shell which python)
endif

## COMMANDS ##

## Default
default:
	@echo "Options:"
	@echo "    make clean      # Delete all compiled Python files."
	@echo "    make install    # Install libraries and create the conda environment 'xxx'."
	@echo ""
	@echo ${PY}

## delete all compiled Python files
clean:
	find . -name "*.pyc" -exec rm {} \;
	find . -name "__pycache__" -exec rmdir {} \;

## set up python interpreter environment
install:
ifeq (True,$(HAS_CONDA))
	@echo ">>> Detected conda, creating conda environment."
	conda env create -f environment.yml
else
	@echo ">>> Conda is not available."
endif
