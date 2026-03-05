Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600BF361DCE
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740489; cv=none; b=fYz8mVxW+wPF/SVV4VmsG7qh54qwMFEQj6bRXGBfs0OqP5YO09MlVT2l8sDXMApCiDlyfwO9ffUxRFtga6MhEyehZKPlAx+KMCrVJgP5c2K63s4lTRCu6MVFg7Bb0RiQopB59NBrIchLQ+ykcPu6cS3rLVMjazueXycXpSS4lPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740489; c=relaxed/simple;
	bh=IaQy2qMamkm/kKi5ZD6l6rf2iy6sz/TInOCwmnC2hvs=;
	h=Date:From:To:Subject:Message-ID; b=hs1SYmHk2Nqu0aubQHVg89guBVpETnWN8h6Bjh4RaO8bb9zsaehGg3bNoDvgSN/ph40PFfSC+m7Nlp4X1pHYB7zUmGGzgSAD4dBUigmzW3qJHPapbkE49kNZmJqUVNJ//yuRJHVVwRR0f3xJTKxL9X/2tMAAtkybDF9wBevJclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBgOedJ6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBgOedJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772740488; x=1804276488;
  h=date:from:to:subject:message-id;
  bh=IaQy2qMamkm/kKi5ZD6l6rf2iy6sz/TInOCwmnC2hvs=;
  b=PBgOedJ6g8lCBuz4ayWzBYZ20p5MGm7c2pFVM9jztH50YcTsuNhxKWMW
   gwUAwaWRmbmXO3rSGG2XpaTwi9o2Z0xNRtEaSL3h5DRqWLVxOCLJ2oFbC
   DTOl7RNUwimerkD1AKQknA/lYgonx5RFijRDGVEo6vla25ONEfPaD2/Qa
   HVGV/fDX3gByJakRr89tVq1u1JGihwnCkNwmPBcFYDOf/XkDjyPg6U005
   7zLlN9SJ9c0wI1lOqPlM+RkjcSryx08XtSXJ66KRSUc7oy6q/q7cJxLgu
   ZsCWUZHkvVsYw6v+dS9FcbRbTAKA5X3Ua5yxGOl+ZKoejzVLcdZumyrtT
   Q==;
X-CSE-ConnectionGUID: YM1xE9UaQbqBZWuNd9tqSA==
X-CSE-MsgGUID: 51kpafwtRcCJ6lOYf9lsbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73889556"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73889556"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 11:54:48 -0800
X-CSE-ConnectionGUID: dzefrLmASuOzsqT5ogQy0w==
X-CSE-MsgGUID: 102K4CyATwymYjM3LhNb7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="221642326"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 11:54:47 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyEmT-00000000247-0uFz
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 19:54:45 +0000
Date: Thu, 05 Mar 2026 20:54:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tnguy-net-queue:main 8/10] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
Message-ID: <202603052019.MCurzf4P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jamal Hadi Salim <jhs@mojatatu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git main
head:   cf440e5b40649d1ffbc6c4e33fef3223c7482897
commit: e2cedd400c3ec0302ffca2490e8751772906ac23 [8/10] net/sched: act_ife: Fix metalist update behavior
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603052019.MCurzf4P-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#16: 
[  138.425795][    C1] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
