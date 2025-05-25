Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB54A1D
	for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748175468; cv=none; b=fCkgIeIaFCoAlLXK2eGMeewjU4RDwHg754xosCH6154qQRv24+fJwXJcFHD59EC/40WE7CIvTMQMv87HLQYAKBbsPVpGgyLWNKYWWNKtZpjycwAa+bXvqqSvpHSCSsf1ruZaulLWZ+xEID6Uzj7A6rDXPZxVW/53WLC1EFMaLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748175468; c=relaxed/simple;
	bh=kep7xvBcyDUiqeDPXm4cypzzdNIuCnrQ2OiuJG9lugY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihl6SN++ASbIehm54l/8ItUAJcF/60Rd62pHDDEUoszaCm1uQF4U+Mj4k1kWZADGTXysesmN6+ywmnooenNZV49/0oJIXrO+SrbMytLg2rECNDd0UwLmQfUO6cr0/S/VjMxCj/rItzWOvBMwY5vaDvSz7bhMcsc2KgAMoBNR3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPVdGVKM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPVdGVKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748175466; x=1779711466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kep7xvBcyDUiqeDPXm4cypzzdNIuCnrQ2OiuJG9lugY=;
  b=kPVdGVKMoW8XO+IxwGOFFQor25LyJPJepzsCGlJvvmXni+2LzGJG8HtS
   lhp1B0IL0YzKRsbhV0qg886kFe5BMw2Zx1B0QMhkT47IsR57rR5EOcKzP
   rSbZ/GaFrgzwXW3/RfVXKQG91+96Qu9okWoDOME+6aMZsHlB6MpuNVKNf
   xIpahB6xCci7wSwsj0IPmYOppALzWaz/eusBfE7m7MsrKMqctYIOp1j8f
   o80oZzCo68jHUBkOrPPFPPlR5OrJW8IDKrYVLUeLCBfIegMnQE+khV4Fr
   v8rKrihg3cQmXrbWubXirNBrmX+qSmcfbCYR4JjzVpcGZ4S7WvFGMmX6q
   g==;
X-CSE-ConnectionGUID: rzd6OVizTzOoRXRNzwB1kA==
X-CSE-MsgGUID: IqjuWp4cRaie6yDxuEGzQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50219015"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="50219015"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 05:17:46 -0700
X-CSE-ConnectionGUID: EmZck7S9TQu8kSd+5WZyZg==
X-CSE-MsgGUID: xSQ8PNbqSFmY1Qdq7NfTow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="145853562"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 May 2025 05:17:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJAIQ-000RoK-0J;
	Sun, 25 May 2025 12:17:42 +0000
Date: Sun, 25 May 2025 20:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/list_lru.c:82:3-9: preceding lock on line 77
Message-ID: <202505252043.pbT1tBHJ-lkp@intel.com>
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
head:   d0c22de9995b624f563bc5004d44ac2655712a56
commit: fb56fdf8b9a2f7397f8a83dce50189f3f0cf71af mm/list_lru: split the lock to per-cgroup scope
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-102-20250525 (https://download.01.org/0day-ci/archive/20250525/202505252043.pbT1tBHJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505252043.pbT1tBHJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/list_lru.c:82:3-9: preceding lock on line 77
>> mm/list_lru.c:82:3-9: preceding lock on line 77
   mm/list_lru.c:82:3-9: preceding lock on line 75
   mm/list_lru.c:82:3-9: preceding lock on line 75

vim +82 mm/list_lru.c

28e98022b31efd Kairui Song 2024-11-05   62  
28e98022b31efd Kairui Song 2024-11-05   63  static inline struct list_lru_one *
fb56fdf8b9a2f7 Kairui Song 2024-11-05   64  lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
fb56fdf8b9a2f7 Kairui Song 2024-11-05   65  		       bool irq, bool skip_empty)
28e98022b31efd Kairui Song 2024-11-05   66  {
28e98022b31efd Kairui Song 2024-11-05   67  	struct list_lru_one *l;
fb56fdf8b9a2f7 Kairui Song 2024-11-05   68  	long nr_items;
fb56fdf8b9a2f7 Kairui Song 2024-11-05   69  
fb56fdf8b9a2f7 Kairui Song 2024-11-05   70  	rcu_read_lock();
28e98022b31efd Kairui Song 2024-11-05   71  again:
28e98022b31efd Kairui Song 2024-11-05   72  	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
fb56fdf8b9a2f7 Kairui Song 2024-11-05   73  	if (likely(l)) {
fb56fdf8b9a2f7 Kairui Song 2024-11-05   74  		if (irq)
fb56fdf8b9a2f7 Kairui Song 2024-11-05   75  			spin_lock_irq(&l->lock);
fb56fdf8b9a2f7 Kairui Song 2024-11-05   76  		else
fb56fdf8b9a2f7 Kairui Song 2024-11-05  @77  			spin_lock(&l->lock);
fb56fdf8b9a2f7 Kairui Song 2024-11-05   78  		nr_items = READ_ONCE(l->nr_items);
fb56fdf8b9a2f7 Kairui Song 2024-11-05   79  		if (likely(nr_items != LONG_MIN)) {
fb56fdf8b9a2f7 Kairui Song 2024-11-05   80  			WARN_ON(nr_items < 0);
fb56fdf8b9a2f7 Kairui Song 2024-11-05   81  			rcu_read_unlock();
28e98022b31efd Kairui Song 2024-11-05  @82  			return l;
fb56fdf8b9a2f7 Kairui Song 2024-11-05   83  		}
fb56fdf8b9a2f7 Kairui Song 2024-11-05   84  		if (irq)
fb56fdf8b9a2f7 Kairui Song 2024-11-05   85  			spin_unlock_irq(&l->lock);
fb56fdf8b9a2f7 Kairui Song 2024-11-05   86  		else
fb56fdf8b9a2f7 Kairui Song 2024-11-05   87  			spin_unlock(&l->lock);
fb56fdf8b9a2f7 Kairui Song 2024-11-05   88  	}
fb56fdf8b9a2f7 Kairui Song 2024-11-05   89  	/*
fb56fdf8b9a2f7 Kairui Song 2024-11-05   90  	 * Caller may simply bail out if raced with reparenting or
fb56fdf8b9a2f7 Kairui Song 2024-11-05   91  	 * may iterate through the list_lru and expect empty slots.
fb56fdf8b9a2f7 Kairui Song 2024-11-05   92  	 */
fb56fdf8b9a2f7 Kairui Song 2024-11-05   93  	if (skip_empty) {
fb56fdf8b9a2f7 Kairui Song 2024-11-05   94  		rcu_read_unlock();
fb56fdf8b9a2f7 Kairui Song 2024-11-05   95  		return NULL;
fb56fdf8b9a2f7 Kairui Song 2024-11-05   96  	}
28e98022b31efd Kairui Song 2024-11-05   97  	VM_WARN_ON(!css_is_dying(&memcg->css));
fb56fdf8b9a2f7 Kairui Song 2024-11-05   98  	memcg = parent_mem_cgroup(memcg);
28e98022b31efd Kairui Song 2024-11-05   99  	goto again;
28e98022b31efd Kairui Song 2024-11-05  100  }
fb56fdf8b9a2f7 Kairui Song 2024-11-05  101  

:::::: The code at line 82 was first introduced by commit
:::::: 28e98022b31efdb8f1ba310d938cd9b97ededfe4 mm/list_lru: simplify reparenting and initial allocation

:::::: TO: Kairui Song <kasong@tencent.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
