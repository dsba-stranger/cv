FROM debian:10.3

RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y texlive-base \
                       texlive-latex-recommended \
                       texlive-fonts-recommended \
                       texlive-generic-recommended \
                       texlive-generic-extra \
                       texlive-fonts-extra \
                       texlive-pictures \
                       cm-super

COPY cv/ /

RUN pdflatex -interaction=nonstopmode cv.tex
RUN rm cv.log

CMD [ "bash" ]