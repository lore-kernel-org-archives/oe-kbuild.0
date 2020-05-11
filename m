Content-Type: multipart/mixed; boundary="===============7590396588407109346=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-4.4 4/4] drivers/gpu/drm/i915/i915_guc_submission.c:1109 intel_guc_resume() warn: ignoring unreachable code.
Date: Tue, 12 May 2020 07:22:13 +0800
Message-ID: <202005120708.ujQJ6wUy%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7590396588407109346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.4
head:   facf9b5fa586b01b72c4616da261566b9089593b
commit: facf9b5fa586b01b72c4616da261566b9089593b [4/4] CHROMIUM: drm/i915/g=
uc: Init GuC completely even if submission disabled
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/i915_guc_submission.c:1109 intel_guc_resume() warn: ig=
noring unreachable code.

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout facf9b5fa586b01b72c4616da261566b9089593b
vim +1109 drivers/gpu/drm/i915/i915_guc_submission.c

a1c4199414539d Alex Dai          2015-09-30  1090  =

a1c4199414539d Alex Dai          2015-09-30  1091  =

a1c4199414539d Alex Dai          2015-09-30  1092  /**
a1c4199414539d Alex Dai          2015-09-30  1093   * intel_guc_resume() - =
notify GuC resuming from suspend state
194e83e951e8f7 Tvrtko Ursulin    2016-12-01  1094   * @dev_priv:	i915 devic=
e private
a1c4199414539d Alex Dai          2015-09-30  1095   */
194e83e951e8f7 Tvrtko Ursulin    2016-12-01  1096  int intel_guc_resume(str=
uct drm_i915_private *dev_priv)
a1c4199414539d Alex Dai          2015-09-30  1097  {
a1c4199414539d Alex Dai          2015-09-30  1098  	struct intel_guc *guc =
=3D &dev_priv->guc;
36f917dd0596b2 Chris Wilson      2016-05-24  1099  	struct i915_gem_context=
 *ctx;
a1c4199414539d Alex Dai          2015-09-30  1100  	u32 data[3];
a1c4199414539d Alex Dai          2015-09-30  1101  =

facf9b5fa586b0 Eugene Nemkov     2019-10-09  1102  	/*
facf9b5fa586b0 Eugene Nemkov     2019-10-09  1103  	 * http://crbug.com/965=
320
facf9b5fa586b0 Eugene Nemkov     2019-10-09  1104  	 * Do not wake GuC: we =
don't need it after startup.
facf9b5fa586b0 Eugene Nemkov     2019-10-09  1105  	 * Otherwise it consume=
s ~0.1W after GPU D3->D0 transition.
facf9b5fa586b0 Eugene Nemkov     2019-10-09  1106  	 */
a1c4199414539d Alex Dai          2015-09-30  1107  	return 0;
a1c4199414539d Alex Dai          2015-09-30  1108  =

4afb65d8e534a8 Sagar Arun Kamble 2016-10-12 @1109  	if (i915.guc_log_level =
>=3D 0)
4afb65d8e534a8 Sagar Arun Kamble 2016-10-12  1110  		gen9_enable_guc_interr=
upts(dev_priv);
4afb65d8e534a8 Sagar Arun Kamble 2016-10-12  1111  =

5b90ebb3a95244 Dave Gordon       2016-01-19  1112  	ctx =3D dev_priv->kerne=
l_context;
a1c4199414539d Alex Dai          2015-09-30  1113  =

2572d1111c5594 Arkadiusz Hiler   2016-11-25  1114  	data[0] =3D INTEL_GUC_A=
CTION_EXIT_S_STATE;
a1c4199414539d Alex Dai          2015-09-30  1115  	data[1] =3D GUC_POWER_D=
0;
a1c4199414539d Alex Dai          2015-09-30  1116  	/* first page is shared=
 data with GuC */
4ae491d33f9aae Chris Wilson      2016-12-24  1117  	data[2] =3D guc_ggtt_of=
fset(ctx->engine[RCS].state);
a1c4199414539d Alex Dai          2015-09-30  1118  =

772c08e8204060 Arkadiusz Hiler   2016-11-25  1119  	return intel_guc_send(g=
uc, data, ARRAY_SIZE(data));
a1c4199414539d Alex Dai          2015-09-30  1120  }
e4af452877e835 Sagar Arun Kamble 2016-10-12  1121  =


:::::: The code at line 1109 was first introduced by commit
:::::: 4afb65d8e534a87d0f65672354f7b777d08d8679 BACKPORT: drm/i915: Support=
 for GuC interrupts

:::::: TO: Sagar Arun Kamble <sagar.a.kamble@intel.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7590396588407109346==--

