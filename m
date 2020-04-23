Content-Type: multipart/mixed; boundary="===============5508158611306066910=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [arm-perf:rwonce/cleanup 6/11] net/ipv6/esp6_offload.c:189 xfrm6_beet_gso_segment() warn: potential spectre issue 'inet6_offloads' [r] (local cap)
Date: Thu, 23 Apr 2020 18:03:18 +0800
Message-ID: <202004231801.SwL8BwpS%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5508158611306066910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git rwon=
ce/cleanup
head:   10415533a9062c9e5e27c421d9c232f0cae108fd
commit: a5460b5e5fb82656807840d40d3deaecad094044 [6/11] READ_ONCE: Simplify=
 implementations of {READ,WRITE}_ONCE()
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv6/esp6_offload.c:189 xfrm6_beet_gso_segment() warn: potential spectr=
e issue 'inet6_offloads' [r] (local cap)
net/ipv4/esp4_offload.c:158 xfrm4_beet_gso_segment() warn: potential spectr=
e issue 'inet_offloads' [r] (local cap)

# https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=
=3Da5460b5e5fb82656807840d40d3deaecad094044
git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/wil=
l/linux.git
git remote update arm-perf
git checkout a5460b5e5fb82656807840d40d3deaecad094044
vim +/inet6_offloads +189 net/ipv6/esp6_offload.c

7613b92b1ae371 Florian Westphal 2019-03-29  161  =

7f9e40eb18a999 Xin Long         2020-03-26  162  static struct sk_buff *xfr=
m6_beet_gso_segment(struct xfrm_state *x,
7f9e40eb18a999 Xin Long         2020-03-26  163  					      struct sk_buff =
*skb,
7f9e40eb18a999 Xin Long         2020-03-26  164  					      netdev_features=
_t features)
7f9e40eb18a999 Xin Long         2020-03-26  165  {
7f9e40eb18a999 Xin Long         2020-03-26  166  	struct xfrm_offload *xo =
=3D xfrm_offload(skb);
7f9e40eb18a999 Xin Long         2020-03-26  167  	struct sk_buff *segs =3D =
ERR_PTR(-EINVAL);
7f9e40eb18a999 Xin Long         2020-03-26  168  	const struct net_offload =
*ops;
7f9e40eb18a999 Xin Long         2020-03-26  169  	int proto =3D xo->proto;
7f9e40eb18a999 Xin Long         2020-03-26  170  =

7f9e40eb18a999 Xin Long         2020-03-26  171  	skb->transport_header +=
=3D x->props.header_len;
7f9e40eb18a999 Xin Long         2020-03-26  172  =

7f9e40eb18a999 Xin Long         2020-03-26  173  	if (proto =3D=3D IPPROTO_=
BEETPH) {
7f9e40eb18a999 Xin Long         2020-03-26  174  		struct ip_beet_phdr *ph =
=3D (struct ip_beet_phdr *)skb->data;
7f9e40eb18a999 Xin Long         2020-03-26  175  =

7f9e40eb18a999 Xin Long         2020-03-26  176  		skb->transport_header +=
=3D ph->hdrlen * 8;
7f9e40eb18a999 Xin Long         2020-03-26  177  		proto =3D ph->nexthdr;
7f9e40eb18a999 Xin Long         2020-03-26  178  	}
7f9e40eb18a999 Xin Long         2020-03-26  179  =

7f9e40eb18a999 Xin Long         2020-03-26  180  	if (x->sel.family !=3D AF=
_INET6) {
7f9e40eb18a999 Xin Long         2020-03-26  181  		skb->transport_header -=
=3D
7f9e40eb18a999 Xin Long         2020-03-26  182  			(sizeof(struct ipv6hdr)=
 - sizeof(struct iphdr));
7f9e40eb18a999 Xin Long         2020-03-26  183  =

7f9e40eb18a999 Xin Long         2020-03-26  184  		if (proto =3D=3D IPPROTO=
_TCP)
7f9e40eb18a999 Xin Long         2020-03-26  185  			skb_shinfo(skb)->gso_ty=
pe |=3D SKB_GSO_TCPV6;
7f9e40eb18a999 Xin Long         2020-03-26  186  	}
7f9e40eb18a999 Xin Long         2020-03-26  187  =

7f9e40eb18a999 Xin Long         2020-03-26  188  	__skb_pull(skb, skb_trans=
port_offset(skb));
7f9e40eb18a999 Xin Long         2020-03-26 @189  	ops =3D rcu_dereference(i=
net6_offloads[proto]);
7f9e40eb18a999 Xin Long         2020-03-26  190  	if (likely(ops && ops->ca=
llbacks.gso_segment))
7f9e40eb18a999 Xin Long         2020-03-26  191  		segs =3D ops->callbacks.=
gso_segment(skb, features);
7f9e40eb18a999 Xin Long         2020-03-26  192  =

7f9e40eb18a999 Xin Long         2020-03-26  193  	return segs;
7f9e40eb18a999 Xin Long         2020-03-26  194  }
7f9e40eb18a999 Xin Long         2020-03-26  195  =


:::::: The code at line 189 was first introduced by commit
:::::: 7f9e40eb18a99979f194aa1bdc9bf1c358d3111a esp6: add gso_segment for e=
sp6 beet mode

:::::: TO: Xin Long <lucien.xin@gmail.com>
:::::: CC: Steffen Klassert <steffen.klassert@secunet.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5508158611306066910==--

