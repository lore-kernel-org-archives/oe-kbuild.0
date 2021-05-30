Content-Type: multipart/mixed; boundary="===============6671282956391937842=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/8390/axnet_cs.c:662:2: warning: Variable 'xfer_count' is modified but its new value is never used. [unreadVariable]
Date: Mon, 31 May 2021 02:41:29 +0800
Message-ID: <202105310216.e0r4RySK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6671282956391937842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joe Perches <joe@perches.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b90e90f40b4ff23c753126008bf4713a42353af6
commit: e7fee115bf2cc418cc607a01bb62678eb8c720e9 8390: Avoid comma separate=
d statements
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/8390/axnet_cs.c:1110:15: warning: Identical inner '=
if' condition is always true. [identicalInnerCondition]
     if (ei_local->irqlock)
                 ^
   drivers/net/ethernet/8390/axnet_cs.c:1106:14: note: outer condition: ei_=
local->irqlock
    if (ei_local->irqlock) {
                ^
   drivers/net/ethernet/8390/axnet_cs.c:1110:15: note: identical inner cond=
ition: ei_local->irqlock
     if (ei_local->irqlock)
                 ^
>> drivers/net/ethernet/8390/axnet_cs.c:662:2: warning: Variable 'xfer_coun=
t' is modified but its new value is never used. [unreadVariable]
    xfer_count++;
    ^

vim +/xfer_count +662 drivers/net/ethernet/8390/axnet_cs.c

^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  644  =

^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  645  static void block_input(struct net_device *dev, int count,
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  646  			struct sk_buff *skb, int ring_offset)
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  647  {
906da809c5be30 drivers/net/pcmcia/axnet_cs.c        Olof Johansson    2008-=
02-04  648      unsigned int nic_base =3D dev->base_addr;
c45f812f0280c1 drivers/net/ethernet/8390/axnet_cs.c Matthew Whitehead 2013-=
12-11  649      struct ei_device *ei_local =3D netdev_priv(dev);
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  650      int xfer_count =3D count;
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  651      char *buf =3D skb->data;
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  652  =

c45f812f0280c1 drivers/net/ethernet/8390/axnet_cs.c Matthew Whitehead 2013-=
12-11  653      if ((netif_msg_rx_status(ei_local)) && (count !=3D 4))
c45f812f0280c1 drivers/net/ethernet/8390/axnet_cs.c Matthew Whitehead 2013-=
12-11  654  	netdev_dbg(dev, "[bi=3D%d]\n", count+4);
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  655      outb_p(ring_offset & 0xff, nic_base + EN0_RSARLO);
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  656      outb_p(ring_offset >> 8, nic_base + EN0_RSARHI);
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  657      outb_p(E8390_RREAD+E8390_START, nic_base + AXNET_CMD);
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  658  =

^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  659      insw(nic_base + AXNET_DATAPORT,buf,count>>1);
e7fee115bf2cc4 drivers/net/ethernet/8390/axnet_cs.c Joe Perches       2020-=
08-24  660      if (count & 0x01) {
e7fee115bf2cc4 drivers/net/ethernet/8390/axnet_cs.c Joe Perches       2020-=
08-24  661  	buf[count-1] =3D inb(nic_base + AXNET_DATAPORT);
e7fee115bf2cc4 drivers/net/ethernet/8390/axnet_cs.c Joe Perches       2020-=
08-24 @662  	xfer_count++;
e7fee115bf2cc4 drivers/net/ethernet/8390/axnet_cs.c Joe Perches       2020-=
08-24  663      }
^1da177e4c3f41 drivers/net/pcmcia/axnet_cs.c        Linus Torvalds    2005-=
04-16  664  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6671282956391937842==--

