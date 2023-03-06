FROM debian:latest AS dependencies
ENV HOME=home/src
COPY src/ ${HOME}
RUN apt-get update \
    && apt-get -y install nasm \
    && apt-get -y install g++ \
    && apt-get -y install gcc-multilib g++-multilib \
    && apt-get -y install gdb

FROM dependencies
RUN cd ${HOME}/assembly \
    && nasm -f elf32 -g -o hello.o hello.asm \
    && ld -m elf_i386 -o hello.out hello.o
RUN ./${HOME}/assembly/hello.out