Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815E384242
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265354; cv=none; b=Sz5tSSqVWxLM3TfZ1sEq6vywVUGN1/HKnIxy6L/UQjm3oGBvHgVjZsvwEZB5y389whR5riM+PpU1mhcFUU1MPadnPYEkr/XMeub79UlJf3MkbEmc0m2N7UKLqZ3OQ2HCq7e2OwdDq1N2/l4ZOjJwLY+FTqDact7HU8eSsDLyX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265354; c=relaxed/simple;
	bh=kNMwHaRLtPVDIk642/l9P6mRviNsamWl2CqZuLMpG/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=reXB+ek2ku51+if02qOh4X+neZe9cM1lr0usqhhBz3V/VqBBNAi7hCLcYlJqvRFCe+vCO7IgfCQ1WMim8i4u0M5YhRcgQ7ZYOSBACXaYJeTJJlWBOyeWLkvmc09vDvDmVe+l2pjsP+1PHFqgoTp100kFi1kyQM4eI64HDvEG5cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrsJHAx4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrsJHAx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774265351; x=1805801351;
  h=date:from:to:cc:subject:message-id;
  bh=kNMwHaRLtPVDIk642/l9P6mRviNsamWl2CqZuLMpG/A=;
  b=lrsJHAx4qSFR8YJX3IQUAT0EvbjK0JQXgJH82scKg2Bi6o5UDLH8RCTL
   3+5y/Yj7FPXaDayKcCtuWpgRhhBerTYUJyiFUe4Iecx53Ak2Sn+BkSTql
   zhS7AUD6l/LlFbEBJ4k2DgPC0xNU631k9pej+jPBWNib3ni6EGXwcIcsx
   oyi/6+jhUIodSaD6MbKcOZROZUnw8j9jzfHg9Ag+bv1TzbHRH20f0MZF8
   aF9OySIPK2MIKRrZVqIGyZfMpACT+tkcyrHnqYOehUEfGvFbor/XwJus6
   +mf9xnv3SWcpQdrqfuxXq8XEc7Vo7UmvZsgQJjBv/9QVx1N0an9lECV/1
   w==;
X-CSE-ConnectionGUID: vSHIe8lMQkKldnnHrJmCsQ==
X-CSE-MsgGUID: Etcz8IOySlelSxBeGDWYAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97879786"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97879786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:29:10 -0700
X-CSE-ConnectionGUID: mTN2suMEQ1K6DzAdEFdX+A==
X-CSE-MsgGUID: m1a8iHVmSZuAuXzTmTKG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224015225"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 04:29:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4dT0-000000000SB-1ue5;
	Mon, 23 Mar 2026 11:29:06 +0000
Date: Mon, 23 Mar 2026 19:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/net-sysfs.c:1961 netdev_queue_add_kobject() warn:
 Calling kobject_put|get with state->initialized unset from line: 1928
