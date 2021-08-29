Content-Type: multipart/mixed; boundary="===============2847098334743537102=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [printk:for-5.15-printk-index 5/9] drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1012:19: warning: The right operand of '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sun, 29 Aug 2021 11:41:51 +0800
Message-ID: <202108291140.jbRhqt6z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2847098334743537102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git fo=
r-5.15-printk-index
head:   bc17bed5fd73ef1a9aed39f3b0ea26936dad60b8
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 [5/9] printk: index: Add i=
ndexing support to dev_printk
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20210828 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4e1a16=
4d7bd53653f79decc121afe784d2fde0a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/=
commit/?id=3Dad7d61f159db73974f1b0352f21afe04b0bbd920
        git remote add printk https://git.kernel.org/pub/scm/linux/kernel/g=
it/printk/linux.git
        git fetch --no-tags printk for-5.15-printk-index
        git checkout ad7d61f159db73974f1b0352f21afe04b0bbd920
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2303:8: note: 'cdns_=
bridge_state' is non-null
                   if (!cdns_bridge_state) {
                        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2303:3: note: Taking=
 false branch
                   if (!cdns_bridge_state) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2309:7: note: Assumi=
ng 'current_mode' is non-null
                   if (!current_mode) {
                       ^~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2309:3: note: Taking=
 false branch
                   if (!current_mode) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2314:3: note: Taking=
 false branch
                   if (!cdns_mhdp_bandwidth_ok(mhdp, current_mode, mhdp->li=
nk.num_lanes,
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2320:3: note: Taking=
 false branch
                   dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__,
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2320:3: note: Loop c=
ondition is false.  Exiting loop
                   dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__,
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2323:3: note: Callin=
g 'cdns_mhdp_sst_enable'
                   cdns_mhdp_sst_enable(mhdp, current_mode);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1942:6: note: Assumi=
ng 'vs' is not equal to 'tu_size'
           if (vs =3D=3D tu_size)
               ^~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1942:2: note: Taking=
 false branch
           if (vs =3D=3D tu_size)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1952:2: note: Callin=
g 'cdns_mhdp_reg_write'
           cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:220:8: note: Calling=
 'cdns_mhdp_mailbox_send'
           ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:7: note: Assumin=
g 'ret' is 0
                   if (ret)
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:3: note: Taking =
false branch
                   if (ret)
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:7: note: Assumin=
g 'ret' is 0
                   if (ret)
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:3: note: Taking =
false branch
                   if (ret)
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:7: note: Assumin=
g 'ret' is 0
                   if (ret)
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:3: note: Taking =
false branch
                   if (ret)
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:34: note: The va=
lue 3 is assigned to 'i'
           for (i =3D 0; i < sizeof(header); i++) {
                                           ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:151:9: note: 2nd fun=
ction call argument is an uninitialized value
                   ret =3D cdns_mhdp_mailbox_write(mhdp, header[i]);
                         ^                             ~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1012:19: warning: Th=
e right operand of '+' is a garbage value [clang-analyzer-core.UndefinedBin=
aryOperatorResult]
                   vs[i * 2] =3D '0' + phy_cfg->dp.voltage[i];
                                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1253:2: note: Loop c=
ondition is true.  Entering loop body
           while (1) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1254:8: note: Callin=
g 'cdns_mhdp_link_training_cr'
                   if (!cdns_mhdp_link_training_cr(mhdp)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1160:2: note: Taking=
 false branch
           dev_dbg(mhdp->dev, "Starting CR phase\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1160:2: note: Loop c=
ondition is false.  Exiting loop
           dev_dbg(mhdp->dev, "Starting CR phase\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1163:6: note: 'ret' =
is not equal to 0
           if (ret)
               ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1163:2: note: Taking=
 true branch
           if (ret)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1164:3: note: Contro=
l jumps to line 1226
                   goto err;
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1226:2: note: Callin=
g 'cdns_mhdp_print_lt_status'
           cdns_mhdp_print_lt_status("CR phase failed", mhdp, &phy_cfg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1011:7: note: The va=
lue 0 is assigned to 'i'
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
                ^~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1011:14: note: Assum=
ing 'i' is < field 'num_lanes'
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1011:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1012:19: note: The r=
ight operand of '+' is a garbage value
                   vs[i * 2] =3D '0' + phy_cfg->dp.voltage[i];
                                   ^ ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1136:28: warning: Th=
e left operand of '&' is a garbage value [clang-analyzer-core.UndefinedBina=
ryOperatorResult]
                   same_pre =3D (before_cr[i] & DP_TRAIN_PRE_EMPHASIS_MASK)=
 =3D=3D
                                            ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1253:2: note: Loop c=
ondition is true.  Entering loop body
           while (1) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1254:8: note: Callin=
g 'cdns_mhdp_link_training_cr'
                   if (!cdns_mhdp_link_training_cr(mhdp)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1160:2: note: Taking=
 false branch
           dev_dbg(mhdp->dev, "Starting CR phase\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1160:2: note: Loop c=
ondition is false.  Exiting loop
           dev_dbg(mhdp->dev, "Starting CR phase\n");
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1163:6: note: 'ret' =
is 0
           if (ret)
               ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1163:2: note: Taking=
 false branch
           if (ret)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1173:3: note: Callin=
g 'cdns_mhdp_get_adjust_train'
                   cdns_mhdp_get_adjust_train(mhdp, link_status, lanes_data,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:923:14: note: Assumi=
ng 'i' is >=3D field 'num_lanes'
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:923:2: note: Loop co=
ndition is false. Execution continues on line 923
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:952:1: note: Returni=
ng without writing to '*lanes_data'
   }
   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1173:3: note: Return=
ing from 'cdns_mhdp_get_adjust_train'
                   cdns_mhdp_get_adjust_train(mhdp, link_status, lanes_data,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1181:7: note: Assumi=
ng 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1181:3: note: Taking=
 false branch
                   if (ret) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1190:3: note: Callin=
g 'cdns_mhdp_validate_cr'
                   cdns_mhdp_validate_cr(mhdp, &cr_done, &same_before_adjus=
t,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1128:7: note: The va=
lue 0 is assigned to 'i'
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
                ^~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1128:14: note: Assum=
ing 'i' is < field 'num_lanes'
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1128:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < mhdp->link.num_lanes; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1130:17: note: Assum=
ing '__UNIQUE_ID___x331' is >=3D '__UNIQUE_ID___y332'
                   req_volt[i] =3D min(adjust, max_volt);
                                 ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1130:17: note: '?' c=
ondition is false
                   req_volt[i] =3D min(adjust, max_volt);
                                 ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))

vim +1012 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1002  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1003  static void cdns_mhdp_prin=
t_lt_status(const char *prefix,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1004  				      struct cdns_mhdp=
_device *mhdp,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1005  				      union phy_config=
ure_opts *phy_cfg)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1006  {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1007  	char vs[8] =3D "0/0/0/0";
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1008  	char pe[8] =3D "0/0/0/0";
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1009  	unsigned int i;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1010  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1011  	for (i =3D 0; i < mhdp->l=
ink.num_lanes; i++) {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18 @1012  		vs[i * 2] =3D '0' + phy_=
cfg->dp.voltage[i];
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1013  		pe[i * 2] =3D '0' + phy_=
cfg->dp.pre[i];
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1014  	}
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1015  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1016  	vs[i * 2 - 1] =3D '\0';
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1017  	pe[i * 2 - 1] =3D '\0';
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1018  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1019  	dev_dbg(mhdp->dev, "%s, %=
u lanes, %u Mbps, vs %s, pe %s\n",
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1020  		prefix,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1021  		mhdp->link.num_lanes, mh=
dp->link.rate / 100,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1022  		vs, pe);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1023  }
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1024  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1025  static bool cdns_mhdp_link=
_training_channel_eq(struct cdns_mhdp_device *mhdp,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1026  					       u8 eq_tps,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1027  					       unsigned int t=
raining_interval)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1028  {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1029  	u8 lanes_data[CDNS_DP_MAX=
_NUM_LANES], fail_counter_short =3D 0;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1030  	u8 link_status[DP_LINK_ST=
ATUS_SIZE];
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1031  	union phy_configure_opts =
phy_cfg;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1032  	u32 reg32;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1033  	int ret;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1034  	bool r;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1035  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1036  	dev_dbg(mhdp->dev, "Start=
ing EQ phase\n");
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1037  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1038  	/* Enable link training T=
PS[eq_tps] in PHY */
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1039  	reg32 =3D CDNS_PHY_COMMON=
_CONFIG | CDNS_PHY_TRAINING_EN |
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1040  		CDNS_PHY_TRAINING_TYPE(e=
q_tps);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1041  	if (eq_tps !=3D 4)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1042  		reg32 |=3D CDNS_PHY_SCRA=
MBLER_BYPASS;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1043  	cdns_mhdp_reg_write(mhdp,=
 CDNS_DPTX_PHY_CONFIG, reg32);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1044  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1045  	drm_dp_dpcd_writeb(&mhdp-=
>aux, DP_TRAINING_PATTERN_SET,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1046  			   (eq_tps !=3D 4) ? eq=
_tps | DP_LINK_SCRAMBLING_DISABLE :
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1047  			   CDNS_DP_TRAINING_PAT=
TERN_4);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1048  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1049  	drm_dp_dpcd_read_link_sta=
tus(&mhdp->aux, link_status);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1050  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1051  	do {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1052  		cdns_mhdp_get_adjust_tra=
in(mhdp, link_status, lanes_data,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1053  					   &phy_cfg);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1054  		phy_cfg.dp.lanes =3D mhd=
p->link.num_lanes;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1055  		phy_cfg.dp.ssc =3D cdns_=
mhdp_get_ssc_supported(mhdp);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1056  		phy_cfg.dp.set_lanes =3D=
 false;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1057  		phy_cfg.dp.set_rate =3D =
false;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1058  		phy_cfg.dp.set_voltages =
=3D true;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1059  		ret =3D phy_configure(mh=
dp->phy,  &phy_cfg);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1060  		if (ret) {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1061  			dev_err(mhdp->dev, "%s:=
 phy_configure() failed: %d\n",
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1062  				__func__, ret);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1063  			goto err;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1064  		}
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1065  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1066  		cdns_mhdp_adjust_lt(mhdp=
, mhdp->link.num_lanes,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1067  				    training_interval,=
 lanes_data, link_status);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1068  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1069  		r =3D drm_dp_clock_recov=
ery_ok(link_status, mhdp->link.num_lanes);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1070  		if (!r)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1071  			goto err;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1072  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1073  		if (drm_dp_channel_eq_ok=
(link_status, mhdp->link.num_lanes)) {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1074  			cdns_mhdp_print_lt_stat=
us("EQ phase ok", mhdp,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1075  						  &phy_cfg);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1076  			return true;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1077  		}
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1078  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1079  		fail_counter_short++;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1080  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1081  		cdns_mhdp_adjust_request=
ed_eq(mhdp, link_status);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1082  	} while (fail_counter_sho=
rt < 5);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1083  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1084  err:
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1085  	cdns_mhdp_print_lt_status=
("EQ phase failed", mhdp, &phy_cfg);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1086  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1087  	return false;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1088  }
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1089  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1090  static void cdns_mhdp_adju=
st_requested_cr(struct cdns_mhdp_device *mhdp,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1091  					  u8 link_status[DP_L=
INK_STATUS_SIZE],
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1092  					  u8 *req_volt, u8 *r=
eq_pre)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1093  {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1094  	const u8 max_volt =3D CDN=
S_VOLT_SWING(mhdp->host.volt_swing);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1095  	const u8 max_pre =3D CDNS=
_PRE_EMPHASIS(mhdp->host.pre_emphasis);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1096  	unsigned int i;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1097  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1098  	for (i =3D 0; i < mhdp->l=
ink.num_lanes; i++) {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1099  		u8 val;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1100  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1101  		val =3D mhdp->host.volt_=
swing & CDNS_FORCE_VOLT_SWING ?
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1102  		      max_volt : req_vol=
t[i];
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1103  		cdns_mhdp_set_adjust_req=
uest_voltage(link_status, i, val);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1104  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1105  		val =3D mhdp->host.pre_e=
mphasis & CDNS_FORCE_PRE_EMPHASIS ?
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1106  		      max_pre : req_pre[=
i];
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1107  		cdns_mhdp_set_adjust_req=
uest_pre_emphasis(link_status, i, val);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1108  	}
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1109  }
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1110  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1111  static
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1112  void cdns_mhdp_validate_cr=
(struct cdns_mhdp_device *mhdp, bool *cr_done,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1113  			   bool *same_before_ad=
just, bool *max_swing_reached,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1114  			   u8 before_cr[CDNS_DP=
_MAX_NUM_LANES],
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1115  			   u8 after_cr[DP_LINK_=
STATUS_SIZE], u8 *req_volt,
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1116  			   u8 *req_pre)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1117  {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1118  	const u8 max_volt =3D CDN=
S_VOLT_SWING(mhdp->host.volt_swing);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1119  	const u8 max_pre =3D CDNS=
_PRE_EMPHASIS(mhdp->host.pre_emphasis);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1120  	bool same_pre, same_volt;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1121  	unsigned int i;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1122  	u8 adjust;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1123  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1124  	*same_before_adjust =3D f=
alse;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1125  	*max_swing_reached =3D fa=
lse;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1126  	*cr_done =3D drm_dp_clock=
_recovery_ok(after_cr, mhdp->link.num_lanes);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1127  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1128  	for (i =3D 0; i < mhdp->l=
ink.num_lanes; i++) {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1129  		adjust =3D drm_dp_get_ad=
just_request_voltage(after_cr, i);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1130  		req_volt[i] =3D min(adju=
st, max_volt);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1131  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1132  		adjust =3D drm_dp_get_ad=
just_request_pre_emphasis(after_cr, i) >>
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1133  		      DP_TRAIN_PRE_EMPHA=
SIS_SHIFT;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1134  		req_pre[i] =3D min(adjus=
t, max_pre);
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1135  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18 @1136  		same_pre =3D (before_cr[=
i] & DP_TRAIN_PRE_EMPHASIS_MASK) =3D=3D
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1137  			   req_pre[i] << DP_TRA=
IN_PRE_EMPHASIS_SHIFT;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1138  		same_volt =3D (before_cr=
[i] & DP_TRAIN_VOLTAGE_SWING_MASK) =3D=3D
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1139  			    req_volt[i];
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1140  		if (same_pre && same_vol=
t)
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1141  			*same_before_adjust =3D=
 true;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1142  =

fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1143  		/* 3.1.5.2 in DP Standar=
d v1.4. Table 3-1 */
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1144  		if (!*cr_done && req_vol=
t[i] + req_pre[i] >=3D 3) {
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1145  			*max_swing_reached =3D =
true;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1146  			return;
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1147  		}
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1148  	}
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1149  }
fb43aa0acdfd60 Swapnil Jakhade 2020-09-18  1150  =


:::::: The code at line 1012 was first introduced by commit
:::::: fb43aa0acdfd600c75b8c877bdf9f6e9893ffc9b drm: bridge: Add support fo=
r Cadence MHDP8546 DPI/DP bridge

:::::: TO: Swapnil Jakhade <sjakhade@cadence.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2847098334743537102==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2847098334743537102==--

