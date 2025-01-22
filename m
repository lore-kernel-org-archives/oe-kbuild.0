Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F82139C9
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553985; cv=none; b=XOdtQJwzBJsy3pRkgu/WW3qIdy6QlfM5+sZk/74iC0kje0cQFO5/xbABq1gOz6vJ7HwYORCQScCA0IWJ0Vd3HPirPFKrHZwLpmJXkiHFmGLVq0rQ9TAdXRTcdaxaKi5jspPCuRpTpD1mm7shlD9gCSiRi1Tvk4iZx7bjv0NTilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553985; c=relaxed/simple;
	bh=p9IOpYOvxsxxXBTBa7o1+Z5IKhl89GIP+RbEyxpOzB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+A2sdGpPIGmCJVMKuFwDt2xcxAx/LGOAXSkt7oCdeHn1H3nL62cRrxhUK3Uo8u5NYHgzJmpsHcYuBb1xJo4kpVH1P61Lsouuyx47j4FOADvFMFkLgRaadK2DEykOXKK9FoMSl13mNXWbY56iunUQYHkYF2RlFKNt7+f+u4j5Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGMxQ9EU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGMxQ9EU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737553983; x=1769089983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9IOpYOvxsxxXBTBa7o1+Z5IKhl89GIP+RbEyxpOzB0=;
  b=QGMxQ9EUw9qyGzhceesTXcguXD59n8NGjBA4wfh7TWPP2IJWqd5RfVO0
   esSnUeLDEUUVCjMDAq3VhGEY70M1w4FGLxKO2lYWZOet1mpNm9jh6XLHb
   n7Pepv13OO1xSjYmdXgoz75SX6vCQeev7PjgIY/pDG++O8J7R00AunzzI
   QtgCPnrPg/aCmR5fVID980BkJ71Zwrg8ybUoE0WTYbh7c/4SWXb/ZMKD6
   vM2yUjaykgBsREORxSNWBXwOGPMxWUXg7OAhiV6WpMvauyzb1evBTX2Zl
   8rI2pQKewuhg7LBMt/CzRku/exndrQv++Nm0hZaNJxcPDTrVWfNqACSYs
   w==;
X-CSE-ConnectionGUID: xVqD7EXJTUCVg1MQQIiO0Q==
X-CSE-MsgGUID: Aaf9jQgwScSNehYeTEYQvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38179016"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38179016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 05:53:03 -0800
X-CSE-ConnectionGUID: 3H9YPEIIRzifS1qvHxF2bQ==
X-CSE-MsgGUID: Wx4H9No2QcmA7u4+eHjDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="106953651"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2025 05:53:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tabAB-000Zv9-0j;
	Wed, 22 Jan 2025 13:52:59 +0000
Date: Wed, 22 Jan 2025 21:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 3/4] net-sysfs: prevent uncleared queues from
 being re-added
Message-ID: <202501222127.IpSq0NYU-lkp@intel.com>
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
In-Reply-To: <20250117102612.132644-4-atenart@kernel.org>
References: <20250117102612.132644-4-atenart@kernel.org>
TO: Antoine Tenart <atenart@kernel.org>

