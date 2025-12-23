Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05222DFA5
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482344; cv=none; b=EZz2oK+SpSxks/y7FpfV+SpurnZJUXylp1n6ZHFbNopaMrSmZhxZ3IWTBJ/ePt4FRp+d4D9M1GPNK2wK6tCLSjetGCQL8Mo7OdKWCMTA4GaV8XVPFJMW+vFnUr+IDfRV4ayjwPGCYDfjKwjlhxAwp5vST6nheCUp0pPlvBq9wIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482344; c=relaxed/simple;
	bh=BVdEeGQwgBWmtNIHdt2YrVMwTMkc41slLvGrPZ0nwJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GZNEQx6U0de5BRZb6v98xP+n9IJ31Z/KD8trKmaiHM3PWBCaHTipt4KNQPeGyC8xVtXJQTo0q8h9XilK3HStAWyzlU3atHJK2v7Bs8bt0+kZriRWnoD2nLSNsXZ6HRw9Ch48QzbgkjKNGtXqJJ0rtRvJIdWi7hEttEG+9UvWKEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIeVUbl3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIeVUbl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766482342; x=1798018342;
  h=date:from:to:cc:subject:message-id;
  bh=BVdEeGQwgBWmtNIHdt2YrVMwTMkc41slLvGrPZ0nwJs=;
  b=BIeVUbl3shOXmXTY6dJPSGnc57rrGhT1sg0JFzCnK/6Io+9W0wvqgstL
   8z8NQPErFYOLzs+p8mJixmuze1om8iv9xEsvbmdPiIukVEXmoc75hpZ1P
   Q2pEt7wdz9Ibkom1Wdm9SOWm1yRjuVnxJN/RzNHwgQBcCXalSvsjtuqYD
   ufg8tNEfvwwDf6OEEgvBtqNrogdMTIk7s9PauIExHUuCtqmFLTtIE5Bbn
   BSeYC3uafAFmzNLV+gRNwZ11pNopj5FzadKVU9/vgVs7iCbnVzaq/S0Tt
   NfOeeKfUmx3RNvyG1PVJJYswbUTLRl268bs4K9D6zKMwhaAUk2qxHjkcK
   w==;
X-CSE-ConnectionGUID: 1SmSvDfaSYCFYUx+M987Tw==
X-CSE-MsgGUID: u6aXzNWMTLWzc4kq20EXqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68268298"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68268298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 01:32:21 -0800
X-CSE-ConnectionGUID: XIqEIZY2QQOLklxTl2f0hw==
X-CSE-MsgGUID: xIWS79HHQ+GnxAap9jybpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="230762547"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Dec 2025 01:32:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXykc-000000001gv-0pU8;
	Tue, 23 Dec 2025 09:32:18 +0000
Date: Tue, 23 Dec 2025 17:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [glemco:staging_rv_hybrid_automata 14/21]
 kernel/trace/rv/monitors/stall/stall.c:21:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512231714.IDrHS2WU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/rv/monitors/stall/stall.c:21:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   4ee25b194d8ceffecc62e47ef7825e84ff983e2b
commit: 6315fa21beda07ebf6d7f0d1941667bede69fa24 [14/21] rv: Add sample hybrid monitors stall
:::::: branch date: 18 hours ago
:::::: commit date: 22 hours ago
config: openrisc-randconfig-r133-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231714.IDrHS2WU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231714.IDrHS2WU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512231714.IDrHS2WU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/rv/monitors/stall/stall.c:21:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/stall/stall.c:21:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/stall/stall.c:148:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/stall/stall.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/stall/stall.c:148:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/stall/stall.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/stall/stall.c:149:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/stall/stall.c:149:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/stall/stall.c:150:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/stall/stall.c:150:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +21 kernel/trace/rv/monitors/stall/stall.c

6315fa21beda07 Gabriele Monaco 2025-05-13  19  
6315fa21beda07 Gabriele Monaco 2025-05-13  20  static u64 threshold_jiffies = 1000;
6315fa21beda07 Gabriele Monaco 2025-05-13 @21  module_param(threshold_jiffies, ullong, 0644);
6315fa21beda07 Gabriele Monaco 2025-05-13  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
