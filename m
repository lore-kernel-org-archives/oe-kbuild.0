Content-Type: multipart/mixed; boundary="===============2418886499409233908=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-virtio.c:41:8: warning: Excessive padding in 'struct virtio_i2c_req' (215 padding bytes, where 151 is optimal).
Date: Wed, 15 Dec 2021 15:20:29 +0800
Message-ID: <202112151559.J0h2rVeJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2418886499409233908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: b503de239f62eca898cfb7e820d9a35499137d22 i2c: virtio: fix completio=
n handling
date:   6 days ago
:::::: branch date: 33 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007-20211213 (https://download.01.org/0day-ci/ar=
chive/20211215/202112151559.J0h2rVeJ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db503de239f62eca898cfb7e820d9a35499137d22
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b503de239f62eca898cfb7e820d9a35499137d22
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/chemical/scd4x.c:467:33: note: Assuming 'arg' is <=3D SCD4X_=
FRC_MAX_PPM
           if (arg < SCD4X_FRC_MIN_PPM || arg > SCD4X_FRC_MAX_PPM)
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd4x.c:467:2: note: Taking false branch
           if (arg < SCD4X_FRC_MIN_PPM || arg > SCD4X_FRC_MAX_PPM)
           ^
   drivers/iio/chemical/scd4x.c:471:8: note: Calling 'scd4x_write_and_fetch'
           ret =3D scd4x_write_and_fetch(state, CMD_FRC, arg, &val, sizeof(=
val));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/iio/chemical/scd4x.c:222:6: note: 'ret' is -5
           if (ret)
               ^~~
   drivers/iio/chemical/scd4x.c:222:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/chemical/scd4x.c:223:3: note: Control jumps to line 258
                   goto err;
                   ^
   drivers/iio/chemical/scd4x.c:260:2: note: Returning without writing to '=
*response'
           return ret;
           ^
   drivers/iio/chemical/scd4x.c:471:8: note: Returning from 'scd4x_write_an=
d_fetch'
           ret =3D scd4x_write_and_fetch(state, CMD_FRC, arg, &val, sizeof(=
val));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/iio/chemical/scd4x.c:474:10: note: The left operand of '=3D=3D' =
is a garbage value
           if (val =3D=3D 0xff) {
               ~~~ ^
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   drivers/iio/accel/sca3000.c:163:8: warning: Excessive padding in 'struct=
 sca3000_state' (78 padding bytes, where 14 is optimal). =

   Optimal fields order: =

   tx, =

   us, =

   info, =

   last_timestamp, =

   lock, =

   mo_det_use_count, =

   rx, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sca3000_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/accel/sca3000.c:163:8: note: Excessive padding in 'struct sc=
a3000_state' (78 padding bytes, where 14 is optimal). Optimal fields order:=
 tx, us, info, last_timestamp, lock, mo_det_use_count, rx, consider reorder=
ing the fields or adding explicit padding members
   struct sca3000_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/adc/ad7292.c:78:8: warning: Excessive padding in 'struct ad7=
292_state' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   d16, =

   vref_mv, =

   d8, =

   spi, =

   reg, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7292.c:78:8: note: Excessive padding in 'struct ad7292=
_state' (106 padding bytes, where 42 is optimal). Optimal fields order: d16=
, vref_mv, d8, spi, reg, consider reordering the fields or adding explicit =
padding members
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/i2c/busses/i2c-virtio.c:41:8: warning: Excessive padding in 'str=
uct virtio_i2c_req' (215 padding bytes, where 151 is optimal). =

   Optimal fields order: =

   in_hdr, =

   completion, =

   out_hdr, =

   buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct virtio_i2c_req {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-virtio.c:41:8: note: Excessive padding in 'struct=
 virtio_i2c_req' (215 padding bytes, where 151 is optimal). Optimal fields =
order: in_hdr, completion, out_hdr, buf, consider reordering the fields or =
adding explicit padding members
   struct virtio_i2c_req {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   6 warnings generated.
   include/linux/acpi.h:684:22: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           adev->flags.visited =3D false;
                               ^
   drivers/i2c/i2c-core-base.c:1975:6: note: Assuming the condition is true
           if (dev->type =3D=3D &i2c_adapter_type)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1975:2: note: Taking true branch
           if (dev->type =3D=3D &i2c_adapter_type)
           ^
   drivers/i2c/i2c-core-base.c:1976:3: note: Calling 'i2c_do_del_adapter'
                   i2c_do_del_adapter(data, to_i2c_adapter(dev));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1723:2: note: Loop condition is true.  Enter=
ing loop body
           list_for_each_entry_safe(client, _n, &driver->clients, detected)=
 {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/i2c/i2c-core-base.c:1724:7: note: Assuming 'adapter' is equal to=
 field 'adapter'
                   if (client->adapter =3D=3D adapter) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1724:3: note: Taking true branch
                   if (client->adapter =3D=3D adapter) {
                   ^
   drivers/i2c/i2c-core-base.c:1725:4: note: Taking false branch
                           dev_dbg(&adapter->dev, "Removing %s at 0x%x\n",
                           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/i2c/i2c-core-base.c:1728:4: note: Calling 'i2c_unregister_device'
                           i2c_unregister_device(client);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1093:6: note: Calling 'IS_ERR_OR_NULL'
           if (IS_ERR_OR_NULL(client))
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:41:19: note: 'ptr' is non-null
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                            ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:41:9: note: Left side of '||' is false
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^
   include/linux/err.h:41:27: note: Assuming the condition is false
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                                    ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:41:2: note: Returning zero, which participates in a =
condition later
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1093:6: note: Returning from 'IS_ERR_OR_NULL'
           if (IS_ERR_OR_NULL(client))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1093:2: note: Taking false branch
           if (IS_ERR_OR_NULL(client))
           ^
   drivers/i2c/i2c-core-base.c:1096:6: note: Assuming field 'of_node' is nu=
ll
           if (client->dev.of_node) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1096:2: note: Taking false branch
           if (client->dev.of_node) {
           ^
   drivers/i2c/i2c-core-base.c:1101:6: note: Assuming the condition is true
           if (ACPI_COMPANION(&client->dev))
               ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:418:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \

vim +41 drivers/i2c/busses/i2c-virtio.c

3cfc88380413d2 Jie Deng           2021-07-23  33  =

3cfc88380413d2 Jie Deng           2021-07-23  34  /**
3cfc88380413d2 Jie Deng           2021-07-23  35   * struct virtio_i2c_req =
- the virtio I2C request structure
b503de239f62ec Vincent Whitchurch 2021-12-02  36   * @completion: completio=
n of virtio I2C message
3cfc88380413d2 Jie Deng           2021-07-23  37   * @out_hdr: the OUT head=
er of the virtio I2C message
3cfc88380413d2 Jie Deng           2021-07-23  38   * @buf: the buffer into =
which data is read, or from which it's written
3cfc88380413d2 Jie Deng           2021-07-23  39   * @in_hdr: the IN header=
 of the virtio I2C message
3cfc88380413d2 Jie Deng           2021-07-23  40   */
3cfc88380413d2 Jie Deng           2021-07-23 @41  struct virtio_i2c_req {
b503de239f62ec Vincent Whitchurch 2021-12-02  42  	struct completion comple=
tion;
3cfc88380413d2 Jie Deng           2021-07-23  43  	struct virtio_i2c_out_hd=
r out_hdr	____cacheline_aligned;
3cfc88380413d2 Jie Deng           2021-07-23  44  	uint8_t *buf				____cach=
eline_aligned;
3cfc88380413d2 Jie Deng           2021-07-23  45  	struct virtio_i2c_in_hdr=
 in_hdr		____cacheline_aligned;
3cfc88380413d2 Jie Deng           2021-07-23  46  };
3cfc88380413d2 Jie Deng           2021-07-23  47  =


:::::: The code at line 41 was first introduced by commit
:::::: 3cfc88380413d20f777dc6648a38f683962e52bf i2c: virtio: add a virtio i=
2c frontend driver

:::::: TO: Jie Deng <jie.deng@intel.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2418886499409233908==--

