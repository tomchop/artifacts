#!/bin/bash
#
# Script to run pylint on Travis-CI.
#
# This file is generated by l2tdevtools update-dependencies.py, any dependency
# related changes should be made in dependencies.ini.

# Exit on error.
set -e;

pylint --version

# Ignore setup.py for now due to:
# setup.py:15:0: E0001: Cannot import 'distutils.command.bdist_msi' due to
# syntax error 'expected an indented block (<unknown>, line 347)' (syntax-error)

for FILE in $(find artifacts config tests tools -name \*.py);
do
	echo "Checking: ${FILE}";

	pylint --rcfile=.pylintrc ${FILE};
done
