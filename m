Content-Type: multipart/mixed; boundary="===============4307754815447975103=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4068/13576] drivers/mtd/nand/raw/nand_base.c:348:3-9: preceding lock on line 345
Date: Sun, 20 Mar 2022 20:19:21 +0800
Message-ID: <202203202014.MPjhGm7H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4307754815447975103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sean Nyekjaer <sean@geanix.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <bbrezillon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 8cba323437a49a45756d661f500b324fc2d486fe [4068/13576] mtd: rawnand:=
 protect access to rawnand devices while in suspend
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20320/202203202014.MPjhGm7H-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nand_base.c:348:3-9: preceding lock on line 345

vim +348 drivers/mtd/nand/raw/nand_base.c

99f3351a6d6e03 Boris Brezillon 2018-11-11  332  =

99f3351a6d6e03 Boris Brezillon 2018-11-11  333  /**
99f3351a6d6e03 Boris Brezillon 2018-11-11  334   * nand_get_device - [GENER=
IC] Get chip for selected access
99f3351a6d6e03 Boris Brezillon 2018-11-11  335   * @chip: NAND chip structu=
re
99f3351a6d6e03 Boris Brezillon 2018-11-11  336   *
013e6292aaf5e4 Boris Brezillon 2018-11-20  337   * Lock the device and its =
controller for exclusive access
013e6292aaf5e4 Boris Brezillon 2018-11-20  338   *
013e6292aaf5e4 Boris Brezillon 2018-11-20  339   * Return: -EBUSY if the ch=
ip has been suspended, 0 otherwise
99f3351a6d6e03 Boris Brezillon 2018-11-11  340   */
8cba323437a49a Sean Nyekjaer   2022-02-08  341  static void nand_get_device=
(struct nand_chip *chip)
99f3351a6d6e03 Boris Brezillon 2018-11-11  342  {
8cba323437a49a Sean Nyekjaer   2022-02-08  343  	/* Wait until the device i=
s resumed. */
8cba323437a49a Sean Nyekjaer   2022-02-08  344  	while (1) {
013e6292aaf5e4 Boris Brezillon 2018-11-20 @345  		mutex_lock(&chip->lock);
8cba323437a49a Sean Nyekjaer   2022-02-08  346  		if (!chip->suspended) {
013e6292aaf5e4 Boris Brezillon 2018-11-20  347  			mutex_lock(&chip->contro=
ller->lock);
8cba323437a49a Sean Nyekjaer   2022-02-08 @348  			return;
8cba323437a49a Sean Nyekjaer   2022-02-08  349  		}
8cba323437a49a Sean Nyekjaer   2022-02-08  350  		mutex_unlock(&chip->lock);
013e6292aaf5e4 Boris Brezillon 2018-11-20  351  =

8cba323437a49a Sean Nyekjaer   2022-02-08  352  		wait_event(chip->resume_w=
q, !chip->suspended);
8cba323437a49a Sean Nyekjaer   2022-02-08  353  	}
99f3351a6d6e03 Boris Brezillon 2018-11-11  354  }
99f3351a6d6e03 Boris Brezillon 2018-11-11  355  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4307754815447975103==--

