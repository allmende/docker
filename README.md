Dockerfile for Kanboard
=======================

Dockerfile for latest stable release of Kanboard.

To build your own image:

```bash
make image
```

To fetch the images and run it:

```bash
docker pull kanboard/kanboard
docker run -d --name kanboard -p 80:80 -t kanboard/kanboard:stable
```
