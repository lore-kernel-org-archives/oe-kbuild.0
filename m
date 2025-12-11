Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC98DF49
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 22:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765493875; cv=none; b=I1YNWwWPvvE1y5JpMXjq5GZXmLR1hZ+kmxgTSAKua/rL1H/a58u6+4MDj5QZit4IixYFBWoz4Nonyv5WRDdIwC+9HvhuIaYhgCvE2vOXbmeKWn5NRmCyztjt1jCVvoEbv8RalfS7uuML278W/TifYR82xBlOwNJZCbcb3wB8Ps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765493875; c=relaxed/simple;
	bh=EE2NESID90XKHptVH85rHiSWxAZplVuS39jsywpXDJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dzzdQFxNoeR+D+XyoYXFPCNLpHljV+6yt2n8ZtYNXgvwC/CBEcOQlhfXla8kYaKOCt8WRIIddzocAQkD1v6PYlfbNcCbrJfNjSpYjRBCxtE/yMHB/ocxUaiDN6qwrZNK3ENlwqtn1ghgDrWLg1hl8YUJqgl0Nos/2UvMQo5Am64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcaqyJeM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcaqyJeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765493874; x=1797029874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EE2NESID90XKHptVH85rHiSWxAZplVuS39jsywpXDJ4=;
  b=YcaqyJeM8xMKMa0qYw6wcd/gd2TvoSuM0jWT0/8e+Z0DEAAqNWgNS9x0
   9PhDSz5uQy1Zt/iAlYrObKvaPcSi3V6oUaNwndDJlZ1C8K+S5j7t6dOa6
   2UrxbmNFQN2bkpgqleCXHVS7HZ9QayMAtYaoR91QFvXGK59alR97jJ5Uw
   cAweltqk5WrvbULGqoAc+Axm74RXS04qgW7txVi+9BDvoZvXIURyS2cRS
   fSASfiogljWiiTpeXf58POXTk/COtqM1Yaq2/bWDQi7kauX25H2FGaD0c
   Pv9Q06QVRxxpNd31DvTsgN4o23eJ+fU2aiK/pIRZUWB14DcmZMIKl1Wys
   Q==;
X-CSE-ConnectionGUID: XYKpRVOLS0entW+WFugoug==
X-CSE-MsgGUID: Vc+fwgntS1C8JCTFd/t9lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78949409"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78949409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:57:54 -0800
X-CSE-ConnectionGUID: rIM50lPZT/uxKsyW83rAZg==
X-CSE-MsgGUID: f1QzkpTwTQ+wh/6b3gjBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201086676"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 14:57:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpbZ-000000005AT-3fkw;
	Thu, 11 Dec 2025 22:57:49 +0000
Date: Fri, 12 Dec 2025 06:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/net-sysfs.c:1262 rx_queue_add_kobject() warn: Calling
 kobject_put|get with state->initialized unset from line: 1224
Message-ID: <202512120600.lWwGW3YS-lkp@intel.com>
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
TO: Antoine Tenart <atenart@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 7e54f85c60828842be27e0149f3533357225090e net-sysfs: prevent uncleared queues from being re-added
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120600.lWwGW3YS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120600.lWwGW3YS-lkp@intel.com/

smatch warnings:
net/core/net-sysfs.c:1262 rx_queue_add_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 1224
net/core/net-sysfs.c:1961 netdev_queue_add_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 1928

vim +1262 net/core/net-sysfs.c

