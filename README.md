# py-monorepo

Experimental Poetry based monorepo for multi-project / multi-module Python projects. Modules within the same project
are built into the same package and are source dependencies of each other. Different projects can depend on each other
using using versioned published packages.

**Features:**
- **Poetry** based monorepo setup
- Every project is built into a single PyPI package
- Modules within the same project can depend on each other as source dependencies
- **Makefile** based top level build commands for all modules
  - `make install` - Install all modules
  - `make test` - Run tests for all modules
  - `make lint` - Lint all modules
  - `make format` - Format all modules
  - `make clean` - Removed the virtual environment, build artifacts and cached files
  - `make build` - Builds one package from all the modules
- Central CI/CD tooling (testing, linting, formatting) for all modules
- **GitHub Actions** based CI/CD setup

