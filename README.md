大陆白名单路由规则

ip段信息取自 [china-ip-list](https://ispip.clang.cn/all_cn.txt)

由Github Action自动构建于此。

策略路由分流的实现方法：

**CN.rsc** 是往Firewall - address lists 里生ip段列表。
```
/file remove [find name="chn_list.rsc"]
/tool fetch url="https://ghproxy.com/https://raw.githubusercontent.com/kingyan/chnroute/main/chn_list.rsc"
:if ([:len [/file find name=chn_list.rsc]] > 0) do={
/import chn_list.rsc
:log info ([/file get chn_list.rsc contents])
}
```

用于Firewall - mangle页，通过dst-addrss= 引用
