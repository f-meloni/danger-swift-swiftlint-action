  
FROM danger/swift

MAINTAINER Franco Meloni

LABEL "com.github.actions.name"="Danger Swift"
LABEL "com.github.actions.description"="Runs Swift Dangerfiles"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="blue"

ARG SWIFT_LINT_VER=0.30.1

# install SwiftLint
RUN git clone -b $SWIFT_LINT_VER --single-branch --depth 1 https://github.com/realm/SwiftLint.git _SwiftLint
RUN cd _SwiftLint && git submodule update --init --recursive; make install

# Run Danger Swift via Danger JS, allowing for custom args
ENTRYPOINT ["npx", "--package", "danger", "danger-swift", "ci"]
