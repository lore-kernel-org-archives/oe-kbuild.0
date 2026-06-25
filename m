Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFF3373BE6
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374176; cv=none; b=ZAB5GWqORwzM8pHVQXjkSp+apW/7sF4Oxf/woysysLUdHb/J5+IdiGnIG16O2Um8Hp07Dm8g5CWABm7RCn7ewCFjfBFPxBJL3nfUBV0fvCeZrz5lA/Htf+mELK2lQbNoMbPmHPBMfeQeh8RmFZsN6dubED/RCRvO4/6Xe+WuX6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374176; c=relaxed/simple;
	bh=/dEYWKLug2LbaFWNmFqqMVhX1kywHTi2LGGqNXEFgDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d1XOJaD06yysQr6Ed+XZPeE8C1LD6ZEFzY9Ld50iMWRXc1KdMYObndvpZw/gU/JL4QVgtMVkgN0w3gkwEjHZ9i35yRZtxcRMSJnGS5jfwgwG5WJ1OWjkntLVyiOPLavbjhNdWuHmmEx578YX4OctMMeW4nNk1JrzWpRaHTNPcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lz1ln5k2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lz1ln5k2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782374175; x=1813910175;
  h=date:from:to:cc:subject:message-id;
  bh=/dEYWKLug2LbaFWNmFqqMVhX1kywHTi2LGGqNXEFgDw=;
  b=Lz1ln5k2nOBvZ5+n3enRalF9+froPs6L4k7zdeMbEWMseRHz0MMuhpr6
   LIZWSBxsL0B5fcvbWaNPMuE6uEKxqa1NJUCAx5scsRb1wdgH+asFXDqwL
   NeYGXpvW162c0IkEa0OJeMmT4BgH/BwEGrmrNtaBvUQfrLBxKBpjMdQxm
   xlG4BVG5u2lk+XCCew+u+Pd1MWbgxS3rubvaSUvMXd9raAIMsWAShpHb4
   aenLe18Se8kuL4HawQJFqjDbZjLqUYGHTt33/Jg7AE6ASFp0FV37+yQDj
   De8ssBjrbpeac4NqL0MSKFx/z62ZGnwGXTZf1T2je8NlQSVutH6F4+GCw
   g==;
X-CSE-ConnectionGUID: sYNuNaGZQJi6NKUuiu1mKA==
X-CSE-MsgGUID: ht8hBvVORlGC072N/UDcXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83197212"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83197212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:56:14 -0700
X-CSE-ConnectionGUID: fhW7kUjMR2GR6ohuY3/J3A==
X-CSE-MsgGUID: aKu6yUuzRcmgFnPJ98UEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="250160912"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 00:56:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcewT-0000000040V-357v;
	Thu, 25 Jun 2026 07:56:09 +0000
Date: Thu, 25 Jun 2026 15:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frederic-dynticks:timers/core 2/5]
 kernel/time/timer_migration.c:1896 tmigr_setup_groups() warn: variable
 dereferenced before check 'start' (see line 1888)
