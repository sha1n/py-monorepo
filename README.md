# py-monorepo

Experimental Poetry based monorepo for multi-module Python projects.

**Features:**
- **Poetry** based monorepo setup
- **Makefile** based top level build commands for all modules
  - `make install` - Install all modules
  - `make test` - Run tests for all modules
  - `make lint` - Lint all modules
  - `make format` - Format all modules
  - `make clean` - Removed the virtual environment, build artifacts and cached files
  - `make build` - Builds one package from all the modules 
- **GitHub Actions** based CI/CD setup


