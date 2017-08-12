FROM golang:1.8
ADD . /go/src/github.com/awslabs/service-discovery-ecs-dns
RUN go build \
	-o /tmp/ecssd_agent \
	-ldflags "-linkmode external -extldflags -static" \
	github.com/awslabs/service-discovery-ecs-dns
FROM scratch
COPY --from=0 /tmp/ecssd_agent /
ENTRYPOINT ["/ecssd_agent"]
