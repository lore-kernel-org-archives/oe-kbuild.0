Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68243634C
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jul 2026 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665212; cv=none; b=ao0+ocivQ7xYt/BRLnSgGHnb0eZD4J7tpTKZCCBIHmhoVPvHyqjqyhOwNRumD2QFm2PA0NJA1fsdCazmiuIOSfqvNalVcy++jIQsbkXvkjcrwIAhLaS9O8/I/oLM0GAfA5/dH7HxhLm2im54053m/+tW0RjaDQEIR15L/eaW+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665212; c=relaxed/simple;
	bh=aEoGMNuYuVPKV7cpjgNqRSMit87M8HM5VBjrQ8BM/40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mr0n+q90IJCFNgjJ2HlGv1VNXRN2A+1Gm8FVfdYPsBG09Xbmp+anJtsu2GbKwmTgptWBFBlskQ8eA51h60GNWXawrz1IgdcOaH7Fyi2aGz3eHE5aGD4M5fIJy0DsrvqwZqCjTlfBp9L69d4A6m5E8gn+90cREV7vzugaXV2Ei04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1k0xY2M; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1k0xY2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784665211; x=1816201211;
  h=date:from:to:cc:subject:message-id;
  bh=aEoGMNuYuVPKV7cpjgNqRSMit87M8HM5VBjrQ8BM/40=;
  b=I1k0xY2MPyauDGcIzQc9UKOfxlMnA9bo4Pxd51/Eczu7eVe90953ikDD
   LAF0NxUqA3sCW9tvCTqGzYsBKCdqi34mTmzQo0z/5d+t6o0RikAB4E6+q
   iLk4I1WO6HU/mQ2YUD8HDCK4NI8uhtZgRhiA6+QQybeDUwOMlqc9xIPj7
   Id4RIt+ZtbIfIj4i7/dVXPn90FwO8NOh7enVzuvQEkDPIrV2iReQZtO0Y
   RI1XJ9S4SwywNgcINq2ljdHie6yT10ZO4WgXnOKXmI+UFgroPNNTt4nZP
   BzVi7nNUo9+2iPF/2XuFjMA/nYjN/tkKvrQtbXmv6lZqnoW2DchNty9G1
   Q==;
X-CSE-ConnectionGUID: O55UcrVxT46j+K0V4HMK8w==
X-CSE-MsgGUID: rDPP6ObaTZ+9M/pa5xqfxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96416414"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="96416414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:20:10 -0700
X-CSE-ConnectionGUID: PRfxYjERTfO7j35t5oj94A==
X-CSE-MsgGUID: 6vggd1shTfit1EpUjbFqGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="255223414"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2026 13:20:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmGwc-00000000Xx8-0TSK;
	Tue, 21 Jul 2026 20:20:04 +0000
Date: Wed, 22 Jul 2026 04:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3415 dm_suspend()
 warn: inconsistent returns '&dm->dc_lock'.
