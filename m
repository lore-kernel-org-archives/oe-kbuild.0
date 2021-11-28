Content-Type: multipart/mixed; boundary="===============1628771518020222489=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/spi/core.c:382:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 28 Nov 2021 20:39:01 +0800
Message-ID: <202111282028.6p6yXTPy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1628771518020222489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 3d1f08b032dc4e168f3aefed1e07a63c3c080325 mtd: spinand: Use the exte=
rnal ECC engine logic
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211118 (https://download.01.org/0day-ci/ar=
chive/20211128/202111282028.6p6yXTPy-lkp(a)intel.com/config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3d1f08b032dc4e168f3aefed1e07a63c3c080325
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3d1f08b032dc4e168f3aefed1e07a63c3c080325
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/usb/serial/iuu_phoenix.c:243:6: warning: Value stored to 'status=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           int status =3D urb->status;
               ^~~~~~   ~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:243:6: note: Value stored to 'status' d=
uring its initialization is never read
           int status =3D urb->status;
               ^~~~~~   ~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:532:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:532:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:655:3: warning: Value stored to 'error'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   error =3D 1;
                   ^       ~
   drivers/usb/serial/iuu_phoenix.c:655:3: note: Value stored to 'error' is=
 never read
                   error =3D 1;
                   ^       ~
   drivers/usb/serial/iuu_phoenix.c:663:3: warning: Value stored to 'status=
' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D iuu_read_buf(port, len);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:663:3: note: Value stored to 'status' i=
s never read
                   status =3D iuu_read_buf(port, len);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:668:3: warning: Value stored to 'status=
' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D iuu_status(port);
                   ^        ~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:668:3: note: Value stored to 'status' i=
s never read
                   status =3D iuu_status(port);
                   ^        ~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:676:3: warning: Value stored to 'status=
' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D iuu_reset(port, 0xC);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:676:3: note: Value stored to 'status' i=
s never read
                   status =3D iuu_reset(port, 0xC);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:683:3: warning: Value stored to 'status=
' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D iuu_bulk_write(port);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:683:3: note: Value stored to 'status' i=
s never read
                   status =3D iuu_bulk_write(port);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:729:2: warning: Value stored to 'result=
' is never read [clang-analyzer-deadcode.DeadStores]
           result =3D usb_submit_urb(port->read_urb, GFP_ATOMIC);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:729:2: note: Value stored to 'result' i=
s never read
           result =3D usb_submit_urb(port->read_urb, GFP_ATOMIC);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/iuu_phoenix.c:992:3: warning: Value stored to 'result=
' is never read [clang-analyzer-deadcode.DeadStores]
                   result =3D
                   ^
   drivers/usb/serial/iuu_phoenix.c:992:3: note: Value stored to 'result' i=
s never read
                   result =3D
                   ^
   drivers/usb/serial/iuu_phoenix.c:1000:3: warning: Value stored to 'resul=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   result =3D
                   ^
   drivers/usb/serial/iuu_phoenix.c:1000:3: note: Value stored to 'result' =
is never read
                   result =3D
                   ^
   drivers/usb/serial/iuu_phoenix.c:1007:3: warning: Value stored to 'resul=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   result =3D
                   ^
   drivers/usb/serial/iuu_phoenix.c:1007:3: note: Value stored to 'result' =
is never read
                   result =3D
                   ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/nand/raw/r852.c:593:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, data);
           ^~~~~~
   drivers/mtd/nand/raw/r852.c:593:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(buf, data);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/mtd/nand/spi/core.c:382:3: warning: Null pointer passed as 2nd a=
rgument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
                   ^
   drivers/mtd/nand/spi/core.c:680:2: note: Calling 'spinand_read_page'
           spinand_read_page(spinand, &req);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:528:29: note: Calling 'spinand_to_nand'
           struct nand_device *nand =3D spinand_to_nand(spinand);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:469:2: note: Returning without writing to 's=
pinand->base.memorg.oobsize', which participates in a condition later
           return &spinand->base;
           ^
   include/linux/mtd/spinand.h:469:2: note: Returning without writing to 's=
