@echo off
set output_file=src/code_compare_diff.txt
git fetch origin main
git diff origin/main..HEAD | findstr "^+" > %output_file%
python src/app.py src/code_compare_diff.txt > review_output.txt
