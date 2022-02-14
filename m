Content-Type: multipart/mixed; boundary="===============5084197342543801108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 109/9999] drivers/spi/spi-cadence-quadspi.c:381:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 14 Feb 2022 19:20:41 +0800
Message-ID: <202202141940.dRk52SEp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5084197342543801108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
TO: Pratyush Yadav <p.yadav@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   38db5241d050c8022baf56d60b40d9a805809c8b
commit: be58a6d2184f996fa51cb83c98426fd634606d63 [109/9999] spi: cadence-qs=
pi: Tune PHY to allow running at higher frequencies
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20220213 (https://download.01.org/0day-ci/arc=
hive/20220214/202202141940.dRk52SEp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea0718=
84b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout be58a6d2184f996fa51cb83c98426fd634606d63
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/spi/spi-amd.c:176:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(xfer, &message->transfers,
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-amd.c:178:7: note: Assuming pointer value is null
                   if (xfer->rx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:178:7: note: Assuming field 'rx_buf' is null
                   if (xfer->rx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:178:3: note: Taking false branch
                   if (xfer->rx_buf)
                   ^
   drivers/spi/spi-amd.c:180:7: note: Assuming field 'tx_buf' is null
                   if (xfer->tx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:180:3: note: Taking false branch
                   if (xfer->tx_buf)
                   ^
   drivers/spi/spi-amd.c:183:3: note: Taking false branch
                   if (m_cmd & AMD_SPI_XFER_TX) {
                   ^
   drivers/spi/spi-amd.c:202:3: note: Taking true branch
                   if (m_cmd & AMD_SPI_XFER_RX) {
                   ^
   drivers/spi/spi-amd.c:208:4: note: Null pointer value stored to 'buf'
                           buf =3D (u8 *)xfer->rx_buf;
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amd.c:214:16: note: Assuming 'i' is < 'rx_len'
                           for (i =3D 0; i < rx_len; i++)
                                       ^~~~~~~~~~
   drivers/spi/spi-amd.c:214:4: note: Loop condition is true.  Entering loo=
p body
                           for (i =3D 0; i < rx_len; i++)
                           ^
   drivers/spi/spi-amd.c:215:12: note: Array access (from variable 'buf') r=
esults in a null pointer dereference
                                   buf[i] =3D amd_spi_readreg8(master,
                                   ~~~    ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   mm/oom_kill.c:255:17: warning: Value stored to 'highest_zoneidx' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:255:17: note: Value stored to 'highest_zoneidx' during its=
 initialization is never read
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   8 warnings generated.
   mm/page-writeback.c:1408:14: warning: The result of the left shift is un=
defined because the right operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1407:6: note: Assuming 'thresh' is > 'dirty'
           if (thresh > dirty)
               ^~~~~~~~~~~~~~
   mm/page-writeback.c:1407:2: note: Taking true branch
           if (thresh > dirty)
           ^
   mm/page-writeback.c:1408:18: note: '?' condition is false
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   mm/page-writeback.c:1408:18: note: '?' condition is false
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:160:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   mm/page-writeback.c:1408:14: note: The result of the left shift is undef=
ined because the right operand is negative
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/spi/spi-cadence-quadspi.c:381:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:381:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:405:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:405:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:429:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:429:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:453:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:453:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &f_pdata->cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:1901:3: warning: Value stored to 'buf'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   buf +=3D (from + len) - to_aligned;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:1901:3: note: Value stored to 'buf' is=
 never read
                   buf +=3D (from + len) - to_aligned;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:1987:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:1987:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &cqspi->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:2151:22: warning: Value stored to 'np'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/spi/spi-cadence-quadspi.c:2151:22: note: Value stored to 'np' du=
ring its initialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/spi/spi-mxic.c:381:7: warning: The result of the left shift is u=
ndefined because the left operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                              OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
                              ^
   drivers/spi/spi-mxic.c:80:31: note: expanded from macro 'OP_ADDR_BUSW'
   #define OP_ADDR_BUSW(x)         ((x) << 3)
                                    ~~~ ^
   drivers/spi/spi-mxic.c:361:8: note: Calling 'mxic_spi_set_freq'
           ret =3D mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);

vim +/dev +381 drivers/spi/spi-cadence-quadspi.c

be58a6d2184f99 Pratyush Yadav 2021-03-22  377  =

be58a6d2184f99 Pratyush Yadav 2021-03-22  378  static int cqspi_find_rx_low=
(struct cqspi_flash_pdata *f_pdata,
be58a6d2184f99 Pratyush Yadav 2021-03-22  379  			     struct spi_mem *mem,=
 struct phy_setting *phy)
be58a6d2184f99 Pratyush Yadav 2021-03-22  380  {
be58a6d2184f99 Pratyush Yadav 2021-03-22 @381  	struct device *dev =3D &f_p=
data->cqspi->pdev->dev;
be58a6d2184f99 Pratyush Yadav 2021-03-22  382  	int ret;
be58a6d2184f99 Pratyush Yadav 2021-03-22  383  =

be58a6d2184f99 Pratyush Yadav 2021-03-22  384  	do {
be58a6d2184f99 Pratyush Yadav 2021-03-22  385  		phy->rx =3D 0;
be58a6d2184f99 Pratyush Yadav 2021-03-22  386  		do {
be58a6d2184f99 Pratyush Yadav 2021-03-22  387  			cqspi_phy_apply_setting(f=
_pdata, phy);
be58a6d2184f99 Pratyush Yadav 2021-03-22  388  			ret =3D cqspi_phy_check_p=
attern(f_pdata, mem);
be58a6d2184f99 Pratyush Yadav 2021-03-22  389  			if (!ret)
be58a6d2184f99 Pratyush Yadav 2021-03-22  390  				return 0;
be58a6d2184f99 Pratyush Yadav 2021-03-22  391  =

be58a6d2184f99 Pratyush Yadav 2021-03-22  392  			phy->rx++;
be58a6d2184f99 Pratyush Yadav 2021-03-22  393  		} while (phy->rx <=3D CQSP=
I_PHY_LOW_RX_BOUND);
be58a6d2184f99 Pratyush Yadav 2021-03-22  394  =

be58a6d2184f99 Pratyush Yadav 2021-03-22  395  		phy->read_delay++;
be58a6d2184f99 Pratyush Yadav 2021-03-22  396  	} while (phy->read_delay <=
=3D CQSPI_PHY_MAX_RD);
be58a6d2184f99 Pratyush Yadav 2021-03-22  397  =

be58a6d2184f99 Pratyush Yadav 2021-03-22  398  	dev_dbg(dev, "Unable to fin=
d RX low\n");
be58a6d2184f99 Pratyush Yadav 2021-03-22  399  	return -ENOENT;
be58a6d2184f99 Pratyush Yadav 2021-03-22  400  }
be58a6d2184f99 Pratyush Yadav 2021-03-22  401  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5084197342543801108==--

