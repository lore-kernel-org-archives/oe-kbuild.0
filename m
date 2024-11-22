Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA542AA9
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 03:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732245099; cv=none; b=SIQa3SuFOQQ0YC0Se3ifNzWBu7RAWUr3S6NsnKYHsFBJJnQdj1n1n5/pXaIA9PcvwpBflC0jk6AKSfJm5nvG7UVwdKH0XavzJZAqAU0SKJrsXa1SQqRODc76MZpVzAEfN4ODCpvhNHCRlflcLPUlDQ+Ux04aDNOwmJfbJK51m/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732245099; c=relaxed/simple;
	bh=qHaARr2IlsyVIx0/v+77JVgW7cuL8wW83naHZZGN73w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPrE1Gk5Q/YRFOKz156iUcOyBI54ha2zVr1wgBsVrw8A1hPKgAj5nbYIzUqDvAT//sO+KzGhuA/sY1gGLytJvGmTiO4W4LJZ+cd9DDJwIqR4MkBcfvszQ63tSrektejiB8lAhRKppdUA5bC0pbwJ2NeHpKITD/aRSwuHVH7RW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8VqMcC1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8VqMcC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732245097; x=1763781097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHaARr2IlsyVIx0/v+77JVgW7cuL8wW83naHZZGN73w=;
  b=f8VqMcC1lDHs3yIECqgfHec2epY2BAdOvyiAANjr4v9ULxvQ7XfFJA4x
   rkg+gHVD1C3aYwb/ELDCNyhxpJ/TLNsIPZTAei6ZdcuIMZLpzChGbxnGn
   sJtVkWBFjG3oYMasaePdoXC2F3VqngYUq6YxQNcA7E868NBXfwjGtHEwR
   QlsYnbWK240bDgIswYyTARQ6bIBnulStu+NBTxuHtIyMvNb7XometIXeH
   jlv0Msjogqsmx4sB3skZgjThnSQHyMX9SyvPqI7jAs7x++mqlCXl7tlXp
   fSh63oCGsBc//pxuSsmvZmwxhfiHLz888Pw70Aoc+aY7H5JQJ489BG5Ab
   w==;
X-CSE-ConnectionGUID: PZ18JitVRLWKHdDZk6lwLg==
X-CSE-MsgGUID: MZ82Io5eTVilYwSKn8Wbbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="57789766"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="57789766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 19:11:32 -0800
X-CSE-ConnectionGUID: DY7mDOWsQE2Y3JpksKBz1w==
X-CSE-MsgGUID: wpMAU2W+SEm90pb931Vx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="90249250"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2024 19:10:34 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEK40-0003cb-1S;
	Fri, 22 Nov 2024 03:10:32 +0000
Date: Fri, 22 Nov 2024 11:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memcontrol-v1.c:1505 __mem_cgroup_usage_register_event() error:
 uninitialized symbol 'thresholds'.
Message-ID: <202411221104.qA1awiFe-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 66d60c428b23c5b171218985b6880958fb7edbe3 mm: memcg: move legacy memcg event code into memcontrol-v1.c
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-r073-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221104.qA1awiFe-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411221104.qA1awiFe-lkp@intel.com/

New smatch warnings:
mm/memcontrol-v1.c:1505 __mem_cgroup_usage_register_event() error: uninitialized symbol 'thresholds'.
mm/memcontrol-v1.c:1534 __mem_cgroup_usage_register_event() error: uninitialized symbol 'usage'.
mm/memcontrol-v1.c:1591 __mem_cgroup_usage_unregister_event() error: uninitialized symbol 'thresholds'.

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/thresholds +1505 mm/memcontrol-v1.c

