Content-Type: multipart/mixed; boundary="===============7314647215576035504=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5017/7915] drivers/staging/gdm724x/gdm_lte.c:86 gdm_lte_rx() error: dereferencing freed memory 'skb'
Date: Fri, 25 Feb 2022 08:05:50 +0800
Message-ID: <202202250718.FFjPf4Mt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7314647215576035504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Eric Dumazet <edumazet@google.com>
CC: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: baebdf48c360080710f80699eea3affbb13d6c65 [5017/7915] net: dev: Make=
s sure netif_rx() can be invoked in any context.
:::::: branch date: 22 hours ago
:::::: commit date: 10 days ago
config: ia64-randconfig-m031-20220224 (https://download.01.org/0day-ci/arch=
ive/20220225/202202250718.FFjPf4Mt-lkp(a)intel.com/config)
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
--===============7314647215576035504==--

