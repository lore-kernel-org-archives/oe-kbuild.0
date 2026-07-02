Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFE22561A7
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782966759; cv=none; b=WNsVd67WLjfRGM/XZdVunNtD+djVuKAZn0VWBdA5TOANE9ixG2ZV5w4Sps+/Yhik5Ly6rdAdB2DW6wLCdHrfx3e3lChm6thbabMjlZbEk+7z+N9mn8cjmIGGnkb1EUyBQX5bvniPK4MPrJv4KHYv6vl4j1SS0efVNrOAEDLfUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782966759; c=relaxed/simple;
	bh=iXjfPds8CP6az5xSBJcraT+U2ROo6CijfNMYr2m+Iz0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U9ta9Ha+f0AvjUjl2z+9EVG167P9H0R6qADwXI5uzbpw8/uDEbSORkB4rxJcKvNeUuCKMiGaF50G1LXNahMWY7vE8y3GhexDRApn4wHE80MifUVS4dVEczcc5L2Nc3hb7kMG3HHT0U4Z4iwKQHeoYBUIpOQ2dOFj1CPx5HUaIGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ji0HBxUF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ji0HBxUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782966757; x=1814502757;
  h=date:from:to:cc:subject:message-id;
  bh=iXjfPds8CP6az5xSBJcraT+U2ROo6CijfNMYr2m+Iz0=;
  b=ji0HBxUFTgncVUt8NxBWVo4V7CopXOsZFFYEPUpqXLVcRcHd2DHkoMRW
   5HJ9TiGaA18NhCm8jSiEoU9s2po+RL69gxRTI6BreotANmuxRDY9WQ5Ji
   cxXB/rR1O17g4jA+gAfdsvy4wpRz+zV9OjqdZQCZK+TmN03LjHJAyfQ8U
   pZR3EOmUDMLou5DzNeA0c+t6vnB41nxLIlWHaH8ZFeLdXuiIezJO1l/bg
   QEpHT4oqc6ropVkKORr7q9fvJZIQtNLPy7dXZjiuJUtSJGhxFxJ4t5P1c
   dmuCo2LkNsO23wMchjggxofY+uzVfy43+Dg+I3AxFYATexRKsjd/YGGsS
   A==;
X-CSE-ConnectionGUID: XbhOIpxkS6CMaVjFIYfBbQ==
X-CSE-MsgGUID: 20k6VMizQVm3NpPoSE/o+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83485865"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83485865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:32:36 -0700
X-CSE-ConnectionGUID: RY34OOqiQmKNVIZuQD/pvQ==
X-CSE-MsgGUID: KIa8mrgeQF6+zeIZt3gvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256329735"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 21:32:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf95w-000000009zT-2deu;
	Thu, 02 Jul 2026 04:32:12 +0000
Date: Thu, 02 Jul 2026 12:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/time/timer_migration.c:1729 tmigr_setup_groups()
 error: we previously assumed 'start' could be null (see line 1630)
Message-ID: <202607021231.Op9h0tLk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frederic Weisbecker <frederic@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 5eb579dfd46b4949117ecb0f1ba2f12d3dc9a6f2 timers/migration: Fix imbalanced NUMA trees
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: sparc64-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021231.Op9h0tLk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5eb579dfd46b ("timers/migration: Fix imbalanced NUMA trees")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021231.Op9h0tLk-lkp@intel.com/

smatch warnings:
kernel/time/timer_migration.c:1729 tmigr_setup_groups() error: we previously assumed 'start' could be null (see line 1630)

vim +/start +1729 kernel/time/timer_migration.c

