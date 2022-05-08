Content-Type: multipart/mixed; boundary="===============5142741585695387287=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 622/1129] drivers/media/i2c/adv7511-v4l2.c:413:24: warning: Value stored to 'state' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 09 May 2022 03:50:20 +0800
Message-ID: <202205090307.YKsYDSgN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5142741585695387287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Davor Joja <davor.joja@logicbricks.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: 59e26517c7b77c4c82aad32cfac74ae39c32b76b [622/1129] drivers: media:=
 Customized adv7511 for Xylon LogiCVC (deprecated)
:::::: branch date: 4 days ago
:::::: commit date: 3 months ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220509/202205090307.YKsYDSgN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/59e26517c7b77c4c82aad=
32cfac74ae39c32b76b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 59e26517c7b77c4c82aad32cfac74ae39c32b76b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   6 warnings generated.
   drivers/mailbox/bcm-pdc-mailbox.c:523:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:523:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:551:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:551:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:989:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:989:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:1287:2: warning: Value stored to 'dev'=
 is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D &pdev->dev;
           ^     ~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:1287:2: note: Value stored to 'dev' is=
 never read
           dev =3D &pdev->dev;
           ^     ~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   drivers/media/firewire/firedtv-avc.c:1122:2: warning: Value stored to 'p=
mt_cmd_id' is never read [clang-analyzer-deadcode.DeadStores]
           pmt_cmd_id =3D msg[6];
           ^            ~~~~~~
   drivers/media/firewire/firedtv-avc.c:1122:2: note: Value stored to 'pmt_=
cmd_id' is never read
           pmt_cmd_id =3D msg[6];
           ^            ~~~~~~
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
   drivers/media/i2c/ad9389b.c:399:7: warning: Value stored to 'N' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u32 N =3D (ad9389b_rd(sd, 0x01) & 0xf) << 16 |
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ad9389b.c:399:7: note: Value stored to 'N' during its =
initialization is never read
                   u32 N =3D (ad9389b_rd(sd, 0x01) & 0xf) << 16 |
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/i2c/adv7511-v4l2.c:413:24: warning: Value stored to 'state=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct adv7511_state *state =3D get_adv7511_state(sd);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7511-v4l2.c:413:24: note: Value stored to 'state' d=
uring its initialization is never read
           struct adv7511_state *state =3D get_adv7511_state(sd);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
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
   drivers/media/i2c/tvp5150.c:2113:22: warning: Value stored to 'np' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D c->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~
   drivers/media/i2c/tvp5150.c:2113:22: note: Value stored to 'np' during i=
ts initialization is never read
           struct device_node *np =3D c->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   kernel/watch_queue.c:308:24: warning: The left operand of '=3D=3D' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (filter.nr_filters =3D=3D 0 ||
               ~~~~~~~~~~~~~~~~~ ^
   kernel/watch_queue.c:296:6: note: Assuming 'wqueue' is non-null
           if (!wqueue)
               ^~~~~~~
   kernel/watch_queue.c:296:2: note: Taking false branch
           if (!wqueue)
           ^
   kernel/watch_queue.c:299:6: note: Assuming '_filter' is non-null
           if (!_filter) {
               ^~~~~~~~
   kernel/watch_queue.c:299:2: note: Taking false branch
           if (!_filter) {
           ^
   kernel/watch_queue.c:306:6: note: Calling 'copy_from_user'
           if (copy_from_user(&filter, _filter, sizeof(filter)) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
o 'to->nr_filters'
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
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->n=
r_filters'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->n=
r_filters'
           return n;

vim +/state +413 drivers/media/i2c/adv7511-v4l2.c

5a544cce2177fe3 drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  410  =

0a25a0125194639 drivers/media/i2c/adv7511.c Hans Verkuil 2016-06-28  411  s=
tatic void adv7511_set_rgb_quantization_mode(struct v4l2_subdev *sd, struct=
 v4l2_ctrl *ctrl)
5a544cce2177fe3 drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  412  {
5a544cce2177fe3 drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23 @413  	=
struct adv7511_state *state =3D get_adv7511_state(sd);
5a544cce2177fe3 drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  414  =


:::::: The code at line 413 was first introduced by commit
:::::: 5a544cce2177fe361ba539db9ddaf1eff4e73f81 [media] adv7511: add new vi=
deo encoder

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5142741585695387287==--

