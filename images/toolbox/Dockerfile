FROM gcr.io/projectsigstore/cosign:v1.13.1 AS cosign

FROM gcr.io/go-containerregistry/crane:v0.12.0 AS crane

FROM registry.fedoraproject.org/fedora-minimal:39

RUN microdnf install -y skopeo jq \
    && microdnf clean all

COPY --from=cosign /ko-app/cosign /usr/bin/cosign
COPY --from=crane /ko-app/crane /usr/bin/crane