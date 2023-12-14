#!/bin/bash

# Run Locust
locust -f tests/load_test.py --host=http://127.0.0.1:8000 --headless --loglevel ERROR --csv=./load_test_report/load_test --html ./load_test_report/load_test_report.html
