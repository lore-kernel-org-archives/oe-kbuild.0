Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B194457D0
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309966; cv=none; b=VfR/v3sqHu1rTh6hy4f8/Npft32+cxzvZhpAjgB91hZs0Pk2gZYvVxcHYYCZC4cL+z4Bmr+S3MT/qbaKWptumMot2F5cOTbDKcjCoxuFSyHplh6yQNpF0nIkHmzlmmbTzbJ4FauTKmUNXfFO5TE7TESWHry+iFJ19+bHIkKFD5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309966; c=relaxed/simple;
	bh=unp8VnrfUHGaApxbrdzizCE3uxVGCd+oELNANJufWpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gwnBt63ehix+cc3JWK/mzK4uRAE8iGsDSptBm5BAPM6H+VgpC7MwYtW4n39Wm+/68EokP6fxUYT9G2l3jnRU1zWA9eaSNBXMPeygyF91uZM03Rx0Trxbo8grfjpFsnnO0xync9Nh/sW+0fbt7kYn13peXIzn9AdUp64jKmha5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiJxus98; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiJxus98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309961; x=1823845961;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=unp8VnrfUHGaApxbrdzizCE3uxVGCd+oELNANJufWpY=;
  b=IiJxus98S3nOOo3V+zhV+UvXwNBNEZi4RV0mm4PyAZ7Sa5qzg42ikv/X
   8FdLePOuN4X4kWjbLi+hohiDh390jbiQCQ/jmtHhTuef1aIdLZNLx6oTs
   X17G03AdJ7HIgjRtUtx48BRhyzxt6dYTyeiuRhIsYIxN4rRF2fYAk0UfM
   dojoH8yMh8m745HM2xkwqpcmCkrYu1v1GeoNR9BsTQYxDVoiig30Fhfst
   sK3U2lHPABbGCk+VNklh4iqL3Cd9yvdoVawUYQylaFCslSImodpdklrPp
   ntYsu9wnMIpWYzofGzmjrPtRxgay9WvA8IbZdF2I6bHCuddNQC454OoLm
   w==;
X-CSE-ConnectionGUID: NI3/gaN/S56C9drLGG/IQA==
X-CSE-MsgGUID: XTtN0tsyTumkPxcHiE6S/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916677"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: OZgzlLeeRha2ZcFvZjAtzA==
X-CSE-MsgGUID: NMHbhl8wQvKu2eHgtkMJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340779"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004v3-1iWR;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:45:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/gpu/drm/xe/xe_device.c:699 xe_device_probe() warn: missing unwind
 goto?
Message-ID: <202610170306.eCvLVXmK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kmine=
xt
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: 884d64e8e4dc6d4f1b0f69c31e4b4eadaf735648 [1/1] drm/xe: Stop ignorin=
g errors from xe_ttm_stolen_mgr_init()
:::::: branch date: 31 hours ago
:::::: commit date: 1 year, 5 months ago
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/arch=
ive/20261017/202610170306.eCvLVXmK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610170306.eCvLVXmK-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_device.c:699 xe_device_probe() warn: missing unwind g=
oto?

vim +699 drivers/gpu/drm/xe/xe_device.c

