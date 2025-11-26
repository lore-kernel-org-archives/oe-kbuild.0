Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614111FCF41
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169281; cv=none; b=URTAl60SDl5EtPSG4SPDlShD4SM71JipEgaFTmPJ/uCUKn1xz/FHziI0j/UX6ATgAUDpx0TwTGU9SH4Hu82XeOdIiHukO4KUrY0UotwqZZJ9X9HTIhrFM+8Ae5l0nrEdeNYagfc7nV2YOziXjdABuUkKv4Z2wRgiGcYDWWxmcY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169281; c=relaxed/simple;
	bh=EpJ9UnQ/gtN0bXWjml0+mVdOVtdq3PzOgUcwHUz42c4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bn1ZLEooNTL5IskuE2y6ZL+Zgic1XusJinZ/xM+sgYMM0x4+iKR2n5Js/QL6s6DZesOZBhyO7pMBiSCDCOd1RMlWnKonMTjaGx2SG1SLX/RtnTPIH37eLH/mOCgY4/0l2SOxmG9hyYrkQc6D6zgDzqAjoaUmdUExx52g/0HWPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuKEi2EE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuKEi2EE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764169279; x=1795705279;
  h=date:from:to:subject:message-id:mime-version;
  bh=EpJ9UnQ/gtN0bXWjml0+mVdOVtdq3PzOgUcwHUz42c4=;
  b=BuKEi2EE/FV7O3fj0xcDasx/z3/+I1drkIoDOrFFO3IM7kulQ1rv4NzP
   73MKjOq8UpPmUzBbMOP6SUTEfbd8GvWG0MfJrigxbBORbIh0LmdX8BFIm
   9/CRGqKvjlmq8vMXHG4sJqzK/o0ZKxNEMwPKLpmfP5dKFR1kSivbFU8re
   Etqw/Aig3KVdeMVqWUuN9eGPHRIvAkE9YyOWOHF2swXlWst1wU9sTpATj
   gLgLNGNrJX5MIw+sKNGASPDKFRpoe+zp7NjaLFOIidcCcB0G+aTrDn1Qg
   xZ138mvoDeOscBZgy/RLGqDDk3TRudgW1K+qebHMmQKmSahjb/80iSJDw
   Q==;
X-CSE-ConnectionGUID: pVLzobigShevrQV57Xn0Nw==
X-CSE-MsgGUID: fiJSXmvfRnS2s4BcX9XF1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76833439"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76833439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:01:19 -0800
X-CSE-ConnectionGUID: JXCuZXZqQSObWw2lf3kvnQ==
X-CSE-MsgGUID: R/ckdXaSRAW3zgTAHM0x3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216320618"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 07:01:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOH1A-000000001FN-2512
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 15:01:16 +0000
Date: Wed, 26 Nov 2025 16:00:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 10/25] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202511261635.Qvy8vQZh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   dc427bc7b2db9a19cb1a7c2380e44fcda6314504
commit: d10483920c337d5f26c454446177f4fcf11e556c [10/25] xfs: convey metadata health events to the health monitor
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261635.Qvy8vQZh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#531: FILE: fs/xfs/xfs_healthmon.c:205:
+			if (existing->group == new->group){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
