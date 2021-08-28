Content-Type: multipart/mixed; boundary="===============1544401530196519088=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1799:9: sparse: sparse: context imbalance in 'netxen_process_cmd_ring' - wrong count at exit
Date: Sat, 28 Aug 2021 21:20:48 +0800
Message-ID: <202108282131.JvAYs0ia-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1544401530196519088==
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
head:   64b4fc45bea6f4faa843d2f97ff51665280efee1
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: powerpc64-randconfig-s031-20210826 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-348-gf0e6938b-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd991bb1c8da842a2a0b9dc83b1005e655783f861
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d991bb1c8da842a2a0b9dc83b1005e655783f861
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:571:25: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:574:38: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:573:31: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:573:62: sparse: spa=
rse: incorrect type in initializer (different base types) @@     expected r=
estricted __le32 [usertype] offs @@     got unsigned int @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:573:62: sparse:    =
 expected restricted __le32 [usertype] offs
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:573:62: sparse:    =
 got unsigned int
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:575:35: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:577:21: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:578:66: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:601:54: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:601:64: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:601:20: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:615:22: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:627:63: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:627:26: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:626:20: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:633:18: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:633:55: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:632:16: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:636:21: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:636:50: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:650:22: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:662:63: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:662:26: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:661:20: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:668:18: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:668:55: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:667:16: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:670:21: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:670:50: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:697:55: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:697:65: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:697:20: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:703:25: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:710:38: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:709:24: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:709:22: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected re=
stricted __le32 [usertype] offs @@     got unsigned int @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:709:22: sparse:    =
 expected restricted __le32 [usertype] offs
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:709:22: sparse:    =
 got unsigned int
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:711:25: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:712:32: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:717:33: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:718:62: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:766:19: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:766:19: sparse: spa=
rse: incorrect type in initializer (different base types) @@     expected i=
nt idx @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:766:19: sparse:    =
 expected int idx
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:766:19: sparse:    =
 got restricted __le32 [usertype]
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:777:26: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:776:16: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:776:14: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected re=
stricted __le32 [usertype] offs @@     got unsigned int @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:776:14: sparse:    =
 expected restricted __le32 [usertype] offs
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:776:14: sparse:    =
 got unsigned int
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:779:48: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:788:22: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] offs @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:788:22: sparse:    =
 expected unsigned int [usertype] offs
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:788:22: sparse:    =
 got restricted __le32 [usertype]
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:801:22: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] offs @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:801:22: sparse:    =
 expected unsigned int [usertype] offs
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:801:22: sparse:    =
 got restricted __le32 [usertype]
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:833:38: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:834:33: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:847:33: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:847:24: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:847:48: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:847:45: sparse: spa=
rse: incorrect type in return expression (different base types) @@     expe=
cted restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:847:45: sparse:    =
 expected restricted __le32
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:847:45: sparse:    =
 got unsigned int
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:860:28: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:862:25: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:862:45: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:863:58: sparse: spa=
rse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:862:70: sparse: spa=
rse: incorrect type in return expression (different base types) @@     expe=
cted restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:862:70: sparse:    =
 expected restricted __le32
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:862:70: sparse:    =
 got unsigned int
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:911:21: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] val @@     got restricted __le32 @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:911:21: sparse:    =
 expected unsigned int [usertype] val
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:911:21: sparse:    =
 got restricted __le32
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:999:72: sparse: spa=
rse: incorrect type in argument 3 (different base types) @@     expected un=
signed long long [usertype] @@     got restricted __le64 [assigned] [userty=
pe] data @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:999:72: sparse:    =
 expected unsigned long long [usertype]
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:999:72: sparse:    =
 got restricted __le64 [assigned] [usertype] data
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1014:60: sparse: sp=
arse: incorrect type in argument 3 (different base types) @@     expected u=
nsigned long long [usertype] @@     got restricted __le64 [assigned] [usert=
ype] data @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1014:60: sparse:   =
  expected unsigned long long [usertype]
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1014:60: sparse:   =
  got restricted __le64 [assigned] [usertype] data
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1025:60: sparse: sp=
arse: incorrect type in argument 3 (different base types) @@     expected u=
nsigned long long [usertype] @@     got restricted __le64 [assigned] [usert=
ype] data @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1025:60: sparse:   =
  expected unsigned long long [usertype]
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1025:60: sparse:   =
  got restricted __le64 [assigned] [usertype] data
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1099:23: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1099:23: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1099:23: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1123:24: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1123:24: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1123:24: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1123:22: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected r=
estricted __le32 [addressable] [usertype] flash_fw_ver @@     got unsigned =
int @@
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1123:22: sparse:   =
  expected restricted __le32 [addressable] [usertype] flash_fw_ver
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1123:22: sparse:   =
  got unsigned int
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1127:46: sparse: sp=
arse: restricted __le32 degrades to integer
   drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1139:21: sparse: sp=
arse: restricted __le32 degrades to integer
>> drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1799:9: sparse: spa=
rse: context imbalance in 'netxen_process_cmd_ring' - wrong count at exit
>> drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c:1905:20: sparse: sp=
arse: context imbalance in 'netxen_post_rx_buffers_nodb' - wrong count at e=
xit

vim +/netxen_process_cmd_ring +1799 drivers/net/ethernet/qlogic/netxen/netx=
en_nic_init.c

3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1733  =

3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1734  /* Process Command status ring */
05aaa02d799e8e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1735  int netxen_process_cmd_ring(struct netxen_a=
dapter *adapter)
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1736  {
d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1737  	u32 sw_consumer, hw_consumer;
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1738  	int count =3D 0, i;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1739  	struct netxen_cmd_buffer *buffer;
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1740  	struct pci_dev *pdev =3D adapter->pdev;
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1741  	struct net_device *netdev =3D adapter->net=
dev;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1742  	struct netxen_skb_frag *frag;
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1743  	int done =3D 0;
4ea528a151549d drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-28  1744  	struct nx_host_tx_ring *tx_ring =3D adapte=
r->tx_ring;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1745  =

240b23c4269777 drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Tony Ca=
muso          2015-05-06  1746  	if (!spin_trylock_bh(&adapter->tx_clean_lo=
ck))
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1747  		return 1;
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1748  =

d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1749  	sw_consumer =3D tx_ring->sw_consumer;
d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1750  	hw_consumer =3D le32_to_cpu(*(tx_ring->hw_=
consumer));
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1751  =

d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1752  	while (sw_consumer !=3D hw_consumer) {
d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1753  		buffer =3D &tx_ring->cmd_buf_arr[sw_consu=
mer];
53a01e00f8c78b drivers/net/netxen/netxen_nic_init.c                 dhananj=
ay(a)netxen.com 2007-12-26  1754  		if (buffer->skb) {
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1755  			frag =3D &buffer->frag_array[0];
297af515d75f5c drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Christo=
phe JAILLET   2021-01-13  1756  			dma_unmap_single(&pdev->dev, frag->dma, =
frag->length,
297af515d75f5c drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Christo=
phe JAILLET   2021-01-13  1757  					 DMA_TO_DEVICE);
96acb6eb8effe7 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2007-07-02  1758  			frag->dma =3D 0ULL;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1759  			for (i =3D 1; i < buffer->frag_count; i+=
+) {
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1760  				frag++;	/* Get the next frag */
297af515d75f5c drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Christo=
phe JAILLET   2021-01-13  1761  				dma_unmap_page(&pdev->dev, frag->dma,
297af515d75f5c drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Christo=
phe JAILLET   2021-01-13  1762  					       frag->length, DMA_TO_DEVICE);
96acb6eb8effe7 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2007-07-02  1763  				frag->dma =3D 0ULL;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1764  			}
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1765  =

ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1766  			adapter->stats.xmitfinished++;
53a01e00f8c78b drivers/net/netxen/netxen_nic_init.c                 dhananj=
ay(a)netxen.com 2007-12-26  1767  			dev_kfree_skb_any(buffer->skb);
53a01e00f8c78b drivers/net/netxen/netxen_nic_init.c                 dhananj=
ay(a)netxen.com 2007-12-26  1768  			buffer->skb =3D NULL;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1769  		}
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1770  =

d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1771  		sw_consumer =3D get_next_index(sw_consume=
r, tx_ring->num_desc);
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1772  		if (++count >=3D MAX_STATUS_HANDLE)
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1773  			break;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1774  	}
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1775  =

d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1776  	tx_ring->sw_consumer =3D sw_consumer;
22527864ed7ee6 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-05-05  1777  =

9295f940fb677b drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Manish =
Chopra        2014-09-30  1778  	if (count && netif_running(netdev)) {
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1779  		smp_mb();
cb2107be43d2fc drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-06-17  1780  =

7a9905e64272c8 drivers/net/netxen/netxen_nic_init.c                 Rajesh =
Borundia      2010-10-18  1781  		if (netif_queue_stopped(netdev) && netif_=
carrier_ok(netdev))
7a9905e64272c8 drivers/net/netxen/netxen_nic_init.c                 Rajesh =
Borundia      2010-10-18  1782  			if (netxen_tx_avail(tx_ring) > TX_STOP_T=
HRESH)
ba53e6b4878e07 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-03-17  1783  				netif_wake_queue(netdev);
74c520da5414d1 drivers/net/netxen/netxen_nic_init.c                 Amit Ku=
mar Salecha   2009-09-11  1784  		adapter->tx_timeo_cnt =3D 0;
74c520da5414d1 drivers/net/netxen/netxen_nic_init.c                 Amit Ku=
mar Salecha   2009-09-11  1785  	}
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1786  	/*
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1787  	 * If everything is freed up to consumer t=
hen check if the ring is full
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1788  	 * If the ring is full then check if more =
needs to be freed and
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1789  	 * schedule the call back again.
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1790  	 *
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1791  	 * This happens when there are 2 CPUs. One=
 could be freeing and the
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1792  	 * other filling it. If the ring is full w=
hen we get out of here and
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1793  	 * the card has already interrupted the ho=
st then the host can miss the
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1794  	 * interrupt.
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1795  	 *
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1796  	 * There is still a possible race conditio=
n and the host could miss an
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1797  	 * interrupt. The card has to take care of=
 this.
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1798  	 */
d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07 @1799  	hw_consumer =3D le32_to_cpu(*(tx_ring->hw_=
consumer));
d877f1e344f551 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-04-07  1800  	done =3D (sw_consumer =3D=3D hw_consumer);
240b23c4269777 drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c Tony Ca=
muso          2015-05-06  1801  	spin_unlock_bh(&adapter->tx_clean_lock);
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1802  =

807540baae406c drivers/net/netxen/netxen_nic_init.c                 Eric Du=
mazet         2010-09-23  1803  	return done;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1804  }
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1805  =

becf46a012db66 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-09  1806  void
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1807  netxen_post_rx_buffers(struct netxen_adapte=
r *adapter, u32 ringid,
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1808  	struct nx_host_rds_ring *rds_ring)
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1809  {
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1810  	struct rcv_desc *pdesc;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1811  	struct netxen_rx_buffer *buffer;
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1812  	int producer, count =3D 0;
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1813  	netxen_ctx_msg msg =3D 0;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1814  	struct list_head *head;
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1815  =

48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1816  	producer =3D rds_ring->producer;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1817  =

d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1818  	head =3D &rds_ring->free_list;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1819  	while (!list_empty(head)) {
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1820  =

d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1821  		buffer =3D list_entry(head->next, struct =
netxen_rx_buffer, list);
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1822  =

d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1823  		if (!buffer->skb) {
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1824  			if (netxen_alloc_rx_skb(adapter, rds_rin=
g, buffer))
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1825  				break;
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1826  		}
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1827  =

6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1828  		count++;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1829  		list_del(&buffer->list);
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1830  =

ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1831  		/* make a rcv descriptor  */
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1832  		pdesc =3D &rds_ring->desc_head[producer];
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1833  		pdesc->addr_buffer =3D cpu_to_le64(buffer=
->dma);
ed33ebe464d973 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-18  1834  		pdesc->reference_handle =3D cpu_to_le16(b=
uffer->ref_handle);
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1835  		pdesc->buffer_length =3D cpu_to_le32(rds_=
ring->dma_size);
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1836  =

438627c77b877e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1837  		producer =3D get_next_index(producer, rds=
_ring->num_desc);
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1838  	}
9b3ef55c6ddbe8 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1839  =

ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1840  	if (count) {
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1841  		rds_ring->producer =3D producer;
195c5f98294078 drivers/net/netxen/netxen_nic_init.c                 Amit Ku=
mar Salecha   2009-09-05  1842  		NXWRIO(adapter, rds_ring->crb_rcv_produce=
r,
438627c77b877e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1843  				(producer-1) & (rds_ring->num_desc-1));
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1844  =

4f96b988e8d404 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-07-26  1845  		if (NX_IS_REVISION_P2(adapter->ahw.revisi=
on_id)) {
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1846  			/*
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1847  			 * Write a doorbell msg to tell phanmon =
of change in
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1848  			 * receive ring producer
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1849  			 * Only for firmware version < 4.0.0
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1850  			 */
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1851  			netxen_set_msg_peg_id(msg, NETXEN_RCV_PE=
G_DB_ID);
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1852  			netxen_set_msg_privid(msg);
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1853  			netxen_set_msg_count(msg,
438627c77b877e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1854  					     ((producer - 1) &
438627c77b877e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1855  					      (rds_ring->num_desc - 1)));
3176ff3ee71bdd drivers/net/netxen/netxen_nic_init.c                 Mithles=
h Thukral     2007-04-20  1856  			netxen_set_msg_ctxid(msg, adapter->portn=
um);
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1857  			netxen_set_msg_opcode(msg, NETXEN_RCV_PR=
ODUCER(ringid));
f03b0ebd8e7132 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-10-13  1858  			NXWRIO(adapter, DB_NORMALIZE(adapter,
f03b0ebd8e7132 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-10-13  1859  					NETXEN_RCV_PRODUCER_OFFSET), msg);
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1860  		}
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1861  	}
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1862  }
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1863  =

