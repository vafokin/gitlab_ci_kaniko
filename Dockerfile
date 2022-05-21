FROM debian:9 as build

RUN apt update
RUN apt install -y wget tar gcc make libpcre3-dev zlib1g-dev
RUN wget 'https://openresty.org/download/nginx-1.19.3.tar.gz'
RUN tar -xzvf nginx-1.19.3.tar.gz
RUN wget 'https://github.com/openresty/luajit2/archive/refs/tags/v2.1-20210510.tar.gz'
RUN tar -xzvf v2.1-20210510.tar.gz
RUN wget 'https://github.com/vision5/ngx_devel_kit/archive/refs/tags/v0.3.1.tar.gz'
RUN tar -xzvf v0.3.1.tar.gz
RUN wget 'https://github.com/openresty/lua-nginx-module/archive/refs/tags/v0.10.21.tar.gz'
RUN tar -xzvf v0.10.21.tar.gz
RUN wget 'https://github.com/openresty/lua-resty-core/archive/refs/tags/v0.1.23.tar.gz'
RUN tar -xzvf v0.1.23.tar.gz
RUN wget 'https://github.com/openresty/lua-resty-lrucache/archive/refs/tags/v0.11.tar.gz'
RUN tar -xzvf v0.11.tar.gz
WORKDIR /luajit2-2.1-20210510/
RUN make install PREFIX=/opt/luajit2-2.1
WORKDIR /nginx-1.19.3/
ENV LUAJIT_LIB=/opt/luajit2-2.1/lib
ENV LUAJIT_INC=/opt/luajit2-2.1/include/luajit-2.1
RUN chmod +x configure
RUN ls -l /
RUN ./configure --prefix=/opt/nginx --with-ld-opt="-Wl,-rpath,/opt/luajit2-2.1/lib" --add-module=/ngx_devel_kit-0.3.1 --add-module=/lua-nginx-module-0.10.21
RUN make install
WORKDIR /lua-resty-core-0.1.23
RUN make install PREFIX=/opt/nginx
WORKDIR /lua-resty-lrucache-0.11
RUN make install PREFIX=/opt/nginx
#CMD ["/opt/nginx/sbin/nginx","-g","daemon off;"]

FROM debian:9
WORKDIR /opt
COPY --from=build /opt .
#ENV LUAJIT_LIB=/opt/luajit2-2.1/lib
#ENV LUAJIT_INC=/opt/luajit2-2.1/include/luajit-2.1
CMD ["/opt/nginx/sbin/nginx","-g","daemon off;"]
