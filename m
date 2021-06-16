Content-Type: multipart/mixed; boundary="===============1657736905444276556=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: ftl: Initialize rq.limits.discard_granularity
Date: Wed, 16 Jun 2021 19:18:02 +0800
Message-ID: <202106161948.XfYSCRxA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1657736905444276556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210613112942.2329192-1-chengzhihao1@huawei.com>
References: <20210613112942.2329192-1-chengzhihao1@huawei.com>
TO: Zhihao Cheng <chengzhihao1@huawei.com>
TO: miquel.raynal(a)bootlin.com
TO: richard(a)nod.at
TO: vigneshr(a)ti.com
TO: boris.brezillon(a)bootlin.com
CC: linux-mtd(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: chengzhihao1(a)huawei.com
CC: yukuai3(a)huawei.com

Hi Zhihao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes linux/master linus/master v5.13-r=
c6 next-20210615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhihao-Cheng/mtd-ftl-Initi=
alize-rq-limits-discard_granularity/20210616-134538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/n=
ext
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: s390-randconfig-s032-20210615 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/64ffb6f0cfd38ca3d47e7bef4=
674c52a14fe024d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhihao-Cheng/mtd-ftl-Initialize-rq=
-limits-discard_granularity/20210616-134538
        git checkout 64ffb6f0cfd38ca3d47e7bef4674c52a14fe024d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/mtd/ftl.c:107:9: sparse: sparse: preprocessor token SECTOR_SIZE =
redefined
   drivers/mtd/ftl.c: note: in included file:
>> include/linux/blkdev.h:967:9: sparse: this was the original definition
   drivers/mtd/ftl.c:180:37: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:203:23: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:219:21: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:220:24: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:231:24: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:232:28: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:233:27: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:234:27: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:235:17: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:243:28: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:245:53: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:250:21: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:259:27: sparse: sparse: cast to restricted __le16
   drivers/mtd/ftl.c:266:14: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:285:44: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:295:17: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:298:25: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:299:23: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:300:39: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:302:22: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:302:22: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:387:23: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected unsigned short [assigned] [usertype] =
LogicalEUN @@     got restricted __le16 [usertype] @@
   drivers/mtd/ftl.c:387:23: sparse:     expected unsigned short [assigned]=
 [usertype] LogicalEUN
   drivers/mtd/ftl.c:387:23: sparse:     got restricted __le16 [usertype]
   drivers/mtd/ftl.c:388:23: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected unsigned int [assigned] [usertype] Er=
aseCount @@     got restricted __le32 [usertype] @@
   drivers/mtd/ftl.c:388:23: sparse:     expected unsigned int [assigned] [=
usertype] EraseCount
   drivers/mtd/ftl.c:388:23: sparse:     got restricted __le32 [usertype]
   drivers/mtd/ftl.c:398:12: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:401:29: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:402:9: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@     expected unsigned int [usertype] ctl @@     got=
 restricted __le32 [usertype] @@
   drivers/mtd/ftl.c:402:9: sparse:     expected unsigned int [usertype] ctl
   drivers/mtd/ftl.c:402:9: sparse:     got restricted __le32 [usertype]
   drivers/mtd/ftl.c:440:28: sparse: sparse: incorrect type in initializer =
(different base types) @@     expected unsigned short [usertype] srcunitswa=
p @@     got restricted __le16 [usertype] @@
   drivers/mtd/ftl.c:440:28: sparse:     expected unsigned short [usertype]=
 srcunitswap
   drivers/mtd/ftl.c:440:28: sparse:     got restricted __le16 [usertype]
   drivers/mtd/ftl.c:451:32: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:469:10: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected unsigned short [usertype] unit @@    =
 got restricted __le16 [usertype] @@
   drivers/mtd/ftl.c:469:10: sparse:     expected unsigned short [usertype]=
 unit
   drivers/mtd/ftl.c:469:10: sparse:     got restricted __le16 [usertype]
   drivers/mtd/ftl.c:485:17: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:509:32: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected unsigned int [usertype] @@     got re=
stricted __le32 [usertype] @@
   drivers/mtd/ftl.c:509:32: sparse:     expected unsigned int [usertype]
   drivers/mtd/ftl.c:509:32: sparse:     got restricted __le32 [usertype]
   drivers/mtd/ftl.c:519:36: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:713:52: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:727:13: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:766:43: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:812:19: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:835:18: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected unsigned int [usertype] le_virt_addr =
@@     got restricted __le32 [usertype] @@
   drivers/mtd/ftl.c:835:18: sparse:     expected unsigned int [usertype] l=
e_virt_addr
   drivers/mtd/ftl.c:835:18: sparse:     got restricted __le32 [usertype]
   drivers/mtd/ftl.c:888:26: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:949:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/ftl.c:1029:39: sparse: sparse: cast to restricted __le32

vim +967 include/linux/blkdev.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  956  =

233bde21aa4351 Bart Van Assche 2018-03-14  957  /*
233bde21aa4351 Bart Van Assche 2018-03-14  958   * The basic unit of block =
I/O is a sector. It is used in a number of contexts
233bde21aa4351 Bart Van Assche 2018-03-14  959   * in Linux (blk, bio, genh=
d). The size of one sector is 512 =3D 2**9
233bde21aa4351 Bart Van Assche 2018-03-14  960   * bytes. Variables of type=
 sector_t represent an offset or size that is a
233bde21aa4351 Bart Van Assche 2018-03-14  961   * multiple of 512 bytes. H=
ence these two constants.
233bde21aa4351 Bart Van Assche 2018-03-14  962   */
233bde21aa4351 Bart Van Assche 2018-03-14  963  #ifndef SECTOR_SHIFT
233bde21aa4351 Bart Van Assche 2018-03-14  964  #define SECTOR_SHIFT 9
233bde21aa4351 Bart Van Assche 2018-03-14  965  #endif
233bde21aa4351 Bart Van Assche 2018-03-14  966  #ifndef SECTOR_SIZE
233bde21aa4351 Bart Van Assche 2018-03-14 @967  #define SECTOR_SIZE (1 << S=
ECTOR_SHIFT)
233bde21aa4351 Bart Van Assche 2018-03-14  968  #endif
233bde21aa4351 Bart Van Assche 2018-03-14  969  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============1657736905444276556==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
WBgWGW3w8JmdQP4HI//wC6DlAAA=
--===============1657736905444276556==--

