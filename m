Content-Type: multipart/mixed; boundary="===============2356731743491598527=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/atm/idt77252.c:1292 idt77252_rx_raw() warn: potential spectre issue 'card->vcs' [r]
Date: Fri, 28 Jan 2022 10:26:24 +0800
Message-ID: <202201281034.LXEsD9tV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2356731743491598527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   626b2dda7651a7c766108db4cdc0825db05b980d
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-m031-20220124 (https://download.01.org/0day-ci/arch=
ive/20220128/202201281034.LXEsD9tV-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/atm/idt77252.c:1292 idt77252_rx_raw() warn: potential spectre issue=
 'card->vcs' [r]
drivers/atm/idt77252.c:1293 idt77252_rx_raw() warn: possible spectre second=
 half.  'vc'

Old smatch warnings:
drivers/atm/idt77252.c:991 init_rsq() warn: argument 3 to %lx specifier is =
cast from pointer

vim +1292 drivers/atm/idt77252.c

^1da177e4c3f415 Linus Torvalds             2005-04-16  1285  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1286  		if (vpi >=3D=
 (1<<card->vpibits) || vci >=3D (1<<card->vcibits)) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1287  			RPRINTK("%s=
: SDU received for out-of-range vc %u.%u\n",
^1da177e4c3f415 Linus Torvalds             2005-04-16  1288  				card->name=
, vpi, vci);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1289  			goto drop;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1290  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1291  =

^1da177e4c3f415 Linus Torvalds             2005-04-16 @1292  		vc =3D card-=
>vcs[VPCI2VC(card, vpi, vci)];
^1da177e4c3f415 Linus Torvalds             2005-04-16 @1293  		if (!vc || !=
test_bit(VCF_RX, &vc->flags)) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1294  			RPRINTK("%s=
: SDU received on non RX vc %u.%u\n",
^1da177e4c3f415 Linus Torvalds             2005-04-16  1295  				card->name=
, vpi, vci);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1296  			goto drop;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1297  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1298  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1299  		vcc =3D vc->=
rx_vcc;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1300  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1301  		if (vcc->qos=
.aal !=3D ATM_AAL0) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1302  			RPRINTK("%s=
: raw cell for non AAL0 vc %u.%u\n",
^1da177e4c3f415 Linus Torvalds             2005-04-16  1303  				card->name=
, vpi, vci);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1304  			atomic_inc(=
&vcc->stats->rx_drop);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1305  			goto drop;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1306  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1307  	=

^1da177e4c3f415 Linus Torvalds             2005-04-16  1308  		if ((sb =3D =
dev_alloc_skb(64)) =3D=3D NULL) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1309  			printk("%s:=
 Can't allocate buffers for AAL0.\n",
^1da177e4c3f415 Linus Torvalds             2005-04-16  1310  			       card=
->name);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1311  			atomic_inc(=
&vcc->stats->rx_err);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1312  			goto drop;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1313  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1314  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1315  		if (!atm_cha=
rge(vcc, sb->truesize)) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1316  			RXPRINTK("%=
s: atm_charge() dropped AAL0 packets.\n",
^1da177e4c3f415 Linus Torvalds             2005-04-16  1317  				 card->nam=
e);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1318  			dev_kfree_s=
kb(sb);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1319  			goto drop;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1320  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1321  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1322  		*((u32 *) sb=
->data) =3D header;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1323  		skb_put(sb, =
sizeof(u32));
59ae1d127ac0ae4 Johannes Berg              2017-06-16  1324  		skb_put_data=
(sb, &(queue->data[16]), ATM_CELL_PAYLOAD);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1325  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1326  		ATM_SKB(sb)-=
>vcc =3D vcc;
a61bbcf28a8cb0b Patrick McHardy            2005-08-14  1327  		__net_timest=
amp(sb);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1328  		vcc->push(vc=
c, sb);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1329  		atomic_inc(&=
vcc->stats->rx);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1330  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1331  drop:
^1da177e4c3f415 Linus Torvalds             2005-04-16  1332  		skb_pull(que=
ue, 64);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1333  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1334  		head =3D IDT=
77252_PRV_PADDR(queue)
^1da177e4c3f415 Linus Torvalds             2005-04-16  1335  					+ (queue-=
>data - queue->head - 16);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1336  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1337  		if (queue->l=
en < 128) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1338  			struct sk_b=
uff *next;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1339  			u32 handle;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1340  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1341  			head =3D le=
32_to_cpu(*(u32 *) &queue->data[0]);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1342  			handle =3D =
le32_to_cpu(*(u32 *) &queue->data[4]);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1343  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1344  			next =3D sb=
_pool_skb(card, handle);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1345  			recycle_rx_=
skb(card, queue);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1346  =

^1da177e4c3f415 Linus Torvalds             2005-04-16  1347  			if (next) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1348  				card->raw_=
cell_head =3D next;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1349  				queue =3D =
card->raw_cell_head;
ede58ef28e105de chas williams - CONTRACTOR 2015-01-16  1350  				dma_sync_s=
ingle_for_cpu(&card->pcidev->dev,
^1da177e4c3f415 Linus Torvalds             2005-04-16  1351  							IDT7725=
2_PRV_PADDR(queue),
4305b541357ddbd Arnaldo Carvalho de Melo   2007-04-19  1352  							(skb_en=
d_pointer(queue) -
4305b541357ddbd Arnaldo Carvalho de Melo   2007-04-19  1353  							 queue-=
>data),
ede58ef28e105de chas williams - CONTRACTOR 2015-01-16  1354  							DMA_FRO=
M_DEVICE);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1355  			} else {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1356  				card->raw_=
cell_head =3D NULL;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1357  				printk("%s=
: raw cell queue overrun\n",
^1da177e4c3f415 Linus Torvalds             2005-04-16  1358  				       car=
d->name);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1359  				break;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1360  			}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1361  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1362  	}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1363  }
^1da177e4c3f415 Linus Torvalds             2005-04-16  1364  =


:::::: The code at line 1292 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2356731743491598527==--

