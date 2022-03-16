Content-Type: multipart/mixed; boundary="===============4946363025370833798=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5697/13209] drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4330:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 17 Mar 2022 07:35:11 +0800
Message-ID: <202203170721.SzIPp2pB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4946363025370833798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hersen Wu <hersenwu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jerry Zuo <Jerry.Zuo@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
commit: fa39f936dbb96626d3345fd8d66af6be6f47ff9e [5697/13209] drm/amd/displ=
ay: add dsc mst stream pbn log for debug
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220317/202203170721.SzIPp2pB-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dfa39f936dbb96626d3345fd8d66af6be6f47ff9e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fa39f936dbb96626d3345fd8d66af6be6f47ff9e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:245:2: note: Taking false branch
           if (r =3D=3D NCI_STATUS_OK) {
           ^
   net/nfc/nci/hci.c:255:2: note: Returning without writing to '*'
           return r;
           ^
   net/nfc/nci/hci.c:531:12: note: Returning from 'nci_hci_send_cmd'
           *result =3D nci_hci_send_cmd(ndev, NCI_HCI_ADMIN_GATE,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:534:6: note: Assuming the condition is false
           if (*result < 0)
               ^~~~~~~~~~~
   net/nfc/nci/hci.c:534:2: note: Taking false branch
           if (*result < 0)
           ^
   net/nfc/nci/hci.c:537:44: note: Access to field 'data' results in a dere=
ference of an undefined pointer value (loaded from variable 'skb')
           resp =3D (struct nci_hci_create_pipe_resp *)skb->data;
                                                     ^~~
   net/nfc/nci/hci.c:742:6: warning: Access to field 'len' results in a der=
eference of an undefined pointer value (loaded from variable 'skb') [clang-=
analyzer-core.NullDereference]
           if (skb->len &&
               ^~~
   net/nfc/nci/hci.c:712:2: note: 'skb' declared without an initial value
           struct sk_buff *skb;
           ^~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:719:6: note: Assuming 'conn_info' is non-null
           if (!conn_info)
               ^~~~~~~~~~
   net/nfc/nci/hci.c:719:2: note: Taking false branch
           if (!conn_info)
           ^
   net/nfc/nci/hci.c:727:6: note: Assuming field 'gate' is equal to NCI_HCI=
_ADMIN_GATE
           if (ndev->hci_dev->init_data.gates[0].gate !=3D NCI_HCI_ADMIN_GA=
TE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:727:2: note: Taking false branch
           if (ndev->hci_dev->init_data.gates[0].gate !=3D NCI_HCI_ADMIN_GA=
TE)
           ^
   net/nfc/nci/hci.c:734:6: note: 'r' is >=3D 0
           if (r < 0)
               ^
   net/nfc/nci/hci.c:734:2: note: Taking false branch
           if (r < 0)
           ^
   net/nfc/nci/hci.c:737:6: note: Calling 'nci_hci_get_param'
           r =3D nci_hci_get_param(ndev, NCI_HCI_ADMIN_GATE,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:608:2: note: Taking false branch
           pr_debug("idx=3D%d to gate %d\n", idx, gate);
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/nfc/nci/hci.c:610:6: note: Assuming 'pipe' is not equal to NCI_HCI_I=
NVALID_PIPE
           if (pipe =3D=3D NCI_HCI_INVALID_PIPE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:610:2: note: Taking false branch
           if (pipe =3D=3D NCI_HCI_INVALID_PIPE)
           ^
   net/nfc/nci/hci.c:614:6: note: Assuming 'conn_info' is non-null
           if (!conn_info)
               ^~~~~~~~~~
   net/nfc/nci/hci.c:614:2: note: Taking false branch
           if (!conn_info)
           ^
   net/nfc/nci/hci.c:627:6: note: Assuming 'r' is not equal to NCI_STATUS_OK
           if (r =3D=3D NCI_STATUS_OK) {
               ^~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:627:2: note: Taking false branch
           if (r =3D=3D NCI_STATUS_OK) {
           ^
   net/nfc/nci/hci.c:637:2: note: Returning without writing to '*'
           return r;
           ^
   net/nfc/nci/hci.c:737:6: note: Returning from 'nci_hci_get_param'
           r =3D nci_hci_get_param(ndev, NCI_HCI_ADMIN_GATE,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:739:6: note: Assuming 'r' is >=3D 0
           if (r < 0)
               ^~~~~
   net/nfc/nci/hci.c:739:2: note: Taking false branch
           if (r < 0)
           ^
   net/nfc/nci/hci.c:742:6: note: Access to field 'len' results in a derefe=
rence of an undefined pointer value (loaded from variable 'skb')
           if (skb->len &&
               ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3721:2: warning:=
 Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D dm_helpers_dp_mst_poll_for_allocation_change_trigger(
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3721:2: note: Va=
lue stored to 'ret' is never read
           ret =3D dm_helpers_dp_mst_poll_for_allocation_change_trigger(
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4330:7: warning:=
 Dereference of null pointer [clang-analyzer-core.NullDereference]
           if (!pipe_ctx->stream->sink->edid_caps.panel_patch.skip_avmute) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4312:6: note: As=
suming the condition is false
           if (is_dp_128b_132b_signal(pipe_ctx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4312:2: note: Ta=
king false branch
           if (is_dp_128b_132b_signal(pipe_ctx))
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4317:6: note: As=
suming field 'sink' is null
           if (pipe_ctx->stream->sink) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4317:2: note: Ta=
king false branch
           if (pipe_ctx->stream->sink) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4326:18: note: A=
ssuming field 'dce_environment' is equal to DCE_ENV_FPGA_MAXIMUS
           if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:76:22: note: expande=
d from macro 'IS_DIAG_DC'
           (IS_FPGA_MAXIMUS_DC(dce_environment) || (dce_environment =3D=3D =
DCE_ENV_DIAG))
            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:73:3: note: expanded=
 from macro 'IS_FPGA_MAXIMUS_DC'
           (dce_environment =3D=3D DCE_ENV_FPGA_MAXIMUS)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4326:7: note: Le=
ft side of '||' is true
           if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:76:39: note: expande=
d from macro 'IS_DIAG_DC'
           (IS_FPGA_MAXIMUS_DC(dce_environment) || (dce_environment =3D=3D =
DCE_ENV_DIAG))
                                                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4326:44: note: L=
eft side of '&&' is false
           if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
                                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4330:7: note: De=
reference of null pointer
           if (!pipe_ctx->stream->sink->edid_caps.panel_patch.skip_avmute) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (9 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:528:22: warni=
ng: The result of the left shift is undefined because the left operand is n=
egative [clang-analyzer-core.UndefinedBinaryOperatorResult]
           arg.value &=3D (~0LL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - =
frac_bits);
                               ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2343:6: note=
: Assuming 'new_ctx' is non-null
           if (!new_ctx)
               ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2343:2: note=
: Taking false branch
           if (!new_ctx)
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2346:6: note=
: Assuming field 'validate_global' is null
           if (dc->res_pool->funcs->validate_global) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2346:2: note=
: Taking false branch
           if (dc->res_pool->funcs->validate_global) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2352:14: not=
e: Assuming 'i' is >=3D field 'stream_count'
           for (i =3D 0; i < new_ctx->stream_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2352:2: note=
: Loop condition is false. Execution continues on line 2390
           for (i =3D 0; i < new_ctx->stream_count; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2390:11: not=
e: Calling 'resource_build_scaling_params_for_context'
           result =3D resource_build_scaling_params_for_context(dc, new_ctx=
);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1212:2: note=
: Loop condition is true.  Entering loop body
           for (i =3D 0; i < MAX_PIPES; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1213:7: note=
: Assuming field 'plane_state' is not equal to NULL
                   if (context->res_ctx.pipe_ctx[i].plane_state !=3D NULL &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1213:7: note=
: Left side of '&&' is true
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1214:5: note=
: Assuming field 'stream' is not equal to NULL
                                   context->res_ctx.pipe_ctx[i].stream !=3D=
 NULL)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1213:3: note=
: Taking true branch
                   if (context->res_ctx.pipe_ctx[i].plane_state !=3D NULL &&
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1215:9: note=
: Calling 'resource_build_scaling_params'
                           if (!resource_build_scaling_params(&context->res=
_ctx.pipe_ctx[i]))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1079:6: note=
: Assuming field 'next_odm_pipe' is null
           if (pipe_ctx->next_odm_pipe || pipe_ctx->prev_odm_pipe)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1079:6: note=
: Left side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1079:33: not=
e: Assuming field 'prev_odm_pipe' is null
           if (pipe_ctx->next_odm_pipe || pipe_ctx->prev_odm_pipe)
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1079:2: note=
: Taking false branch
           if (pipe_ctx->next_odm_pipe || pipe_ctx->prev_odm_pipe)
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1085:2: note=
: Calling 'calculate_scaling_ratios'
           calculate_scaling_ratios(pipe_ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:854:6: note:=
 Assuming field 'rotation' is not equal to ROTATION_ANGLE_90
           if (pipe_ctx->plane_state->rotation =3D=3D ROTATION_ANGLE_90 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:854:6: note:=
 Left side of '||' is false
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:855:4: note:=
 Assuming field 'rotation' is not equal to ROTATION_ANGLE_270
                           pipe_ctx->plane_state->rotation =3D=3D ROTATION_=
ANGLE_270)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:854:2: note:=
 Taking false branch
           if (pipe_ctx->plane_state->rotation =3D=3D ROTATION_ANGLE_90 ||

vim +4330 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c

4562236b3bc0a28 Harry Wentland     2017-09-12  4304  =

574304041bb9508 Su Sung Chung      2019-07-25  4305  void core_link_disable=
_stream(struct pipe_ctx *pipe_ctx)
4562236b3bc0a28 Harry Wentland     2017-09-12  4306  {
2b77dcc5e5aa382 Anthony Koo        2019-11-05  4307  	struct dc  *dc =3D pi=
pe_ctx->stream->ctx->dc;
ab0cb022c8fd6f4 Paul Hsieh         2019-03-18  4308  	struct dc_stream_stat=
e *stream =3D pipe_ctx->stream;
052fa7e8c9a92e3 Charlene Liu       2019-04-23  4309  	struct dc_link *link =
=3D stream->sink->link;
18b4f1a022951df Michael Strauss    2021-08-23  4310  	struct vpg *vpg =3D p=
ipe_ctx->stream_res.stream_enc->vpg;
b0d8889006037a7 Wenjing Liu        2021-09-13  4311  =

b0d8889006037a7 Wenjing Liu        2021-09-13  4312  	if (is_dp_128b_132b_s=
ignal(pipe_ctx))
b0d8889006037a7 Wenjing Liu        2021-09-13  4313  		vpg =3D pipe_ctx->st=
ream_res.hpo_dp_stream_enc->vpg;
4562236b3bc0a28 Harry Wentland     2017-09-12  4314  =

fa39f936dbb9662 Hersen Wu          2022-02-06  4315  	DC_LOGGER_INIT(pipe_c=
tx->stream->ctx->logger);
fa39f936dbb9662 Hersen Wu          2022-02-06  4316  =

fa39f936dbb9662 Hersen Wu          2022-02-06  4317  	if (pipe_ctx->stream-=
>sink) {
fa39f936dbb9662 Hersen Wu          2022-02-06  4318  		if (pipe_ctx->stream=
->sink->sink_signal !=3D SIGNAL_TYPE_VIRTUAL &&
fa39f936dbb9662 Hersen Wu          2022-02-06  4319  			pipe_ctx->stream->s=
ink->sink_signal !=3D SIGNAL_TYPE_NONE) {
fa39f936dbb9662 Hersen Wu          2022-02-06  4320  			DC_LOG_DC("%s pipe_=
ctx dispname=3D%s signal=3D%x\n", __func__,
fa39f936dbb9662 Hersen Wu          2022-02-06  4321  			pipe_ctx->stream->s=
ink->edid_caps.display_name,
fa39f936dbb9662 Hersen Wu          2022-02-06  4322  			pipe_ctx->stream->s=
ignal);
fa39f936dbb9662 Hersen Wu          2022-02-06  4323  		}
fa39f936dbb9662 Hersen Wu          2022-02-06  4324  	}
fa39f936dbb9662 Hersen Wu          2022-02-06  4325  =

39063de95cfb1d5 Dmytro Laktyushkin 2020-04-02  4326  	if (!IS_DIAG_DC(dc->c=
tx->dce_environment) &&
ef5a7d266e828e4 Wenjing Liu        2019-09-03  4327  			dc_is_virtual_signa=
l(pipe_ctx->stream->signal))
ef5a7d266e828e4 Wenjing Liu        2019-09-03  4328  		return;
ef5a7d266e828e4 Wenjing Liu        2019-09-03  4329  =

74d021b5631f0b6 Brandon Syu        2020-10-06 @4330  	if (!pipe_ctx->stream=
->sink->edid_caps.panel_patch.skip_avmute) {
74d021b5631f0b6 Brandon Syu        2020-10-06  4331  		if (dc_is_hdmi_signa=
l(pipe_ctx->stream->signal))
4cf7c42739ccafc Jinze Xu           2020-05-07  4332  			core_link_set_avmut=
e(pipe_ctx, true);
4cf7c42739ccafc Jinze Xu           2020-05-07  4333  	}
4cf7c42739ccafc Jinze Xu           2020-05-07  4334  =

c0794a3b5999d61 Roy Chan           2020-11-24  4335  	dc->hwss.disable_audi=
o_stream(pipe_ctx);
c0794a3b5999d61 Roy Chan           2020-11-24  4336  =


:::::: The code at line 4330 was first introduced by commit
:::::: 74d021b5631f0b657549cd76cbc7bff693cee35d drm/amd/display: skip avmut=
e action

:::::: TO: Brandon Syu <Brandon.Syu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4946363025370833798==--

