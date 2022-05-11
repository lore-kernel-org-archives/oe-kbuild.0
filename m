Content-Type: multipart/mixed; boundary="===============8666899866226988945=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 12 May 2022 00:27:17 +0800
Message-ID: <202205120048.uRdqtDmF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8666899866226988945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: 617d32938d1be0d67bad73a914635bf787c319c1 rpmsg: Move the rpmsg cont=
rol device from rpmsg_char to rpmsg_ctrl
date:   8 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 weeks ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220512/202205120048.uRdqtDmF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D617d32938d1be0d67bad73a914635bf787c319c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 617d32938d1be0d67bad73a914635bf787c319c1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:937:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x103d, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:940:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x1036, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:940:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x1036, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:943:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x1036, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:943:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x1036, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:946:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x211f, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:946:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x211f, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:948:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x211f, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:948:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x211f, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:951:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x2849, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:951:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x2849, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:953:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x2849, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:953:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x2849, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:956:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_set_vsb(state);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:956:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_set_vsb(state);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:959:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:959:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:962:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_mpeg_tristate(state, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:962:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_mpeg_tristate(state, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:996:3: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D fe->ops.tuner_ops.set_params(fe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:996:3: note: Value stored to 're=
t' is never read
                   ret =3D fe->ops.tuner_ops.set_params(fe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:1183:2: warning: Value stored to=
 'modeOper' is never read [clang-analyzer-deadcode.DeadStores]
           modeOper =3D LG3306_UNKNOWN_MODE;
           ^          ~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:1183:2: note: Value stored to 'm=
odeOper' is never read
           modeOper =3D LG3306_UNKNOWN_MODE;
           ^          ~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: Left side of '&&' is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: '?' condition is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/rpmsg/rpmsg_ctrl.c:80:6: note: Assuming the condition is false
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:2: note: Taking false branch
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
rc'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
rc'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:83:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:88:13: note: Assigned value is garbage or und=
efined
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/dvb-frontends/tda1004x.c:547:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D tda1004x_do_upload(state, fw->data, fw->size, TDA10046H_=
CODE_CPT, TDA10046H_CODE_IN);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda1004x.c:547:2: note: Value stored to 'ret=
' is never read
           ret =3D tda1004x_do_upload(state, fw->data, fw->size, TDA10046H_=
CODE_CPT, TDA10046H_CODE_IN);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/dvb-frontends/sp887x.c:456:39: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
                  (sp887x_readreg(state, 0xc07) << 6);
--
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32-lp.c:23:8: note: Excessive padding in 's=
truct stm32_lp_private' (52 padding bytes, where 20 is optimal). Optimal fi=
elds order: clkevt, reg, period, dev, consider reordering the fields or add=
ing explicit padding members
   struct stm32_lp_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   6 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_t.c:14:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:14:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:130:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:130:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:250:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:250:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:375:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:375:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:393:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:393:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/spi/spi-tegra210-quad.c:1167:3: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1167:3: note: Value stored to 'err' is n=
ever read
                   err =3D tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1169:3: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1169:3: note: Value stored to 'err' is n=
ever read
                   err =3D tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/spi/spi-tegra20-slink.c:952:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_slink_start_dma_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:952:3: note: Value stored to 'err' is ne=
ver read
                   err =3D tegra_slink_start_dma_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:954:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_slink_start_cpu_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:954:3: note: Value stored to 'err' is ne=
ver read
                   err =3D tegra_slink_start_cpu_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: Left side of '&&' is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: '?' condition is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/rpmsg/rpmsg_ctrl.c:80:6: note: Assuming the condition is false
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:2: note: Taking false branch
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
rc'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
rc'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:83:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:88:13: note: Assigned value is garbage or und=
efined
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
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

vim +88 drivers/rpmsg/rpmsg_ctrl.c

617d32938d1be0 Arnaud Pouliquen 2022-01-24  71  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  72  static long rpmsg_ctrldev_i=
octl(struct file *fp, unsigned int cmd,
617d32938d1be0 Arnaud Pouliquen 2022-01-24  73  				unsigned long arg)
617d32938d1be0 Arnaud Pouliquen 2022-01-24  74  {
617d32938d1be0 Arnaud Pouliquen 2022-01-24  75  	struct rpmsg_ctrldev *ctrl=
dev =3D fp->private_data;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  76  	void __user *argp =3D (voi=
d __user *)arg;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  77  	struct rpmsg_endpoint_info=
 eptinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  78  	struct rpmsg_channel_info =
chinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  79  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  80  	if (cmd !=3D RPMSG_CREATE_=
EPT_IOCTL)
617d32938d1be0 Arnaud Pouliquen 2022-01-24  81  		return -EINVAL;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  82  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  83  	if (copy_from_user(&eptinf=
o, argp, sizeof(eptinfo)))
617d32938d1be0 Arnaud Pouliquen 2022-01-24  84  		return -EFAULT;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  85  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  86  	memcpy(chinfo.name, eptinf=
o.name, RPMSG_NAME_SIZE);
617d32938d1be0 Arnaud Pouliquen 2022-01-24  87  	chinfo.name[RPMSG_NAME_SIZ=
E - 1] =3D '\0';
617d32938d1be0 Arnaud Pouliquen 2022-01-24 @88  	chinfo.src =3D eptinfo.src;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  89  	chinfo.dst =3D eptinfo.dst;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  90  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  91  	return rpmsg_chrdev_eptdev=
_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
617d32938d1be0 Arnaud Pouliquen 2022-01-24  92  };
617d32938d1be0 Arnaud Pouliquen 2022-01-24  93  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8666899866226988945==--