66d60c428b23c5 Roman Gushchin 2024-06-24  1479  
66d60c428b23c5 Roman Gushchin 2024-06-24  1480  static int __mem_cgroup_usage_register_event(struct mem_cgroup *memcg,
66d60c428b23c5 Roman Gushchin 2024-06-24  1481  	struct eventfd_ctx *eventfd, const char *args, enum res_type type)
66d60c428b23c5 Roman Gushchin 2024-06-24  1482  {
66d60c428b23c5 Roman Gushchin 2024-06-24  1483  	struct mem_cgroup_thresholds *thresholds;
66d60c428b23c5 Roman Gushchin 2024-06-24  1484  	struct mem_cgroup_threshold_ary *new;
66d60c428b23c5 Roman Gushchin 2024-06-24  1485  	unsigned long threshold;
66d60c428b23c5 Roman Gushchin 2024-06-24  1486  	unsigned long usage;
66d60c428b23c5 Roman Gushchin 2024-06-24  1487  	int i, size, ret;
66d60c428b23c5 Roman Gushchin 2024-06-24  1488  
66d60c428b23c5 Roman Gushchin 2024-06-24  1489  	ret = page_counter_memparse(args, "-1", &threshold);
66d60c428b23c5 Roman Gushchin 2024-06-24  1490  	if (ret)
66d60c428b23c5 Roman Gushchin 2024-06-24  1491  		return ret;
66d60c428b23c5 Roman Gushchin 2024-06-24  1492  
66d60c428b23c5 Roman Gushchin 2024-06-24  1493  	mutex_lock(&memcg->thresholds_lock);
66d60c428b23c5 Roman Gushchin 2024-06-24  1494  
66d60c428b23c5 Roman Gushchin 2024-06-24  1495  	if (type == _MEM) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1496  		thresholds = &memcg->thresholds;
66d60c428b23c5 Roman Gushchin 2024-06-24  1497  		usage = mem_cgroup_usage(memcg, false);
66d60c428b23c5 Roman Gushchin 2024-06-24  1498  	} else if (type == _MEMSWAP) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1499  		thresholds = &memcg->memsw_thresholds;
66d60c428b23c5 Roman Gushchin 2024-06-24  1500  		usage = mem_cgroup_usage(memcg, true);
66d60c428b23c5 Roman Gushchin 2024-06-24  1501  	} else
66d60c428b23c5 Roman Gushchin 2024-06-24  1502  		BUG();
66d60c428b23c5 Roman Gushchin 2024-06-24  1503  
66d60c428b23c5 Roman Gushchin 2024-06-24  1504  	/* Check if a threshold crossed before adding a new one */
66d60c428b23c5 Roman Gushchin 2024-06-24 @1505  	if (thresholds->primary)
66d60c428b23c5 Roman Gushchin 2024-06-24  1506  		__mem_cgroup_threshold(memcg, type == _MEMSWAP);
66d60c428b23c5 Roman Gushchin 2024-06-24  1507  
66d60c428b23c5 Roman Gushchin 2024-06-24  1508  	size = thresholds->primary ? thresholds->primary->size + 1 : 1;
66d60c428b23c5 Roman Gushchin 2024-06-24  1509  
66d60c428b23c5 Roman Gushchin 2024-06-24  1510  	/* Allocate memory for new array of thresholds */
66d60c428b23c5 Roman Gushchin 2024-06-24  1511  	new = kmalloc(struct_size(new, entries, size), GFP_KERNEL);
66d60c428b23c5 Roman Gushchin 2024-06-24  1512  	if (!new) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1513  		ret = -ENOMEM;
66d60c428b23c5 Roman Gushchin 2024-06-24  1514  		goto unlock;
66d60c428b23c5 Roman Gushchin 2024-06-24  1515  	}
66d60c428b23c5 Roman Gushchin 2024-06-24  1516  	new->size = size;
66d60c428b23c5 Roman Gushchin 2024-06-24  1517  
66d60c428b23c5 Roman Gushchin 2024-06-24  1518  	/* Copy thresholds (if any) to new array */
66d60c428b23c5 Roman Gushchin 2024-06-24  1519  	if (thresholds->primary)
66d60c428b23c5 Roman Gushchin 2024-06-24  1520  		memcpy(new->entries, thresholds->primary->entries,
66d60c428b23c5 Roman Gushchin 2024-06-24  1521  		       flex_array_size(new, entries, size - 1));
66d60c428b23c5 Roman Gushchin 2024-06-24  1522  
66d60c428b23c5 Roman Gushchin 2024-06-24  1523  	/* Add new threshold */
66d60c428b23c5 Roman Gushchin 2024-06-24  1524  	new->entries[size - 1].eventfd = eventfd;
66d60c428b23c5 Roman Gushchin 2024-06-24  1525  	new->entries[size - 1].threshold = threshold;
66d60c428b23c5 Roman Gushchin 2024-06-24  1526  
66d60c428b23c5 Roman Gushchin 2024-06-24  1527  	/* Sort thresholds. Registering of new threshold isn't time-critical */
66d60c428b23c5 Roman Gushchin 2024-06-24  1528  	sort(new->entries, size, sizeof(*new->entries),
66d60c428b23c5 Roman Gushchin 2024-06-24  1529  			compare_thresholds, NULL);
66d60c428b23c5 Roman Gushchin 2024-06-24  1530  
66d60c428b23c5 Roman Gushchin 2024-06-24  1531  	/* Find current threshold */
66d60c428b23c5 Roman Gushchin 2024-06-24  1532  	new->current_threshold = -1;
66d60c428b23c5 Roman Gushchin 2024-06-24  1533  	for (i = 0; i < size; i++) {
66d60c428b23c5 Roman Gushchin 2024-06-24 @1534  		if (new->entries[i].threshold <= usage) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1535  			/*
66d60c428b23c5 Roman Gushchin 2024-06-24  1536  			 * new->current_threshold will not be used until
66d60c428b23c5 Roman Gushchin 2024-06-24  1537  			 * rcu_assign_pointer(), so it's safe to increment
66d60c428b23c5 Roman Gushchin 2024-06-24  1538  			 * it here.
66d60c428b23c5 Roman Gushchin 2024-06-24  1539  			 */
66d60c428b23c5 Roman Gushchin 2024-06-24  1540  			++new->current_threshold;
66d60c428b23c5 Roman Gushchin 2024-06-24  1541  		} else
66d60c428b23c5 Roman Gushchin 2024-06-24  1542  			break;
66d60c428b23c5 Roman Gushchin 2024-06-24  1543  	}
66d60c428b23c5 Roman Gushchin 2024-06-24  1544  
66d60c428b23c5 Roman Gushchin 2024-06-24  1545  	/* Free old spare buffer and save old primary buffer as spare */
66d60c428b23c5 Roman Gushchin 2024-06-24  1546  	kfree(thresholds->spare);
66d60c428b23c5 Roman Gushchin 2024-06-24  1547  	thresholds->spare = thresholds->primary;
66d60c428b23c5 Roman Gushchin 2024-06-24  1548  
66d60c428b23c5 Roman Gushchin 2024-06-24  1549  	rcu_assign_pointer(thresholds->primary, new);
66d60c428b23c5 Roman Gushchin 2024-06-24  1550  
66d60c428b23c5 Roman Gushchin 2024-06-24  1551  	/* To be sure that nobody uses thresholds */
66d60c428b23c5 Roman Gushchin 2024-06-24  1552  	synchronize_rcu();
66d60c428b23c5 Roman Gushchin 2024-06-24  1553  
66d60c428b23c5 Roman Gushchin 2024-06-24  1554  unlock:
66d60c428b23c5 Roman Gushchin 2024-06-24  1555  	mutex_unlock(&memcg->thresholds_lock);
66d60c428b23c5 Roman Gushchin 2024-06-24  1556  
66d60c428b23c5 Roman Gushchin 2024-06-24  1557  	return ret;
66d60c428b23c5 Roman Gushchin 2024-06-24  1558  }
66d60c428b23c5 Roman Gushchin 2024-06-24  1559  
66d60c428b23c5 Roman Gushchin 2024-06-24  1560  static int mem_cgroup_usage_register_event(struct mem_cgroup *memcg,
66d60c428b23c5 Roman Gushchin 2024-06-24  1561  	struct eventfd_ctx *eventfd, const char *args)
66d60c428b23c5 Roman Gushchin 2024-06-24  1562  {
66d60c428b23c5 Roman Gushchin 2024-06-24  1563  	return __mem_cgroup_usage_register_event(memcg, eventfd, args, _MEM);
66d60c428b23c5 Roman Gushchin 2024-06-24  1564  }
66d60c428b23c5 Roman Gushchin 2024-06-24  1565  
66d60c428b23c5 Roman Gushchin 2024-06-24  1566  static int memsw_cgroup_usage_register_event(struct mem_cgroup *memcg,
66d60c428b23c5 Roman Gushchin 2024-06-24  1567  	struct eventfd_ctx *eventfd, const char *args)
66d60c428b23c5 Roman Gushchin 2024-06-24  1568  {
66d60c428b23c5 Roman Gushchin 2024-06-24  1569  	return __mem_cgroup_usage_register_event(memcg, eventfd, args, _MEMSWAP);
66d60c428b23c5 Roman Gushchin 2024-06-24  1570  }
66d60c428b23c5 Roman Gushchin 2024-06-24  1571  
66d60c428b23c5 Roman Gushchin 2024-06-24  1572  static void __mem_cgroup_usage_unregister_event(struct mem_cgroup *memcg,
66d60c428b23c5 Roman Gushchin 2024-06-24  1573  	struct eventfd_ctx *eventfd, enum res_type type)
66d60c428b23c5 Roman Gushchin 2024-06-24  1574  {
66d60c428b23c5 Roman Gushchin 2024-06-24  1575  	struct mem_cgroup_thresholds *thresholds;
66d60c428b23c5 Roman Gushchin 2024-06-24  1576  	struct mem_cgroup_threshold_ary *new;
66d60c428b23c5 Roman Gushchin 2024-06-24  1577  	unsigned long usage;
66d60c428b23c5 Roman Gushchin 2024-06-24  1578  	int i, j, size, entries;
66d60c428b23c5 Roman Gushchin 2024-06-24  1579  
66d60c428b23c5 Roman Gushchin 2024-06-24  1580  	mutex_lock(&memcg->thresholds_lock);
66d60c428b23c5 Roman Gushchin 2024-06-24  1581  
66d60c428b23c5 Roman Gushchin 2024-06-24  1582  	if (type == _MEM) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1583  		thresholds = &memcg->thresholds;
66d60c428b23c5 Roman Gushchin 2024-06-24  1584  		usage = mem_cgroup_usage(memcg, false);
66d60c428b23c5 Roman Gushchin 2024-06-24  1585  	} else if (type == _MEMSWAP) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1586  		thresholds = &memcg->memsw_thresholds;
66d60c428b23c5 Roman Gushchin 2024-06-24  1587  		usage = mem_cgroup_usage(memcg, true);
66d60c428b23c5 Roman Gushchin 2024-06-24  1588  	} else
66d60c428b23c5 Roman Gushchin 2024-06-24  1589  		BUG();
66d60c428b23c5 Roman Gushchin 2024-06-24  1590  
66d60c428b23c5 Roman Gushchin 2024-06-24 @1591  	if (!thresholds->primary)
66d60c428b23c5 Roman Gushchin 2024-06-24  1592  		goto unlock;
66d60c428b23c5 Roman Gushchin 2024-06-24  1593  
66d60c428b23c5 Roman Gushchin 2024-06-24  1594  	/* Check if a threshold crossed before removing */
66d60c428b23c5 Roman Gushchin 2024-06-24  1595  	__mem_cgroup_threshold(memcg, type == _MEMSWAP);
66d60c428b23c5 Roman Gushchin 2024-06-24  1596  
66d60c428b23c5 Roman Gushchin 2024-06-24  1597  	/* Calculate new number of threshold */
66d60c428b23c5 Roman Gushchin 2024-06-24  1598  	size = entries = 0;
66d60c428b23c5 Roman Gushchin 2024-06-24  1599  	for (i = 0; i < thresholds->primary->size; i++) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1600  		if (thresholds->primary->entries[i].eventfd != eventfd)
66d60c428b23c5 Roman Gushchin 2024-06-24  1601  			size++;
66d60c428b23c5 Roman Gushchin 2024-06-24  1602  		else
66d60c428b23c5 Roman Gushchin 2024-06-24  1603  			entries++;
66d60c428b23c5 Roman Gushchin 2024-06-24  1604  	}
66d60c428b23c5 Roman Gushchin 2024-06-24  1605  
66d60c428b23c5 Roman Gushchin 2024-06-24  1606  	new = thresholds->spare;
66d60c428b23c5 Roman Gushchin 2024-06-24  1607  
66d60c428b23c5 Roman Gushchin 2024-06-24  1608  	/* If no items related to eventfd have been cleared, nothing to do */
66d60c428b23c5 Roman Gushchin 2024-06-24  1609  	if (!entries)
66d60c428b23c5 Roman Gushchin 2024-06-24  1610  		goto unlock;
66d60c428b23c5 Roman Gushchin 2024-06-24  1611  
66d60c428b23c5 Roman Gushchin 2024-06-24  1612  	/* Set thresholds array to NULL if we don't have thresholds */
66d60c428b23c5 Roman Gushchin 2024-06-24  1613  	if (!size) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1614  		kfree(new);
66d60c428b23c5 Roman Gushchin 2024-06-24  1615  		new = NULL;
66d60c428b23c5 Roman Gushchin 2024-06-24  1616  		goto swap_buffers;
66d60c428b23c5 Roman Gushchin 2024-06-24  1617  	}
66d60c428b23c5 Roman Gushchin 2024-06-24  1618  
66d60c428b23c5 Roman Gushchin 2024-06-24  1619  	new->size = size;
66d60c428b23c5 Roman Gushchin 2024-06-24  1620  
66d60c428b23c5 Roman Gushchin 2024-06-24  1621  	/* Copy thresholds and find current threshold */
66d60c428b23c5 Roman Gushchin 2024-06-24  1622  	new->current_threshold = -1;
66d60c428b23c5 Roman Gushchin 2024-06-24  1623  	for (i = 0, j = 0; i < thresholds->primary->size; i++) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1624  		if (thresholds->primary->entries[i].eventfd == eventfd)
66d60c428b23c5 Roman Gushchin 2024-06-24  1625  			continue;
66d60c428b23c5 Roman Gushchin 2024-06-24  1626  
66d60c428b23c5 Roman Gushchin 2024-06-24  1627  		new->entries[j] = thresholds->primary->entries[i];
66d60c428b23c5 Roman Gushchin 2024-06-24  1628  		if (new->entries[j].threshold <= usage) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1629  			/*
66d60c428b23c5 Roman Gushchin 2024-06-24  1630  			 * new->current_threshold will not be used
66d60c428b23c5 Roman Gushchin 2024-06-24  1631  			 * until rcu_assign_pointer(), so it's safe to increment
66d60c428b23c5 Roman Gushchin 2024-06-24  1632  			 * it here.
66d60c428b23c5 Roman Gushchin 2024-06-24  1633  			 */
66d60c428b23c5 Roman Gushchin 2024-06-24  1634  			++new->current_threshold;
66d60c428b23c5 Roman Gushchin 2024-06-24  1635  		}
66d60c428b23c5 Roman Gushchin 2024-06-24  1636  		j++;
66d60c428b23c5 Roman Gushchin 2024-06-24  1637  	}
66d60c428b23c5 Roman Gushchin 2024-06-24  1638  
66d60c428b23c5 Roman Gushchin 2024-06-24  1639  swap_buffers:
66d60c428b23c5 Roman Gushchin 2024-06-24  1640  	/* Swap primary and spare array */
66d60c428b23c5 Roman Gushchin 2024-06-24  1641  	thresholds->spare = thresholds->primary;
66d60c428b23c5 Roman Gushchin 2024-06-24  1642  
66d60c428b23c5 Roman Gushchin 2024-06-24  1643  	rcu_assign_pointer(thresholds->primary, new);
66d60c428b23c5 Roman Gushchin 2024-06-24  1644  
66d60c428b23c5 Roman Gushchin 2024-06-24  1645  	/* To be sure that nobody uses thresholds */
66d60c428b23c5 Roman Gushchin 2024-06-24  1646  	synchronize_rcu();
66d60c428b23c5 Roman Gushchin 2024-06-24  1647  
66d60c428b23c5 Roman Gushchin 2024-06-24  1648  	/* If all events are unregistered, free the spare array */
66d60c428b23c5 Roman Gushchin 2024-06-24  1649  	if (!new) {
66d60c428b23c5 Roman Gushchin 2024-06-24  1650  		kfree(thresholds->spare);
66d60c428b23c5 Roman Gushchin 2024-06-24  1651  		thresholds->spare = NULL;
66d60c428b23c5 Roman Gushchin 2024-06-24  1652  	}
66d60c428b23c5 Roman Gushchin 2024-06-24  1653  unlock:
66d60c428b23c5 Roman Gushchin 2024-06-24  1654  	mutex_unlock(&memcg->thresholds_lock);
66d60c428b23c5 Roman Gushchin 2024-06-24  1655  }
66d60c428b23c5 Roman Gushchin 2024-06-24  1656  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
