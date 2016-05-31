FROM gitlab/gitlab-ce:8.8.2-ce.0
MAINTAINER Tao Wang <twang2218@gmail.com>

RUN echo "" \
    && echo "# git clone https://gitlab.com/larryli/gitlab.git" \
    && git clone https://gitlab.com/larryli/gitlab.git \
    && echo "# Generating translation patch" \
    && cd gitlab \
    && git diff origin/8-8-stable..origin/8-8-zh > ../8.8.diff \
    && echo "# Patching" \
    && patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../8.8.diff \
    && echo "# Cleaning" \
    && cd .. \
    && rm -rf gitlab \
    && rm *.diff