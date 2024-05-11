
# Normal:
    FROM golang:1.20-alpine AS build
    
    WORKDIR /build
    COPY go.mod go.sum ./
    RUN go mod download && go mod verify
    COPY . .

    RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o run .
    
    FROM alpine
    WORKDIR /app
    COPY --from=build /build/run .
    CMD ["/app/run"]
   
   
    # private repo:
    FROM golang:1.20-alpine AS build
    
    RUN apt update && apt upgrade -y && \
        apt install -y git make openssh-client
    
    WORKDIR /build
    COPY go.mod go.sum ./
    RUN go mod download && go mod verify
    COPY . .
    RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o run .
    
    FROM alpine
    WORKDIR /app
    COPY --from=build /build/run .
    CMD ["/app/run"]
