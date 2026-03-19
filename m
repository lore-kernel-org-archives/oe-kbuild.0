Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D70364E87
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941671; cv=none; b=ienkg1QE5Il+oVldP7LzN9sO1KpBQwSEOu1RMDm1XF+bzN67pTp/23kkimMbyUb4rRzQVq3FxFK2M9Sq2KVDo5ldC9LT5m4C3/g7Mp1LMVPu8g8Q2ZXrM+LbW62XExLSc8KJB/jsISw/kf6LuZFFZCz7K2veTu8ue90stKx9okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941671; c=relaxed/simple;
	bh=MvnAdsYT+B/hSppNAUI0HPIKSwD+oJ71tsl7A1dvGSM=;
	h=Date:From:To:Subject:Message-ID; b=MmWw7yRTbfzJ8+8JsoMqkIguxXWlDyj06keXoxMcA0H4Ky9T1bVk+gNPDf3DIXZBwMXfxZjmCSow/mkGrOSvsXfPQfQwjdJmLmCAFAkA9yWBHA5yFnudSqWQyXEMo4frBkASs3y5Q+TWJDwKtZ8VAZhqZ5yhNeZ9UuiV2MMZils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQ8+tUmy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQ8+tUmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773941663; x=1805477663;
  h=date:from:to:subject:message-id;
  bh=MvnAdsYT+B/hSppNAUI0HPIKSwD+oJ71tsl7A1dvGSM=;
  b=mQ8+tUmyxqn0cz+SkavutMRcXPx3k4D3q94BGx0ByS3z64T2zc/H76sy
   E/u6+uOgqsWyfForPk4hx4qHY66WwmJJBvwRHLYo/+8INCju+w88j+W5d
   3OuYlbA/H2aZaT/Xcop6RYC+dSwSxl9fJFHYgUL55ufvHG4aKDKFnrzEr
   gRIeLYun2gq3jHGs1NcODqljOBxcIKN6xjnmvbEq6tTOVwcCSQa42uuZU
   uq4lvM5e5rAruJn9dDQSQW1mKeJL2TuyQUp5lXYTaoPO+4VVzR+Zg8daK
   J8JiBVk9WlqoTqpTrnMLqIa4UfZV3fkkh5D7eMHCMq7iKsPQnbOg+7IMu
   Q==;
X-CSE-ConnectionGUID: bTdtgZSaQomddxkdZVAN9g==
X-CSE-MsgGUID: 1jHvtFX3QgWmJW8yUFPuIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92596999"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="92596999"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:34:22 -0700
X-CSE-ConnectionGUID: ASgdTLaPQ4qw+GIbqv06pA==
X-CSE-MsgGUID: ATrVXPQ5Rl63pDylqyWXHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218915362"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Mar 2026 10:34:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3HGF-000000004sP-3u29
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Mar 2026 17:34:19 +0000
Date: Thu, 19 Mar 2026 18:33:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:locking/futex 7/11] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'both'
Message-ID: <202603191819.cFREXDi9-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0
commit: 091f92a56d090b913ee13d3acc5863793b6871ef [7/11] futex: Add support for unlocking robust futexes
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603191819.cFREXDi9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'both'
#64: 
    2) The gaming emulators use both both 64-bit and compat 32-bit robust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