Message-ID: <202606251548.MvQKHzgc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   109e29894c3d5408230fbe5c731fc45d11570d84
commit: 98097d0556e61d08a83fe242b39f18afc58313c8 [2/5] timers/migration: Defer initialization after capacity topology is setup
:::::: branch date: 18 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20260625 (https://download.01.org/0day-ci/archive/20260625/202606251548.MvQKHzgc-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606251548.MvQKHzgc-lkp@intel.com/

smatch warnings:
kernel/time/timer_migration.c:1896 tmigr_setup_groups() warn: variable dereferenced before check 'start' (see line 1888)

vim +/start +1896 kernel/time/timer_migration.c

7ee988770326fca Anna-Maria Behnsen  2024-02-22  1762  
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1763  static int tmigr_setup_groups(unsigned int cpu, unsigned int node,
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1764  			      struct tmigr_group *start, bool activate)
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1765  {
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1766  	struct tmigr_group *group, *child, **stack;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1767  	int i, top = 0, err = 0, start_lvl = 0;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1768  	bool root_mismatch = false;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1769  
bf4afc53b77aeaa Linus Torvalds      2026-02-21  1770  	stack = kzalloc_objs(*stack, tmigr_hierarchy_levels);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1771  	if (!stack)
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1772  		return -ENOMEM;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1773  
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1774  	if (start) {
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1775  		stack[start->level] = start;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1776  		start_lvl = start->level + 1;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1777  	}
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1778  
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1779  	if (tmigr_root)
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1780  		root_mismatch = tmigr_root->numa_node != node;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1781  
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1782  	for (i = start_lvl; i < tmigr_hierarchy_levels; i++) {
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1783  		group = tmigr_get_group(node, i);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1784  		if (IS_ERR(group)) {
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1785  			err = PTR_ERR(group);
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1786  			i--;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1787  			break;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1788  		}
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1789  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1790  		top = i;
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1791  		stack[i] = group;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1792  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1793  		/*
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1794  		 * When booting only less CPUs of a system than CPUs are
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1795  		 * available, not all calculated hierarchy levels are required,
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1796  		 * unless a node mismatch is detected.
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1797  		 *
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1798  		 * The loop is aborted as soon as the highest level, which might
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1799  		 * be different from tmigr_hierarchy_levels, contains only a
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1800  		 * single group, unless the nodes mismatch below tmigr_crossnode_level
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1801  		 */
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1802  		if (group->parent)
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1803  			break;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1804  		if ((!root_mismatch || i >= tmigr_crossnode_level) &&
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1805  		    list_is_singular(&tmigr_level_list[i]))
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1806  			break;
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1807  	}
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1808  
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1809  	/* Assert single root without parent */
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1810  	if (WARN_ON_ONCE(i >= tmigr_hierarchy_levels))
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1811  		return -EINVAL;
868c9037df626b3 Frederic Weisbecker 2025-02-05  1812  
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1813  	for (; i >= start_lvl; i--) {
6c181b5667eea3e Frederic Weisbecker 2025-10-24  1814  		group = stack[i];
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1815  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1816  		if (err < 0) {
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1817  			list_del(&group->list);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1818  			kfree(group);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1819  			continue;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1820  		}
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1821  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1822  		WARN_ON_ONCE(i != group->level);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1823  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1824  		/*
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1825  		 * Update tmc -> group / child -> group connection
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1826  		 */
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1827  		if (i == 0) {
10a0e6f3d3db7dc Anna-Maria Behnsen  2024-07-17  1828  			struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1829  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1830  			tmc->tmgroup = group;
835a9a67f54f010 Anna-Maria Behnsen  2024-07-16  1831  			tmc->groupmask = BIT(group->num_children++);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1832  
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1833  			tmigr_init_root(group, activate);
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1834  
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1835  			trace_tmigr_connect_cpu_parent(tmc);
36e40df35d2c189 Anna-Maria Behnsen  2024-02-22  1836  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1837  			/* There are no children that need to be connected */
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1838  			continue;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1839  		} else {
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1840  			child = stack[i - 1];
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1841  			tmigr_connect_child_parent(child, group, activate);
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1842  		}
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1843  	}
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1844  
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1845  	if (err < 0)
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1846  		goto out;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1847  
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1848  	if (activate) {
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1849  		struct tmigr_walk data;
3c8eb36e2a46786 Frederic Weisbecker 2025-10-24  1850  		union tmigr_state state;
868c9037df626b3 Frederic Weisbecker 2025-02-05  1851  
868c9037df626b3 Frederic Weisbecker 2025-02-05  1852  		/*
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1853  		 * To prevent inconsistent states, active children need to be active in
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1854  		 * the new parent as well. Inactive children are already marked inactive
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1855  		 * in the parent group:
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1856  		 *
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1857  		 * * When new groups were created by tmigr_setup_groups() starting from
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1858  		 *   the lowest level, then they are not active. They will be set active
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1859  		 *   when the new online CPU comes active.
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1860  		 *
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1861  		 * * But if new groups above the current top level are required, it is
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1862  		 *   mandatory to propagate the active state of the already existing
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1863  		 *   child to the new parents. So tmigr_active_up() activates the
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1864  		 *   new parents while walking up from the old root to the new.
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1865  		 *
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1866  		 * * It is ensured that @start is active, (or on the way to be activated
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1867  		 *   by another CPU that woke up before the current one) as this setup path
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1868  		 *   is executed in hotplug prepare callback. This is executed by an already
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1869  		 *   connected and !idle CPU in the hierarchy.
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1870  		 *
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1871  		 * * The below RmW atomic operation ensures that:
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1872  		 *
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1873  		 *   1) If the old root has been completely activated, the latest state is
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1874  		 *      acquired (the below implicit acquire pairs with the implicit release
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1875  		 *      from cmpxchg() in tmigr_active_up()).
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1876  		 *
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1877  		 *   2) If the old root is still on the way to be activated, the lagging behind
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1878  		 *      CPU performing the activation will acquire the links up to the new root.
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1879  		 *      (The below implicit release pairs with the implicit acquire from cmpxchg()
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1880  		 *      in tmigr_active_up()).
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1881  		 *
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1882  		 *   3) Every subsequent CPU below the old root will acquire the new links while
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1883  		 *      walking through the old root (The below implicit release pairs with the
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1884  		 *      implicit acquire from cmpxchg() in either tmigr_active_up()) or
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1885  		 *      tmigr_inactive_up().
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1886  		 */
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1887  		state.state = atomic_fetch_or(0, &start->migr_state);
5eb579dfd46b494 Frederic Weisbecker 2025-10-24 @1888  		WARN_ON_ONCE(!start->parent);
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1889  		/*
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1890  		 * If the state of the old root is inactive, another CPU is on its way to activate
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1891  		 * it and propagate to the new root.
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1892  		 */
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1893  		if (state.active) {
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1894  			data.childmask = start->groupmask;
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1895  			__walk_groups_from(tmigr_active_up, &data, start, start->parent);
98097d0556e61d0 Frederic Weisbecker 2026-06-18 @1896  		} else if (start) {
98097d0556e61d0 Frederic Weisbecker 2026-06-18  1897  			union tmigr_state state;
98097d0556e61d0 Frederic Weisbecker 2026-06-18  1898  
98097d0556e61d0 Frederic Weisbecker 2026-06-18  1899  			/* No available CPU so the old root should be inactive */
98097d0556e61d0 Frederic Weisbecker 2026-06-18  1900  			state.state = atomic_read(&start->migr_state);
98097d0556e61d0 Frederic Weisbecker 2026-06-18  1901  			WARN_ON_ONCE(state.active);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1902  		}
bd3c45dd01283ad Frederic Weisbecker 2026-04-23  1903          }
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1904  
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1905  	/* Root update */
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1906  	if (list_is_singular(&tmigr_level_list[top])) {
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1907  		group = list_first_entry(&tmigr_level_list[top],
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1908  					 typeof(*group), list);
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1909  		WARN_ON_ONCE(group->parent);
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1910  		if (tmigr_root) {
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1911  			/* Old root should be the same or below */
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1912  			WARN_ON_ONCE(tmigr_root->level > top);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1913  		}
67fc95eddaefca9 Frederic Weisbecker 2026-06-17  1914  		tmigr_root = group;
d7ad05c86e2191b Levi Yun            2024-05-06  1915  	}
5eb579dfd46b494 Frederic Weisbecker 2025-10-24  1916  out:
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1917  	kfree(stack);
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1918  
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1919  	return err;
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1920  }
7ee988770326fca Anna-Maria Behnsen  2024-02-22  1921  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
