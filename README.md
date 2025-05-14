# SSH

A container for operations using SSH.

By default, the container runs as an SSH server.

## Usage

```
docker run \
  -e SSH_USERNAME=user \
  -e SSH_PUBLIC_KEY=yourpublickey \
  -p 2222:22 \
  moreillon/ssh
```
