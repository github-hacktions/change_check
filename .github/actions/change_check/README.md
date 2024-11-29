# Check Changes in Folders

This custom GitHub Action checks if the last commit contains changes in specified folders.

## Inputs

- `folders`: Comma-separated list of folders to check (e.g., `folder1,folder2,folder3`).

## Outputs

- `changes_detected`: `true` if changes were detected, `false` otherwise.

## Example Usage

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Check for folder changes
        id: check_changes
        uses: ./.github/actions/check-changes
        with:
          folders: "folder1,folder2,folder3"

      - name: Run tests
        if: ${{ steps.check_changes.outputs.changes_detected == 'true' }}
        run: |
          echo "Running tests..."
          ./run-tests.sh
