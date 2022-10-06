FROM linuxserver/blender

RUN apt-get update
RUN apt-get -y install git python3-distutils

# set up our color profiles
RUN rm -rf /usr/share/blender/datafiles/colormanagement/
ADD https://github.com/sobotka/filmic-blender/archive/refs/heads/master.tar.gz /usr/share/blender/datafiles/colormanagement

RUN\
    curl https://bootstrap.pypa.io/get-pip.py > /tmp/get-pip.py \
    && python3 /tmp/get-pip.py\
    && rm /tmp/get-pip.py

COPY blender/requirements.txt ./
RUN pip install -r requirements.txt

COPY blender/* ./

ADD tables /blender/tables
ADD receipts /blender/receipts
ADD hdris /blender/hdris
ADD fonts /blender/fonts

RUN chmod +x launch_blender.sh

ENTRYPOINT ["/bin/bash", "launch_blender.sh"]
