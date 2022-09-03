Content-Type: multipart/mixed; boundary="===============8424427349401989977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:636 media_freq_factor_show() error: uninitialized symbol 'mode'.
Date: Sat, 03 Sep 2022 12:07:20 +0800
Message-ID: <202209031128.I7cMZf8L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8424427349401989977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: Dale B Stimson <dale.b.stimson@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: 26be7cd8aacdd3f0429834e78e3166286779f083 drm/i915/gt: Add media fre=
q factor to per-gt sysfs
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20220829 (https://download.01.org/0day-ci/arch=
ive/20220903/202209031128.I7cMZf8L-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:636 media_freq_factor_show() er=
ror: uninitialized symbol 'mode'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:46 sysfs_gt_attribute_w_func() =
error: uninitialized symbol 'ret'.

vim +/mode +636 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c

26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  612  =

26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  613  static ssize_t media_freq_f=
actor_show(struct device *dev,
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  614  				      struct device_att=
ribute *attr,
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  615  				      char *buff)
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  616  {
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  617  	struct intel_gt *gt =3D in=
tel_gt_sysfs_get_drvdata(dev, attr->attr.name);
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  618  	struct intel_guc_slpc *slp=
c =3D &gt->uc.guc.slpc;
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  619  	intel_wakeref_t wakeref;
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  620  	u32 mode;
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  621  =

26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  622  	/*
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  623  	 * Retrieve media_ratio_mo=
de from GEN6_RPNSWREQ bit 13 set by
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  624  	 * GuC. GEN6_RPNSWREQ:13 v=
alue 0 represents 1:2 and 1 represents 1:1
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  625  	 */
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  626  	if (IS_XEHPSDV(gt->i915) &&
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  627  	    slpc->media_ratio_mode=
 =3D=3D SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL) {
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  628  		/*
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  629  		 * For XEHPSDV dynamic mo=
de GEN6_RPNSWREQ:13 does not contain
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  630  		 * the media_ratio_mode, =
just return the cached media ratio
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  631  		 */
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  632  		mode =3D slpc->media_rati=
o_mode;
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  633  	} else {
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  634  		with_intel_runtime_pm(gt-=
>uncore->rpm, wakeref)
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  635  			mode =3D intel_uncore_re=
ad(gt->uncore, GEN6_RPNSWREQ);
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25 @636  		mode =3D REG_FIELD_GET(GE=
N12_MEDIA_FREQ_RATIO, mode) ?
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  637  			SLPC_MEDIA_RATIO_MODE_FI=
XED_ONE_TO_ONE :
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  638  			SLPC_MEDIA_RATIO_MODE_FI=
XED_ONE_TO_TWO;
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  639  	}
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  640  =

26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  641  	return sysfs_emit(buff, "%=
u\n", media_ratio_mode_to_factor(mode));
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  642  }
26be7cd8aacdd3f Ashutosh Dixit 2022-05-25  643  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8424427349401989977==--

