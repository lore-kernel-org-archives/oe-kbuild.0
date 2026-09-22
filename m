Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96707439F77
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088307; cv=none; b=Fr1B+vrVowuY9lrgLbOVwn4dhY5tvDF2Jq7Gdc7Lxw4wImS3Jn8OfRaiA/eD/qtIaexrgW9TiQHl4UKDgqciutyi+s9V9PJz75FmUblPN+T7RTkL1wdnJVraDCz5zBdAvDmxqpX7NHGL3mRaXdT8Hi/QkPMKjOqLchewq2VEdZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088307; c=relaxed/simple;
	bh=S0YV/bo/uFMkMKhn5ptY8LlGFT/XOBCKJGAoVNhyxiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OpiL6S9M6JrAeV/4pneg4MvSUUjNYU6EntRRPOHAtB2G76RZYtABXO2g1de3q3uGY1SKKRJkknXsCYpYVVGkCSanBsVHsCS6jxjBsDJB7aMV1IidFg24Pi7oy+GOfTEK0T7GXGmxddlYimkLtR7xX97I1Vrbo17k2clh90Y+QJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMeFQUYt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMeFQUYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790088305; x=1821624305;
  h=date:from:to:cc:subject:message-id;
  bh=S0YV/bo/uFMkMKhn5ptY8LlGFT/XOBCKJGAoVNhyxiQ=;
  b=jMeFQUYthsDFJrF0THy61EIYZMJEqKiABEtw06dtKdBmseDBEiFezDSH
   XQ367gcW82clXz9+6Vcb6N3etGORcjFBABTxU2/zS9RMFDHDXRxlfr8W4
   sPfTuvi3sKVF9iKKE+MFlc/tvXvxEPNzVntJjoV3Ov7wNLVVxRYWCkcfM
   4kWjjCRl1GwDRam+IfSSembYz0a1/eqsTO05D9q28CbM9sc9nImAr6UvJ
   81BPTyMIu/2O7dT/pswUZPSM9S/jzqtc4hS0czUM87O/sLQ1d1jfkN7hr
   mkxB3Qx5Ha25xFGuOE3BgZGlofZu9kqIqipY+zJ778dm1a2IpolH/GsKw
   g==;
X-CSE-ConnectionGUID: OnujxXPFT26Dg7DQkJmcww==
X-CSE-MsgGUID: ilBXABASRb6GdcJ+I774LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93200851"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="93200851"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 07:45:03 -0700
X-CSE-ConnectionGUID: rZa64cTRRtm3F6rwEYevKw==
X-CSE-MsgGUID: dYvedo7DT/mZfiljsroyqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4456650"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 22 Sep 2026 07:45:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x91jv-00000000Fbg-2vsf;
	Tue, 22 Sep 2026 14:44:59 +0000
Date: Tue, 22 Sep 2026 22:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_guc_ads.c:353:9: sparse: sparse:
 Trying to use reserved word 'if' as identifier
