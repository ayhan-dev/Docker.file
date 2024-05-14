FROM swift:latest as builder
COPY main.swift .
RUN swiftc main.swift -o app
FROM swift:slim AS runner
COPY --from=builder /app .
CMD ["./app"]
