Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741562F8BFC
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713276; cv=none; b=FlMkqx1t4Jyf0qo+G/kLtQttTdLlhyjS+YHaZSaOjobbKDA10fLsBv0NgZjhSq0KKBht0zZI24L4MPE5ra6liK85HJN1fnMO6IlZIRZdfpTi3/fy2p/yUjBCwcCK8BFiu+iFPJHiz0SFapBEnFhJu9jYzVnBWF9ur4/sCUfcFq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713276; c=relaxed/simple;
	bh=LQBjuQhDpCfr8m0R62XohjJd9IOGY+7IYR0/wQq2h/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1PDE8pESJHOuf4u8wd0Wsn+BWEFtGktVhYHOOrsUjt5A2gov/5G80VYya2l4taJ+endlZXDkR+mGQEpBwL/IV1zvXbNckKR0KmbT0a5EjRp6SFVveWfd/drN57d3thaYTr4xiL60x8sLtwVteWeMXbfttf+e/b7dHdtHP1w7DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbhoLu0m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbhoLu0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764713274; x=1796249274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQBjuQhDpCfr8m0R62XohjJd9IOGY+7IYR0/wQq2h/0=;
  b=lbhoLu0mQZqoj8QdZ7z3QNS7BcAKwHCsphhsSqLo1hitCxZp2YUr47Ns
   PTzaZmYSsOO8IVVDKsKbhhRFyP8ngB1HpsgWtmEvucSW+nFBA0JCp1krh
   4wqtG16jYKvvNVay6HXLR1X6NwpCIumtyicOc2jFBMPJdDkQ2FzGVI3LM
   DLi6vq7BG1rYLAB+MERx+bbkeGfPnCoHNpAF7Rs6y5gpN28kXDojIb9ny
   5GbGyVq/ns7o8G+xUd/Oi7jJzSxVrhTww5H8E+BW1Ru/rd4Ierp2/cuk6
   bSQkhDNYUj/d5mglQcDxcAp+HBnF98rZtX9ixNykeEoYfIi+0TvQZyTyQ
   A==;
X-CSE-ConnectionGUID: 0FvOz5OhROydSb5lYw90Fg==
X-CSE-MsgGUID: s3AxP0qISbSJvy9a5EbhJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84095831"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="84095831"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:07:54 -0800
X-CSE-ConnectionGUID: 4BLO4jQJRvWMw7pZlg5jRQ==
X-CSE-MsgGUID: j8M0+GRxQgqz9d7wSnJWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198676628"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 14:07:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQYXG-00000000AEv-37Xm;
	Tue, 02 Dec 2025 22:07:50 +0000
Date: Wed, 3 Dec 2025 06:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12113/13055] liveupdate.c:21:10: fatal error:
 errno.h: No such file or directory
Message-ID: <202512030653.3Q6AT5mw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Pratyush Yadav <pratyush@kernel.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 80bab43f6f235664fff2d3518b3901ba9c4ac5a3 [12113/13055] selftests/liveupdate: add userspace API selftests
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512030653.3Q6AT5mw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030653.3Q6AT5mw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512030653.3Q6AT5mw-lkp@intel.com/

Note: the linux-next/master HEAD 47b7b5e32bb7264b51b89186043e1ada4090b558 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> liveupdate.c:21:10: fatal error: errno.h: No such file or directory
      21 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
