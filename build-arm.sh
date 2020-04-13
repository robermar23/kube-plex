#env CGO_ENABLED=0 && \
go clean
export GOOS=linux
export GOARCH=arm
export GODEBUG=gocachehash=0
go build -o kube-plex_linux_arm32v7

# build docker and push
docker buildx build --platform linux/arm/v7,linux/arm64/v8 -t robermar2/kube-plex:latest --push .

# verify build output file
file kube-plex_linux_arm32v7
od -An -t x1 -j 4 -N 1 kube-plex_linux_arm32v7