Message-ID: <202609222227.z5H69ypy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_guc_ads.c:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 09af64eba63ece2d928295e61ab1d56ae264447c drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
date:   9 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-1301-20260922 (https://download.01.org/0day-ci/archive/20260922/202609222227.z5H69ypy-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222227.z5H69ypy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 09af64eba63e ("drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609222227.z5H69ypy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_ads.c:350:13: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_guc_ads.c:350:13: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: got )
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:13: sparse: sparse: got (
>> drivers/gpu/drm/xe/xe_guc_ads.c:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got &
>> drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got (
>> drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:358:43: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:358:43: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_ads.c:360:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:360:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:367:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:367:13: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:367:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration

vim +/if +353 drivers/gpu/drm/xe/xe_guc_ads.c

c151ff5c9053338 Badal Nilawar    2024-04-05  310  
d6da81a4785ca6e Badal Nilawar    2024-04-05  311  static void guc_waklv_init(struct xe_guc_ads *ads)
d6da81a4785ca6e Badal Nilawar    2024-04-05  312  {
c151ff5c9053338 Badal Nilawar    2024-04-05  313  	struct xe_gt *gt = ads_to_gt(ads);
d6da81a4785ca6e Badal Nilawar    2024-04-05  314  	u64 addr_ggtt;
d6da81a4785ca6e Badal Nilawar    2024-04-05  315  	u32 offset, remain, size;
d6da81a4785ca6e Badal Nilawar    2024-04-05  316  
d6da81a4785ca6e Badal Nilawar    2024-04-05  317  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6e Badal Nilawar    2024-04-05  318  	remain = guc_ads_waklv_size(ads);
d6da81a4785ca6e Badal Nilawar    2024-04-05  319  
83f4151787c5dd2 Matt Roper       2025-12-12  320  	if (XE_GT_WA(gt, 16021333562))
7c9de25efa7677a Jonathan Cavitt  2025-07-28  321  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  322  				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
4d5c98eb77fe518 Matt Atwood      2025-08-07  323  	if (XE_GT_WA(gt, 18024947630))
7c9de25efa7677a Jonathan Cavitt  2025-07-28  324  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  325  				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
4d5c98eb77fe518 Matt Atwood      2025-08-07  326  	if (XE_GT_WA(gt, 16022287689))
7c9de25efa7677a Jonathan Cavitt  2025-07-28  327  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  328  				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
d6da81a4785ca6e Badal Nilawar    2024-04-05  329  
4d5c98eb77fe518 Matt Atwood      2025-08-07  330  	if (XE_GT_WA(gt, 14022866841))
7c9de25efa7677a Jonathan Cavitt  2025-07-28  331  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  332  				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
61ef737db9f2841 Vinay Belgaumkar 2024-10-15  333  
2817a1f1bfb1a2e Vinay Belgaumkar 2024-04-16  334  	/*
2817a1f1bfb1a2e Vinay Belgaumkar 2024-04-16  335  	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
2817a1f1bfb1a2e Vinay Belgaumkar 2024-04-16  336  	 * the default value for this register is determined to be 0xC40. This could change in the
2817a1f1bfb1a2e Vinay Belgaumkar 2024-04-16  337  	 * future, so GuC depends on KMD to send it the correct value.
2817a1f1bfb1a2e Vinay Belgaumkar 2024-04-16  338  	 */
4d5c98eb77fe518 Matt Atwood      2025-08-07  339  	if (XE_GT_WA(gt, 13011645652)) {
7c9de25efa7677a Jonathan Cavitt  2025-07-28  340  		u32 data = 0xC40;
7c9de25efa7677a Jonathan Cavitt  2025-07-28  341  
19baa830fbb60d7 Lucas De Marchi  2025-09-12  342  		guc_waklv_enable(ads, &data, 1, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  343  				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
7c9de25efa7677a Jonathan Cavitt  2025-07-28  344  	}
2817a1f1bfb1a2e Vinay Belgaumkar 2024-04-16  345  
4d5c98eb77fe518 Matt Atwood      2025-08-07  346  	if (XE_GT_WA(gt, 14022293748) || XE_GT_WA(gt, 22019794406))
7c9de25efa7677a Jonathan Cavitt  2025-07-28  347  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  348  				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
636cdf6fbddff47 Julia Filipchuk  2024-08-05  349  
09af64eba63ece2 Michal Wajdeczko 2025-12-16  350  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
7c9de25efa7677a Jonathan Cavitt  2025-07-28  351  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  352  				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
09af64eba63ece2 Michal Wajdeczko 2025-12-16 @353  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
7c9de25efa7677a Jonathan Cavitt  2025-07-28  354  		u32 data[] = {
d72779c29d82c6e Sk Anirban       2025-07-16  355  			0x0,
d72779c29d82c6e Sk Anirban       2025-07-16  356  			0xF,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  357  		};
19baa830fbb60d7 Lucas De Marchi  2025-09-12  358  		guc_waklv_enable(ads, data, ARRAY_SIZE(data), &offset, &remain,
7c9de25efa7677a Jonathan Cavitt  2025-07-28  359  				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
7c9de25efa7677a Jonathan Cavitt  2025-07-28  360  	}
d3e8349edf7ed9e John Harrison    2025-04-03  361  
29042df3acdc736 Badal Nilawar    2025-08-21  362  	if (XE_GT_WA(gt, 14020001231))
29042df3acdc736 Badal Nilawar    2025-08-21  363  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
29042df3acdc736 Badal Nilawar    2025-08-21  364  				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
29042df3acdc736 Badal Nilawar    2025-08-21  365  
d6da81a4785ca6e Badal Nilawar    2024-04-05  366  	size = guc_ads_waklv_size(ads) - remain;
d6da81a4785ca6e Badal Nilawar    2024-04-05  367  	if (!size)
d6da81a4785ca6e Badal Nilawar    2024-04-05  368  		return;
d6da81a4785ca6e Badal Nilawar    2024-04-05  369  
d6da81a4785ca6e Badal Nilawar    2024-04-05  370  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6e Badal Nilawar    2024-04-05  371  	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
d6da81a4785ca6e Badal Nilawar    2024-04-05  372  
d6da81a4785ca6e Badal Nilawar    2024-04-05  373  	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
d6da81a4785ca6e Badal Nilawar    2024-04-05  374  	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
d6da81a4785ca6e Badal Nilawar    2024-04-05  375  	ads_blob_write(ads, ads.wa_klv_size, size);
d6da81a4785ca6e Badal Nilawar    2024-04-05  376  }
d6da81a4785ca6e Badal Nilawar    2024-04-05  377  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
