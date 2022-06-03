Content-Type: multipart/mixed; boundary="===============0114079803454011158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/amt.c:2752 amt_rcv() error: we previously assumed 'amt' could be null (see line 2680)
Date: Fri, 03 Jun 2022 11:02:40 +0800
Message-ID: <202206031058.IDwO5ped-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0114079803454011158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Taehee Yoo <ap420073@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d1dc87763f406d4e67caf16dbe438a5647692395
commit: b9022b53adad88fd6cf2b9718c9e498504f3e1dd amt: add control plane of =
amt interface
date:   7 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 7 months ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220603/202206031058.IDwO5ped-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/amt.c:2752 amt_rcv() error: we previously assumed 'amt' could b=
e null (see line 2680)

vim +/amt +2752 drivers/net/amt.c

b9022b53adad88 Taehee Yoo 2021-10-31    1  // SPDX-License-Identifier: GPL-=
2.0-or-later
b9022b53adad88 Taehee Yoo 2021-10-31    2  /* Copyright (c) 2021 Taehee Yoo=
 <ap420073@gmail.com> */
b9022b53adad88 Taehee Yoo 2021-10-31    3  =

b9022b53adad88 Taehee Yoo 2021-10-31    4  #define pr_fmt(fmt) KBUILD_MODNA=
ME ": " fmt
b9022b53adad88 Taehee Yoo 2021-10-31    5  =

b9022b53adad88 Taehee Yoo 2021-10-31    6  #include <linux/module.h>
b9022b53adad88 Taehee Yoo 2021-10-31    7  #include <linux/skbuff.h>
b9022b53adad88 Taehee Yoo 2021-10-31    8  #include <linux/udp.h>
b9022b53adad88 Taehee Yoo 2021-10-31    9  #include <linux/jhash.h>
b9022b53adad88 Taehee Yoo 2021-10-31   10  #include <linux/if_tunnel.h>
b9022b53adad88 Taehee Yoo 2021-10-31   11  #include <linux/net.h>
b9022b53adad88 Taehee Yoo 2021-10-31   12  #include <linux/igmp.h>
b9022b53adad88 Taehee Yoo 2021-10-31   13  #include <linux/workqueue.h>
b9022b53adad88 Taehee Yoo 2021-10-31   14  #include <net/net_namespace.h>
b9022b53adad88 Taehee Yoo 2021-10-31   15  #include <net/protocol.h>
b9022b53adad88 Taehee Yoo 2021-10-31   16  #include <net/ip.h>
b9022b53adad88 Taehee Yoo 2021-10-31   17  #include <net/udp.h>
b9022b53adad88 Taehee Yoo 2021-10-31   18  #include <net/udp_tunnel.h>
b9022b53adad88 Taehee Yoo 2021-10-31   19  #include <net/icmp.h>
b9022b53adad88 Taehee Yoo 2021-10-31   20  #include <net/mld.h>
b9022b53adad88 Taehee Yoo 2021-10-31   21  #include <net/amt.h>
b9022b53adad88 Taehee Yoo 2021-10-31   22  #include <uapi/linux/amt.h>
b9022b53adad88 Taehee Yoo 2021-10-31   23  #include <linux/security.h>
b9022b53adad88 Taehee Yoo 2021-10-31   24  #include <net/gro_cells.h>
b9022b53adad88 Taehee Yoo 2021-10-31   25  #include <net/ipv6.h>
b9022b53adad88 Taehee Yoo 2021-10-31   26  #include <net/protocol.h>
b9022b53adad88 Taehee Yoo 2021-10-31   27  #include <net/if_inet6.h>
b9022b53adad88 Taehee Yoo 2021-10-31   28  #include <net/ndisc.h>
b9022b53adad88 Taehee Yoo 2021-10-31   29  #include <net/addrconf.h>
b9022b53adad88 Taehee Yoo 2021-10-31   30  #include <net/ip6_route.h>
b9022b53adad88 Taehee Yoo 2021-10-31   31  #include <net/inet_common.h>
b9022b53adad88 Taehee Yoo 2021-10-31   32  =

b9022b53adad88 Taehee Yoo 2021-10-31   33  static struct workqueue_struct *=
amt_wq;
b9022b53adad88 Taehee Yoo 2021-10-31   34  =

b9022b53adad88 Taehee Yoo 2021-10-31   35  static struct socket *amt_create=
_sock(struct net *net, __be16 port)
b9022b53adad88 Taehee Yoo 2021-10-31   36  {
b9022b53adad88 Taehee Yoo 2021-10-31   37  	struct udp_port_cfg udp_conf;
b9022b53adad88 Taehee Yoo 2021-10-31   38  	struct socket *sock;
b9022b53adad88 Taehee Yoo 2021-10-31   39  	int err;
b9022b53adad88 Taehee Yoo 2021-10-31   40  =

b9022b53adad88 Taehee Yoo 2021-10-31   41  	memset(&udp_conf, 0, sizeof(udp=
_conf));
b9022b53adad88 Taehee Yoo 2021-10-31   42  	udp_conf.family =3D AF_INET;
b9022b53adad88 Taehee Yoo 2021-10-31   43  	udp_conf.local_ip.s_addr =3D ht=
onl(INADDR_ANY);
b9022b53adad88 Taehee Yoo 2021-10-31   44  =

b9022b53adad88 Taehee Yoo 2021-10-31   45  	udp_conf.local_udp_port =3D por=
t;
b9022b53adad88 Taehee Yoo 2021-10-31   46  =

b9022b53adad88 Taehee Yoo 2021-10-31   47  	err =3D udp_sock_create(net, &u=
dp_conf, &sock);
b9022b53adad88 Taehee Yoo 2021-10-31   48  	if (err < 0)
b9022b53adad88 Taehee Yoo 2021-10-31   49  		return ERR_PTR(err);
b9022b53adad88 Taehee Yoo 2021-10-31   50  =

b9022b53adad88 Taehee Yoo 2021-10-31   51  	return sock;
b9022b53adad88 Taehee Yoo 2021-10-31   52  }
b9022b53adad88 Taehee Yoo 2021-10-31   53  =