Message-ID: <202607220433.GXC845n9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Harry Wentland <harry.wentland@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Alex Hung <alex.hung@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b95f03f04d475aa6719d15a636ddf32222d55657
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef drm/amdgpu: Remove UML build exclusion from Kconfig
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: um-randconfig-r071-20260721 (https://download.01.org/0day-ci/archive/20260722/202607220433.GXC845n9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af3f2f5db265 ("drm/amdgpu: Remove UML build exclusion from Kconfig")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607220433.GXC845n9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3415 dm_suspend() warn: inconsistent returns '&dm->dc_lock'.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5229 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5233 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5248 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5249 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 128
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5250 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 127
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5251 convert_custom_brightness() error: buffer overflow 'caps->luminance_data' 99 <= 128

vim +3415 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

45cc102f8e6520a Mario Limonciello 2025-06-01  3358  
982d7f9bfe4a503 Sunil Khatri      2024-09-30  3359  static int dm_suspend(struct amdgpu_ip_block *ip_block)
4562236b3bc0a28 Harry Wentland    2017-09-12  3360  {
982d7f9bfe4a503 Sunil Khatri      2024-09-30  3361  	struct amdgpu_device *adev = ip_block->adev;
4562236b3bc0a28 Harry Wentland    2017-09-12  3362  	struct amdgpu_display_manager *dm = &adev->dm;
4562236b3bc0a28 Harry Wentland    2017-09-12  3363  
53b3f8f40e6cff3 Dennis Li         2020-08-19  3364  	if (amdgpu_in_reset(adev)) {
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3365  		enum dc_status res;
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3366  
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3367  		mutex_lock(&dm->dc_lock);
98ab5f3513f90f1 Bhawanpreet Lakha 2021-01-11  3368  
754003486c3cc95 Ray Wu            2025-12-17  3369  		amdgpu_dm_ism_disable(dm);
98ab5f3513f90f1 Bhawanpreet Lakha 2021-01-11  3370  		dc_allow_idle_optimizations(adev->dm.dc, false);
98ab5f3513f90f1 Bhawanpreet Lakha 2021-01-11  3371  
09a4ec5da92c849 Dillon Varone     2023-11-17  3372  		dm->cached_dc_state = dc_state_create_copy(dm->dc->current_state);
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3373  
8092aa3ab8f7b73 Alex Hung         2024-06-04  3374  		if (dm->cached_dc_state)
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3375  			dm_gpureset_toggle_interrupts(adev, dm->cached_dc_state, false);
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3376  
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3377  		res = amdgpu_dm_commit_zero_streams(dm->dc);
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3378  		if (res != DC_OK) {
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3379  			drm_err(adev_to_drm(adev), "Failed to commit zero streams: %d\n", res);
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3380  			return -EINVAL;
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3381  		}
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3382  
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3383  		amdgpu_dm_irq_suspend(adev);
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3384  
8e794421bc98158 Wayne Lin         2021-07-23  3385  		hpd_rx_irq_work_suspend(dm);
8e794421bc98158 Wayne Lin         2021-07-23  3386  
65890cad2edb53b Mario Limonciello 2025-02-17  3387  		return 0;
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3388  	}
4562236b3bc0a28 Harry Wentland    2017-09-12  3389  
50e0bae34fa6b8b Mario Limonciello 2025-02-13  3390  	if (!adev->dm.cached_state) {
709a37ab9c63297 Mario Limonciello 2025-06-01  3391  		int r = dm_cache_state(adev);
709a37ab9c63297 Mario Limonciello 2025-06-01  3392  
709a37ab9c63297 Mario Limonciello 2025-06-01  3393  		if (r)
709a37ab9c63297 Mario Limonciello 2025-06-01  3394  			return r;
50e0bae34fa6b8b Mario Limonciello 2025-02-13  3395  	}
d2f0b53bda31938 Leo (Hanghong  Ma 2019-01-24  3396) 
7594874227e1b04 Kun Liu           2025-01-08  3397  	s3_handle_hdmi_cec(adev_to_drm(adev), true);
7594874227e1b04 Kun Liu           2025-01-08  3398  
4a580877bdcb837 Luben Tuikov      2020-08-24  3399  	s3_handle_mst(adev_to_drm(adev), true);
4562236b3bc0a28 Harry Wentland    2017-09-12  3400  
4562236b3bc0a28 Harry Wentland    2017-09-12  3401  	amdgpu_dm_irq_suspend(adev);
4562236b3bc0a28 Harry Wentland    2017-09-12  3402  
754003486c3cc95 Ray Wu            2025-12-17  3403  	scoped_guard(mutex, &dm->dc_lock)
754003486c3cc95 Ray Wu            2025-12-17  3404  		amdgpu_dm_ism_disable(dm);
754003486c3cc95 Ray Wu            2025-12-17  3405  
8e794421bc98158 Wayne Lin         2021-07-23  3406  	hpd_rx_irq_work_suspend(dm);
8e794421bc98158 Wayne Lin         2021-07-23  3407  
32f5062d1c7dc2a Tom St Denis      2017-10-17  3408  	dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3409  
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3410  	if (dm->dc->caps.ips_support && adev->in_s0ix)
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3411  		dc_allow_idle_optimizations(dm->dc, true);
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3412  
0f657938e4345a7 Samson Tam        2023-11-28  3413  	dc_dmub_srv_set_power_state(dm->dc->ctx->dmub_srv, DC_ACPI_CM_POWER_STATE_D3);
4562236b3bc0a28 Harry Wentland    2017-09-12  3414  
1c2075d401f06a2 Jason Yan         2020-05-04 @3415  	return 0;
4562236b3bc0a28 Harry Wentland    2017-09-12  3416  }
4562236b3bc0a28 Harry Wentland    2017-09-12  3417  

:::::: The code at line 3415 was first introduced by commit
:::::: 1c2075d401f06a2642644ae5ccd3aa793a1b577b drm/amd/display: remove unused variable 'ret' in dm_suspend()

:::::: TO: Jason Yan <yanaijie@huawei.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
