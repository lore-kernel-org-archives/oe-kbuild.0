Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6C3C17
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 00:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768176323; cv=none; b=u1OgwPgAnEi0aZlOAxDJ++sSLRId8zPD543MERXL9kkG9rUZkDGZ4QAuQQN8z82nN5uoGloYHLKd7n84QpqaTJpgWhvGG70o1n/QBfKOeNO0N8GIbFaX67J3T3jYq77egYc/qQ2UuGU9UUNwAe9m5dEkv0jlLVlJgNAXi1RM7Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768176323; c=relaxed/simple;
	bh=Nj5QX0j63iHxhB1qWh7LWG8wapJPkk0zRtJwnGTFpEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LCZffAZLCoMqnuFHPYMj3Un1FjZXX8p55LPqRqt/5yGbM2HftY/8SDFRG6g5EkCB7SwqEFl2+Cweq4FbOzkzqhfhPG3N68SeM8aGfHt3eZcgHoiURIqxWKE+y43svLmGez0NfqcTqjy4brdMIv0ZNAy8Tu+RsT7lCWHIqX/A1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMWrLOvU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMWrLOvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768176322; x=1799712322;
  h=date:from:to:cc:subject:message-id;
  bh=Nj5QX0j63iHxhB1qWh7LWG8wapJPkk0zRtJwnGTFpEs=;
  b=TMWrLOvUtN6uL2q61F4w/GQD0mpFFT3ZOsTj+12JH3frLvav9xViHcEx
   pRSPXNxvpc5rwd1nGzZMsqQa7XNQD8UhkPDfK28RRHd8v3HiTH4WceLFs
   ptaDgHikV7eKAfF+ktYRP/W86s1sjWPR152Sh2GP1fqueZWNCApNTkjZH
   ocmJEPU+3m7c8EckNrNkdNXU0L2rAZLfGOaS7eDSHMgZHGpXYrRmDbVw8
   gTrKxSHClwhfwRRp8dGcYTPL/ywevPaEAIQu4u0tY3MCIUOsAT4EWwRbj
   6AxGfwnvrDE/rsoypno/xioeqVltFXaI8k4kjthnP5UcAQZW0FjpmVtVU
   w==;
X-CSE-ConnectionGUID: 7u+edTXtQpyL08Nm1r7vTQ==
X-CSE-MsgGUID: py5m0sAZRuSvu1ODu70P5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69353568"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69353568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:05:21 -0800
X-CSE-ConnectionGUID: mB941aO1TT2NjuAapQ6AbQ==
X-CSE-MsgGUID: lFL3n55kQo++4mfX0nADAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208093431"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2026 16:05:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf5Qs-00000000CnI-0eb1;
	Mon, 12 Jan 2026 00:05:18 +0000
Date: Mon, 12 Jan 2026 08:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/swapfile.o: warning: objtool: __do_sys_swapoff+0x24c:
 unreachable instruction
Message-ID: <202601120734.QdXu2ETa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Kairui,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: 9a0ddeb7988095a5c21994c37005a45b240039ef mm, swap: hold a reference during scan and cleanup flag usage
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260112/202601120734.QdXu2ETa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120734.QdXu2ETa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120734.QdXu2ETa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swapfile.o: warning: objtool: swap_count_continued+0x174: unreachable instruction
>> mm/swapfile.o: warning: objtool: __do_sys_swapoff+0x24c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
