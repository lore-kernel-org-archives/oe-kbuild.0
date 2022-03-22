Content-Type: multipart/mixed; boundary="===============6112141899688349678=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jarkko-tpmdd:master 27/27] drivers/char/tpm/tpm_tis_core.c:422:10: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 23 Mar 2022 04:20:07 +0800
Message-ID: <202203230443.n1L5MFqF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6112141899688349678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Holland <johannes.holland@infineon.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.gi=
t master
head:   a536629ef32d127d26f3886f1fd480708fd5ac20
commit: a536629ef32d127d26f3886f1fd480708fd5ac20 [27/27] tpm: Remove read16=
/read32/write32 calls from tpm_tis_phy_ops
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220323/202203230443.n1L5MFqF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmd=
d.git/commit/?id=3Da536629ef32d127d26f3886f1fd480708fd5ac20
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kern=
el/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd master
        git checkout a536629ef32d127d26f3886f1fd480708fd5ac20
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/char/tpm/tpm_tis_core.c:1019:2: note: Loop condition is false.  =
Exiting loop
           dev_info(dev, "%s TPM (device-id 0x%X, rev-id %d)\n",
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/char/tpm/tpm_tis_core.c:1020:5: note: Assuming the condition is =
false
                    (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2",
                     ^
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
                                                                           =
 ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:1020:4: note: '?' condition is false
                    (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2",
                    ^
   drivers/char/tpm/tpm_tis_core.c:1023:10: note: Calling 'probe_itpm'
           probe =3D probe_itpm(chip);
                   ^~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:630:6: note: Assuming the condition is f=
alse
           if (priv->flags & TPM_TIS_ITPM_WORKAROUND)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:630:2: note: Taking false branch
           if (priv->flags & TPM_TIS_ITPM_WORKAROUND)
           ^
   drivers/char/tpm/tpm_tis_core.c:634:6: note: 'rc' is >=3D 0
           if (rc < 0)
               ^~
   drivers/char/tpm/tpm_tis_core.c:634:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/char/tpm/tpm_tis_core.c:638:6: note: Assuming 'vendor' is equal =
to TPM_VID_INTEL
           if (vendor !=3D TPM_VID_INTEL)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:638:2: note: Taking false branch
           if (vendor !=3D TPM_VID_INTEL)
           ^
   drivers/char/tpm/tpm_tis_core.c:641:2: note: Taking false branch
           if (request_locality(chip, 0) !=3D 0)
           ^
   drivers/char/tpm/tpm_tis_core.c:644:7: note: Calling 'tpm_tis_send_data'
           rc =3D tpm_tis_send_data(chip, cmd_getticks, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:349:6: note: Assuming the condition is f=
alse
           if ((status & TPM_STS_COMMAND_READY) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:349:2: note: Taking false branch
           if ((status & TPM_STS_COMMAND_READY) =3D=3D 0) {
           ^
   drivers/char/tpm/tpm_tis_core.c:359:2: note: Loop condition is true.  En=
tering loop body
           while (count < len - 1) {
           ^
   drivers/char/tpm/tpm_tis_core.c:360:14: note: Calling 'get_burstcount'
                   burstcnt =3D get_burstcount(chip);
                              ^~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:237:2: note: 'value' declared without an=
 initial value
           u32 value;
           ^~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:240:2: note: Taking false branch
           if (chip->flags & TPM_CHIP_FLAG_TPM2)
           ^
   drivers/char/tpm/tpm_tis_core.c:245:8: note: Calling 'tpm_tis_read32'
                   rc =3D tpm_tis_read32(priv, TPM_STS(priv->locality), &va=
lue);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/char/tpm/tpm_tis_core.h:160:6: note: Assuming 'rc' is not equal =
to 0
           if (!rc)
               ^~~
   drivers/char/tpm/tpm_tis_core.h:160:2: note: Taking false branch
           if (!rc)
           ^
   drivers/char/tpm/tpm_tis_core.h:163:2: note: Returning without writing t=
o '*result'
           return rc;
           ^
   drivers/char/tpm/tpm_tis_core.c:245:8: note: Returning from 'tpm_tis_rea=
d32'
                   rc =3D tpm_tis_read32(priv, TPM_STS(priv->locality), &va=
lue);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/char/tpm/tpm_tis_core.c:246:7: note: Assuming 'rc' is >=3D 0
                   if (rc < 0)
                       ^~~~~~
   drivers/char/tpm/tpm_tis_core.c:246:3: note: Taking false branch
                   if (rc < 0)
                   ^
   drivers/char/tpm/tpm_tis_core.c:249:21: note: The left operand of '>>' i=
s a garbage value
                   burstcnt =3D (value >> 8) & 0xFFFF;
                               ~~~~~ ^
>> drivers/char/tpm/tpm_tis_core.c:422:10: warning: The left expression of =
the compound assignment is an uninitialized value. The computed value will =
also be garbage [clang-analyzer-core.uninitialized.Assign]
           intmask &=3D ~TPM_GLOBAL_INT_ENABLE;
                   ^
   drivers/char/tpm/tpm_tis_core.c:473:6: note: Assuming the condition is f=
alse
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:473:6: note: Left side of '||' is false
   drivers/char/tpm/tpm_tis_core.c:473:44: note: Assuming field 'irq_tested=
' is false
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
                                                     ^~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:473:2: note: Taking false branch
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
           ^
   drivers/char/tpm/tpm_tis_core.c:483:13: note: Field 'irq_tested' is false
           if (!priv->irq_tested)
                      ^
   drivers/char/tpm/tpm_tis_core.c:483:2: note: Taking true branch
           if (!priv->irq_tested)
           ^
   drivers/char/tpm/tpm_tis_core.c:485:13: note: Field 'irq_tested' is false
           if (!priv->irq_tested)
                      ^
   drivers/char/tpm/tpm_tis_core.c:485:2: note: Taking true branch
           if (!priv->irq_tested)
           ^
   drivers/char/tpm/tpm_tis_core.c:486:3: note: Calling 'disable_interrupts'
                   disable_interrupts(chip);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:412:2: note: 'intmask' declared without =
an initial value
           u32 intmask;
           ^~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:415:6: note: Assuming field 'irq' is not=
 equal to 0
           if (priv->irq =3D=3D 0)
               ^~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:415:2: note: Taking false branch
           if (priv->irq =3D=3D 0)
           ^
   drivers/char/tpm/tpm_tis_core.c:418:7: note: Calling 'tpm_tis_read32'
           rc =3D tpm_tis_read32(priv, TPM_INT_ENABLE(priv->locality), &int=
mask);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.h:160:6: note: Assuming 'rc' is not equal =
to 0
           if (!rc)
               ^~~
   drivers/char/tpm/tpm_tis_core.h:160:2: note: Taking false branch
           if (!rc)
           ^
   drivers/char/tpm/tpm_tis_core.h:163:2: note: Returning without writing t=
o '*result'
           return rc;
           ^
   drivers/char/tpm/tpm_tis_core.c:418:7: note: Returning from 'tpm_tis_rea=
d32'
           rc =3D tpm_tis_read32(priv, TPM_INT_ENABLE(priv->locality), &int=
mask);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:419:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0)
               ^~~~~~
   drivers/char/tpm/tpm_tis_core.c:419:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/char/tpm/tpm_tis_core.c:422:10: note: The left expression of the=
 compound assignment is an uninitialized value. The computed value will als=
o be garbage
           intmask &=3D ~TPM_GLOBAL_INT_ENABLE;
           ~~~~~~~ ^
   drivers/char/tpm/tpm_tis_core.c:423:2: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:423:2: note: Value stored to 'rc' is nev=
er read
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:543:39: warning: The right operand of '!=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (vendor_dur_overrides[i].did_vid !=3D did_vid)
                                                       ^  ~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:509:2: note: 'did_vid' declared without =
an initial value
           u32 did_vid;
           ^~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:515:6: note: Assuming field 'clk_enable'=
 is equal to NULL
           if (chip->ops->clk_enable !=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:515:2: note: Taking false branch
           if (chip->ops->clk_enable !=3D NULL)
           ^
   drivers/char/tpm/tpm_tis_core.c:518:7: note: Calling 'tpm_tis_read32'
           rc =3D tpm_tis_read32(priv, TPM_DID_VID(0), &did_vid);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.h:160:6: note: Assuming 'rc' is not equal =
to 0
           if (!rc)
               ^~~
   drivers/char/tpm/tpm_tis_core.h:160:2: note: Taking false branch
           if (!rc)
           ^
   drivers/char/tpm/tpm_tis_core.h:163:2: note: Returning without writing t=
o '*result'
           return rc;
           ^
   drivers/char/tpm/tpm_tis_core.c:518:7: note: Returning from 'tpm_tis_rea=
d32'
           rc =3D tpm_tis_read32(priv, TPM_DID_VID(0), &did_vid);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:519:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0) {
               ^~~~~~
   drivers/char/tpm/tpm_tis_core.c:519:2: note: Taking false branch
           if (rc < 0) {
           ^
   drivers/char/tpm/tpm_tis_core.c:529:6: note: Assuming 'rc' is 0
--
                            ^
   drivers/char/tpm/tpm_tis_core.c:948:37: note: TIS_SHORT_TIMEOUT is > TPM=
2_TIMEOUT_D
           chip->timeout_d =3D msecs_to_jiffies(TIS_TIMEOUT_D_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:67:27: note: expanded from macro 'TIS_TI=
MEOUT_D_MAX'
   #define TIS_TIMEOUT_D_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_D)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:948:37: note: '?' condition is true
           chip->timeout_d =3D msecs_to_jiffies(TIS_TIMEOUT_D_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:67:27: note: expanded from macro 'TIS_TI=
MEOUT_D_MAX'
   #define TIS_TIMEOUT_D_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_D)
                                   ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:956:6: note: 'rc' is >=3D 0
           if (rc < 0)
               ^~
   drivers/char/tpm/tpm_tis_core.c:956:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/char/tpm/tpm_tis_core.c:961:6: note: Assuming field 'manufacture=
r_id' is not equal to TPM_VID_ATML
           if (priv->manufacturer_id =3D=3D TPM_VID_ATML &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:961:44: note: Left side of '&&' is false
           if (priv->manufacturer_id =3D=3D TPM_VID_ATML &&
                                                     ^
   drivers/char/tpm/tpm_tis_core.c:967:2: note: Taking false branch
           if (is_bsw()) {
           ^
   drivers/char/tpm/tpm_tis_core.c:981:6: note: Assuming field 'clk_enable'=
 is equal to NULL
           if (chip->ops->clk_enable !=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:981:2: note: Taking false branch
           if (chip->ops->clk_enable !=3D NULL)
           ^
   drivers/char/tpm/tpm_tis_core.c:984:2: note: Taking true branch
           if (wait_startup(chip, 0) !=3D 0) {
           ^
   drivers/char/tpm/tpm_tis_core.c:986:3: note: Control jumps to line 1102
                   goto out_err;
                   ^
   drivers/char/tpm/tpm_tis_core.c:1102:17: note: Field 'clk_enable' is equ=
al to NULL
           if (chip->ops->clk_enable !=3D NULL)
                          ^
   drivers/char/tpm/tpm_tis_core.c:1102:2: note: Taking false branch
           if (chip->ops->clk_enable !=3D NULL)
           ^
   drivers/char/tpm/tpm_tis_core.c:1105:2: note: Calling 'tpm_tis_remove'
           tpm_tis_remove(chip);
           ^~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:836:2: note: 'interrupt' declared withou=
t an initial value
           u32 interrupt;
           ^~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:841:7: note: Calling 'tpm_tis_read32'
           rc =3D tpm_tis_read32(priv, reg, &interrupt);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.h:160:6: note: Assuming 'rc' is not equal =
to 0
           if (!rc)
               ^~~
   drivers/char/tpm/tpm_tis_core.h:160:2: note: Taking false branch
           if (!rc)
           ^
   drivers/char/tpm/tpm_tis_core.h:163:2: note: Returning without writing t=
o '*result'
           return rc;
           ^
   drivers/char/tpm/tpm_tis_core.c:841:7: note: Returning from 'tpm_tis_rea=
d32'
           rc =3D tpm_tis_read32(priv, reg, &interrupt);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:842:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0)
               ^~~~~~
   drivers/char/tpm/tpm_tis_core.c:842:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/char/tpm/tpm_tis_core.c:845:52: note: The right operand of '&' i=
s a garbage value
           tpm_tis_write32(priv, reg, ~TPM_GLOBAL_INT_ENABLE & interrupt);
                                                             ^ ~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:865:23: warning: Value stored to 'data' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tpm_tis_data *data =3D dev_get_drvdata(&chip->dev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:865:23: note: Value stored to 'data' dur=
ing its initialization is never read
           struct tpm_tis_data *data =3D dev_get_drvdata(&chip->dev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/tpm/tpm_tis_core.c:959:24: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
           priv->manufacturer_id =3D vendor;
                                 ^ ~~~~~~
   drivers/char/tpm/tpm_tis_core.c:926:2: note: 'vendor' declared without a=
n initial value
           u32 vendor;
           ^~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:935:6: note: Calling 'IS_ERR'
           if (IS_ERR(chip))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:935:6: note: Returning from 'IS_ERR'
           if (IS_ERR(chip))
               ^~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:935:2: note: Taking false branch
           if (IS_ERR(chip))
           ^
   drivers/char/tpm/tpm_tis_core.c:945:37: note: TIS_SHORT_TIMEOUT is <=3D =
TPM2_TIMEOUT_A
           chip->timeout_a =3D msecs_to_jiffies(TIS_TIMEOUT_A_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:64:27: note: expanded from macro 'TIS_TI=
MEOUT_A_MAX'
   #define TIS_TIMEOUT_A_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_A)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:945:37: note: '?' condition is false
           chip->timeout_a =3D msecs_to_jiffies(TIS_TIMEOUT_A_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:64:27: note: expanded from macro 'TIS_TI=
MEOUT_A_MAX'
   #define TIS_TIMEOUT_A_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_A)
                                   ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:946:37: note: TIS_LONG_TIMEOUT is <=3D T=
PM2_TIMEOUT_B
           chip->timeout_b =3D msecs_to_jiffies(TIS_TIMEOUT_B_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:65:27: note: expanded from macro 'TIS_TI=
MEOUT_B_MAX'
   #define TIS_TIMEOUT_B_MAX       max_t(int, TIS_LONG_TIMEOUT, TPM2_TIMEOU=
T_B)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:946:37: note: '?' condition is false
           chip->timeout_b =3D msecs_to_jiffies(TIS_TIMEOUT_B_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:65:27: note: expanded from macro 'TIS_TI=
MEOUT_B_MAX'
   #define TIS_TIMEOUT_B_MAX       max_t(int, TIS_LONG_TIMEOUT, TPM2_TIMEOU=
T_B)
                                   ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:947:37: note: TIS_SHORT_TIMEOUT is > TPM=
2_TIMEOUT_C
           chip->timeout_c =3D msecs_to_jiffies(TIS_TIMEOUT_C_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:66:27: note: expanded from macro 'TIS_TI=
MEOUT_C_MAX'
   #define TIS_TIMEOUT_C_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_C)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \

vim +422 drivers/char/tpm/tpm_tis_core.c

41a5e1cf1fe151e Christophe Ricard   2016-05-19  231  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  232  static int get_burstco=
unt(struct tpm_chip *chip)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  233  {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  234  	struct tpm_tis_data *=
priv =3D dev_get_drvdata(&chip->dev);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  235  	unsigned long stop;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  236  	int burstcnt, rc;
9754d45e997000a Andrey Pronin       2016-06-30  237  	u32 value;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  238  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  239  	/* wait for burstcoun=
t */
302a6ad7fc77146 Alexander Steffen   2017-02-16  240  	if (chip->flags & TPM=
_CHIP_FLAG_TPM2)
302a6ad7fc77146 Alexander Steffen   2017-02-16  241  		stop =3D jiffies + c=
hip->timeout_a;
302a6ad7fc77146 Alexander Steffen   2017-02-16  242  	else
41a5e1cf1fe151e Christophe Ricard   2016-05-19  243  		stop =3D jiffies + c=
hip->timeout_d;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  244  	do {
9754d45e997000a Andrey Pronin       2016-06-30  245  		rc =3D tpm_tis_read3=
2(priv, TPM_STS(priv->locality), &value);
41a5e1cf1fe151e Christophe Ricard   2016-05-19 @246  		if (rc < 0)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  247  			return rc;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  248  =

9754d45e997000a Andrey Pronin       2016-06-30  249  		burstcnt =3D (value =
>> 8) & 0xFFFF;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  250  		if (burstcnt)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  251  			return burstcnt;
424eaf910c329ab Nayna Jain          2018-05-16  252  		usleep_range(TPM_TIM=
EOUT_USECS_MIN, TPM_TIMEOUT_USECS_MAX);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  253  	} while (time_before(=
jiffies, stop));
41a5e1cf1fe151e Christophe Ricard   2016-05-19  254  	return -EBUSY;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  255  }
41a5e1cf1fe151e Christophe Ricard   2016-05-19  256  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  257  static int recv_data(s=
truct tpm_chip *chip, u8 *buf, size_t count)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  258  {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  259  	struct tpm_tis_data *=
priv =3D dev_get_drvdata(&chip->dev);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  260  	int size =3D 0, burst=
cnt, rc;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  261  =

2c97f6f20cb1932 Peter Huewe         2016-10-11  262  	while (size < count) {
2c97f6f20cb1932 Peter Huewe         2016-10-11  263  		rc =3D wait_for_tpm_=
stat(chip,
41a5e1cf1fe151e Christophe Ricard   2016-05-19  264  				 TPM_STS_DATA_AVAI=
L | TPM_STS_VALID,
41a5e1cf1fe151e Christophe Ricard   2016-05-19  265  				 chip->timeout_c,
2c97f6f20cb1932 Peter Huewe         2016-10-11  266  				 &priv->read_queue=
, true);
2c97f6f20cb1932 Peter Huewe         2016-10-11  267  		if (rc < 0)
2c97f6f20cb1932 Peter Huewe         2016-10-11  268  			return rc;
26a137e31ffe6fb Josh Zimmerman      2016-10-27  269  		burstcnt =3D get_bur=
stcount(chip);
26a137e31ffe6fb Josh Zimmerman      2016-10-27  270  		if (burstcnt < 0) {
26a137e31ffe6fb Josh Zimmerman      2016-10-27  271  			dev_err(&chip->dev,=
 "Unable to read burstcount\n");
26a137e31ffe6fb Josh Zimmerman      2016-10-27  272  			return burstcnt;
26a137e31ffe6fb Josh Zimmerman      2016-10-27  273  		}
26a137e31ffe6fb Josh Zimmerman      2016-10-27  274  		burstcnt =3D min_t(i=
nt, burstcnt, count - size);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  275  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  276  		rc =3D tpm_tis_read_=
bytes(priv, TPM_DATA_FIFO(priv->locality),
41a5e1cf1fe151e Christophe Ricard   2016-05-19  277  					burstcnt, buf + s=
ize);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  278  		if (rc < 0)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  279  			return rc;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  280  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  281  		size +=3D burstcnt;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  282  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  283  	return size;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  284  }
41a5e1cf1fe151e Christophe Ricard   2016-05-19  285  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  286  static int tpm_tis_rec=
v(struct tpm_chip *chip, u8 *buf, size_t count)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  287  {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  288  	struct tpm_tis_data *=
priv =3D dev_get_drvdata(&chip->dev);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  289  	int size =3D 0;
6bb320ca4a4a7b5 Jeremy Boone        2018-02-08  290  	int status;
6bb320ca4a4a7b5 Jeremy Boone        2018-02-08  291  	u32 expected;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  292  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  293  	if (count < TPM_HEADE=
R_SIZE) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  294  		size =3D -EIO;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  295  		goto out;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  296  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  297  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  298  	size =3D recv_data(ch=
ip, buf, TPM_HEADER_SIZE);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  299  	/* read first 10 byte=
s, including tag, paramsize, and result */
41a5e1cf1fe151e Christophe Ricard   2016-05-19  300  	if (size < TPM_HEADER=
_SIZE) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  301  		dev_err(&chip->dev, =
"Unable to read header\n");
41a5e1cf1fe151e Christophe Ricard   2016-05-19  302  		goto out;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  303  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  304  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  305  	expected =3D be32_to_=
cpu(*(__be32 *) (buf + 2));
6bb320ca4a4a7b5 Jeremy Boone        2018-02-08  306  	if (expected > count =
|| expected < TPM_HEADER_SIZE) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  307  		size =3D -EIO;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  308  		goto out;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  309  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  310  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  311  	size +=3D recv_data(c=
hip, &buf[TPM_HEADER_SIZE],
41a5e1cf1fe151e Christophe Ricard   2016-05-19  312  			  expected - TPM_HE=
ADER_SIZE);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  313  	if (size < expected) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  314  		dev_err(&chip->dev, =
"Unable to read remainder of result\n");
41a5e1cf1fe151e Christophe Ricard   2016-05-19  315  		size =3D -ETIME;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  316  		goto out;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  317  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  318  =

2c97f6f20cb1932 Peter Huewe         2016-10-11  319  	if (wait_for_tpm_stat=
(chip, TPM_STS_VALID, chip->timeout_c,
2c97f6f20cb1932 Peter Huewe         2016-10-11  320  				&priv->int_queue, =
false) < 0) {
2c97f6f20cb1932 Peter Huewe         2016-10-11  321  		size =3D -ETIME;
2c97f6f20cb1932 Peter Huewe         2016-10-11  322  		goto out;
2c97f6f20cb1932 Peter Huewe         2016-10-11  323  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  324  	status =3D tpm_tis_st=
atus(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  325  	if (status & TPM_STS_=
DATA_AVAIL) {	/* retry? */
41a5e1cf1fe151e Christophe Ricard   2016-05-19  326  		dev_err(&chip->dev, =
"Error left over data\n");
41a5e1cf1fe151e Christophe Ricard   2016-05-19  327  		size =3D -EIO;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  328  		goto out;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  329  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  330  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  331  out:
41a5e1cf1fe151e Christophe Ricard   2016-05-19  332  	tpm_tis_ready(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  333  	return size;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  334  }
41a5e1cf1fe151e Christophe Ricard   2016-05-19  335  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  336  /*
41a5e1cf1fe151e Christophe Ricard   2016-05-19  337   * If interrupts are u=
sed (signaled by an irq set in the vendor structure)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  338   * tpm.c can skip poll=
ing for the data to be available as the interrupt is
41a5e1cf1fe151e Christophe Ricard   2016-05-19  339   * waited for here
41a5e1cf1fe151e Christophe Ricard   2016-05-19  340   */
c37fbc09bd49777 Arnd Bergmann       2017-09-07  341  static int tpm_tis_sen=
d_data(struct tpm_chip *chip, const u8 *buf, size_t len)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  342  {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  343  	struct tpm_tis_data *=
priv =3D dev_get_drvdata(&chip->dev);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  344  	int rc, status, burst=
cnt;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  345  	size_t count =3D 0;
1d70fe9d9c3a4c6 Maciej S. Szmigiero 2017-01-13  346  	bool itpm =3D priv->f=
lags & TPM_TIS_ITPM_WORKAROUND;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  347  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  348  	status =3D tpm_tis_st=
atus(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  349  	if ((status & TPM_STS=
_COMMAND_READY) =3D=3D 0) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  350  		tpm_tis_ready(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  351  		if (wait_for_tpm_stat
41a5e1cf1fe151e Christophe Ricard   2016-05-19  352  		    (chip, TPM_STS_C=
OMMAND_READY, chip->timeout_b,
41a5e1cf1fe151e Christophe Ricard   2016-05-19  353  		     &priv->int_queu=
e, false) < 0) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  354  			rc =3D -ETIME;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  355  			goto out_err;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  356  		}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  357  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  358  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  359  	while (count < len - =
1) {
26a137e31ffe6fb Josh Zimmerman      2016-10-27  360  		burstcnt =3D get_bur=
stcount(chip);
26a137e31ffe6fb Josh Zimmerman      2016-10-27  361  		if (burstcnt < 0) {
26a137e31ffe6fb Josh Zimmerman      2016-10-27  362  			dev_err(&chip->dev,=
 "Unable to read burstcount\n");
26a137e31ffe6fb Josh Zimmerman      2016-10-27  363  			rc =3D burstcnt;
26a137e31ffe6fb Josh Zimmerman      2016-10-27  364  			goto out_err;
26a137e31ffe6fb Josh Zimmerman      2016-10-27  365  		}
26a137e31ffe6fb Josh Zimmerman      2016-10-27  366  		burstcnt =3D min_t(i=
nt, burstcnt, len - count - 1);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  367  		rc =3D tpm_tis_write=
_bytes(priv, TPM_DATA_FIFO(priv->locality),
41a5e1cf1fe151e Christophe Ricard   2016-05-19  368  					 burstcnt, buf + =
count);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  369  		if (rc < 0)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  370  			goto out_err;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  371  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  372  		count +=3D burstcnt;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  373  =

2c97f6f20cb1932 Peter Huewe         2016-10-11  374  		if (wait_for_tpm_sta=
t(chip, TPM_STS_VALID, chip->timeout_c,
2c97f6f20cb1932 Peter Huewe         2016-10-11  375  					&priv->int_queue,=
 false) < 0) {
2c97f6f20cb1932 Peter Huewe         2016-10-11  376  			rc =3D -ETIME;
2c97f6f20cb1932 Peter Huewe         2016-10-11  377  			goto out_err;
2c97f6f20cb1932 Peter Huewe         2016-10-11  378  		}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  379  		status =3D tpm_tis_s=
tatus(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  380  		if (!itpm && (status=
 & TPM_STS_DATA_EXPECT) =3D=3D 0) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  381  			rc =3D -EIO;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  382  			goto out_err;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  383  		}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  384  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  385  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  386  	/* write last byte */
41a5e1cf1fe151e Christophe Ricard   2016-05-19  387  	rc =3D tpm_tis_write8=
(priv, TPM_DATA_FIFO(priv->locality), buf[count]);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  388  	if (rc < 0)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  389  		goto out_err;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  390  =

2c97f6f20cb1932 Peter Huewe         2016-10-11  391  	if (wait_for_tpm_stat=
(chip, TPM_STS_VALID, chip->timeout_c,
2c97f6f20cb1932 Peter Huewe         2016-10-11  392  				&priv->int_queue, =
false) < 0) {
2c97f6f20cb1932 Peter Huewe         2016-10-11  393  		rc =3D -ETIME;
2c97f6f20cb1932 Peter Huewe         2016-10-11  394  		goto out_err;
2c97f6f20cb1932 Peter Huewe         2016-10-11  395  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  396  	status =3D tpm_tis_st=
atus(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  397  	if (!itpm && (status =
& TPM_STS_DATA_EXPECT) !=3D 0) {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  398  		rc =3D -EIO;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  399  		goto out_err;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  400  	}
41a5e1cf1fe151e Christophe Ricard   2016-05-19  401  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  402  	return 0;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  403  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  404  out_err:
41a5e1cf1fe151e Christophe Ricard   2016-05-19  405  	tpm_tis_ready(chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  406  	return rc;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  407  }
41a5e1cf1fe151e Christophe Ricard   2016-05-19  408  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  409  static void disable_in=
terrupts(struct tpm_chip *chip)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  410  {
41a5e1cf1fe151e Christophe Ricard   2016-05-19  411  	struct tpm_tis_data *=
priv =3D dev_get_drvdata(&chip->dev);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  412  	u32 intmask;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  413  	int rc;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  414  =

b160c94be5d2816 Jarkko Sakkinen     2020-04-12  415  	if (priv->irq =3D=3D =
0)
b160c94be5d2816 Jarkko Sakkinen     2020-04-12  416  		return;
b160c94be5d2816 Jarkko Sakkinen     2020-04-12  417  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  418  	rc =3D tpm_tis_read32=
(priv, TPM_INT_ENABLE(priv->locality), &intmask);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  419  	if (rc < 0)
41a5e1cf1fe151e Christophe Ricard   2016-05-19  420  		intmask =3D 0;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  421  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19 @422  	intmask &=3D ~TPM_GLO=
BAL_INT_ENABLE;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  423  	rc =3D tpm_tis_write3=
2(priv, TPM_INT_ENABLE(priv->locality), intmask);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  424  =

41a5e1cf1fe151e Christophe Ricard   2016-05-19  425  	devm_free_irq(chip->d=
ev.parent, priv->irq, chip);
41a5e1cf1fe151e Christophe Ricard   2016-05-19  426  	priv->irq =3D 0;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  427  	chip->flags &=3D ~TPM=
_CHIP_FLAG_IRQ;
41a5e1cf1fe151e Christophe Ricard   2016-05-19  428  }
41a5e1cf1fe151e Christophe Ricard   2016-05-19  429  =


:::::: The code at line 422 was first introduced by commit
:::::: 41a5e1cf1fe151ed48b4b3106c748d03a85133ce tpm/tpm_tis: Split tpm_tis =
driver into a core and TCG TIS compliant phy

:::::: TO: Christophe Ricard <christophe.ricard@gmail.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6112141899688349678==--

