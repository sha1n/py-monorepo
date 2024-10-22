import os
import subprocess

# TODO: export this to a shared module and include as a dev-dependency
def run_all_tests():
    modules_dir = "modules"
    modules = [f"{modules_dir}/{d}/tests" for d in os.listdir(modules_dir) if os.path.isdir(os.path.join(modules_dir, d))]
    subprocess.run(["pytest"] + modules, check=True)