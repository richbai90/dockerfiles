#!/bin/bash
source activate base
jupyter lab --no-browser --ip "*" \
            --notebook-dir $HOME/notebooks
rstudio-server start
touch /var/log/rstudio/rstudio-server/rserver.log
tail -f /var/log/rstudio/rstudio-server/rserver.log