50bcfe8df7c73c Paolo Abeni       2023-02-17  1206  
6b53dafe23fd1f WANG Cong         2014-07-23  1207  static int rx_queue_add_kobject(struct net_device *dev, int index)
0a9627f2649a02 Tom Herbert       2010-03-16  1208  {
6b53dafe23fd1f WANG Cong         2014-07-23  1209  	struct netdev_rx_queue *queue = dev->_rx + index;
0a9627f2649a02 Tom Herbert       2010-03-16  1210  	struct kobject *kobj = &queue->kobj;
0a9627f2649a02 Tom Herbert       2010-03-16  1211  	int error = 0;
0a9627f2649a02 Tom Herbert       2010-03-16  1212  
7e54f85c608288 Antoine Tenart    2025-02-04  1213  	/* Rx queues are cleared in rx_queue_release to allow later
7e54f85c608288 Antoine Tenart    2025-02-04  1214  	 * re-registration. This is triggered when their kobj refcount is
7e54f85c608288 Antoine Tenart    2025-02-04  1215  	 * dropped.
7e54f85c608288 Antoine Tenart    2025-02-04  1216  	 *
7e54f85c608288 Antoine Tenart    2025-02-04  1217  	 * If a queue is removed while both a read (or write) operation and a
7e54f85c608288 Antoine Tenart    2025-02-04  1218  	 * the re-addition of the same queue are pending (waiting on rntl_lock)
7e54f85c608288 Antoine Tenart    2025-02-04  1219  	 * it might happen that the re-addition will execute before the read,
7e54f85c608288 Antoine Tenart    2025-02-04  1220  	 * making the initial removal to never happen (queue's kobj refcount
7e54f85c608288 Antoine Tenart    2025-02-04  1221  	 * won't drop enough because of the pending read). In such rare case,
7e54f85c608288 Antoine Tenart    2025-02-04  1222  	 * return to allow the removal operation to complete.
7e54f85c608288 Antoine Tenart    2025-02-04  1223  	 */
7e54f85c608288 Antoine Tenart    2025-02-04  1224  	if (unlikely(kobj->state_initialized)) {
7e54f85c608288 Antoine Tenart    2025-02-04  1225  		netdev_warn_once(dev, "Cannot re-add rx queues before their removal completed");
7e54f85c608288 Antoine Tenart    2025-02-04  1226  		return -EAGAIN;
7e54f85c608288 Antoine Tenart    2025-02-04  1227  	}
7e54f85c608288 Antoine Tenart    2025-02-04  1228  
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1229  	/* Kobject_put later will trigger rx_queue_release call which
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1230  	 * decreases dev refcount: Take that reference here
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1231  	 */
d62607c3fe4591 Jakub Kicinski    2022-06-07  1232  	netdev_hold(queue->dev, &queue->dev_tracker, GFP_KERNEL);
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1233  
6b53dafe23fd1f WANG Cong         2014-07-23  1234  	kobj->kset = dev->queues_kset;
0a9627f2649a02 Tom Herbert       2010-03-16  1235  	error = kobject_init_and_add(kobj, &rx_queue_ktype, NULL,
0a9627f2649a02 Tom Herbert       2010-03-16  1236  				     "rx-%u", index);
a953be53ce4044 Michael Dalton    2014-01-16  1237  	if (error)
b8eb718348b8fb Jouni Hogander    2019-11-20  1238  		goto err;
a953be53ce4044 Michael Dalton    2014-01-16  1239  
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1240  	queue->groups = rx_queue_default_groups;
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1241  	error = sysfs_create_groups(kobj, queue->groups);
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1242  	if (error)
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1243  		goto err;
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1244  
6b53dafe23fd1f WANG Cong         2014-07-23  1245  	if (dev->sysfs_rx_queue_group) {
6b53dafe23fd1f WANG Cong         2014-07-23  1246  		error = sysfs_create_group(kobj, dev->sysfs_rx_queue_group);
b8eb718348b8fb Jouni Hogander    2019-11-20  1247  		if (error)
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1248  			goto err_default_groups;
0a9627f2649a02 Tom Herbert       2010-03-16  1249  	}
0a9627f2649a02 Tom Herbert       2010-03-16  1250  
50bcfe8df7c73c Paolo Abeni       2023-02-17  1251  	error = rx_queue_default_mask(dev, queue);
605cfa1b1090b5 Paolo Abeni       2023-02-07  1252  	if (error)
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1253  		goto err_default_groups;
50bcfe8df7c73c Paolo Abeni       2023-02-17  1254  
0a9627f2649a02 Tom Herbert       2010-03-16  1255  	kobject_uevent(kobj, KOBJ_ADD);
0a9627f2649a02 Tom Herbert       2010-03-16  1256  
0a9627f2649a02 Tom Herbert       2010-03-16  1257  	return error;
b8eb718348b8fb Jouni Hogander    2019-11-20  1258  
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1259  err_default_groups:
b7ecc1de51ca7d Antoine Tenart    2025-02-04  1260  	sysfs_remove_groups(kobj, queue->groups);
b8eb718348b8fb Jouni Hogander    2019-11-20  1261  err:
b8eb718348b8fb Jouni Hogander    2019-11-20 @1262  	kobject_put(kobj);
b8eb718348b8fb Jouni Hogander    2019-11-20  1263  	return error;
0a9627f2649a02 Tom Herbert       2010-03-16  1264  }
d755407d4444c3 Christian Brauner 2020-02-27  1265  

:::::: The code at line 1262 was first introduced by commit
:::::: b8eb718348b8fb30b5a7d0a8fce26fb3f4ac741b net-sysfs: Fix reference count leak in rx|netdev_queue_add_kobject

:::::: TO: Jouni Hogander <jouni.hogander@unikie.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
