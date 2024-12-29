Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1DA2A1D1
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 06:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735455247; cv=none; b=DR5pGRAiKmWH0SNP5mQOhCfNfW+dAA2H/4Nc93cETF1vECqFTHb0k4f/49XtFOIGJfaA05417YUOldOvHH8dMl4VNZ7RuYqhRj1/QdUYIUUy0ezzafOQxUHzot0xwXxtix12gW5ibhDw/ORcQEDN03zwJr/4kwETCBG/+DwUDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735455247; c=relaxed/simple;
	bh=XGwLlMPspvW/EwRdB5Iu1AIbI9U9akgVPwWy4wqExME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZfYlSZFiov/pyV34soBY1IpB+tAhIubq8Ess3ZczMYokmhaVHx4AR+pwLn46prk2Jrs6IpxmVj88ZDdZEpr0fTaTsUfj0yyTfRksWdb5Fns0iKsSbFoE0SDF9jWfsTKI7D/ADuA9JSZuojH8d/A8F7SaXimZuRt4lD/Z1bLDTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BulV0B7h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BulV0B7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735455246; x=1766991246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGwLlMPspvW/EwRdB5Iu1AIbI9U9akgVPwWy4wqExME=;
  b=BulV0B7hKxZGlHbe561jXf5O2Xf4UCEmscTHwCcgMoomgwCPRpluY26g
   zAmsChCavu0aTx10mMlgpTuMxOWxtAgadLWlJXn+8U+FAvR2w8yqRd/w8
   3R1rWBnHiGfVeUiFFCGNPIlQL2gCJ4YuudWqBwJ1DaI6Dv/tLTT/tf2jj
   Tfm7qhadCOmTwACCKdJEdjQ1WEKRfhS0FzCe0KDLgGgynYbR7mtUnEJFn
   Hb2gAD40zbq5casbS9Xr7Nc+H9hnW52FNKlU5JF6bO8KORAyKYC3g8Yec
   0ZRAum1blvpqZRhxyVYPzms2FvQaF/hbtOcBnxHdV1M57nXr4F6cnzaoS
   A==;
X-CSE-ConnectionGUID: tq77kIXATjWXhJhZJDjbKQ==
X-CSE-MsgGUID: Lq648irqRyOwj/hT+LhWEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39466494"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="39466494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 22:54:04 -0800
X-CSE-ConnectionGUID: wjc+BZ5XTkyYRt/6D7zBog==
X-CSE-MsgGUID: 43kjP+iiTlOjyzOmWa/pVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="105358269"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2024 22:54:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRnBX-0004Xc-2e;
	Sun, 29 Dec 2024 06:53:59 +0000
Date: Sun, 29 Dec 2024 14:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/list_lru.c:82:3-9: preceding lock on line 77
Message-ID: <202412291412.V6hWnUnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: fb56fdf8b9a2f7397f8a83dce50189f3f0cf71af mm/list_lru: split the lock to per-cgroup scope
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-054-20241229 (https://download.01.org/0day-ci/archive/20241229/202412291412.V6hWnUnx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412291412.V6hWnUnx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/list_lru.c:82:3-9: preceding lock on line 77
>> mm/list_lru.c:82:3-9: preceding lock on line 77
   mm/list_lru.c:82:3-9: preceding lock on line 75
   mm/list_lru.c:82:3-9: preceding lock on line 75

vim +82 mm/list_lru.c

28e98022b31efdb Kairui Song 2024-11-05   62  
28e98022b31efdb Kairui Song 2024-11-05   63  static inline struct list_lru_one *
fb56fdf8b9a2f73 Kairui Song 2024-11-05   64  lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
fb56fdf8b9a2f73 Kairui Song 2024-11-05   65  		       bool irq, bool skip_empty)
28e98022b31efdb Kairui Song 2024-11-05   66  {
28e98022b31efdb Kairui Song 2024-11-05   67  	struct list_lru_one *l;
fb56fdf8b9a2f73 Kairui Song 2024-11-05   68  	long nr_items;
fb56fdf8b9a2f73 Kairui Song 2024-11-05   69  
fb56fdf8b9a2f73 Kairui Song 2024-11-05   70  	rcu_read_lock();
28e98022b31efdb Kairui Song 2024-11-05   71  again:
28e98022b31efdb Kairui Song 2024-11-05   72  	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
fb56fdf8b9a2f73 Kairui Song 2024-11-05   73  	if (likely(l)) {
fb56fdf8b9a2f73 Kairui Song 2024-11-05   74  		if (irq)
fb56fdf8b9a2f73 Kairui Song 2024-11-05   75  			spin_lock_irq(&l->lock);
fb56fdf8b9a2f73 Kairui Song 2024-11-05   76  		else
fb56fdf8b9a2f73 Kairui Song 2024-11-05  @77  			spin_lock(&l->lock);
fb56fdf8b9a2f73 Kairui Song 2024-11-05   78  		nr_items = READ_ONCE(l->nr_items);
fb56fdf8b9a2f73 Kairui Song 2024-11-05   79  		if (likely(nr_items != LONG_MIN)) {
fb56fdf8b9a2f73 Kairui Song 2024-11-05   80  			WARN_ON(nr_items < 0);
fb56fdf8b9a2f73 Kairui Song 2024-11-05   81  			rcu_read_unlock();
28e98022b31efdb Kairui Song 2024-11-05  @82  			return l;
fb56fdf8b9a2f73 Kairui Song 2024-11-05   83  		}
fb56fdf8b9a2f73 Kairui Song 2024-11-05   84  		if (irq)
fb56fdf8b9a2f73 Kairui Song 2024-11-05   85  			spin_unlock_irq(&l->lock);
fb56fdf8b9a2f73 Kairui Song 2024-11-05   86  		else
fb56fdf8b9a2f73 Kairui Song 2024-11-05   87  			spin_unlock(&l->lock);
fb56fdf8b9a2f73 Kairui Song 2024-11-05   88  	}
fb56fdf8b9a2f73 Kairui Song 2024-11-05   89  	/*
fb56fdf8b9a2f73 Kairui Song 2024-11-05   90  	 * Caller may simply bail out if raced with reparenting or
fb56fdf8b9a2f73 Kairui Song 2024-11-05   91  	 * may iterate through the list_lru and expect empty slots.
fb56fdf8b9a2f73 Kairui Song 2024-11-05   92  	 */
fb56fdf8b9a2f73 Kairui Song 2024-11-05   93  	if (skip_empty) {
fb56fdf8b9a2f73 Kairui Song 2024-11-05   94  		rcu_read_unlock();
fb56fdf8b9a2f73 Kairui Song 2024-11-05   95  		return NULL;
fb56fdf8b9a2f73 Kairui Song 2024-11-05   96  	}
28e98022b31efdb Kairui Song 2024-11-05   97  	VM_WARN_ON(!css_is_dying(&memcg->css));
fb56fdf8b9a2f73 Kairui Song 2024-11-05   98  	memcg = parent_mem_cgroup(memcg);
28e98022b31efdb Kairui Song 2024-11-05   99  	goto again;
28e98022b31efdb Kairui Song 2024-11-05  100  }
fb56fdf8b9a2f73 Kairui Song 2024-11-05  101  

:::::: The code at line 82 was first introduced by commit
:::::: 28e98022b31efdb8f1ba310d938cd9b97ededfe4 mm/list_lru: simplify reparenting and initial allocation

:::::: TO: Kairui Song <kasong@tencent.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
