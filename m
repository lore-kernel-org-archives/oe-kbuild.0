Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9648AE38
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396158; cv=none; b=MRMOiLo4dZ3M6d+SC2KbRie4+s+vTtn5FHu7arFkk7bsqifmxROMoa42do9wCWHp0mqGrbCpyCbnfYV+FbuvK8G2D2S0OBrLFZWs4DA7C+XtcjKYCugfZTQqn0vwtKcbZ5/jQ8/hZsz87x0coJFo+5Rhd23GqpwYJVqbVCilby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396158; c=relaxed/simple;
	bh=TsXXZlvsFdmTm/W/Vp29E1299fj3cnGDO1PEUSFsm98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePp5fhJRfP9n1BmOCGdTNPNupa5SAlzEfF1WhH2RIqAH8VxOGdRIxRr7L+uT/w02+hz90pcbk4HtVW81xHfoMQeCGbW0nQhIZd3B+n4wkahhESAgYvex3UrNwoTh6uiTw3ZDy+mLx98bURTCpCdudXlwjbeM0KROA6GMiRu1iHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YERzX4Hw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YERzX4Hw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so16093305e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396155; x=1793000955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHwgNxWhnzQ84KwLQRCnTHCRHrGyYb1VO9L/VRtnJXA=;
        b=YERzX4HwM1gLiktU/U4+adUzT7H+zSHy3x++f+WCV2aemTldRJCc9w/hIKzym2mSVo
         JqLm9C4rZKmZaDWr6STZMlcVPnVDFDdsgL4VN7jEMf2cPgZz5fHCQhXE2bcDvPsOQnAQ
         yzUkRXLl/4O/JD8nVf6uaTD3RPsg0H5BiG0wBgbTbSSo2P6sqnAHm7eXbrjI+Fz4eKbk
         TjXYZyZ+tTKOJTEPOi0A8qabQGkeAn3uyRQGdf4CcrrQkMRy3rlXs94ghJpGfNdB3H5V
         bXmCerxc2caERmTbBDJblnoZ+r3e8IQZL2oE2p5rWvEhCWSY75DALbTImAOmktjWCEK6
         SlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396155; x=1793000955;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHwgNxWhnzQ84KwLQRCnTHCRHrGyYb1VO9L/VRtnJXA=;
        b=qkxR7uGFVs2c0AE2TOSjPKiOBaZLnwjUt285BcnbJMmg/MWtBzbcMnlid+ux5L7UvY
         jTbm7T5UVNhbCUVLtZUJOEA2DRTsUqrvQe4l7X4VKw+/h/vvSD+AIGFlZCYcr0woDjXx
         VAPyJGqHSeb0SWFfGMi7D6O2M9mOb4QJkmh1nU6f4/qt8JWDBC7Hzrgf6Cn9BSUZAf4z
         a4kntqhDWcbK3OgBpumR0b9diucP+SMPCYjsz5INUlA0T0o8tLpGyYhjDGieW+o8zk4E
         wz7swkLsr462PdfGmhSAC+CmJpSfuaOFKyx3/b3yw/r2sUcCekLQXntJFj/Gs1oa1Eum
         YQqg==
X-Gm-Message-State: AFq9FYJVHDbaEFcMYo8P8mythO0raXMnZOj29UN8wrL+MyOKj5yt+RET
	LREljGlzWQjGBZWeVLNfrEl/kI36VHoE+WSmbYSEGPj4tqUidYpfUoSPZTCcRkvx18L+atsj
X-Gm-Gg: AYBFou1PZquT/193yHcIQPzk9lwutIIknX0/u4iTO0+ftfi2j6zA93Sxc6caTuZu3k8
	k8kwDfaiRjFLBghrybG8Z8wTUNQEqjYuL0nqHUSLFp18UANs5Lq0Aly3KbgOkBL2XO4Uk4g7rdl
	s3SyFe0LFGpCebUr5zbyK8daV88/TWNfGq2FYMoCowE26aWzIAIgjO9GI6CK1JlIA4x88HMIump
	UnXln1rkxrDolP/JHP3EY6O0N6AkvfezVEykdZyTVZjupW8Q+Kzg4dFL4qgEv2IEQfq2eFIwS68
	NNmljm87SmMJrQhrv3Ny2kT7sdJRcTTr3wuvxuWXc234y9ALGRRlsWXENbRWfVjCYS1s31FtoW4
	nuOySOs1kRSdaWOgdkrc58niIGJvoFm56gFkPFzsO1h1hSPWsD9SschvL7RxM4nxwDyF2qixduv
	OQuN0Ojx1DQ539JkXN6aEOMQa3FFpMASBvKn5UOyrOnK8gBUo8ljoC+PRvRWNcOcXxBliEQCV49
	lmJdA==
