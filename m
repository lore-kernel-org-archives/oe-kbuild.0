Content-Type: multipart/mixed; boundary="===============6207022571899852043=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/cadence/macb_main.c:2722:5: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Sat, 10 Apr 2021 18:35:03 +0800
Message-ID: <202104101831.7whjldDr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6207022571899852043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>

Hi Guo,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d4961772226de3b48a395a26c076d450d7044c76
commit: 18c07d23da5a48525b2955aa269b8bb108c19300 csky: Fixup calltrace panic
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/cadence/macb_main.c:2722:5: warning: %d in format s=
tring (no. 1) requires 'int' but the argument type is 'unsigned int'. [inva=
lidPrintfArgType_sint]
       snprintf(stat_string, ETH_GSTRING_LEN, "q%d_%s",
       ^
>> drivers/net/ethernet/cadence/macb_main.c:0:0: warning: Invalid value: 0x=
00c4_OFFSET [cppcheckError]
   =

   ^
   drivers/net/ethernet/cadence/macb_main.c:0:0: note: Invalid value: 0x00c=
4_OFFSET
   =

   ^
   drivers/net/ethernet/cadence/macb_main.c:0:0: note: Invalid value: 0x00c=
4_OFFSET
   =

   ^

vim +2722 drivers/net/ethernet/cadence/macb_main.c

3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2705  =

3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2706  static void gem_get_ethtool_strings(struct net_device *dev, =
u32 sset, u8 *p)
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2707  {
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2708  	char stat_string[ETH_GSTRING_LEN];
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2709  	struct macb *bp =3D netdev_priv(dev);
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2710  	struct macb_queue *queue;
8bcbf82f31a94f drivers/net/ethernet/cadence/macb.c      Andy Shevchenko 201=
5-07-24  2711  	unsigned int i;
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2712  	unsigned int q;
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2713  =

3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2714  	switch (sset) {
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2715  	case ETH_SS_STATS:
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2716  		for (i =3D 0; i < GEM_STATS_LEN; i++, p +=3D ETH_GSTRING_L=
EN)
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2717  			memcpy(p, gem_statistics[i].stat_string,
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2718  			       ETH_GSTRING_LEN);
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2719  =

512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2720  		for (q =3D 0, queue =3D bp->queues; q < bp->num_queues; ++=
q, ++queue) {
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2721  			for (i =3D 0; i < QUEUE_STATS_LEN; i++, p +=3D ETH_GSTRIN=
G_LEN) {
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30 @2722  				snprintf(stat_string, ETH_GSTRING_LEN, "q%d_%s",
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2723  						q, queue_statistics[i].stat_string);
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2724  				memcpy(p, stat_string, ETH_GSTRING_LEN);
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2725  			}
512286bbd4b7d5 drivers/net/ethernet/cadence/macb_main.c Rafal Ozieblo   201=
7-11-30  2726  		}
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2727  		break;
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2728  	}
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2729  }
3ff13f1c620e43 drivers/net/ethernet/cadence/macb.c      Xander Huff     201=
5-01-13  2730  =


:::::: The code@line 2722 was first introduced by commit
:::::: 512286bbd4b7d5b15d26ba8078c8bfd1fc1129bd net: macb: Added some queue=
 statistics

:::::: TO: Rafal Ozieblo <rafalo@cadence.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6207022571899852043==--

