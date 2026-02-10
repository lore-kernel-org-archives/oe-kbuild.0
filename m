Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E82E9729
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770698347; cv=none; b=r6L8RQv6qs8mFoDcknHEbIwLaFzdlyCzkhrRj7GiZOmtq0HFM+rH7+GT0Y1wisRN8vOlWA+zDbkKj3FNAM9xtVC5IAxscDXFhOUUEQi3e+PZCo5huQGuA2xcP7NXAsHdqEL34eZSplWUqVuflFdFNt++p9k1H/cq8TgZbULH8kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770698347; c=relaxed/simple;
	bh=/yI1j1/in9E5/nbSc+Hf2U28HCCzhzgPT/+ksvyGeQs=;
	h=Date:From:To:Subject:Message-ID; b=reYpegqYHo6m03s9Wjc/HifT+BJyDaBAv4dm8hvvIM1OzHTcX4wGkUBjHFQ45BvCPOHx0iYfa3aFgRFyXNq7vfB9uqKQk3DJ7MpyBA/Kfy4GfYUd3n1jgSnxlKPY63sdEDqmdY2fBpNV1VWk7r4W+Q02Ioqy7KiuKp7qOqe3qmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Haig5L2G; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Haig5L2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770698347; x=1802234347;
  h=date:from:to:subject:message-id;
  bh=/yI1j1/in9E5/nbSc+Hf2U28HCCzhzgPT/+ksvyGeQs=;
  b=Haig5L2GjVcS9K1NXpZTheCvA+6AURfDfWD5mzlzzaoGJkqjLLzATSdD
   1B50kiTfxHWpWJUKIN77sPABVQcbGqsel7EuMU3dblWpbUGBR2nj3Ityt
   xaEIWA3bvK/ox2X6qmZ9xwgYMbBFKxLmF02Vz5GsXSq8hzXQoe87xaEk0
   l6RwTapjN13sUI8+vmRGrIq0bClIRVB4Me8CQ09bHsFp11Ah1qZTbsmyC
   1c6mKBSs6/YNlWGCtIb5kYCu1Vkl6bShLCgYsdBSk63NcJFQOniRTm8h/
   ic2hNVyJRr5yPI3aG0gOygMYLD6SznzKObLdjTstiBsUlmIPyy+eUbV5J
   w==;
X-CSE-ConnectionGUID: rUIC9WmbSsmA0O5aODB//g==
X-CSE-MsgGUID: cU+/UI4FT622cz6u/Cj3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94461772"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94461772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:39:06 -0800
X-CSE-ConnectionGUID: g6ZZenR5TgeQeuCDmXa1AQ==
X-CSE-MsgGUID: 1JxQaczsQPm/Jtli3CNNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211827466"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 20:39:04 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfWg-000000000ZZ-2j1H
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 04:39:02 +0000
Date: Tue, 10 Feb 2026 05:38:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kdave-btrfs-devel:misc-next 1/19] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'by'
Message-ID: <202602100517.HnI6jMBj-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   459f5c410a7536ce8089c6da551124869dca4a79
commit: 2b6b9e5b88e29db778fe1d74592684a46479247f [1/19] btrfs: be less aggressive with metadata overcommit when we can do full flushing
:::::: branch date: 15 hours ago
:::::: commit date: 17 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602100517.HnI6jMBj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'by'
#239: 
and got deleted by by the cleaner kthread - when the abort happened, we

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
