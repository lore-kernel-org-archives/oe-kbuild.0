Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385D1991CA
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758563646; cv=none; b=O1HpPy+lYkfO9CtsTnCbkrX/tBrTr7QWgNoIg8ycxiGTtvFQptRiQv1aWOwJJt9+dTfbyZI9bnCviB6/86mM9+nB7ibVdjPsp5GSSHS+wI0HC3QkhJ03PRAwENChe2h6MQZ295tSRjj1ssO07MLzrBFLqyysP5VY0pac5vwi7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758563646; c=relaxed/simple;
	bh=CKJSPihiM2ModUDfAWiBfnMgQHIeivA7f8OUypCeB64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZ6s02hLmQ4nyzLEftn646nsWvzMiGn+4m5AKbaLlLsMnM1CcOucqe3CYYSHw6HHPzFMLR2YR8dkml4XAPxgFz8JqIkcVJ/1sWxhKleCq2izq7niYh0h9D+86SwPz7vCXXzYRLSQZ8Q8dr7vFyagQKNRJFpH8OTfgJBUqZKlEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ye9PD5Py; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ye9PD5Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758563644; x=1790099644;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CKJSPihiM2ModUDfAWiBfnMgQHIeivA7f8OUypCeB64=;
  b=Ye9PD5PyuJkkJaCZRwIDbQ3L/sNO0YzFIJ8FERVnPttMNBkAmUszxyh6
   z9TTjnMs21f4u++w956KdTYY/yrp2KPyknwi8B1LRZ8LAXUi0GcG8U1Bt
   wt++ucjoFm6V37oqVSZJ6IJvc/XC3jxrJIwwDuHFjlL/Ea+tB9SR36pVT
   mUBZ5fj0gJ026fCPDUpWnOW83Eut3RJDvBxeAjHlluOfbS9eSkr/Ot4Sh
   jG4NGBr9V+L/2xexctBZkRq/LFsMxXn7kPfc8DDzXKLKnAJ6MEBE/NU2Y
   xHUx7VUfSlrsUapTAZE1m2GwC+0gHGoPUTsq+g/dRuBiEdSYai5UKxxQG
   A==;
X-CSE-ConnectionGUID: bpIcCczyQPeEmE6j+5tTXA==
X-CSE-MsgGUID: V9yV5DCCST6A9IpAzrNRiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60951178"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="60951178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:54:02 -0700
X-CSE-ConnectionGUID: oDPskf7qQ7S/J8QRAF5XvA==
X-CSE-MsgGUID: +xk75A1TTIqdZOyiWP/vKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="180929808"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2025 10:54:00 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0kje-0001vx-1P;
	Mon, 22 Sep 2025 17:53:58 +0000
