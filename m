Content-Type: multipart/mixed; boundary="===============5104578645103112510=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored to 'error' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 23 Apr 2022 23:48:17 +0800
Message-ID: <202204232305.EzKAGdih-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5104578645103112510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Ren=
esas drivers on a separate dir
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220423/202204232305.EzKAGdih-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/dvb-frontends/cxd2099.c:506:3: note: Calling 'read_reg'
                   read_reg(ci, 0x01, &slotstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:79:9: note: Calling 'read_block'
           return read_block(ci, reg, val, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:57:6: note: Assuming 'adr' is not =
equal to field 'lastaddress'
           if (ci->lastaddress !=3D adr)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:57:2: note: Taking true branch
           if (ci->lastaddress !=3D adr)
           ^
   drivers/media/dvb-frontends/cxd2099.c:59:6: note: Assuming 'status' is n=
ot equal to 0
           if (!status) {
               ^~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:59:2: note: Taking false branch
           if (!status) {
           ^
   drivers/media/dvb-frontends/cxd2099.c:74:2: note: Returning without writ=
ing to '*data'
           return status;
           ^
   drivers/media/dvb-frontends/cxd2099.c:79:9: note: Returning from 'read_b=
lock'
           return read_block(ci, reg, val, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:79:2: note: Returning without writ=
ing to '*val'
           return read_block(ci, reg, val, 1);
           ^
   drivers/media/dvb-frontends/cxd2099.c:506:3: note: Returning from 'read_=
reg'
                   read_reg(ci, 0x01, &slotstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:507:11: note: The right operand of=
 '&' is a garbage value
                   if (!(2 & slotstat)) {
                           ^ ~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/clocksource/timer-ti-dm-systimer.c:476:3: warning: Value stored =
to 'l' is never read [clang-analyzer-deadcode.DeadStores]
                   l =3D readl_relaxed(ctrl);
                   ^
   drivers/clocksource/timer-ti-dm-systimer.c:476:3: note: Value stored to =
'l' is never read
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/clocksource/timer-fttmr010.c:99:8: warning: Excessive padding in=
 'struct fttmr010' (39 padding bytes, where 7 is optimal). =

   Optimal fields order: =

   clkevt, =

   base, =

   tick_rate, =

   t1_enable_val, =

   timer_shutdown, =

   delay_timer, =

   is_aspeed, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct fttmr010 {
   ~~~~~~~^~~~~~~~~~
   drivers/clocksource/timer-fttmr010.c:99:8: note: Excessive padding in 's=
truct fttmr010' (39 padding bytes, where 7 is optimal). Optimal fields orde=
r: clkevt, base, tick_rate, t1_enable_val, timer_shutdown, delay_timer, is_=
aspeed, consider reordering the fields or adding explicit padding members
   struct fttmr010 {
   ~~~~~~~^~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/clocksource/timer-ixp4xx.c:48:8: warning: Excessive padding in '=
struct ixp4xx_timer' (48 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   clkevt, =

   base, =

   latch, =

   delay_timer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/clocksource/timer-ixp4xx.c:48:8: note: Excessive padding in 'str=
uct ixp4xx_timer' (48 padding bytes, where 16 is optimal). Optimal fields o=
rder: clkevt, base, latch, delay_timer, consider reordering the fields or a=
dding explicit padding members
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored=
 to 'error' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_jpu.c:1551:17: note: Value stored to=
 'error' during its initialization is never read
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/media/platform/sti/hva/hva-v4l2.c:230:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:230:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: warning: Value stored =
to 'stream' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: note: Value stored to =
'stream' during its initialization is never read
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: warning: Value stored =
to 'frame' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: note: Value stored to =
'frame' during its initialization is never read
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/mfd/qcom-pm8xxx.c:549:2: warning: Value stored to 'rev' is never=
 read [clang-analyzer-deadcode.DeadStores]
           rev |=3D val << BITS_PER_BYTE;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/qcom-pm8xxx.c:549:2: note: Value stored to 'rev' is never re=
ad
           rev |=3D val << BITS_PER_BYTE;
           ^      ~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored=
 to 'error' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_jpu.c:1551:17: note: Value stored to=
 'error' during its initialization is never read
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/media/platform/sti/hva/hva-v4l2.c:230:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:230:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: warning: Value stored =
to 'stream' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: note: Value stored to =
'stream' during its initialization is never read
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: warning: Value stored =
to 'frame' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: note: Value stored to =
'frame' during its initialization is never read
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/error +1551 drivers/media/platform/renesas/rcar_jpu.c

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1489  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1490  /*
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1491   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1492   * IRQ handler
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1493   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1494   */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1495  static irqreturn_t jpu_irq_handler(int irq, void *dev_id)
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1496  {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1497  	struct jpu *jpu =3D dev_id;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1498  	struct jpu_ctx *curr_ctx;
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1499  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1500  	unsigned int int_status;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1501  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1502  	int_status =3D jpu_read(jpu, JINTS);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1503  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1504  	/* ...spurious interrupt */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1505  	if (!((JINTS_TRANSF_COMPL | JINTS_PROCESS_COMPL | JINTS_ERR) &
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1506  	    int_status))
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1507  		return IRQ_NONE;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1508  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1509  	/* ...clear interrupts */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1510  	jpu_write(jpu, ~(int_status & JINTS_MASK), JINTS);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1511  	if (int_status & (JINTS_ERR | JINTS_PROCESS_COMPL))
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1512  		jpu_write(jpu, JCCMD_JEND, JCCMD);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1513  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1514  	spin_lock(&jpu->lock);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1515  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1516  	if ((int_status & JINTS_PROCESS_COMPL) &&
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1517  	   !(int_status & JINTS_TRANSF_COMPL))
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1518  		goto handled;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1519  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1520  	curr_ctx =3D v4l2_m2m_get_curr_priv(jpu->m2m_dev);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1521  	if (!curr_ctx) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1522  		/* ...instance is not running */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1523  		dev_err(jpu->dev, "no active context for m2m\n");
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1524  		goto handled;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1525  	}
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1526  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1527  	src_buf =3D v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1528  	dst_buf =3D v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1529  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1530  	if (int_status & JINTS_TRANSF_COMPL) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1531  		if (curr_ctx->encoder) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1532  			unsigned long payload_size =3D jpu_read(jpu, JCDTCU) << 16
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1533  						   | jpu_read(jpu, JCDTCM) << 8
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1534  						   | jpu_read(jpu, JCDTCD);
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1535  			vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1536  				payload_size + JPU_JPEG_HDR_SIZE);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1537  		}
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1538  =

2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1539  		dst_buf->field =3D src_buf->field;
d6dd645eae76ee drivers/media/platform/rcar_jpu.c Junghak Sung    2015-11-03=
  1540  		dst_buf->vb2_buf.timestamp =3D src_buf->vb2_buf.timestamp;
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1541  		if (src_buf->flags & V4L2_BUF_FLAG_TIMECODE)
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1542  			dst_buf->timecode =3D src_buf->timecode;
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1543  		dst_buf->flags =3D src_buf->flags &
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1544  			(V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_KEYFRAME |
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1545  			 V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME |
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1546  			 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1547  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1548  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1549  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1550  	} else if (int_status & JINTS_ERR) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
 @1551  		unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_MASK;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1552  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1553  		dev_dbg(jpu->dev, "processing error: %#X: %s\n", error,
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1554  			error_to_text[error]);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1555  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1556  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1557  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1558  	}
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1559  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1560  	jpu->curr =3D NULL;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1561  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1562  	/* ...reset JPU after completion */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1563  	jpu_write(jpu, JCCMD_SRST, JCCMD);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1564  	spin_unlock(&jpu->lock);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1565  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1566  	v4l2_m2m_job_finish(jpu->m2m_dev, curr_ctx->fh.m2m_ctx);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1567  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1568  	return IRQ_HANDLED;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1569  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1570  handled:
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1571  	spin_unlock(&jpu->lock);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1572  	return IRQ_HANDLED;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1573  }
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1574  =


:::::: The code at line 1551 was first introduced by commit
:::::: 2c42cdbaec56a9565a2717b450506150c9c55103 [media] V4L2: platform: Add=
 Renesas R-Car JPEG codec driver

:::::: TO: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5104578645103112510==--

