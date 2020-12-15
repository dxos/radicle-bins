# Building an Image

```
$ ./build.sh
    Finished release [optimized] target(s) in 0.14s
    Finished release [optimized] target(s) in 0.13s
...
src/main.js → public/build/bundle.js...
created public/build/bundle.js in 2.4s
Done in 2.69s.
Sending build context to Docker daemon  43.66MB
...
Successfully built 5648c29be284
```

# Running the Image

```
docker run -d --restart=always -p 8889:8889 -p 12345:12345/udp -e "PUBLIC_ADDR=`hostname -f`:12345" 5648c29be284
```