pinand->databuf'
   drivers/mtd/nand/spi/core.c:528:29: note: Returning from 'spinand_to_nan=
d'
           struct nand_device *nand =3D spinand_to_nand(spinand);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:532:8: note: Value assigned to field 'databu=
f'
           ret =3D nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *=
)req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/nand/spi/core.c:533:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/spi/core.c:533:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/spi/core.c:536:8: note: Calling 'spinand_load_page_op'
           ret =3D spinand_load_page_op(spinand, req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:335:29: note: Calling 'spinand_to_nand'
           struct nand_device *nand =3D spinand_to_nand(spinand);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:469:2: note: Returning without writing to 's=
pinand->base.memorg.oobsize', which participates in a condition later
           return &spinand->base;
           ^
   include/linux/mtd/spinand.h:469:2: note: Returning without writing to 's=
pinand->databuf'
   drivers/mtd/nand/spi/core.c:335:29: note: Returning from 'spinand_to_nan=
d'
           struct nand_device *nand =3D spinand_to_nand(spinand);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:336:21: note: Calling 'nanddev_pos_to_row'
           unsigned int row =3D nanddev_pos_to_row(nand, &req->pos);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/nand.h:763:2: note: Returning without writing to 'nand=
->memorg.oobsize', which participates in a condition later
           return (pos->lun << nand->rowconv.lun_addr_shift) |
           ^
   drivers/mtd/nand/spi/core.c:336:21: note: Returning from 'nanddev_pos_to=
_row'
           unsigned int row =3D nanddev_pos_to_row(nand, &req->pos);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:339:2: note: Returning without writing to 's=
pinand->base.memorg.oobsize', which participates in a condition later
           return spi_mem_exec_op(spinand->spimem, &op);
           ^
   drivers/mtd/nand/spi/core.c:339:2: note: Returning without writing to 's=
pinand->databuf'
   drivers/mtd/nand/spi/core.c:536:8: note: Returning from 'spinand_load_pa=
ge_op'
           ret =3D spinand_load_page_op(spinand, req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:537:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/spi/core.c:537:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/spi/core.c:540:8: note: Calling 'spinand_wait'
           ret =3D spinand_wait(spinand, &status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:471:9: note: Calling 'spinand_read_status'
                   ret =3D spinand_read_status(spinand, &status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:48:9: note: Calling 'spinand_read_reg_op'
           return spinand_read_reg_op(spinand, REG_STATUS, status);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:30:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/spi/core.c:30:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/spi/core.c:34:2: note: Returning without writing to 'sp=
inand->base.memorg.oobsize', which participates in a condition later
           return 0;
           ^
   drivers/mtd/nand/spi/core.c:34:2: note: Returning without writing to 'sp=
inand->databuf'
   drivers/mtd/nand/spi/core.c:48:9: note: Returning from 'spinand_read_reg=
_op'
           return spinand_read_reg_op(spinand, REG_STATUS, status);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:48:2: note: Returning without writing to 'sp=
inand->base.memorg.oobsize', which participates in a condition later
           return spinand_read_reg_op(spinand, REG_STATUS, status);
           ^
   drivers/mtd/nand/spi/core.c:48:2: note: Returning without writing to 'sp=
inand->databuf'
   drivers/mtd/nand/spi/core.c:471:9: note: Returning from 'spinand_read_st=
atus'
                   ret =3D spinand_read_status(spinand, &status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:472:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/mtd/nand/spi/core.c:472:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/mtd/nand/spi/core.c:475:7: note: Assuming the condition is true
                   if (!(status & STATUS_BUSY))
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:475:3: note: Taking true branch
                   if (!(status & STATUS_BUSY))
                   ^

vim +382 drivers/mtd/nand/spi/core.c

7529df4652482c Peter Pan       2018-06-22  341  =

7529df4652482c Peter Pan       2018-06-22  342  static int spinand_read_fro=
m_cache_op(struct spinand_device *spinand,
7529df4652482c Peter Pan       2018-06-22  343  				      const struct nand=
_page_io_req *req)
7529df4652482c Peter Pan       2018-06-22  344  {
7529df4652482c Peter Pan       2018-06-22  345  	struct nand_device *nand =
=3D spinand_to_nand(spinand);
981d1aa0697ce1 Boris Brezillon 2019-01-24  346  	struct spi_mem_dirmap_desc=
 *rdesc;
7529df4652482c Peter Pan       2018-06-22  347  	unsigned int nbytes =3D 0;
7529df4652482c Peter Pan       2018-06-22  348  	void *buf =3D NULL;
7529df4652482c Peter Pan       2018-06-22  349  	u16 column =3D 0;
981d1aa0697ce1 Boris Brezillon 2019-01-24  350  	ssize_t ret;
7529df4652482c Peter Pan       2018-06-22  351  =

7529df4652482c Peter Pan       2018-06-22  352  	if (req->datalen) {
7529df4652482c Peter Pan       2018-06-22  353  		buf =3D spinand->databuf;
981d1aa0697ce1 Boris Brezillon 2019-01-24  354  		nbytes =3D nanddev_page_s=
ize(nand);
981d1aa0697ce1 Boris Brezillon 2019-01-24  355  		column =3D 0;
7529df4652482c Peter Pan       2018-06-22  356  	}
7529df4652482c Peter Pan       2018-06-22  357  =

7529df4652482c Peter Pan       2018-06-22  358  	if (req->ooblen) {
7529df4652482c Peter Pan       2018-06-22  359  		nbytes +=3D nanddev_per_p=
age_oobsize(nand);
7529df4652482c Peter Pan       2018-06-22  360  		if (!buf) {
7529df4652482c Peter Pan       2018-06-22  361  			buf =3D spinand->oobbuf;
7529df4652482c Peter Pan       2018-06-22  362  			column =3D nanddev_page_=
size(nand);
7529df4652482c Peter Pan       2018-06-22  363  		}
7529df4652482c Peter Pan       2018-06-22  364  	}
7529df4652482c Peter Pan       2018-06-22  365  =

981d1aa0697ce1 Boris Brezillon 2019-01-24  366  	rdesc =3D spinand->dirmaps=
[req->pos.plane].rdesc;
7529df4652482c Peter Pan       2018-06-22  367  =

7529df4652482c Peter Pan       2018-06-22  368  	while (nbytes) {
981d1aa0697ce1 Boris Brezillon 2019-01-24  369  		ret =3D spi_mem_dirmap_re=
ad(rdesc, column, nbytes, buf);
981d1aa0697ce1 Boris Brezillon 2019-01-24  370  		if (ret < 0)
7529df4652482c Peter Pan       2018-06-22  371  			return ret;
7529df4652482c Peter Pan       2018-06-22  372  =

981d1aa0697ce1 Boris Brezillon 2019-01-24  373  		if (!ret || ret > nbytes)
981d1aa0697ce1 Boris Brezillon 2019-01-24  374  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  375  =

981d1aa0697ce1 Boris Brezillon 2019-01-24  376  		nbytes -=3D ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  377  		column +=3D ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  378  		buf +=3D ret;
7529df4652482c Peter Pan       2018-06-22  379  	}
7529df4652482c Peter Pan       2018-06-22  380  =

7529df4652482c Peter Pan       2018-06-22  381  	if (req->datalen)
7529df4652482c Peter Pan       2018-06-22 @382  		memcpy(req->databuf.in, s=
pinand->databuf + req->dataoffs,
7529df4652482c Peter Pan       2018-06-22  383  		       req->datalen);
7529df4652482c Peter Pan       2018-06-22  384  =

7529df4652482c Peter Pan       2018-06-22  385  	return 0;
7529df4652482c Peter Pan       2018-06-22  386  }
7529df4652482c Peter Pan       2018-06-22  387  =


:::::: The code at line 382 was first introduced by commit
:::::: 7529df4652482c33ae1a99ee8189401146f13cb7 mtd: nand: Add core infrast=
ructure to support SPI NANDs

:::::: TO: Peter Pan <peterpandong@micron.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1628771518020222489==--

