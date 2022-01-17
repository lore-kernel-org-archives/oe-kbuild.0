Content-Type: multipart/mixed; boundary="===============2695504922304219803=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.16.y-rt-rebase 64/127] drivers/staging/gdm724x/gdm_lte.c:86 gdm_lte_rx() error: dereferencing freed memory 'skb'
Date: Mon, 17 Jan 2022 12:41:59 +0800
Message-ID: <202201171233.GrY6YbJw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2695504922304219803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.16.y-rt-rebase
head:   23316ccdc3157a7b74ddbe4e31d031f96a5b6586
commit: 7a7b4bc238bc31705cdf97a438a9b83cb3f5a870 [64/127] net: dev: Makes s=
ure netif_rx() can be invoked in any context.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: ia64-randconfig-m031-20220116 (https://download.01.org/0day-ci/arch=
ive/20220117/202201171233.GrY6YbJw-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/gdm724x/gdm_lte.c:86 gdm_lte_rx() error: dereferencing free=
d memory 'skb'

vim +/skb +86 drivers/staging/gdm724x/gdm_lte.c

61e12104764512 Won Kang 2013-07-25  76  =

61e12104764512 Won Kang 2013-07-25  77  static int gdm_lte_rx(struct sk_buf=
f *skb, struct nic *nic, int nic_type)
61e12104764512 Won Kang 2013-07-25  78  {
61e12104764512 Won Kang 2013-07-25  79  	int ret;
61e12104764512 Won Kang 2013-07-25  80  =

61e12104764512 Won Kang 2013-07-25  81  	ret =3D netif_rx_ni(skb);
61e12104764512 Won Kang 2013-07-25  82  	if (ret =3D=3D NET_RX_DROP) {
61e12104764512 Won Kang 2013-07-25  83  		nic->stats.rx_dropped++;
61e12104764512 Won Kang 2013-07-25  84  	} else {
61e12104764512 Won Kang 2013-07-25  85  		nic->stats.rx_packets++;
61e12104764512 Won Kang 2013-07-25 @86  		nic->stats.rx_bytes +=3D skb->len=
 + ETH_HLEN;
61e12104764512 Won Kang 2013-07-25  87  	}
61e12104764512 Won Kang 2013-07-25  88  =

61e12104764512 Won Kang 2013-07-25  89  	return 0;
61e12104764512 Won Kang 2013-07-25  90  }
61e12104764512 Won Kang 2013-07-25  91  =


:::::: The code at line 86 was first introduced by commit
:::::: 61e121047645122c47714fcda684d0ee67f444af staging: gdm7240: adding LT=
E USB driver

:::::: TO: Won Kang <wkang77@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2695504922304219803==--

