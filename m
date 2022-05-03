Content-Type: multipart/mixed; boundary="===============7246096966023454033=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/amphion/vpu_msgs.c:138:11: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 03 May 2022 13:50:21 +0800
Message-ID: <202205031347.87ExTE6s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7246096966023454033==
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
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 42356ecbdb69e49cffd0c1df791280965f9f90e1 media: amphion: add amphio=
n vpu entry in Kconfig and Makefile
date:   8 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220503/202205031347.87ExTE6s-lkp(a)intel.com/config)
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
   1 warning generated.
   fs/btrfs/free-space-cache.c:755:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D -1;
           ^     ~~
   fs/btrfs/free-space-cache.c:755:2: note: Value stored to 'ret' is never =
read
           ret =3D -1;
           ^     ~~
   1 warning generated.
   fs/btrfs/zlib.c:227:13: warning: The left operand of '!=3D' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           while (ret !=3D Z_STREAM_END) {
                  ~~~ ^
   fs/btrfs/zlib.c:99:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   fs/btrfs/zlib.c:115:6: note: Assuming the condition is false
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
               ^
   include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
   #define Z_OK            0
                           ^
   fs/btrfs/zlib.c:115:2: note: Taking false branch
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
           ^
   fs/btrfs/zlib.c:125:6: note: Assuming 'out_page' is not equal to NULL
           if (out_page =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:125:2: note: Taking false branch
           if (out_page =3D=3D NULL) {
           ^
   fs/btrfs/zlib.c:138:9: note: Assuming 'len' is <=3D field 'total_in'
           while (workspace->strm.total_in < len) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:138:2: note: Loop condition is false. Execution continue=
s on line 222
           while (workspace->strm.total_in < len) {
           ^
   fs/btrfs/zlib.c:227:13: note: The left operand of '!=3D' is a garbage va=
lue
           while (ret !=3D Z_STREAM_END) {
                  ~~~ ^
   1 warning generated.
   fs/gfs2/file.c:793:3: warning: Value stored to 'pages' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   pages =3D min(pages, nr_dirtied);
                   ^
   fs/gfs2/file.c:793:3: note: Value stored to 'pages' is never read
   1 warning generated.
   fs/gfs2/ops_fstype.c:852:2: warning: Value stored to 'jindex' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           jindex =3D 0;
           ^        ~
   fs/gfs2/ops_fstype.c:852:2: note: Value stored to 'jindex' is never read
           jindex =3D 0;
           ^        ~
   2 warnings generated.
   fs/gfs2/inode.c:1493:4: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1493:4: note: Value stored to 'error' is never read
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1558:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/inode.c:1558:3: note: Value stored to 'error' is never read
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   include/linux/hid.h:1037:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-ite.c:49:7: note: Assuming the condition is true
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:49:6: note: Left side of '&&' is true
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
               ^

vim +138 drivers/media/platform/amphion/vpu_msgs.c

61cbf1c1fa6d74 Ming Qian 2022-02-24   32  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   33  static void vpu_session_handle_me=
m_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   34  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   35  	struct vpu_pkt_mem_req_data req_=
data;
61cbf1c1fa6d74 Ming Qian 2022-02-24   36  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   37  	vpu_iface_unpack_msg_data(inst->=
core, pkt, (void *)&req_data);
61cbf1c1fa6d74 Ming Qian 2022-02-24   38  	vpu_trace(inst->dev, "[%d] %d:%d=
 %d:%d %d:%d\n",
61cbf1c1fa6d74 Ming Qian 2022-02-24   39  		  inst->id,
61cbf1c1fa6d74 Ming Qian 2022-02-24   40  		  req_data.enc_frame_size,
61cbf1c1fa6d74 Ming Qian 2022-02-24   41  		  req_data.enc_frame_num,
61cbf1c1fa6d74 Ming Qian 2022-02-24   42  		  req_data.ref_frame_size,
61cbf1c1fa6d74 Ming Qian 2022-02-24   43  		  req_data.ref_frame_num,
61cbf1c1fa6d74 Ming Qian 2022-02-24   44  		  req_data.act_buf_size,
61cbf1c1fa6d74 Ming Qian 2022-02-24   45  		  req_data.act_buf_num);
61cbf1c1fa6d74 Ming Qian 2022-02-24  @46  	call_void_vop(inst, mem_request,
61cbf1c1fa6d74 Ming Qian 2022-02-24   47  		      req_data.enc_frame_size,
61cbf1c1fa6d74 Ming Qian 2022-02-24   48  		      req_data.enc_frame_num,
61cbf1c1fa6d74 Ming Qian 2022-02-24   49  		      req_data.ref_frame_size,
61cbf1c1fa6d74 Ming Qian 2022-02-24   50  		      req_data.ref_frame_num,
61cbf1c1fa6d74 Ming Qian 2022-02-24   51  		      req_data.act_buf_size,
61cbf1c1fa6d74 Ming Qian 2022-02-24   52  		      req_data.act_buf_num);
61cbf1c1fa6d74 Ming Qian 2022-02-24   53  }
61cbf1c1fa6d74 Ming Qian 2022-02-24   54  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   55  static void vpu_session_handle_st=
op_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   56  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   57  	vpu_trace(inst->dev, "[%d]\n", i=
nst->id);
61cbf1c1fa6d74 Ming Qian 2022-02-24   58  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   59  	call_void_vop(inst, stop_done);
61cbf1c1fa6d74 Ming Qian 2022-02-24   60  }
61cbf1c1fa6d74 Ming Qian 2022-02-24   61  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   62  static void vpu_session_handle_se=
q_hdr(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   63  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   64  	struct vpu_dec_codec_info info;
61cbf1c1fa6d74 Ming Qian 2022-02-24   65  	const struct vpu_core_resources =
*res;
61cbf1c1fa6d74 Ming Qian 2022-02-24   66  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   67  	memset(&info, 0, sizeof(info));
61cbf1c1fa6d74 Ming Qian 2022-02-24   68  	res =3D vpu_get_resource(inst);
61cbf1c1fa6d74 Ming Qian 2022-02-24   69  	info.stride =3D res ? res->strid=
e : 1;
61cbf1c1fa6d74 Ming Qian 2022-02-24   70  	vpu_iface_unpack_msg_data(inst->=
core, pkt, (void *)&info);
61cbf1c1fa6d74 Ming Qian 2022-02-24   71  	call_void_vop(inst, event_notify=
, VPU_MSG_ID_SEQ_HDR_FOUND, &info);
61cbf1c1fa6d74 Ming Qian 2022-02-24   72  }
61cbf1c1fa6d74 Ming Qian 2022-02-24   73  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   74  static void vpu_session_handle_re=
solution_change(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   75  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   76  	call_void_vop(inst, event_notify=
, VPU_MSG_ID_RES_CHANGE, NULL);
61cbf1c1fa6d74 Ming Qian 2022-02-24   77  }
61cbf1c1fa6d74 Ming Qian 2022-02-24   78  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   79  static void vpu_session_handle_en=
c_frame_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   80  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   81  	struct vpu_enc_pic_info info;
61cbf1c1fa6d74 Ming Qian 2022-02-24   82  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   83  	vpu_iface_unpack_msg_data(inst->=
core, pkt, (void *)&info);
61cbf1c1fa6d74 Ming Qian 2022-02-24   84  	dev_dbg(inst->dev, "[%d] frame i=
d =3D %d, wptr =3D 0x%x, size =3D %d\n",
61cbf1c1fa6d74 Ming Qian 2022-02-24   85  		inst->id, info.frame_id, info.w=
ptr, info.frame_size);
61cbf1c1fa6d74 Ming Qian 2022-02-24   86  	call_void_vop(inst, get_one_fram=
e, &info);
61cbf1c1fa6d74 Ming Qian 2022-02-24   87  }
61cbf1c1fa6d74 Ming Qian 2022-02-24   88  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   89  static void vpu_session_handle_fr=
ame_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   90  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   91  	struct vpu_fs_info fs;
61cbf1c1fa6d74 Ming Qian 2022-02-24   92  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   93  	vpu_iface_unpack_msg_data(inst->=
core, pkt, &fs);
61cbf1c1fa6d74 Ming Qian 2022-02-24   94  	call_void_vop(inst, event_notify=
, VPU_MSG_ID_FRAME_REQ, &fs);
61cbf1c1fa6d74 Ming Qian 2022-02-24   95  }
61cbf1c1fa6d74 Ming Qian 2022-02-24   96  =

61cbf1c1fa6d74 Ming Qian 2022-02-24   97  static void vpu_session_handle_fr=
ame_release(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24   98  {
61cbf1c1fa6d74 Ming Qian 2022-02-24   99  	if (inst->core->type =3D=3D VPU_=
CORE_TYPE_ENC) {
61cbf1c1fa6d74 Ming Qian 2022-02-24  100  		struct vpu_frame_info info;
61cbf1c1fa6d74 Ming Qian 2022-02-24  101  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  102  		memset(&info, 0, sizeof(info));
61cbf1c1fa6d74 Ming Qian 2022-02-24  103  		vpu_iface_unpack_msg_data(inst-=
>core, pkt, (void *)&info.sequence);
61cbf1c1fa6d74 Ming Qian 2022-02-24  104  		dev_dbg(inst->dev, "[%d] %d\n",=
 inst->id, info.sequence);
61cbf1c1fa6d74 Ming Qian 2022-02-24  105  		info.type =3D inst->out_format.=
type;
61cbf1c1fa6d74 Ming Qian 2022-02-24  106  		call_void_vop(inst, buf_done, &=
info);
61cbf1c1fa6d74 Ming Qian 2022-02-24  107  	} else if (inst->core->type =3D=
=3D VPU_CORE_TYPE_DEC) {
61cbf1c1fa6d74 Ming Qian 2022-02-24  108  		struct vpu_fs_info fs;
61cbf1c1fa6d74 Ming Qian 2022-02-24  109  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  110  		vpu_iface_unpack_msg_data(inst-=
>core, pkt, &fs);
61cbf1c1fa6d74 Ming Qian 2022-02-24  111  		call_void_vop(inst, event_notif=
y, VPU_MSG_ID_FRAME_RELEASE, &fs);
61cbf1c1fa6d74 Ming Qian 2022-02-24  112  	}
61cbf1c1fa6d74 Ming Qian 2022-02-24  113  }
61cbf1c1fa6d74 Ming Qian 2022-02-24  114  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  115  static void vpu_session_handle_in=
put_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24  116  {
61cbf1c1fa6d74 Ming Qian 2022-02-24  117  	dev_dbg(inst->dev, "[%d]\n", ins=
t->id);
61cbf1c1fa6d74 Ming Qian 2022-02-24  118  	call_void_vop(inst, input_done);
61cbf1c1fa6d74 Ming Qian 2022-02-24  119  }
61cbf1c1fa6d74 Ming Qian 2022-02-24  120  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  121  static void vpu_session_handle_pi=
c_decoded(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
61cbf1c1fa6d74 Ming Qian 2022-02-24  122  {
61cbf1c1fa6d74 Ming Qian 2022-02-24  123  	struct vpu_dec_pic_info info;
61cbf1c1fa6d74 Ming Qian 2022-02-24  124  =

61cbf1c1fa6d74 Ming Qian 2022-02-24  125  	vpu_iface_unpack_msg_data(inst->=
core, pkt, (void *)&info);
61cbf1c1fa6d74 Ming Qian 2022-02-24  126  	call_void_vop(inst, get_one_fram=
e, &info);
61cbf1c1fa6d74 Ming Qian 2022-02-24  127  }
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
--===============7246096966023454033==--

