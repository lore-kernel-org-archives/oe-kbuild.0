Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B721DDD1
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736604263; cv=none; b=YBVeuxQcQlMq4wjFVpJ/TS2Vlz4E2qVvBSZxH3XHLqLlZAF03WjOnEeH/INJZo+jX3n7VtDAeBRgj8wvwaDQUfQXcapa9jxByIwmSxA1Uuid6kJUWEfyypMWLcJ8sZfFCICqsH9UrlH0oPAdXt1yKJhKWM6B2UFOklOsH18yrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736604263; c=relaxed/simple;
	bh=eqO8ts86IhQIlKtV2mvC27P8cphbwdDF53UKUoCu7Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvkdR4G7/d8b+FDf400tTkuBT28WPKuO7n/gN8A4b1qYyTdygKb6806umkYmDfhPhNptwf2CA8a3TtET6Ntrj1+17hxGuUVS8+MtHyoDvDRUgX9pI3Z0seWm5Ut6tv1xuxaQYxoSvdqN5axbyGY9REBP4pLrYTKQalrrsYYlkqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF+0uzaN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF+0uzaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736604261; x=1768140261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eqO8ts86IhQIlKtV2mvC27P8cphbwdDF53UKUoCu7Lc=;
  b=dF+0uzaN0yzqssezaKP+j5i5/LISfE9ldQYH6VNcv2wDuK4OC6o2a77c
   VS0hl+4T4hoIDjVZwfT7KaPEInRs1o9pFVTZpkpOAkhAgyyOk8EgR3dtJ
   OoM9P1djPo4RA7NEvfgZnP8r3NmKCIqHsM5OE1MngS6ezvc9c12xp1hb3
   PGdhFLO24r3qc18pmcphk/Fas0xweALyzKdC01jkOo+eUK9CuGVRDS5EF
   igfNN4sjohAlooupl7/l7wTDz+LmPoEWIgTme5QXeBVsYUQSTEjTu6/Ki
   I7RLB/odzAxTHazh3+UvWcV/j3cn3Q4DMTX4jBFpBXhameM749eMrbRqE
   Q==;
X-CSE-ConnectionGUID: LzT3VLwgQ+WZ2JQ4GLh8/w==
X-CSE-MsgGUID: 6gKQMALJQKO569ouaPsJuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36570987"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36570987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 06:04:21 -0800
X-CSE-ConnectionGUID: McG52WEEQteo1pd7e4jKfA==
X-CSE-MsgGUID: URImoAoVRs6btVkxgljGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108622510"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2025 06:03:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWc50-000Kin-16;
	Sat, 11 Jan 2025 14:03:10 +0000
Date: Sat, 11 Jan 2025 22:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:lkp_test 64/504] drivers/uio/uio_dmabuf.c:163
 uio_dmabuf_unmap() warn: iterator used outside loop: 'dbuf_mem'
Message-ID: <202501112118.cXuV1nQy-lkp@intel.com>
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
CC: git@amd.com
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 172f9f2dc4ebdce5fcf324e2718316b84c040621 [64/504] uio: Add dma-buf import ioctls
:::::: branch date: 29 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112118.cXuV1nQy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501112118.cXuV1nQy-lkp@intel.com/

smatch warnings:
drivers/uio/uio_dmabuf.c:163 uio_dmabuf_unmap() warn: iterator used outside loop: 'dbuf_mem'

vim +/dbuf_mem +163 drivers/uio/uio_dmabuf.c

172f9f2dc4ebdc Hyun Kwon 2019-03-04  143  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  144  long uio_dmabuf_unmap(struct uio_device *dev, struct list_head *dbufs,
172f9f2dc4ebdc Hyun Kwon 2019-03-04  145  		      struct mutex *dbufs_lock, void __user *user_args)
172f9f2dc4ebdc Hyun Kwon 2019-03-04  146  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  147  {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  148  	struct uio_dmabuf_args args;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  149  	struct uio_dmabuf_mem *dbuf_mem;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  150  	long ret;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  151  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  152  	if (copy_from_user(&args, user_args, sizeof(args))) {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  153  		ret = -EFAULT;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  154  		goto err;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  155  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  156  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  157  	mutex_lock(dbufs_lock);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  158  	list_for_each_entry(dbuf_mem, dbufs, list) {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  159  		if (dbuf_mem->dbuf_fd == args.dbuf_fd)
172f9f2dc4ebdc Hyun Kwon 2019-03-04  160  			break;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  161  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  162  
172f9f2dc4ebdc Hyun Kwon 2019-03-04 @163  	if (dbuf_mem->dbuf_fd != args.dbuf_fd) {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  164  		dev_err(dev->dev.parent, "failed to find the dmabuf (%d)\n",
172f9f2dc4ebdc Hyun Kwon 2019-03-04  165  			args.dbuf_fd);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  166  		ret = -EINVAL;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  167  		goto err_unlock;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  168  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  169  	list_del(&dbuf_mem->list);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  170  	mutex_unlock(dbufs_lock);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  171  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  172  	dma_buf_unmap_attachment(dbuf_mem->dbuf_attach, dbuf_mem->sgt,
172f9f2dc4ebdc Hyun Kwon 2019-03-04  173  				 dbuf_mem->dir);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  174  	dma_buf_detach(dbuf_mem->dbuf, dbuf_mem->dbuf_attach);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  175  	dma_buf_put(dbuf_mem->dbuf);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  176  	kfree(dbuf_mem);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  177  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  178  	memset(&args, 0x0, sizeof(args));
172f9f2dc4ebdc Hyun Kwon 2019-03-04  179  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  180  	if (copy_to_user(user_args, &args, sizeof(args))) {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  181  		ret = -EFAULT;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  182  		goto err;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  183  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  184  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  185  	return 0;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  186  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  187  err_unlock:
172f9f2dc4ebdc Hyun Kwon 2019-03-04  188  	mutex_unlock(dbufs_lock);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  189  err:
172f9f2dc4ebdc Hyun Kwon 2019-03-04  190  	return ret;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  191  }
172f9f2dc4ebdc Hyun Kwon 2019-03-04  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
