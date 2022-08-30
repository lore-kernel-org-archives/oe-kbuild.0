Content-Type: multipart/mixed; boundary="===============8683091478284628456=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-intel:for-linux-next-gt 1/1] drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:497 intel_guc_slpc_set_min_freq() warn: inconsistent returns '&slpc->lock'.
Date: Tue, 30 Aug 2022 19:48:28 +0800
Message-ID: <202208301957.uLAOt2oy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8683091478284628456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: intel-gfx(a)lists.freedesktop.org
CC: dri-devel(a)lists.freedesktop.org
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   f54e515c91806288126f64b37da0c78baa2d8c1f
commit: 95ccf312a1e4f5a1150dd1a0a2d81c1043e33fb6 [1/1] drm/i915/guc/slpc: A=
llow SLPC to use efficient frequency
:::::: branch date: 24 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021-20220829 (https://download.01.org/0day-ci/arch=
ive/20220830/202208301957.uLAOt2oy-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:497 intel_guc_slpc_set_min_freq=
() warn: inconsistent returns '&slpc->lock'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:414 intel_guc_slpc_set_max_freq=
() error: uninitialized symbol 'ret'.
drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:492 intel_guc_slpc_set_min_freq=
() error: uninitialized symbol 'ret'.

vim +497 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c

c279bec18e9773 Vinay Belgaumkar 2021-07-30  446  =

d41f6f82d319ca Vinay Belgaumkar 2021-07-30  447  /**
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  448   * intel_guc_slpc_set_min_=
freq() - Set min frequency limit for SLPC.
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  449   * @slpc: pointer to intel=
_guc_slpc.
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  450   * @val: frequency (MHz)
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  451   *
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  452   * This function will invo=
ke GuC SLPC action to update the min unslice
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  453   * frequency.
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  454   *
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  455   * Return: 0 on success, n=
on-zero error code on failure.
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  456   */
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  457  int intel_guc_slpc_set_min=
_freq(struct intel_guc_slpc *slpc, u32 val)
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  458  {
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  459  	struct drm_i915_private *=
i915 =3D slpc_to_i915(slpc);
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  460  	intel_wakeref_t wakeref;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  461  	int ret;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  462  =

025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  463  	if (val < slpc->min_freq =
||
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  464  	    val > slpc->rp0_freq =
||
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  465  	    val > slpc->max_freq_=
softlimit)
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  466  		return -EINVAL;
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  467  =

493043feed006f Vinay Belgaumkar 2021-11-01  468  	/* Need a lock now since =
waitboost can be modifying min as well */
493043feed006f Vinay Belgaumkar 2021-11-01  469  	mutex_lock(&slpc->lock);
493043feed006f Vinay Belgaumkar 2021-11-01  470  =

d41f6f82d319ca Vinay Belgaumkar 2021-07-30  471  	with_intel_runtime_pm(&i9=
15->runtime_pm, wakeref) {
493043feed006f Vinay Belgaumkar 2021-11-01  472  =

95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  473  		/* Ignore efficient freq=
 if lower min freq is requested */
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  474  		ret =3D slpc_set_param(s=
lpc,
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  475  				     SLPC_PARAM_IGNORE=
_EFFICIENT_FREQUENCY,
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  476  				     val < slpc->rp1_f=
req);
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  477  		if (unlikely(ret)) {
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  478  			i915_probe_error(i915, =
"Failed to toggle efficient freq (%pe)\n",
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  479  					 ERR_PTR(ret));
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  480  			return ret;
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  481  		}
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  482  =

d41f6f82d319ca Vinay Belgaumkar 2021-07-30  483  		ret =3D slpc_set_param(s=
lpc,
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  484  				     SLPC_PARAM_GLOBAL=
_MIN_GT_UNSLICE_FREQ_MHZ,
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  485  				     val);
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  486  =

d41f6f82d319ca Vinay Belgaumkar 2021-07-30  487  		/* Return standardized e=
rr code for sysfs calls */
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  488  		if (ret)
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  489  			ret =3D -EIO;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  490  	}
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  491  =

025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  492  	if (!ret)
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  493  		slpc->min_freq_softlimit=
 =3D val;
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  494  =

493043feed006f Vinay Belgaumkar 2021-11-01  495  	mutex_unlock(&slpc->lock);
493043feed006f Vinay Belgaumkar 2021-11-01  496  =

d41f6f82d319ca Vinay Belgaumkar 2021-07-30 @497  	return ret;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  498  }
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  499  =


:::::: The code at line 497 was first introduced by commit
:::::: d41f6f82d319ca0effae840553cac74425328ddf drm/i915/guc/slpc: Add meth=
ods to set min/max frequency

:::::: TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
:::::: CC: John Harrison <John.C.Harrison@Intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8683091478284628456==--

