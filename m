Content-Type: multipart/mixed; boundary="===============4926148518785689925=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/4] drivers/i2c/mux: Add MAX735x support to PCA954x
Date: Thu, 16 Dec 2021 01:39:11 +0800
Message-ID: <202112160127.zeKl2IaT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4926148518785689925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211214095021.572799-2-patrick.rudolph@9elements.com>
References: <20211214095021.572799-2-patrick.rudolph@9elements.com>
TO: Patrick Rudolph <patrick.rudolph@9elements.com>
TO: Peter Rosin <peda@axentia.se>
CC: Patrick Rudolph <patrick.rudolph@9elements.com>
CC: linux-i2c(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Patrick,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on robh/for-next linux/master linus/master v5.16-r=
c5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrick-Rudolph/dt-binding=
s-i2c-Update-PCA954x/20211214-175258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-c007-20211214 (https://download.01.org/0day-ci/ar=
chive/20211216/202112160127.zeKl2IaT-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f8496516127398a7d70db34ee=
5edec917dd1cbed
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrick-Rudolph/dt-bindings-i2c-Up=
date-PCA954x/20211214-175258
        git checkout f8496516127398a7d70db34ee5edec917dd1cbed
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:532:9: note: Calling '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:480:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/nilfs2/btree.c:480:2: note: Taking true branch
           if (ret) {
           ^
   fs/nilfs2/btree.c:481:7: note: Assuming the condition is true
                   if (ret !=3D -EEXIST)
                       ^~~~~~~~~~~~~~
   fs/nilfs2/btree.c:481:3: note: Taking true branch
                   if (ret !=3D -EEXIST)
                   ^
   fs/nilfs2/btree.c:482:4: note: Returning without writing to '*bhp'
                           return ret;
                           ^
   fs/nilfs2/btree.c:532:9: note: Returning from '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:532:2: note: Returning without writing to '*bhp'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
           ^
   fs/nilfs2/btree.c:2325:8: note: Returning from 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:2326:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   fs/nilfs2/btree.c:2326:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2331:7: note: 1st function call argument is an uniniti=
alized value
           if (!buffer_dirty(bh))
                ^            ~~
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   net/9p/trans_fd.c:1036:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(sun_server.sun_path, addr);
           ^~~~~~
   net/9p/trans_fd.c:1036:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(sun_server.sun_path, addr);
           ^~~~~~
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
   4 warnings generated.
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/i2c/muxes/i2c-mux-pca954x.c:79:8: warning: Excessive padding in =
'struct chip_desc' (5 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   muxtype, =

   id, =

   nchans, =

   enable, =

   has_irq, =

   max7357, =

   max735x, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct chip_desc {
   ~~~~~~~^~~~~~~~~~~
   drivers/i2c/muxes/i2c-mux-pca954x.c:79:8: note: Excessive padding in 'st=
ruct chip_desc' (5 padding bytes, where 1 is optimal). Optimal fields order=
: muxtype, id, nchans, enable, has_irq, max7357, max735x, consider reorderi=
ng the fields or adding explicit padding members
   struct chip_desc {
   ~~~~~~~^~~~~~~~~~~
   1 warning generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   3 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/usb/mon/mon_bin.c:848:3: warning: Value stored to 'nbytes' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   nbytes -=3D step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:848:3: note: Value stored to 'nbytes' is never=
 read
                   nbytes -=3D step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: warning: Value stored to 'buf' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   buf +=3D step_len;
                   ^      ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: note: Value stored to 'buf' is never re=
ad
                   buf +=3D step_len;
                   ^      ~~~~~~~~
   1 warning generated.
   drivers/platform/x86/intel/smartconnect.c:22:3: warning: Value stored to=
 'status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D acpi_execute_simple_method(acpi->handle, "SAO=
S", 0);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/platform/x86/intel/smartconnect.c:22:3: note: Value stored to 's=
tatus' is never read
                   status =3D acpi_execute_simple_method(acpi->handle, "SAO=
S", 0);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   3 warnings generated.
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:505:3: warning: Value s=
tored to 'ret_val' is never read [clang-analyzer-deadcode.DeadStores]
                   ret_val =3D e1000_read_eeprom(hw, last_word, 1,
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:505:3: note: Value stor=
ed to 'ret_val' is never read
                   ret_val =3D e1000_read_eeprom(hw, last_word, 1,
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1218:2: warning: Value =
stored to 'ctrl_reg' is never read [clang-analyzer-deadcode.DeadStores]
           ctrl_reg =3D er32(CTRL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1218:2: note: Value sto=
red to 'ctrl_reg' is never read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +79 drivers/i2c/muxes/i2c-mux-pca954x.c

7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  78  =

7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11 @79  struct chip_desc {
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  80  	u8 nchans;
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  81  	u8 enable;	/* used for muxes only */
f2114795f721bd5 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid       2017-01=
-25  82  	u8 has_irq;
f8496516127398a drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph 2021-12=
-14  83  	u8 max7357;
f8496516127398a drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph 2021-12=
-14  84  	u8 max735x;
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  85  	enum muxtype {
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  86  		pca954x_ismux =3D 0,
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  87  		pca954x_isswi
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  88  	} muxtype;
2d74187d5b4e297 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin     2018-01=
-22  89  	struct i2c_device_identity id;
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  90  };
7f528135da9704d drivers/i2c/muxes/pca954x.c         Michael Lawnick 2010-08=
-11  91  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4926148518785689925==--

