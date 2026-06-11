Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF151BBBE5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 23:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781220003; cv=none; b=alGSLQRZi0lx5mrrbHeaGB/4toq1dOxjqcg2ACY6ufDvTAlt3RPwExFTZffXJzCRAEBetCozuP+JHVElCJCJ/9Vu2KKsb4mE/eNNk0oWdSU2hkbnP5EjM81Vw2kkerj5C5YoFWQrcAEpwuzLCXoyAgY8DzPcCWM7RBeYXtxH3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781220003; c=relaxed/simple;
	bh=GzNT1DmUYxdLpNpO0wTqmA0K2Yc7cDw3AAXdAX8aqs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bfvedj88JfXTLehgtmmMsOD05E1HHg+QXMTNrsVst0CiXaeNpNz2TD+2n8ZIADIriVfc05cNlPiYJIJvA9ggK/5mskOr/dJ8Sm7DmKQg8k4bnbv9WDh6AU3eAc9vLXlNnodscgXjt1V/7UvOi0MuhMR6B13vA4ajrE3QJJO0QGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyvD82T3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyvD82T3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781220001; x=1812756001;
  h=date:from:to:cc:subject:message-id;
  bh=GzNT1DmUYxdLpNpO0wTqmA0K2Yc7cDw3AAXdAX8aqs8=;
  b=OyvD82T329KyKvQwBBzy5MS9AlylJJntQO+hFf/bWLbQNAwAUqW+5wc1
   X/L1zd/CDrbKqLfM0xB0MZ0tZ86aT4hRxRokBwlrlCBJKg6F0a0AsCHCU
   DkcXxVaNkdSBY7mQ6rPJRKhqCX2nv1qifo4q8OVKyKpp0MsQuPNXWE7bF
   pQf5uFBZWUs9S5LX1NcMBAQfrlxq8lNMVBMQaNi5+0pcdK1nDyRarNzSx
   u81ha/4/E+QvOVnjKK9VVtsx73ISHoP1jhEmuL94WWA9wE0F/4vT4CYBF
   Ry6J/aw8CX0+BSRcPNs6cQbij0N/7h9ueEyB2ItYFDuOxE5lmSn4Pyt2L
   g==;
X-CSE-ConnectionGUID: 7gI2jEm5QSiycTA+XN0T8w==
X-CSE-MsgGUID: py1H9a0FRe27+B1B56AU3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82091845"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82091845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:20:00 -0700
X-CSE-ConnectionGUID: eVzN3PnxRJWdktp7k34zFg==
X-CSE-MsgGUID: hLu59cLdSdWWZkmdWRNWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250919990"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 16:20:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXogn-00000000O0H-0dj3;
	Thu, 11 Jun 2026 23:19:57 +0000
Date: Fri, 12 Jun 2026 07:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/core/skbuff.c:589:22: warning: variable
 'skb_data_buckets' set but not used
Message-ID: <202606120720.FsvcWEL3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pedro-Falcato/mm-slab-add-a-node-track-caller-variant-for-kmem-buckets-allocation/20260611-204922, commit: 5c968129b45a089923aa587d58e745bb77960216"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Pedro Falcato <pfalcato@suse.de>
CC: 0day robot <lkp@intel.com>
CC: Kees Cook <kees@kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pedro-Falcato/mm-slab-add-a-node-track-caller-variant-for-kmem-buckets-allocation/20260611-204922
head:   5c968129b45a089923aa587d58e745bb77960216
commit: 5c968129b45a089923aa587d58e745bb77960216 net: skb: isolate skb data area allocations into a separate bucket
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: um-defconfig (https://download.01.org/0day-ci/archive/20260612/202606120720.FsvcWEL3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120720.FsvcWEL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606120720.FsvcWEL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:589:22: warning: variable 'skb_data_buckets' set but not used [-Wunused-but-set-global]
     589 | static kmem_buckets *skb_data_buckets __ro_after_init;
         |                      ^
   1 warning generated.


vim +/skb_data_buckets +589 net/core/skbuff.c

f450d539c05a14 Alexander Lobakin 2021-02-13  588  
5c968129b45a08 Pedro Falcato     2026-06-11 @589  static kmem_buckets *skb_data_buckets __ro_after_init;
5c968129b45a08 Pedro Falcato     2026-06-11  590  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
