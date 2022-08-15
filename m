Content-Type: multipart/mixed; boundary="===============0894111210381374616=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 1/8] drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1124: warning: expecting prototype for gpu_clk_notifier_unregister(). Prototype was for arb_gpu_clk_notifier_unregister() instead
Date: Mon, 15 Aug 2022 18:17:24 +0800
Message-ID: <202208151807.ov7PZjbA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0894111210381374616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   33e3465eab47a4bac4e110f58b67c52ddf52c2f9
commit: 0b8e9d9dd88a3b246025c2174151169f4c00b4b6 [1/8] CHROMIUM: gpu: mali:=
 Rename driver path
:::::: branch date: 73 minutes ago
:::::: commit date: 6 hours ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/2022081=
5/202208151807.ov7PZjbA-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 0b8e9d9dd88a3b246025c2174151169f4c00b4b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash drivers/gpu/arm/mali/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:23: warning: Cannot=
 understand  * @file
    on line 23 - I thought it was a doc line
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1031: warning: Func=
tion parameter or member 'arb_freq' not described in 'kbase_arbiter_pm_upda=
te_gpu_freq'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1031: warning: Func=
tion parameter or member 'freq' not described in 'kbase_arbiter_pm_update_g=
pu_freq'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1059: warning: Func=
tion parameter or member 'kbdev' not described in 'enumerate_arb_gpu_clk'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1059: warning: Func=
tion parameter or member 'index' not described in 'enumerate_arb_gpu_clk'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1074: warning: Func=
tion parameter or member 'kbdev' not described in 'get_arb_gpu_clk_rate'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1074: warning: Func=
tion parameter or member 'gpu_clk_handle' not described in 'get_arb_gpu_clk=
_rate'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1099: warning: Func=
tion parameter or member 'kbdev' not described in 'arb_gpu_clk_notifier_reg=
ister'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1099: warning: Func=
tion parameter or member 'gpu_clk_handle' not described in 'arb_gpu_clk_not=
ifier_register'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1099: warning: Func=
tion parameter or member 'nb' not described in 'arb_gpu_clk_notifier_regist=
er'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1124: warning: Func=
tion parameter or member 'kbdev' not described in 'arb_gpu_clk_notifier_unr=
egister'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1124: warning: Func=
tion parameter or member 'gpu_clk_handle' not described in 'arb_gpu_clk_not=
ifier_unregister'
   drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1124: warning: Func=
tion parameter or member 'nb' not described in 'arb_gpu_clk_notifier_unregi=
ster'
>> drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c:1124: warning: expe=
cting prototype for gpu_clk_notifier_unregister(). Prototype was for arb_gp=
u_clk_notifier_unregister() instead
--
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_common_jm.c:45: =
warning: expecting prototype for read_hwcnt(). Prototype was for kbase_ipa_=
read_hwcnt() instead
--
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:67: warning=
: expecting prototype for get_jm_counter(). Prototype was for kbase_g7x_pow=
er_model_get_jm_counter() instead
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:80: warning=
: expecting prototype for get_memsys_counter(). Prototype was for kbase_g7x=
_power_model_get_memsys_counter() instead
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:96: warning=
: expecting prototype for get_sc_counter(). Prototype was for kbase_g7x_pow=
er_model_get_sc_counter() instead
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:115: warnin=
g: expecting prototype for memsys_single_counter(). Prototype was for kbase=
_g7x_sum_all_memsys_blocks() instead
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:134: warnin=
g: expecting prototype for sum_all_shader_cores(). Prototype was for kbase_=
g7x_sum_all_shader_cores() instead
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:154: warnin=
g: expecting prototype for jm_single_counter(). Prototype was for kbase_g7x=
_jm_single_counter() instead
>> drivers/gpu/arm/mali/ipa/backend/mali_kbase_ipa_counter_jm.c:171: warnin=
g: expecting prototype for get_active_cycles(). Prototype was for kbase_g7x=
_get_active_cycles() instead
--
>> drivers/gpu/arm/mali/mali_kbase_vinstr.c:942: warning: expecting prototy=
pe for The hwcnt reader's ioctl command(). Prototype was for kbasep_vinstr_=
hwcnt_reader_ioctl_get_api_version() instead
--
>> drivers/gpu/arm/mali/mali_kbase_mem_profile_debugfs.c:27: warning: This =
comment starts with '/**', but isn't a kernel-doc comment. Refer Documentat=
ion/doc-guide/kernel-doc.rst
    * Show callback for the @c mem_profile debugfs file.
