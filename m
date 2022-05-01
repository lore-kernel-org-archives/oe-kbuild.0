Content-Type: multipart/mixed; boundary="===============8251365155964445404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/amphion/vpu_msgs.c:138:11: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 01 May 2022 12:29:49 +0800
Message-ID: <202205011201.ePEvrkWw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8251365155964445404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ming Qian <ming.qian@nxp.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: 42356ecbdb69e49cffd0c1df791280965f9f90e1 media: amphion: add amphio=
n vpu entry in Kconfig and Makefile
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220501/202205011201.ePEvrkWw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D42356ecbdb69e49cffd0c1df791280965f9f90e1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 42356ecbdb69e49cffd0c1df791280965f9f90e1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/media/platform/amphion/vpu_msgs.c:38:2: note: Loop condition is =
false.  Exiting loop
           vpu_trace(inst->dev, "[%d] %d:%d %d:%d %d:%d\n",
           ^
   drivers/media/platform/amphion/vpu.h:359:4: note: expanded from macro 'v=
pu_trace'
                           dev_info(dev, "%s: " fmt, __func__, ## arg);    \
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
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/media/platform/amphion/vpu_msgs.c:38:2: note: 5th function call =
argument is an uninitialized value
           vpu_trace(inst->dev, "[%d] %d:%d %d:%d %d:%d\n",
           ^
   drivers/media/platform/amphion/vpu.h:359:4: note: expanded from macro 'v=
pu_trace'
                           dev_info(dev, "%s: " fmt, __func__, ## arg);    \
                           ^                                      ~~~
   include/linux/dev_printk.h:150:24: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
                                 ^                                         =
 ~~~~~~~~~~~
   include/linux/dev_printk.h:110:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                   ^                   ~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_msgs.c:46:2: warning: 2nd function ca=
ll argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           call_void_vop(inst, mem_request,
           ^
   drivers/media/platform/amphion/vpu.h:286:4: note: expanded from macro 'c=
all_void_vop'
                           (inst)->ops->op(inst, ##args);                  =
        \
                           ^                       ~~~~
   drivers/media/platform/amphion/vpu_msgs.c:37:2: note: Calling 'vpu_iface=
_unpack_msg_data'
           vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&req_data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_rpc.h:305:6: note: Assuming 'ops' is =
null
           if (!ops || !ops->unpack_msg_data)
               ^~~~
   drivers/media/platform/amphion/vpu_rpc.h:305:11: note: Left side of '||'=
 is true
           if (!ops || !ops->unpack_msg_data)
                    ^
   drivers/media/platform/amphion/vpu_rpc.h:306:3: note: Returning without =
writing to 'data->enc_frame_size'
                   return -EINVAL;
                   ^
   drivers/media/platform/amphion/vpu_msgs.c:37:2: note: Returning from 'vp=
u_iface_unpack_msg_data'
           vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&req_data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_msgs.c:38:2: note: Assuming 'debug' i=
s false
           vpu_trace(inst->dev, "[%d] %d:%d %d:%d %d:%d\n",
           ^
   drivers/media/platform/amphion/vpu.h:358:7: note: expanded from macro 'v=
pu_trace'
                   if (debug)                                              \
                       ^~~~~
   drivers/media/platform/amphion/vpu_msgs.c:38:2: note: Taking false branch
           vpu_trace(inst->dev, "[%d] %d:%d %d:%d %d:%d\n",
           ^
   drivers/media/platform/amphion/vpu.h:358:3: note: expanded from macro 'v=
pu_trace'
                   if (debug)                                              \
                   ^
   drivers/media/platform/amphion/vpu_msgs.c:38:2: note: Loop condition is =
false.  Exiting loop
           vpu_trace(inst->dev, "[%d] %d:%d %d:%d %d:%d\n",
           ^
   drivers/media/platform/amphion/vpu.h:357:2: note: expanded from macro 'v=
pu_trace'
           do {                                                            \
           ^
   drivers/media/platform/amphion/vpu_msgs.c:46:2: note: Assuming field 'me=
m_request' is non-null
           call_void_vop(inst, mem_request,
           ^
   drivers/media/platform/amphion/vpu.h:285:7: note: expanded from macro 'c=
all_void_vop'
                   if ((inst)->ops->op)                                    \
                       ^~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_msgs.c:46:2: note: Taking true branch
           call_void_vop(inst, mem_request,
           ^
   drivers/media/platform/amphion/vpu.h:285:3: note: expanded from macro 'c=
all_void_vop'
                   if ((inst)->ops->op)                                    \
                   ^
   drivers/media/platform/amphion/vpu_msgs.c:46:2: note: 2nd function call =
argument is an uninitialized value
           call_void_vop(inst, mem_request,
           ^
   drivers/media/platform/amphion/vpu.h:286:4: note: expanded from macro 'c=
all_void_vop'
                           (inst)->ops->op(inst, ##args);                  =
        \
                           ^                       ~~~~
>> drivers/media/platform/amphion/vpu_msgs.c:138:11: warning: Assigned valu=
e is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           frame.id =3D info.id;
                    ^ ~~~~~~~
   drivers/media/platform/amphion/vpu_msgs.c:135:2: note: Calling 'vpu_ifac=
e_unpack_msg_data'
           vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_rpc.h:305:6: note: Assuming 'ops' is =
null
           if (!ops || !ops->unpack_msg_data)
               ^~~~
   drivers/media/platform/amphion/vpu_rpc.h:305:11: note: Left side of '||'=
 is true
           if (!ops || !ops->unpack_msg_data)
                    ^
   drivers/media/platform/amphion/vpu_rpc.h:306:3: note: Returning without =
writing to 'data->id'
                   return -EINVAL;
                   ^
   drivers/media/platform/amphion/vpu_msgs.c:135:2: note: Returning from 'v=
pu_iface_unpack_msg_data'
           vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_msgs.c:136:6: note: Assuming field 't=
ype' is not equal to VPU_CORE_TYPE_DEC
           if (inst->core->type =3D=3D VPU_CORE_TYPE_DEC)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_msgs.c:136:2: note: Taking false bran=
ch
           if (inst->core->type =3D=3D VPU_CORE_TYPE_DEC)
           ^
   drivers/media/platform/amphion/vpu_msgs.c:138:11: note: Assigned value i=
s garbage or undefined
           frame.id =3D info.id;
                    ^ ~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/platform/qcom/camss/camss-vfe-480.c:101:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-480.c:101:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-480.c:102:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-480.c:102:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-480.c:103:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-480.c:103:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   include/media/v4l2-subdev.h:987:10: warning: Access to field 'pads' resu=
lts in a dereference of a null pointer (loaded from variable 'state') [clan=
g-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1533:14: note: Assuming 'i=
' is < field 'line_num'
           for (i =3D 0; i < vfe->line_num; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1533:2: note: Loop conditi=
on is true.  Entering loop body
           for (i =3D 0; i < vfe->line_num; i++) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1543:7: note: 'i' is not e=
qual to VFE_LINE_PIX
                   if (i =3D=3D VFE_LINE_PIX)
                       ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1543:3: note: Taking false=
 branch
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1552:9: note: Calling 'vfe=
_init_formats'
                   ret =3D vfe_init_formats(sd, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1260:12: note: 'fh' is null
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1260:12: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1269:28: note: 'fh' is null
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1269:28: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1269:28: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1269:9: note: Calling 'vfe=
_set_format'

vim +138 drivers/media/platform/amphion/vpu_msgs.c

61cbf1c1fa6d74 Ming Qian 2022-02-24  128  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  129  static void vpu_session_handle_pi=
c_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24  130  {
61cbf1c1fa6d74 Ming Qian 2022-02-24  131  	struct vpu_dec_pic_info info;
61cbf1c1fa6d74 Ming Qian 2022-02-24  132  	struct vpu_frame_info frame;
61cbf1c1fa6d74 Ming Qian 2022-02-24  133  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  134  	memset(&frame, 0, sizeof(frame));
61cbf1c1fa6d74 Ming Qian 2022-02-24  135  	vpu_iface_unpack_msg_data(inst->=
core, pkt, (void *)&info);
61cbf1c1fa6d74 Ming Qian 2022-02-24  136  	if (inst->core->type =3D=3D VPU_=
CORE_TYPE_DEC)
61cbf1c1fa6d74 Ming Qian 2022-02-24  137  		frame.type =3D inst->cap_format=
.type;
61cbf1c1fa6d74 Ming Qian 2022-02-24 @138  	frame.id =3D info.id;
61cbf1c1fa6d74 Ming Qian 2022-02-24  139  	frame.luma =3D info.luma;
61cbf1c1fa6d74 Ming Qian 2022-02-24  140  	frame.skipped =3D info.skipped;
61cbf1c1fa6d74 Ming Qian 2022-02-24  141  	frame.timestamp =3D info.timesta=
mp;
61cbf1c1fa6d74 Ming Qian 2022-02-24  142  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  143  	call_void_vop(inst, buf_done, &f=
rame);
61cbf1c1fa6d74 Ming Qian 2022-02-24  144  }
61cbf1c1fa6d74 Ming Qian 2022-02-24  145  =


:::::: The code at line 138 was first introduced by commit
:::::: 61cbf1c1fa6d74a6a232a365e0aeddcab11036e4 media: amphion: implement v=
pu core communication based on mailbox

:::::: TO: Ming Qian <ming.qian@nxp.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8251365155964445404==--

