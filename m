Content-Type: multipart/mixed; boundary="===============7198302901235092202=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/cmpxchg-local.h:36:22: warning: use of uninitialized value '*(u32 *)ptr' [CWE-457]
Date: Sat, 06 Aug 2022 16:11:55 +0800
Message-ID: <202208061603.SwhrV1Fc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7198302901235092202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/cmpxchg-local.h:36:22: warning: use of uninitialized v=
alue '*(u32 *)ptr' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jagath Jog J <jagathjog1996@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 3cf122c20bf835b53e8d2074611d68b7822be782 iio: accel: bma400: Add su=
pport for activity and inactivity events
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220806/202208061603.SwhrV1Fc-lkp(a)intel.com/config)
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
   In file included from arch/arm/include/asm/cmpxchg.h:122,
                    from arch/arm/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:243,
                    from include/linux/bitops.h:33,
                    from drivers/iio/accel/bma400_core.c:15:
   include/asm-generic/cmpxchg-local.h: In function '__generic_cmpxchg_loca=
l':
>> include/asm-generic/cmpxchg-local.h:36:22: warning: use of uninitialized=
 value '*(u32 *)ptr' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      36 |         case 4: prev =3D *(u32 *)ptr;
         |                 ~~~~~^~~~~~~~~~~~~
     'bma400_activity_event_en': events 1-4
       |
       |drivers/iio/accel/bma400_core.c:1045:12:
       | 1045 | static int bma400_activity_event_en(struct bma400_data *dat=
a,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'bma400_activity_event_en'
       |......
       | 1049 |         int ret, reg, msk, value, field_value;
       |      |                                   ~~~~~~~~~~~
       |      |                                   |
       |      |                                   (2) region created on sta=
ck here
       | 1050 | =

       | 1051 |         switch (dir) {
       |      |         ~~~~~~
       |      |         |
       |      |         (3) following 'case 1:' branch...
       | 1052 |         case IIO_EV_DIR_RISING:
       |      |         ~~~~
       |      |         |
       |      |         (4) ...to here
       |
     'bma400_activity_event_en': event 5
       |
       |arch/arm/include/asm/cmpxchg.h:138:25:
       |  138 |         (__typeof(*ptr))__generic_cmpxchg_local((ptr),     =
             \
       |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (5) calling '__generic_cmpxchg_loca=
l' from 'bma400_activity_event_en'
       |  139 |                                                 (unsigned l=
ong)(o),     \
       |      |                                                 ~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |  140 |                                                 (unsigned l=
ong)(n),     \
       |      |                                                 ~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |  141 |                                                 sizeof(*(pt=
r)));        \
       |      |                                                 ~~~~~~~~~~~=
~~~~
   include/asm-generic/cmpxchg.h:112:33: note: in expansion of macro 'arch_=
cmpxchg_local'
       |  112 | #define arch_cmpxchg            arch_cmpxchg_local
       |      |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1916:9: note: in expansion of=
 macro 'arch_cmpxchg'
       | 1916 |         arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
       |      |         ^~~~~~~~~~~~
   include/linux/bitops.h:283:18: note: in expansion of macro 'cmpxchg'
       |  283 |         } while (cmpxchg(ptr, old__, new__) !=3D old__);   =
       \
       |      |                  ^~~~~~~
   drivers/iio/accel/bma400_core.c:1056:17: note: in expansion of macro 'se=
t_mask_bits'
       | 1056 |                 set_mask_bits(&field_value, BMA400_INT_GEN1=
_MSK,
       |      |                 ^~~~~~~~~~~~~
       |
       +--> '__generic_cmpxchg_local': events 6-7
              |
              |include/asm-generic/cmpxchg-local.h:15:29:
              |   15 | static inline unsigned long __generic_cmpxchg_local(=
volatile void *ptr,
              |      |                             ^~~~~~~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (6) entry to '__generic_=
cmpxchg_local'
              |......
              |   23 |         if (size =3D=3D 8 && sizeof(unsigned long) !=
=3D 8)
              |      |            ~                 =

              |      |            |
              |      |            (7) following 'false' branch (when 'size =
!=3D 8')...
              |
            '__generic_cmpxchg_local': event 8
              |
              |arch/arm/include/asm/irqflags.h:76:9:
              |   76 |         asm volatile(
              |      |         ^~~
              |      |         |
              |      |         (8) ...to here
              |
            '__generic_cmpxchg_local': events 9-11
              |
              |include/asm-generic/cmpxchg-local.h:27:9:
              |   27 |         switch (size) {
              |      |         ^~~~~~
              |      |         |
              |      |         (9) following 'case 4:' branch...
              |......
              |   36 |         case 4: prev =3D *(u32 *)ptr;
              |      |         ~~~~    ~~~~~~~~~~~~~~~~~~
              |      |         |            |
              |      |         |            (11) use of uninitialized value=
 '*(u32 *)ptr' here
              |      |         (10) ...to here
              |
>> include/asm-generic/cmpxchg-local.h:36:22: warning: use of uninitialized=
 value '*(u32 *)ptr' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      36 |         case 4: prev =3D *(u32 *)ptr;
         |                 ~~~~~^~~~~~~~~~~~~
     'bma400_write_event_config': events 1-4
       |
       |drivers/iio/accel/bma400_core.c:1104:12:
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
              |arch/arm/include/asm/cmpxchg.h:138:25:
              |  138 |         (__typeof(*ptr))__generic_cmpxchg_local((ptr=
),                  \
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (9) calling '__generic_cmpxc=
hg_local' from 'bma400_activity_event_en'
              |  139 |                                                 (uns=
igned long)(o),     \
              |      |                                                 ~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |  140 |                                                 (uns=
igned long)(n),     \
              |      |                                                 ~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |  141 |                                                 size=
of(*(ptr)));        \
              |      |                                                 ~~~~=
~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:112:33: note: in expansion of macro 'arch_=
cmpxchg_local'
              |  112 | #define arch_cmpxchg            arch_cmpxchg_local
              |      |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1916:9: note: in expansion of=
 macro 'arch_cmpxchg'
              | 1916 |         arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
              |      |         ^~~~~~~~~~~~
   include/linux/bitops.h:283:18: note: in expansion of macro 'cmpxchg'
              |  283 |         } while (cmpxchg(ptr, old__, new__) !=3D old=
__);          \
              |      |                  ^~~~~~~
   drivers/iio/accel/bma400_core.c:1056:17: note: in expansion of macro 'se=
t_mask_bits'
              | 1056 |                 set_mask_bits(&field_value, BMA400_I=
NT_GEN1_MSK,
              |      |                 ^~~~~~~~~~~~~
              |
              +--> '__generic_cmpxchg_local': events 10-11
                     |
                     |include/asm-generic/cmpxchg-local.h:15:29:
                     |   15 | static inline unsigned long __generic_cmpxchg=
_local(volatile void *ptr,
                     |      |                             ^~~~~~~~~~~~~~~~~=
~~~~~~
                     |      |                             |
                     |      |                             (10) entry to '__=
generic_cmpxchg_local'
                     |......
                     |   23 |         if (size =3D=3D 8 && sizeof(unsigned =
long) !=3D 8)
                     |      |            ~                 =

                     |      |            |
                     |      |            (11) following 'false' branch (whe=
n 'size !=3D 8')...
                     |
                   '__generic_cmpxchg_local': event 12
                     |
                     |arch/arm/include/asm/irqflags.h:76:9:
                     |   76 |         asm volatile(
                     |      |         ^~~
                     |      |         |
                     |      |         (12) ...to here
                     |
                   '__generic_cmpxchg_local': events 13-15
                     |
                     |include/asm-generic/cmpxchg-local.h:27:9:
                     |   27 |         switch (size) {
                     |      |         ^~~~~~
                     |      |         |
                     |      |         (13) following 'case 4:' branch...
                     |......
                     |   36 |         case 4: prev =3D *(u32 *)ptr;
                     |      |         ~~~~    ~~~~~~~~~~~~~~~~~~
                     |      |         |            |
                     |      |         |            (15) use of uninitialize=
d value '*(u32 *)ptr' here
                     |      |         (14) ...to here
                     |
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

vim +36 include/asm-generic/cmpxchg-local.h

068fbad288a2c1 Mathieu Desnoyers 2008-02-07   7  =

aa93685afbefa0 Behan Webster     2012-11-20   8  extern unsigned long wrong=
_size_cmpxchg(volatile void *ptr)
aa93685afbefa0 Behan Webster     2012-11-20   9  	__noreturn;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  10  =

068fbad288a2c1 Mathieu Desnoyers 2008-02-07  11  /*
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  12   * Generic version of __cm=
pxchg_local (disables interrupts). Takes an unsigned
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  13   * long parameter, support=
ing various types of architectures.
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  14   */
6988631bdfddce Mark Rutland      2021-05-25  15  static inline unsigned lon=
g __generic_cmpxchg_local(volatile void *ptr,
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  16  		unsigned long old, unsig=
ned long new, int size)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  17  {
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  18  	unsigned long flags, prev;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  19  =

068fbad288a2c1 Mathieu Desnoyers 2008-02-07  20  	/*
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  21  	 * Sanity checking, compi=
le-time.
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  22  	 */
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  23  	if (size =3D=3D 8 && size=
of(unsigned long) !=3D 8)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  24  		wrong_size_cmpxchg(ptr);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  25  =

5042afe7fe3239 Ingo Molnar       2009-07-03  26  	raw_local_irq_save(flags);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  27  	switch (size) {
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  28  	case 1: prev =3D *(u8 *)p=
tr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  29  		if (prev =3D=3D old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  30  			*(u8 *)ptr =3D (u8)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  31  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  32  	case 2: prev =3D *(u16 *)=
ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  33  		if (prev =3D=3D old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  34  			*(u16 *)ptr =3D (u16)ne=
w;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  35  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07 @36  	case 4: prev =3D *(u32 *)=
ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  37  		if (prev =3D=3D old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  38  			*(u32 *)ptr =3D (u32)ne=
w;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  39  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  40  	case 8: prev =3D *(u64 *)=
ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  41  		if (prev =3D=3D old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  42  			*(u64 *)ptr =3D (u64)ne=
w;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  43  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  44  	default:
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  45  		wrong_size_cmpxchg(ptr);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  46  	}
5042afe7fe3239 Ingo Molnar       2009-07-03  47  	raw_local_irq_restore(fla=
gs);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  48  	return prev;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  49  }
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  50  =


:::::: The code at line 36 was first introduced by commit
:::::: 068fbad288a2c18b75b0425fb56d241f018a1cb5 Add cmpxchg_local to asm-ge=
neric for per cpu atomic operations

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7198302901235092202==--

