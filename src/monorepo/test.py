# import subprocess
#
#
#
# def run_all_tests():
#     subprocess.run(["pytest", "module-a/tests", "module-b/tests"], check=True)

import os
import subprocess

def run_all_tests():
    modules_dir = "modules"
    modules = [f"{modules_dir}/{d}/tests" for d in os.listdir(modules_dir) if os.path.isdir(os.path.join(modules_dir, d))]
    subprocess.run(["pytest"] + modules, check=True)