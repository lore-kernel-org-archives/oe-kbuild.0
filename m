Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FE218858
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Jul 2025 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650625; cv=none; b=blrvnHwXb/kzmBNdb/J41ZzKW0bs0r5XNwtXRBTJ/2JVy5tbRqHUkKpFi1aXMkzY5WGfiE5yWvB2cKlACKNtrw7FaFgqIDcrxTfz+xZFX7IPVM6sWp8FWIZxxy57MgxU7zsmqICz2r46DEz+dcNF68Qj6J8WtXWjt9iT3ERQWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650625; c=relaxed/simple;
	bh=olXUWjwwcAmoe52lDwTBH4Ss3NZCWXm95vEoGNSo7Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5/2IV3XuBjt1EgmO/p9VpYD4OG6SgSdQwx4xMIaEWIbsBRTyM1qj9k2b8nvr/F7eFcZhPGI/x0nQ8wBqHVjIiVgsHLuh0dFnjDKxuzQLSnC+AaCgn7ne9zkME9rp+af9Y/6bsGH5NxFC641hRHXWw9AV8Kw8TamYWISZwTrUDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu4xBurJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu4xBurJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752650624; x=1784186624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=olXUWjwwcAmoe52lDwTBH4Ss3NZCWXm95vEoGNSo7Y0=;
  b=mu4xBurJ8AbIMEINZlHFsG5wxraERtyaghynLw+ss9xL3zCVmWMXGmrG
   gzee+gAtxJkmMEt1a6eGv4r3RBflggft/F8N7xhpFXW+ArQrwBuRXCfst
   yC9/YYaB5jZlQUeqeiGLLElnkXT/IBJIT6j49HZTy8D5HkrkT8vy8uCuF
   MK9Ek+ZmHkTBJxZt5+WAHkzRqFY06xtlBAzv5qBP/sqGoPjTqDiTwO3fo
   EZijA59nqX5mYzQ/lD931bma7v7gys70AV0/hx1eQUJQoXRfUVrxst0Vi
   pXZ4z7/4iCxEQOOlnWR/VNlQjCkZqpB5Dc8elY443gQUQpWullrtAHiOl
   A==;
X-CSE-ConnectionGUID: 27rm1Xw4T6y1OomLsulb8Q==
X-CSE-MsgGUID: ISuptu92TKCZgbJPfEXpBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58541922"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="58541922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 00:23:43 -0700
X-CSE-ConnectionGUID: ektBLDSrSpOPvjCZWdvSqQ==
X-CSE-MsgGUID: MKzYr/I/To+DV/j3bjNzMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="161455097"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jul 2025 00:23:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubwUN-000C3H-1g;
	Wed, 16 Jul 2025 07:23:39 +0000
Date: Wed, 16 Jul 2025 15:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7445/9935] drivers/gpu/drm/xe/xe_uc.c:167
 vf_uc_load_hw() warn: missing unwind goto?
Message-ID: <202507161531.PE8soY2b-lkp@intel.com>
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
TO: Zhanjun Dong <zhanjun.dong@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f
commit: b2c4ac219fa46bb6535a8147ac1611b3d6481aa2 [7445/9935] drm/xe/uc: Disable GuC communication on hardware initialization error
:::::: branch date: 21 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161531.PE8soY2b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507161531.PE8soY2b-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_uc.c:167 vf_uc_load_hw() warn: missing unwind goto?

vim +167 drivers/gpu/drm/xe/xe_uc.c

dd08ebf6c3525a Matthew Brost          2023-03-30  146  
18635b6328d9ed Maarten Lankhorst      2025-06-19  147  static int vf_uc_load_hw(struct xe_uc *uc)
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  148  {
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  149  	int err;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  150  
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  151  	err = xe_uc_sanitize_reset(uc);
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  152  	if (err)
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  153  		return err;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  154  
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  155  	err = xe_guc_enable_communication(&uc->guc);
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  156  	if (err)
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  157  		return err;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  158  
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  159  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  160  	if (err)
b2c4ac219fa46b Zhanjun Dong           2025-07-07  161  		goto err_out;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  162  
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  163  	uc->guc.submission_state.enabled = true;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  164  
a7ffcea8631af9 Daniele Ceraolo Spurio 2025-06-25  165  	err = xe_guc_opt_in_features_enable(&uc->guc);
a7ffcea8631af9 Daniele Ceraolo Spurio 2025-06-25  166  	if (err)
a7ffcea8631af9 Daniele Ceraolo Spurio 2025-06-25 @167  		return err;
a7ffcea8631af9 Daniele Ceraolo Spurio 2025-06-25  168  
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  169  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  170  	if (err)
b2c4ac219fa46b Zhanjun Dong           2025-07-07  171  		goto err_out;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  172  
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  173  	return 0;
b2c4ac219fa46b Zhanjun Dong           2025-07-07  174  
b2c4ac219fa46b Zhanjun Dong           2025-07-07  175  err_out:
b2c4ac219fa46b Zhanjun Dong           2025-07-07  176  	xe_guc_sanitize(&uc->guc);
b2c4ac219fa46b Zhanjun Dong           2025-07-07  177  	return err;
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  178  }
d9cf98e79ebfde Michal Wajdeczko       2024-06-04  179  

:::::: The code at line 167 was first introduced by commit
:::::: a7ffcea8631af91479cab10aa7fbfd0722f01d9a drm/xe/guc: Enable extended CAT error reporting

:::::: TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
:::::: CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
