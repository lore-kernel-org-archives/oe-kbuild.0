Content-Type: multipart/mixed; boundary="===============8537782605063585355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [miquelraynal:spi-mem-ecc 14/32] drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 12 Feb 2022 18:39:01 +0800
Message-ID: <202202121643.7Mdqdg8r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8537782605063585355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://github.com/miquelraynal/linux-0day.git spi-mem-ecc
head:   3234204f0eca6678d33a93c4b47aebc72ad9783d
commit: cfe5cf69e97267e9d1de65cc894b7a2310644a15 [14/32] mtd: nand: mxic-ec=
c: Add Macronix external ECC engine support
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220208 (https://download.01.org/0day-ci/arc=
hive/20220212/202202121643.7Mdqdg8r-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/miquelraynal/linux-0day/commit/cfe5cf69e97267e=
9d1de65cc894b7a2310644a15
        git remote add miquelraynal https://github.com/miquelraynal/linux-0=
day.git
        git fetch --no-tags miquelraynal spi-mem-ecc
        git checkout cfe5cf69e97267e9d1de65cc894b7a2310644a15
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   drivers/net/net_failover.c:644:16: note: Loop condition is false.  Exiti=
ng loop
           primary_dev =3D rtnl_dereference(nfo_info->primary_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   drivers/net/net_failover.c:645:16: note: Left side of '&&' is false
           standby_dev =3D rtnl_dereference(nfo_info->standby_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   drivers/net/net_failover.c:645:16: note: Loop condition is false.  Exiti=
ng loop
           standby_dev =3D rtnl_dereference(nfo_info->standby_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   drivers/net/net_failover.c:647:6: note: Assuming 'slave_dev' is equal to=
 'primary_dev'
           if (slave_dev !=3D primary_dev && slave_dev !=3D standby_dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/net_failover.c:647:31: note: Left side of '&&' is false
           if (slave_dev !=3D primary_dev && slave_dev !=3D standby_dev)
                                        ^
   drivers/net/net_failover.c:650:7: note: Assuming 'primary_dev' is null
           if ((primary_dev && net_failover_xmit_ready(primary_dev)) ||
                ^~~~~~~~~~~
   drivers/net/net_failover.c:650:19: note: Left side of '&&' is false
           if ((primary_dev && net_failover_xmit_ready(primary_dev)) ||
                            ^
   drivers/net/net_failover.c:651:7: note: Assuming 'standby_dev' is null
               (standby_dev && net_failover_xmit_ready(standby_dev))) {
                ^~~~~~~~~~~
   drivers/net/net_failover.c:651:19: note: Left side of '&&' is false
               (standby_dev && net_failover_xmit_ready(standby_dev))) {
                            ^
   drivers/net/net_failover.c:660:35: note: Passing null pointer value via =
1st parameter 'slave_dev'
           net_failover_lower_state_changed(slave_dev, primary_dev, standby=
_dev);
                                            ^~~~~~~~~
   drivers/net/net_failover.c:660:2: note: Calling 'net_failover_lower_stat=
e_changed'
           net_failover_lower_state_changed(slave_dev, primary_dev, standby=
_dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/net/net_failover.c:441:23: note: Passing null pointer value via =
1st parameter 'dev'
           if (netif_carrier_ok(slave_dev))
                                ^~~~~~~~~
   drivers/net/net_failover.c:441:6: note: Calling 'netif_carrier_ok'
           if (netif_carrier_ok(slave_dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3925:43: note: Passing null pointer value via =
2nd parameter 'addr'
           return !test_bit(__LINK_STATE_NOCARRIER, &dev->state);
                                                    ^~~~~~~~~~~
   include/linux/netdevice.h:3925:10: note: Calling 'arch_test_bit'
           return !test_bit(__LINK_STATE_NOCARRIER, &dev->state);
                   ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mxic->dev;
                          ^~~   ~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:466:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D mxic->dev;
                          ^~~   ~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:548:2: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/mtd/nand/ecc-mxic.c:500:27: note: 'ret' declared without an init=
ial value
           int offset, nents, step, ret;
                                    ^~~
   drivers/mtd/nand/ecc-mxic.c:502:6: note: Assuming field 'mode' is not eq=
ual to MTD_OPS_RAW
           if (req->mode =3D=3D MTD_OPS_RAW)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:502:2: note: Taking false branch
           if (req->mode =3D=3D MTD_OPS_RAW)
           ^
   drivers/mtd/nand/ecc-mxic.c:508:6: note: Assuming field 'type' is not eq=
ual to NAND_PAGE_READ
           if (req->type =3D=3D NAND_PAGE_READ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:508:2: note: Taking false branch
           if (req->type =3D=3D NAND_PAGE_READ)
           ^
   drivers/mtd/nand/ecc-mxic.c:519:6: note: Assuming 'nents' is not equal t=
o 0
           if (!nents)
               ^~~~~~
   drivers/mtd/nand/ecc-mxic.c:519:2: note: Taking false branch
           if (!nents)
           ^
   drivers/mtd/nand/ecc-mxic.c:524:17: note: Assuming 'step' is >=3D field =
'steps'
           for (step =3D 0; step < ctx->steps; step++) {
                          ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:524:2: note: Loop condition is false. Execut=
ion continues on line 534
           for (step =3D 0; step < ctx->steps; step++) {
           ^
   drivers/mtd/nand/ecc-mxic.c:539:17: note: Assuming 'step' is >=3D field =
'steps'
           for (step =3D 0; step < ctx->steps; step++) {
                          ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:539:2: note: Loop condition is false. Execut=
ion continues on line 548
           for (step =3D 0; step < ctx->steps; step++) {
           ^
   drivers/mtd/nand/ecc-mxic.c:548:2: note: Undefined or garbage value retu=
rned to caller
           return ret;
           ^      ~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/mtd/nand/onenand/onenand_base.c:3751:23: warning: The result of =
the left shift is undefined due to shifting by '4294967265', which is great=
er or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinary=
OperatorResult]
           this->page_mask =3D (1 << (this->erase_shift - this->page_shift)=
) - 1;
                                ^
   drivers/mtd/nand/onenand/onenand_base.c:3818:6: note: Assuming field 're=
ad_word' is non-null
           if (!this->read_word)
               ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3818:2: note: Taking false branch
           if (!this->read_word)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3820:6: note: Assuming field 'wr=
ite_word' is non-null
           if (!this->write_word)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3820:2: note: Taking false branch
           if (!this->write_word)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3823:6: note: Assuming field 'co=
mmand' is non-null
           if (!this->command)
               ^~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3823:2: note: Taking false branch
           if (!this->command)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3825:6: note: Assuming field 'wa=
it' is non-null
           if (!this->wait)
               ^~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3825:2: note: Taking false branch
           if (!this->wait)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3827:6: note: Assuming field 'bb=
t_wait' is non-null
           if (!this->bbt_wait)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3827:2: note: Taking false branch
           if (!this->bbt_wait)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3829:6: note: Assuming field 'un=
lock_all' is non-null
           if (!this->unlock_all)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3829:2: note: Taking false branch
           if (!this->unlock_all)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3832:6: note: Assuming field 'ch=
ip_probe' is non-null
           if (!this->chip_probe)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3832:2: note: Taking false branch
           if (!this->chip_probe)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3835:6: note: Assuming field 're=
ad_bufferram' is non-null
           if (!this->read_bufferram)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3835:2: note: Taking false branch
           if (!this->read_bufferram)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3837:6: note: Assuming field 'wr=
ite_bufferram' is non-null
           if (!this->write_bufferram)

vim +/dev +466 drivers/mtd/nand/ecc-mxic.c

cfe5cf69e97267 Miquel Raynal 2021-12-16  460  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  461  static int mxic_ecc_count_bit=
errs(struct mxic_ecc_engine *mxic,
cfe5cf69e97267 Miquel Raynal 2021-12-16  462  				  struct nand_device *nan=
d)
cfe5cf69e97267 Miquel Raynal 2021-12-16  463  {
cfe5cf69e97267 Miquel Raynal 2021-12-16  464  	struct mxic_ecc_ctx *ctx =3D=
 nand_to_ecc_ctx(nand);
cfe5cf69e97267 Miquel Raynal 2021-12-16  465  	struct mtd_info *mtd =3D nan=
ddev_to_mtd(nand);
cfe5cf69e97267 Miquel Raynal 2021-12-16 @466  	struct device *dev =3D mxic-=
>dev;
cfe5cf69e97267 Miquel Raynal 2021-12-16  467  	unsigned int max_bf =3D 0;
cfe5cf69e97267 Miquel Raynal 2021-12-16  468  	bool failure =3D false;
cfe5cf69e97267 Miquel Raynal 2021-12-16  469  	int step;
cfe5cf69e97267 Miquel Raynal 2021-12-16  470  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  471  	for (step =3D 0; step < ctx-=
>steps; step++) {
cfe5cf69e97267 Miquel Raynal 2021-12-16  472  		u8 stat =3D ctx->status[ste=
p];
cfe5cf69e97267 Miquel Raynal 2021-12-16  473  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  474  		if (stat =3D=3D NO_ERR) {
cfe5cf69e97267 Miquel Raynal 2021-12-16  475  			dev_dbg(dev, "ECC step %d:=
 no error\n", step);
cfe5cf69e97267 Miquel Raynal 2021-12-16  476  		} else if (stat =3D=3D ERAS=
ED_CHUNK) {
cfe5cf69e97267 Miquel Raynal 2021-12-16  477  			dev_dbg(dev, "ECC step %d:=
 erased\n", step);
cfe5cf69e97267 Miquel Raynal 2021-12-16  478  		} else if (stat =3D=3D UNCO=
RR_ERR || stat > MAX_CORR_ERR) {
cfe5cf69e97267 Miquel Raynal 2021-12-16  479  			dev_dbg(dev, "ECC step %d:=
 uncorrectable\n", step);
cfe5cf69e97267 Miquel Raynal 2021-12-16  480  			mtd->ecc_stats.failed++;
cfe5cf69e97267 Miquel Raynal 2021-12-16  481  			failure =3D true;
cfe5cf69e97267 Miquel Raynal 2021-12-16  482  		} else {
cfe5cf69e97267 Miquel Raynal 2021-12-16  483  			dev_dbg(dev, "ECC step %d:=
 %d bits corrected\n",
cfe5cf69e97267 Miquel Raynal 2021-12-16  484  				step, stat);
cfe5cf69e97267 Miquel Raynal 2021-12-16  485  			max_bf =3D max_t(unsigned =
int, max_bf, stat);
cfe5cf69e97267 Miquel Raynal 2021-12-16  486  			mtd->ecc_stats.corrected +=
=3D stat;
cfe5cf69e97267 Miquel Raynal 2021-12-16  487  		}
cfe5cf69e97267 Miquel Raynal 2021-12-16  488  	}
cfe5cf69e97267 Miquel Raynal 2021-12-16  489  =

cfe5cf69e97267 Miquel Raynal 2021-12-16  490  	return failure ? -EBADMSG : =
max_bf;
cfe5cf69e97267 Miquel Raynal 2021-12-16  491  }
cfe5cf69e97267 Miquel Raynal 2021-12-16  492  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8537782605063585355==--

