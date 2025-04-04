Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6C18B0F
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743808531; cv=none; b=SrvwmqXoWgrDtB6sYrgSpWpgv53ixcsAXgSKt7H11je8REHoLcKWUueUzNBHoLy3b2DYrJTYKVs/N94hAb1gb+n5euGmKSJbAfdT0cX1uaaejQk8/87oUCHbeBvreWhQVQQnj7z0b+Ec+Z8XD9gYCtX7ZzPA29z5yJPNzOmDnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743808531; c=relaxed/simple;
	bh=YLWY41vRkXWOj4dOUIgDLOY+mu/YbKztZ5NyBx282pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRJEHHYufxdBbIRc2IktJHKYUDMWh7AanUfu2VX49pXIyDchPCAZetve1dJXWxYdzTWlcSY9WXg2CMf5iRminZSx0NTE51giy9TNJ6eDkswx0afZj3h4LKfPOD6mPf4k5bnvFgI8c6DQy+eSbPbzO8Vls4yovXS7zhNxjmbSfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaepPZkq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaepPZkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743808528; x=1775344528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLWY41vRkXWOj4dOUIgDLOY+mu/YbKztZ5NyBx282pA=;
  b=aaepPZkqFLG9x6eh2Ip5yXa0+Nm4VhCAhKGGyAPyG8adRefoVxWPTWKi
   Js0oduOf5jPfeIirxq2QQU4ix+E5adt4NcEN1nih7RGIQKpYX9QFIlTLx
   1Tt4DDcyjexnBFjzLbfxfmQgA36AiZ1eyM/1CLuR2o0ZFQuhUXn3+6HuW
   kkeiyIPqz8ZfzvPjVKKjYdUm3A7x/mTl1CMZQEQ/VQ/bMcAZjmPXDMd42
   89Xvz7CPTBnrET35vyijGNZG1D1YvfpN41iEcdsNqMf70xS//RPN74/Sg
   wqWv8YqjbL48iHrdXwEoTXQP6tRwIZuRCJuSqyD9bhN0uClgyix9SoNx4
   g==;
X-CSE-ConnectionGUID: s5SFyf2lRNqG+VnkQDMWxQ==
X-CSE-MsgGUID: H1opheD0Tf2enBYbWapVgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45354428"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45354428"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 16:15:15 -0700
X-CSE-ConnectionGUID: usQB5JRoTA2LRAGRc7MAiA==
X-CSE-MsgGUID: rK5heoPjQMq2IUurs0QIKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="132151557"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Apr 2025 16:15:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0qFj-0001ax-1U;
	Fri, 04 Apr 2025 23:15:11 +0000
Date: Sat, 5 Apr 2025 07:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 14002/14010] drivers/gpu/drm/xe/xe_gt_clock.c:30
 read_crystal_clock() warn: shift has higher precedence than mask
Message-ID: <202504050755.YjmErscu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a4cda136f021ad44b8b52286aafd613030a6db5f
commit: 1700701add5089764e72fdfefce0c1f339f01c02 [14002/14010] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
:::::: branch date: 20 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20250403 (https://download.01.org/0day-ci/archive/20250405/202504050755.YjmErscu-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504050755.YjmErscu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:30 read_crystal_clock() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:583 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:208 survivability_mode_requested() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:523 xe_hwmon_pcode_read_fan_control() warn: shift has higher precedence than mask

Old smatch warnings:
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_gt_clock.c:90 xe_gt_clock_init() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:374 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:374 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:375 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:375 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:386 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:386 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:386 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:386 xe_hw_engine_setup_default_lrc_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:424 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:424 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:425 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:425 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:430 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:430 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:430 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:430 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:444 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:444 hw_engine_setup_default_state() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:585 adjust_idledly() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:687 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:688 read_media_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:722 read_copy_fuses() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hw_engine.c:769 read_compute_fuses_from_reg() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:49 aux_history_offset() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:78 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_survivability_mode.c:84 populate_survivability_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:221 xe_hwmon_power_max_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:260 xe_hwmon_power_max_write() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:260 xe_hwmon_power_max_write() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:261 xe_hwmon_power_max_write() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:345 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:346 xe_hwmon_power_max_interval_show() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:422 xe_hwmon_power_max_interval_store() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:422 xe_hwmon_power_max_interval_store() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:422 xe_hwmon_power_max_interval_store() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:422 xe_hwmon_power_max_interval_store() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:429 xe_hwmon_power_max_interval_store() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:499 xe_hwmon_pcode_read_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:508 xe_hwmon_pcode_write_i1() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:538 xe_hwmon_power_curr_crit_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:567 xe_hwmon_get_voltage() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:593 xe_hwmon_temp_read() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:975 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:976 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask
drivers/gpu/drm/xe/xe_hwmon.c:977 xe_hwmon_get_preregistration_info() warn: shift has higher precedence than mask

vim +30 drivers/gpu/drm/xe/xe_gt_clock.c

7c53ff050ba88b Vinay Belgaumkar 2025-03-20  26  
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  27  static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  28  			       u32 *timestamp_base)
dd08ebf6c3525a Matthew Brost    2023-03-30  29  {
5f230a144a33d9 Lucas De Marchi  2023-04-27 @30  	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
5f230a144a33d9 Lucas De Marchi  2023-04-27  31  					  rpm_config_reg);
dd08ebf6c3525a Matthew Brost    2023-03-30  32  
dd08ebf6c3525a Matthew Brost    2023-03-30  33  	switch (crystal_clock) {
d9b79ad275e7a9 Lucas De Marchi  2023-04-27  34  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  35  		*freq = f24_mhz;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  36  		*timestamp_base = ts_base_83;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  37  		return;
d9b79ad275e7a9 Lucas De Marchi  2023-04-27  38  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  39  		*freq = f19_2_mhz;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  40  		*timestamp_base = ts_base_52;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  41  		return;
d9b79ad275e7a9 Lucas De Marchi  2023-04-27  42  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  43  		*freq = f38_4_mhz;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  44  		*timestamp_base = ts_base_52;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  45  		return;
d9b79ad275e7a9 Lucas De Marchi  2023-04-27  46  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  47  		*freq = f25_mhz;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  48  		*timestamp_base = ts_base_80;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  49  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30  50  	default:
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  51  		xe_gt_warn(gt, "Invalid crystal clock frequency: %u", crystal_clock);
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  52  		*freq = 0;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  53  		*timestamp_base = 0;
7c53ff050ba88b Vinay Belgaumkar 2025-03-20  54  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30  55  	}
dd08ebf6c3525a Matthew Brost    2023-03-30  56  }
dd08ebf6c3525a Matthew Brost    2023-03-30  57  

:::::: The code at line 30 was first introduced by commit
:::::: 5f230a144a33d9a33448063a23d65c53b6d84cea drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
