Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026B2D12E7
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242815; cv=none; b=eokqW5y43wb1TQoTPaw6S6LRChxqRMls05EWoj6HxyUE03sX55uPDkb7TSPDWG0hAa+1M7sqMj+zSOq+2oQIKD/E/szwW3Cco3AdAv20N9I0A/8MOoDlnJ8yKx+hQHxsr9DlzPrURqs5YPRVa3OOjhB86k7s2EnqWip1HrviUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242815; c=relaxed/simple;
	bh=9pOBfH4KFW00X/divxj672OkREOAooG+Z+kDTHTCQP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pilt8uPsxi/E+b1G0FeZfklDDV6kfc6porilX8EFFwxVGSuJA8J1Qv5FBkfRGL4kZKAP+gkpTseif8eJ/RHRnuwjQgaaC4dm/xvtkax7XlWM0coEfoOQagR+bfn2rqLlsau3JIj0lfHTTTl0U9lkGHoos5JB87cHXJ99L/yW1eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zayn0dMi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zayn0dMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242814; x=1797778814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pOBfH4KFW00X/divxj672OkREOAooG+Z+kDTHTCQP8=;
  b=Zayn0dMiy10Pwyo+0LlXCe9/oew2VIKQYdDLYWjHV5dM+D8ku/ZsqCQ/
   RAQ/U410hvPxUlPuRAYa1Gq4ENsUqujrOmuxYpJZFfi9+9prBdgi9K93I
   8KZmRgtvwDka6IOz8Dib4SbDmqxSmyP0UQA6DM7KmTDIf6Kb40HUlb/ut
   Y+qnhbIENp+r+vgQc8hjFXqm135WfKIOAUFFd2pze65+Ee0JG/hL+6Yct
   LzP0RBywp1C2EWdLU7RP66NSYJfeexkHuvmY2qdn+0F2VmczIVLBAbk14
   A2anUkwEIYrIhNVPgG4qFhSwOjQKs+eZbLZzcMdYVdrhmzka2kVsjyxEK
   Q==;
X-CSE-ConnectionGUID: 58Fh3aCnQfuK5GB8GnU4+Q==
X-CSE-MsgGUID: Ff0/gxLhQqmWE8Htl8KTRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72034840"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72034840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:00:13 -0800
X-CSE-ConnectionGUID: WL2v035AQUqPSyGCDv0oIQ==
X-CSE-MsgGUID: yDKfS2H7R6ageDB5E+KgQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198360009"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 07:00:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyRF-000000004hj-0vx0;
	Sat, 20 Dec 2025 15:00:09 +0000
Date: Sat, 20 Dec 2025 22:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.19-rc 33/106]
 drivers/char/hw_random/mtk-rng-v2.c:72:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512202215.rsUnFKKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/char/hw_random/mtk-rng-v2.c:72:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: edf5e8dd69afe7f872590cb7767e73e619ca7bce [33/106] hwrng: add driver for MediaTek TRNG SMC
:::::: branch date: 22 hours ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r113-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202215.rsUnFKKe-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202215.rsUnFKKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202215.rsUnFKKe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/mtk-rng-v2.c:72:1: sparse: sparse: bad integer constant expression
   drivers/char/hw_random/mtk-rng-v2.c:72:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/char/hw_random/mtk-rng-v2.c:73:1: sparse: sparse: bad integer constant expression
   drivers/char/hw_random/mtk-rng-v2.c:73:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/char/hw_random/mtk-rng-v2.c:74:1: sparse: sparse: bad integer constant expression
   drivers/char/hw_random/mtk-rng-v2.c:74:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +72 drivers/char/hw_random/mtk-rng-v2.c

edf5e8dd69afe7 Daniel Golle 2023-01-25  71  
edf5e8dd69afe7 Daniel Golle 2023-01-25 @72  MODULE_DESCRIPTION("Mediatek Random Number Generator Driver (v2/SMC)");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
