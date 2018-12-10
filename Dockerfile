FROM coqorg/coq:dev

ENV MATHCOMP_VERSION="dev"
ENV MATHCOMP_PACKAGE="coq-mathcomp-character"

RUN ["/bin/bash", "--login", "-c", "set -x \
  && eval $(opam env --switch=${COMPILER_EDGE} --set-switch) \
  && opam update -y -u \
  && opam pin add -n -k version ${MATHCOMP_PACKAGE} ${MATHCOMP_VERSION} \
  && opam install -y -j ${NJOBS} ${MATHCOMP_PACKAGE} \
  && opam clean -a -c -s --logs \
  && opam config list && opam list"]

RUN ["/bin/bash", "--login", "-c", "set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam update -y -u \
  && opam pin add -n -k version ${MATHCOMP_PACKAGE} ${MATHCOMP_VERSION} \
  && opam install -y -j ${NJOBS} ${MATHCOMP_PACKAGE} \
  && opam clean -a -c -s --logs \
  && opam config list && opam list"]