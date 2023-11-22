# Conflict Marker Search

Using this in a workflow will allow you to search a provided list of files for the presence of conflict markers. Currently, the pattern used for markers is `'^<<<<<<<|^>>>>>>>'`. 

## How to use it?
A simple example of running this action on all pushes to the repository would be
to add a `main.yml` file under `.github/workflows` with the following content
```yaml
on: [push]

jobs:
  scan_for_conflict_markers:
    runs-on: ubuntu-latest
    name: Find conflict markers
    steps:
      - uses: actions/checkout@v2
      - name: Merge conflict finder
        uses: joeyfigaro/action-conflict-finder@v4.0
```

### Includes
You can provide include patterns to the search through the following inputs:

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
          includes: "Cargo.toml,main.rs"
```
