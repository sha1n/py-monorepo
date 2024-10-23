# py-monorepo

Experimental Poetry based monorepo for multi-project / multi-module Python projects. Modules within the same project
are built into the same package and are source dependencies of each other. Different projects can depend on each other
using using versioned published packages.

**Features:**
- **Poetry** based monorepo setup
- Every project is built into a single PyPI package
- Projects within the Poetry workspace can depend on each other as source dependencies
- Modules within each project can depend on each other as source dependencies
- **Makefile** based top level build commands for all modules
  - `make install` - Install all modules
  - `make test` - Runs tests on all projects (isolated)
  - `make lint` - Runs lint on the entire workspace (TODO: not isolated at the moment)
  - `make format` - Formats all sources in the workspace
  - `make clean` - Removes virtual environments, build artifacts and cached files
  - `make build` - Builds packages for all the projects
- Central CI/CD tooling (testing, linting, formatting) for all modules
  - Workspace level pytest config
  - Workspace level lint config
- **GitHub Actions** based CI/CD setup