becf46a012db66 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-09  1864  static void
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1865  netxen_post_rx_buffers_nodb(struct netxen_a=
dapter *adapter,
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1866  		struct nx_host_rds_ring *rds_ring)
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1867  {
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1868  	struct rcv_desc *pdesc;
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1869  	struct netxen_rx_buffer *buffer;
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1870  	int producer, count =3D 0;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1871  	struct list_head *head;
ed25ffa1643472 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-04  1872  =

d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1873  	if (!spin_trylock(&rds_ring->lock))
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1874  		return;
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1875  =

2227bae22becb8 drivers/net/netxen/netxen_nic_init.c                 Amit Ku=
mar Salecha   2010-06-13  1876  	producer =3D rds_ring->producer;
2227bae22becb8 drivers/net/netxen/netxen_nic_init.c                 Amit Ku=
mar Salecha   2010-06-13  1877  =

d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1878  	head =3D &rds_ring->free_list;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1879  	while (!list_empty(head)) {
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1880  =

d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1881  		buffer =3D list_entry(head->next, struct =
netxen_rx_buffer, list);
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1882  =

d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1883  		if (!buffer->skb) {
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1884  			if (netxen_alloc_rx_skb(adapter, rds_rin=
g, buffer))
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1885  				break;
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1886  		}
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1887  =

6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1888  		count++;
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1889  		list_del(&buffer->list);
d9e651bc06690c drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1890  =

3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1891  		/* make a rcv descriptor  */
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1892  		pdesc =3D &rds_ring->desc_head[producer];
ed33ebe464d973 drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-12-18  1893  		pdesc->reference_handle =3D cpu_to_le16(b=
uffer->ref_handle);
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1894  		pdesc->buffer_length =3D cpu_to_le32(rds_=
ring->dma_size);
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1895  		pdesc->addr_buffer =3D cpu_to_le64(buffer=
->dma);
6f70340698333f drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-01-14  1896  =

438627c77b877e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1897  		producer =3D get_next_index(producer, rds=
_ring->num_desc);
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1898  	}
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1899  =

3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1900  	if (count) {
48bfd1e0fc66b2 drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2008-07-21  1901  		rds_ring->producer =3D producer;
195c5f98294078 drivers/net/netxen/netxen_nic_init.c                 Amit Ku=
mar Salecha   2009-09-05  1902  		NXWRIO(adapter, rds_ring->crb_rcv_produce=
r,
438627c77b877e drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13  1903  				(producer - 1) & (rds_ring->num_desc - =
1));
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1904  	}
d8b100c5da003b drivers/net/netxen/netxen_nic_init.c                 Dhananj=
ay Phadke     2009-03-13 @1905  	spin_unlock(&rds_ring->lock);
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1906  }
3d396eb17e9f8c drivers/net/netxen/netxen_nic_init.c                 Amit S.=
 Kale         2006-10-21  1907  =


:::::: The code at line 1799 was first introduced by commit
:::::: d877f1e344f5515988d9dcd6db5d4285911778a3 netxen: refactor transmit c=
ode

