Content-Type: multipart/mixed; boundary="===============4470904415242184531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bridge/br_private.h:901 br_multicast_rport_from_node_skb() warn: inconsistent indenting
Date: Mon, 01 Aug 2022 03:26:35 +0800
Message-ID: <202208010331.xAA53Wvo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4470904415242184531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nikolay Aleksandrov <nikolay@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6a010258447d386186ca10cd374d888ac66ffe1a
commit: 9632233e7de8da43711bb7cd3e054af32fedcc38 net: bridge: multicast: fa=
ctor out port multicast context
date:   1 year ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year ago
config: arc-randconfig-m041-20220731 (https://download.01.org/0day-ci/archi=
ve/20220801/202208010331.xAA53Wvo-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bridge/br_private.h:901 br_multicast_rport_from_node_skb() warn: incons=
istent indenting

Old smatch warnings:
net/bridge/br_forward.c:317 br_multicast_flood() error: we previously assum=
ed 'p' could be null (see line 293)

vim +901 net/bridge/br_private.h

44ebb081dc6934 Linus L=C3=BCssing       2021-05-13  890  =

44ebb081dc6934 Linus L=C3=BCssing       2021-05-13  891  static inline stru=
ct net_bridge_port *
44ebb081dc6934 Linus L=C3=BCssing       2021-05-13  892  br_multicast_rport=
_from_node_skb(struct hlist_node *rp, struct sk_buff *skb) {
9632233e7de8da Nikolay Aleksandrov 2021-07-19  893  	struct net_bridge_mcas=
t_port *mctx;
9632233e7de8da Nikolay Aleksandrov 2021-07-19  894  =

a3c02e769efe66 Linus L=C3=BCssing       2021-05-13  895  #if IS_ENABLED(CON=
FIG_IPV6)
a3c02e769efe66 Linus L=C3=BCssing       2021-05-13  896  	if (skb->protocol=
 =3D=3D htons(ETH_P_IPV6))
9632233e7de8da Nikolay Aleksandrov 2021-07-19  897  		mctx =3D hlist_entry_=
safe(rp, struct net_bridge_mcast_port,
9632233e7de8da Nikolay Aleksandrov 2021-07-19  898  					ip6_rlist);
9632233e7de8da Nikolay Aleksandrov 2021-07-19  899  	else
a3c02e769efe66 Linus L=C3=BCssing       2021-05-13  900  #endif
9632233e7de8da Nikolay Aleksandrov 2021-07-19 @901  		mctx =3D hlist_entry_=
safe(rp, struct net_bridge_mcast_port,
9632233e7de8da Nikolay Aleksandrov 2021-07-19  902  					ip4_rlist);
9632233e7de8da Nikolay Aleksandrov 2021-07-19  903  =

9632233e7de8da Nikolay Aleksandrov 2021-07-19  904  	if (mctx)
9632233e7de8da Nikolay Aleksandrov 2021-07-19  905  		return mctx->port;
9632233e7de8da Nikolay Aleksandrov 2021-07-19  906  	else
9632233e7de8da Nikolay Aleksandrov 2021-07-19  907  		return NULL;
44ebb081dc6934 Linus L=C3=BCssing       2021-05-13  908  }
44ebb081dc6934 Linus L=C3=BCssing       2021-05-13  909  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4470904415242184531==--

