Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE07926B955
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760978131; cv=none; b=ljHajq3WSMD8k1n3fVjIx3kt8EREW3GJppaFtu9GfnWKcOE42gxie+ewLgRUQRjyrq/Xoe688OafZh3kXihGEKbViIYvIOdC8WUzf0Mi8Bjfo0w+DWuCFzGy6hriSKTQsTi45okbHl+FI0igCZ19IXPhsPNb8Mpj+6OyKC7FGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760978131; c=relaxed/simple;
	bh=WGW+Zyypnr/TythIJ8uKbSaPeij2s65op1FvE5fOXo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbyG+fxCeMCzO+KC2x0gN/nrIbPow0c3x+OCpnH2wJXg7ScgKqSzX6m5dXK1zM7TFreqE5WoID4uitq9Rlb/VWhA1Pe/wo7/paHtnSqRIueIXN0wfN8+KdrDRShNyNqGGvqfnk+s69t/2vS03dUJNIb6P+BtDQdZyIPY2ei0skg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldKLwUH4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldKLwUH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760978131; x=1792514131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGW+Zyypnr/TythIJ8uKbSaPeij2s65op1FvE5fOXo8=;
  b=ldKLwUH4aqEJPfrilc+holpPNR302i3Hs1lkojwQnygWo+kKfkvoQdLN
   epts0aJC84nRg9fNmWioQPqX30yiw8zceI1XYbYvjBeioMcfp91U02vQZ
   MXQkENuPr8u/pDvddQujhWDlZWp8ja9yJQd27LjdJO1yaK0y9OVPiL7cW
   dJIeRmavioMvB1fFtZeblfqzGDUq2wxxWZMULgD+IIInsiRcTIpTkET2s
   9807TQr0GkWTZbZgWYdD3mAsMtObAMe5tjdbXlmTfyVj3fg9MF4nTYl4E
   6uPE3qARUibeOKzVXmoNgtK5nDL5N3VBYrifwCb9bIXgEXjeBjQJ1Bhru
   A==;
X-CSE-ConnectionGUID: hftOjheBQd65Bq/M6qBhug==
X-CSE-MsgGUID: R4Z8VRIyQMysSoLX4eVwAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65712085"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="65712085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 09:35:30 -0700
X-CSE-ConnectionGUID: EnlQosHoSCCgxHQQGD/AYw==
X-CSE-MsgGUID: KvSpUDK+TD2UMbTrhvzTdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183212827"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2025 09:35:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAsqz-0009zl-2q;
	Mon, 20 Oct 2025 16:35:25 +0000
Date: Tue, 21 Oct 2025 00:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1267/2617] drivers/gpu/drm/xe/xe_pmu.c:517
 set_supported_events() error: uninitialized symbol 'gt'.
Message-ID: <202510210011.tanwPBXz-lkp@intel.com>
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
TO: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   606da5bb165594c052ee11de79bf05bc38bc1aa6
commit: 999ef874c1458e54ce221fcf2674eeb7c29508d5 [1267/2617] drm/xe/pmu: Initialize PMU event types based on first available GT
:::::: branch date: 12 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20251020 (https://download.01.org/0day-ci/archive/20251021/202510210011.tanwPBXz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510210011.tanwPBXz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_pmu.c:517 set_supported_events() error: uninitialized symbol 'gt'.

vim +/gt +517 drivers/gpu/drm/xe/xe_pmu.c

011c1e246a1d01c Vinay Belgaumkar 2025-01-23  496  
6ea5bf169ad4b5b Lucas De Marchi  2025-01-23  497  static void set_supported_events(struct xe_pmu *pmu)
6ea5bf169ad4b5b Lucas De Marchi  2025-01-23  498  {
897286f2948cefe Vinay Belgaumkar 2025-01-23  499  	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
999ef874c1458e5 Matt Roper       2025-10-13  500  	struct xe_gt *gt;
999ef874c1458e5 Matt Roper       2025-10-13  501  	int id;
999ef874c1458e5 Matt Roper       2025-10-13  502  
999ef874c1458e5 Matt Roper       2025-10-13  503  	/* If there are no GTs, don't support any GT-related events */
999ef874c1458e5 Matt Roper       2025-10-13  504  	if (xe->info.gt_count == 0)
999ef874c1458e5 Matt Roper       2025-10-13  505  		return;
897286f2948cefe Vinay Belgaumkar 2025-01-23  506  
89f306dc6dfdc57 Vinay Belgaumkar 2025-03-31  507  	if (!xe->info.skip_guc_pc) {
897286f2948cefe Vinay Belgaumkar 2025-01-23  508  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
89f306dc6dfdc57 Vinay Belgaumkar 2025-03-31  509  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
89f306dc6dfdc57 Vinay Belgaumkar 2025-03-31  510  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
89f306dc6dfdc57 Vinay Belgaumkar 2025-03-31  511  	}
6978c5f5a64d4bd Riana Tauro      2025-02-24  512  
999ef874c1458e5 Matt Roper       2025-10-13  513  	/* Find the first available GT to query engine event capabilities */
999ef874c1458e5 Matt Roper       2025-10-13  514  	for_each_gt(gt, xe, id)
999ef874c1458e5 Matt Roper       2025-10-13  515  		break;
999ef874c1458e5 Matt Roper       2025-10-13  516  
6978c5f5a64d4bd Riana Tauro      2025-02-24 @517  	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
6978c5f5a64d4bd Riana Tauro      2025-02-24  518  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
6978c5f5a64d4bd Riana Tauro      2025-02-24  519  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
6978c5f5a64d4bd Riana Tauro      2025-02-24  520  	}
6ea5bf169ad4b5b Lucas De Marchi  2025-01-23  521  }
6ea5bf169ad4b5b Lucas De Marchi  2025-01-23  522  

:::::: The code at line 517 was first introduced by commit
:::::: 6978c5f5a64d4bdd6b00214368d5fe59f56e9890 drm/xe/xe_pmu: Add PMU support for engine activity

:::::: TO: Riana Tauro <riana.tauro@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