Hi Antoine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoine-Tenart/net-sysfs-remove-rtnl_trylock-from-device-attributes/20250117-182859
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250117102612.132644-4-atenart%40kernel.org
patch subject: [PATCH net-next 3/4] net-sysfs: prevent uncleared queues from being re-added
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r072-20250122 (https://download.01.org/0day-ci/archive/20250122/202501222127.IpSq0NYU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501222127.IpSq0NYU-lkp@intel.com/

smatch warnings:
net/core/net-sysfs.c:1260 rx_queue_add_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 1224
net/core/net-sysfs.c:1957 netdev_queue_add_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 1926

vim +1260 net/core/net-sysfs.c

50bcfe8df7c73c Paolo Abeni       2023-02-17  1206  
6b53dafe23fd1f WANG Cong         2014-07-23  1207  static int rx_queue_add_kobject(struct net_device *dev, int index)
0a9627f2649a02 Tom Herbert       2010-03-16  1208  {
6b53dafe23fd1f WANG Cong         2014-07-23  1209  	struct netdev_rx_queue *queue = dev->_rx + index;
0a9627f2649a02 Tom Herbert       2010-03-16  1210  	struct kobject *kobj = &queue->kobj;
0a9627f2649a02 Tom Herbert       2010-03-16  1211  	int error = 0;
0a9627f2649a02 Tom Herbert       2010-03-16  1212  
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1213  	/* Rx queues are cleared in rx_queue_release to allow later
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1214  	 * re-registration. This is triggered when their kobj refcount is
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1215  	 * dropped.
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1216  	 *
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1217  	 * If a queue is removed while both a read (or write) operation and a
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1218  	 * the re-addition of the same queue are pending (waiting on rntl_lock)
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1219  	 * it might happen that the re-addition will execute before the read,
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1220  	 * making the initial removal to never happen (queue's kobj refcount
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1221  	 * won't drop enough because of the pending read). In such rare case,
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1222  	 * return to allow the removal operation to complete.
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1223  	 */
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1224  	if (unlikely(kobj->state_initialized))
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1225  		return -EAGAIN;
a5f9a5063bfab8 Antoine Tenart    2025-01-17  1226  
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1227  	/* Kobject_put later will trigger rx_queue_release call which
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1228  	 * decreases dev refcount: Take that reference here
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1229  	 */
d62607c3fe4591 Jakub Kicinski    2022-06-07  1230  	netdev_hold(queue->dev, &queue->dev_tracker, GFP_KERNEL);
ddd9b5e3e765d8 Jouni Hogander    2019-12-17  1231  
6b53dafe23fd1f WANG Cong         2014-07-23  1232  	kobj->kset = dev->queues_kset;
0a9627f2649a02 Tom Herbert       2010-03-16  1233  	error = kobject_init_and_add(kobj, &rx_queue_ktype, NULL,
0a9627f2649a02 Tom Herbert       2010-03-16  1234  				     "rx-%u", index);
a953be53ce4044 Michael Dalton    2014-01-16  1235  	if (error)
b8eb718348b8fb Jouni Hogander    2019-11-20  1236  		goto err;
a953be53ce4044 Michael Dalton    2014-01-16  1237  
3ffe913d2a224b Antoine Tenart    2025-01-17  1238  	queue->groups = rx_queue_default_groups;
3ffe913d2a224b Antoine Tenart    2025-01-17  1239  	error = sysfs_create_groups(kobj, queue->groups);
3ffe913d2a224b Antoine Tenart    2025-01-17  1240  	if (error)
3ffe913d2a224b Antoine Tenart    2025-01-17  1241  		goto err;
3ffe913d2a224b Antoine Tenart    2025-01-17  1242  
6b53dafe23fd1f WANG Cong         2014-07-23  1243  	if (dev->sysfs_rx_queue_group) {
6b53dafe23fd1f WANG Cong         2014-07-23  1244  		error = sysfs_create_group(kobj, dev->sysfs_rx_queue_group);
b8eb718348b8fb Jouni Hogander    2019-11-20  1245  		if (error)
3ffe913d2a224b Antoine Tenart    2025-01-17  1246  			goto err_default_groups;
0a9627f2649a02 Tom Herbert       2010-03-16  1247  	}
0a9627f2649a02 Tom Herbert       2010-03-16  1248  
50bcfe8df7c73c Paolo Abeni       2023-02-17  1249  	error = rx_queue_default_mask(dev, queue);
605cfa1b1090b5 Paolo Abeni       2023-02-07  1250  	if (error)
3ffe913d2a224b Antoine Tenart    2025-01-17  1251  		goto err_default_groups;
50bcfe8df7c73c Paolo Abeni       2023-02-17  1252  
0a9627f2649a02 Tom Herbert       2010-03-16  1253  	kobject_uevent(kobj, KOBJ_ADD);
0a9627f2649a02 Tom Herbert       2010-03-16  1254  
0a9627f2649a02 Tom Herbert       2010-03-16  1255  	return error;
b8eb718348b8fb Jouni Hogander    2019-11-20  1256  
3ffe913d2a224b Antoine Tenart    2025-01-17  1257  err_default_groups:
3ffe913d2a224b Antoine Tenart    2025-01-17  1258  	sysfs_remove_groups(kobj, queue->groups);
b8eb718348b8fb Jouni Hogander    2019-11-20  1259  err:
b8eb718348b8fb Jouni Hogander    2019-11-20 @1260  	kobject_put(kobj);
b8eb718348b8fb Jouni Hogander    2019-11-20  1261  	return error;
0a9627f2649a02 Tom Herbert       2010-03-16  1262  }
d755407d4444c3 Christian Brauner 2020-02-27  1263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