Date: Tue, 23 Sep 2025 01:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 5/6] vduse: add vq group asid support
Message-ID: <202509230106.6vVeTgoR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250919093359.961296-6-eperezma@redhat.com>
References: <20250919093359.961296-6-eperezma@redhat.com>
TO: "Eugenio Pérez" <eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[cannot apply to linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-make-domain_lock-an-rwlock/20250919-174108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250919093359.961296-6-eperezma%40redhat.com
patch subject: [PATCH v3 5/6] vduse: add vq group asid support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250923/202509230106.6vVeTgoR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509230106.6vVeTgoR-lkp@intel.com/

New smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:1644 vduse_dev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:662 vduse_get_vq_map() warn: unsigned 'vq_group' is never less than zero.
drivers/vdpa/vdpa_user/vduse_dev.c:662 vduse_get_vq_map() warn: error code type promoted to positive: 'vq_group'

vim +1644 drivers/vdpa/vdpa_user/vduse_dev.c

28f6288eb63d59 Xie Yongji    2023-03-23  1326  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1327  static long vduse_dev_ioctl(struct file *file, unsigned int cmd,
c8a6153b6c59d9 Xie Yongji    2021-08-31  1328  			    unsigned long arg)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1329  {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1330  	struct vduse_dev *dev = file->private_data;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1331  	void __user *argp = (void __user *)arg;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1332  	int ret;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1333  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1334  	if (unlikely(dev->broken))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1335  		return -EPERM;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1336  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1337  	switch (cmd) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1338  	case VDUSE_IOTLB_GET_FD: {
5df53984377b18 Eugenio Pérez 2025-09-19  1339  		struct vduse_iotlb_entry_v2 entry;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1340  		struct vhost_iotlb_map *map;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1341  		struct vdpa_map_file *map_file;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1342  		struct file *f = NULL;
5df53984377b18 Eugenio Pérez 2025-09-19  1343  		u32 asid;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1344  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1345  		ret = -EFAULT;
5df53984377b18 Eugenio Pérez 2025-09-19  1346  		if (dev->api_version >= VDUSE_API_VERSION_1) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1347  			if (copy_from_user(&entry, argp, sizeof(entry)))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1348  				break;
5df53984377b18 Eugenio Pérez 2025-09-19  1349  		} else {
5df53984377b18 Eugenio Pérez 2025-09-19  1350  			entry.asid = 0;
5df53984377b18 Eugenio Pérez 2025-09-19  1351  			if (copy_from_user(&entry.v1, argp,
5df53984377b18 Eugenio Pérez 2025-09-19  1352  					   sizeof(entry.v1)))
5df53984377b18 Eugenio Pérez 2025-09-19  1353  				break;
5df53984377b18 Eugenio Pérez 2025-09-19  1354  		}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1355  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1356  		ret = -EINVAL;
5df53984377b18 Eugenio Pérez 2025-09-19  1357  		if (entry.v1.start > entry.v1.last)
5df53984377b18 Eugenio Pérez 2025-09-19  1358  			break;
5df53984377b18 Eugenio Pérez 2025-09-19  1359  
5df53984377b18 Eugenio Pérez 2025-09-19  1360  		if (entry.asid >= dev->nas)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1361  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1362  
50988b052b5f91 Eugenio Pérez 2025-09-19  1363  		read_lock(&dev->domain_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1364  		asid = array_index_nospec(entry.asid, dev->nas);
5df53984377b18 Eugenio Pérez 2025-09-19  1365  		if (!dev->as[asid].domain) {
50988b052b5f91 Eugenio Pérez 2025-09-19  1366  			read_unlock(&dev->domain_lock);
d4438d23eeeef8 Xie Yongji    2023-03-23  1367  			break;
d4438d23eeeef8 Xie Yongji    2023-03-23  1368  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1369  		spin_lock(&dev->as[asid].domain->iotlb_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1370  		map = vhost_iotlb_itree_first(dev->as[asid].domain->iotlb,
5df53984377b18 Eugenio Pérez 2025-09-19  1371  					      entry.v1.start, entry.v1.last);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1372  		if (map) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1373  			map_file = (struct vdpa_map_file *)map->opaque;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1374  			f = get_file(map_file->file);
5df53984377b18 Eugenio Pérez 2025-09-19  1375  			entry.v1.offset = map_file->offset;
5df53984377b18 Eugenio Pérez 2025-09-19  1376  			entry.v1.start = map->start;
5df53984377b18 Eugenio Pérez 2025-09-19  1377  			entry.v1.last = map->last;
5df53984377b18 Eugenio Pérez 2025-09-19  1378  			entry.v1.perm = map->perm;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1379  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1380  		spin_unlock(&dev->as[asid].domain->iotlb_lock);
50988b052b5f91 Eugenio Pérez 2025-09-19  1381  		read_unlock(&dev->domain_lock);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1382  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1383  		if (!f)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1384  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1385  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1386  		ret = -EFAULT;
5df53984377b18 Eugenio Pérez 2025-09-19  1387  		if (dev->api_version >= VDUSE_API_VERSION_1)
5df53984377b18 Eugenio Pérez 2025-09-19  1388  			ret = copy_to_user(argp, &entry,
5df53984377b18 Eugenio Pérez 2025-09-19  1389  					   sizeof(entry));
5df53984377b18 Eugenio Pérez 2025-09-19  1390  		else
5df53984377b18 Eugenio Pérez 2025-09-19  1391  			ret = copy_to_user(argp, &entry.v1,
5df53984377b18 Eugenio Pérez 2025-09-19  1392  					   sizeof(entry.v1));
5df53984377b18 Eugenio Pérez 2025-09-19  1393  
5df53984377b18 Eugenio Pérez 2025-09-19  1394  		if (ret) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1395  			fput(f);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1396  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1397  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1398  		ret = receive_fd(f, NULL, perm_to_file_flags(entry.v1.perm));
c8a6153b6c59d9 Xie Yongji    2021-08-31  1399  		fput(f);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1400  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1401  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1402  	case VDUSE_DEV_GET_FEATURES:
c8a6153b6c59d9 Xie Yongji    2021-08-31  1403  		/*
c8a6153b6c59d9 Xie Yongji    2021-08-31  1404  		 * Just mirror what driver wrote here.
c8a6153b6c59d9 Xie Yongji    2021-08-31  1405  		 * The driver is expected to check FEATURE_OK later.
c8a6153b6c59d9 Xie Yongji    2021-08-31  1406  		 */
c8a6153b6c59d9 Xie Yongji    2021-08-31  1407  		ret = put_user(dev->driver_features, (u64 __user *)argp);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1408  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1409  	case VDUSE_DEV_SET_CONFIG: {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1410  		struct vduse_config_data config;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1411  		unsigned long size = offsetof(struct vduse_config_data,
c8a6153b6c59d9 Xie Yongji    2021-08-31  1412  					      buffer);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1413  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1414  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1415  		if (copy_from_user(&config, argp, size))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1416  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1417  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1418  		ret = -EINVAL;
ff9f9c6e748481 Dan Carpenter 2021-12-08  1419  		if (config.offset > dev->config_size ||
ff9f9c6e748481 Dan Carpenter 2021-12-08  1420  		    config.length == 0 ||
c8a6153b6c59d9 Xie Yongji    2021-08-31  1421  		    config.length > dev->config_size - config.offset)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1422  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1423  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1424  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1425  		if (copy_from_user(dev->config + config.offset, argp + size,
c8a6153b6c59d9 Xie Yongji    2021-08-31  1426  				   config.length))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1427  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1428  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1429  		ret = 0;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1430  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1431  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1432  	case VDUSE_DEV_INJECT_CONFIG_IRQ:
28f6288eb63d59 Xie Yongji    2023-03-23  1433  		ret = vduse_dev_queue_irq_work(dev, &dev->inject, IRQ_UNBOUND);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1434  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1435  	case VDUSE_VQ_SETUP: {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1436  		struct vduse_vq_config config;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1437  		u32 index;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1438  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1439  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1440  		if (copy_from_user(&config, argp, sizeof(config)))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1441  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1442  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1443  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1444  		if (config.index >= dev->vq_num)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1445  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1446  
d509f6777c235e Eugenio Pérez 2025-09-19  1447  		if (dev->api_version < VDUSE_API_VERSION_1 && config.group)
d509f6777c235e Eugenio Pérez 2025-09-19  1448  			break;
d509f6777c235e Eugenio Pérez 2025-09-19  1449  
d509f6777c235e Eugenio Pérez 2025-09-19  1450  		if (dev->api_version >= VDUSE_API_VERSION_1) {
d509f6777c235e Eugenio Pérez 2025-09-19  1451  			if (config.group > dev->ngroups)
d509f6777c235e Eugenio Pérez 2025-09-19  1452  				break;
d509f6777c235e Eugenio Pérez 2025-09-19  1453  			if (dev->status & VIRTIO_CONFIG_S_DRIVER_OK)
d509f6777c235e Eugenio Pérez 2025-09-19  1454  				break;
d509f6777c235e Eugenio Pérez 2025-09-19  1455  		}
d509f6777c235e Eugenio Pérez 2025-09-19  1456  
d509f6777c235e Eugenio Pérez 2025-09-19  1457  		if (config.reserved1 ||
d509f6777c235e Eugenio Pérez 2025-09-19  1458  		    !is_mem_zero((const char *)config.reserved2,
d509f6777c235e Eugenio Pérez 2025-09-19  1459  				 sizeof(config.reserved2)))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1460  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1461  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1462  		index = array_index_nospec(config.index, dev->vq_num);
78885597b9ccf6 Xie Yongji    2023-03-23  1463  		dev->vqs[index]->num_max = config.max_size;
d509f6777c235e Eugenio Pérez 2025-09-19  1464  		dev->vqs[index]->vq_group = config.group;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1465  		ret = 0;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1466  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1467  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1468  	case VDUSE_VQ_GET_INFO: {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1469  		struct vduse_vq_info vq_info;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1470  		struct vduse_virtqueue *vq;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1471  		u32 index;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1472  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1473  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1474  		if (copy_from_user(&vq_info, argp, sizeof(vq_info)))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1475  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1476  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1477  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1478  		if (vq_info.index >= dev->vq_num)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1479  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1480  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1481  		index = array_index_nospec(vq_info.index, dev->vq_num);
78885597b9ccf6 Xie Yongji    2023-03-23  1482  		vq = dev->vqs[index];
c8a6153b6c59d9 Xie Yongji    2021-08-31  1483  		vq_info.desc_addr = vq->desc_addr;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1484  		vq_info.driver_addr = vq->driver_addr;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1485  		vq_info.device_addr = vq->device_addr;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1486  		vq_info.num = vq->num;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1487  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1488  		if (dev->driver_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1489  			vq_info.packed.last_avail_counter =
c8a6153b6c59d9 Xie Yongji    2021-08-31  1490  				vq->state.packed.last_avail_counter;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1491  			vq_info.packed.last_avail_idx =
c8a6153b6c59d9 Xie Yongji    2021-08-31  1492  				vq->state.packed.last_avail_idx;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1493  			vq_info.packed.last_used_counter =
c8a6153b6c59d9 Xie Yongji    2021-08-31  1494  				vq->state.packed.last_used_counter;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1495  			vq_info.packed.last_used_idx =
c8a6153b6c59d9 Xie Yongji    2021-08-31  1496  				vq->state.packed.last_used_idx;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1497  		} else
c8a6153b6c59d9 Xie Yongji    2021-08-31  1498  			vq_info.split.avail_index =
c8a6153b6c59d9 Xie Yongji    2021-08-31  1499  				vq->state.split.avail_index;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1500  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1501  		vq_info.ready = vq->ready;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1502  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1503  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1504  		if (copy_to_user(argp, &vq_info, sizeof(vq_info)))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1505  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1506  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1507  		ret = 0;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1508  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1509  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1510  	case VDUSE_VQ_SETUP_KICKFD: {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1511  		struct vduse_vq_eventfd eventfd;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1512  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1513  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1514  		if (copy_from_user(&eventfd, argp, sizeof(eventfd)))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1515  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1516  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1517  		ret = vduse_kickfd_setup(dev, &eventfd);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1518  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1519  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1520  	case VDUSE_VQ_INJECT_IRQ: {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1521  		u32 index;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1522  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1523  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1524  		if (get_user(index, (u32 __user *)argp))
c8a6153b6c59d9 Xie Yongji    2021-08-31  1525  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1526  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1527  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1528  		if (index >= dev->vq_num)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1529  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1530  
e38632dd71818d Xie Yongji    2023-03-23  1531  		ret = 0;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1532  		index = array_index_nospec(index, dev->vq_num);
e38632dd71818d Xie Yongji    2023-03-23  1533  		if (!vduse_vq_signal_irqfd(dev->vqs[index])) {
28f6288eb63d59 Xie Yongji    2023-03-23  1534  			vduse_vq_update_effective_cpu(dev->vqs[index]);
e38632dd71818d Xie Yongji    2023-03-23  1535  			ret = vduse_dev_queue_irq_work(dev,
e38632dd71818d Xie Yongji    2023-03-23  1536  						&dev->vqs[index]->inject,
28f6288eb63d59 Xie Yongji    2023-03-23  1537  						dev->vqs[index]->irq_effective_cpu);
e38632dd71818d Xie Yongji    2023-03-23  1538  		}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1539  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1540  	}
79a463be9e0051 Xie Yongji    2022-08-03  1541  	case VDUSE_IOTLB_REG_UMEM: {
79a463be9e0051 Xie Yongji    2022-08-03  1542  		struct vduse_iova_umem umem;
5df53984377b18 Eugenio Pérez 2025-09-19  1543  		u32 asid;
79a463be9e0051 Xie Yongji    2022-08-03  1544  
79a463be9e0051 Xie Yongji    2022-08-03  1545  		ret = -EFAULT;
79a463be9e0051 Xie Yongji    2022-08-03  1546  		if (copy_from_user(&umem, argp, sizeof(umem)))
79a463be9e0051 Xie Yongji    2022-08-03  1547  			break;
79a463be9e0051 Xie Yongji    2022-08-03  1548  
79a463be9e0051 Xie Yongji    2022-08-03  1549  		ret = -EINVAL;
79a463be9e0051 Xie Yongji    2022-08-03  1550  		if (!is_mem_zero((const char *)umem.reserved,
5df53984377b18 Eugenio Pérez 2025-09-19  1551  				 sizeof(umem.reserved)) ||
5df53984377b18 Eugenio Pérez 2025-09-19  1552  		    (dev->api_version < VDUSE_API_VERSION_1 &&
5df53984377b18 Eugenio Pérez 2025-09-19  1553  		     umem.asid != 0) || umem.asid >= dev->nas)
79a463be9e0051 Xie Yongji    2022-08-03  1554  			break;
79a463be9e0051 Xie Yongji    2022-08-03  1555  
50988b052b5f91 Eugenio Pérez 2025-09-19  1556  		write_lock(&dev->domain_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1557  		asid = array_index_nospec(umem.asid, dev->nas);
5df53984377b18 Eugenio Pérez 2025-09-19  1558  		ret = vduse_dev_reg_umem(dev, asid, umem.iova,
79a463be9e0051 Xie Yongji    2022-08-03  1559  					 umem.uaddr, umem.size);
50988b052b5f91 Eugenio Pérez 2025-09-19  1560  		write_unlock(&dev->domain_lock);
79a463be9e0051 Xie Yongji    2022-08-03  1561  		break;
79a463be9e0051 Xie Yongji    2022-08-03  1562  	}
79a463be9e0051 Xie Yongji    2022-08-03  1563  	case VDUSE_IOTLB_DEREG_UMEM: {
79a463be9e0051 Xie Yongji    2022-08-03  1564  		struct vduse_iova_umem umem;
5df53984377b18 Eugenio Pérez 2025-09-19  1565  		u32 asid;
79a463be9e0051 Xie Yongji    2022-08-03  1566  
79a463be9e0051 Xie Yongji    2022-08-03  1567  		ret = -EFAULT;
79a463be9e0051 Xie Yongji    2022-08-03  1568  		if (copy_from_user(&umem, argp, sizeof(umem)))
79a463be9e0051 Xie Yongji    2022-08-03  1569  			break;
79a463be9e0051 Xie Yongji    2022-08-03  1570  
79a463be9e0051 Xie Yongji    2022-08-03  1571  		ret = -EINVAL;
79a463be9e0051 Xie Yongji    2022-08-03  1572  		if (!is_mem_zero((const char *)umem.reserved,
5df53984377b18 Eugenio Pérez 2025-09-19  1573  				 sizeof(umem.reserved)) ||
5df53984377b18 Eugenio Pérez 2025-09-19  1574  		    (dev->api_version < VDUSE_API_VERSION_1 &&
5df53984377b18 Eugenio Pérez 2025-09-19  1575  		     umem.asid != 0) ||
5df53984377b18 Eugenio Pérez 2025-09-19  1576  		     umem.asid >= dev->nas)
79a463be9e0051 Xie Yongji    2022-08-03  1577  			break;
5df53984377b18 Eugenio Pérez 2025-09-19  1578  
50988b052b5f91 Eugenio Pérez 2025-09-19  1579  		write_lock(&dev->domain_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1580  		asid = array_index_nospec(umem.asid, dev->nas);
5df53984377b18 Eugenio Pérez 2025-09-19  1581  		ret = vduse_dev_dereg_umem(dev, asid, umem.iova,
79a463be9e0051 Xie Yongji    2022-08-03  1582  					   umem.size);
50988b052b5f91 Eugenio Pérez 2025-09-19  1583  		write_unlock(&dev->domain_lock);
79a463be9e0051 Xie Yongji    2022-08-03  1584  		break;
79a463be9e0051 Xie Yongji    2022-08-03  1585  	}
ad146355bfad62 Xie Yongji    2022-08-03  1586  	case VDUSE_IOTLB_GET_INFO: {
ad146355bfad62 Xie Yongji    2022-08-03  1587  		struct vduse_iova_info info;
ad146355bfad62 Xie Yongji    2022-08-03  1588  		struct vhost_iotlb_map *map;
5df53984377b18 Eugenio Pérez 2025-09-19  1589  		u32 asid;
ad146355bfad62 Xie Yongji    2022-08-03  1590  
ad146355bfad62 Xie Yongji    2022-08-03  1591  		ret = -EFAULT;
ad146355bfad62 Xie Yongji    2022-08-03  1592  		if (copy_from_user(&info, argp, sizeof(info)))
ad146355bfad62 Xie Yongji    2022-08-03  1593  			break;
ad146355bfad62 Xie Yongji    2022-08-03  1594  
ad146355bfad62 Xie Yongji    2022-08-03  1595  		ret = -EINVAL;
ad146355bfad62 Xie Yongji    2022-08-03  1596  		if (info.start > info.last)
ad146355bfad62 Xie Yongji    2022-08-03  1597  			break;
ad146355bfad62 Xie Yongji    2022-08-03  1598  
ad146355bfad62 Xie Yongji    2022-08-03  1599  		if (!is_mem_zero((const char *)info.reserved,
ad146355bfad62 Xie Yongji    2022-08-03  1600  				 sizeof(info.reserved)))
ad146355bfad62 Xie Yongji    2022-08-03  1601  			break;
ad146355bfad62 Xie Yongji    2022-08-03  1602  
5df53984377b18 Eugenio Pérez 2025-09-19  1603  		if (dev->api_version < VDUSE_API_VERSION_1) {
5df53984377b18 Eugenio Pérez 2025-09-19  1604  			if (info.asid)
5df53984377b18 Eugenio Pérez 2025-09-19  1605  				break;
5df53984377b18 Eugenio Pérez 2025-09-19  1606  		} else if (info.asid >= dev->nas)
5df53984377b18 Eugenio Pérez 2025-09-19  1607  			break;
5df53984377b18 Eugenio Pérez 2025-09-19  1608  
50988b052b5f91 Eugenio Pérez 2025-09-19  1609  		read_lock(&dev->domain_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1610  		asid = array_index_nospec(info.asid, dev->nas);
5df53984377b18 Eugenio Pérez 2025-09-19  1611  		if (!dev->as[asid].domain) {
50988b052b5f91 Eugenio Pérez 2025-09-19  1612  			read_unlock(&dev->domain_lock);
d4438d23eeeef8 Xie Yongji    2023-03-23  1613  			break;
d4438d23eeeef8 Xie Yongji    2023-03-23  1614  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1615  		spin_lock(&dev->as[asid].domain->iotlb_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1616  		map = vhost_iotlb_itree_first(dev->as[asid].domain->iotlb,
ad146355bfad62 Xie Yongji    2022-08-03  1617  					      info.start, info.last);
ad146355bfad62 Xie Yongji    2022-08-03  1618  		if (map) {
ad146355bfad62 Xie Yongji    2022-08-03  1619  			info.start = map->start;
ad146355bfad62 Xie Yongji    2022-08-03  1620  			info.last = map->last;
ad146355bfad62 Xie Yongji    2022-08-03  1621  			info.capability = 0;
5df53984377b18 Eugenio Pérez 2025-09-19  1622  			if (dev->as[asid].domain->bounce_map &&
5df53984377b18 Eugenio Pérez 2025-09-19  1623  			    map->start == 0 &&
5df53984377b18 Eugenio Pérez 2025-09-19  1624  			    map->last == dev->as[asid].domain->bounce_size - 1)
ad146355bfad62 Xie Yongji    2022-08-03  1625  				info.capability |= VDUSE_IOVA_CAP_UMEM;
ad146355bfad62 Xie Yongji    2022-08-03  1626  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1627  		spin_unlock(&dev->as[asid].domain->iotlb_lock);
50988b052b5f91 Eugenio Pérez 2025-09-19  1628  		read_unlock(&dev->domain_lock);
ad146355bfad62 Xie Yongji    2022-08-03  1629  		if (!map)
ad146355bfad62 Xie Yongji    2022-08-03  1630  			break;
ad146355bfad62 Xie Yongji    2022-08-03  1631  
ad146355bfad62 Xie Yongji    2022-08-03  1632  		ret = -EFAULT;
ad146355bfad62 Xie Yongji    2022-08-03  1633  		if (copy_to_user(argp, &info, sizeof(info)))
ad146355bfad62 Xie Yongji    2022-08-03  1634  			break;
ad146355bfad62 Xie Yongji    2022-08-03  1635  
ad146355bfad62 Xie Yongji    2022-08-03  1636  		ret = 0;
ad146355bfad62 Xie Yongji    2022-08-03  1637  		break;
ad146355bfad62 Xie Yongji    2022-08-03  1638  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1639  	default:
c8a6153b6c59d9 Xie Yongji    2021-08-31  1640  		ret = -ENOIOCTLCMD;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1641  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1642  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1643  
c8a6153b6c59d9 Xie Yongji    2021-08-31 @1644  	return ret;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1645  }
c8a6153b6c59d9 Xie Yongji    2021-08-31  1646  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
