# Conflict Marker Search

Sometimes we accidentally resolve merge conflicts without actually resolving it,
this action uses pattern searching to find files with merge conflict markers and reports them.

## How to use it?
This is a GitHub action, so it has to be added to a GitHub workflow.  
A simple example of running this action on all pushes to the repository would be
to add a `main.yml` file under `.github/workflows` with the following content
```yaml
on: [push]

jobs:
  merge_conflict_job:
    runs-on: ubuntu-latest
    name: Find merge conflicts
    steps:
      - uses: actions/checkout@v2
      - name: Merge conflict finder
        uses: joeyfigaro/action-conflict-finder@v4.0
```

### Includes
You can provide include patterns to the search through the following inputs:

#### `include_dir`
A comma-separated list of directories to use for searching. The .git folder is always ignored.

#### `includes`
A comma-separated list of files to search. Supports wildcard matching. 

```yaml
on: [push]

jobs:
  merge_conflict_job:
    runs-on: ubuntu-latest
    name: Find merge conflicts
    steps:
      - uses: actions/checkout@v2
      - name: Merge conflict finder
        uses: joeyfigaro/action-conflict-finder@v4.0
        with:
          include_dir: "path/to/directory/to/search,path/to/another/directory"
          includes: "Cargo.toml,main.rs"
```