Message-ID: <202603231946.8tLVKCeh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Antoine Tenart <atenart@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 7e54f85c60828842be27e0149f3533357225090e net-sysfs: prevent uncleared queues from being re-added
date:   1 year, 1 month ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-r072-20260323 (https://download.01.org/0day-ci/archive/20260323/202603231946.8tLVKCeh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603231946.8tLVKCeh-lkp@intel.com/

New smatch warnings:
net/core/net-sysfs.c:1961 netdev_queue_add_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 1928

Old smatch warnings:
net/core/net-sysfs.c:1262 rx_queue_add_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 1224

vim +1961 net/core/net-sysfs.c

74293ea1c4db62 Breno Leitao      2024-02-16  1910  
6b53dafe23fd1f WANG Cong         2014-07-23  1911  static int netdev_queue_add_kobject(struct net_device *dev, int index)
1d24eb4815d1e0 Tom Herbert       2010-11-21  1912  {
6b53dafe23fd1f WANG Cong         2014-07-23  1913  	struct netdev_queue *queue = dev->_tx + index;
1d24eb4815d1e0 Tom Herbert       2010-11-21  1914  	struct kobject *kobj = &queue->kobj;
1d24eb4815d1e0 Tom Herbert       2010-11-21  1915  	int error = 0;
1d24eb4815d1e0 Tom Herbert       2010-11-21  1916  
7e54f85c608288 Antoine Tenart    2025-02-04  1917  	/* Tx queues are cleared in netdev_queue_release to allow later
7e54f85c608288 Antoine Tenart    2025-02-04  1918  	 * re-registration. This is triggered when their kobj refcount is
7e54f85c608288 Antoine Tenart    2025-02-04  1919  	 * dropped.
7e54f85c608288 Antoine Tenart    2025-02-04  1920  	 *
7e54f85c608288 Antoine Tenart    2025-02-04  1921  	 * If a queue is removed while both a read (or write) operation and a
7e54f85c608288 Antoine Tenart    2025-02-04  1922  	 * the re-addition of the same queue are pending (waiting on rntl_lock)
7e54f85c608288 Antoine Tenart    2025-02-04  1923  	 * it might happen that the re-addition will execute before the read,
7e54f85c608288 Antoine Tenart    2025-02-04  1924  	 * making the initial removal to never happen (queue's kobj refcount
7e54f85c608288 Antoine Tenart    2025-02-04  1925  	 * won't drop enough because of the pending read). In such rare case,
7e54f85c608288 Antoine Tenart    2025-02-04  1926  	 * return to allow the removal operation to complete.
7e54f85c608288 Antoine Tenart    2025-02-04  1927  	 */
7e54f85c608288 Antoine Tenart    2025-02-04  1928  	if (unlikely(kobj->state_initialized)) {
7e54f85c608288 Antoine Tenart    2025-02-04  1929  		netdev_warn_once(dev, "Cannot re-add tx queues before their removal completed");
7e54f85c608288 Antoine Tenart    2025-02-04  1930  		return -EAGAIN;
7e54f85c608288 Antoine Tenart    2025-02-04  1931  	}
7e54f85c608288 Antoine Tenart    2025-02-04  1932  
e0b60903b434a7 Jouni Hogander    2019-12-05  1933  	/* Kobject_put later will trigger netdev_queue_release call
e0b60903b434a7 Jouni Hogander    2019-12-05  1934  	 * which decreases dev refcount: Take that reference here
e0b60903b434a7 Jouni Hogander    2019-12-05  1935  	 */
d62607c3fe4591 Jakub Kicinski    2022-06-07  1936  	netdev_hold(queue->dev, &queue->dev_tracker, GFP_KERNEL);
e0b60903b434a7 Jouni Hogander    2019-12-05  1937  
6b53dafe23fd1f WANG Cong         2014-07-23  1938  	kobj->kset = dev->queues_kset;
1d24eb4815d1e0 Tom Herbert       2010-11-21  1939  	error = kobject_init_and_add(kobj, &netdev_queue_ktype, NULL,
1d24eb4815d1e0 Tom Herbert       2010-11-21  1940  				     "tx-%u", index);
114cf5802165ee Tom Herbert       2011-11-28  1941  	if (error)
b8eb718348b8fb Jouni Hogander    2019-11-20  1942  		goto err;
114cf5802165ee Tom Herbert       2011-11-28  1943  
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1944  	queue->groups = netdev_queue_default_groups;
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1945  	error = sysfs_create_groups(kobj, queue->groups);
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1946  	if (error)
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1947  		goto err;
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1948  
74293ea1c4db62 Breno Leitao      2024-02-16  1949  	if (netdev_uses_bql(dev)) {
114cf5802165ee Tom Herbert       2011-11-28  1950  		error = sysfs_create_group(kobj, &dql_group);
b8eb718348b8fb Jouni Hogander    2019-11-20  1951  		if (error)
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1952  			goto err_default_groups;
74293ea1c4db62 Breno Leitao      2024-02-16  1953  	}
1d24eb4815d1e0 Tom Herbert       2010-11-21  1954  
1d24eb4815d1e0 Tom Herbert       2010-11-21  1955  	kobject_uevent(kobj, KOBJ_ADD);
48a322b6f9965b Eric Dumazet      2019-11-20  1956  	return 0;
1d24eb4815d1e0 Tom Herbert       2010-11-21  1957  
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1958  err_default_groups:
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1959  	sysfs_remove_groups(kobj, queue->groups);
b8eb718348b8fb Jouni Hogander    2019-11-20  1960  err:
b8eb718348b8fb Jouni Hogander    2019-11-20 @1961  	kobject_put(kobj);
b8eb718348b8fb Jouni Hogander    2019-11-20  1962  	return error;
1d24eb4815d1e0 Tom Herbert       2010-11-21  1963  }
d755407d4444c3 Christian Brauner 2020-02-27  1964  

:::::: The code at line 1961 was first introduced by commit
:::::: b8eb718348b8fb30b5a7d0a8fce26fb3f4ac741b net-sysfs: Fix reference count leak in rx|netdev_queue_add_kobject

:::::: TO: Jouni Hogander <jouni.hogander@unikie.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
