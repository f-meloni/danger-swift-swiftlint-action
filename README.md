Dockerfile that installs both Danger-swift and Swiftlint
To use it just add to your actions yaml

```yaml
    runs-on: ubuntu-latest
    name: "Run Danger"
    steps:
      - uses: actions/checkout@v1
      - name: Danger
        uses: f-meloni/danger-swift-swiftlint-action@1.0.0
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```
