Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BE3A1E7F
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766464238; cv=none; b=BKrGLGDl1Mg8kPXztUoR7PUUemBbEmgYXKDqLE9IijSzwDSnFpRA+4t2lwwBYqSS5OVz7kmeUImv4xJTOKnNjs/3jMlDmGRTpxblmiPLhKZF2yY1sl2eyUTPwW4+m8/bnUOkUKrJYhJbmvB3Df2TfJXrPI3xwcA70cg4z66kfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766464238; c=relaxed/simple;
	bh=VfbPCVJ/CeKthbVsqUhV/ECx17cdiMz6sUIlXDpcYGs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hs/9rZrTiotZcQZzcKQtH937Td3N761q24xynTvFKD3UGIZFeCgqq6V4xJL1k3kM4ltA8CARNyXnZwNjT+Pij83UD51kZZ7nMMjLKg4gbdC/sJ9p3BzckGL7Oxy5sUg75MS03KiRZ60g2mvBX5Ir0Ha2E+x7sVF65ABd/M7mzwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKwcszFL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKwcszFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766464236; x=1798000236;
  h=date:from:to:subject:message-id:mime-version;
  bh=VfbPCVJ/CeKthbVsqUhV/ECx17cdiMz6sUIlXDpcYGs=;
  b=gKwcszFLltMH/MlfKNAkslHZDkmTEkcbRz1mS2VMQZFKYaxIfSBgZnrB
   XaDosQjoxm84meUfXkBSmHWyed2T/JK2TVvPqbelKLipov7iRLXxPOEwa
   B61ExzFH6oadhzeqrhWL8Kfl17vITZpsdRwac8Dqj8TzwJILnCogGtNdh
   UcFsykMh/gP/w0XFm9onkhyE4FtHioUgU8Cz0P8/Ki6dKyRpOMxNdHbjA
   9vXffIh8GmnNEsgsSW158EgvAuWdNcfogZCC48nCzq1q2LN3Oun27vN3m
   Fm2jGuqvVKYe3Mv9MgqeYvNipPoIG2bVlqo/TOyuHP2sq0vgg234wnAIX
   Q==;
X-CSE-ConnectionGUID: TwhZmvggTcqmHaxXO4rRxQ==
X-CSE-MsgGUID: gEAZctiQR1mTiPJwoMe4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67510873"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="67510873"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:30:35 -0800
X-CSE-ConnectionGUID: bu/XSFgaSXqpZCdkZ1YtqA==
X-CSE-MsgGUID: HKNjxC5dRlq4frSH4+/Ysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199716739"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 20:30:34 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXu2a-000000005om-1nrG
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 04:30:32 +0000
Date: Tue, 23 Dec 2025 05:29:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 162/242] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'it'
Message-ID: <202512230504.yJOXizsG-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   6354e3da260793f90e3288781d8faf8af4807efb
commit: f10c3330c87c10694e3f8f83de099fb3ae7b0e47 [162/242] drm: apple: Prefer RGB SDR modes
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230504.yJOXizsG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#7: 
when it it would require DSC. For example 12-bit 4k 60 Hz YCbCr 4:4:4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