X-Received: by 2002:a05:600c:19cc:b0:4a1:70da:3350 with SMTP id 5b1f17b1804b1-4a1d762386fmr133917375e9.32.1792396154509;
        Mon, 19 Oct 2026 00:49:14 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm23292423f8f.4.2026.10.19.00.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:49:13 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:49:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/gpu/drm/xe/xe_device.c:699 xe_device_probe() warn: missing unwind
 goto?
Message-ID: <atXLdi4TbE3M3WtK@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: 884d64e8e4dc6d4f1b0f69c31e4b4eadaf735648 [1/1] drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170306.eCvLVXmK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610170306.eCvLVXmK-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_device.c:699 xe_device_probe() warn: missing unwind goto?

vim +699 drivers/gpu/drm/xe/xe_device.c

dd08ebf6c3525a Matthew Brost          2023-03-30  606  int xe_device_probe(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost          2023-03-30  607  {
ad703e06376d5d Matt Roper             2023-06-01  608  	struct xe_tile *tile;
dd08ebf6c3525a Matthew Brost          2023-03-30  609  	struct xe_gt *gt;
dd08ebf6c3525a Matthew Brost          2023-03-30  610  	int err;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  611  	u8 last_gt;
dd08ebf6c3525a Matthew Brost          2023-03-30  612  	u8 id;
dd08ebf6c3525a Matthew Brost          2023-03-30  613  
b445be57102005 Lucas De Marchi        2023-09-27  614  	xe_pat_init_early(xe);
b445be57102005 Lucas De Marchi        2023-09-27  615  
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  616  	err = xe_sriov_init(xe);
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  617  	if (err)
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  618  		return err;
0cfb7caefabd74 Michal Wajdeczko       2024-01-04  619  
dd08ebf6c3525a Matthew Brost          2023-03-30  620  	xe->info.mem_region_mask = 1;
44e694958b9539 Maarten Lankhorst      2023-08-17  621  	err = xe_display_init_nommio(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  622  	if (err)
44e694958b9539 Maarten Lankhorst      2023-08-17  623  		return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  624  
01c2413a5bc2c6 Michał Winiarski       2023-11-29  625  	err = xe_set_dma_info(xe);
01c2413a5bc2c6 Michał Winiarski       2023-11-29  626  	if (err)
01c2413a5bc2c6 Michał Winiarski       2023-11-29  627  		return err;
01c2413a5bc2c6 Michał Winiarski       2023-11-29  628  
c7117419784f61 Matthew Auld           2024-05-22  629  	err = xe_mmio_probe_tiles(xe);
c7117419784f61 Matthew Auld           2024-05-22  630  	if (err)
c7117419784f61 Matthew Auld           2024-05-22  631  		return err;
f4a0a113f103e2 Michał Winiarski       2023-11-29  632  
1ccd68e967f13a Michał Winiarski       2023-12-05  633  	xe_ttm_sys_mgr_init(xe);
1ccd68e967f13a Michał Winiarski       2023-12-05  634  
65c4de2a914838 Lucas De Marchi        2024-05-13  635  	for_each_gt(gt, xe, id) {
65c4de2a914838 Lucas De Marchi        2024-05-13  636  		err = xe_gt_init_early(gt);
65c4de2a914838 Lucas De Marchi        2024-05-13  637  		if (err)
65c4de2a914838 Lucas De Marchi        2024-05-13  638  			return err;
65c4de2a914838 Lucas De Marchi        2024-05-13  639  	}
b62f828a8368de Michał Winiarski       2023-12-05  640  
791d0362a9e2d4 Michał Winiarski       2023-12-05  641  	for_each_tile(tile, xe, id) {
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  642  		if (IS_SRIOV_VF(xe)) {
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  643  			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  644  			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  645  			if (err)
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  646  				return err;
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  647  			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  648  			if (err)
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  649  				return err;
ea797cf4b7f847 Michal Wajdeczko       2024-05-24  650  		}
791d0362a9e2d4 Michał Winiarski       2023-12-05  651  		err = xe_ggtt_init_early(tile->mem.ggtt);
791d0362a9e2d4 Michał Winiarski       2023-12-05  652  		if (err)
791d0362a9e2d4 Michał Winiarski       2023-12-05  653  			return err;
a6581ebe76856b Michal Wajdeczko       2023-12-18  654  		if (IS_SRIOV_VF(xe)) {
a6581ebe76856b Michal Wajdeczko       2023-12-18  655  			err = xe_memirq_init(&tile->sriov.vf.memirq);
a6581ebe76856b Michal Wajdeczko       2023-12-18  656  			if (err)
a6581ebe76856b Michal Wajdeczko       2023-12-18  657  				return err;
a6581ebe76856b Michal Wajdeczko       2023-12-18  658  		}
791d0362a9e2d4 Michał Winiarski       2023-12-05  659  	}
791d0362a9e2d4 Michał Winiarski       2023-12-05  660  
bf8ec3c3e82c70 Michał Winiarski       2024-02-19  661  	for_each_gt(gt, xe, id) {
bf8ec3c3e82c70 Michał Winiarski       2024-02-19  662  		err = xe_gt_init_hwconfig(gt);
bf8ec3c3e82c70 Michał Winiarski       2024-02-19  663  		if (err)
bf8ec3c3e82c70 Michał Winiarski       2024-02-19  664  			return err;
bf8ec3c3e82c70 Michał Winiarski       2024-02-19  665  	}
bf8ec3c3e82c70 Michał Winiarski       2024-02-19  666  
4209d635a82361 José Roberto de Souza  2024-04-09  667  	err = xe_devcoredump_init(xe);
4209d635a82361 José Roberto de Souza  2024-04-09  668  	if (err)
4209d635a82361 José Roberto de Souza  2024-04-09  669  		return err;
bc54f42c0efaa8 Matthew Auld           2024-05-22  670  	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
571622740288f8 Andrzej Hajda          2023-10-27  671  	if (err)
571622740288f8 Andrzej Hajda          2023-10-27  672  		return err;
571622740288f8 Andrzej Hajda          2023-10-27  673  
44e694958b9539 Maarten Lankhorst      2023-08-17  674  	err = xe_display_init_noirq(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  675  	if (err)
dd08ebf6c3525a Matthew Brost          2023-03-30  676  		return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  677  
44e694958b9539 Maarten Lankhorst      2023-08-17  678  	err = xe_irq_install(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  679  	if (err)
44e694958b9539 Maarten Lankhorst      2023-08-17  680  		goto err;
44e694958b9539 Maarten Lankhorst      2023-08-17  681  
4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  682  	err = xe_device_set_has_flat_ccs(xe);
4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  683  	if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  684  		goto err;
4cb12b71923b6e Himal Prasad Ghimiray  2023-12-12  685  
638d1c79cbf15c Michal Wajdeczko       2024-05-30  686  	err = xe_vram_probe(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  687  	if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  688  		goto err;
dd08ebf6c3525a Matthew Brost          2023-03-30  689  
ad703e06376d5d Matt Roper             2023-06-01  690  	for_each_tile(tile, xe, id) {
ad703e06376d5d Matt Roper             2023-06-01  691  		err = xe_tile_init_noalloc(tile);
ad703e06376d5d Matt Roper             2023-06-01  692  		if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  693  			goto err;
dd08ebf6c3525a Matthew Brost          2023-03-30  694  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  695  
d8b52a02cb40fe Maarten Lankhorst      2023-01-12  696  	/* Allocate and map stolen after potential VRAM resize */
884d64e8e4dc6d Lucas De Marchi        2025-02-13  697  	err = xe_ttm_stolen_mgr_init(xe);
884d64e8e4dc6d Lucas De Marchi        2025-02-13  698  	if (err)
884d64e8e4dc6d Lucas De Marchi        2025-02-13 @699  		return err;

This one is actually correct.  All the goto err statements were wrong.

d8b52a02cb40fe Maarten Lankhorst      2023-01-12  700  
44e694958b9539 Maarten Lankhorst      2023-08-17  701  	/*
44e694958b9539 Maarten Lankhorst      2023-08-17  702  	 * Now that GT is initialized (TTM in particular),
44e694958b9539 Maarten Lankhorst      2023-08-17  703  	 * we can try to init display, and inherit the initial fb.
44e694958b9539 Maarten Lankhorst      2023-08-17  704  	 * This is the reason the first allocation needs to be done
44e694958b9539 Maarten Lankhorst      2023-08-17  705  	 * inside display.
44e694958b9539 Maarten Lankhorst      2023-08-17  706  	 */
44e694958b9539 Maarten Lankhorst      2023-08-17  707  	err = xe_display_init_noaccel(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  708  	if (err)
80bab5c5038f32 Ilia Levi              2024-06-06  709  		goto err;
44e694958b9539 Maarten Lankhorst      2023-08-17  710  
dd08ebf6c3525a Matthew Brost          2023-03-30  711  	for_each_gt(gt, xe, id) {
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  712  		last_gt = id;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  713  
dd08ebf6c3525a Matthew Brost          2023-03-30  714  		err = xe_gt_init(gt);
dd08ebf6c3525a Matthew Brost          2023-03-30  715  		if (err)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  716  			goto err_fini_gt;
dd08ebf6c3525a Matthew Brost          2023-03-30  717  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  718  
87a4c85d3a3ed5 Vitaly Lubart          2023-08-28  719  	xe_heci_gsc_init(xe);
87a4c85d3a3ed5 Vitaly Lubart          2023-08-28  720  
67977882a2f133 Ashutosh Dixit         2024-06-17  721  	err = xe_oa_init(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  722  	if (err)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  723  		goto err_fini_gt;
44e694958b9539 Maarten Lankhorst      2023-08-17  724  
67977882a2f133 Ashutosh Dixit         2024-06-17  725  	err = xe_display_init(xe);
67977882a2f133 Ashutosh Dixit         2024-06-17  726  	if (err)
67977882a2f133 Ashutosh Dixit         2024-06-17  727  		goto err_fini_oa;
67977882a2f133 Ashutosh Dixit         2024-06-17  728  
dd08ebf6c3525a Matthew Brost          2023-03-30  729  	err = drm_dev_register(&xe->drm, 0);
dd08ebf6c3525a Matthew Brost          2023-03-30  730  	if (err)
9914e19cc215d3 Koby Elbaz             2023-08-30  731  		goto err_fini_display;
dd08ebf6c3525a Matthew Brost          2023-03-30  732  
44e694958b9539 Maarten Lankhorst      2023-08-17  733  	xe_display_register(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  734  
cdf02fe1a94a76 Ashutosh Dixit         2024-06-17  735  	xe_oa_register(xe);
cdf02fe1a94a76 Ashutosh Dixit         2024-06-17  736  
dd08ebf6c3525a Matthew Brost          2023-03-30  737  	xe_debugfs_register(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  738  
fb1b70607f73af Badal Nilawar          2023-09-25  739  	xe_hwmon_register(xe);
fb1b70607f73af Badal Nilawar          2023-09-25  740  
3b1592fb783549 Vinay Belgaumkar       2024-06-20  741  	for_each_gt(gt, xe, id)
3b1592fb783549 Vinay Belgaumkar       2024-06-20  742  		xe_gt_sanitize_freq(gt);
3b1592fb783549 Vinay Belgaumkar       2024-06-20  743  
cee70645a7499e Matthew Auld           2024-05-22  744  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  745  
44e694958b9539 Maarten Lankhorst      2023-08-17  746  err_fini_display:
44e694958b9539 Maarten Lankhorst      2023-08-17  747  	xe_display_driver_remove(xe);
44e694958b9539 Maarten Lankhorst      2023-08-17  748  
67977882a2f133 Ashutosh Dixit         2024-06-17  749  err_fini_oa:
67977882a2f133 Ashutosh Dixit         2024-06-17  750  	xe_oa_fini(xe);
67977882a2f133 Ashutosh Dixit         2024-06-17  751  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  752  err_fini_gt:
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  753  	for_each_gt(gt, xe, id) {
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  754  		if (id < last_gt)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  755  			xe_gt_remove(gt);
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  756  		else
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  757  			break;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  758  	}
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  759  
44e694958b9539 Maarten Lankhorst      2023-08-17  760  err:
44e694958b9539 Maarten Lankhorst      2023-08-17  761  	xe_display_fini(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  762  	return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  763  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

