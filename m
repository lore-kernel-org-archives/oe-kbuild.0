Content-Type: multipart/mixed; boundary="===============3938132320947788148=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_bk3710.c:179:4: warning: Value stored to 'mode' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Feb 2022 11:37:44 +0800
Message-ID: <202202281101.3f4VBVa7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3938132320947788148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3
commit: a3d11c275b647b5b56b907011b432e00f7ddb683 ata: pata_bk3710: add comp=
ile test support
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220228/202202281101.3f4VBVa7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da3d11c275b647b5b56b907011b432e00f7ddb683
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3d11c275b647b5b56b907011b432e00f7ddb683
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/gfs2/recovery.c:397:2: warning: Value stored to 'error' is never read=
 [clang-analyzer-deadcode.DeadStores]
           error =3D update_statfs_inode(jd, NULL,
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/recovery.c:397:2: note: Value stored to 'error' is never read
           error =3D update_statfs_inode(jd, NULL,
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/gfs2/recovery.c:113:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(head)) {
           ^
   fs/gfs2/recovery.c:116:3: note: Memory is released
                   kfree(rr);
                   ^~~~~~~~~
   fs/gfs2/recovery.c:113:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(head)) {
           ^
   fs/gfs2/recovery.c:115:3: note: Calling 'list_del'
                   list_del(&rr->rr_list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/gfs2/recovery.c:113:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(head)) {
           ^
   fs/gfs2/recovery.c:116:3: note: Memory is released
                   kfree(rr);
                   ^~~~~~~~~
   fs/gfs2/recovery.c:113:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(head)) {
           ^
   fs/gfs2/recovery.c:115:3: note: Calling 'list_del'
                   list_del(&rr->rr_list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/ata/pata_ali.c:126:10: warning: Although the value stored to 'ma=
sk' is used in the enclosing expression, the value is never actually read f=
rom 'mask' [clang-analyzer-deadcode.DeadStores]
                   return mask &=3D ~ATA_MASK_UDMA;
                          ^       ~~~~~~~~~~~~~~
   drivers/ata/pata_ali.c:126:10: note: Although the value stored to 'mask'=
 is used in the enclosing expression, the value is never actually read from=
 'mask'
                   return mask &=3D ~ATA_MASK_UDMA;
                          ^       ~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'sav=
ed_udma' is used in the enclosing expression, the value is never actually r=
ead from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
           udma =3D saved_udma =3D (unsigned long)ap->host->private_data;
                  ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_amd.c:280:9: note: Although the value stored to 'saved_=
udma' is used in the enclosing expression, the value is never actually read=
 from 'saved_udma'
           udma =3D saved_udma =3D (unsigned long)ap->host->private_data;
                  ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/ata/pata_bk3710.c:179:4: warning: Value stored to 'mode' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           mode =3D mode2;
                           ^      ~~~~~
   drivers/ata/pata_bk3710.c:179:4: note: Value stored to 'mode' is never r=
ead
                           mode =3D mode2;
                           ^      ~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1494:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1764:2: warning: Value stored to 'tgt_fps' is =
never read [clang-analyzer-deadcode.DeadStores]
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1764:2: note: Value stored to 'tgt_fps' is nev=
er read
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/i2c/ad9389b.c:399:7: warning: Value stored to 'N' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u32 N =3D (ad9389b_rd(sd, 0x01) & 0xf) << 16 |
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ad9389b.c:399:7: note: Value stored to 'N' during its =
initialization is never read
                   u32 N =3D (ad9389b_rd(sd, 0x01) & 0xf) << 16 |
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/mode +179 drivers/ata/pata_bk3710.c

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  148  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  149  static void pata_=
bk3710_setpiomode(void __iomem *base, struct ata_device *pair,
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  150  				   unsigned i=
nt dev, unsigned int cycletime,
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  151  				   unsigned i=
nt mode)
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  152  {
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  153  	const struct ata=
_timing *t;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  154  	u32 val32;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  155  	u8 t2, t2i, t0;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  156  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  157  	t =3D ata_timing=
_find_mode(XFER_PIO_0 + mode);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  158  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  159  	/* PIO Data Setu=
p */
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  160  	t0 =3D DIV_ROUND=
_UP(cycletime, ideclk_period);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  161  	t2 =3D DIV_ROUND=
_UP(t->active, ideclk_period);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  162  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  163  	t2i =3D t0 - t2 =
- 1;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  164  	t2--;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  165  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  166  	val32 =3D ioread=
32(base + BK3710_DATSTB) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  167  	val32 |=3D t2 <<=
 (dev ? 8 : 0);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  168  	iowrite32(val32,=
 base + BK3710_DATSTB);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  169  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  170  	val32 =3D ioread=
32(base + BK3710_DATRCVR) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  171  	val32 |=3D t2i <=
< (dev ? 8 : 0);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  172  	iowrite32(val32,=
 base + BK3710_DATRCVR);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  173  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  174  	/* FIXME: this i=
s broken also in the old driver */
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  175  	if (pair) {
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  176  		u8 mode2 =3D pa=
ir->pio_mode - XFER_PIO_0;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  177  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  178  		if (mode2 < mod=
e)
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22 @179  			mode =3D mode2;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  180  	}
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  181  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  182  	/* TASKFILE Setu=
p */
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  183  	t0 =3D DIV_ROUND=
_UP(t->cyc8b, ideclk_period);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  184  	t2 =3D DIV_ROUND=
_UP(t->act8b, ideclk_period);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  185  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  186  	t2i =3D t0 - t2 =
- 1;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  187  	t2--;
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  188  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  189  	val32 =3D ioread=
32(base + BK3710_REGSTB) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  190  	val32 |=3D t2 <<=
 (dev ? 8 : 0);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  191  	iowrite32(val32,=
 base + BK3710_REGSTB);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  192  =

76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  193  	val32 =3D ioread=
32(base + BK3710_REGRCVR) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  194  	val32 |=3D t2i <=
< (dev ? 8 : 0);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  195  	iowrite32(val32,=
 base + BK3710_REGRCVR);
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  196  }
76a40ca82f3498 Bartlomiej Zolnierkiewicz 2017-03-22  197  =


:::::: The code@line 179 was first introduced by commit
:::::: 76a40ca82f3498da2683b3d5efa9b24d5ffaeecc ata: add Palmchip BK3710 PA=
TA controller driver

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Sekhar Nori <nsekhar@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3938132320947788148==--