--
>> drivers/gpu/arm/mali/mali_kbase_kinstr_jm.c:674: warning: expecting prot=
otype for kbasep_kinstr_jm_release(). Prototype was for kbase_kinstr_jm_rel=
ease() instead
>> drivers/gpu/arm/mali/mali_kbase_kinstr_jm.c:747: warning: expecting prot=
otype for readers_del(). Prototype was for kbase_kinstr_jm_readers_del() in=
stead
--
>> drivers/gpu/arm/mali/mali_kbase_js_ctx_attr.c:30: warning: This comment =
starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-=
guide/kernel-doc.rst
    * Check whether a ctx has a certain attribute, and if so, retain that
   drivers/gpu/arm/mali/mali_kbase_js_ctx_attr.c:79: warning: This comment =
starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-=
guide/kernel-doc.rst
    * Check whether a ctx has a certain attribute, and if so, release that
   drivers/gpu/arm/mali/mali_kbase_js_ctx_attr.c:127: warning: This comment=
 starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc=
-guide/kernel-doc.rst
    * Retain a certain attribute on a ctx, also retaining it on the runpool
   drivers/gpu/arm/mali/mali_kbase_js_ctx_attr.c:167: warning: This comment=
 starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc=
-guide/kernel-doc.rst
    * Release a certain attribute on a ctx, also releasing it from the runp=
ool
--
>> drivers/gpu/arm/mali/mali_kbase_mem.c:23: warning: This comment starts w=
ith '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/ke=
rnel-doc.rst
    * Base kernel memory APIs
   drivers/gpu/arm/mali/mali_kbase_mem.c:353: warning: This comment starts =
with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/k=
ernel-doc.rst
    * Remove a region object from the global list.
   drivers/gpu/arm/mali/mali_kbase_mem.c:837: warning: This comment starts =
with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/k=
ernel-doc.rst
    * Determine if any allocations have been made on a context's region tra=
cker
   drivers/gpu/arm/mali/mali_kbase_mem.c:1291: warning: This comment starts=
 with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/=
kernel-doc.rst
    * Allocate a free region object.
   drivers/gpu/arm/mali/mali_kbase_mem.c:1368: warning: This comment starts=
 with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/=
kernel-doc.rst
    * Free a region object.
   drivers/gpu/arm/mali/mali_kbase_mem.c:1966: warning: This comment starts=
 with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/=
kernel-doc.rst
    * Free the region from the GPU and unregister it.
>> drivers/gpu/arm/mali/mali_kbase_mem.c:3148: warning: expecting prototype=
 for Acquire the per(). Prototype was for kbase_gpu_vm_lock() instead
>> drivers/gpu/arm/mali/mali_kbase_mem.c:3160: warning: expecting prototype=
 for Release the per(). Prototype was for kbase_gpu_vm_unlock() instead
--
>> drivers/gpu/arm/mali/tl/mali_kbase_tlstream.c:200: warning: expecting pr=
ototype for kbase_tlstream_msgbuf_submit(). Prototype was for kbasep_tlstre=
am_msgbuf_submit() instead
--
>> drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c:160: warning: expecting=
 prototype for kbasep_timeline_copy_header(). Prototype was for kbasep_time=
line_copy_headers() instead
--
>> drivers/gpu/arm/mali/backend/gpu/mali_kbase_jm_hw.c:1046: warning: expec=
ting prototype for kbase_job_check_enter_disjoint(). Prototype was for kbas=
e_job_check_leave_disjoint() instead


vim +1124 drivers/gpu/arm/mali/arbiter/mali_kbase_arbiter_pm.c

97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1111  =

97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1112  /**
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1113   * gpu_clk_notifier_unregister() - Unregister clock =
rate change notifier
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1114   * @kbdev          - kbase_device pointer
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1115   * @gpu_clk_handle - Handle unique to the enumerated=
 GPU clock
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1116   * @nb             - notifier block containing the c=
allback function pointer
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1117   *
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1118   * This function pointer is used to unregister a cal=
lback function that
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1119   * was previously registered to get notified of a fr=
equency change of the
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1120   * clock corresponding to @gpu_clk_handle.
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1121   */
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1122  static void arb_gpu_clk_notifier_unregister(struct k=
base_device *kbdev,
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1123  	void *gpu_clk_handle, struct notifier_block *nb)
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06 @1124  {
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1125  	struct kbase_arbiter_freq *arb_dev_freq =3D
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1126  		(struct kbase_arbiter_freq *)gpu_clk_handle;
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1127  	if (arb_dev_freq->nb =3D=3D nb) {
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1128  		arb_dev_freq->nb =3D NULL;
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1129  	} else {
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1130  		dev_err(kbdev->dev, "%s - notifier did not match\n=
",
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1131  			 __func__);
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1132  	}
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1133  }
97b1271a1316e9 drivers/gpu/arm/bifrost/arbiter/mali_kbase_arbiter_pm.c Fei =
Shao 2021-12-06  1134  =


:::::: The code at line 1124 was first introduced by commit
:::::: 97b1271a1316e9353e0192e8883921e859e08446 CHROMIUM: Mali: Apply Bifro=
st r32p0 EAC release

:::::: TO: Fei Shao <fshao@chromium.org>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0894111210381374616==--

