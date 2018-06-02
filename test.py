from __future__ import print_function

# import time
import sys

from mlflow import log_metric, log_parameter, log_artifacts

if __name__ == "__main__":
    print("Running {}".format(sys.argv[0]))
    log_parameter("num_dimensions", sys.argv[1])
    log_parameter("regularization", sys.argv[2])
    log_metric("foo", 5)
    log_metric("foo", 6)
    log_metric("foo", 7)
