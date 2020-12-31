Content-Type: multipart/mixed; boundary="===============4197425549822953959=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-intel:topic/dp-hdmi-2.1-pcon 9/15] drivers/gpu/drm/i915/display/intel_dp.c:4053:10: warning: Suspicious condition (assignment + comparison); Clarify expression with parentheses.
Date: Thu, 31 Dec 2020 17:22:50 +0800
Message-ID: <202012311740.N5rrCfHz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4197425549822953959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: intel-gfx(a)lists.freedesktop.org
CC: dri-devel(a)lists.freedesktop.org
TO: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

tree:   git://anongit.freedesktop.org/drm-intel topic/dp-hdmi-2.1-pcon
head:   522508b665df3bbfdf40381d4e61777844b1703f
commit: ced42f2df5fd8621c896faeafe7ecc0ea8b2ea81 [9/15] drm/i915: Add suppo=
rt for starting FRL training for HDMI2.1 via PCON
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

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

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4028  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4029  	struct drm_i915_private =
*i915 =3D dp_to_i915(intel_dp);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4030  	int max_frl_bw, max_pcon=
_frl_bw, max_edid_frl_bw, ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4031  	u8 max_frl_bw_mask =3D 0=
, frl_trained_mask;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4032  	bool is_active;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4033  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4034  	ret =3D drm_dp_pcon_rese=
t_frl_config(&intel_dp->aux);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4035  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4036  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4037  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4038  	max_pcon_frl_bw =3D inte=
l_dp->dfp.pcon_max_frl_bw;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4039  	drm_dbg(&i915->drm, "PCO=
N max rate =3D %d Gbps\n", max_pcon_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4040  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4041  	max_edid_frl_bw =3D inte=
l_dp_hdmi_sink_max_frl(intel_dp);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4042  	drm_dbg(&i915->drm, "Sin=
k max rate from EDID =3D %d Gbps\n", max_edid_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4043  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4044  	max_frl_bw =3D min(max_e=
did_frl_bw, max_pcon_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4045  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4046  	if (max_frl_bw <=3D 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4047  		return -EINVAL;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4048  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4049  	ret =3D drm_dp_pcon_frl_=
prepare(&intel_dp->aux, false);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4050  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4051  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4052  	/* Wait for PCON to be F=
RL Ready */
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18 @4053  	wait_for(is_active =3D d=
rm_dp_pcon_is_frl_ready(&intel_dp->aux) =3D=3D true, TIMEOUT_FRL_READY_MS);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4054  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4055  	if (!is_active)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4056  		return -ETIMEDOUT;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4057  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4058  	max_frl_bw_mask =3D inte=
l_dp_pcon_set_frl_mask(max_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4059  	ret =3D drm_dp_pcon_frl_=
configure_1(&intel_dp->aux, max_frl_bw, PCON_SEQUENTIAL_MODE);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4060  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4061  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4062  	ret =3D drm_dp_pcon_frl_=
configure_2(&intel_dp->aux, max_frl_bw_mask, PCON_NORMAL_TRAIN_MODE);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4063  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4064  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4065  	ret =3D drm_dp_pcon_frl_=
enable(&intel_dp->aux);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4066  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4067  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4068  	/*
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4069  	 * Wait for FRL to be co=
mpleted
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4070  	 * Check if the HDMI Lin=
k is up and active.
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4071  	 */
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4072  	wait_for(is_active =3D d=
rm_dp_pcon_hdmi_link_active(&intel_dp->aux) =3D=3D true, TIMEOUT_HDMI_LINK_=
ACTIVE_MS);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4073  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4074  	if (!is_active)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4075  		return -ETIMEDOUT;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4076  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4077  	/* Verify HDMI Link conf=
iguration shows FRL Mode */
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4078  	if (drm_dp_pcon_hdmi_lin=
k_mode(&intel_dp->aux, &frl_trained_mask) !=3D
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4079  	    DP_PCON_HDMI_MODE_FR=
L) {
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4080  		drm_dbg(&i915->drm, "HD=
MI couldn't be trained in FRL Mode\n");
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4081  		return -EINVAL;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4082  	}
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4083  	drm_dbg(&i915->drm, "MAX=
_FRL_MASK =3D %u, FRL_TRAINED_MASK =3D %u\n", max_frl_bw_mask, frl_trained_=
mask);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4084  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4085  	intel_dp->frl.trained_ra=
te_gbps =3D intel_dp_pcon_get_frl_mask(frl_trained_mask);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4086  	intel_dp->frl.is_trained=
 =3D true;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4087  	drm_dbg(&i915->drm, "FRL=
 trained with : %d Gbps\n", intel_dp->frl.trained_rate_gbps);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4088  =

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4089  	return 0;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4090  }
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4091  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4197425549822953959==--

