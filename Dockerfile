FROM swift:5.2

MAINTAINER Franco Meloni

LABEL "com.github.actions.name"="Danger Swift"
LABEL "com.github.actions.description"="Runs Swift Dangerfiles"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="blue"

ARG SWIFT_LINT_VER=0.39.2

# Install nodejs
RUN apt-get update -q \
    && apt-get install -qy curl \
    && mv /usr/lib/python2.7/site-packages /usr/lib/python2.7/dist-packages; ln -s dist-packages /usr/lib/python2.7/site-package \
    && curl -sL https://deb.nodesource.com/setup_10.x |  bash - \
    && apt-get install -qy nodejs \
    && rm -r /var/lib/apt/lists/*

# install SwiftLint
RUN git clone -b $SWIFT_LINT_VER --single-branch --depth 1 https://github.com/realm/SwiftLint.git _SwiftLint \
    && cd _SwiftLint \
    && git submodule update --init --recursive; make install \
    && cd .. \
    && rm -rf _SwiftLint

# Install danger-swift globally
RUN git clone https://github.com/danger/danger-swift.git _danger-swift \
    && cd _danger-swift \ 
    && make install \ 
    && cd .. \
    && rm -rf _danger-swift
    
RUN npm install -g danger

# Run Danger Swift via Danger JS, allowing for custom args
ENTRYPOINT ["danger-swift", "ci"]