b9022b53adad88 Taehee Yoo 2021-10-31   54  static int amt_socket_create(str=
uct amt_dev *amt)
b9022b53adad88 Taehee Yoo 2021-10-31   55  {
b9022b53adad88 Taehee Yoo 2021-10-31   56  	struct udp_tunnel_sock_cfg tunn=
el_cfg;
b9022b53adad88 Taehee Yoo 2021-10-31   57  	struct socket *sock;
b9022b53adad88 Taehee Yoo 2021-10-31   58  =

b9022b53adad88 Taehee Yoo 2021-10-31   59  	sock =3D amt_create_sock(amt->n=
et, amt->relay_port);
b9022b53adad88 Taehee Yoo 2021-10-31   60  	if (IS_ERR(sock))
b9022b53adad88 Taehee Yoo 2021-10-31   61  		return PTR_ERR(sock);
b9022b53adad88 Taehee Yoo 2021-10-31   62  =

b9022b53adad88 Taehee Yoo 2021-10-31   63  	/* Mark socket as an encapsulat=
ion socket */
b9022b53adad88 Taehee Yoo 2021-10-31   64  	memset(&tunnel_cfg, 0, sizeof(t=
unnel_cfg));
b9022b53adad88 Taehee Yoo 2021-10-31   65  	tunnel_cfg.sk_user_data =3D amt;
b9022b53adad88 Taehee Yoo 2021-10-31   66  	tunnel_cfg.encap_type =3D 1;
b9022b53adad88 Taehee Yoo 2021-10-31   67  	tunnel_cfg.encap_destroy =3D NU=
LL;
b9022b53adad88 Taehee Yoo 2021-10-31   68  	setup_udp_tunnel_sock(amt->net,=
 sock, &tunnel_cfg);
b9022b53adad88 Taehee Yoo 2021-10-31   69  =

b9022b53adad88 Taehee Yoo 2021-10-31   70  	rcu_assign_pointer(amt->sock, s=
ock);
b9022b53adad88 Taehee Yoo 2021-10-31   71  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31   72  }
b9022b53adad88 Taehee Yoo 2021-10-31   73  =

