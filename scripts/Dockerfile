FROM devkitpro/devkitarm

ARG CMAKE_VERSION="3.15.7"

WORKDIR /home

RUN mkdir cmake
RUN wget "https://cmake.org/files/v$(echo ${CMAKE_VERSION} | cut -d'.' -f1).$(echo ${CMAKE_VERSION} | cut -d'.' -f2)/cmake-${CMAKE_VERSION}-Linux-x86_64.sh" -O cmake.sh && \
    chmod +x cmake.sh && \
    ./cmake.sh --skip-license --prefix=/home/cmake && \
    rm cmake.sh

RUN export PATH=/home/cmake/bin:$PATH
ENV PATH=/home/cmake/bin:$PATH
