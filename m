Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2343128B8
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147980; cv=none; b=sXXB9qcojBPqpgfdd58YrMknn467Ge5/pRI/OhxuTwaEWsOGVwlbSZAGNILD3zemak+tOxpT0dmRjvhtFNBPvHAt9UD6u/pmvfWI+dV4e6Gkdr1/qjUNOQntly6Va/dsrjdbFdI6NuG3+PB7g/CWwWSi6xJbFkXMseBdiNnaogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147980; c=relaxed/simple;
	bh=Kn0OFHxKQJ/Hhp3kIdeKO3vrHoNMef2FyQAyLcm/Iwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YXXOo3vkZd+2QaYCTs/8QDIi2RQgvzuQ7tgpg2V/1/0ninW+Mqw4TKdYAGv3pze7txrQjIqJ6xcCEiYXyCPYxUjmbJsRzSQVL5OosdssFVt9zlkhEb1my8D/ToVbz64kDu6+w3npuZ3eA+7BfhTfXc2O3BohUHVfwLvm/6EtOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLzit1cC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLzit1cC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782147980; x=1813683980;
  h=date:from:to:cc:subject:message-id;
  bh=Kn0OFHxKQJ/Hhp3kIdeKO3vrHoNMef2FyQAyLcm/Iwk=;
  b=ZLzit1cCBSacjfNON8+qrKn5mmTv+hUf2W57K/a2wbIUW2RMYQVGCkm1
   4nxH2BvyColQ4gj61hc8JT93/sa8XeslYxBcuIGijqPH4iERrOc4GmaIM
   8dh6pFv/F5DtvozHpTrtzQ16gQvm89ieeLsofZJM/HY955Cl9BKX5iSyc
   8N+SC0HCqU21IZm/WIvMjMOZlqeDWsGyZ724g2if+0XXe3C5OqV3fGbfd
   ARLoyd1NJiaGQj3VtHgcwbdMeqYkTeSKzO4U/WYhyoHltnPyG4Scin+xg
   Ku3NST8wfBemyOtMlUbt+TYs2ifUpos7NeS6j59RybcT1xh3TJotZKs63
   g==;
X-CSE-ConnectionGUID: 2CmIXpnBTBWi2G8Ztnmw5w==
X-CSE-MsgGUID: XccezyWiSriJV2g551S1Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94382563"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94382563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:06:20 -0700
X-CSE-ConnectionGUID: 5TPXXHeLRHOaCA5Avfmnzg==
X-CSE-MsgGUID: Y1uafSsvSr6z8GyZ72EAxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="287403696"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2026 10:06:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbi6A-000000001ae-0wFG;
	Mon, 22 Jun 2026 17:06:14 +0000
Date: Tue, 23 Jun 2026 01:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/list_lru.c:24 lock_list_lru() warn: mixing irqsave and
 irq
Message-ID: <202606230158.lNayikk7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johannes Weiner <hannes@cmpxchg.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "David Hildenbrand (Arm)" <david@kernel.org>
CC: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
CC: "Liam R. Howlett (Oracle)" <liam@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 1479b44c7203b2cad3393533c64aa16d42056310 mm: list_lru: introduce caller locking for additions and deletions
date:   2 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r072-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230158.lNayikk7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1479b44c7203 ("mm: list_lru: introduce caller locking for additions and deletions")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606230158.lNayikk7-lkp@intel.com/

smatch warnings:
mm/list_lru.c:24 lock_list_lru() warn: mixing irqsave and irq
mm/list_lru.c:35 unlock_list_lru() warn: mixing irqsave and irq

vim +24 mm/list_lru.c

c0a5b560938a0f2 Vladimir Davydov 2015-02-12  17  
1479b44c7203b2c Johannes Weiner  2026-05-27  18  static inline void lock_list_lru(struct list_lru_one *l, bool irq,
1479b44c7203b2c Johannes Weiner  2026-05-27  19  				 unsigned long *irq_flags)
bc7adb3b3f6ad3f Johannes Weiner  2026-05-27  20  {
1479b44c7203b2c Johannes Weiner  2026-05-27  21  	if (irq_flags)
1479b44c7203b2c Johannes Weiner  2026-05-27  22  		spin_lock_irqsave(&l->lock, *irq_flags);
1479b44c7203b2c Johannes Weiner  2026-05-27  23  	else if (irq)
bc7adb3b3f6ad3f Johannes Weiner  2026-05-27 @24  		spin_lock_irq(&l->lock);
bc7adb3b3f6ad3f Johannes Weiner  2026-05-27  25  	else
bc7adb3b3f6ad3f Johannes Weiner  2026-05-27  26  		spin_lock(&l->lock);
bc7adb3b3f6ad3f Johannes Weiner  2026-05-27  27  }
bc7adb3b3f6ad3f Johannes Weiner  2026-05-27  28  
1479b44c7203b2c Johannes Weiner  2026-05-27  29  static inline void unlock_list_lru(struct list_lru_one *l, bool irq_off,
1479b44c7203b2c Johannes Weiner  2026-05-27  30  				   unsigned long *irq_flags)
82d8bca1c715e9e Johannes Weiner  2026-05-27  31  {
1479b44c7203b2c Johannes Weiner  2026-05-27  32  	if (irq_flags)
1479b44c7203b2c Johannes Weiner  2026-05-27  33  		spin_unlock_irqrestore(&l->lock, *irq_flags);
1479b44c7203b2c Johannes Weiner  2026-05-27  34  	else if (irq_off)
82d8bca1c715e9e Johannes Weiner  2026-05-27 @35  		spin_unlock_irq(&l->lock);
82d8bca1c715e9e Johannes Weiner  2026-05-27  36  	else
82d8bca1c715e9e Johannes Weiner  2026-05-27  37  		spin_unlock(&l->lock);
82d8bca1c715e9e Johannes Weiner  2026-05-27  38  }
82d8bca1c715e9e Johannes Weiner  2026-05-27  39  

:::::: The code at line 24 was first introduced by commit
:::::: bc7adb3b3f6ad3f1cf8a030be0034f61e7580fe4 mm: list_lru: deduplicate lock_list_lru()

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
