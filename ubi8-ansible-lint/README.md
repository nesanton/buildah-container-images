## Create image

```bash
$ buildah unshare ./ubi8-ansible-lint.bash
```

Alternatively use my image from quay.io/anestero/ubi8-ansible-lint

## Example use

In GitLab CI:

```yaml
linting:
  image: quay.io/anestero/ubi8-ansible-lint:latest
  script:
    - ansible-lint -x106 -p ./
```
