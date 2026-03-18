Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6E23EA85
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 02:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799387; cv=none; b=k21oWjJ3lbn8j0ojQjp5vF8FWo/+IoAHmE3eF6fzAKDmjUzLhfCbqlrLIjpXIE6hP2uWmbsEsVO+98Ygk+nPQwJ8v8RL/u2uGq/MYB5/IRJ6l65b6MrUJ+51NGkebK8VVRyYynqlwa3kvHeyc6lO/bAjMMQZiWs/8cBfWVK/JXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799387; c=relaxed/simple;
	bh=jRoExH4z73l05+AFOpLYnUdtNk2ZfyXQwtNikbaq/fQ=;
	h=Date:From:To:Subject:Message-ID; b=LfgwvHQ/aDrNcCee/NTHoBvnBfZTCEEoa/JWXrCkoH0FZ2roX4rR1m8V3mm0sLTHsLAV4hf1rkqWt7X2cWXHekcC2fcJvY0UvzMOVDqftBSyeoqeDRNJux4p/bbktStbv93iOcYvCCR64lvE03orfHHXgbwiUq4UHWTVD8WjjvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fh5RYxLX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fh5RYxLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773799386; x=1805335386;
  h=date:from:to:subject:message-id;
  bh=jRoExH4z73l05+AFOpLYnUdtNk2ZfyXQwtNikbaq/fQ=;
  b=Fh5RYxLXPEyr9Vs77RremQJYMOZddSo9tFRumAftMnTcWtt4ABurfdQS
   3cMeWMc+btD24mb9/mmncnFvecIlvt6eHV559+1v9pt7ptLOh1QO9kMKa
   RaBT1iAUbsXHTn9Y2oIIlR4HyP2eDAdpAClewqPbURzLLaDYUgPUKiEFT
   mJS89hmPCyK6l/jS4j01ST8N0ZNoToHi/7LJb5bdhCVS7Cj3DVdPjSloA
   Rp2bJuVWLmKxtQvwJMY1I1ajc8TBXA6PETvMJGs6pmtL+hPbTCT9kzT/n
   p+oF46aHKeAY1alNE0a5HytyPpEJZ5FizKNhFTues7V5fsD6k6m6h6zpU
   Q==;
X-CSE-ConnectionGUID: 09cK58mjR8qhzmsbhfeAoQ==
X-CSE-MsgGUID: VdAp9w/YTpa1rxfa1b+B1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92231429"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92231429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:03:04 -0700
X-CSE-ConnectionGUID: 32zt0wgvSbuwO+UgKa2imA==
X-CSE-MsgGUID: iL+Gg8GBT86h32g6JehXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221680489"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 19:03:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gFR-000000004Yd-1NFs
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 02:03:01 +0000
Date: Wed, 18 Mar 2026 03:02:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-7.1/block 28/33] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Chaitanya Kulkarni
 <kch@nvidia.com> -ck', should be: 'Chaitanya Kulkarni <kch@nvidia.com> (-ck)'
Message-ID: <202603180341.cHwhwjLb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.1/block
head:   3141e0e536b43ab3555737cb2ee6ea1ed0aff69f
commit: b520c4eef83dd406591431f936de0908c3ed7fb9 [28/33] block: split bio_alloc_bioset more clearly into a fast and slowpath
:::::: branch date: 32 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260318/202603180341.cHwhwjLb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Chaitanya Kulkarni <kch@nvidia.com> -ck', should be: 'Chaitanya Kulkarni <kch@nvidia.com> (-ck)'
#15: 
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com> -ck

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