7ee988770326fc Anna-Maria Behnsen  2024-02-22  1618  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1619  static int tmigr_setup_groups(unsigned int cpu, unsigned int node,
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1620  			      struct tmigr_group *start, bool activate)
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1621  {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1622  	struct tmigr_group *group, *child, **stack;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1623  	int i, top = 0, err = 0, start_lvl = 0;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1624  	bool root_mismatch = false;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1625  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1626  	stack = kcalloc(tmigr_hierarchy_levels, sizeof(*stack), GFP_KERNEL);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1627  	if (!stack)
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1628  		return -ENOMEM;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1629  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24 @1630  	if (start) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1631  		stack[start->level] = start;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1632  		start_lvl = start->level + 1;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1633  	}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1634  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1635  	if (tmigr_root)
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1636  		root_mismatch = tmigr_root->numa_node != node;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1637  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1638  	for (i = start_lvl; i < tmigr_hierarchy_levels; i++) {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1639  		group = tmigr_get_group(cpu, node, i);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1640  		if (IS_ERR(group)) {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1641  			err = PTR_ERR(group);
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1642  			i--;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1643  			break;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1644  		}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1645  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1646  		top = i;
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1647  		stack[i] = group;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1648  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1649  		/*
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1650  		 * When booting only less CPUs of a system than CPUs are
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1651  		 * available, not all calculated hierarchy levels are required,
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1652  		 * unless a node mismatch is detected.
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1653  		 *
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1654  		 * The loop is aborted as soon as the highest level, which might
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1655  		 * be different from tmigr_hierarchy_levels, contains only a
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1656  		 * single group, unless the nodes mismatch below tmigr_crossnode_level
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1657  		 */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1658  		if (group->parent)
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1659  			break;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1660  		if ((!root_mismatch || i >= tmigr_crossnode_level) &&
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1661  		    list_is_singular(&tmigr_level_list[i]))
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1662  			break;
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1663  	}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1664  
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1665  	/* Assert single root without parent */
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1666  	if (WARN_ON_ONCE(i >= tmigr_hierarchy_levels))
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1667  		return -EINVAL;
868c9037df626b Frederic Weisbecker 2025-02-05  1668  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1669  	for (; i >= start_lvl; i--) {
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1670  		group = stack[i];
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1671  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1672  		if (err < 0) {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1673  			list_del(&group->list);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1674  			kfree(group);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1675  			continue;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1676  		}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1677  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1678  		WARN_ON_ONCE(i != group->level);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1679  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1680  		/*
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1681  		 * Update tmc -> group / child -> group connection
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1682  		 */
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1683  		if (i == 0) {
10a0e6f3d3db7d Anna-Maria Behnsen  2024-07-17  1684  			struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1685  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1686  			tmc->tmgroup = group;
835a9a67f54f01 Anna-Maria Behnsen  2024-07-16  1687  			tmc->groupmask = BIT(group->num_children++);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1688  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1689  			tmigr_init_root(group, activate);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1690  
36e40df35d2c18 Anna-Maria Behnsen  2024-02-22  1691  			trace_tmigr_connect_cpu_parent(tmc);
36e40df35d2c18 Anna-Maria Behnsen  2024-02-22  1692  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1693  			/* There are no children that need to be connected */
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1694  			continue;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1695  		} else {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1696  			child = stack[i - 1];
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1697  			tmigr_connect_child_parent(child, group, activate);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1698  		}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1699  	}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1700  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1701  	if (err < 0)
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1702  		goto out;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1703  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1704  	if (activate) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1705  		struct tmigr_walk data;
868c9037df626b Frederic Weisbecker 2025-02-05  1706  
868c9037df626b Frederic Weisbecker 2025-02-05  1707  		/*
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1708  		 * To prevent inconsistent states, active children need to be active in
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1709  		 * the new parent as well. Inactive children are already marked inactive
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1710  		 * in the parent group:
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1711  		 *
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1712  		 * * When new groups were created by tmigr_setup_groups() starting from
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1713  		 *   the lowest level, then they are not active. They will be set active
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1714  		 *   when the new online CPU comes active.
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1715  		 *
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1716  		 * * But if new groups above the current top level are required, it is
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1717  		 *   mandatory to propagate the active state of the already existing
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1718  		 *   child to the new parents. So tmigr_active_up() activates the
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1719  		 *   new parents while walking up from the old root to the new.
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1720  		 *
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1721  		 * * It is ensured that @start is active, as this setup path is
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1722  		 *   executed in hotplug prepare callback. This is executed by an
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1723  		 *   already connected and !idle CPU. Even if all other CPUs go idle,
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1724  		 *   the CPU executing the setup will be responsible up to current top
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1725  		 *   level group. And the next time it goes inactive, it will release
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1726  		 *   the new childmask and parent to subsequent walkers through this
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1727  		 *   @child. Therefore propagate active state unconditionally.
10a0e6f3d3db7d Anna-Maria Behnsen  2024-07-17  1728  		 */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24 @1729  		WARN_ON_ONCE(!start->parent);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1730  		data.childmask = start->groupmask;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1731  		__walk_groups_from(tmigr_active_up, &data, start, start->parent);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1732  	}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1733  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1734  	/* Root update */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1735  	if (list_is_singular(&tmigr_level_list[top])) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1736  		group = list_first_entry(&tmigr_level_list[top],
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1737  					 typeof(*group), list);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1738  		WARN_ON_ONCE(group->parent);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1739  		if (tmigr_root) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1740  			/* Old root should be the same or below */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1741  			WARN_ON_ONCE(tmigr_root->level > top);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1742  		}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1743  		tmigr_root = group;
d7ad05c86e2191 Levi Yun            2024-05-06  1744  	}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1745  out:
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1746  	kfree(stack);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1747  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1748  	return err;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1749  }
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1750  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
