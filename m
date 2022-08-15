Content-Type: multipart/mixed; boundary="===============9003627824066125262=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/rwonce.h:44:26: warning: use of uninitialized value 'field_value' [CWE-457]
Date: Mon, 15 Aug 2022 09:12:05 +0800
Message-ID: <202208150921.dGxzL6bZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9003627824066125262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/rwonce.h:44:26: warning: use of uninitialized value 'f=
ield_value' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jagath Jog J <jagathjog1996@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 3cf122c20bf835b53e8d2074611d68b7822be782 iio: accel: bma400: Add su=
pport for activity and inactivity events
date:   9 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220814 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150921.dGxzL6bZ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3cf122c20bf835b53e8d2074611d68b7822be782
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3cf122c20bf835b53e8d2074611d68b7822be782
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/iio/accel/bma400_core.c:14:
   drivers/iio/accel/bma400_core.c: In function 'bma400_activity_event_en':
>> include/asm-generic/rwonce.h:44:26: warning: use of uninitialized value =
'field_value' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
     281 |                 old__ =3D READ_ONCE(*(ptr));                    =
  \
         |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1056:17: note: in expansion of macro 'se=
t_mask_bits'
    1056 |                 set_mask_bits(&field_value, BMA400_INT_GEN1_MSK,
         |                 ^~~~~~~~~~~~~
     'bma400_activity_event_en': events 1-3
       |
       | 1049 |         int ret, reg, msk, value, field_value;
       |      |                                   ^~~~~~~~~~~
       |      |                                   |
       |      |                                   (1) region created on sta=
ck here
       | 1050 | =

       | 1051 |         switch (dir) {
       |      |         ~~~~~~                     =

       |      |         |
       |      |         (2) following 'case 1:' branch...
       | 1052 |         case IIO_EV_DIR_RISING:
       |      |         ~~~~                       =

       |      |         |
       |      |         (3) ...to here
       |
     'bma400_activity_event_en': event 4
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) use of uninitialized value 'fi=
eld_value' here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
       |  281 |                 old__ =3D READ_ONCE(*(ptr));               =
       \
       |      |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1056:17: note: in expansion of macro 'se=
t_mask_bits'
       | 1056 |                 set_mask_bits(&field_value, BMA400_INT_GEN1=
_MSK,
       |      |                 ^~~~~~~~~~~~~
       |
>> include/asm-generic/rwonce.h:44:26: warning: use of uninitialized value =
'field_value' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
     281 |                 old__ =3D READ_ONCE(*(ptr));                    =
  \
         |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1056:17: note: in expansion of macro 'se=
t_mask_bits'
    1056 |                 set_mask_bits(&field_value, BMA400_INT_GEN1_MSK,
         |                 ^~~~~~~~~~~~~
     'bma400_write_event_config': events 1-4
       |
       | 1104 | static int bma400_write_event_config(struct iio_dev *indio_=
dev,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'bma400_write_event_config'
       |......
       | 1112 |         switch (chan->type) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 3:' branch...
       | 1113 |         case IIO_ACCEL:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       | 1114 |                 mutex_lock(&data->mutex);
       | 1115 |                 ret =3D bma400_activity_event_en(data, dir,=
 state);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |                       |
       |      |                       (4) calling 'bma400_activity_event_en=
' from 'bma400_write_event_config'
       |
       +--> 'bma400_activity_event_en': events 5-8
              |
              | 1045 | static int bma400_activity_event_en(struct bma400_da=
ta *data,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'bma400_activity_event_en'
              |......
              | 1049 |         int ret, reg, msk, value, field_value;
              |      |                                   ~~~~~~~~~~~
              |      |                                   |
              |      |                                   (6) region created=
 on stack here
              | 1050 | =

              | 1051 |         switch (dir) {
              |      |         ~~~~~~
              |      |         |
              |      |         (7) following 'case 1:' branch...
              | 1052 |         case IIO_EV_DIR_RISING:
              |      |         ~~~~
              |      |         |
              |      |         (8) ...to here
              |
            'bma400_activity_event_en': event 9
              |
              |include/asm-generic/rwonce.h:44:26:
              |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_s=
calar_typeof(x) *)&(x))
              |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (9) use of uninitialized va=
lue 'field_value' here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
              |   50 |         __READ_ONCE(x);                             =
                    \
              |      |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
              |  281 |                 old__ =3D READ_ONCE(*(ptr));        =
              \
              |      |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1056:17: note: in expansion of macro 'se=
t_mask_bits'
              | 1056 |                 set_mask_bits(&field_value, BMA400_I=
NT_GEN1_MSK,
              |      |                 ^~~~~~~~~~~~~
              |
>> include/asm-generic/rwonce.h:44:26: warning: use of uninitialized value =
'field_value' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
     281 |                 old__ =3D READ_ONCE(*(ptr));                    =
  \
         |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1063:17: note: in expansion of macro 'se=
t_mask_bits'
    1063 |                 set_mask_bits(&field_value, BMA400_INT_GEN2_MSK,
         |                 ^~~~~~~~~~~~~
     'bma400_activity_event_en': events 1-3
       |
       | 1049 |         int ret, reg, msk, value, field_value;
       |      |                                   ^~~~~~~~~~~
       |      |                                   |
       |      |                                   (1) region created on sta=
ck here
       | 1050 | =

       | 1051 |         switch (dir) {
       |      |         ~~~~~~                     =

       |      |         |
       |      |         (2) following 'case 2:' branch...
       |......
       | 1059 |         case IIO_EV_DIR_FALLING:
       |      |         ~~~~                       =

       |      |         |
       |      |         (3) ...to here
       |
     'bma400_activity_event_en': event 4
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) use of uninitialized value 'fi=
eld_value' here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
       |  281 |                 old__ =3D READ_ONCE(*(ptr));               =
       \
       |      |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1063:17: note: in expansion of macro 'se=
t_mask_bits'
       | 1063 |                 set_mask_bits(&field_value, BMA400_INT_GEN2=
_MSK,
       |      |                 ^~~~~~~~~~~~~
       |
>> include/asm-generic/rwonce.h:44:26: warning: use of uninitialized value =
'field_value' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
     281 |                 old__ =3D READ_ONCE(*(ptr));                    =
  \
         |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1063:17: note: in expansion of macro 'se=
t_mask_bits'
    1063 |                 set_mask_bits(&field_value, BMA400_INT_GEN2_MSK,
         |                 ^~~~~~~~~~~~~
     'bma400_write_event_config': events 1-4
       |
       | 1104 | static int bma400_write_event_config(struct iio_dev *indio_=
dev,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'bma400_write_event_config'
       |......
       | 1112 |         switch (chan->type) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 3:' branch...
       | 1113 |         case IIO_ACCEL:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       | 1114 |                 mutex_lock(&data->mutex);
       | 1115 |                 ret =3D bma400_activity_event_en(data, dir,=
 state);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |                       |
       |      |                       (4) calling 'bma400_activity_event_en=
' from 'bma400_write_event_config'
       |
       +--> 'bma400_activity_event_en': events 5-8
              |
              | 1045 | static int bma400_activity_event_en(struct bma400_da=
ta *data,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'bma400_activity_event_en'
              |......
              | 1049 |         int ret, reg, msk, value, field_value;
              |      |                                   ~~~~~~~~~~~
              |      |                                   |
              |      |                                   (6) region created=
 on stack here
              | 1050 | =

              | 1051 |         switch (dir) {
              |      |         ~~~~~~
              |      |         |
              |      |         (7) following 'case 2:' branch...
              |......
              | 1059 |         case IIO_EV_DIR_FALLING:
              |      |         ~~~~
              |      |         |
              |      |         (8) ...to here
              |
            'bma400_activity_event_en': event 9
              |
              |include/asm-generic/rwonce.h:44:26:
              |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_s=
calar_typeof(x) *)&(x))
              |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (9) use of uninitialized va=
lue 'field_value' here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
              |   50 |         __READ_ONCE(x);                             =
                    \
              |      |         ^~~~~~~~~~~
   include/linux/bitops.h:281:25: note: in expansion of macro 'READ_ONCE'
              |  281 |                 old__ =3D READ_ONCE(*(ptr));        =
              \
              |      |                         ^~~~~~~~~
   drivers/iio/accel/bma400_core.c:1063:17: note: in expansion of macro 'se=
t_mask_bits'
              | 1063 |                 set_mask_bits(&field_value, BMA400_I=
NT_GEN2_MSK,
              |      |                 ^~~~~~~~~~~~~
              |

vim +/field_value +44 include/asm-generic/rwonce.h

e506ea451254ab1 Will Deacon 2019-10-15  28  =

e506ea451254ab1 Will Deacon 2019-10-15  29  /*
e506ea451254ab1 Will Deacon 2019-10-15  30   * Yes, this permits 64-bit acc=
esses on 32-bit architectures. These will
e506ea451254ab1 Will Deacon 2019-10-15  31   * actually be atomic in some c=
ases (namely Armv7 + LPAE), but for others we
e506ea451254ab1 Will Deacon 2019-10-15  32   * rely on the access being spl=
it into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab1 Will Deacon 2019-10-15  33   * (e.g. a virtual address) and=
 a strong prevailing wind.
e506ea451254ab1 Will Deacon 2019-10-15  34   */
e506ea451254ab1 Will Deacon 2019-10-15  35  #define compiletime_assert_rwon=
ce_type(t)					\
e506ea451254ab1 Will Deacon 2019-10-15  36  	compiletime_assert(__native_wo=
rd(t) || sizeof(t) =3D=3D sizeof(long long),	\
e506ea451254ab1 Will Deacon 2019-10-15  37  		"Unsupported access size for =
{READ,WRITE}_ONCE().")
e506ea451254ab1 Will Deacon 2019-10-15  38  =

e506ea451254ab1 Will Deacon 2019-10-15  39  /*
e506ea451254ab1 Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of=
 READ_ONCE() if you do not require any
3c9184109e78ea2 Will Deacon 2019-10-30  41   * atomicity. Note that this ma=
y result in tears!
e506ea451254ab1 Will Deacon 2019-10-15  42   */
b78b331a3f5c077 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab1 Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const=
 volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c077 Will Deacon 2019-10-15  45  #endif
e506ea451254ab1 Will Deacon 2019-10-15  46  =


:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRI=
TE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9003627824066125262==--

