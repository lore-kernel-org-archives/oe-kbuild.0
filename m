Content-Type: multipart/mixed; boundary="===============3536794027191286036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/ti-abb-regulator.c:754:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 28 Nov 2021 00:32:10 +0800
Message-ID: <202111280010.bu4EWVZD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3536794027191286036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: b36061c2ea5bdacf51305f8bc79f29595b343eb6 regulator: ti-abb: Kconfig=
: Add helper dependency on COMPILE_TEST
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20211012 (https://download.01.org/0day-ci/archi=
ve/20211128/202111280010.bu4EWVZD-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dcf3=
9554dbea780d6cb7e12239451ba47a2668)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db36061c2ea5bdacf51305f8bc79f29595b343eb6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b36061c2ea5bdacf51305f8bc79f29595b343eb6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to '->p'
   }
   ^
   drivers/base/bus.c:573:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:574:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:872:2: note: Returning from 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:873:18: note: Access to field 'drivers_kset' results =
in a dereference of a null pointer (loaded from field 'p')
           kset_unregister(bus->p->drivers_kset);
                           ^    ~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/rtc/rtc-rs5c372.c:564:2: warning: Value stored to 'addr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           addr   =3D RS5C_ADDR(RS5C_REG_CTRL1);
           ^
   drivers/rtc/rtc-rs5c372.c:564:2: note: Value stored to 'addr' is never r=
ead
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/rtc/rtc-rx8025.c:197:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D RX8025_BIT_CTRL2_DAFG;
                   ^
   drivers/rtc/rtc-rx8025.c:197:3: note: Value stored to 'status' is never =
read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   lib/zstd/decompress.c:1557:4: warning: Value stored to 'remainingSize' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           remainingSize -=3D 4;
                           ^                ~
   lib/zstd/decompress.c:1557:4: note: Value stored to 'remainingSize' is n=