:::::: TO: Dhananjay Phadke <dhananjay@netxen.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1544401530196519088==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
EATWWze//SDd+P2fm8cffzx+hTcUv8+of788//sLGcL/UoSCPmwXZevfWVG2FIFZZI6jxsMFFYLs
2NbEV+1mFMRtg5rdU3aXVv2wk+QpvAsS1XxKFoMAUjHCnqVrEs/yvjjUNLCNfM8qsfsSj/gnwbhj
UQ1A9HpGuctmUNtE+cGx8GWScqtc4zyOcqkmpO8geX2QJu3hWCZ1plnA6dSsNMo15ZGVpNXZJVBE
07qac3Vgf/rshRF2qgrM27wiYl9uzbJNHfxtCV0v5ANjnifGs6WkIfANxauGMHD0M6c6B95o+nzE
TSyohGLKvqaoDYzWXi6t9iqDMi/Y0yMqQdOEH7fCV21FZp8+0VYTzpDyRr3UYN74NUfRAOgK9NaD
sm7dUS5m76aOp7lLoPwj2cjvCnzXSUV3NeRK72uPVShTPyHpLmbvXeHj10SUf1/fnchWVD/p6H3E
tGsrfdcY75h4wIQ7AKOLlTFeJCAuFXb8ARzVOQWllvoCjWUbG2YLxOBUNPX8b6LpPz98h5X0d6YC
PczvC1HVZ0iafsrP656sef/GNMP5Y24VlpdYk5qp1c+kjjUuInCyg69C1M0/0RS1bTO7F9dsifjt
zJolH0wrhWjKhDJVSS+8aM0uKLk/pyi9KtqCMgSXyaLjf3j+JCcHtHztE/Lzpnp4gz5MN00WeT1D
g3/pFZ+NrRhxi5gudj3NHRywh2MYGz6uwD2FG+qulmgK2mvMhQuvD7MedQtJMWNB/2VOv4RzSEI1
6WAcX7palyGBbiHm+NOxlwopo6Y7fS3m1/xy8U1uTDk+1kQiDrnr5dibEiYXgIzyrML0z5nZSqMZ
aHOQOzmd3YCrA7Tz2tjUxOw+wlRBQFxrBOrW4PZUt7nuRnsB9Xsi4F38opdg4L4Rrj2U2Tur3UKC
RAkk/+71xdJechPeJ+PsLNso8uypG9BLyaXdBNc+M1G8dZ6J8q3lTDbMPWDnyGfMmwL5X6q5m+Ex
ewNGr2MytlbHZOzbqdZsHWg3Ej1y2hf4PncFGIcdu7XWRGECQEPW1aK+lxsI1FHHM1RtKBRpoSQw
2ZaFq/MUofVLCVzSNbprr4U79Xe6fif6q8P7Odxo8iYOOIsrGm12nammdyf9h0S3DTztNO1TOyr6
wHLkAoHK2xcNrtwxgIFFBL12QiCGEEDV3kHOTHg6qgfobygXrnms9AMMUFznpnytnxrKxTRufpaN
oodLOnqbNi2L/R4u3rUJY1o4xx7BB6U4xFS9mVJL/QABa8A+If/s24NeE/pMqmhanIFftdPhThH4
zIH+pppxR6qYgRc0l6hprJ+2ry/vL19evs/qnaLMkT/S02uxxcs8cEa9nqVTr+navIbb5D6psMY4
9lz9yQ/hnJ9Zofd82O+35RCWkr8/QYisbdMBCcDpP3+ZK2zcyU81mBA71G37JT2soeFDMgDBZe4t
va9D6sJhqA2vnPHMk8+A1uz/gli4D+8vr+qJ89CSwr18+S8kRPxApLYfRRDJh3+TLtKnTHCnI/Lu
iGDnrEvBP1ageqeTPgJ3uOjYkHC6+Sonlw2R07rYebiK5O8UJW4jxnFUG279Tr4dWeI6z4zp0DWn
lrsZJHTh8obDw73I/kQ+E83LISXyPzwLgbHkmYytYwkuqlbOENtk3OAidwVV+KKw8HeVHUX4jF4g
WRKBufWpNacED2QDTQSPGYJY8UqIKm0dt7ci8bJP4QoiUuaqnL6oD7yp00ofbV80CV05Q7U3lbNN
ykr0ZLNw9BbDC6K7jSxfLUyT5qXoX2Gt2OpAsNceFq+paEyE1vHATBMOV0bNjMK3tDIKf1O5jjDY
/NoaLVQAaXbQa8vCLYb+uHyBpfeHmjktM8Jqjaha2e31rOre+UA+7VVM0ruheQ7u8o5oJdPu4Gm8
3a7ZqcfWCgaUaP86JDRDdNa+C58eMff9jijtVYHvvtbZlkZ2pHn/vWIqMj7MjVSCySjcdyhLaUeW
0beHt5ufT89f3l+/YyeM6+xU3YSrrbM3XfrwqC5KwjCOzQN7A5pnJZeguSFWoObcTE3wg+nFV3qA
A+I7ZrWEuIdDNUHceYWK+2C+cfDRPgk+WuXgo1l/dNhcWZc34BXhsQGTDwI18W5knJuYB2z3OTG3
CQF8sDG8j9bR+2C/eh/N+IMDz/vg3PXSj1Yk/+B48q408gbcXeuN+npK/TF0rOttArDgepNQ2HUh
RWChc73dKOx6vwLM/VDZQh+/JJRh0fVBR2FmTWmGuR+YpbSmH+qF0PlITUcprXmvpFs31WSYlYN5
BYc74iuqCXLWpmLgLKtP4+iKZJ5vgR3z8JpRVwbhfGPsmTtwRn0kreM1wUJRVWtfGYFDMRUNjVpr
2HEsh2DY5mK9hS4z80BZgUQN/yCyLzPz8s6naZ5CG3LUvPlHKhTsPoq0zYKPQ14RQ3w5hQ5mZqaP
X58ehsf/QhTROZ28qAfRpnrVt4dbdHM4OKHGcG+DhMEVYUEh5mFbDZF9ZYcGEMc8XqG4trkDqyEI
r2hnALmi2wIkvlYWUulrZYns4FoqkR1ea12yv7kOuaIYEohvB4ZpTqrsxiF/1qUdb8qnYIadqIMu
7b2wtJHTCsqILWxEDlV7DnXX8et6cXcqqN+XE/ZcBnbewpXiTJj2ST/QwN1lURXDf3x7fW/W7CV7
xOWToruDsxORMaWCNfhKms62RJ0P6CRqlYyha23m448/Xl7/ufnx8PPn49cbem6gzGz6XUgWN+Xq
mnIMdhSMr7cg5fiGEyKG0tpSUHZHUtnlXXcPt+UjfuNBgZjNqIoYD73B9pTBmHWpZgwspgdKaxmf
lVNEdklaXPxTdl4YzMsYQjcwyZCY4KZHKdR+gH+kJ/XIWEKMVBm7k6/2KRmMBXQpHstLpnxQNNgr
asqiseTOqfKJyb/CAtA8SmfzYRcFfTgq6VZtGuksMBlAf7vO+KNh8OjsN5mzmwoepl3tZp2VJJsP
ksmbxNW8t6TMPqkSP3OIwGt2+OU/g9G7XAO/hluiLsdtSRjEWD8iL2kMHV3P9fd9KgY9pWS9w4WN
bWv2MwyhuI0T+UbzSIo4g0//esAvjRlijHzsgQBlXtIMzMqUmrFo371BNrAbYANfcxfMJGyVTXv5
gmtdjrXLxPoagVIf//758PxVOqFkyWet70eRrtJJVssr3eEyMSttdf2yMKoz4lTR3wybO/DgyFWb
eKbDF4aJB6BQKyvbdB/5oVyWoS1SJxJ9xi7DLZaHG2d9KbUqW7T32dXW7orP+MsItnhloeU7kVKY
XUZqZlcXzIk5W5yS2PJ9qW6fkvrzNAylkhyzs9eK9NaNPReR6FHoGgV6FPqBdvbICuE6EohqLg8b
9TKMSZbSiWSDXbEvwbVgFKh9CYwo0C42lB/bcjFmsqOmd1eNJlHFnGfiM1YdI/N7r+Lq2GHPsLRj
Z4hGZL0syeqN347Ps8LILKYCgvagu4QFkjOM40nN12VkhbdH4apcreVqSnKl9kTRtTXnf8tQcu3Y
pMAxEWVSDVLXjdDHKayqRd/0nVTJsQOP1C5fSaQytDbnp9f3Xw/fZW1e6uTDgazNyYB6jGWlbNLb
k2CAgCa8fHOxlz2F/e//eZqN2TdrnRU123DTWA8NJyU3TtY7XiRMBu4rjVbFf21fMAV4Q8i66sbp
DwU6mZAa8TXtvz/896NYSWpQNEGUlkqoIqP30hvplQFVt/ATBBGDraMCQnSLK36MSxQB42DGKzxC
sAQQPhVjyIgsTKiICH2xXZeok5h5goiK8GJJ5hI8K9RcV4mYa0WPct4JsMixhbMNcdSs5xPg32Hq
8l6MRc6RyR44dQLdbTOHg62pdo8rA6U9LIo75FVRby4osJMcHi2cZsgc+O+QdNpKghcDAhh05rk8
llmesB9XwfS570frUJKmjn1HV0g4sNIdTHKwuapXcYsHiSuFUnc8KhetIF447bu2LgcPBzRgm2D1
yDLguFfz6FMHf4pYg5sIKSPh+/7UtuW9WldGV+0ecRiNCo/DIDIsQLHlbz7tSLJ02iUDWRmEgjCt
i3BgfcQlB0Mo6a+AgQwMbfZg9AmxhGHHZIkBAebSTEk6RLHnY/r9AkkvjsWffy50EGaBhSVqEIUC
BJOEAsDBUi/zQzPlZ2xdWSD9jndeMreCQKySOtmISh67Oxhu2HhbywfBMDj9mxopzj0lUqNo2p/y
cjokp0OOZQbxCkJLY3AggTD3xgLE4X3gL1UnO0kyAFxX5ZBvothCGLA5ckKcHkUqXZTVK3pwA18Y
eBsn9ezAwR4ELxDm5JWGERxtL+CdPHDFl7ZjIidGakb61rN9pJUoI0bSAobjh1g1gBW62B6SQ/i6
7PxIk50fRxpGIG6Z1sFd7VwP8/+/ANhWk89uGTZ0XLJ1yrMRdlNm+6I/qsXpBiI5fLQ0RFq7+L5l
mwqITFeblx0vmJo3i+NY8Nde+0NgR/JMpAJc+jmdC+HomBHnV7DSQxrmYfbhnexVMHfT4J++hwhJ
Lh8+hKN7WrpweLJxKoiZhFRcRPhYosAI9KliwY0EhGvjqdp8VCmOETuCA6iVMYSjeE7Fs1z0koBH
eLYmVU907SKwAkxCCohQl2qINeZxQEsB5qoYOYWzfIQxFtM+gUgPNdmslmjp9bdbK2QYW80zvBmx
g/jqZ9xHJEOk5K+k6KaUuYDRcNv+hJUx6wPN5f+GsLVPBRcIPfkzFLHwb8E5M1YAiPg4mr7dh74b
+j327QF/PDhz5xAxcxAz5eP9QPb1J7KbyHFH73MWpW9HfaW2K2E4luwxeGYRJUrntHJFmAY1u3gT
wzAtvGNxDGzXNNGKXZXkaMEIp81xH8wzAG7fZrGqfP0p1QS0YGwinTvbcVDpQDZueXLAPe/OCLpY
IdOVMRApNTPERxUyU3x2xjNjZLIzhoMyiIKBiihgObZpAFOEo0nV0dTZcwK8JSnLtIrQWFm4OAUW
Gv+LBwRW4Os+DmzTSkMRAbr4AUtjuMJBXFuydEQhLtowhBcExuWVItxYbW7K8JAOogwfGSiUESOD
kpUQG1tV2rqWg3bLkAa+Zyg4UfQcNwrwLs3rvWPvqlTdz8rILiQSy1VLRuSj8CJ5GWlVgIDLClsl
CRXHYoO7wnQOQo0waoTmFqG5Rei4JXTzwCur2CROCRubu1Xs4rnFvuOaepMiPFyWUJZJltRDyk6O
i37gwyet/HQg+3SkvMCILURhnd/WYMWp+8S9ohw0aTq1kda5+7wywK1nzOlQbSV5+Z1xOBn0VCcI
NIwQ7fRdDkbAOgfYM6ZNpq4PNPEVZiWhbyf3Xs2arKRTut+3qFpS1H176qai7VuTalF0ru9gqiVh
BJaGEVkB0olF1/a+Z2Gf9GUQ2S464xzfwpqVroLobBxSN7KRKQ3S3Xex7OcFBSkyWyw03zhW6OJi
l3B8/BsidyO8bK7nYbsZOCgJIny5akkLaFzfrIM1CANvQN/gL5AxJysmkvOd7/WfbCtKHCzzfmiz
LA1Mw5KsCJ7lYToF4fhuECKr3CnNYsHZL89wLHRRHbM2t41L8ueS1BBJtL1UOg2Wt8fTH8KurYFc
uKug3YCak618sudD5QRhGHUGwnf/VmtHyCkqwfX+PRdETrYly2WtynJsCzsF5RABnN0iJar61Asr
G1ur+mHo0VnTV1UQoOcNqe1EWaQ7yOjDCD3BERAhvqMnNYiubCeLOnEsjXMsDqKJJrMCXFS4Dmno
YQUbjlWqeQi4QqrWtkyTgQIQ1YTS0bYkHM8yDUAAoNWoWt9GR9G5SIIoMO8/z0PkaE7zFsglcsPQ
xZ31b4jIztSyASO2M6xwlOVg1jMCAmlDSkfnMOOAtAEjbHPSJVkjBkTHYKxAciO2MBVTGmWwDRDO
3LamVRHfsqDqmhS5mpGmOh/gShO/Bpox9L4TotVjqsQCyqu8O+Q1xNqbr/gm+nxmqvr/WDIYL9/U
7LEiXrpiSHY0smDRamK3ztAs3yencpgOzZmUOm+nS9FrolIjX+zhkIrGiDPUk/8AQj3C6ZFoSL0g
9Umi0I+VF5Dga47+ZSimvnhpe1pQaE5Zft53+R2GUbr8xOI8qj05m+LPVOqWDRmE4EbXVBTCj6rK
CLl1jWzqb8WI6Ns86YwIMFa+DiBj31yU26K7vTRNZm78ZrHL0QBmt4z6zmHuQrjWZhawz++P32/A
J+gPIbIlZSZpW9wQAeJ61ohgVssQM26LKoplRdPZvb48fP3y8gPNZC4/eKwIbdvYCLNXCzOGGY9c
S4fsMK9Cek33zxXW1opWa3j8++GNNMrb++uvH9TlkaHyQzH1TWrM7Xp6zJTw4cfbr+e/TJmxp6XG
zHSpLIONN0WQRtzdr4fvpFHwvp6T12K2Qq7v/sxzuEOn1cxWQ9YsFCma3Equm0ty35wGhMXC+NAg
G1New7qUIaimhRjfRZVDIlwcoxXQ3/d7YS2j7XJ5eP/y7evLXzft6+P704/Hl1/vN4cX0iTPL2Lf
rem0XT5nAyJfn2DGovxmyiVjsx+QBpqvSFFO7IdjddrzvE1+wTWMs7I08sn3kYSp4HJ1DAdhMCNj
pBQCgwXMhgjlaVLi42c7wcQKLtvNGCo3R5hTi/q5KDqwt8NKSxl9a8572YOaUavT3hEv5gbsq9gJ
rCugIba7Cjbm13F9UsVX8mQvdzxT+y0ecbFm2g+XbLDsK2WZHaYbR+AFTZ95sTWnTh13GhFtPXqW
FZlBc+wGM4hoNt1wBbOYJZib5FSPV9JZInCZ0yEbPtJCI7isNSPZG6VrmNDR5LjMymQM+B7hO4sZ
4jhX8iD6I5EbmcahfTWGp7KV+UvL5sMJz7kZIbKiLtV+gCd9V6pOndwbIdTJky4P5nz3MO525kQY
7gokK5Ihv70yXteojkbY/NjxypBlfqC0lVv43edEB5mf5BqGTj/AK0Ub7cBVozAXc8hs+6pEA73D
iFje2pkKm5RFFdqWDU0i7P1THwY4OjyLwLWsvN/N3ywigz5oktOZH6BoW5youB6d/Ho+1bYNfPpm
2QQILTcyzMRDSxRIHfuQ7/VToYVGUlpp40OkkkDXikSJu83FJlxJ60Z/0eLcSFAYpsSxtdmeqhLt
8eWN07//eHh7/LppZ+nD61dOKSOINkW01mwQPbaT/m+bvi92QrzZfidCyCjlgyHSr9Li2FAbX+Tr
hSsTIbae/NU2WAUINiUJgIXMg/RpVG08dxEk5zFz5df420hL0OIBQ+kI6vD3z1/PX96fXp7nqHqq
GV61z5ToFUDDjJwFAPXMTEpKNkdaDJh8aXykLGydJ42K7rta33ewaxr6dTI4UWjhpSc623Tqdeb/
DALxG8BVPh6zfMMcyzTjLGCAQRrcjy3+Up9SlwecIpmZOWM00bQG6OsDSqGsjKq5BOYAgjEO7dnV
EYeQHiVrvLKs/Ai7ZFm5ohOPjYx3J+vtIkW98kJXU9PwUU5y3m/pHIhzEH3TyI9mF1rgIDQXKYGt
ubQANrwJv925sWuAsHMI6mVSU8QD0VEuTXdL7e2k8ZDaoJSiRDkoAs/SBe+imNbRee2h7JGUtjNN
a6J3+kTDlSAc4FgEHlk/Wslz98zy/VFx7jkjjkT3bulA4b8DKqkQ/igY9NEi5UytgdBTgpAxu0Jo
0cBHlH/XB47U0PRtdVo1GX/cC4w1hhlHi6K2ivib2o2oTEBK1r0mYxN6tD0/xO1qZgDdImgFwmrk
j3wWYS99NzZ/O7RSI0+lRrEVIjlEsaOXLZSvsVTb+LgDMMofAhe9ul+YvNUYpS3HHxs5/0zDnraK
CAOiJul6GHNpcsIuSqSoj0YWymwkK1Pl57A0kUp2fsLnyb235smDb7n4mzjKTv3BjzDpS7m3Ee//
mpLY1lvOps9TJSgTzy68MBjRFRmzMuDZlW/ZyjdA1ClDFHB7H5Fp4igf0lcSeg/CyW70LUsfXoqm
MVSttp6nOiimtuPdx1O68kYQqAPEYnBdIvWGPtULzdUjg0ATXw7NyZWVPO4UXwrwdsW2fGwYsWct
vNkMo4SS9OM8LShUdfmndMfGjF+XUlPfEmplmEsJTXqYFcTKjgKsyIKPB47q4FRVCVs5ij5FOETE
u8JIHS6lZ7mG0UQAgeWpAC7dS2k7oSud19MBULm+q2glZNO2y7ss0UT4o5DU9aNYv8Co3i04JvWQ
I2daNumxTg4JZpBF9Tvm9UTScxlRbeOFgegwVJF0MAtP2lSVb1tSVwLNVkbkpTIuNJStX2cI20Mt
F2ema49yIej5OaupnBRwTGrshfopN6pttLy4bwwmry5epPGMQSV6c6zg4kMTSoGHyN5pxM9RwyQO
Ml+gKDKZBgMqWyXmCYKiGJ22PJ9+SZIXIi9I/bF6cuKHHXvFjxKxrrs9JlkCtuW4My76dQrPhWE9
yTHRvtx/qHNbMGr5D+ejwLhz588SD2ChoIki1mlX6nRexLfSAKVuhmJfCGEh4fSU8uBBd9MN4gfp
MXQdYekFKjuVTXBnghvgYDuJCaX1R0iLk1RkBT5MvY+/AKcYjQcwxtNFrQKu4sNMaI6tKcRT5oUx
7Qtwyag/jibAXdadacD6Pi9zMTLD5u916ff3f37y7k3mTkkqut+X+4VxkzopG7LunHUAOPEektKA
IPs/8MWEM/us07EWH4U6Pn17z7ch73JUrDLXFF9eXh/VgEXnIsubSfDIObdOQ18MlkJI1PNu00uF
TIXEZx8+Xx9fvPLp+dffNy8/YRK+ybmevZJbgzaauNBxdOj1nPS6uNwxQJKdDT4VGGZfjDnZyxR1
05HOqQ/omzoGHU616LSZFmBfJv1xKkkiaYkfRTDYpRYcQtAkd6c9GEMg1Kwiw+GgYUA/FAe+xbGW
Ffp5jRurtLvctdCjWGcqKdD0s6e/nt4fvt8MZzVlGBpVJe4GgVbn2FkBRScj6bSkJRO9/48d8Kw5
YBnrqV4cf1kO8Z3IHgqsyog+BWFHBFMAgjmVORsLfN2Q0vOCQj7THeAgfcpz8WR8nqBpwc0/vu0f
fr7/0k+zvimbQH6aPCTOaNsEgW2a58F4IVq6J0+J4SK+Ytuoov82tXy/Pzw/fH/5C5pCU9JjPhan
anabI2c8M2kASplXjTuZlA2uTTVhbUF+//bPH69PXw3lSUfHj3gLY4E8JWWfyLw+SULb9dQWmhn0
I22TLyA2QVQW7Q5+/GyjC1y3JSwQt2CQAyMzOYc2+v4cmLtTdsgHSa3YGBiNJCiRndSZD+RbOVYn
xjfITIC3JVlhMWNyyhxsMfN2cJX5D/Zfmu+zbNcVmeibZJYZpxYuYckPXC2jC+siPPTT5ixP30Wy
OlIjb3RkTaL0Kq8aPv7cxhGEtJpelZRk06f7EBP7jjjo5F5Dh6MXaMjTmRsgpHKbcsGuyeQqEa1o
n09pKh46z3O7amelSdvkiNNogUH2pYXTYXsnFTaMajKLWcy5LcjyWPStFH3BBE/JcDlpjhdmeBV4
pMnSVHNuv6Bc3/8AKPCnoi9wN1Zy8Xb5B2pDgwpP5+aELamzFkTtHhCZd4TvtJ+di5MiyE9I80MJ
8ANSxqexy/42AKjRChlDPW6kPxfWTQFjbDq2x83SCt+hMNBiKJLm+M5zRs3hi0lvabxcLDOK7ZjY
ZZRH4AZwUnluOJKe3WPSj2HWcLcIdZ4ovTI/Z/bQypJj4ZwHZOpS+3NI0tQOgCED0lQrepdb9KaR
v2BMHcPuvdNrmOAaZiAA1J4XJB0R2Q74aNsEnVxSogIfOjINz/gN9yySGo2vccaGBwqtxl//ioim
T63Gj/g82xYjq4/izq1pSK+wKjOVbG0hCH2Sd2WSmqTjfOiQO/grR3GS9H47HT6MvFJrHlppwskv
6qcz5bAP6Uz1Fmey7KBFkTTFtAPhfAVzPJuGCSCyvBxMmEVc7TOjHFpgn4xDYE0sNRV8QZ3Nom8V
kZ0myvY6Hc+taQiRVo+KDw43hu0a8H2jU0BVXUZQJNMI9onaF/ZZp6SAl4cIE3rmgoC43HiIqL6R
Cg3nZb+wf3p9vID71N+KPM9vbDf2/sXvF7jv9kWXsy9V4lTU7Qk7/uGfeDDSw/OXp+/fH17/UV71
/Pr69HLz9fHLC/he/n83P19fvjy+vUHI6weS5o+nv4UiLVp1chLu8mdyloSeq5znEHIc8e/aV7Id
xyGiYgx5Eni2j50CcwBHSbHqW9ezFHLauy5/L7tQfZd3abNRS9dRdpJDeXYdKylSx1U2gydSEddT
qn2polD0+bDRXcw7zayHtU7YVy3SLET03k+7YT8RrjhIl5dXH+pLFpI161cgv0FdNw6BFOZgC0rH
f7kd8xlSSzKy40U9hfN8V24/IHsR0g7ACCz8BmdDRKgPKMbfQbgnOT9C9AM1N0IOcF/TjH/bW7qo
W/OoLKOAFFgTx4rbqdm48ROP0O+a6D1lKEYiEDlwKG/YJ7e+7SmKKCX76tQ9t6FlqRP94kQWckYV
xxZWLqBjN6cbWzwmW+bH6DoaZy9zgydj7Ih3stw4hZnwIEwU5YgOmjpU2oIeNHmWcgyLzobHZ8Pc
Cs0DhiJQq0FuvoRKpzCyItGA7Hro7HJjpFuA4aOBExZ+7EaxIgST2yiy1fFz7KPFY4fQZmv7cG32
9IMIrP9+hOeKN1++Pf1EGu/UZoFnubb+9IEhIlfNUk1+WwB/Z5AvLwRDJCZcFy4lUARj6DvHnk/e
nAJ7Z5l1N++/nh9f5WRBAQFnMfa8UiwvKiU8W8mf3r48kkX8+fHl19vNt8fvP9X01mYPXUvp88p3
whiZUrjR56K0TlXRFpnlCHqGviis0x5+PL4+kNSeyeozX0cppUzaoajhqqtUplraY+Rj4WMSGt7v
2KblgAJwQ80N4GPX8Rs7RE6Rga6J3b0C3GsZu6gPro3tIypEc7acxLhcNGcn0Hh13gC+XgsBdoQM
FUrHjRJXgC5+9QLwpZKpbLTKhG6SmhSg78PmLDrI2z5SJSmlKoIUqDFCDR1fuZQg1NDBDs+IImCs
fIgWB0KCq9Qo8pUjX6AGSCHjwEN7Mw40VtkrIDSMz+Zsu5GvqNbnPggcZL5UQ1xZmpgyHEJjU7Ah
8Lg+K78VnAiv5MGyULJtK4oMIZ8tG0OfLXV/A2RbRfed5Vpt6iLtXjdNbdmUaaqqXzWl/mqDqjmh
PQmROue9epaklYNkzBjGbf4n36v1zdv7t0GSqAlTuulYmAC8PD3oFVgC8HfJHlkK1NzyIcpv9XO9
99PQrQQVAF+Q6FpVEhrm+GBRd/wItQ5f1J7QVUVFdolDG5kAQA9wU7kVEFnhdE4rETTXQigqO0n4
/vD2TbvAZq0d+IiOB9aQqO33yg68gG8+MZs1CpVJBzn0dhAISoPyBXc+ATz1ACQdMyeKLLD4m7Lu
rJ50CJ+JF/SL9Qbr0l9v7y8/nv73ES5nqWIldDX3xdQXVYsGFOFBcHYROdKzAJEfOaizTgUlWAsr
WYS2lhtHUahh5okfBrovKVPzZdUXlmQ/znMHx9I4zZdh+MsCGeRqSjE4ghtNiWe7mqrdDbZgjs3z
xtSxJGtMgetbuJGqAPIsS9vl1ViSNHzU2lKBhapBF+OmntdHlq5dYKPAr+7qeLG1VdynpGcxwa6A
HGMS6OMHtRwOXsrcEzw7iqkTHVzDq6KIOkC1NO02nJJYWN7FGe3YvmbAF0NsS+/lOG5HRD/6zkns
UNeyu71mSFZ2ZpNm8zTtQfk7UjFPWK0QccXLsbfHG7CL2L++PL+TT9bDXGrw+vb+8Pz14fXrzW9v
D+9kk/b0/vivmz856FwMOEjuh50VxbF8aE7I4CxTc8jdD2crtv5WPyJkrWEL4Qa2bXEuKjeqZEIC
U4R/qkdpUZT1LvNZiFX1y8Mf3x9v/u8NWQjI9vv99enhu7bSWTfeiqkvsjZ1skypVgFzTmsdU9VR
5IU68xjGXQtNSP/uP9Iv6eh4Ni/KVqLjSg0zuOKEBeLnkvSei52tbVy10/2j7WkO1pb+ddDYt8uQ
Eab2+kkcY32OIGP5c1gfrchV+8oSXtMsUCeQBtI57+0xVuyRlpmf2bjM3zCsG9QCkKyk8UkEkOhe
duvFACOGWNfKbUJGnjwPhp4sYxKOTAyl5SEieGIHStVp44XCMrCOzOHmt49Mn74lioeljB6g4rrB
XEEn1LY24zpS9WE8uhKRzN1MpJSBF0Y2XlEP225Q87JxUEcrmUo+OpVcH9/Z0AIVO2j9aqfJaeGn
csKEEQJD/x2wW6n6xS5Wyj3XNRKpyT62bGXs56mtCQu+zEI3wJ6esV4i2rhjdXKalO7ZaBg44HdD
6USuVGhGlLscZG2kdEFmkxUWrH4b3JhgLYR4ybQO7HReH8QhLXwOogLf520t7NhYu8sCmcm8cBH5
ydCT7OuX1/dvNwnZgz59eXj+/fbl9fHh+WbYZtvvKV3AsuFsKCQZtY5l6cZ00/m2I6+lQLRdZVTv
UrID1K7V5SEbXFeMNcrR9YvhDAiw43nGJ/2rig6Y6BZ2FknH8SnyHaUCjDqR9jJ+Bvf2aHaoJjwr
HwF1Tc0cYvaZWS6KKceoi+554kbS5mEV046luvijGYuqwv+5Xhp+cKbgz0GaX1Qd8ai+K1jzcwne
vDx//2fWOX9vy1JMlR3KI6spqR9ZV8yrKcXQ+wd2gJCnyzOD5WTh5s+XV6YkKRqbG4/3n5QBWe+O
DnZRtjIVLYdQW20vUabUZhCXwBM9D6xkzUnaxsc2S3R0Ro6ql5SHPjqU2uoAV1YHkmFHNGNZthLB
FAS+oqAXo+Nbvm7C0C2Wg4xRWEg0T+KBfWy6U+/qZnzSp83gSLbsx7zM63w9m3n58ePlmTqEff3z
4cvjzW957VuOY/+Lf4WCHNAtYt+KdbKjb4UDKN3uiXlgfXn5/nbzDte5//34/eXnzfPj/2h3EKeq
up/2yCMo1c6GJn54ffj57enLG/e2Ya1GckBffRySKen4k11GoG9mDu2JvpdZ0wALxKI9nV3dW8WM
D+FNftBLvSnbFRi1F58MgGlUSwTqSAMfZvkZHwsAo+ELK1SnIezbqoe+b4X3ZDN9v0NZe/raC3Eh
vTGbc94xA3uyGvPsskmyiey1M7CXqi6J8KSCVSrlXVEAbRikdjp3SYWWjCBR+iGvJvAvpauojgff
9UcwxcS4fXqkNt1scXDS5QL9hghM/BQWviJAeF5qWYGYGtD7orT5B0ULvR5beroYi6Y3Clu+N1r8
OhvKxhSiruLOq4X0j1mZajQ8GJtJWWAW8nz7NlWeJfys5HMTk+uSLEfDUAEzqTIyx+T6M+qEBvDg
+Glxq/kSXK23YiSWxbX2zW/Meit9aRerrX+RH89/Pv316/UB3qrJrUXSnBLZsnPzwf2BBGcd4O3n
94d/bvLnv56eH5UspQwzab4wGum5tEXqDCzZeHt9imfIls+hbk7nPOHeJswEiMWcpPdTOozqI9kF
w14A+ih5cd33H3crtwioKuy5hIghkvgoNsnCh9DaZXE4DnLD3Fa7K+P4fMhlMUREh5wOM13WjcVe
ybc6JAcH34PDfADT/+xCurKSFgXKKc+ZUoC7UeOenvB2TXrUle1cdESYT2yGcfQ2qfPVM/gyQNqH
58fvklyjwCnZDdO9RfYpoxWECZIUODqewBSXrB2ioz8O0p/66bNlDdNQ+a0/1YPr+zFu8Ld9tWvy
6ViAiyUnjDFfPCJ0ONuWfTmRsVEGeDHImjulunWTQeYeUOjswgrj5GWRJdNt5vqDLTo/2TD7vBiL
eroFz6JF5ewSNG6MgL+HwBL7e6LuO15WOEHiWhmWfVEW8P6gKGNXUKpVQBFHkZ3iBSzquimJ7tFa
Yfw5xU3PN/SnrJjKgRStyi3Nlc4Gnp1SDL0l3uRxiKI+zFOVtKMVh5nG7pTrpjzJoFblcEuSPbq2
F1w+/gkp8zGzIzROMtfl8+OFMost3jKES5Iwd5br31loywP74Pl8LMSNWYMXizKyvOhYCucJG6I5
06cldLLYaAE4SBCEDjo9OUxs2ZqZUSX1UIxTVSZ7yw8vuY9u3lZ4UxZVPk5EkYD/1icyuBs84aYr
eojyfpyaARzOxegeZoP3Gfwh82Rw/CicfHdQBCJDkr+TvqmLdDqfR9vaW65XXxmJfKSxoTkR0Zl2
eV7j6XfJfQaPr7sqCO3Y3BwcNpJCp3Ggpt41U7cj0yZDA/aqI68PMjvINOltoNw9JmZ5wmED95M1
WuiQFFDV9WwBJPsJuopn+x4TLIoSi+g1vec7+d5CpwaPThJ0aqyQZk9SwSF5cdtMnns57+0DCiA7
sXYq78hw7Ox+1JSFgXrLcwe7zDWgYiD9T2ZYP4ShePevA2kOA3B0FKMnDhsYXjUk6eg5XnKrKJEi
xg/85La6kvuQwXMNMpYv/fHKaB5aeIZiOdFA5ADaOhTRHmxcyA3dqbyfVYZwutyNhwSvwLnoye61
GWEexg5+XrGCichqczI+xra1fD91QuEQQ9KL+M/Xp/SqErJwBNVqO3LZvT59/UvdkKVZDWHV8eeX
FHAs2qbOpyKtA0fjoZjhyIAAL02wG3XRUzHYkM8rLSGRNYiFjRWSKUkiIM3KIYptB71yEVBxIK9f
Iu80KkoHaFnw3hN9K0G1aNh2kGpDtMKsHcFJ7CGfdpFvnd1pf5H2ApdSe6YCO+l2qF0v0FzI0N6D
berU9lGABreUMLIuQPb45E9BPlYYRWzxXloXouN6MhG0ywnx0gBnIMeihkBUaeCSdrMt1NkcBTb9
sdgl81uUQNJJJK5n5IZGbqQUUeBrQqVSIFl5962HX4owfl8HPunISDpNgS/bzHZ6iw85Szdh1IEU
EYRJPQbCazOZG0bjqOFmreGzwJEShTOa+QkHdnwzsyb6fk/bFjwSfzW0SofqmLWR70lNIrCmT6Fj
y2dv60ZTPEBk5Ck57tQiIrjC6SfpKSLPZsd7iuhU5Z5UffBYUuAPgun+1dWfUp1T3RzIhzo5F2ex
pDMRC3tHhc3Y73ViLunS9iDtoNOi68h+9i6vhMOroajvgX0cI9cP8cIvGNiNOeilCo9wPU6w8gyP
nx0LoyrIGuveDSqny9tEOOxcGER18LGkQKVwfWVlaEvbsPwM59zRXXuDzC8q/b5yDiNy2GuMG6B6
aYY/L2bSIdN4ugDu5/v6rmrJHO9P2uWMnnMpci0zFKizUeeStKwHaSt2LhSdpU/OyUFzi7BtnvJ6
oGfy092p6G77RbnYvz78eLz549effz6+zvHEuNOb/W5Kq4xszDh5QGjUaeI9T+LLtBzf08N8pFh7
8COUCgmme3glXZYd0SMURtq09yS5RGGQcXDId2UhftLf93hawEDT+v+MXVmT4zYO/iv9tJV92Cpb
snxsVR5oSbY1FiWNSF/9opqddCZd6cykujuV3X+/AKmDpEC5X6bH+CDeB0ASAAJ0WruyTrN90aRF
krHCgralPAz0ofKAwB8NkD0OHJCNhF16zOTUwvJfhM2W7kDrhOFtrqDIfN4zy65ghxdP6ME9tRMw
DzkNVuBrrzFsdjyHwzaB2bwnB8xvX15/+fvLKxFgA7tIrW5WghUP3N/QV7sSZclWjHQaM84r4VrS
mnjGqQcW+OENNPTAen1jUtshaCYFK7Qvl5J2bKMGp/LM5ymDXEZRZJeAgZQHve7WM+NCUm9XAYLO
tU9bgLbf0ksYtum5pmRPrAXoKXjhaPeJmCddsAWrNdApjC+P4pzB0PWhdXamDmewlpZllBql0Hpu
1poI21Cew8Z+os5ZDa6bkNnnU0qnQYVmGlDLayUWXF0yESTXR+4A9DOKzqjlGlwbmg18c9Z9B/VB
glLIkK72AbtvFWlUz5bM4jjNnVIJj48kHIeZp1eLtITVM7PzON5qe5EKk53b0UjSpfDlqTh87qGx
TGWZlCV1qIagBFUqdPKUoBrBXkh/weqjsz65n8es5lnhnXwXDpolrbVgcleYydRWj1uNyGEVPDnZ
XXzv/7CrDrByb2GJxuNTbwtJ7tEc1EiilAUE2rgExszd8mZ/lYvIPpXEpajMk10mDr5MEka73lYj
qpYn5g5BnuJ5VMkpkWanH2EFo+WqpSoHiXsy2IDBhIfO9jLUAuNpXoEcg2FGmx3t2BA31bpkiTik
pN9UNaXsGx8kCXwkubJpfGU/DccVG/3HkfmiZ7+xi6PO/osS6nSw5i9ff395/vbb+8M/HvD2vnU9
PPLhiQfyymEuOhrObPeAiOWL3WwWLAI5oxYjxcEFKBH73czQeBVdnsNo9vlsU7Uacx0TQ/MsBIky
KYMFd8tz3u+DRRgwSptDvPMaZKfFuAiXm93efHDRlh3G/3Fn+8FARKtkZI+oOwz0cRdE1DrZbxRu
u47wo0yCKKSQPizCCKkunCL38aVGiI5FacU5HsDez39fuQFjSbVek/ZiDo9pGW0UdAgVQyWug5tN
Jo7mjuGMedpnaVtKGFi1jiJajLSYVq4jnRFTF35lspRthJtxDucomK3yii7kNlnOZ9SDbqOJ6vga
FwX9fet1f7r9Wm+TXaDz6RWh+x6EUIF+vYY6KbtRWnVoz4ra94Lf3368gIbQnuZoTYF6WYdP5uC/
oiTtOfUjvhY3dGKTDH/zEy/Ez+sZjdflRfwc9A9MdjXjIJntdmg84qZMgDBpJagosCmAuljfpnmV
H7TMjotDp9kqdZIdU3wdRy7pd5qxX73KvXV/ir8bdbEKskJBnc8ZHCNFw8Di/CSDYEGWbfRcsktb
lKfCWGCE80MHvLBJlRlcqCU0aZ6MiVkab0xnBkhPOEuLPZ5yj9IR6efRmov0ml04KDM28RPMljFF
O3BrXe/3jYRoKQQ+eiSatystUdVD3RGttGxX6p4ku7ALIHu1zvXN/OoyBnnSJsLA2pYiVeBOuJkO
aFbII7kAqrK5rqftBj6hJ+CaaHechG6WCLRN0L3t8qfcYB816Tkt5Dj5cf8hFYTLMTBy9qeIbfEM
EstL02+zaiIqPS4rNhoNIq0zljenOWj/tPSuPq1OixmluSCYCeamypI8o2VQjc7XC3rnUvCjnC89
ikmLB+GcfkeFeMyzdejRVnvc4x5D4WIB6U/D/txTAWqTP3M0BvIYuqvuiJczjxaF8P4klETmuUFo
WdKrrFPucUupWTjzl+ETe3ycaN6yykPBaElf4xLk4+u9Xu7Y7rS2Ygv9heVZTauMqjW3/vzFdqKO
Yssu/vYTImYeR6QIX0Cw2eGltJcDffgbmBIsDsm/1Kta9aPdrHqatRQnDDU99S4d9LXH9OflwlpR
q3g0yT1hrRBDh5+XzOO4vN0RYvI0RaVsOp9vCRiHBFaVeHKHK/EaMBsVVJMbdlUXcP4eMPhEldi+
vF0+/ZiZzAqg+BE0j1Uw3/DrBvUlPIw+3EkOvqklOpNSzKPFT7moBl5v8buA5pjevWrGt31x8m2t
kNAyVGcBorkcMiHz8R6dVhtkmSpPkopsX6h7EKc42pzqR9w6AEUjqt3r09Pb1y8g38XVqfcP0Jra
DKxtFBTik38bPuraSuKBEhM1MZYQEczdMluAfxY0wE4g1V89qQlPamogUcMEwRQKMTEqVGmyeJfl
3gSwfpM9jVzX+EwHpnJqFxwkdU7VcaHRDraB7WVfzebyktYYfndiOODXI7zztDM1FpxkYFAesmUw
n00O8k+Pi9VidncuHLP6eCnLxC3ZqOb7ce8CUZUmK/xYeXKltRbERzB5jheTPg41cLyJa9SfPMxa
fPVTqmBzdQHCWMKIiaBD0QkhGwk7MEiX5EjTXMc05VvSBMDmo1avAUWTEtACs7RI8hs+b9o3IO2T
Ua26D7k8NlsZn0VvUMRwwLS6lhoy7I+XH9+evz6AZvgOv/+wXoapHV2Hp8to9+MGxxV11CTxz5eB
T5Yf5INlg74JHfE5cTI8jEqrxIN4+mWEw4wj5YPpIuuHilol9KvGgWt//XgxVVBAWbLRMzY/Lx6w
yAmJt+wCDsrNbB6Ri84HBpFTgKuYXOEwksidPRHLhQePkwyd5/pJpvZR7sS2alatfvr+9PblDdHR
1FCpHRawCfjlOVWsmNEnMx/Iksix3PVrznRFq4nxoxjkWO4Vkj9/ff3x9PL09f31x3c8mtHBH7Fz
vphlJVtDBWpx9mYP1z1Jq00LZ1Z9pZvv42XVi9/Ly9/P39HX7qjhR5XRMUsmp5WOWfBhnvY53xRr
NPs47+KOSK44RsL4MIcn2sIIF2COS/n0XxiV2fe399e/0LdyPym0VfUITWAYGN//mxowXVAk5om4
4fLx+KOc59gTUqhjxAsy0IkmdPeei8fbO7m2bM7q7mnI//z48vrL28Pfz++/+RuVzgJX78mCqBeY
TXqm3Up+uFPHCZ+KrDpkpOuXjqWNSQTDciwvtZh6wolvoziTcqwcGZz39Mir3FV7RmemXrVqRbu/
S1DTlPAt0CuSea7n3h01N96svK/GB12YnZqTzHKibIjNw1XgR9yr5BE+dX7QM668B4QDy3XuKYXl
U9JF7DchI1S4Z8odagcSsJD5fO1HmsNlAqQLc1zMzfgEJp3M6rhYuBcCLT2K6HSWprcwk76gKnmM
wvWS7NRjFEUTx2JqZMbRMqBNcTqebRKs7/LIRsQTp3N4uiHCKA+p60mbg6i6Boi20kDkA8hWwVPI
nAzrYXFExChtAXpcaJDoIA0sPcCKrO8isAOOmojHj6DJQt5VWwxzX+qruceTv8NETkXErldisLeA
b/kBOJyTZlYmx8JX6HBB2UINDBiNZ0YU6hrMHAfr/VanTyruCGAtYxBtP8i5/GiSq48wqsPM6Xnp
yiAOrO0bMKNx66SijXo7pgcLYnKkYh3OiVGO9IAYEpruGxEtSltfdkx7yZczclCgvXdTH0Paf2Wv
jLLrZj1br6kUFBZGq4njcM0TUZuBQkwrIwvYBD4kXIX+wqzCO1OzZxPJxZ+MJ9iEXfQ7PIKvN/Nl
c8HXSnfUCYe9jXY/yV/FfL5c+2+KOp7VenOnRRTXhjgebgF6Ke9Aco1DcL0kV40W+kCZkMuXejiz
vds50P3UFZc3dWjZ0SWuiX0gfcXmyyCaz0xDfQsJ/uvJGaH7GSsuMl+Y6uQiU+cguZArRC1hw1nj
TJk+X5HRcj61hiBDSCyH+taIzjmig6aYDGtCkNB03+SuJQjBH6gPSLYuF8FDyFSK3ObuQGIv0SE5
sceKbM9ZIio/0tQp/IdkUEajDP7NdtnoAcfAQdx9KPSOlicED8IZUVEElpQ+0QL0EOxAz4YG8CIi
vaL2HJKFtDSCSDQlHWFQUMFGz2cQkkwEUeS/w+95llMiMXJYNrUWsCLXK4Ci2Xpq7iDHak6szgoI
iOEEAChBVDkwaqQZjq8HdmyzXlHAEIxxEvR1qMlyT2vuecM5+eh8zBdcqUqa8N1yKaZpAWrgJcdd
CyfxdU7GG+r5RMiCYJUSJRZa8vcglP6rAmFSgidID5uQUvYUsCDyQLOHOTGKkE71uqJTOQN9Taez
mhNrP9Kp3UgF7SR3I4VMLQ7IQEndSI88RYvoKq5WHv4VIb0jndqLgL6mBF9Np8WqFiNXT8A2M7q8
G08+myVdj80y8DTxZkU9xLcY6F4DKZ+gC9ZGKxzl9ZiH69kdGfpRnVhulhXpk8GUxlcRsXxxuQyp
MwpFpzUauVySL+Q7hoKdQIUjZRaEIk9ENpNn7YknZ/FMVlhzUItfxZYgsjFiMOYVmi5Af+A1t2nf
ZTOc7+D1dRqXAz48gLbOfq3vtHCCN63kee0A24A+xt7XrDp0qH41liVjgxggmt0FP5utOv2+gUxQ
p8Ve0gZQwFgzSgY86RSN9NonXl0xxJ9PX9HDMxaHOPLGL9gCHWL58m2gCU/UJqiwyrJJUqQTvoCz
ads0P2aFW/P4gM6vvPnGhwx+TeDlac+oOwgEoeNZnt/sYlR1mWTH9CZscqxiszi0W1WnwmGEPtiX
BXoQM6syUJsdJb/ilyk6u925DZDmqXONbYKPUFK3a/k2q93+3pn2SIqSl3VWnpzCn7Mzy82Hx0iE
LJTnMYd6c/r0wnJpPmTW6aUX5fDMyfxWO057kZrFLEnd6mdkfHdEPrFt7XSIvGTFgRVu8QuRwaRx
s8tj9ZjKIaajuZenRXmmzBkUWO4znBijj1o6/qjoq8CeZUffOyJen/g2TyuWBFNc+81iRg8rRC+H
NM3bkWUN/n0WcxgBoybn0JF1ST9O0fhtlzOPFSYy1Kke7r5pl8F6K8qddApU4gMqdzjzUy6zbvhZ
uRSSkoIRKWuZHp1ZzQp0pAKD3upfg+yfl1UqWX4rrm4BKlh6HLfEJpqzQjk7s8MUttBNaIsdbxsq
ux/fiipYNqph+0zFIaKHkjwrjm4RhEwZ/TamRWHIwA5BvhZTHKeiyt3Vo7bd9qiZjs4KmSAfIKt0
OKvlp/LWJjbIFgbdN/TVjM/O9A2VAstKQP09WaOLqj13CywP9UlIzqAJ6BdnyHTCjbapSOt4tRRm
GS+lsz5es4KXNukxrUu7GTsKsRE83hIUVHyzSsAyV9bN4bQd9bVGYqhXydtfvq06r6wA1pRg0Dsa
t4WXPku8TFezkO61AW72JWy19FMdN32d6ff3p5cHtP/2Za0ePgID5kCnSyah313w5EHsNCAIZ/wc
WnLnT5n8vLcEMDPrpDKxbcpDnNkuWszOQ47W+opsSs6ps1UOcoTMYmvKd7SxVVUbafOPH6//E+/P
X38fu1fpvz0Vgu1SWN3FybRp5wJEpmabl06WQtMmMzv8eHtHe8MulkPizVxmO95wY6b0yCe1nxRN
aLul7/E62lC6SZFecLc3UsRf2mKaojVqzzNzMDC1S8FuQE4sxbet0SK2AHGxOVwwXEKxH9z2Awcl
d6sPGZNzXyxxzVCEsyDa0C5SNAcs5JTBoAZFuFxEbFQxdgnokI66Omi5YB6HDNTIpcb1bIZxdRYO
Pc3nUTCzI5QpQNmek8SAIoajsqswtVSn9+jGcgDQUWe25q/oqHt7HkooXIRxsPCYhOnql1sQqJrP
J48fHZOpZp99pa5itonseE0mXVmB+761LcR1datws3B7BInRqI2raHYdtVYVRdcrFJtzU67uMTMi
1kAkegrI5CF1i64t5yAdcbV2x1iuPAU4RNU00bhLW/qoycZcS4/pmmLQrgvwIF+SFj6KyXWL0BLj
ebAQs3U0LtuF0vX07EqC9Ww8AHIZRhvvROXxPFyZkRIVtRBuLxepvG6z/Sh1GbNlNPO4oVAMeRxt
6BNwXQB2Xa2Wkds3mrxxC4YT2o5PpMil9Hnp04mlxS6Yb8ntUDGgnwsdvMv+MBPhfJeH8423+C2H
Pu52Fmv9OPPl+fvvP83/+QC79UO93yocEvvrOwY6IQSoh58G6fOfhhsU1cUoq3OnTcQNHZa57Zdf
63TcXWj04asKxsre3mQ67mOQQfipncz+Vs4q8jWPTnvPw/mij+Clo4J/AeFH/nj9+puzwZkf1nId
qePJvm3l6/O3b2NGCRvo3rKnNsmu0buFlbDtHkrpQQ8pqBrblPlwwpGdhcdmsAoLYTGoJ5m8jRu8
ZZhegDqu1mK9sftGtdfzn+8YHfDt4V032jDwiqf3X59f3jHCjgqg8vATtu37l9dvT+/uqOvbsGaF
yCy7d7umDNp4LCl0MCjT5MMkiwnWGcepgZMGHnRSOo7dsq1nVzoRaTs060fWFqfqSMBSc47IEJ2F
CZFtMRaF1YVsPr+BPMfQZxzlRaQ7Uv3y+19/YusrZxpvfz49ff3NMJ2sUnY8mTfkmtBa9Nu167Fb
IQ9QsEIKWtwbM1bk8wubrSrzvCRKotFTUsnah24L4YOSNJb5cQJNr9JfyQS+/UAVj+ntAzXMJwpi
H0Q5WHW0Df8sVF6r2gsOfigGVZoaEKbyusuKbMsK6sAiBZGhYaC/Z3Ej4vpkOOBU0CjOUWpZISqe
NiwSbCemww4FjZwG6vzyhtOvFRXMq3gdeSRfxXDFawaiMrWEwmTWOQWSlCpFsCecaW8qdlSNnupR
aoFh7GUWiI02ah9aAGmtezilmBWpea+DaGmcnYKYDosgqKJ7QKxl4Zohs8c5NKSCb0DXHl/DAAtY
V66kj/FLn7bVRdowPPF4KFZO/jjpRhHNmZ3CIw1WNNr+C+1ceRJ7s2qPXQBe0jFwWoayapgvjWPo
TZ7HO1VeGsxy2LtPEp+9etq+Z7n6WXiFlpaeLDgGtvOB5+Za0ieFaMXo+6zYVru2U0m8ig+e3qty
1efWyqks33xJ9Sg/ecw4FQP3fl/ViT9xrf36B75M9zULZrDJbL2JaJ75zD86QLrzf95ZGqkq0KXo
WfxDQC1W3jxaI6PeKbd3OMhjcxBTaPzZhyo/eSyh9D8FHXCGNXzPjWV+AIwV66K6QwX8tFbMy6ib
nC+q2Lz6E6fGSlfs1BwZCDW0mGDC4VIDNwWx2b5ZaulkzXWEOV/PdNngcainAqDBpHYb4KptvUCU
arI1ePUktsyyJNPLU+70S7+JxC/PaOg2bCIMtvgYXw64WcpUSLsMrQMVXFo7HQfI29Ouc7BhSISY
6C4zr8rFRVEHwkl/bOUBvxtentORq/QW6/Z2myrSfIfFFSME9KHKQ0XZQabcFGuc2vRNdLq2MVuG
lDBGbB6bN9PJAnfE0SlSSx8IuAExEWdZo78frjfkfHkko8YAY2DJC5XyTq8PXtFiXTiO7HvGtpig
F8C+T99hmCyUrmLg3alx14G2YA8/G5/dKWJVUp/xsUZWf/byJBgZ9g4PI80PEQF1Iy5FaJVQe7bt
n4gYAJ4SOaz1yTwvRxLfLQPL0Om886i5KHV1ftKI8ulokEPibXRInhaW7+KW7HhlssFzUrFRQlt0
wmR7TWwR5X3PnxrnVLE4dqYOYdAMAqvNpAQ9GB0pDA7lm9Hg0EUcigK/8UUR3XKHUkjVEuP7FbRx
f/vx6/vD4X9/Pr3+6/zw7a+nt3frvqyLTH2HtSvavk5vW/uCNsaAup4HspLBokdbj0x6cMZYUDzt
HejShrU8zXOGAbM6NpKrzCvQP8r5igpXckDXpbGpEsIPDBgNo8HSyTtGdNhVMTNKtF6ynER62uDV
Vp82vPzoL9a0/wsodf3069Pr0/evTw+/PL09fzN3giw2txFMT1Tr+cxcdj+YpNG2uRJMaJ3aKLk+
lyVfeNtcm4X5ftLA6uN6tnaGSoeJ2GOObvGQz5tNjixy7AYdkIwEafOYt1E2svAi9pN4A9vy+dqj
2RlccRKnqxnttc5h25BhdkwmoSJL2H7RDBz1uV2eXn2P2B1WnwcOg22f8qy4y6Vj4tzt4oBXwhOV
x0wMFCT4CzsRzQksn8s6o7c9RHMxnwVrBktFnmT0gmRkNzquoJgqlnNGbVYmz4V7uqW8Fvc+PseR
52PQQ4OJ8FzmeExWXjeVZs9nV9iHuM9rv+qCGF8p0SuxyollR5Y30tOXyBHzAM2TkjP9DK7jWYe0
CXSLN+go7y5Ds2fS04Ut17EsaO2rYxg77BuxHGra9KbDC4/zjwGf/l7Q5wlqcR3Cwd7r3UMG6+Ay
PoeemzOXdfMBrqXn/bvDtfoI12qzjs++az2LdRkENFedilQCg8efkjkjQFzy3G3xKx49ejZG+DTj
1zWnpYwe9i9QCvYPBwVbC1j70un/lF1bd6O6kv4reTzn4czmYrD9MA8YsE0HDEHYTfcLKyfx7vaa
3CZx1tr7/PqpkgSWRAlnXrrjqkIIXUqlUumrX8eX0wPHVqEiQ2Qeui7e7OW1dovfTRfzAhrV15Sz
9J8pZlnyVLHWteHh6lILC6BvL9XE+3EnDTFdRGORowDDumEY0BoCr9vxk1bzRbQNVxwfT/fN8X/w
tWrXqAq78QxUFZuUa1EIqlQ4t4BEGFLzqxMZpZb0kb4mNTdSi1qlvvDGhWvT77pU+IV6oRQuhNBd
XxTOis3XhYv1Jl5ftRZ64eLrBR8QLehr0nM64siQWnxFKjCBkm1bCG1EK4P+OvyjVuJXgf4K2CfW
8G/su35XgIl27VuscH7DOLRbIdKHeNUwHWP96a5u11HEJ8S8L4nN/GtiYuexzg52q0Yii5Yx4lvZ
Pfj0i9TX7HdtZmw7kQR/lfEtozhVjdbKfheSz/XcxSR3qaNIizfGNHqo0lOgraPEOmjyWxJ/TN8c
bApcfKbc/Yfr9RAnAqTU9jvsvnZkDKyYKez18/3hSK3vPcI0j2ohC+9t2QmRHtluQiLbiKjVKZnv
/OzGLrBumqJ2YGLYRbK2wkMiuwBHEA0nBMrv+QS3TqbaQUAbTvKDrNsyuwQ/oJoo4QBa1plqgF0V
F/PJFsC7T7s47ZomnpCKWLH0wqk3wZhkddwlqxZrhJPMMoRlssupTmnZ1CfB4K7TqU7f8WZrYHRF
1fUaD0DKU0LiqDKn51tUF4d5wc8osphWpwLbvcroeHqJ/E4z+xqIFcKM07zMBnS8NMXUUEYfQFdX
U42LB4VXW+wbHvBZP4ZtRQldXFwRKJo9beb1B2+wd7Lg6PZFNJZRlsqGMKFjR53f0ivXFvYFMNqL
mka8G9iWXBCSX9GVEzXjaOmYrreZbGyGGbvo88moiaET3EkFMOxjrkpAXUrLEOxFbHx+EQLxjHFQ
hDNjr6cZacbSo5QRZfmqpMJhM1j09jID0KVKnEhcUuGrWX18fj0f395fH6hFrk7xkhQmCSIrSjws
Cn17/vhFllcVrD9ooUvUnhwOWRE8G1No9O56aJuXx++n9+M4fGiQ5cbo8AB8wT/Y3x/n4/NN+XIT
/z69/RPjux5Of4Ltm4xriqtZVXRJCa2tO9fETSRpNSPSLvGdAm47jnYHi0ErBdAqTiO2tyQHUdDD
42y3pvXuIERX15BL06/JFZaX9lepiO+XaPTcu2xpF5mPHU9+YDLTlqEiw3ZlaVlIhFDlRVcLmvyM
cW1VpbF0OQyBJeZq4LN1PRogq/fX+8eH12dbS/TmI7/gTGtuKFlmH7HzwXhgDe0xQvOzKmgNQ9aO
V2/XVn9cck7cvb5nd7ZPuNtncSzDJwhllFRR5CmJ9IaXX3uFCJv+r6K1vRjXg00VH7xrQ5l3Hrrv
yEYYvUL49cAQ/usv66uFmXxXbCbN6J2ZvKj3g40L56WnLxgjfpOfzkdRpdXn6QljxAcVNQ7Nz5pU
vbSCP/kHAwFzkOdarL3g7ld1uhEZjWaXSn395fJy4MUHQeo+jKAqEvrIB5lJeogs6zSyYbLWkc27
gwIsrmwumgv7qpZrbinHUH/qTn0j/8i7z/snmDjWec2jvXDziWDVCT0zuQzaCR2j9b4QYCvaIOPc
PI/pJuRcWGe35IeR1dcnDOGH6VdvmYuh29Ta1eeBnpWiyWlTtZf6wqSddPIgKI0MWTyUeYO5y+Ny
X+UTepTL+5PyqrRmP+35Nm28DvBeb09Pp5extpCtTXGHYPMvWSRDSGmB02Zdp3dDjJr4ebN5BcGX
V1U1SFa3KQ893k25S1IckkrQmCJUpTXHb9+p6TA1AVylWHSwsPFKE6siPTG09jxm1DuMr2D0H0EY
YLBV7NL2x65k3WrP+tJsu0q+JnxFTvgJpqQuTS0yTBKDJG2bmAclCeX91/nh9UVaouP70UK4i5LY
SCQqGWsWLWdqKJ2k6zdCJbGIWt8PtOPnC4ff1rNWV0gsZj7xsPXIvOc3u8ANHOJJrm5YVWSwtWFU
BJuUq5vFcu5How9iRRComI+SjIGksgHMNwILpij861uOHAvYtNRUaqZMbdAMo8uM+K4LrYtXJFkL
J9Xpw52FizFw4eOFcrCE9gWpdFDwdp2tubhevrwwRQSjIVf8qd4VUZ4ZifLXM5ztg4inirDvRH53
yZAPWCp/qWWflFVsBh4ejk/H99fn49mc3UnG3NAjExr0PC11d5S0uT8LTLDaEZ8GXuRcNUGDJOig
eD3RQHhcFZFrOUcFlnHwfWHM1Evz4reOzydpTN+ur4oYZhq/2kYBAqyKzFksBFst6kLVvymJPFW3
JJGvIifCsK0TR8PrFyQKJ5dzXE0JKNgl4t0+vVW6bVlCFXnbxt9uXUfNu1DEvqciC4AlNZ8FwYig
t2VP1L4diWGol7WYqbfngbAMArePw9ep6ocKEn2WV7Qx9CMVDQac0FPrzuJIB1Ngze3Cdz2dsIoC
LZLQmEZiar3cww785vx683j6dTrfP+GtNVh4ztraEyUC7xfmNRg+6kifO0u3DvQZNnfNlN4Ki0To
AIYXhkYp3pKe1cDQZiD8Xmi/ZyoSJvwOndHvLluDmTFkDLSwjVkN62Jo/F50rk5ZOMZXzG1fMVdv
xMPvxWKu/V56On85W+q/l63+KpFkFeyDKS+GlY1OiEkm2NJRkHh2obbynNZkK0xULImuETHhOs8r
bis03R3SvKwwyrpJ48Zy/Urad7ZCthlYK2R0cCvwXxW3K882Zyuo98pa+UU7HzWx5AksC7MF8irG
8D1ricD3p2qUN7E3m1MjjHPUuF1OWIYmQRl0YNi5Ds9toPiIW9d1LXE9grmgFBZwtCwTSPBDXyMs
Q3UJKeIKDDEd1wdIM0tcCvKWlrhSjt/YpDz6JZhj/Ehraz/hpGSgBshO20X7uQHEged71u4Q9i9Y
nDYBfv1p86MuLaOk3gVN6I6GCYu9+cQowPvItaVExgdkV5TJPscTOq1YcV9wzZKCL1104YoQ/Qp+
QB87C1dZSHuaiuPT02bMUUFjBNn1XF+LJZdkZ4GRvZZTHfHggjkBtapIfuiy0AuN90GhKki+oM2X
KniJoC18NUpc0kIVlUaWx1FeRh/AXN9NHfpMCwSaPJ4FM2r+HtYhvyapjQMZrDAezv0KP7Waq+v9
+v315XyTvjyqdxHAAK9TMC10N+v4CXly8fZ0+vNkmAkLX10it0U88wKtsMtTwoy/f7t/gIriTYar
Nsjc1e2Z6w+Ld/w+Pp8egMGOLx+agyNqcpit1Vbansryyhnpz3LEWRVpuHDM36ZBzmma9RDHbKGq
uyy6My9tVgWbO44lIVCc+M5ojvZMhD2tM1Rkm0rLlFQx9efh50LaDH0Dmi0jkIpPj5JwA0NC5gvX
MIt7W13sB40bfTr7soe8IOSR5aujsGCyCCYbVnjUQZjfKrn048UhbvLEaR2r+jcNX6FvSFk1vEl8
COW80CV72MXe/zZ6h/ZYY3wJzdOGisGTw0T4ueQQh9F+L6YlPVMCR032AL/90LBLA39B7TeBMfM0
kzaYzULjt2aHBsHSq0dXgCWdfkOw9Gu9CGdmPBx6s9q6Bw/ChV4l+G3a6kG4DPUmB9o8MHYqQKHM
F2SErilqQTzgLDooAVlzx9IKsDHQ7Hnf0ez9xUKFQ0uqspHZxi87bDabWTZavVmZkFeowfBzQ31A
oC0Yktn9itDz1UUcDLfA1Y3GYOHphhyGn+uEpacZUXhDOwJLwENgNHrlBn4Q6HnuBHXuu9R6KZmh
ugkWa2jfbP015qk5NCiax8/n57+lt32kNYQvnOO+0MdzZgECKev9+L+fx5eHv2/Y3y/n38eP038Q
IyxJ2B9VnvfJckXQxub4cny/P7++/5GcPs7vp39/4qVrdYove4w9LdjD8hwvufp9/3H8Vw5ix8eb
/PX17eYf8N5/3vw51OtDqZf6rjVsnxx1cAJBdo18+/+37P65K22iKb1ff7+/fjy8vh2hsS8LwGX7
y9zQsfjXBJdOUdjzDPcD9x1a7sBESVszA6lTZc10F/eq2Lhk5oZ1GzEPdleqmrrQdPWl0A1Pn7Li
8p2FT6EKFdXed9ROlATTSSkXH1FQ1GbkethsYKvmUJNq3EfCpDjeP51/Kwt3T30/39T35+NN8fpy
Optduk5nM4s9JHhUOhA82XBc1TcmKZ5mg1CvVphqbUVdP59Pj6fz3+TYKzzfpdRYsm1Um2+L2xl9
iwskz3GpsaEBPRdZIpDJembDPFXnit/6gJE0c7A0e4/M/puB7al6GOG3p3XxqAXk9SXQnAh7+Hy8
//h8P2Ki6JtPaFFNgeBk0vzYkmRaJZxIXuSWPN30ztxw9HvsdedU2pZYtyVbzNWK9RRz8kmqZmXc
Fm1ouI8OXRYXM9Abozx/tBBdLRSB+Rny+akdNqkMzZ5UGJQxmbMiTFhro5PGac+bKK/LfG1tnRgN
agHYmRIWjKBeTqgEnN/p1+8zrfK/wRTxLU6gKNmjN8uiwHOfnnXAwJRZ2qisEra03azkzKVtmWBz
37NUb7V152ROOGSoozwuoIyFqxNUgwx++6qrOEZ0Y/1iMVBC8qL8pvKiSsu9LSjQBI6jniDesRB0
SaRlwen3NSyHpVBLna1xVOhoTnE9rXbq2U9uTUIgBKq61NTnNxa5nuVGXV3VTkDrOlm/AVJ6MIJr
HYP4AINkpid1gMUEFh6H6jnJUnZHuzJytRSFZdXASFJeUUH9OTC2nlYsc10S6gYZM1VLN7e+r6VI
a7r9IWNeQJCMrF4DWZvfTcz8mYqYwAlaTnrZeg30ZaC6dDlhYRDm6qNAmAVqts09C9yFp0STHOJd
PnMcbVkQNNKBf0iLPHR8XZzTLPdaD3nokhvfn9A10BOaUatrHhG0dv/r5XgWJ2iKTuon/C3mKFNW
OfytbzlvneWS3L/I89oi2ijOFIVoupguDP2sMtqARlRGhDJ7UDptyiJt0hqsROWhIvYDb6bCMAk1
z8vnZiDNwgwPE2yEITbY/ejZFnEgYkhoxig9osG2JEaUUnXhayagTjcmgs7TWvNHVETbCP5jga8Z
Q+Q4ECPk8+l8ens6/qXtobhXa6853zRBaUs9PJ1ebINLdazt4jzbER2pyIgIjK4umz7/krJKE+/h
NegBmW/+dfNxvn95hO3xy1H/CrzrU9f7qtFce1rni4s78rrION6DkLbKqpIIZkr5E+lKS9vhBQx9
jk59//Lr8wn+fnv9OOGeeNzAfJGbdVXJyAaVSVXEHUyE9E51XXH9Tdpu9u31DMbRiYxpCbw55YpJ
GOgu/QwtmOl5AjjJknpb8OhL1+ijcVz6mAJ5rk/pLOQEekZMLkzbVk2Vm9swS2OQDQV9e9ZzZhTV
cow5YClZPC38IO/HDzROCf29qpzQKTR43FVReeSKkeRbWGfUSMiK+RbN2yePuxg9lWVjm8UVNh9p
X1S5q55Zid9G/Iqg6UtClfuunheyYEFIrkLI8OcjbW4kv1Op5NZBcIytZxPYdvPbynNCylP5s4rA
1lWcvZKgv7Qn9u/rfVJmP1+2Ey+nl19E9zN/6Qf/bVoAmrAcQa9/nZ5xL4zz/fH0Ic6gxhoFzV3d
pMySqOZh9N1Bn7gr1/NpQ7ayIazV62Q+n1kOR1m9Jv0jrF3qFmMLNdQTQMOTtCZAS8y37akOeeDn
Tjve9w7dMdlo8hbZx+sTghRcPQv02NLwHXjMHUHMDPfLJosVS9/x+Q1dp6Ri4EuDE8GalxYKaBx6
zZcL31DAWdFhprmiFNHhlpCUQTdgkdRMzNulE6qWuKDo+r4pYPtGIbhxhjKRG1g+1YHIf6uWN3rJ
3EUQaisr0SbD3qbRUL3hZ5clVJAzctj3rIm3TRqbj+DYrkp9fCvspiyV2Cz+QFqvdQpPZSAR0S+D
sUgxjJsoViB2XX4MIOmX+QZEfj+Yno09t9vmcRJbsrhcpJp4ZRY+hD1ZXzAJXyUFrDBanJ/WueX+
BGdP3PdCfn9l3PJlyffY/CYBUW6RlzelzWe22epAX29FblbQWk/wWtrGkUyPtnIkFywR+pIz5wuE
4I2tV6Uq0McQT7Hkm9/Xn8Kx2P6VMsBrgs+YiXdKCEwBZKIUj3Oyc/E2VWaBMhOPi4gqu0BrmWsw
Rdt0NFoQr7lLitEVaUWE52TSsyZxsuX6OPIUxDSw4mnFy+XiiN6QcKa8CW+7Ss5l5BUkq8DUvSPO
t+O8cHbuLeIqp2OguQAGfE1w64lHLdfzBa+w2SA914bIwAUQfcPK5Tdm7NwsjSN70cDe1jYgBhQQ
uBwqW2yp67ubh9+nt3HqbeBgF2o2BGipjMyzGCWYCAIe0ZyPHJQhyiyRfnIcgT6J8cnKdp2tl4P6
TArUPyPXLtUPGf4+UqJhswX6PizY0Sr8mk2mr8p2wezvgYcvIPxRlqQWhAPQwyCK+Wct3gEU2DW2
VAYy5hffFpfFKttZikHY5w0GeWKehcrSWZpQYcEYhBVz3DK9S8UcZ8Mwq6L4tjMQlVclZpVvQK3b
QBFFaiB4uoybiDZEBCIi/JC3dEdjv9r+uGGf//7gdwMvA1+ifXfAVtz+F2JXZKA/E8G+zDFg9OsZ
T2faWLQbyNnRVXnxAmfA9SIsyKJuRnI+LoLXCo3azVfF+EeibBftory0f4zxCLaLVVZes8f60rDX
KCRQR6frKaBBsRzKU9zjQWHzdUQ/CeDR6da9yNBbcpTZMW+6mijAUzXY1ht8EQf/ihqL6u8ljE+l
WmOyKgOoUlnX9GVLVSrRBr/KYVF+KHUWWq8CvBNrqfOKrAVr0TpjBKDp5McJqNUrImCrcy03NfgQ
GxUU5q6c7njMVZ7ddYe69RA1aqpNpWgNK4K1yKiGxTHy5wG/T5nvMZl2NzlH+M5kNCLUNj2kq30H
ZUL99o2eaFzlL3hSUuNdihyYip232ME+g2WxWcjAnGwslJrqmaKo/OsC+H67BOI/TTUYCuzX9B33
nt+yayVsEwscey8gxrBl6UMhVkV1G+DKlJC54lGmjNO8bKSM2eRRs50vJ1uLXwLOqruZ435BEMeu
veu4iA2v7yIw2f1chKfm3lWsW6dFU3aHL4hvGR9bXyjX3q19WyycsJ1sizrCrIbTIvzWSbrzp/X9
gKyQ8F8tbZpoklzfTI4tXRQG2OQKegF3mFJMg1Tzo0rtU0uaiEnVHcAMpVGPFDk+A74kOVm5HjZu
as4OMlOjbzCivyxl79pBarLqF7N9a/M4YOUbsf90fdfBRpvozovo7Loo7i7hI+CHvUv5JtJdzrrK
s2zPQSiJpJVqlYiKMJgRqkwT+jb33LT7nv0kJbgLQ1rf1gWvARszq1J7vwhv022aFqsIhldhScI4
Fp36usGFxW0G+2i+yE2+WEuIRu5+9J3GsCAg2EesJuZKmkpzAhYxZd/WkbZ0wJdq5xjyGtPj++vp
UTkR2CV1mWkZoySpg71hguh/JlbQcL9JFDVUMlLC5HaHIi2Mn2OPsSDzDaslic9FoozLhl6UBM56
l673FjgfUUi/C0sRT2/qbb2g7X1CCqE/7XVCy8BeIbGErq31GPS0vYhBZLqWuAWw11J2C9cgmFeI
rs2g3a61sLg2MNEoPbLdtYLY7oD56jcV5eSsMeMQq2Q/agdw4ranvXSO8jxia6+ui7QYD1G+1dod
6qgYzajt95vz+/0DP+tU0kf1b2wof7hQIM1WCwGRNKvTehDYNNuJMjtYIZVz5aHUJiOol6S2fbDy
+GsuNbCiZ68t5m+TUg1d7PMmq/K0vcSqKjE9JKTZHu/wbuZLj9r7SC5zZ/o9UqSb6cMVlsxQRsUV
jQAwK5hFlebzZBmJAMryrBBOK4UgQcmaOjc7vIa/d2lMbbvjco8CeqeJAKJ4p2eFVkKB4p0FyVYL
LrJJYY7Iu5Q6VUW83rt9lCSpGjQxgKk2Meyzo6rZazAepZqjC391sUhsrpLYLtEiW3QUJ3EB6ITJ
oPkiqZwtHyIMCmhSGH2IR8HUtgJSpue2TNvG67SkzoLQtVGj5u7uyVXJMhhWsdZlPZOl8b7OGtp2
ASG/s9iwwJsZvEuNi1UcxVvtOmCdZvBdwCOf+cYZmmtdrTm9WF6rPgqMskWrD2NcHMJHK23Z9hVR
fkvA2+4w0+l3+1JFQmmNtlbIaq5u/F3ueN7APrf3UGOFhznoMtqfjVLfo5o+TGipjx64mzXzbD1a
xhPMVWPtu12WiweVQeuN+pOTsMVtb5DPiFFsl4BhFd9aBh4vIQKdDBrmWxrLoEejfHQYYWxSpueC
7Nn5T0rLXrizcYlA3MZj8k/WaMYodkxEaVp63KQtDjq9EXtat8JEA6DIyWbI8rRDfrZTMsEiZB+C
P/ww+Wr90l1c/6iw3SyLY3dIzek28EYZaU1CJggc4097cSQYRKn9FLvYm0jAzKTc48EXEsTpoXcu
NfDlEzhfbEFUQsI+ae7WBUx+OtpA8KhQTV5q3GhaN9o35ZqZetNgWwY3tJo2x+I9U1YomXFUFSj/
r7Kja24bx/0VT5/uZtrdJk3S9KEPtETZqvUVSoqTvmhcx008bWKP7dy29+sPIEWZH6B372HTNQDx
EwQBEARhrjJ276zDIxRETJwKWCZdHBA0FC3L5uwe2lhmWTn/u6/Q7KLP7gyinMM4lZU1/X1miOXT
ytKeYN6P8jjAonLnIc28vjxVYPwOVO4/49tY7snelpzW5Sd0ypsD+qXMUm5I8q9AZOLbONGDrWuk
a1HBrWX9Z8KaP/kd/gU1hmxHIgWmsYxr+M6C3Lok+DvmSg5GZQz7yIR/vvjwkcKnJb5eXEOv3qz3
m+vry0/vzt6YK/NI2jYJdVFeNt9RRwI1vB6+XxuFF43H60fd6dTgqKPN/er1YTP6Tg2azCflRHQh
aBbMcCPRt3kgu4bE4nNhjSGfJRDHFpS/Im3MDCESBdpkFgtu7EAzLgpzoLQTQauseeX9pDYGhXCU
PTDtkriLBAc10pAR8p/jXqydNf7YGbZGWquXydXz37SkgoU4L8UsRKepzMti8EMzBc1sSKD5tQN+
pQs8knw0o5RtzMfLAObavP/sYM6DGCsEycHRYWY2UeByoENEBWM7JOfhhlxRl8UckotQD6+C42Wn
5HNw9EtwFtGnD3ReDJuIvAbplBOaHispnt3Aj06HQV4j13XXwT6dnf99U4DmzC5XvlZPV3XmVqUR
tDvfpKBdxiYFFdxt4i/pNl3R4I+hpoaneehliPkGgotQ4Wd0BCuSzMr0uqP8ZgOydUvNWYTuP0br
r5oi4hlYfYGCFQEolq0o7YGSGFGC0cgKquLoXqRZltJudE00YTw7WfdEcD6jik+h2aDEn/g0Ldq0
8dssB0S12cE0rZil9dStzd3qB2ScBf2quDwoX17ZzW/MvcfygKgUTavl6w4vBWy2eFfK2MfxBU9z
+7xHPfSm5eh+cf0LFRc1GPMwcUgImv8kYMj2JVGqjLJ+eKwrHj6C3108BXuLCxZ+IhmppCWTRieo
tMuii3NeyxiuRqSB8OCT7g2NJM0F+Zg9KF4xL6A/aHGhig3aOxh+zFJWPCKz434JCRQxZoEXtxJQ
y9HCq8tWBIwy6XSJZHk5sMyUZxUZAKz1x+NwMcPGzur885ufi5cHTHnzFv88bP56eft78byAX4uH
7frl7X7xfQUFrh/erl8Oq0dksbfftt/fKK6brXYvq5+jp8XuYSWv9xy5r3+b4nmz+z1av6wxm8H6
vws7+04KKh/2BazwoiwMlUsiMFwMR3rohe1r0DQJLHWDhNSEA+3Q6HA3huxk7vIaHFGlUH4EY42x
+r6InBzGCgYKZlTdu9A7K2WeBFU3LkSwNL4CRo9Kw2Mql1qpvebR7vf2sBktN7vVaLMbPa1+bu2k
S4oc9E3S5dFjWTZhVsY9E3zuwzmLSaBPWs+itJqaflkH4X8yZVKw+kCfVJiOmiOMJBx0aK/hwZaw
UONnVeVTz6rKLwGdZj4pbCtsQpTbwy1ttUfhuiflgv0p3kVg44x3DYjHEzM+Sc7Or/M285pQtBkN
9Hsh/yEYoW2msCNoDq1ev/1cL9/9WP0eLSWzPu4W26ffBI+Kmjra6ZGxzxM8ighYPCVGD8CnCueR
ALzPoznR6Vbc8vPLy7NPuoPs9fCE92SXi8PqYcRfZC/x7vJf68PTiO33m+VaouLFYXEUhLq8KPfq
mBCwaAobNzt/X5XZfZ8Yw+0k45O0hmkN97PmN6knSqD3UwaS9VZ3aCzToT1vHsw33XQzxhFRc5RQ
wQga2Qjqk1Pcyc2nH3pYJuYerEx8uopu4t2p+kABmQvmL99iagy3M9gxKIZN608UesiHoZwu9k+h
kcyZz77TnJGNhz6FW3+rPtI3v1f7g1+ZiD6c+9VJsAe9u+tFsNuMccZm/JwOnrFITgw1VNmcvY/T
xOd6UvCf4Pc8pjM4DujAU+oDuquqE8Oap7AuZISyP3Aij638WXp9TdkZ0VAEn64LKM4vr6jyLs+I
TXXKPhDCioA1oCiNywnRpnl1aSf/UQJ5vX2ybgsPoqX2VwCvu8ZXGkAzmicpMZMacUx768kElnOw
A+kAg4Gmbk7OKxLQrhO9k5AhuFpPkv8GpS81uVxUTtS8R5KfZNRmXuK4+JOxed7iPXxLfx46kWS2
x7KXkl9LD3Z94bOQOo9zWyIP5E41FY/mvHYKMCc2z6Pi9fnbaqfTaFKNZkWddlFFaW2xGKMvtmhp
zJQSlgpDCQ2JiRpfwUKEB/ySNg3Hmw+iNBV1Q/HqKO1YI+gmDNigBjxQiIJaoCYamPqWCslwSXvF
PFgUL6RuWI7xPcjGfwustyZ+rr/tFmA77Tavh/ULsXdhpjlKJEi4iC5IRL816PtSp2hInFqDJz9X
JDRq0NuMEjz+twjDA450emMCtRUfczw7RXKqzUEN49ghS+vziYbNw+3OlD5nBOMyzzk6T6TnBQPB
fU7AZITfpU67H30Hy3K/fnxR2QyWT6vlD7CYrRg3eZSB0xfNsrQeXEn0ceI/KFt3c5wWTNyrE+nk
85DWMMSfymKurLumGtaNwSoBQSJmxMRi6AgTQFtMTL7GG4hWNMA4hS31lgvzCFlfAITdtojQ0yPk
FQVzyZskGS8C2ILjaWFqHv5EpYhNxoGByDnYY/kY2nAEK+8ay/wyqyh146BABQOzA4SeBTq7sil8
LS3q0qbt7K9s9RF+wn6YJWh82vwoMVka8fE97SG1SCj/fE/AxFzte86X48AD74C9ChRnianIOBOD
ReUrzJGRi3HQkIfhL+Iytzvfo2DzHSJnbGjMffhXXM9p4eztEurt+LDVEyUjlCoZtnaSGjZ8Gk63
D/Z/glyCKfq7r50VLqh+d3dmEvoeJkPeK582ZebxWw9kIqdgzRQWhofA21d+uePoi8lFPRQnj3Sq
6r7B0JjvD1qICxLehzM565JwKAv1VHZWWo9CmFAs1kwJilE8tyzrUM0/glmN722DRLjlMCiCmcmP
mYyKNOPyFUjG6VlSAuHWU4uFbIh8g64DGTZppg4OEXizAz3VZnNENNWldXjvOme18QRnLJ9GizIm
8E3YqVTEjth6npZNNrbJUZXRYcsUGFppTq1u1yn5X08yNSVGkTdm/pzMDhsYprEpwT40OTTKvnYN
M/Pzihvc5I3C8iq1MvjGaW79hh9JbAwC3sQQ6NxphDWXML+6HbdxXfqtm/AGo33LJDaZICmLRscC
meOEcDKCCumvf107JVz/MreMGi+tmBmHhmmvMHreUqAHFGAEV5eB8ophjFRqpvAc6Fp82RCWUpK1
9VSfYOmKQfIrxj0eaeHNWvoksxx/YRMqrhUPk4qJvXsNmcwcdcM+B9HKkIRud+uXww+Vput5tTdP
R+zwupmM1iZjZiQ2Yvbz4ZF6xL3LykkGCkg2uLM/BiluWoy6uhi4DkYQj+G9Ei6MpXJfMODnYPSv
he/cV3hArxyXsIN3XAigI1+klx/Cf6BDjcvaygMZHLvBGl7/XL07rJ97PXEvSZcKvvNPQRMBbZAB
jJ/P319cm0dpIq1ATOJ1JDL+ZsoxawmG4YEsM1duL15UiCxG/OSsiQw56GJk7RiZfG929B93RXZc
GtTrpWa4ePXt9fERT6zSl/1h94p5wo1O52ySypgrYRwnGcDh2EzZgp/f/zqjqFQSDbqEPsFGjSfK
+Fz1mzf28NgBZBomxesc/9In5JoMDzAkZY63H4IsNBRonyJKoSjlxmwSjylRMq4ZXqEv0gbMtk7N
7vE8HrGhU+FZhJ+iqEozO43qP5oit68Y1WYnSjPPT4cyjOg8XL38rsEnq0wNQcKrMq3LwrJVVDWi
jFnDOlsrlf3pmwFCOONsRoyVIsAI2ZZ5i0A98SyPZMly5RkvRqsmMEvkBLHaDK1wEOjVtvfjKJKN
UljfolZYDK5DOV6UxymOYzeFqCzj1KnxcfSVVx1/jsrNdv92hA+1vG7Vgp0uXh7N8EmGWYBg+Zdl
ZRmRBhjvrLToLjCuu5wqXEV6gJB4eEXJYLLF8aSaQNuThXvNjPNK8YcyovGQ58ip/9pv1y948AOt
eH49rH6t4H9Wh+Uff/zx72MPZfS8LHIid0tfiZjDwm0bfjfspOQw/z+Vu+sG9CmwhAJRKpLrGhGK
bJfiGPiqa4saVFZQWpXp5q1CNSk/1Hp+WBwWI1zIS3RSGBOuGoQOD8NDABDU1HHRwQaJt7WcHNIn
y1Ye1ailZ9pGWEsnaQu198jeC2dhDdiJYNWUptGbeyKxbgES2OXyTpqMSRCxQ4KBvji2khLkEWiT
DkXUf6hKOSLxiwA/JeHJrBm+JUXt34YEU5eH+82CG01W0UM9hVmjTMNr4Dze2G7+Wu22S1JEV9Fw
Ag/mrLCDm/FWhQp9iXkF5tOVoXnhlzzHd0bRygILKnC5vpIZ0cAgTJQhdeL6hSySieyeotE6l9cX
U7ltVvsDrk8UR9HmP6vd4nFlarKztkipLXoY/5kduqJkNMheACs26UyL36bGX9pjLe0DgTucLceR
BJU00eYYwOYoFxYVDBqYmGCBorf2/S98KeH9YGMDN6JfDeUV8qF9EJHN4sYwmLXJR3q6zMCdgC8B
waBh3sVtblktEt6bISq6i2YBTVdHFXXzR6JngG9K4zK+hA5eVLssZUCF62rblM5RJbF30sUQaoih
ANifCfSgNTi54aKRJFRwGhuuiSQtMFdBczTxnZ4nqchB9nN/vOXlhFAlbcwz03KWQAzoAlu1csBy
YdvakCYnoDKCDRU384oKz13T89Q6dHY1MDlqZJ24jORioJlHbYDjtJPCib5D4li2/wNvCOEO0JcC
AA==
--===============1544401530196519088==--

