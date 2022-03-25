Content-Type: multipart/mixed; boundary="===============7894789863842512420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mailbox/pcc.c:190:6: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 26 Mar 2022 03:20:03 +0800
Message-ID: <202203260350.Oyrspszn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7894789863842512420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sudeep Holla <sudeep.holla@arm.com>
CC: Jassi Brar <jaswinder.singh@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34af78c4e616c359ed428d79fe4758a35d2c5473
commit: 45ec2dafb1775f7d806fbd2387e3f2cc2f56142d mailbox: pcc: Drop handlin=
g invalid bit-width in {read,write}_register
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20220321 (https://download.01.org/0day-ci/ar=
chive/20220326/202203260350.Oyrspszn-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D45ec2dafb1775f7d806fbd2387e3f2cc2f56142d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 45ec2dafb1775f7d806fbd2387e3f2cc2f56142d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/core/cec-adap.c:418:10: note: Loop condition is false.=
  Exiting loop
                   data =3D list_first_entry(&adap->transmit_queue,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/cec/core/cec-adap.c:420:3: note: Use of memory after it is=
 freed
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^               ~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (2 in non-user code, 4 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   4 warnings generated.
>> drivers/mailbox/pcc.c:190:6: warning: The left expression of the compoun=
d assignment is an uninitialized value. The computed value will also be gar=
bage [clang-analyzer-core.uninitialized.Assign]
           val &=3D reg->preserve_mask;
               ^
   drivers/mailbox/pcc.c:345:9: note: Calling 'pcc_chan_reg_read_modify_wri=
te'
           return pcc_chan_reg_read_modify_write(&pchan->db);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:184:2: note: 'val' declared without an initial val=
ue
           u64 val;
           ^~~~~~~
   drivers/mailbox/pcc.c:186:8: note: Calling 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(reg, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:153:6: note: Assuming field 'gas' is non-null, whi=
ch participates in a condition later
           if (!reg->gas) {
               ^~~~~~~~~
   drivers/mailbox/pcc.c:153:2: note: Taking false branch
           if (!reg->gas) {
           ^
   drivers/mailbox/pcc.c:158:6: note: Assuming field 'vaddr' is non-null
           if (reg->vaddr)
               ^~~~~~~~~~
   drivers/mailbox/pcc.c:158:2: note: Taking true branch
           if (reg->vaddr)
           ^
   drivers/mailbox/pcc.c:159:3: note: Calling 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:115:2: note: 'Default' branch taken. Execution con=
tinues on line 115
           switch (bit_width) {
           ^
   drivers/mailbox/pcc.c:129:1: note: Returning without writing to '*val'
   }
   ^
   drivers/mailbox/pcc.c:159:3: note: Returning from 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:163:2: note: Returning without writing to '*val'
           return ret;
           ^
   drivers/mailbox/pcc.c:163:2: note: Returning zero (loaded from 'ret'), w=
hich participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/mailbox/pcc.c:186:8: note: Returning from 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(reg, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:187:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mailbox/pcc.c:187:2: note: Taking false branch
           if (ret)
           ^
   drivers/mailbox/pcc.c:190:6: note: The left expression of the compound a=
ssignment is an uninitialized value. The computed value will also be garbage
           val &=3D reg->preserve_mask;
           ~~~ ^
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-core/dvb_ca_en50221.c:760:19: warning: The left operan=
d of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
                   buf[0], (buf[1] & 0x80) =3D=3D 0, bytes_read);
                                   ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1300:2: note: Assuming 'dvb_ca_e=
n50221_debug' is 0
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:39:6: note: expanded from macro =
'dprintk'
           if (dvb_ca_en50221_debug)                                       \
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:1300:2: note: Taking false branch
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:39:2: note: expanded from macro =
'dprintk'
           if (dvb_ca_en50221_debug)                                       \
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1300:2: note: Loop condition is =
false.  Exiting loop
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:38:30: note: expanded from macro=
 'dprintk'
   #define dprintk(fmt, arg...) do {                                       \
                                ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1306:9: note: Assuming the condi=
tion is true
           while (!kthread_should_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:1306:2: note: Loop condition is =
true.  Entering loop body
           while (!kthread_should_stop()) {
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1308:7: note: Assuming field 'wa=
keup' is not equal to 0
                   if (!ca->wakeup) {

vim +190 drivers/mailbox/pcc.c

800cda7b63f22b Sudeep Holla 2021-09-17  180  =

800cda7b63f22b Sudeep Holla 2021-09-17  181  static int pcc_chan_reg_read_m=
odify_write(struct pcc_chan_reg *reg)
800cda7b63f22b Sudeep Holla 2021-09-17  182  {
800cda7b63f22b Sudeep Holla 2021-09-17  183  	int ret =3D 0;
800cda7b63f22b Sudeep Holla 2021-09-17  184  	u64 val;
800cda7b63f22b Sudeep Holla 2021-09-17  185  =

800cda7b63f22b Sudeep Holla 2021-09-17  186  	ret =3D pcc_chan_reg_read(reg=
, &val);
800cda7b63f22b Sudeep Holla 2021-09-17  187  	if (ret)
800cda7b63f22b Sudeep Holla 2021-09-17  188  		return ret;
800cda7b63f22b Sudeep Holla 2021-09-17  189  =

800cda7b63f22b Sudeep Holla 2021-09-17 @190  	val &=3D reg->preserve_mask;
800cda7b63f22b Sudeep Holla 2021-09-17  191  	val |=3D reg->set_mask;
800cda7b63f22b Sudeep Holla 2021-09-17  192  =

800cda7b63f22b Sudeep Holla 2021-09-17  193  	return pcc_chan_reg_write(reg=
, val);
800cda7b63f22b Sudeep Holla 2021-09-17  194  }
800cda7b63f22b Sudeep Holla 2021-09-17  195  =


:::::: The code at line 190 was first introduced by commit
:::::: 800cda7b63f22be62e67142f1202d2ead2dff2e8 mailbox: pcc: Add PCC regis=
ter bundle and associated accessor functions

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7894789863842512420==--

