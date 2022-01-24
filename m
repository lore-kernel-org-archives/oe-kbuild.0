Content-Type: multipart/mixed; boundary="===============6977714386757791006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/command_buffer.c:472:24: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 24 Jan 2022 23:11:42 +0800
Message-ID: <202201242342.1CK6hoP8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6977714386757791006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: farah kassabri <fkassabri@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: b9d31cada7d9f137028c11534fff77fec8511690 habanalabs: change wait_fo=
r_interrupt implementation
date:   4 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220124/202201242342.1CK6hoP8-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf=
424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db9d31cada7d9f137028c11534fff77fec8511690
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b9d31cada7d9f137028c11534fff77fec8511690
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:968:3: note: Calling 'nouvea=
u_connector_detect_depth'
                   nouveau_connector_detect_depth(connector);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:861:2: note: 'mode' initiali=
zed to a null pointer value
           struct drm_display_mode *mode =3D nv_connector->native_mode;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:865:20: note: Field 'edid' i=
s null
           if (nv_connector->edid && connector->display_info.bpc)
                             ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:865:25: note: Left side of '=
&&' is false
           if (nv_connector->edid && connector->display_info.bpc)
                                  ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:869:6: note: Assuming field =
'type' is not equal to DCB_CONNECTOR_eDP
           if (nv_connector->type =3D=3D DCB_CONNECTOR_eDP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:869:2: note: Taking false br=
anch
           if (nv_connector->type =3D=3D DCB_CONNECTOR_eDP) {
           ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:875:23: note: Field 'type' i=
s equal to DCB_OUTPUT_LVDS
           if (nv_encoder->dcb->type !=3D DCB_OUTPUT_LVDS) {
                                ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:875:2: note: Taking false br=
anch
           if (nv_encoder->dcb->type !=3D DCB_OUTPUT_LVDS) {
           ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:883:12: note: Field 'fp_no_d=
dc' is false
           if (bios->fp_no_ddc) {
                     ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:883:2: note: Taking false br=
anch
           if (bios->fp_no_ddc) {
           ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:892:20: note: Field 'edid' i=
s null
           if (nv_connector->edid &&
                             ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:892:25: note: Left side of '=
&&' is false
           if (nv_connector->edid &&
                                  ^
   drivers/gpu/drm/nouveau/nouveau_connector.c:896:14: note: Access to fiel=
d 'clock' results in a dereference of a null pointer (loaded from variable =
'mode')
                   duallink =3D mode->clock >=3D bios->fp.duallink_transiti=
on_clk;
                              ^~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:1056:34: warning: Value stor=
ed to 'max_clock' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           unsigned int min_clock =3D 25000, max_clock =3D min_clock, clock=
 =3D mode->clock;
                                           ^~~~~~~~~   ~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:1056:34: note: Value stored =
to 'max_clock' during its initialization is never read
           unsigned int min_clock =3D 25000, max_clock =3D min_clock, clock=
 =3D mode->clock;
                                           ^~~~~~~~~   ~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:1283:4: warning: Value store=
d to 'entry' is never read [clang-analyzer-deadcode.DeadStores]
                           entry |=3D (u32)ROM16(nv_connector->dcb[2]) << 1=
6;
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_connector.c:1283:4: note: Value stored t=
o 'entry' is never read
                           entry |=3D (u32)ROM16(nv_connector->dcb[2]) << 1=
6;
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/misc/habanalabs/common/command_buffer.c:472:24: warning: Assigne=
d value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           args->out.device_va =3D device_va;
                                               ^ ~~~~~~~~~
   drivers/misc/habanalabs/common/command_buffer.c:429:18: note: 'device_va=
' declared without an initial value
           u64 handle =3D 0, device_va;
                           ^~~~~~~~~
   drivers/misc/habanalabs/common/command_buffer.c:433:6: note: Assuming th=
e condition is false
           if (!hl_device_operational(hdev, &status)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_buffer.c:433:2: note: Taking fals=
e branch
           if (!hl_device_operational(hdev, &status)) {
           ^
   drivers/misc/habanalabs/common/command_buffer.c:440:2: note: Control jum=
ps to 'case 2:'  at line 463
           switch (args->in.op) {
           ^
   drivers/misc/habanalabs/common/command_buffer.c:464:8: note: Calling 'hl=
_cb_info'
                   rc =3D hl_cb_info(hdev, &hpriv->cb_mgr, args->in.cb_hand=
le,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_buffer.c:399:6: note: Assuming 'c=
b' is null
           if (!cb) {
               ^~~
   drivers/misc/habanalabs/common/command_buffer.c:399:2: note: Taking true=
 branch
           if (!cb) {
           ^
   drivers/misc/habanalabs/common/command_buffer.c:400:3: note: Loop condit=
ion is false.  Exiting loop
                   dev_err(hdev->dev,
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/misc/habanalabs/common/command_buffer.c:403:3: note: Control jum=
ps to line 420
                   goto out;
                   ^
   drivers/misc/habanalabs/common/command_buffer.c:421:2: note: Returning w=
ithout writing to '*device_va'
           return rc;
           ^
   drivers/misc/habanalabs/common/command_buffer.c:464:8: note: Returning f=
rom 'hl_cb_info'
                   rc =3D hl_cb_info(hdev, &hpriv->cb_mgr, args->in.cb_hand=
le,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_buffer.c:471:7: note: Assuming th=
e condition is true
                   if (args->in.flags & HL_CB_FLAGS_GET_DEVICE_VA)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_buffer.c:471:3: note: Taking true=
 branch
                   if (args->in.flags & HL_CB_FLAGS_GET_DEVICE_VA)
                   ^
   drivers/misc/habanalabs/common/command_buffer.c:472:24: note: Assigned v=
alue is garbage or undefined
                           args->out.device_va =3D device_va;
                                               ^ ~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/usb/gadget/legacy/dbgp.c:377:3: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/usb/gadget/legacy/dbgp.c:377:3: note: Value stored to 'err' is n=
ever read
                   err =3D 0;
                   ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/hwmon/max6621.c:135:23: warning: The result of the left shift is=
 undefined because the left operand is negative [clang-analyzer-core.Undefi=
nedBinaryOperatorResult]
           return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
                                ^
   drivers/hwmon/max6621.c:316:2: note: Control jumps to 'case hwmon_temp:'=
  at line 317
           switch (type) {
           ^
   drivers/hwmon/max6621.c:318:3: note: Control jumps to 'case hwmon_temp_o=
ffset:' @line 319
                   switch (attr) {

vim +472 drivers/misc/habanalabs/common/command_buffer.c

f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  423  =

be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  424  int hl_cb_ioctl(struct hl_fpriv *hpriv, void *data)
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  425  {
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  426  	union hl_cb_args *args =3D data;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  427  	struct hl_device *hdev =3D hpriv->hdev;
66a76401c50b26 drivers/misc/habanalabs/common/command_buffer.c Ofir Bitton =
   2020-10-05  428  	enum hl_device_status status;
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  429  	u64 handle =3D 0, device_va;
f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  430  	u32 usage_cnt =3D 0;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  431  	int rc;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  432  =

66a76401c50b26 drivers/misc/habanalabs/common/command_buffer.c Ofir Bitton =
   2020-10-05  433  	if (!hl_device_operational(hdev, &status)) {
3f5398cfbf051d drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-04-06  434  		dev_warn_ratelimited(hdev->dev,
3f5398cfbf051d drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-04-06  435  			"Device is %s. Can't execute CB IOCTL\n",
66a76401c50b26 drivers/misc/habanalabs/common/command_buffer.c Ofir Bitton =
   2020-10-05  436  			hdev->status[status]);
3f5398cfbf051d drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-04-06  437  		return -EBUSY;
3f5398cfbf051d drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-04-06  438  	}
3f5398cfbf051d drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-04-06  439  =

be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  440  	switch (args->in.op) {
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  441  	case HL_CB_OP_CREATE:
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  442  		if (args->in.cb_size > HL_MAX_CB_SIZE) {
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  443  			dev_err(hdev->dev,
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  444  				"User requested CB size %d must be less than %d\n",
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  445  				args->in.cb_size, HL_MAX_CB_SIZE);
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  446  			rc =3D -EINVAL;
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  447  		} else {
fa8641a14f2841 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-07  448  			rc =3D hl_cb_create(hdev, &hpriv->cb_mgr, hpriv->ctx,
ef6a0f6caa4a5d drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-07-09  449  					args->in.cb_size, false,
ef6a0f6caa4a5d drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-07-09  450  					!!(args->in.flags & HL_CB_FLAGS_MAP),
ef6a0f6caa4a5d drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-07-09  451  					&handle);
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  452  		}
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  453  =

be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  454  		memset(args, 0, sizeof(*args));
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  455  		args->out.cb_handle =3D handle;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  456  		break;
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  457  =

be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  458  	case HL_CB_OP_DESTROY:
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  459  		rc =3D hl_cb_destroy(hdev, &hpriv->cb_mgr,
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  460  					args->in.cb_handle);
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  461  		break;
39b425170d35ff drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2020-04-17  462  =

f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  463  	case HL_CB_OP_INFO:
f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  464  		rc =3D hl_cb_info(hdev, &hpriv->cb_mgr, args->in.cb_h=
andle,
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  465  				args->in.flags,
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  466  				&usage_cnt,
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  467  				&device_va);
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  468  =

b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  469  		memset(&args->out, 0, sizeof(args->out));
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  470  =

b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  471  		if (args->in.flags & HL_CB_FLAGS_GET_DEVICE_VA)
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02 @472  			args->out.device_va =3D device_va;
b9d31cada7d9f1 drivers/misc/habanalabs/common/command_buffer.c farah kassab=
ri 2021-11-02  473  		else
f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  474  			args->out.usage_cnt =3D usage_cnt;
f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  475  		break;
f44afb5b5a5d04 drivers/misc/habanalabs/common/command_buffer.c Tomer Tayar =
   2020-09-02  476  =

be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  477  	default:
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  478  		rc =3D -ENOTTY;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  479  		break;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  480  	}
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  481  =

be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  482  	return rc;
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  483  }
be5d926b5c1043 drivers/misc/habanalabs/command_buffer.c        Oded Gabbay =
   2019-02-16  484  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6977714386757791006==--

