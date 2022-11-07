#!/bin/bash

# This won't work.  The env is designed to change the current shell, this code executes on a new shell, then quits.
source env/bin/activate