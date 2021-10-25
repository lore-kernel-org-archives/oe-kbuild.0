Content-Type: multipart/mixed; boundary="===============8748603755484162906=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_dp.c:4053:10: warning: Suspicious condition (assignment + comparison); Clarify expression with parentheses. [clarifyCondition]
Date: Tue, 26 Oct 2021 07:48:19 +0800
Message-ID: <202110260758.TkXh4QGO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8748603755484162906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3906fe9bb7f1a2c8667ae54e967dc8690824f4ea
commit: ced42f2df5fd8621c896faeafe7ecc0ea8b2ea81 drm/i915: Add support for =
starting FRL training for HDMI2.1 via PCON
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/display/intel_dp.c:4053:10: warning: Suspicious con=
dition (assignment + comparison); Clarify expression with parentheses. [cla=
rifyCondition]
    wait_for(is_active =3D drm_dp_pcon_is_frl_ready(&intel_dp->aux) =3D=3D =
true, TIMEOUT_FRL_READY_MS);
            ^
   drivers/gpu/drm/i915/display/intel_dp.c:4072:10: warning: Suspicious con=
dition (assignment + comparison); Clarify expression with parentheses. [cla=
rifyCondition]
    wait_for(is_active =3D drm_dp_pcon_hdmi_link_active(&intel_dp->aux) =3D=
=3D true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
            ^

vim +4053 drivers/gpu/drm/i915/display/intel_dp.c

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4028  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4029  	struct drm_i915_private *i=
915 =3D dp_to_i915(intel_dp);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4030  	int max_frl_bw, max_pcon_f=
rl_bw, max_edid_frl_bw, ret;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4031  	u8 max_frl_bw_mask =3D 0, =
frl_trained_mask;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4032  	bool is_active;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4033  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4034  	ret =3D drm_dp_pcon_reset_=
frl_config(&intel_dp->aux);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4035  	if (ret < 0)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4036  		return ret;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4037  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4038  	max_pcon_frl_bw =3D intel_=
dp->dfp.pcon_max_frl_bw;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4039  	drm_dbg(&i915->drm, "PCON =
max rate =3D %d Gbps\n", max_pcon_frl_bw);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4040  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4041  	max_edid_frl_bw =3D intel_=
dp_hdmi_sink_max_frl(intel_dp);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4042  	drm_dbg(&i915->drm, "Sink =
max rate from EDID =3D %d Gbps\n", max_edid_frl_bw);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4043  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4044  	max_frl_bw =3D min(max_edi=
d_frl_bw, max_pcon_frl_bw);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4045  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4046  	if (max_frl_bw <=3D 0)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4047  		return -EINVAL;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4048  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4049  	ret =3D drm_dp_pcon_frl_pr=
epare(&intel_dp->aux, false);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4050  	if (ret < 0)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4051  		return ret;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4052  	/* Wait for PCON to be FRL=
 Ready */
ced42f2df5fd86 Ankit Nautiyal 2020-12-18 @4053  	wait_for(is_active =3D drm=
_dp_pcon_is_frl_ready(&intel_dp->aux) =3D=3D true, TIMEOUT_FRL_READY_MS);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4054  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4055  	if (!is_active)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4056  		return -ETIMEDOUT;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4057  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4058  	max_frl_bw_mask =3D intel_=
dp_pcon_set_frl_mask(max_frl_bw);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4059  	ret =3D drm_dp_pcon_frl_co=
nfigure_1(&intel_dp->aux, max_frl_bw, PCON_SEQUENTIAL_MODE);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4060  	if (ret < 0)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4061  		return ret;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4062  	ret =3D drm_dp_pcon_frl_co=
nfigure_2(&intel_dp->aux, max_frl_bw_mask, PCON_NORMAL_TRAIN_MODE);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4063  	if (ret < 0)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4064  		return ret;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4065  	ret =3D drm_dp_pcon_frl_en=
able(&intel_dp->aux);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4066  	if (ret < 0)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4067  		return ret;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4068  	/*
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4069  	 * Wait for FRL to be comp=
leted
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4070  	 * Check if the HDMI Link =
is up and active.
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4071  	 */
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4072  	wait_for(is_active =3D drm=
_dp_pcon_hdmi_link_active(&intel_dp->aux) =3D=3D true, TIMEOUT_HDMI_LINK_AC=
TIVE_MS);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4073  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4074  	if (!is_active)
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4075  		return -ETIMEDOUT;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4076  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4077  	/* Verify HDMI Link config=
uration shows FRL Mode */
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4078  	if (drm_dp_pcon_hdmi_link_=
mode(&intel_dp->aux, &frl_trained_mask) !=3D
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4079  	    DP_PCON_HDMI_MODE_FRL)=
 {
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4080  		drm_dbg(&i915->drm, "HDMI=
 couldn't be trained in FRL Mode\n");
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4081  		return -EINVAL;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4082  	}
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4083  	drm_dbg(&i915->drm, "MAX_F=
RL_MASK =3D %u, FRL_TRAINED_MASK =3D %u\n", max_frl_bw_mask, frl_trained_ma=
sk);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4084  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4085  	intel_dp->frl.trained_rate=
_gbps =3D intel_dp_pcon_get_frl_mask(frl_trained_mask);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4086  	intel_dp->frl.is_trained =
=3D true;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4087  	drm_dbg(&i915->drm, "FRL t=
rained with : %d Gbps\n", intel_dp->frl.trained_rate_gbps);
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4088  =

ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4089  	return 0;
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4090  }
ced42f2df5fd86 Ankit Nautiyal 2020-12-18  4091  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8748603755484162906==--

