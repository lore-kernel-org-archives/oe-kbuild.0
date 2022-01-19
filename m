Content-Type: multipart/mixed; boundary="===============3617874332415671233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value stored to 'gen' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 19 Jan 2022 16:01:16 +0800
Message-ID: <202201191502.gKfsqKWc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3617874332415671233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   99613159ad749543621da8238acf1a122880144e
commit: 2fa698e3da84edc6b7a2d670f8bd5035891a744e media: camss: vfe: Decreas=
e priority of of VFE HW version to 'dbg'
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220111 (https://download.01.org/0day-ci/arc=
hive/20220119/202201191502.gKfsqKWc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2fa698e3da84edc6b7a2d670f8bd5035891a744e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fa698e3da84edc6b7a2d670f8bd5035891a744e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/dvb-frontends/stv0297.c:64:2: note: Taking true branch
           if (state->config->stop_during_read) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/stv0297.c:65:7: note: Assuming the condition=
 is false
                   if ((ret =3D i2c_transfer(state->i2c, &msg[0], 1)) !=3D =
1) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/dvb-frontends/stv0297.c:65:3: note: '?' condition is false
                   if ((ret =3D i2c_transfer(state->i2c, &msg[0], 1)) !=3D =
1) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/stv0297.c:65:7: note: Assuming the condition=
 is true
                   if ((ret =3D i2c_transfer(state->i2c, &msg[0], 1)) !=3D =
1) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/dvb-frontends/stv0297.c:65:3: note: '?' condition is true
                   if ((ret =3D i2c_transfer(state->i2c, &msg[0], 1)) !=3D =
1) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/dvb-frontends/stv0297.c:65:3: note: Taking true branch
                   if ((ret =3D i2c_transfer(state->i2c, &msg[0], 1)) !=3D =
1) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/stv0297.c:66:4: note: Loop condition is fals=
e.  Exiting loop
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/dvb-frontends/stv0297.c:67:4: note: Returning the value -1
                           return -1;
                           ^~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:130:10: note: Returning from 'stv0=
297_readreg'
                       | (stv0297_readreg(state, 0x58) << 24));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:130:39: note: The result of the le=
ft shift is undefined because the left operand is negative
                       | (stv0297_readreg(state, 0x58) << 24));
                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
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
   8 warnings generated.
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: warning: Value =
stored to 'violation' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: note: Value sto=
red to 'violation' during its initialization is never read
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:14: note: Assuming 'i=
' is < field 'line_num'
           for (i =3D 0; i < vfe->line_num; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:2: note: Loop conditi=
on is true.  Entering loop body
           for (i =3D 0; i < vfe->line_num; i++) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: '?' conditio=
n is false
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:7: note: 'i' is not e=
qual to VFE_LINE_PIX
                   if (i =3D=3D VFE_LINE_PIX)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: '?' conditio=
n is false
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: Taking false=
 branch
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1550:9: note: Calling 'vfe=
_init_formats'
                   ret =3D vfe_init_formats(sd, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: 'fh' is null
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: 'fh' is null
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:9: note: Calling 'vfe=
_set_format'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:6: note: 'format' is =
not equal to null
           if (format =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:2: note: '?' conditio=
n is false
           if (format =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
--
           ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:71:7: note: Assuming t=
he condition is true
                   if ((PAGE_SIZE << order) > size)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:71:3: note: '?' condit=
ion is false
                   if ((PAGE_SIZE << order) > size)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:71:3: note: '?' condit=
ion is true
                   if ((PAGE_SIZE << order) > size)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:71:3: note: Taking tru=
e branch
                   if ((PAGE_SIZE << order) > size)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:72:4: note: The value =
-1 is assigned to 'order'
                           order--;
                           ^~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:75:3: note: Loop condi=
tion is true.  Entering loop body
                   while (!pages) {
                   ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:78:4: note: Assuming '=
pages' is non-null
                           if (pages)
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:78:4: note: '?' condit=
ion is false
                           if (pages)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:78:8: note: 'pages' is=
 non-null
                           if (pages)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:78:4: note: '?' condit=
ion is true
                           if (pages)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:78:4: note: Taking tru=
e branch
                           if (pages)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:79:5: note:  Execution=
 continues on line 89
                                   break;
                                   ^
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:90:22: note: The resul=
t of the left shift is undefined because the right operand is negative
                   for (i =3D 0; i < (1 << order); i++)
                                      ^  ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: warning: Value =
stored to 'violation' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: note: Value sto=
red to 'violation' during its initialization is never read
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:14: note: Assuming 'i=
' is < field 'line_num'
           for (i =3D 0; i < vfe->line_num; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:2: note: Loop conditi=
on is true.  Entering loop body
           for (i =3D 0; i < vfe->line_num; i++) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: '?' conditio=
n is false
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:7: note: 'i' is not e=
qual to VFE_LINE_PIX
                   if (i =3D=3D VFE_LINE_PIX)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: '?' conditio=
n is false
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: Taking false=
 branch
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1550:9: note: Calling 'vfe=
_init_formats'
                   ret =3D vfe_init_formats(sd, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: 'fh' is null
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: 'fh' is null
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:9: note: Calling 'vfe=
_set_format'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:6: note: 'format' is =
not equal to null
           if (format =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:2: note: '?' conditio=
n is false
           if (format =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^

vim +/gen +184 drivers/media/platform/qcom/camss/camss-vfe-170.c

7319cdf189bb64 Robert Foss 2021-03-16  179  =

7319cdf189bb64 Robert Foss 2021-03-16  180  static void vfe_hw_version_read=
(struct vfe_device *vfe, struct device *dev)
7319cdf189bb64 Robert Foss 2021-03-16  181  {
7319cdf189bb64 Robert Foss 2021-03-16  182  	u32 hw_version =3D readl_relax=
ed(vfe->base + VFE_HW_VERSION);
7319cdf189bb64 Robert Foss 2021-03-16  183  =

7319cdf189bb64 Robert Foss 2021-03-16 @184  	u32 gen =3D (hw_version >> 28)=
 & 0xF;
7319cdf189bb64 Robert Foss 2021-03-16 @185  	u32 rev =3D (hw_version >> 16)=
 & 0xFFF;
7319cdf189bb64 Robert Foss 2021-03-16 @186  	u32 step =3D hw_version & 0xFF=
FF;
7319cdf189bb64 Robert Foss 2021-03-16  187  =

2fa698e3da84ed Robert Foss 2021-07-26  188  	dev_dbg(dev, "VFE HW Version =
=3D %u.%u.%u\n", gen, rev, step);
7319cdf189bb64 Robert Foss 2021-03-16  189  }
7319cdf189bb64 Robert Foss 2021-03-16  190  =


:::::: The code at line 184 was first introduced by commit
:::::: 7319cdf189bb643c6d56e5898ef89ad7c3ef6c31 media: camss: Add support f=
or VFE hardware version Titan 170

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3617874332415671233==--

