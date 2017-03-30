docker stop ctp
docker rm ctp

COPY ..\signed\CTP.jar CTP.jar
COPY ..\signed\CTPClient.jar CTPClient.jar
COPY ..\signed\dcm4che-imageio-rle-2.0.25.jar dcm4che-imageio-rle-2.0.25.jar
COPY ..\signed\dcm4che.jar dcm4che.jar
COPY ..\signed\jdbm.jar jdbm.jar
COPY ..\signed\log4j.jar log4j.jar
COPY ..\signed\pixelmed_codec.jar pixelmed_codec.jar
COPY ..\signed\util.jar util.jar

docker build -t jvsoest/ctpclient:latest ./

docker run -d -p 8080:8080 --name ctp jvsoest/ctpclient:latest