FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel
MAINTAINER Alexander Pushin "work@apushin.com"

RUN mkdir /workdir
COPY allyouneed /workdir/allyouneed
COPY data /workdir/data

RUN apt-get update && apt-get install -y \
    wget \
    unzip
    
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip &&  pip3 install -r requirements.txt

WORKDIR /workdir

EXPOSE 8123

ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--port=8123", "--ip=0.0.0.0", "--no-browser","--NotebookApp.token='learning'", "--NotebookApp.iopub_data_rate_limit=10000000", "--NotebookApp.iopub_msg_rate_limit=10000000"]