ever read
                           remainingSize -=3D 4;
                           ^                ~
   Suppressed 5 warnings (5 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/regulator/ti-abb-regulator.c:754:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:754:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/dma/uniphier-xdmac.c:208:2: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   drivers/dma/uniphier-xdmac.c:208:2: note: Value stored to 'val' is never=
 read
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/power/supply/isp1704_charger.c:361:51: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
           vendor |=3D isp1704_read(isp, ULPI_VENDOR_ID_HIGH) << 8;
                                                            ^
   drivers/power/supply/isp1704_charger.c:387:6: note: Assuming 'isp' is no=
n-null
           if (!isp)
               ^~~~
   drivers/power/supply/isp1704_charger.c:387:2: note: Taking false branch
           if (!isp)
           ^
   drivers/power/supply/isp1704_charger.c:392:2: note: Taking false branch
           if (IS_ERR(isp->enable_gpio)) {
           ^
   drivers/power/supply/isp1704_charger.c:398:6: note: Assuming field 'of_n=
ode' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/power/supply/isp1704_charger.c:398:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/power/supply/isp1704_charger.c:403:2: note: Taking false branch
           if (IS_ERR(isp->phy)) {
           ^
   drivers/power/supply/isp1704_charger.c:414:8: note: Calling 'isp1704_tes=
t_ulpi'
           ret =3D isp1704_test_ulpi(isp);
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/isp1704_charger.c:349:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/power/supply/isp1704_charger.c:349:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/power/supply/isp1704_charger.c:353:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/power/supply/isp1704_charger.c:353:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/power/supply/isp1704_charger.c:356:6: note: Assuming 'ret' is eq=
ual to 170
           if (ret !=3D 0xaa)
               ^~~~~~~~~~~
   drivers/power/supply/isp1704_charger.c:356:2: note: Taking false branch
           if (ret !=3D 0xaa)
           ^
   drivers/power/supply/isp1704_charger.c:361:12: note: Calling 'isp1704_re=
ad'
           vendor |=3D isp1704_read(isp, ULPI_VENDOR_ID_HIGH) << 8;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/isp1704_charger.c:63:9: note: Calling 'usb_phy_io_r=
ead'
           return usb_phy_io_read(isp->phy, reg);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/phy.h:168:6: note: 'x' is non-null
           if (x && x->io_ops && x->io_ops->read)
               ^
   include/linux/usb/phy.h:168:6: note: Left side of '&&' is true
   include/linux/usb/phy.h:168:14: note: Field 'io_ops' is null
           if (x && x->io_ops && x->io_ops->read)
                       ^
--
   drivers/dma/sun6i-dma.c:611:2: note: Taking false branch
           if (!(BIT(src_maxburst) & sdev->cfg->src_burst_lengths))
           ^
   drivers/dma/sun6i-dma.c:613:6: note: Assuming the condition is false
           if (!(BIT(dst_maxburst) & sdev->cfg->dst_burst_lengths))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:613:2: note: Taking false branch
           if (!(BIT(dst_maxburst) & sdev->cfg->dst_burst_lengths))
           ^
   drivers/dma/sun6i-dma.c:626:2: note: Returning zero, which participates =
in a condition later
           return 0;
           ^~~~~~~~
   drivers/dma/sun6i-dma.c:779:8: note: Returning from 'set_config'
           ret =3D set_config(sdev, sconfig, dir, &lli_cfg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:780:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/dma/sun6i-dma.c:780:2: note: Taking false branch
           if (ret) {
           ^
   drivers/dma/sun6i-dma.c:785:8: note: Calling 'kzalloc'
           txd =3D kzalloc(sizeof(*txd), GFP_NOWAIT);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:785:8: note: Returning from 'kzalloc'
           txd =3D kzalloc(sizeof(*txd), GFP_NOWAIT);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:786:6: note: Assuming 'txd' is non-null
           if (!txd)
               ^~~~
   drivers/dma/sun6i-dma.c:786:2: note: Taking false branch
           if (!txd)
           ^
   drivers/dma/sun6i-dma.c:789:14: note: Assuming 'i' is >=3D 'periods'
           for (i =3D 0; i < periods; i++) {
                       ^~~~~~~~~~~
   drivers/dma/sun6i-dma.c:789:2: note: Loop condition is false. Execution =
continues on line 816
           for (i =3D 0; i < periods; i++) {
           ^
   drivers/dma/sun6i-dma.c:816:19: note: Access to field 'p_lli_next' resul=
ts in a dereference of a null pointer (loaded from variable 'prev')
           prev->p_lli_next =3D txd->p_lli;          /* cyclic list */
           ~~~~             ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/regulator/ti-abb-regulator.c:754:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:754:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/fuse/cuse.c:359:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:359:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/fuse/virtio_fs.c:900:2: warning: Attempt to free released memory [cla=
ng-analyzer-unix.Malloc]
           kfree(fs->vqs);
           ^~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:867:6: note: Assuming 'fs' is non-null
           if (!fs)
               ^~~
   fs/fuse/virtio_fs.c:867:2: note: Taking false branch
           if (!fs)
           ^
   fs/fuse/virtio_fs.c:873:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   fs/fuse/virtio_fs.c:873:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/fuse/virtio_fs.c:876:8: note: Calling 'virtio_fs_setup_vqs'
           ret =3D virtio_fs_setup_vqs(vdev, fs);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:679:2: note: Loop condition is false.  Exiting loop
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queue=
s,
           ^
   include/linux/virtio_config.h:396:3: note: expanded from macro 'virtio_c=
read_le'
                   might_sleep();                                          \
                   ^
   include/linux/kernel.h:132:45: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
                                                      ^
   include/linux/kernel.h:109:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   fs/fuse/virtio_fs.c:679:2: note: Loop condition is false.  Exiting loop
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queue=
s,
           ^
   include/linux/virtio_config.h:396:3: note: expanded from macro 'virtio_c=
read_le'
                   might_sleep();                                          \
                   ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
           ^
   fs/fuse/virtio_fs.c:679:2: note: Control jumps to 'case 4:' @line 679
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queue=
s,
           ^
   include/linux/virtio_config.h:400:3: note: expanded from macro 'virtio_c=
read_le'
                   switch (sizeof(virtio_cread_v)) {                       \
                   ^
   fs/fuse/virtio_fs.c:679:2: note:  Execution continues on line 679
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queue=
s,
           ^
   include/linux/virtio_config.h:408:4: note: expanded from macro 'virtio_c=
read_le'
                           break;                                          \
                           ^
   fs/fuse/virtio_fs.c:679:2: note: Loop condition is false.  Exiting loop
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queue=
s,
           ^
   include/linux/virtio_config.h:393:2: note: expanded from macro 'virtio_c=
read_le'
           do {                                                            \

vim +/ret +754 drivers/regulator/ti-abb-regulator.c

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  685  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  686  /**
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  687   * ti_abb_probe() =
- Initialize an ABB ldo instance
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  688   * @pdev: ABB plat=
form device
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  689   *
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  690   * Initializes an =
individual ABB LDO for required Body-Bias. ABB is used to
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  691   * addional bias s=
upply to SoC modules for power savings or mandatory stability
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  692   * configuration a=
t certain Operating Performance Points(OPPs).
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  693   *
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  694   * Return: 0 on su=
ccess or appropriate error value when fails
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  695   */
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  696  static int ti_abb_=
probe(struct platform_device *pdev)
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  697  {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  698  	struct device *de=
v =3D &pdev->dev;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  699  	const struct of_d=
evice_id *match;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  700  	struct resource *=
res;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  701  	struct ti_abb *ab=
b;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  702  	struct regulator_=
init_data *initdata =3D NULL;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  703  	struct regulator_=
dev *rdev =3D NULL;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  704  	struct regulator_=
desc *desc;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  705  	struct regulation=
_constraints *c;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  706  	struct regulator_=
config config =3D { };
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  707  	char *pname;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  708  	int ret =3D 0;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  709  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  710  	match =3D of_matc=
h_device(ti_abb_of_match, dev);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  711  	if (!match) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  712  		/* We do not exp=
ect this to happen */
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  713  		dev_err(dev, "%s=
: Unable to match device\n", __func__);
91dfc80d84eee0 Sachin Kamat             2013-09-04  714  		return -ENODEV;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  715  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  716  	if (!match->data)=
 {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  717  		dev_err(dev, "%s=
: Bad data in match\n", __func__);
91dfc80d84eee0 Sachin Kamat             2013-09-04  718  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  719  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  720  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  721  	abb =3D devm_kzal=
loc(dev, sizeof(struct ti_abb), GFP_KERNEL);
91dfc80d84eee0 Sachin Kamat             2013-09-04  722  	if (!abb)
91dfc80d84eee0 Sachin Kamat             2013-09-04  723  		return -ENOMEM;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  724  	abb->regs =3D mat=
ch->data;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  725  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  726  	/* Map ABB resour=
ces */
6127daa85094e2 Nishanth Menon           2014-01-23  727  	if (abb->regs->se=
tup_off || abb->regs->control_off) {
b36c6b1887ffc6 Cai Huoqing              2021-09-08  728  		abb->base =3D de=
vm_platform_ioremap_resource_byname(pdev, "base-address");
91dfc80d84eee0 Sachin Kamat             2013-09-04  729  		if (IS_ERR(abb->=
base))
91dfc80d84eee0 Sachin Kamat             2013-09-04  730  			return PTR_ERR(=
abb->base);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  731  =

6127daa85094e2 Nishanth Menon           2014-01-23  732  		abb->setup_reg =
=3D abb->base + abb->regs->setup_off;
6127daa85094e2 Nishanth Menon           2014-01-23  733  		abb->control_reg=
 =3D abb->base + abb->regs->control_off;
6127daa85094e2 Nishanth Menon           2014-01-23  734  =

6127daa85094e2 Nishanth Menon           2014-01-23  735  	} else {
b36c6b1887ffc6 Cai Huoqing              2021-09-08  736  		abb->control_reg=
 =3D devm_platform_ioremap_resource_byname(pdev, "control-address");
6127daa85094e2 Nishanth Menon           2014-01-23  737  		if (IS_ERR(abb->=
control_reg))
6127daa85094e2 Nishanth Menon           2014-01-23  738  			return PTR_ERR(=
abb->control_reg);
6127daa85094e2 Nishanth Menon           2014-01-23  739  =

b36c6b1887ffc6 Cai Huoqing              2021-09-08  740  		abb->setup_reg =
=3D devm_platform_ioremap_resource_byname(pdev, "setup-address");
6127daa85094e2 Nishanth Menon           2014-01-23  741  		if (IS_ERR(abb->=
setup_reg))
6127daa85094e2 Nishanth Menon           2014-01-23  742  			return PTR_ERR(=
abb->setup_reg);
6127daa85094e2 Nishanth Menon           2014-01-23  743  	}
6127daa85094e2 Nishanth Menon           2014-01-23  744  =

b36c6b1887ffc6 Cai Huoqing              2021-09-08  745  	abb->int_base =3D=
 devm_platform_ioremap_resource_byname(pdev, "int-address");
b36c6b1887ffc6 Cai Huoqing              2021-09-08  746  	if (IS_ERR(abb->i=
nt_base))
b36c6b1887ffc6 Cai Huoqing              2021-09-08  747  		return PTR_ERR(a=
bb->int_base);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  748  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  749  	/* Map Optional r=
esources */
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  750  	pname =3D "efuse-=
address";
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  751  	res =3D platform_=
get_resource_byname(pdev, IORESOURCE_MEM, pname);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  752  	if (!res) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  753  		dev_dbg(dev, "Mi=
ssing '%s' IO resource\n", pname);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02 @754  		ret =3D -ENODEV;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  755  		goto skip_opt;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  756  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  757  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  758  	/*
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  759  	 * We may have sh=
ared efuse register offsets which are read-only
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  760  	 * between domains
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  761  	 */
4bdc0d676a6431 Christoph Hellwig        2020-01-06  762  	abb->efuse_base =
=3D devm_ioremap(dev, res->start,
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  763  					       resour=
ce_size(res));
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  764  	if (!abb->efuse_b=
ase) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  765  		dev_err(dev, "Un=
able to map '%s'\n", pname);
91dfc80d84eee0 Sachin Kamat             2013-09-04  766  		return -ENOMEM;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  767  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  768  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  769  	pname =3D "ldo-ad=
dress";
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  770  	res =3D platform_=
get_resource_byname(pdev, IORESOURCE_MEM, pname);
bde251a9a813bf Nishanth Menon           2013-09-27  771  	if (!res) {
bde251a9a813bf Nishanth Menon           2013-09-27  772  		dev_dbg(dev, "Mi=
ssing '%s' IO resource\n", pname);
bde251a9a813bf Nishanth Menon           2013-09-27  773  		ret =3D -ENODEV;
bde251a9a813bf Nishanth Menon           2013-09-27  774  		goto skip_opt;
bde251a9a813bf Nishanth Menon           2013-09-27  775  	}
d26ec830f5d734 Tushar Behera            2013-06-18  776  	abb->ldo_base =3D=
 devm_ioremap_resource(dev, res);
91dfc80d84eee0 Sachin Kamat             2013-09-04  777  	if (IS_ERR(abb->l=
do_base))
91dfc80d84eee0 Sachin Kamat             2013-09-04  778  		return PTR_ERR(a=
bb->ldo_base);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  779  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  780  	/* IF ldo_base is=
 set, the following are mandatory */
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  781  	pname =3D "ti,ldo=
vbb-override-mask";
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  782  	ret =3D
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  783  	    of_property_r=
ead_u32(pdev->dev.of_node, pname,
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  784  				 &abb->ldovbb_=
override_mask);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  785  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  786  		dev_err(dev, "Mi=
ssing '%s' (%d)\n", pname, ret);
91dfc80d84eee0 Sachin Kamat             2013-09-04  787  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  788  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  789  	if (!abb->ldovbb_=
override_mask) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  790  		dev_err(dev, "In=
valid property:'%s' set as 0!\n", pname);
91dfc80d84eee0 Sachin Kamat             2013-09-04  791  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  792  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  793  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  794  	pname =3D "ti,ldo=
vbb-vset-mask";
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  795  	ret =3D
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  796  	    of_property_r=
ead_u32(pdev->dev.of_node, pname,
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  797  				 &abb->ldovbb_=
vset_mask);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  798  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  799  		dev_err(dev, "Mi=
ssing '%s' (%d)\n", pname, ret);
91dfc80d84eee0 Sachin Kamat             2013-09-04  800  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  801  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  802  	if (!abb->ldovbb_=
vset_mask) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  803  		dev_err(dev, "In=
valid property:'%s' set as 0!\n", pname);
91dfc80d84eee0 Sachin Kamat             2013-09-04  804  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  805  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  806  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  807  skip_opt:
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  808  	pname =3D "ti,tra=
nxdone-status-mask";
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  809  	ret =3D
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  810  	    of_property_r=
ead_u32(pdev->dev.of_node, pname,
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  811  				 &abb->txdone_=
mask);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  812  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  813  		dev_err(dev, "Mi=
ssing '%s' (%d)\n", pname, ret);
91dfc80d84eee0 Sachin Kamat             2013-09-04  814  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  815  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  816  	if (!abb->txdone_=
mask) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  817  		dev_err(dev, "In=
valid property:'%s' set as 0!\n", pname);
91dfc80d84eee0 Sachin Kamat             2013-09-04  818  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  819  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  820  =

072e78b12bf518 Javier Martinez Canillas 2014-11-10  821  	initdata =3D of_g=
et_regulator_init_data(dev, pdev->dev.of_node,
072e78b12bf518 Javier Martinez Canillas 2014-11-10  822  					      &abb->r=
desc);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  823  	if (!initdata) {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  824  		dev_err(dev, "%s=
: Unable to alloc regulator init data\n",
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  825  			__func__);
91dfc80d84eee0 Sachin Kamat             2013-09-04  826  		return -ENOMEM;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  827  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  828  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  829  	/* init ABB opp_s=
el table */
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  830  	ret =3D ti_abb_in=
it_table(dev, abb, initdata);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  831  	if (ret)
91dfc80d84eee0 Sachin Kamat             2013-09-04  832  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  833  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  834  	/* init ABB timin=
g */
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  835  	ret =3D ti_abb_in=
it_timings(dev, abb);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  836  	if (ret)
91dfc80d84eee0 Sachin Kamat             2013-09-04  837  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  838  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  839  	desc =3D &abb->rd=
esc;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  840  	desc->name =3D de=
v_name(dev);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  841  	desc->owner =3D T=
HIS_MODULE;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  842  	desc->type =3D RE=
GULATOR_VOLTAGE;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  843  	desc->ops =3D &ti=
_abb_reg_ops;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  844  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  845  	c =3D &initdata->=
constraints;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  846  	if (desc->n_volta=
ges > 1)
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  847  		c->valid_ops_mas=
k |=3D REGULATOR_CHANGE_VOLTAGE;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  848  	c->always_on =3D =
true;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  849  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  850  	config.dev =3D de=
v;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  851  	config.init_data =
=3D initdata;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  852  	config.driver_dat=
a =3D abb;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  853  	config.of_node =
=3D pdev->dev.of_node;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  854  =

91dfc80d84eee0 Sachin Kamat             2013-09-04  855  	rdev =3D devm_reg=
ulator_register(dev, desc, &config);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  856  	if (IS_ERR(rdev))=
 {
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  857  		ret =3D PTR_ERR(=
rdev);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  858  		dev_err(dev, "%s=
: failed to register regulator(%d)\n",
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  859  			__func__, ret);
91dfc80d84eee0 Sachin Kamat             2013-09-04  860  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  861  	}
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  862  	platform_set_drvd=
ata(pdev, rdev);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  863  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  864  	/* Enable the ldo=
 if not already done by bootloader */
6127daa85094e2 Nishanth Menon           2014-01-23  865  	ti_abb_rmw(abb->r=
egs->sr2_en_mask, 1, abb->setup_reg);
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  866  =

40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  867  	return 0;
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  868  }
40b1936efebdb9 Andrii.Tseglytskyi       2013-05-02  869  =


:::::: The code at line 754 was first introduced by commit
:::::: 40b1936efebdb9c31d9ed6fe59055f71ea366509 regulator: Introduce TI Ada=
ptive Body Bias(ABB) on-chip LDO driver

:::::: TO: Andrii.Tseglytskyi <andrii.tseglytskyi@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3536794027191286036==--

