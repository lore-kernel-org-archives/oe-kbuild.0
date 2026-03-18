Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832FF24503F
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 02:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799388; cv=none; b=KG5UJ+Hlx61SsQOQ7D5aDV2vg+r+qPHkWsndbenXKhzQbyWQC6DNLo8dThR86imcCBE5EAsZhrp2BEriQjHwmrBB1SWsvM2gnFey2DWttOcxUaOYPm730lk/5C90OiaRyieDkH4g00DBxoKD1w2yi6JBgRQuIlr6N85FtberbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799388; c=relaxed/simple;
	bh=lbby4siB665CLCcfAH0wmRPz4loSw5De+S0fhV4WFOg=;
	h=Date:From:To:Subject:Message-ID; b=NpoXTBH21BUomtTYxkG4DVCMH1f+A+80grHKKqH77jJrt8pb7e0gEsP3Q3JniWtHgXdB8VF101zso8Ijoov0AeU0nVO4cR8YsHWjygiFu1lPugi05NwdblyYdqY74AnjBXorNEVBWwZADwjQQqbxcqvsDKFgSTjZnI0YO34ozP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNz0csVj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNz0csVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773799386; x=1805335386;
  h=date:from:to:subject:message-id;
  bh=lbby4siB665CLCcfAH0wmRPz4loSw5De+S0fhV4WFOg=;
  b=DNz0csVjPTEehsI4VU6ZbpmHMVw98YXp8Cf1xyjmb5HJvITUi8g8Ov7C
   wLVmKQhV+QeN2oF8gj1+zwjfi3f8fEXUAFVIqaavrgNqfdrnYVaiU9J7G
   LOJvp4iEQhTh15opYocAWjZKlCgysqQ90fD2LVd9E0FsrN3GLCl6wrMBb
   BGHxBFl8c2emPlbdqYmrZ7e9z2aK3lF22Hv7EY/lm6jhJ+qoosvZuRkq/
   Ayp2qPYbt16lihxnUf9bgf4WyDRCo820zkWD5RB9+pN8mntstd3QMRfiv
   9ZT1R7UmQerjKGw3yKFg776c3mtbQYwvecQ6BiqyA0ZCDZOZRUNyKY3Uc
   w==;
X-CSE-ConnectionGUID: wG+vgX5CRymxkixYdsV3PQ==
X-CSE-MsgGUID: MnECatK8SGyESF2cC5RpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92231431"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92231431"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:03:04 -0700
X-CSE-ConnectionGUID: agNmsv3gRIeKONiH5LEGGw==
X-CSE-MsgGUID: pnIRkz5HT/mzOhueLQwwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221680490"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 19:03:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gFR-000000004Yb-18tO
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 02:03:01 +0000
Date: Wed, 18 Mar 2026 03:02:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-7.1/block 27/33] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Chaitanya Kulkarni
 <kch@nvidia.com> -ck', should be: 'Chaitanya Kulkarni <kch@nvidia.com> (-ck)'
Message-ID: <202603180331.YG9ghgOf-lkp@intel.com>
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
commit: fed406f3c1c2feb97adcbc557218713c5f7ec6a7 [27/33] block: mark bvec_{alloc,free} static
:::::: branch date: 32 minutes ago
:::::: commit date: 34 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260318/202603180331.YG9ghgOf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Chaitanya Kulkarni <kch@nvidia.com> -ck', should be: 'Chaitanya Kulkarni <kch@nvidia.com> (-ck)'
#9: 
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com> -ck

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
