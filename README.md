Docker Datascience
==================

A customized container with Conda to run Python, Pandas, Numpy...

Inspired on https://towardsdatascience.com/docker-for-data-science-9c0ce73e8263

* How to run

```
docker run --name python-data-science -p 8888:8888 -v "$PWD/notebooks:/opt/notebooks" -d python-data-science
```

* How to access

Just point your browser to http://localhost:8888

Jupyter password is **root**


**WARNING**: After build, this image will have aprox. 7.5GB size
