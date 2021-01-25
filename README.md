# ⚠️ Deprecated

Use https://github.com/orgs/danger/packages/container/package/danger-swift-with-swiftlint instead


Dockerfile that installs both Danger-swift and Swiftlint
To use it just add to your actions yaml

```yaml
    runs-on: ubuntu-latest
    name: "Run Danger"
    steps:
      - uses: actions/checkout@v1
      - name: Danger
        uses: f-meloni/danger-swift-swiftlint-action@1.3.1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```

## Dockerhub
There is a prebuilt image of Danger with Swiftlint on DockerHub https://hub.docker.com/repository/docker/frmeloni/danger-swift-with-swiftlint

To use it on your action:

```yaml
    runs-on: ubuntu-latest
    name: "Run Danger"
    steps:
      - uses: actions/checkout@v1
      - name: Danger
        uses: docker://frmeloni/danger-swift-with-swiftlint:1.3.1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