4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  605 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  606  int xe_device_probe(=
struct xe_device *xe)
dd08ebf6c3525a Matthew Brost          2023-03-30  607  {
ad703e06376d5d Matt Roper             2023-06-01  608  	struct xe_tile *til=
e;
dd08ebf6c3525a Matthew Brost          2023-03-30  609  	struct xe_gt *gt;
dd08ebf6c3525a Matthew Brost          2023-03-30  610  	int err;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  611  	u8 last_gt;
dd08ebf6c3525a Matthew Brost          2023-03-30  612  	u8 id;
dd08ebf6c3525a Matthew Brost          2023-03-30  613 =20
b445be57102005 Lucas De Marchi        2023-09-27  614  	xe_pat_init_early(x=
e);
b445be57102005 Lucas De Marchi        2023-09-27  615 =20
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  616  	err =3D xe_sriov_in=
it(xe);
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  617  	if (err)
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  618  		return err;
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  619 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  620  	xe->info.mem_region=
_mask =3D 1;
44e694958b9539 Maarten Lankhorst      2023-08-17  621  	err =3D xe_display_=
init_nommio(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  622  	if (err)
44e694958b9539 Maarten Lankhorst      2023-08-17  623  		return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  624 =20
01c2413a5bc2c6 Micha=C5=82 Winiarski       2023-11-29  625  	err =3D xe_set=
_dma_info(xe);
01c2413a5bc2c6 Micha=C5=82 Winiarski       2023-11-29  626  	if (err)
01c2413a5bc2c6 Micha=C5=82 Winiarski       2023-11-29  627  		return err;
01c2413a5bc2c6 Micha=C5=82 Winiarski       2023-11-29  628 =20
c7117419784f61 Matthew Auld           2024-05-22  629  	err =3D xe_mmio_pro=
be_tiles(xe);
c7117419784f61 Matthew Auld           2024-05-22  630  	if (err)
c7117419784f61 Matthew Auld           2024-05-22  631  		return err;
f4a0a113f103e2 Micha=C5=82 Winiarski       2023-11-29  632 =20
1ccd68e967f13a Micha=C5=82 Winiarski       2023-12-05  633  	xe_ttm_sys_mgr=
_init(xe);
1ccd68e967f13a Micha=C5=82 Winiarski       2023-12-05  634 =20
65c4de2a914838 Lucas De Marchi        2024-05-13  635  	for_each_gt(gt, xe,=
 id) {
65c4de2a914838 Lucas De Marchi        2024-05-13  636  		err =3D xe_gt_init=
_early(gt);
65c4de2a914838 Lucas De Marchi        2024-05-13  637  		if (err)
65c4de2a914838 Lucas De Marchi        2024-05-13  638  			return err;
65c4de2a914838 Lucas De Marchi        2024-05-13  639  	}
b62f828a8368de Micha=C5=82 Winiarski       2023-12-05  640 =20
791d0362a9e2d4 Micha=C5=82 Winiarski       2023-12-05  641  	for_each_tile(=
tile, xe, id) {
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  642  		if (IS_SRIOV_VF(xe=
)) {
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  643  			xe_guc_comm_init_=
early(&tile->primary_gt->uc.guc);
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  644  			err =3D xe_gt_sri=
ov_vf_bootstrap(tile->primary_gt);
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  645  			if (err)
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  646  				return err;
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  647  			err =3D xe_gt_sri=
ov_vf_query_config(tile->primary_gt);
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  648  			if (err)
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  649  				return err;
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  650  		}
791d0362a9e2d4 Micha=C5=82 Winiarski       2023-12-05  651  		err =3D xe_gg=
tt_init_early(tile->mem.ggtt);
791d0362a9e2d4 Micha=C5=82 Winiarski       2023-12-05  652  		if (err)
791d0362a9e2d4 Micha=C5=82 Winiarski       2023-12-05  653  			return err;
a6581ebe76856b Michal Wajdeczko       2023-12-18  654  		if (IS_SRIOV_VF(xe=
)) {
a6581ebe76856b Michal Wajdeczko       2023-12-18  655  			err =3D xe_memirq=
_init(&tile->sriov.vf.memirq);
a6581ebe76856b Michal Wajdeczko       2023-12-18  656  			if (err)
a6581ebe76856b Michal Wajdeczko       2023-12-18  657  				return err;
a6581ebe76856b Michal Wajdeczko       2023-12-18  658  		}
791d0362a9e2d4 Micha=C5=82 Winiarski       2023-12-05  659  	}
791d0362a9e2d4 Micha=C5=82 Winiarski       2023-12-05  660 =20
bf8ec3c3e82c70 Micha=C5=82 Winiarski       2024-02-19  661  	for_each_gt(gt=
, xe, id) {
bf8ec3c3e82c70 Micha=C5=82 Winiarski       2024-02-19  662  		err =3D xe_gt=
_init_hwconfig(gt);
bf8ec3c3e82c70 Micha=C5=82 Winiarski       2024-02-19  663  		if (err)
bf8ec3c3e82c70 Micha=C5=82 Winiarski       2024-02-19  664  			return err;
bf8ec3c3e82c70 Micha=C5=82 Winiarski       2024-02-19  665  	}
bf8ec3c3e82c70 Micha=C5=82 Winiarski       2024-02-19  666 =20
4209d635a82361 Jos=C3=A9 Roberto de Souza  2024-04-09  667  	err =3D xe_dev=
coredump_init(xe);
4209d635a82361 Jos=C3=A9 Roberto de Souza  2024-04-09  668  	if (err)
4209d635a82361 Jos=C3=A9 Roberto de Souza  2024-04-09  669  		return err;
bc54f42c0efaa8 Matthew Auld           2024-05-22  670  	err =3D devm_add_ac=
tion_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
571622740288f8 Andrzej Hajda          2023-10-27  671  	if (err)
571622740288f8 Andrzej Hajda          2023-10-27  672  		return err;
571622740288f8 Andrzej Hajda          2023-10-27  673 =20
44e694958b9539 Maarten Lankhorst      2023-08-17  674  	err =3D xe_display_=
init_noirq(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  675  	if (err)
dd08ebf6c3525a Matthew Brost          2023-03-30  676  		return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  677 =20
44e694958b9539 Maarten Lankhorst      2023-08-17  678  	err =3D xe_irq_inst=
all(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  679  	if (err)
44e694958b9539 Maarten Lankhorst      2023-08-17  680  		goto err;
44e694958b9539 Maarten Lankhorst      2023-08-17  681 =20
4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  682  	err =3D xe_device_s=
et_has_flat_ccs(xe);
4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  683  	if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  684  		goto err;
4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  685 =20
638d1c79cbf15c Michal Wajdeczko       2024-05-30  686  	err =3D xe_vram_pro=
be(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  687  	if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  688  		goto err;
dd08ebf6c3525a Matthew Brost          2023-03-30  689 =20
ad703e06376d5d Matt Roper             2023-06-01  690  	for_each_tile(tile,=
 xe, id) {
ad703e06376d5d Matt Roper             2023-06-01  691  		err =3D xe_tile_in=
it_noalloc(tile);
ad703e06376d5d Matt Roper             2023-06-01  692  		if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  693  			goto err;
dd08ebf6c3525a Matthew Brost          2023-03-30  694  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  695 =20
d8b52a02cb40fe Maarten Lankhorst      2023-01-12  696  	/* Allocate and map=
 stolen after potential VRAM resize */
884d64e8e4dc6d Lucas De Marchi        2025-02-13  697  	err =3D xe_ttm_stol=
en_mgr_init(xe);
884d64e8e4dc6d Lucas De Marchi        2025-02-13  698  	if (err)
884d64e8e4dc6d Lucas De Marchi        2025-02-13 @699  		return err;
d8b52a02cb40fe Maarten Lankhorst      2023-01-12  700 =20
44e694958b9539 Maarten Lankhorst      2023-08-17  701  	/*
44e694958b9539 Maarten Lankhorst      2023-08-17  702  	 * Now that GT is i=
nitialized (TTM in particular),
44e694958b9539 Maarten Lankhorst      2023-08-17  703  	 * we can try to in=
it display, and inherit the initial fb.
44e694958b9539 Maarten Lankhorst      2023-08-17  704  	 * This is the reas=
on the first allocation needs to be done
44e694958b9539 Maarten Lankhorst      2023-08-17  705  	 * inside display.
44e694958b9539 Maarten Lankhorst      2023-08-17  706  	 */
44e694958b9539 Maarten Lankhorst      2023-08-17  707  	err =3D xe_display_=
init_noaccel(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  708  	if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  709  		goto err;
44e694958b9539 Maarten Lankhorst      2023-08-17  710 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  711  	for_each_gt(gt, xe,=
 id) {
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  712  		last_gt =3D id;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  713 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  714  		err =3D xe_gt_init=
(gt);
dd08ebf6c3525a Matthew Brost          2023-03-30  715  		if (err)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  716  			goto err_fini_gt;
dd08ebf6c3525a Matthew Brost          2023-03-30  717  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  718 =20
87a4c85d3a3ed5 Vitaly Lubart          2023-08-28  719  	xe_heci_gsc_init(xe=
);
87a4c85d3a3ed5 Vitaly Lubart          2023-08-28  720 =20
67977882a2f133 Ashutosh Dixit         2024-06-17  721  	err =3D xe_oa_init(=
xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  722  	if (err)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  723  		goto err_fini_gt;
44e694958b9539 Maarten Lankhorst      2023-08-17  724 =20
67977882a2f133 Ashutosh Dixit         2024-06-17  725  	err =3D xe_display_=
init(xe);
67977882a2f133 Ashutosh Dixit         2024-06-17  726  	if (err)
67977882a2f133 Ashutosh Dixit         2024-06-17  727  		goto err_fini_oa;
67977882a2f133 Ashutosh Dixit         2024-06-17  728 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  729  	err =3D drm_dev_reg=
ister(&xe->drm, 0);
dd08ebf6c3525a Matthew Brost          2023-03-30  730  	if (err)
9914e19cc215d3 Koby Elbaz             2023-08-30  731  		goto err_fini_disp=
lay;
dd08ebf6c3525a Matthew Brost          2023-03-30  732 =20
44e694958b9539 Maarten Lankhorst      2023-08-17  733  	xe_display_register=
(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  734 =20
cdf02fe1a94a76 Ashutosh Dixit         2024-06-17  735  	xe_oa_register(xe);
cdf02fe1a94a76 Ashutosh Dixit         2024-06-17  736 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  737  	xe_debugfs_register=
(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  738 =20
fb1b70607f73af Badal Nilawar          2023-09-25  739  	xe_hwmon_register(x=
e);
fb1b70607f73af Badal Nilawar          2023-09-25  740 =20
3b1592fb783549 Vinay Belgaumkar       2024-06-20  741  	for_each_gt(gt, xe,=
 id)
3b1592fb783549 Vinay Belgaumkar       2024-06-20  742  		xe_gt_sanitize_fre=
q(gt);
3b1592fb783549 Vinay Belgaumkar       2024-06-20  743 =20
cee70645a7499e Matthew Auld           2024-05-22  744  	return devm_add_act=
ion_or_reset(xe->drm.dev, xe_device_sanitize, xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  745 =20
44e694958b9539 Maarten Lankhorst      2023-08-17  746  err_fini_display:
44e694958b9539 Maarten Lankhorst      2023-08-17  747  	xe_display_driver_r=
emove(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  748 =20
67977882a2f133 Ashutosh Dixit         2024-06-17  749  err_fini_oa:
67977882a2f133 Ashutosh Dixit         2024-06-17  750  	xe_oa_fini(xe);
67977882a2f133 Ashutosh Dixit         2024-06-17  751 =20
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  752  err_fini_gt:
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  753  	for_each_gt(gt, xe,=
 id) {
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  754  		if (id < last_gt)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  755  			xe_gt_remove(gt);
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  756  		else
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  757  			break;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  758  	}
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  759 =20
44e694958b9539 Maarten Lankhorst      2023-08-17  760  err:
44e694958b9539 Maarten Lankhorst      2023-08-17  761  	xe_display_fini(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  762  	return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  763  }
dd08ebf6c3525a Matthew Brost          2023-03-30  764 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