b9022b53adad88 Taehee Yoo 2021-10-31   74  static int amt_dev_open(struct n=
et_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31   75  {
b9022b53adad88 Taehee Yoo 2021-10-31   76  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31   77  	int err;
b9022b53adad88 Taehee Yoo 2021-10-31   78  =

b9022b53adad88 Taehee Yoo 2021-10-31   79  	amt->ready4 =3D false;
b9022b53adad88 Taehee Yoo 2021-10-31   80  	amt->ready6 =3D false;
b9022b53adad88 Taehee Yoo 2021-10-31   81  =

b9022b53adad88 Taehee Yoo 2021-10-31   82  	err =3D amt_socket_create(amt);
b9022b53adad88 Taehee Yoo 2021-10-31   83  	if (err)
b9022b53adad88 Taehee Yoo 2021-10-31   84  		return err;
b9022b53adad88 Taehee Yoo 2021-10-31   85  =

b9022b53adad88 Taehee Yoo 2021-10-31   86  	amt->req_cnt =3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31   87  	amt->remote_ip =3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31   88  	get_random_bytes(&amt->key, siz=
eof(siphash_key_t));
b9022b53adad88 Taehee Yoo 2021-10-31   89  =

b9022b53adad88 Taehee Yoo 2021-10-31   90  	amt->status =3D AMT_STATUS_INIT;
b9022b53adad88 Taehee Yoo 2021-10-31   91  	return err;
b9022b53adad88 Taehee Yoo 2021-10-31   92  }
b9022b53adad88 Taehee Yoo 2021-10-31   93  =

b9022b53adad88 Taehee Yoo 2021-10-31   94  static int amt_dev_stop(struct n=
et_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31   95  {
b9022b53adad88 Taehee Yoo 2021-10-31   96  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31   97  	struct socket *sock;
b9022b53adad88 Taehee Yoo 2021-10-31   98  =

b9022b53adad88 Taehee Yoo 2021-10-31   99  	/* shutdown */
b9022b53adad88 Taehee Yoo 2021-10-31  100  	sock =3D rtnl_dereference(amt->=
sock);
b9022b53adad88 Taehee Yoo 2021-10-31  101  	RCU_INIT_POINTER(amt->sock, NUL=
L);
b9022b53adad88 Taehee Yoo 2021-10-31  102  	synchronize_net();
b9022b53adad88 Taehee Yoo 2021-10-31  103  	if (sock)
b9022b53adad88 Taehee Yoo 2021-10-31  104  		udp_tunnel_sock_release(sock);
b9022b53adad88 Taehee Yoo 2021-10-31  105  =

b9022b53adad88 Taehee Yoo 2021-10-31  106  	amt->ready4 =3D false;
b9022b53adad88 Taehee Yoo 2021-10-31  107  	amt->ready6 =3D false;
b9022b53adad88 Taehee Yoo 2021-10-31  108  	amt->req_cnt =3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31  109  	amt->remote_ip =3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31  110  =

b9022b53adad88 Taehee Yoo 2021-10-31  111  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31  112  }
b9022b53adad88 Taehee Yoo 2021-10-31  113  =

b9022b53adad88 Taehee Yoo 2021-10-31  114  static const struct device_type =
amt_type =3D {
b9022b53adad88 Taehee Yoo 2021-10-31  115  	.name =3D "amt",
b9022b53adad88 Taehee Yoo 2021-10-31  116  };
b9022b53adad88 Taehee Yoo 2021-10-31  117  =

b9022b53adad88 Taehee Yoo 2021-10-31  118  static int amt_dev_init(struct n=
et_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31  119  {
b9022b53adad88 Taehee Yoo 2021-10-31  120  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  121  	int err;
b9022b53adad88 Taehee Yoo 2021-10-31  122  =

b9022b53adad88 Taehee Yoo 2021-10-31  123  	amt->dev =3D dev;
b9022b53adad88 Taehee Yoo 2021-10-31  124  	dev->tstats =3D netdev_alloc_pc=
pu_stats(struct pcpu_sw_netstats);
b9022b53adad88 Taehee Yoo 2021-10-31  125  	if (!dev->tstats)
b9022b53adad88 Taehee Yoo 2021-10-31  126  		return -ENOMEM;
b9022b53adad88 Taehee Yoo 2021-10-31  127  =

b9022b53adad88 Taehee Yoo 2021-10-31  128  	err =3D gro_cells_init(&amt->gr=
o_cells, dev);
b9022b53adad88 Taehee Yoo 2021-10-31  129  	if (err) {
b9022b53adad88 Taehee Yoo 2021-10-31  130  		free_percpu(dev->tstats);
b9022b53adad88 Taehee Yoo 2021-10-31  131  		return err;
b9022b53adad88 Taehee Yoo 2021-10-31  132  	}
b9022b53adad88 Taehee Yoo 2021-10-31  133  =

b9022b53adad88 Taehee Yoo 2021-10-31  134  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31  135  }
b9022b53adad88 Taehee Yoo 2021-10-31  136  =

b9022b53adad88 Taehee Yoo 2021-10-31  137  static void amt_dev_uninit(struc=
t net_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31  138  {
b9022b53adad88 Taehee Yoo 2021-10-31  139  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  140  =

b9022b53adad88 Taehee Yoo 2021-10-31  141  	gro_cells_destroy(&amt->gro_cel=
ls);
b9022b53adad88 Taehee Yoo 2021-10-31  142  	free_percpu(dev->tstats);
b9022b53adad88 Taehee Yoo 2021-10-31  143  }
b9022b53adad88 Taehee Yoo 2021-10-31  144  =

b9022b53adad88 Taehee Yoo 2021-10-31  145  static const struct net_device_o=
ps amt_netdev_ops =3D {
b9022b53adad88 Taehee Yoo 2021-10-31  146  	.ndo_init               =3D amt=
_dev_init,
b9022b53adad88 Taehee Yoo 2021-10-31  147  	.ndo_uninit             =3D amt=
_dev_uninit,
b9022b53adad88 Taehee Yoo 2021-10-31  148  	.ndo_open		=3D amt_dev_open,
b9022b53adad88 Taehee Yoo 2021-10-31  149  	.ndo_stop		=3D amt_dev_stop,
b9022b53adad88 Taehee Yoo 2021-10-31  150  	.ndo_get_stats64        =3D dev=
_get_tstats64,
b9022b53adad88 Taehee Yoo 2021-10-31  151  };
b9022b53adad88 Taehee Yoo 2021-10-31  152  =

b9022b53adad88 Taehee Yoo 2021-10-31  153  static void amt_link_setup(struc=
t net_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31  154  {
b9022b53adad88 Taehee Yoo 2021-10-31  155  	dev->netdev_ops         =3D &am=
t_netdev_ops;
b9022b53adad88 Taehee Yoo 2021-10-31  156  	dev->needs_free_netdev  =3D tru=
e;
b9022b53adad88 Taehee Yoo 2021-10-31  157  	SET_NETDEV_DEVTYPE(dev, &amt_ty=
pe);
b9022b53adad88 Taehee Yoo 2021-10-31  158  	dev->min_mtu		=3D ETH_MIN_MTU;
b9022b53adad88 Taehee Yoo 2021-10-31  159  	dev->max_mtu		=3D ETH_MAX_MTU;
b9022b53adad88 Taehee Yoo 2021-10-31  160  	dev->type		=3D ARPHRD_NONE;
b9022b53adad88 Taehee Yoo 2021-10-31  161  	dev->flags		=3D IFF_POINTOPOINT=
 | IFF_NOARP | IFF_MULTICAST;
b9022b53adad88 Taehee Yoo 2021-10-31  162  	dev->hard_header_len	=3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31  163  	dev->addr_len		=3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31  164  	dev->priv_flags		|=3D IFF_NO_QU=
EUE;
b9022b53adad88 Taehee Yoo 2021-10-31  165  	dev->features		|=3D NETIF_F_LLT=
X;
b9022b53adad88 Taehee Yoo 2021-10-31  166  	dev->features		|=3D NETIF_F_GSO=
_SOFTWARE;
b9022b53adad88 Taehee Yoo 2021-10-31  167  	dev->features		|=3D NETIF_F_NET=
NS_LOCAL;
b9022b53adad88 Taehee Yoo 2021-10-31  168  	dev->hw_features	|=3D NETIF_F_S=
G | NETIF_F_HW_CSUM;
b9022b53adad88 Taehee Yoo 2021-10-31  169  	dev->hw_features	|=3D NETIF_F_F=
RAGLIST | NETIF_F_RXCSUM;
b9022b53adad88 Taehee Yoo 2021-10-31  170  	dev->hw_features	|=3D NETIF_F_G=
SO_SOFTWARE;
b9022b53adad88 Taehee Yoo 2021-10-31  171  	eth_hw_addr_random(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  172  	eth_zero_addr(dev->broadcast);
b9022b53adad88 Taehee Yoo 2021-10-31  173  	ether_setup(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  174  }
b9022b53adad88 Taehee Yoo 2021-10-31  175  =

b9022b53adad88 Taehee Yoo 2021-10-31  176  static const struct nla_policy a=
mt_policy[IFLA_AMT_MAX + 1] =3D {
b9022b53adad88 Taehee Yoo 2021-10-31  177  	[IFLA_AMT_MODE]		=3D { .type =
=3D NLA_U32 },
b9022b53adad88 Taehee Yoo 2021-10-31  178  	[IFLA_AMT_RELAY_PORT]	=3D { .ty=
pe =3D NLA_U16 },
b9022b53adad88 Taehee Yoo 2021-10-31  179  	[IFLA_AMT_GATEWAY_PORT]	=3D { .=
type =3D NLA_U16 },
b9022b53adad88 Taehee Yoo 2021-10-31  180  	[IFLA_AMT_LINK]		=3D { .type =
=3D NLA_U32 },
b9022b53adad88 Taehee Yoo 2021-10-31  181  	[IFLA_AMT_LOCAL_IP]	=3D { .len =
=3D sizeof_field(struct iphdr, daddr) },
b9022b53adad88 Taehee Yoo 2021-10-31  182  	[IFLA_AMT_REMOTE_IP]	=3D { .len=
 =3D sizeof_field(struct iphdr, daddr) },
b9022b53adad88 Taehee Yoo 2021-10-31  183  	[IFLA_AMT_DISCOVERY_IP]	=3D { .=
len =3D sizeof_field(struct iphdr, daddr) },
b9022b53adad88 Taehee Yoo 2021-10-31  184  	[IFLA_AMT_MAX_TUNNELS]	=3D { .t=
ype =3D NLA_U32 },
b9022b53adad88 Taehee Yoo 2021-10-31  185  };
b9022b53adad88 Taehee Yoo 2021-10-31  186  =

b9022b53adad88 Taehee Yoo 2021-10-31  187  static int amt_validate(struct n=
lattr *tb[], struct nlattr *data[],
b9022b53adad88 Taehee Yoo 2021-10-31  188  			struct netlink_ext_ack *extac=
k)
b9022b53adad88 Taehee Yoo 2021-10-31  189  {
b9022b53adad88 Taehee Yoo 2021-10-31  190  	if (!data)
b9022b53adad88 Taehee Yoo 2021-10-31  191  		return -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  192  =

b9022b53adad88 Taehee Yoo 2021-10-31  193  	if (!data[IFLA_AMT_LINK]) {
b9022b53adad88 Taehee Yoo 2021-10-31  194  		NL_SET_ERR_MSG_ATTR(extack, da=
ta[IFLA_AMT_LINK],
b9022b53adad88 Taehee Yoo 2021-10-31  195  				    "Link attribute is requi=
red");
b9022b53adad88 Taehee Yoo 2021-10-31  196  		return -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  197  	}
b9022b53adad88 Taehee Yoo 2021-10-31  198  =

b9022b53adad88 Taehee Yoo 2021-10-31  199  	if (!data[IFLA_AMT_MODE]) {
b9022b53adad88 Taehee Yoo 2021-10-31  200  		NL_SET_ERR_MSG_ATTR(extack, da=
ta[IFLA_AMT_MODE],
b9022b53adad88 Taehee Yoo 2021-10-31  201  				    "Mode attribute is requi=
red");
b9022b53adad88 Taehee Yoo 2021-10-31  202  		return -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  203  	}
b9022b53adad88 Taehee Yoo 2021-10-31  204  =

b9022b53adad88 Taehee Yoo 2021-10-31  205  	if (nla_get_u32(data[IFLA_AMT_M=
ODE]) > AMT_MODE_MAX) {
b9022b53adad88 Taehee Yoo 2021-10-31  206  		NL_SET_ERR_MSG_ATTR(extack, da=
ta[IFLA_AMT_MODE],
b9022b53adad88 Taehee Yoo 2021-10-31  207  				    "Mode attribute is not v=
alid");
b9022b53adad88 Taehee Yoo 2021-10-31  208  		return -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  209  	}
b9022b53adad88 Taehee Yoo 2021-10-31  210  =

b9022b53adad88 Taehee Yoo 2021-10-31  211  	if (!data[IFLA_AMT_LOCAL_IP]) {
b9022b53adad88 Taehee Yoo 2021-10-31  212  		NL_SET_ERR_MSG_ATTR(extack, da=
ta[IFLA_AMT_DISCOVERY_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  213  				    "Local attribute is requ=
ired");
b9022b53adad88 Taehee Yoo 2021-10-31  214  		return -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  215  	}
b9022b53adad88 Taehee Yoo 2021-10-31  216  =

b9022b53adad88 Taehee Yoo 2021-10-31  217  	if (!data[IFLA_AMT_DISCOVERY_IP=
] &&
b9022b53adad88 Taehee Yoo 2021-10-31  218  	    nla_get_u32(data[IFLA_AMT_M=
ODE]) =3D=3D AMT_MODE_GATEWAY) {
b9022b53adad88 Taehee Yoo 2021-10-31  219  		NL_SET_ERR_MSG_ATTR(extack, da=
ta[IFLA_AMT_LOCAL_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  220  				    "Discovery attribute is =
required");
b9022b53adad88 Taehee Yoo 2021-10-31  221  		return -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  222  	}
b9022b53adad88 Taehee Yoo 2021-10-31  223  =

b9022b53adad88 Taehee Yoo 2021-10-31  224  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31  225  }
b9022b53adad88 Taehee Yoo 2021-10-31  226  =

b9022b53adad88 Taehee Yoo 2021-10-31  227  static int amt_newlink(struct ne=
t *net, struct net_device *dev,
b9022b53adad88 Taehee Yoo 2021-10-31  228  		       struct nlattr *tb[], st=
ruct nlattr *data[],
b9022b53adad88 Taehee Yoo 2021-10-31  229  		       struct netlink_ext_ack =
*extack)
b9022b53adad88 Taehee Yoo 2021-10-31  230  {
b9022b53adad88 Taehee Yoo 2021-10-31  231  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  232  	int err =3D -EINVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  233  =

b9022b53adad88 Taehee Yoo 2021-10-31  234  	amt->net =3D net;
b9022b53adad88 Taehee Yoo 2021-10-31  235  	amt->mode =3D nla_get_u32(data[=
IFLA_AMT_MODE]);
b9022b53adad88 Taehee Yoo 2021-10-31  236  =

b9022b53adad88 Taehee Yoo 2021-10-31  237  	if (data[IFLA_AMT_MAX_TUNNELS])
b9022b53adad88 Taehee Yoo 2021-10-31  238  		amt->max_tunnels =3D nla_get_u=
32(data[IFLA_AMT_MAX_TUNNELS]);
b9022b53adad88 Taehee Yoo 2021-10-31  239  	else
b9022b53adad88 Taehee Yoo 2021-10-31  240  		amt->max_tunnels =3D AMT_MAX_T=
UNNELS;
b9022b53adad88 Taehee Yoo 2021-10-31  241  =

b9022b53adad88 Taehee Yoo 2021-10-31  242  	spin_lock_init(&amt->lock);
b9022b53adad88 Taehee Yoo 2021-10-31  243  	amt->max_groups =3D AMT_MAX_GRO=
UP;
b9022b53adad88 Taehee Yoo 2021-10-31  244  	amt->max_sources =3D AMT_MAX_SO=
URCE;
b9022b53adad88 Taehee Yoo 2021-10-31  245  	amt->hash_buckets =3D AMT_HSIZE;
b9022b53adad88 Taehee Yoo 2021-10-31  246  	amt->nr_tunnels =3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31  247  	get_random_bytes(&amt->hash_see=
d, sizeof(amt->hash_seed));
b9022b53adad88 Taehee Yoo 2021-10-31  248  	amt->stream_dev =3D dev_get_by_=
index(net,
b9022b53adad88 Taehee Yoo 2021-10-31  249  					   nla_get_u32(data[IFLA_AM=
T_LINK]));
b9022b53adad88 Taehee Yoo 2021-10-31  250  	if (!amt->stream_dev) {
b9022b53adad88 Taehee Yoo 2021-10-31  251  		NL_SET_ERR_MSG_ATTR(extack, tb=
[IFLA_AMT_LINK],
b9022b53adad88 Taehee Yoo 2021-10-31  252  				    "Can't find stream devic=
e");
b9022b53adad88 Taehee Yoo 2021-10-31  253  		return -ENODEV;
b9022b53adad88 Taehee Yoo 2021-10-31  254  	}
b9022b53adad88 Taehee Yoo 2021-10-31  255  =

b9022b53adad88 Taehee Yoo 2021-10-31  256  	if (amt->stream_dev->type !=3D =
ARPHRD_ETHER) {
b9022b53adad88 Taehee Yoo 2021-10-31  257  		NL_SET_ERR_MSG_ATTR(extack, tb=
[IFLA_AMT_LINK],
b9022b53adad88 Taehee Yoo 2021-10-31  258  				    "Invalid stream device t=
ype");
b9022b53adad88 Taehee Yoo 2021-10-31  259  		goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  260  	}
b9022b53adad88 Taehee Yoo 2021-10-31  261  =

b9022b53adad88 Taehee Yoo 2021-10-31  262  	amt->local_ip =3D nla_get_in_ad=
dr(data[IFLA_AMT_LOCAL_IP]);
b9022b53adad88 Taehee Yoo 2021-10-31  263  	if (ipv4_is_loopback(amt->local=
_ip) ||
b9022b53adad88 Taehee Yoo 2021-10-31  264  	    ipv4_is_zeronet(amt->local_=
ip) ||
b9022b53adad88 Taehee Yoo 2021-10-31  265  	    ipv4_is_multicast(amt->loca=
l_ip)) {
b9022b53adad88 Taehee Yoo 2021-10-31  266  		NL_SET_ERR_MSG_ATTR(extack, tb=
[IFLA_AMT_LOCAL_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  267  				    "Invalid Local address");
b9022b53adad88 Taehee Yoo 2021-10-31  268  		goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  269  	}
b9022b53adad88 Taehee Yoo 2021-10-31  270  =

b9022b53adad88 Taehee Yoo 2021-10-31  271  	if (data[IFLA_AMT_RELAY_PORT])
b9022b53adad88 Taehee Yoo 2021-10-31  272  		amt->relay_port =3D nla_get_be=
16(data[IFLA_AMT_RELAY_PORT]);
b9022b53adad88 Taehee Yoo 2021-10-31  273  	else
b9022b53adad88 Taehee Yoo 2021-10-31  274  		amt->relay_port =3D htons(IANA=
_AMT_UDP_PORT);
b9022b53adad88 Taehee Yoo 2021-10-31  275  =

b9022b53adad88 Taehee Yoo 2021-10-31  276  	if (data[IFLA_AMT_GATEWAY_PORT])
b9022b53adad88 Taehee Yoo 2021-10-31  277  		amt->gw_port =3D nla_get_be16(=
data[IFLA_AMT_GATEWAY_PORT]);
b9022b53adad88 Taehee Yoo 2021-10-31  278  	else
b9022b53adad88 Taehee Yoo 2021-10-31  279  		amt->gw_port =3D htons(IANA_AM=
T_UDP_PORT);
b9022b53adad88 Taehee Yoo 2021-10-31  280  =

b9022b53adad88 Taehee Yoo 2021-10-31  281  	if (!amt->relay_port) {
b9022b53adad88 Taehee Yoo 2021-10-31  282  		NL_SET_ERR_MSG_ATTR(extack, tb=
[IFLA_AMT_DISCOVERY_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  283  				    "relay port must not be =
0");
b9022b53adad88 Taehee Yoo 2021-10-31  284  		goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  285  	}
b9022b53adad88 Taehee Yoo 2021-10-31  286  	if (amt->mode =3D=3D AMT_MODE_R=
ELAY) {
b9022b53adad88 Taehee Yoo 2021-10-31  287  		amt->qrv =3D amt->net->ipv4.sy=
sctl_igmp_qrv;
b9022b53adad88 Taehee Yoo 2021-10-31  288  		amt->qri =3D 10;
b9022b53adad88 Taehee Yoo 2021-10-31  289  		dev->needed_headroom =3D amt->=
stream_dev->needed_headroom +
b9022b53adad88 Taehee Yoo 2021-10-31  290  				       AMT_RELAY_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  291  		dev->mtu =3D amt->stream_dev->=
mtu - AMT_RELAY_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  292  		dev->max_mtu =3D dev->mtu;
b9022b53adad88 Taehee Yoo 2021-10-31  293  		dev->min_mtu =3D ETH_MIN_MTU +=
 AMT_RELAY_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  294  	} else {
b9022b53adad88 Taehee Yoo 2021-10-31  295  		if (!data[IFLA_AMT_DISCOVERY_I=
P]) {
b9022b53adad88 Taehee Yoo 2021-10-31  296  			NL_SET_ERR_MSG_ATTR(extack, t=
b[IFLA_AMT_DISCOVERY_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  297  					    "discovery must be set =
in gateway mode");
b9022b53adad88 Taehee Yoo 2021-10-31  298  			goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  299  		}
b9022b53adad88 Taehee Yoo 2021-10-31  300  		if (!amt->gw_port) {
b9022b53adad88 Taehee Yoo 2021-10-31  301  			NL_SET_ERR_MSG_ATTR(extack, t=
b[IFLA_AMT_DISCOVERY_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  302  					    "gateway port must not =
be 0");
b9022b53adad88 Taehee Yoo 2021-10-31  303  			goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  304  		}
b9022b53adad88 Taehee Yoo 2021-10-31  305  		amt->remote_ip =3D 0;
b9022b53adad88 Taehee Yoo 2021-10-31  306  		amt->discovery_ip =3D nla_get_=
in_addr(data[IFLA_AMT_DISCOVERY_IP]);
b9022b53adad88 Taehee Yoo 2021-10-31  307  		if (ipv4_is_loopback(amt->disc=
overy_ip) ||
b9022b53adad88 Taehee Yoo 2021-10-31  308  		    ipv4_is_zeronet(amt->disco=
very_ip) ||
b9022b53adad88 Taehee Yoo 2021-10-31  309  		    ipv4_is_multicast(amt->dis=
covery_ip)) {
b9022b53adad88 Taehee Yoo 2021-10-31  310  			NL_SET_ERR_MSG_ATTR(extack, t=
b[IFLA_AMT_DISCOVERY_IP],
b9022b53adad88 Taehee Yoo 2021-10-31  311  					    "discovery must be unic=
ast");
b9022b53adad88 Taehee Yoo 2021-10-31  312  			goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  313  		}
b9022b53adad88 Taehee Yoo 2021-10-31  314  =

b9022b53adad88 Taehee Yoo 2021-10-31  315  		dev->needed_headroom =3D amt->=
stream_dev->needed_headroom +
b9022b53adad88 Taehee Yoo 2021-10-31  316  				       AMT_GW_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  317  		dev->mtu =3D amt->stream_dev->=
mtu - AMT_GW_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  318  		dev->max_mtu =3D dev->mtu;
b9022b53adad88 Taehee Yoo 2021-10-31  319  		dev->min_mtu =3D ETH_MIN_MTU +=
 AMT_GW_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  320  	}
b9022b53adad88 Taehee Yoo 2021-10-31  321  	amt->qi =3D AMT_INIT_QUERY_INTE=
RVAL;
b9022b53adad88 Taehee Yoo 2021-10-31  322  =

b9022b53adad88 Taehee Yoo 2021-10-31  323  	err =3D register_netdevice(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  324  	if (err < 0) {
b9022b53adad88 Taehee Yoo 2021-10-31  325  		netdev_dbg(dev, "failed to reg=
ister new netdev %d\n", err);
b9022b53adad88 Taehee Yoo 2021-10-31  326  		goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  327  	}
b9022b53adad88 Taehee Yoo 2021-10-31  328  =

b9022b53adad88 Taehee Yoo 2021-10-31  329  	err =3D netdev_upper_dev_link(a=
mt->stream_dev, dev, extack);
b9022b53adad88 Taehee Yoo 2021-10-31  330  	if (err < 0) {
b9022b53adad88 Taehee Yoo 2021-10-31  331  		unregister_netdevice(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  332  		goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  333  	}
b9022b53adad88 Taehee Yoo 2021-10-31  334  =

b9022b53adad88 Taehee Yoo 2021-10-31  335  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31  336  err:
b9022b53adad88 Taehee Yoo 2021-10-31  337  	dev_put(amt->stream_dev);
b9022b53adad88 Taehee Yoo 2021-10-31  338  	return err;
b9022b53adad88 Taehee Yoo 2021-10-31  339  }
b9022b53adad88 Taehee Yoo 2021-10-31  340  =

b9022b53adad88 Taehee Yoo 2021-10-31  341  static void amt_dellink(struct n=
et_device *dev, struct list_head *head)
b9022b53adad88 Taehee Yoo 2021-10-31  342  {
b9022b53adad88 Taehee Yoo 2021-10-31  343  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  344  =

b9022b53adad88 Taehee Yoo 2021-10-31  345  	unregister_netdevice_queue(dev,=
 head);
b9022b53adad88 Taehee Yoo 2021-10-31  346  	netdev_upper_dev_unlink(amt->st=
ream_dev, dev);
b9022b53adad88 Taehee Yoo 2021-10-31  347  	dev_put(amt->stream_dev);
b9022b53adad88 Taehee Yoo 2021-10-31  348  }
b9022b53adad88 Taehee Yoo 2021-10-31  349  =

b9022b53adad88 Taehee Yoo 2021-10-31  350  static size_t amt_get_size(const=
 struct net_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31  351  {
b9022b53adad88 Taehee Yoo 2021-10-31  352  	return nla_total_size(sizeof(__=
u32)) + /* IFLA_AMT_MODE */
b9022b53adad88 Taehee Yoo 2021-10-31  353  	       nla_total_size(sizeof(__=
u16)) + /* IFLA_AMT_RELAY_PORT */
b9022b53adad88 Taehee Yoo 2021-10-31  354  	       nla_total_size(sizeof(__=
u16)) + /* IFLA_AMT_GATEWAY_PORT */
b9022b53adad88 Taehee Yoo 2021-10-31  355  	       nla_total_size(sizeof(__=
u32)) + /* IFLA_AMT_LINK */
b9022b53adad88 Taehee Yoo 2021-10-31  356  	       nla_total_size(sizeof(__=
u32)) + /* IFLA_MAX_TUNNELS */
b9022b53adad88 Taehee Yoo 2021-10-31  357  	       nla_total_size(sizeof(st=
ruct iphdr)) + /* IFLA_AMT_DISCOVERY_IP */
b9022b53adad88 Taehee Yoo 2021-10-31  358  	       nla_total_size(sizeof(st=
ruct iphdr)) + /* IFLA_AMT_REMOTE_IP */
b9022b53adad88 Taehee Yoo 2021-10-31  359  	       nla_total_size(sizeof(st=
ruct iphdr)); /* IFLA_AMT_LOCAL_IP */
b9022b53adad88 Taehee Yoo 2021-10-31  360  }
b9022b53adad88 Taehee Yoo 2021-10-31  361  =

b9022b53adad88 Taehee Yoo 2021-10-31  362  static int amt_fill_info(struct =
sk_buff *skb, const struct net_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31  363  {
b9022b53adad88 Taehee Yoo 2021-10-31  364  	struct amt_dev *amt =3D netdev_=
priv(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  365  =

b9022b53adad88 Taehee Yoo 2021-10-31  366  	if (nla_put_u32(skb, IFLA_AMT_M=
ODE, amt->mode))
b9022b53adad88 Taehee Yoo 2021-10-31  367  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  368  	if (nla_put_be16(skb, IFLA_AMT_=
RELAY_PORT, amt->relay_port))
b9022b53adad88 Taehee Yoo 2021-10-31  369  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  370  	if (nla_put_be16(skb, IFLA_AMT_=
GATEWAY_PORT, amt->gw_port))
b9022b53adad88 Taehee Yoo 2021-10-31  371  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  372  	if (nla_put_u32(skb, IFLA_AMT_L=
INK, amt->stream_dev->ifindex))
b9022b53adad88 Taehee Yoo 2021-10-31  373  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  374  	if (nla_put_in_addr(skb, IFLA_A=
MT_LOCAL_IP, amt->local_ip))
b9022b53adad88 Taehee Yoo 2021-10-31  375  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  376  	if (nla_put_in_addr(skb, IFLA_A=
MT_DISCOVERY_IP, amt->discovery_ip))
b9022b53adad88 Taehee Yoo 2021-10-31  377  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  378  	if (amt->remote_ip)
b9022b53adad88 Taehee Yoo 2021-10-31  379  		if (nla_put_in_addr(skb, IFLA_=
AMT_REMOTE_IP, amt->remote_ip))
b9022b53adad88 Taehee Yoo 2021-10-31  380  			goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  381  	if (nla_put_u32(skb, IFLA_AMT_M=
AX_TUNNELS, amt->max_tunnels))
b9022b53adad88 Taehee Yoo 2021-10-31  382  		goto nla_put_failure;
b9022b53adad88 Taehee Yoo 2021-10-31  383  =

b9022b53adad88 Taehee Yoo 2021-10-31  384  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31  385  =

b9022b53adad88 Taehee Yoo 2021-10-31  386  nla_put_failure:
b9022b53adad88 Taehee Yoo 2021-10-31  387  	return -EMSGSIZE;
b9022b53adad88 Taehee Yoo 2021-10-31  388  }
b9022b53adad88 Taehee Yoo 2021-10-31  389  =

b9022b53adad88 Taehee Yoo 2021-10-31  390  static struct rtnl_link_ops amt_=
link_ops __read_mostly =3D {
b9022b53adad88 Taehee Yoo 2021-10-31  391  	.kind		=3D "amt",
b9022b53adad88 Taehee Yoo 2021-10-31  392  	.maxtype	=3D IFLA_AMT_MAX,
b9022b53adad88 Taehee Yoo 2021-10-31  393  	.policy		=3D amt_policy,
b9022b53adad88 Taehee Yoo 2021-10-31  394  	.priv_size	=3D sizeof(struct am=
t_dev),
b9022b53adad88 Taehee Yoo 2021-10-31  395  	.setup		=3D amt_link_setup,
b9022b53adad88 Taehee Yoo 2021-10-31  396  	.validate	=3D amt_validate,
b9022b53adad88 Taehee Yoo 2021-10-31  397  	.newlink	=3D amt_newlink,
b9022b53adad88 Taehee Yoo 2021-10-31  398  	.dellink	=3D amt_dellink,
b9022b53adad88 Taehee Yoo 2021-10-31  399  	.get_size       =3D amt_get_siz=
e,
b9022b53adad88 Taehee Yoo 2021-10-31  400  	.fill_info      =3D amt_fill_in=
fo,
b9022b53adad88 Taehee Yoo 2021-10-31  401  };
b9022b53adad88 Taehee Yoo 2021-10-31  402  =

b9022b53adad88 Taehee Yoo 2021-10-31  403  static struct net_device *amt_lo=
okup_upper_dev(struct net_device *dev)
b9022b53adad88 Taehee Yoo 2021-10-31  404  {
b9022b53adad88 Taehee Yoo 2021-10-31  405  	struct net_device *upper_dev;
b9022b53adad88 Taehee Yoo 2021-10-31  406  	struct amt_dev *amt;
b9022b53adad88 Taehee Yoo 2021-10-31  407  =

b9022b53adad88 Taehee Yoo 2021-10-31  408  	for_each_netdev(dev_net(dev), u=
pper_dev) {
b9022b53adad88 Taehee Yoo 2021-10-31  409  		if (netif_is_amt(upper_dev)) {
b9022b53adad88 Taehee Yoo 2021-10-31  410  			amt =3D netdev_priv(upper_dev=
);
b9022b53adad88 Taehee Yoo 2021-10-31  411  			if (amt->stream_dev =3D=3D de=
v)
b9022b53adad88 Taehee Yoo 2021-10-31  412  				return upper_dev;
b9022b53adad88 Taehee Yoo 2021-10-31  413  		}
b9022b53adad88 Taehee Yoo 2021-10-31  414  	}
b9022b53adad88 Taehee Yoo 2021-10-31  415  =

b9022b53adad88 Taehee Yoo 2021-10-31  416  	return NULL;
b9022b53adad88 Taehee Yoo 2021-10-31  417  }
b9022b53adad88 Taehee Yoo 2021-10-31  418  =

b9022b53adad88 Taehee Yoo 2021-10-31  419  static int amt_device_event(stru=
ct notifier_block *unused,
b9022b53adad88 Taehee Yoo 2021-10-31  420  			    unsigned long event, void=
 *ptr)
b9022b53adad88 Taehee Yoo 2021-10-31  421  {
b9022b53adad88 Taehee Yoo 2021-10-31  422  	struct net_device *dev =3D netd=
ev_notifier_info_to_dev(ptr);
b9022b53adad88 Taehee Yoo 2021-10-31  423  	struct net_device *upper_dev;
b9022b53adad88 Taehee Yoo 2021-10-31  424  	struct amt_dev *amt;
b9022b53adad88 Taehee Yoo 2021-10-31  425  	LIST_HEAD(list);
b9022b53adad88 Taehee Yoo 2021-10-31  426  	int new_mtu;
b9022b53adad88 Taehee Yoo 2021-10-31  427  =

b9022b53adad88 Taehee Yoo 2021-10-31  428  	upper_dev =3D amt_lookup_upper_=
dev(dev);
b9022b53adad88 Taehee Yoo 2021-10-31  429  	if (!upper_dev)
b9022b53adad88 Taehee Yoo 2021-10-31  430  		return NOTIFY_DONE;
b9022b53adad88 Taehee Yoo 2021-10-31  431  	amt =3D netdev_priv(upper_dev);
b9022b53adad88 Taehee Yoo 2021-10-31  432  =

b9022b53adad88 Taehee Yoo 2021-10-31  433  	switch (event) {
b9022b53adad88 Taehee Yoo 2021-10-31  434  	case NETDEV_UNREGISTER:
b9022b53adad88 Taehee Yoo 2021-10-31  435  		amt_dellink(amt->dev, &list);
b9022b53adad88 Taehee Yoo 2021-10-31  436  		unregister_netdevice_many(&lis=
t);
b9022b53adad88 Taehee Yoo 2021-10-31  437  		break;
b9022b53adad88 Taehee Yoo 2021-10-31  438  	case NETDEV_CHANGEMTU:
b9022b53adad88 Taehee Yoo 2021-10-31  439  		if (amt->mode =3D=3D AMT_MODE_=
RELAY)
b9022b53adad88 Taehee Yoo 2021-10-31  440  			new_mtu =3D dev->mtu - AMT_RE=
LAY_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  441  		else
b9022b53adad88 Taehee Yoo 2021-10-31  442  			new_mtu =3D dev->mtu - AMT_GW=
_HLEN;
b9022b53adad88 Taehee Yoo 2021-10-31  443  =

b9022b53adad88 Taehee Yoo 2021-10-31  444  		dev_set_mtu(amt->dev, new_mtu);
b9022b53adad88 Taehee Yoo 2021-10-31  445  		break;
b9022b53adad88 Taehee Yoo 2021-10-31  446  	}
b9022b53adad88 Taehee Yoo 2021-10-31  447  =

b9022b53adad88 Taehee Yoo 2021-10-31  448  	return NOTIFY_DONE;
b9022b53adad88 Taehee Yoo 2021-10-31  449  }
b9022b53adad88 Taehee Yoo 2021-10-31  450  =

b9022b53adad88 Taehee Yoo 2021-10-31  451  static struct notifier_block amt=
_notifier_block __read_mostly =3D {
b9022b53adad88 Taehee Yoo 2021-10-31  452  	.notifier_call =3D amt_device_e=
vent,
b9022b53adad88 Taehee Yoo 2021-10-31  453  };
b9022b53adad88 Taehee Yoo 2021-10-31  454  =

b9022b53adad88 Taehee Yoo 2021-10-31  455  static int __init amt_init(void)
b9022b53adad88 Taehee Yoo 2021-10-31  456  {
b9022b53adad88 Taehee Yoo 2021-10-31  457  	int err;
b9022b53adad88 Taehee Yoo 2021-10-31  458  =

b9022b53adad88 Taehee Yoo 2021-10-31  459  	err =3D register_netdevice_noti=
fier(&amt_notifier_block);
b9022b53adad88 Taehee Yoo 2021-10-31  460  	if (err < 0)
b9022b53adad88 Taehee Yoo 2021-10-31  461  		goto err;
b9022b53adad88 Taehee Yoo 2021-10-31  462  =

b9022b53adad88 Taehee Yoo 2021-10-31  463  	err =3D rtnl_link_register(&amt=
_link_ops);
b9022b53adad88 Taehee Yoo 2021-10-31  464  	if (err < 0)
b9022b53adad88 Taehee Yoo 2021-10-31  465  		goto unregister_notifier;
b9022b53adad88 Taehee Yoo 2021-10-31  466  =

b9022b53adad88 Taehee Yoo 2021-10-31  467  	amt_wq =3D alloc_workqueue("amt=
", WQ_UNBOUND, 1);
b9022b53adad88 Taehee Yoo 2021-10-31  468  	if (!amt_wq)
b9022b53adad88 Taehee Yoo 2021-10-31  469  		goto rtnl_unregister;
b9022b53adad88 Taehee Yoo 2021-10-31  470  =

b9022b53adad88 Taehee Yoo 2021-10-31  471  	return 0;
b9022b53adad88 Taehee Yoo 2021-10-31  472  =

b9022b53adad88 Taehee Yoo 2021-10-31  473  rtnl_unregister:
b9022b53adad88 Taehee Yoo 2021-10-31  474  	rtnl_link_unregister(&amt_link_=
ops);
b9022b53adad88 Taehee Yoo 2021-10-31  475  unregister_notifier:
b9022b53adad88 Taehee Yoo 2021-10-31  476  	unregister_netdevice_notifier(&=
amt_notifier_block);
b9022b53adad88 Taehee Yoo 2021-10-31  477  err:
b9022b53adad88 Taehee Yoo 2021-10-31  478  	pr_err("error loading AMT modul=
e loaded\n");
b9022b53adad88 Taehee Yoo 2021-10-31  479  	return err;
b9022b53adad88 Taehee Yoo 2021-10-31  480  }
b9022b53adad88 Taehee Yoo 2021-10-31  481  late_initcall(amt_init);
b9022b53adad88 Taehee Yoo 2021-10-31  482  =

b9022b53adad88 Taehee Yoo 2021-10-31  483  static void __exit amt_fini(void)
b9022b53adad88 Taehee Yoo 2021-10-31  484  {
b9022b53adad88 Taehee Yoo 2021-10-31  485  	rtnl_link_unregister(&amt_link_=
ops);
b9022b53adad88 Taehee Yoo 2021-10-31  486  	unregister_netdevice_notifier(&=
amt_notifier_block);
b9022b53adad88 Taehee Yoo 2021-10-31  487  	destroy_workqueue(amt_wq);
b9022b53adad88 Taehee Yoo 2021-10-31  488  }
b9022b53adad88 Taehee Yoo 2021-10-31  489  module_exit(amt_fini);
b9022b53adad88 Taehee Yoo 2021-10-31  490  =

b9022b53adad88 Taehee Yoo 2021-10-31  491  MODULE_LICENSE("GPL");
b9022b53adad88 Taehee Yoo 2021-10-31  492  MODULE_AUTHOR("Taehee Yoo <ap420=
073@gmail.com>");
b9022b53adad88 Taehee Yoo 2021-10-31  493  MODULE_ALIAS_RTNL_LINK("amt");

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0114079803454011158==--

