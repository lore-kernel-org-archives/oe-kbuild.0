Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3F326945
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 19:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319410; cv=none; b=SZBA0uHCZ7PcW5+1AppzX+0qLMJrmw70SEU7Q0LqnI2rq+Qvphbr9KVRbi/JFTBZWRHMcnCngtggFOVnygaB1kUvHZRLim4tKlPAclMUnSjmswExwDugr7AFcZSW7MYhHiWX7uGsgMsQhmC9TvppGdoZrhUmzWhQUcPkis+PbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319410; c=relaxed/simple;
	bh=hd4I1qqqaPZYw6xsLh1zlufPbwF4fvP0mZiSFpvws4U=;
	h=Date:From:To:Subject:Message-ID; b=bwMHK6mMCCBXl/pcnLpJpVwqAr0f64Sm1oAoBNzUS+P0qflsgx3ZOWWSFSP/XBj1W9/az/0XHZGMtROP2Pn6ES+J1EOWlvYDAXteqcGb+Y69uhD7XLpyQlZs0eMlX2d6KUT1Ly1bwr7Hedm1hXREg/7jcy73h+VE2ZRXrnyGCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iu1HktoN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iu1HktoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770319409; x=1801855409;
  h=date:from:to:subject:message-id;
  bh=hd4I1qqqaPZYw6xsLh1zlufPbwF4fvP0mZiSFpvws4U=;
  b=Iu1HktoNMmn92ArbMmAtY4Q0iafD5dWulrF5LQ04/+bl82tzC2nfsc6v
   lt925cs/4eG7Lz8as7Ym3U6Zyd32kUEFXfAJD+9TmJdfNJt9GghX5jaAm
   k8NPmoYt5PmMM0DhnfO7vQpS7tuG+11VdgtXfcBTTSTz7ofT0ng+rmpqw
   jiTCHI2dcTwvD9W7Uk+EYXQ/uYhC1pYk3dLv25BRucG1FHWVMT/FmErnn
   VZkSLxuEGXro0djVxUWtWKFkkqDcyOXK5mK0KYckNZ5X2BfT3wQL/WHCf
   lR+cb0m7XWZTQSIglfawUFo0ap5mu0K6a4+2iXA97qHVmUVeId9aNGXxs
   A==;
X-CSE-ConnectionGUID: MLhCHF+8Rsq3t9/n5bjOeA==
X-CSE-MsgGUID: FrGVue9WRCW1qO9O9qL39A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75381369"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="75381369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 11:23:28 -0800
X-CSE-ConnectionGUID: 0Pdr5I87TBaRI3ADrRl4lw==
X-CSE-MsgGUID: ejpkKjBtSQuDCUSs4G8QhA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2026 11:23:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo4wo-000000004E1-0I5J
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Feb 2026 19:23:26 +0000
Date: Thu, 05 Feb 2026 20:22:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:alice/vxlan-bigtcp-part2 21/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
Message-ID: <202602052025.8DHv6n6Q-lkp@intel.com>
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
TO: Alice Mikityanska <alice@isovalent.com>

tree:   https://github.com/cilium/linux.git alice/vxlan-bigtcp-part2
head:   e5d87a097a4f6b12671dd00264d72825403fd439
commit: 3900e648284f5c1f2963df75c3f70a1b979f4265 [21/23] vxlan: Enable BIG TCP packets
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602052025.8DHv6n6Q-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#21: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#32: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#45: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#56: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#79: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#90: 
    Socket Socket  Message  Elapsed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
