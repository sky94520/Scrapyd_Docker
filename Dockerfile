FROM python:3.7
ENV REFRESHED_AT 2020-02-22
ENV PATH /usr/local/bin:$PATH

#add the scrapyd configure file
ADD ./scrapyd.conf /etc/scrapyd/scrapyd.conf

#add requirements.txt
ADD requirements.txt /opt/requirements.txt
WORKDIR /opt

#install scrapyd
RUN pip3 install  -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
# install logparser
RUN pip3 install  -i https://pypi.tuna.tsinghua.edu.cn/simple logparser
# 安装supervisor
RUN pip3 install  -i https://pypi.tuna.tsinghua.edu.cn/simple supervisor
# 拷贝配置文件
#拷贝supervisor、sshd、crond配置到相关目录
COPY supervisord.conf /etc/supervisor/
COPY supervisord_scrapyd.conf /etc/supervisor/
COPY supervisord_logparser.conf /etc/supervisor/

#设置容器启动时执行的命令
# ENTRYPOINT ["/usr/bin/supervisord", "-nc", "/etc/supervisor/supervisord.conf"]
ENTRYPOINT ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]

EXPOSE 6800
EXPOSE 6801
