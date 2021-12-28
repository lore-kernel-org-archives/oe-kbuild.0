Content-Type: multipart/mixed; boundary="===============0604464167922411674=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/touchscreen/elants_i2c.c:754:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 29 Dec 2021 04:46:49 +0800
Message-ID: <202112290417.j2ZyYlcG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0604464167922411674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johnny Chuang <johnny.chuang.emc@gmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a8ad9a2434dc7967ab285437f443cae633b6fc1c
commit: 4ebfee2bbc1a9c343dd50565ba5ae249fac32267 Input: elants_i2c - do not=
 check Remark ID on eKTH3900/eKTH5312
date:   9 days ago
:::::: branch date: 28 hours ago
:::::: commit date: 9 days ago
config: i386-randconfig-c001-20211228 (https://download.01.org/0day-ci/arch=
ive/20211229/202112290417.j2ZyYlcG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4ebfee2bbc1a9c343dd50565ba5ae249fac32267
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4ebfee2bbc1a9c343dd50565ba5ae249fac32267
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:282:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:282:9: note: Dereference of null pointer
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/input/touchscreen/edt-ft5x06.c:705:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D tsdata->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/input/touchscreen/edt-ft5x06.c:705:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D tsdata->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/input/touchscreen/elants_i2c.c:150:8: warning: Excessive padding=
 in 'struct elants_data' (40 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   buf, =

   test_version, =

   fw_version, =

   client, =

   input, =

   vcc33, =

   vccio, =

   reset_gpio, =

   x_res, =

   y_res, =

   x_max, =

   y_max, =

   phy_x, =

   phy_y, =

   state, =

   chip_id, =

   iap_mode, =

   prop, =

   cmd_done, =

   sysfs_mutex, =

   hw_version, =

   solution_version, =

   bc_version, =

   iap_version, =

   major_res, =

   wake_irq_enabled, =

   keep_power_in_suspend, =

   cmd_resp, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct elants_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/input/touchscreen/elants_i2c.c:150:8: note: Excessive padding in=
 'struct elants_data' (40 padding bytes, where 8 is optimal). Optimal field=
s order: buf, test_version, fw_version, client, input, vcc33, vccio, reset_=
gpio, x_res, y_res, x_max, y_max, phy_x, phy_y, state, chip_id, iap_mode, p=
rop, cmd_done, sysfs_mutex, hw_version, solution_version, bc_version, iap_v=
ersion, major_res, wake_irq_enabled, keep_power_in_suspend, cmd_resp, consi=
der reordering the fields or adding explicit padding members
   struct elants_data {
   ~~~~~~~^~~~~~~~~~~~~
>> drivers/input/touchscreen/elants_i2c.c:754:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/elants_i2c.c:754:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:897:2: warning: Value stored to 't_low_ns'=
 is never read [clang-analyzer-deadcode.DeadStores]
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:897:2: note: Value stored to 't_low_ns' is=
 never read
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: warning: Value stored to 't_high_ns=
' is never read [clang-analyzer-deadcode.DeadStores]
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: note: Value stored to 't_high_ns' i=
s never read
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/fbdev/savage/savagefb-i2c.c:139:3: warning: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecur=
eAPI.strcpy]
                   strcpy(chan->adapter.name, name);
                   ^~~~~~
   drivers/video/fbdev/savage/savagefb-i2c.c:139:3: note: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119
                   strcpy(chan->adapter.name, name);
                   ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/fbdev/neofb.c:698:3: warning: Value stored to 'memlen' is =
never read [clang-analyzer-deadcode.DeadStores]
                   memlen =3D var->xres_virtual * var->bits_per_pixel *
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/neofb.c:698:3: note: Value stored to 'memlen' is nev=
er read
                   memlen =3D var->xres_virtual * var->bits_per_pixel *
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/fbdev/s3fb.c:1254:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->fix.id, s3_names [par->chip]);
           ^~~~~~
   drivers/video/fbdev/s3fb.c:1254:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(info->fix.id, s3_names [par->chip]);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (7 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/client +754 drivers/input/touchscreen/elants_i2c.c

f0b57e1901178a Johnny.Chuang 2019-12-12  751  =

4ebfee2bbc1a9c Johnny Chuang 2021-12-20  752  static bool elants_i2c_should=
_check_remark_id(struct elants_data *ts)
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  753  {
4ebfee2bbc1a9c Johnny Chuang 2021-12-20 @754  	struct i2c_client *client =
=3D ts->client;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  755  	const u8 bootcode_version =
=3D ts->iap_version;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  756  	bool check;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  757  =

4ebfee2bbc1a9c Johnny Chuang 2021-12-20  758  	/* I2C eKTH3900 and eKTH5312=
 are NOT support Remark ID */
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  759  	if ((bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH3900x1_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  760  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH3900x2_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  761  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH3900x3_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  762  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312x1_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  763  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312x2_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  764  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312cx1_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  765  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312cx2_I2C) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  766  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312x1_I2C_USB) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  767  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312x2_I2C_USB) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  768  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312cx1_I2C_USB) ||
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  769  	    (bootcode_version =3D=3D=
 BC_VER_H_BYTE_FOR_EKTH5312cx2_I2C_USB)) {
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  770  		dev_dbg(&client->dev,
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  771  			"eKTH3900/eKTH5312(0x%02x)=
 are not support remark id\n",
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  772  			bootcode_version);
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  773  		check =3D false;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  774  	} else if (bootcode_version =
>=3D 0x60) {
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  775  		check =3D true;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  776  	} else {
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  777  		check =3D false;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  778  	}
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  779  =

4ebfee2bbc1a9c Johnny Chuang 2021-12-20  780  	return check;
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  781  }
4ebfee2bbc1a9c Johnny Chuang 2021-12-20  782  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0604464167922411674==--

