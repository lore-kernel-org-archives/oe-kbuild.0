Content-Type: multipart/mixed; boundary="===============1655735208407660527=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 317/9190] drivers/gpu/drm/i915/display/intel_psr.c:1517:30: warning: Redundant condition: intel_dp->psr.enabled. '!A || (A && B)' is equivalent to '!A || B' [redundantCondition]
Date: Fri, 09 Apr 2021 11:29:05 +0300
Message-ID: <20210409082905.GC6048@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1655735208407660527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
  master
head:   454c576c3f5e51d60f00a4ac0dde07f4f9d70e9d
commit: b64d6c51380b7dea17d5503a250ca9cc84025453 [317/9190] drm/i915/displa=
y: Support PSR Multiple Instances
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/display/intel_psr.c:1517:30: warning: Redundant con=
dition: intel_dp->psr.enabled. '!A || (A && B)' is equivalent to '!A || B' =
[redundantCondition]
     if (!intel_dp->psr.enabled ||
                                ^
   drivers/gpu/drm/i915/display/intel_psr.c:362:11: warning: Same expressio=
n on both sides of '-'. [duplicateExpression]
     [3] =3D 1 - 1,
             ^

vim +1517 drivers/gpu/drm/i915/display/intel_psr.c

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1503  void intel_psr_wait_for_idle(const struct intel_crtc_state *=
new_crtc_state)
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1504  {
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1505  	struct drm_i915_private *dev_priv =3D to_i915(new_crtc_stat=
e->uapi.crtc->dev);
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1506  	struct intel_encoder *encoder;
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1507  =

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1508  	if (!new_crtc_state->has_psr)
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1509  		return;
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1510  =

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1511  	for_each_intel_encoder_mask_can_psr(&dev_priv->drm, encoder,
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1512  					    new_crtc_state->uapi.encoder_mask) {
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1513  		struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1514  		u32 psr_status;
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1515  =

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1516  		mutex_lock(&intel_dp->psr.lock);
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04 @1517  		if (!intel_dp->psr.enabled ||
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1518  		    (intel_dp->psr.enabled && intel_dp->psr.psr2_enabled))=
 {
                                                                           =
                                  ^^^^^^^^^^^^^^^^^^^^^
More clear to write:

	if (!intel_dp->psr.enabled || intel_dp->psr.psr2_enabled) {
		mutex_unlock(&intel_dp->psr.lock);
		continue;
	}

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1519  			mutex_unlock(&intel_dp->psr.lock);
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1520  			continue;
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1521  		}
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1522  =

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1523  		/* when the PSR1 is enabled */
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1524  		if (psr_wait_for_idle(intel_dp, &psr_status))
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1525  			drm_err(&dev_priv->drm,
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1526  				"PSR idle timed out 0x%x, atomic update may fail\n",
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1527  				psr_status);
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1528  		mutex_unlock(&intel_dp->psr.lock);
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1529  	}
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun 202=
1-02-04  1530  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============1655735208407660527==--

