#Scraptd Docker相关文件
>该文件主要创建一个Scrapyd镜像并运行，scrapyd的默认IP为0.0.0.0，supervisor的IP为0.0.0.0
>scrapyd内有supervisor，它负责管理scrapyd和logparser进程；
>nginx负责反向代理，它会拦截请求，并在输入账户密码之后，才会进入到scrapyd的相关界面。

