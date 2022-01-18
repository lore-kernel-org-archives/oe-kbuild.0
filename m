Content-Type: multipart/mixed; boundary="===============6355932104689702407=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 18 Jan 2022 19:13:23 +0800
Message-ID: <202201181438.cwk7ZGyB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6355932104689702407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0c947b893d69231a9add855939da7c66237ab44f
commit: f7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a media: venus: venc: Add su=
pport for intra-refresh period
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220111 (https://download.01.org/0day-ci/arc=
hive/20220118/202201181438.cwk7ZGyB-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (start_lsn)
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
   fs/xfs/xfs_log.c:2394:2: note: Taking false branch
           if (start_lsn)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/xfs/xfs_log.c:2396:9: note: 'lv' is non-null
           while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)) {
                  ^~
   fs/xfs/xfs_log.c:2396:9: note: Left side of '&&' is true
   fs/xfs/xfs_log.c:2396:16: note: Assuming field 'lv_niovecs' is not equal=
 to 0
           while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)) {
                         ^~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:2396:16: note: Left side of '||' is false
   fs/xfs/xfs_log.c:2396:35: note: Assuming 'index' is >=3D field 'lv_niove=
cs'
           while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)) {
                                            ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:2396:2: note: Loop condition is false. Execution contin=
ues on line 2524
           while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)) {
           ^
   fs/xfs/xfs_log.c:2524:9: note: Assuming 'len' is equal to 0
           ASSERT(len =3D=3D 0);
                  ^
   fs/xfs/xfs_linux.h:207:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/xfs/xfs_log.c:2524:2: note: '?' condition is true
           ASSERT(len =3D=3D 0);
           ^
   fs/xfs/xfs_linux.h:207:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/xfs_log.c:2527:30: note: Passing null pointer value via 2nd param=
eter 'iclog'
           xlog_state_finish_copy(log, iclog, record_cnt, data_cnt);
                                       ^~~~~
   fs/xfs/xfs_log.c:2527:2: note: Calling 'xlog_state_finish_copy'
           xlog_state_finish_copy(log, iclog, record_cnt, data_cnt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:2003:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&log->l_icloglock);
           ^
   include/linux/lockdep.h:310:11: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks &&                                  \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/xfs/xfs_log.c:2003:2: note: Left side of '&&' is false
           lockdep_assert_held(&log->l_icloglock);
           ^
   include/linux/lockdep.h:310:23: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks &&                                  \
                                       ^
   fs/xfs/xfs_log.c:2003:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&log->l_icloglock);
           ^
   include/linux/lockdep.h:309:32: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)  do {                                    \
                                   ^
   fs/xfs/xfs_log.c:2005:16: note: Access to field 'ic_data' results in a d=
ereference of a null pointer (loaded from variable 'iclog')
           be32_add_cpu(&iclog->ic_header.h_num_logops, record_cnt);
                         ^~~~~
   fs/xfs/xfs_log.c:3629:2: warning: Value stored to 'p' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           p =3D &iclog->ic_header;
           ^   ~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:3629:2: note: Value stored to 'p' is never read
           p =3D &iclog->ic_header;
           ^   ~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:3639:2: warning: Value stored to 'ophead' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ophead =3D ptr;
           ^        ~~~
   fs/xfs/xfs_log.c:3639:2: note: Value stored to 'ophead' is never read
           ophead =3D ptr;
           ^        ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:807:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/ti-adc128s052.c:26:8: warning: Excessive padding in 'str=
uct adc128' (94 padding bytes, where 30 is optimal). =

   Optimal fields order: =

   buffer, =

   spi, =

   reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc128 {
   ~~~~~~~^~~~~~~~
   drivers/iio/adc/ti-adc128s052.c:26:8: note: Excessive padding in 'struct=
 adc128' (94 padding bytes, where 30 is optimal). Optimal fields order: buf=
fer, spi, reg, lock, consider reordering the fields or adding explicit padd=
ing members
   struct adc128 {
   ~~~~~~~^~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/ti-adc161s626.c:66:8: warning: Excessive padding in 'str=
uct ti_adc_data' (98 padding bytes, where 34 is optimal). =

   Optimal fields order: =

   buffer, =

   indio_dev, =

   spi, =

   ref, =

   read_size, =

   shift, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ti_adc_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/adc/ti-adc161s626.c:66:8: note: Excessive padding in 'struct=
 ti_adc_data' (98 padding bytes, where 34 is optimal). Optimal fields order=
: buffer, indio_dev, spi, ref, read_size, shift, consider reordering the fi=
elds or adding explicit padding members
   struct ti_adc_data {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/ti-ads1015.c:414:12: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
           scan.chan =3D res;
                     ^ ~~~
   drivers/iio/adc/ti-ads1015.c:401:17: note: 'res' declared without an ini=
tial value
           int chan, ret, res;
                          ^~~
   drivers/iio/adc/ti-ads1015.c:408:8: note: Calling 'ads1015_get_adc_resul=
t'
           ret =3D ads1015_get_adc_result(data, chan, &res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:350:6: note: 'chan' is >=3D 0
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iio/adc/ti-ads1015.c:350:6: note: Left side of '||' is false
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
               ^
   drivers/iio/adc/ti-ads1015.c:350:18: note: Assuming 'chan' is < 8
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iio/adc/ti-ads1015.c:350:2: note: '?' condition is false
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iio/adc/ti-ads1015.c:350:6: note: 'chan' is >=3D 0
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
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
   drivers/iio/adc/ti-ads1015.c:350:6: note: Left side of '||' is false
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
               ^
   drivers/iio/adc/ti-ads1015.c:350:18: note: 'chan' is < 8
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
--
   drivers/media/platform/s5p-jpeg/jpeg-core.c:1141:3: note: Value stored t=
o 'length' is never read
                   length =3D 0;
                   ^        ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   12 warnings generated.
   drivers/video/fbdev/aty/mach64_gx.c:355:3: warning: Value stored to 'MHz=
100' is never read [clang-analyzer-deadcode.DeadStores]
                   MHz100 =3D MAX_FREQ_2595;
                   ^
   drivers/video/fbdev/aty/mach64_gx.c:355:3: note: Value stored to 'MHz100=
' is never read
   drivers/video/fbdev/aty/mach64_gx.c:358:3: warning: Value stored to 'pro=
gram_bits' is never read [clang-analyzer-deadcode.DeadStores]
                   program_bits =3D 0;       /* MHz100 =3D 257 */
                   ^              ~
   drivers/video/fbdev/aty/mach64_gx.c:358:3: note: Value stored to 'progra=
m_bits' is never read
                   program_bits =3D 0;       /* MHz100 =3D 257 */
                   ^              ~
   drivers/video/fbdev/aty/mach64_gx.c:649:3: warning: Value stored to 'dif=
f' is never read [clang-analyzer-deadcode.DeadStores]
                   diff =3D 0;
                   ^      ~
   drivers/video/fbdev/aty/mach64_gx.c:649:3: note: Value stored to 'diff' =
is never read
                   diff =3D 0;
                   ^      ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   12 warnings generated.
   drivers/video/fbdev/aty/radeon_base.c:306:3: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D INREG(CLOCK_CNTL_DATA);
                   ^
   drivers/video/fbdev/aty/radeon_base.c:306:3: note: Value stored to 'tmp'=
 is never read
   drivers/video/fbdev/aty/radeon_base.c:432:2: warning: Value stored to 't=
emp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D INREG(MPP_TB_CONFIG);
           ^
   drivers/video/fbdev/aty/radeon_base.c:432:2: note: Value stored to 'temp=
' is never read
   drivers/video/fbdev/aty/radeon_base.c:591:2: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D INREG16(DEVICE_ID);
           ^
   drivers/video/fbdev/aty/radeon_base.c:591:2: note: Value stored to 'tmp'=
 is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   8 warnings generated.
   drivers/video/fbdev/aty/radeon_pm.c:1270:7: warning: Value stored to 'sd=
ram_mode_reg' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
                   u32 sdram_mode_reg =3D rinfo->save_regs[35];
                       ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/aty/radeon_pm.c:1270:7: note: Value stored to 'sdram=
_mode_reg' during its initialization is never read
                   u32 sdram_mode_reg =3D rinfo->save_regs[35];
                       ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:807:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/adc/ltc2496.c:21:8: warning: Excessive padding in 'struct lt=
c2496_driverdata' (94 padding bytes, where 30 is optimal). =

   Optimal fields order: =

   rxbuf, =

   txbuf, =

   common_ddata, =

   spi, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ltc2496_driverdata {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ltc2496.c:21:8: note: Excessive padding in 'struct ltc24=
96_driverdata' (94 padding bytes, where 30 is optimal). Optimal fields orde=
r: rxbuf, txbuf, common_ddata, spi, consider reordering the fields or addin=
g explicit padding members
   struct ltc2496_driverdata {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/platform/am437x/am437x-vpfe.c:819:2: warning: Value stored=
 to 'vpfe_int_status' is never read [clang-analyzer-deadcode.DeadStores]
           vpfe_int_status =3D vpfe_reg_read(ccdc, VPFE_IRQ_STS);
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/am437x/am437x-vpfe.c:819:2: note: Value stored to=
 'vpfe_int_status' is never read
           vpfe_int_status =3D vpfe_reg_read(ccdc, VPFE_IRQ_STS);

vim +/ret +807 drivers/media/platform/qcom/venus/venc.c

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  540  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  541  static int venc_set_prop=
erties(struct venus_inst *inst)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  542  {
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  543  	struct venc_controls *c=
tr =3D &inst->controls.enc;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  544  	struct hfi_intra_period=
 intra_period;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  545  	struct hfi_framerate fr=
ate;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  546  	struct hfi_bitrate brat=
e;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  547  	struct hfi_idr_period i=
drp;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  548  	struct hfi_quantization=
 quant;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  549  	struct hfi_quantization=
_range quant_range;
002c22bd360e07b Dikshita Agarwal  2021-01-08  550  	struct hfi_enable en;
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  551  	struct hfi_ltr_mode ltr=
_mode;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  552  	struct hfi_intra_refres=
h intra_refresh =3D {};
435c53c3698f414 Stanimir Varbanov 2020-09-08  553  	u32 ptype, rate_control=
, bitrate;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  554  	u32 profile, level;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  555  	int ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  556  =

1ad175952bbcafa Dikshita Agarwal  2021-04-02  557  	ret =3D venus_helper_se=
t_work_mode(inst);
01165b8484973da Stanimir Varbanov 2018-07-05  558  	if (ret)
01165b8484973da Stanimir Varbanov 2018-07-05  559  		return ret;
01165b8484973da Stanimir Varbanov 2018-07-05  560  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  561  	ptype =3D HFI_PROPERTY_=
CONFIG_FRAME_RATE;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  562  	frate.buffer_type =3D H=
FI_BUFFER_OUTPUT;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  563  	frate.framerate =3D ins=
t->fps * (1 << 16);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  564  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  565  	ret =3D hfi_session_set=
_property(inst, ptype, &frate);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  566  	if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  567  		return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  568  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  569  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_H264) {
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  570  		struct hfi_h264_vui_ti=
ming_info info;
a7837e11679e015 Loic Poulain      2017-11-24  571  		struct hfi_h264_entrop=
y_control entropy;
f7d12fea16cbcc3 Loic Poulain      2017-11-24  572  		struct hfi_h264_db_con=
trol deblock;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  573  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  574  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_H264_VUI_TIMING_INFO;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  575  		info.enable =3D 1;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  576  		info.fixed_framerate =
=3D 1;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  577  		info.time_scale =3D NS=
EC_PER_SEC;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  578  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  579  		ret =3D hfi_session_se=
t_property(inst, ptype, &info);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  580  		if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  581  			return ret;
a7837e11679e015 Loic Poulain      2017-11-24  582  =

a7837e11679e015 Loic Poulain      2017-11-24  583  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_H264_ENTROPY_CONTROL;
a7837e11679e015 Loic Poulain      2017-11-24  584  		entropy.entropy_mode =
=3D venc_v4l2_to_hfi(
a7837e11679e015 Loic Poulain      2017-11-24  585  					  V4L2_CID_MPEG_VID=
EO_H264_ENTROPY_MODE,
a7837e11679e015 Loic Poulain      2017-11-24  586  					  ctr->h264_entropy=
_mode);
a7837e11679e015 Loic Poulain      2017-11-24  587  		entropy.cabac_model =
=3D HFI_H264_CABAC_MODEL_0;
a7837e11679e015 Loic Poulain      2017-11-24  588  =

a7837e11679e015 Loic Poulain      2017-11-24  589  		ret =3D hfi_session_se=
t_property(inst, ptype, &entropy);
a7837e11679e015 Loic Poulain      2017-11-24  590  		if (ret)
a7837e11679e015 Loic Poulain      2017-11-24  591  			return ret;
f7d12fea16cbcc3 Loic Poulain      2017-11-24  592  =

f7d12fea16cbcc3 Loic Poulain      2017-11-24  593  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_H264_DEBLOCK_CONTROL;
f7d12fea16cbcc3 Loic Poulain      2017-11-24  594  		deblock.mode =3D venc_=
v4l2_to_hfi(
f7d12fea16cbcc3 Loic Poulain      2017-11-24  595  				      V4L2_CID_MPEG_=
VIDEO_H264_LOOP_FILTER_MODE,
f7d12fea16cbcc3 Loic Poulain      2017-11-24  596  				      ctr->h264_loop=
_filter_mode);
f7d12fea16cbcc3 Loic Poulain      2017-11-24  597  		deblock.slice_alpha_of=
fset =3D ctr->h264_loop_filter_alpha;
f7d12fea16cbcc3 Loic Poulain      2017-11-24  598  		deblock.slice_beta_off=
set =3D ctr->h264_loop_filter_beta;
f7d12fea16cbcc3 Loic Poulain      2017-11-24  599  =

f7d12fea16cbcc3 Loic Poulain      2017-11-24  600  		ret =3D hfi_session_se=
t_property(inst, ptype, &deblock);
f7d12fea16cbcc3 Loic Poulain      2017-11-24  601  		if (ret)
f7d12fea16cbcc3 Loic Poulain      2017-11-24  602  			return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  603  	}
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  604  =

f0ddb4e9911665b Dikshita Agarwal  2020-12-16  605  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_H264 ||
f0ddb4e9911665b Dikshita Agarwal  2020-12-16  606  	    inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) {
8fc58186bb41ff8 Stanimir Varbanov 2017-12-01  607  		/* IDR periodicity, n:
8fc58186bb41ff8 Stanimir Varbanov 2017-12-01  608  		 * n =3D 0 - only the =
first I-frame is IDR frame
8fc58186bb41ff8 Stanimir Varbanov 2017-12-01  609  		 * n =3D 1 - all I-fra=
mes will be IDR frames
8fc58186bb41ff8 Stanimir Varbanov 2017-12-01  610  		 * n > 1 - every n-th =
I-frame will be IDR frame
8fc58186bb41ff8 Stanimir Varbanov 2017-12-01  611  		 */
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  612  		ptype =3D HFI_PROPERTY=
_CONFIG_VENC_IDR_PERIOD;
8fc58186bb41ff8 Stanimir Varbanov 2017-12-01  613  		idrp.idr_period =3D 0;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  614  		ret =3D hfi_session_se=
t_property(inst, ptype, &idrp);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  615  		if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  616  			return ret;
f0ddb4e9911665b Dikshita Agarwal  2020-12-16  617  	}
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  618  =

9172652d72f8e9a Stanimir Varbanov 2020-04-23  619  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) {
9172652d72f8e9a Stanimir Varbanov 2020-04-23  620  		struct hfi_hdr10_pq_se=
i hdr10;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  621  		unsigned int c;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  622  =

9172652d72f8e9a Stanimir Varbanov 2020-04-23  623  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_HDR10_PQ_SEI;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  624  =

9172652d72f8e9a Stanimir Varbanov 2020-04-23  625  		for (c =3D 0; c < 3; c=
++) {
9172652d72f8e9a Stanimir Varbanov 2020-04-23  626  			hdr10.mastering.displ=
ay_primaries_x[c] =3D
9172652d72f8e9a Stanimir Varbanov 2020-04-23  627  				ctr->mastering.displ=
ay_primaries_x[c];
9172652d72f8e9a Stanimir Varbanov 2020-04-23  628  			hdr10.mastering.displ=
ay_primaries_y[c] =3D
9172652d72f8e9a Stanimir Varbanov 2020-04-23  629  				ctr->mastering.displ=
ay_primaries_y[c];
9172652d72f8e9a Stanimir Varbanov 2020-04-23  630  		}
9172652d72f8e9a Stanimir Varbanov 2020-04-23  631  =

9172652d72f8e9a Stanimir Varbanov 2020-04-23  632  		hdr10.mastering.white_=
point_x =3D ctr->mastering.white_point_x;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  633  		hdr10.mastering.white_=
point_y =3D ctr->mastering.white_point_y;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  634  		hdr10.mastering.max_di=
splay_mastering_luminance =3D
9172652d72f8e9a Stanimir Varbanov 2020-04-23  635  			ctr->mastering.max_di=
splay_mastering_luminance;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  636  		hdr10.mastering.min_di=
splay_mastering_luminance =3D
9172652d72f8e9a Stanimir Varbanov 2020-04-23  637  			ctr->mastering.min_di=
splay_mastering_luminance;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  638  =

9172652d72f8e9a Stanimir Varbanov 2020-04-23  639  		hdr10.cll.max_content_=
light =3D ctr->cll.max_content_light_level;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  640  		hdr10.cll.max_pic_aver=
age_light =3D
9172652d72f8e9a Stanimir Varbanov 2020-04-23  641  			ctr->cll.max_pic_aver=
age_light_level;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  642  =

9172652d72f8e9a Stanimir Varbanov 2020-04-23  643  		ret =3D hfi_session_se=
t_property(inst, ptype, &hdr10);
9172652d72f8e9a Stanimir Varbanov 2020-04-23  644  		if (ret)
9172652d72f8e9a Stanimir Varbanov 2020-04-23  645  			return ret;
9172652d72f8e9a Stanimir Varbanov 2020-04-23  646  	}
9172652d72f8e9a Stanimir Varbanov 2020-04-23  647  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  648  	if (ctr->num_b_frames) {
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  649  		u32 max_num_b_frames =
=3D NUM_B_FRAMES_MAX;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  650  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  651  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_MAX_NUM_B_FRAMES;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  652  		ret =3D hfi_session_se=
t_property(inst, ptype, &max_num_b_frames);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  653  		if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  654  			return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  655  	}
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  656  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  657  	ptype =3D HFI_PROPERTY_=
CONFIG_VENC_INTRA_PERIOD;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  658  	intra_period.pframes =
=3D ctr->num_p_frames;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  659  	intra_period.bframes =
=3D ctr->num_b_frames;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  660  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  661  	ret =3D hfi_session_set=
_property(inst, ptype, &intra_period);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  662  	if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  663  		return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  664  =

6f704b2fbbde0c9 Jeffrey Kardatzke 2020-02-22  665  	if (!ctr->rc_enable)
6f704b2fbbde0c9 Jeffrey Kardatzke 2020-02-22  666  		rate_control =3D HFI_R=
ATE_CONTROL_OFF;
6f704b2fbbde0c9 Jeffrey Kardatzke 2020-02-22  667  	else if (ctr->bitrate_m=
ode =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
94dfb1689c25ed2 Stanimir Varbanov 2020-07-05  668  		rate_control =3D ctr->=
frame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
94dfb1689c25ed2 Stanimir Varbanov 2020-07-05  669  						      HFI_RATE_CON=
TROL_VBR_CFR;
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  670  	else if (ctr->bitrate_m=
ode =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
94dfb1689c25ed2 Stanimir Varbanov 2020-07-05  671  		rate_control =3D ctr->=
frame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
94dfb1689c25ed2 Stanimir Varbanov 2020-07-05  672  						      HFI_RATE_CON=
TROL_CBR_CFR;
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  673  	else if (ctr->bitrate_m=
ode =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  674  		rate_control =3D HFI_R=
ATE_CONTROL_CQ;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  675  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  676  	ptype =3D HFI_PROPERTY_=
PARAM_VENC_RATE_CONTROL;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  677  	ret =3D hfi_session_set=
_property(inst, ptype, &rate_control);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  678  	if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  679  		return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  680  =

69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  681  	if (rate_control =3D=3D=
 HFI_RATE_CONTROL_CQ && ctr->const_quality) {
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  682  		struct hfi_heic_frame_=
quality quality =3D {};
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  683  =

69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  684  		ptype =3D HFI_PROPERTY=
_CONFIG_HEIC_FRAME_QUALITY;
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  685  		quality.frame_quality =
=3D ctr->const_quality;
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  686  		ret =3D hfi_session_se=
t_property(inst, ptype, &quality);
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  687  		if (ret)
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  688  			return ret;
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  689  	}
69ff4b2caa95e10 Stanimir Varbanov 2020-06-16  690  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  691  	if (!ctr->bitrate)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  692  		bitrate =3D 64000;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  693  	else
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  694  		bitrate =3D ctr->bitra=
te;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  695  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  696  	ptype =3D HFI_PROPERTY_=
CONFIG_VENC_TARGET_BITRATE;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  697  	brate.bitrate =3D bitra=
te;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  698  	brate.layer_id =3D 0;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  699  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  700  	ret =3D hfi_session_set=
_property(inst, ptype, &brate);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  701  	if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  702  		return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  703  =

002c22bd360e07b Dikshita Agarwal  2021-01-08  704  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_H264 ||
002c22bd360e07b Dikshita Agarwal  2021-01-08  705  	    inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) {
002c22bd360e07b Dikshita Agarwal  2021-01-08  706  		ptype =3D HFI_PROPERTY=
_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
002c22bd360e07b Dikshita Agarwal  2021-01-08  707  		if (ctr->header_mode =
=3D=3D V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
002c22bd360e07b Dikshita Agarwal  2021-01-08  708  			en.enable =3D 0;
002c22bd360e07b Dikshita Agarwal  2021-01-08  709  		else
002c22bd360e07b Dikshita Agarwal  2021-01-08  710  			en.enable =3D 1;
002c22bd360e07b Dikshita Agarwal  2021-01-08  711  =

002c22bd360e07b Dikshita Agarwal  2021-01-08  712  		ret =3D hfi_session_se=
t_property(inst, ptype, &en);
002c22bd360e07b Dikshita Agarwal  2021-01-08  713  		if (ret)
002c22bd360e07b Dikshita Agarwal  2021-01-08  714  			return ret;
002c22bd360e07b Dikshita Agarwal  2021-01-08  715  	}
002c22bd360e07b Dikshita Agarwal  2021-01-08  716  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  717  	if (!ctr->bitrate_peak)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  718  		bitrate *=3D 2;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  719  	else
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  720  		bitrate =3D ctr->bitra=
te_peak;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  721  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  722  	ptype =3D HFI_PROPERTY_=
CONFIG_VENC_MAX_BITRATE;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  723  	brate.bitrate =3D bitra=
te;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  724  	brate.layer_id =3D 0;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  725  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  726  	ret =3D hfi_session_set=
_property(inst, ptype, &brate);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  727  	if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  728  		return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  729  =

2123cbd687ca0c5 Kelvin Lawson     2018-11-29  730  	ptype =3D HFI_PROPERTY_=
PARAM_VENC_SESSION_QP;
74c895974fd3566 Dikshita Agarwal  2020-12-24  731  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) {
74c895974fd3566 Dikshita Agarwal  2020-12-24  732  		quant.qp_i =3D ctr->he=
vc_i_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  733  		quant.qp_p =3D ctr->he=
vc_p_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  734  		quant.qp_b =3D ctr->he=
vc_b_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  735  	} else {
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  736  		quant.qp_i =3D ctr->h2=
64_i_qp;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  737  		quant.qp_p =3D ctr->h2=
64_p_qp;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  738  		quant.qp_b =3D ctr->h2=
64_b_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  739  	}
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  740  	quant.layer_id =3D 0;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  741  	ret =3D hfi_session_set=
_property(inst, ptype, &quant);
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  742  	if (ret)
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  743  		return ret;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  744  =

2123cbd687ca0c5 Kelvin Lawson     2018-11-29  745  	ptype =3D HFI_PROPERTY_=
PARAM_VENC_SESSION_QP_RANGE;
74c895974fd3566 Dikshita Agarwal  2020-12-24  746  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) {
74c895974fd3566 Dikshita Agarwal  2020-12-24  747  		quant_range.min_qp =3D=
 ctr->hevc_min_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  748  		quant_range.max_qp =3D=
 ctr->hevc_max_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  749  	} else {
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  750  		quant_range.min_qp =3D=
 ctr->h264_min_qp;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  751  		quant_range.max_qp =3D=
 ctr->h264_max_qp;
74c895974fd3566 Dikshita Agarwal  2020-12-24  752  	}
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  753  	quant_range.layer_id =
=3D 0;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  754  	ret =3D hfi_session_set=
_property(inst, ptype, &quant_range);
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  755  	if (ret)
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  756  		return ret;
2123cbd687ca0c5 Kelvin Lawson     2018-11-29  757  =

f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  758  	ptype =3D HFI_PROPERTY_=
PARAM_VENC_LTRMODE;
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  759  	ltr_mode.ltr_count =3D =
ctr->ltr_count;
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  760  	ltr_mode.ltr_mode =3D H=
FI_LTR_MODE_MANUAL;
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  761  	ltr_mode.trust_mode =3D=
 1;
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  762  	ret =3D hfi_session_set=
_property(inst, ptype, &ltr_mode);
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  763  	if (ret)
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  764  		return ret;
f2fb3f02abe2e66 Dikshita Agarwal  2021-03-24  765  =

a7a20f721e812a5 Stanimir Varbanov 2020-10-27  766  	switch (inst->hfi_codec=
) {
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  767  	case HFI_VIDEO_CODEC_H2=
64:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  768  		profile =3D ctr->profi=
le.h264;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  769  		level =3D ctr->level.h=
264;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  770  		break;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  771  	case HFI_VIDEO_CODEC_MP=
EG4:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  772  		profile =3D ctr->profi=
le.mpeg4;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  773  		level =3D ctr->level.m=
peg4;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  774  		break;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  775  	case HFI_VIDEO_CODEC_VP=
8:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  776  		profile =3D ctr->profi=
le.vp8;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  777  		level =3D 0;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  778  		break;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  779  	case HFI_VIDEO_CODEC_VP=
9:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  780  		profile =3D ctr->profi=
le.vp9;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  781  		level =3D ctr->level.v=
p9;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  782  		break;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  783  	case HFI_VIDEO_CODEC_HE=
VC:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  784  		profile =3D ctr->profi=
le.hevc;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  785  		level =3D ctr->level.h=
evc;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  786  		break;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  787  	case HFI_VIDEO_CODEC_MP=
EG2:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  788  	default:
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  789  		profile =3D 0;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  790  		level =3D 0;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  791  		break;
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  792  	}
a7a20f721e812a5 Stanimir Varbanov 2020-10-27  793  =

a7a20f721e812a5 Stanimir Varbanov 2020-10-27  794  	ret =3D venus_helper_se=
t_profile_level(inst, profile, level);
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  795  	if (ret)
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  796  		return ret;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  797  =

08c06797627935d Stanimir Varbanov 2020-11-24  798  	if (inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_H264 ||
08c06797627935d Stanimir Varbanov 2020-11-24  799  	    inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) {
08c06797627935d Stanimir Varbanov 2020-11-24  800  		struct hfi_enable en =
=3D {};
08c06797627935d Stanimir Varbanov 2020-11-24  801  =

08c06797627935d Stanimir Varbanov 2020-11-24  802  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_H264_GENERATE_AUDNAL;
08c06797627935d Stanimir Varbanov 2020-11-24  803  =

08c06797627935d Stanimir Varbanov 2020-11-24  804  		if (ctr->aud_enable)
08c06797627935d Stanimir Varbanov 2020-11-24  805  			en.enable =3D 1;
08c06797627935d Stanimir Varbanov 2020-11-24  806  =

08c06797627935d Stanimir Varbanov 2020-11-24 @807  		ret =3D hfi_session_se=
t_property(inst, ptype, &en);
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  808  	}
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  809  =

f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  810  	if ((inst->fmt_cap->pix=
fmt =3D=3D V4L2_PIX_FMT_H264 ||
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  811  	     inst->fmt_cap->pix=
fmt =3D=3D V4L2_PIX_FMT_HEVC) &&
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  812  	    (rate_control =3D=
=3D HFI_RATE_CONTROL_CBR_VFR ||
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  813  	     rate_control =3D=
=3D HFI_RATE_CONTROL_CBR_CFR)) {
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  814  		intra_refresh.mode =3D=
 HFI_INTRA_REFRESH_NONE;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  815  		intra_refresh.cir_mbs =
=3D 0;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  816  =

f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  817  		if (ctr->intra_refresh=
_period) {
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  818  			u32 mbs;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  819  =

f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  820  			mbs =3D ALIGN(inst->w=
idth, 16) * ALIGN(inst->height, 16);
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  821  			mbs /=3D 16 * 16;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  822  			if (mbs % ctr->intra_=
refresh_period)
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  823  				mbs++;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  824  			mbs /=3D ctr->intra_r=
efresh_period;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  825  =

f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  826  			intra_refresh.mode =
=3D HFI_INTRA_REFRESH_RANDOM;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  827  			intra_refresh.cir_mbs=
 =3D mbs;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  828  		}
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  829  =

f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  830  		ptype =3D HFI_PROPERTY=
_PARAM_VENC_INTRA_REFRESH;
f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  831  =

f7a3d3dc5831df6 Stanimir Varbanov 2021-06-22  832  		ret =3D hfi_session_se=
t_property(inst, ptype, &intra_refresh);
08c06797627935d Stanimir Varbanov 2020-11-24  833  		if (ret)
08c06797627935d Stanimir Varbanov 2020-11-24  834  			return ret;
08c06797627935d Stanimir Varbanov 2020-11-24  835  	}
08c06797627935d Stanimir Varbanov 2020-11-24  836  =

aaaa93eda64b004 Stanimir Varbanov 2017-06-15  837  	return 0;
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  838  }
aaaa93eda64b004 Stanimir Varbanov 2017-06-15  839  =


:::::: The code at line 807 was first introduced by commit
:::::: 08c06797627935d48621359eb95ab8a69d70d5c5 media: venus: venc: Add sup=
port for AUD NALU control

:::::: TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6355932104689702407==--

