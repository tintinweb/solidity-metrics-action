# Solidity Metrics Action

Generate a Solidity Code Metrics HTML-Report for your Project.

<img width="607" alt="image" src="https://user-images.githubusercontent.com/2865694/179468873-fe7c5055-39a8-44f2-9a11-cc7ff467098b.png">



## Usage

Include it in your GitHub Actions file after a checkout.

```yaml
- name: 📊 Crunch Numbers
  uses: tintinweb/solidity-metrics-action@master
  id: metrics
  with:
      target: '{,**/}*.sol'
```

Generates a HTML metrics report in the workspace root. The path can be accessed via `${{ steps.metrics.outputs.report }}` (by default: `__metrics.html`).

## Example Job

1. Checkout the codebase
2. Generate the Metrics report (Note: `id: <metrics>` allows us to access the generated report with `${{ steps.<metrics>.outputs.report }}`).
3. Upload `${{ steps.<metrics>.outputs.report }}` as an artifact to the job

The `target` argument takes a single glob to select input files. By default it will try to load any `*.sol` file in the root or sub-paths (i.e. `{,**/}*.sol`).

```yaml
name: Metrics

on:
  pull_request:
    branches: [ master ]

jobs:
  metrics:
    name: 📊 Code Metrics
    runs-on: ubuntu-latest
    steps:
      - name: Setup
        uses: actions/checkout@v3
      - name: 📊 Crunch Numbers
        uses: tintinweb/solidity-metrics-action@master
        id: metrics
        with:
          target: '{,**/}*.sol'
      - uses: actions/upload-artifact@v3
        with:
          name: metrics.html
          path: ${{ steps.metrics.outputs.report }}
```
