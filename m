Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E683311957
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473264; cv=none; b=NRdjymdirC65X+tW5rXzJ2gUKiDL7sk2jgfAD6ctOmLCfolEqCK/0dPSBxA1/90NaiXEYK16ahrB4LA3e37eLzqLXE0w8Jo2JEdh4QWiRuTBEJ+eZ/xpAqPy9Y5zNsoooxkkJrzbnUHH2WLmaOXYreiRA3juFaGd0UK31fiNNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473264; c=relaxed/simple;
	bh=3O2zE5VMcfXE+mT7KAOPZNsTkU4SuMtstIyo/h5tjho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bleq+/h1EdMzkeAx244e4lTqpqGVnht3ry5+UWggOj6/6hru7i+WrFO63UidRyJtnG/SpWKh0tdK59UdtfXIpuNLTj9iiA9v5Rgsa2CDop7COiaJkz0Ua/rgc0hadcmuWhBts7GPUEzPaz5/YFnBPbgPAPn51aoWj19mW1aQZqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRO/kenM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRO/kenM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772473264; x=1804009264;
  h=date:from:to:cc:subject:message-id;
  bh=3O2zE5VMcfXE+mT7KAOPZNsTkU4SuMtstIyo/h5tjho=;
  b=jRO/kenM8LYFZyc5TlM17MVjY/9qIzHnPpChipvyAbk7WjQJYP4ByzzV
   T1AkMa3jk7ECebZ32G1BUOsDqBCo7oayXLvlqkc5xD+9Np33RFok8zOKM
   77AASpO9gYvn3EIngCm0wQg7svhvYNZUUGyx0a+SJg/jeSPakvT8wIzxU
   thqw6KsX4Fd54DoBVQWTOd2hEQa9iEMLq3Enh2Udv+n4PUxS8L0I+XiVv
   jAAeuCMnR9L7gODXDCyAQNB/fsJ94YSdKA4QNUiUg8uTbILZjZQzH8fWM
   IiH76Q0uvf7qvLAPdSkJ0GjmeCCiHayB6SZ7E/LOnBtHHzpD3QtZs5Jdw
   Q==;
X-CSE-ConnectionGUID: lA7bZ+ipQLC6YLRw1qD2NA==
X-CSE-MsgGUID: Auy7F97WRUSmiyfOty9z1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90884665"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="90884665"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 09:41:04 -0800
X-CSE-ConnectionGUID: Pa86yC2KQjulAbVblxS3sg==
X-CSE-MsgGUID: YsjCn5x7Re2UX9Cg+Zz/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="217829773"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Mar 2026 09:41:02 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx7GN-000000001F3-1NDJ;
	Mon, 02 Mar 2026 17:40:59 +0000
Date: Tue, 03 Mar 2026 01:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:dmabuf_map_type 30/34]
 drivers/iommu/iommufd/pages.c:1486 iopt_map_dmabuf() warn: passing zero to
 'PTR_ERR'
Message-ID: <202603030132.eYdqJKik-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   c37cf2824740d833b21eb816e21f94836100291f
commit: f8983286b743407cc7350f9635f6b3157f8bbeb1 [30/34] iommufd: Use the PAL mapping type instead of a vfio function
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20260302 (https://download.01.org/0day-ci/archive/20260303/202603030132.eYdqJKik-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603030132.eYdqJKik-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pages.c:1486 iopt_map_dmabuf() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1486 drivers/iommu/iommufd/pages.c

71db84a092c399 Jason Gunthorpe 2025-11-21  1460  
71db84a092c399 Jason Gunthorpe 2025-11-21  1461  static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
71db84a092c399 Jason Gunthorpe 2025-11-21  1462  			   struct dma_buf *dmabuf)
71db84a092c399 Jason Gunthorpe 2025-11-21  1463  {
f8983286b74340 Jason Gunthorpe 2026-02-09  1464  	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
71db84a092c399 Jason Gunthorpe 2025-11-21  1465  	struct dma_buf_attachment *attach;
71db84a092c399 Jason Gunthorpe 2025-11-21  1466  	int rc;
71db84a092c399 Jason Gunthorpe 2025-11-21  1467  
f8983286b74340 Jason Gunthorpe 2026-02-09  1468  	attach = dma_buf_mapping_attach(dmabuf, pal_match,
f8983286b74340 Jason Gunthorpe 2026-02-09  1469  					ARRAY_SIZE(pal_match),
f8983286b74340 Jason Gunthorpe 2026-02-09  1470  					&iopt_dmabuf_attach_revoke_ops, pages);
71db84a092c399 Jason Gunthorpe 2025-11-21  1471  	if (IS_ERR(attach))
71db84a092c399 Jason Gunthorpe 2025-11-21  1472  		return PTR_ERR(attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1473  
71db84a092c399 Jason Gunthorpe 2025-11-21  1474  	dma_resv_lock(dmabuf->resv, NULL);
71db84a092c399 Jason Gunthorpe 2025-11-21  1475  	/*
71db84a092c399 Jason Gunthorpe 2025-11-21  1476  	 * Lock ordering requires the mutex to be taken inside the reservation,
71db84a092c399 Jason Gunthorpe 2025-11-21  1477  	 * make sure lockdep sees this.
71db84a092c399 Jason Gunthorpe 2025-11-21  1478  	 */
71db84a092c399 Jason Gunthorpe 2025-11-21  1479  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
71db84a092c399 Jason Gunthorpe 2025-11-21  1480  		mutex_lock(&pages->mutex);
71db84a092c399 Jason Gunthorpe 2025-11-21  1481  		mutex_unlock(&pages->mutex);
71db84a092c399 Jason Gunthorpe 2025-11-21  1482  	}
71db84a092c399 Jason Gunthorpe 2025-11-21  1483  
8c5f9645c3893f Leon Romanovsky 2026-01-31  1484  	rc = dma_buf_pin(attach);
f8983286b74340 Jason Gunthorpe 2026-02-09  1485  	if (rc) {
f8983286b74340 Jason Gunthorpe 2026-02-09 @1486  		rc = PTR_ERR(pages->dmabuf.exp_phys);
71db84a092c399 Jason Gunthorpe 2025-11-21  1487  		goto err_detach;
f8983286b74340 Jason Gunthorpe 2026-02-09  1488  	}
71db84a092c399 Jason Gunthorpe 2025-11-21  1489  
f8983286b74340 Jason Gunthorpe 2026-02-09  1490  	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
f8983286b74340 Jason Gunthorpe 2026-02-09  1491  	if (IS_ERR(pages->dmabuf.exp_phys)) {
f8983286b74340 Jason Gunthorpe 2026-02-09  1492  		rc = PTR_ERR(pages->dmabuf.exp_phys);
8c5f9645c3893f Leon Romanovsky 2026-01-31  1493  		goto err_unpin;
f8983286b74340 Jason Gunthorpe 2026-02-09  1494  	}
f8983286b74340 Jason Gunthorpe 2026-02-09  1495  
f8983286b74340 Jason Gunthorpe 2026-02-09  1496  	/* For now only works with single range exporters */
f8983286b74340 Jason Gunthorpe 2026-02-09  1497  	if (pages->dmabuf.exp_phys->length != 1) {
f8983286b74340 Jason Gunthorpe 2026-02-09  1498  		rc = -EINVAL;
f8983286b74340 Jason Gunthorpe 2026-02-09  1499  		goto err_unmap;
f8983286b74340 Jason Gunthorpe 2026-02-09  1500  	}
f8983286b74340 Jason Gunthorpe 2026-02-09  1501  	pages->dmabuf.phys = pages->dmabuf.exp_phys->phys[0];
8c5f9645c3893f Leon Romanovsky 2026-01-31  1502  
71db84a092c399 Jason Gunthorpe 2025-11-21  1503  	dma_resv_unlock(dmabuf->resv);
71db84a092c399 Jason Gunthorpe 2025-11-21  1504  
71db84a092c399 Jason Gunthorpe 2025-11-21  1505  	/* On success iopt_release_pages() will detach and put the dmabuf. */
71db84a092c399 Jason Gunthorpe 2025-11-21  1506  	pages->dmabuf.attach = attach;
71db84a092c399 Jason Gunthorpe 2025-11-21  1507  	return 0;
71db84a092c399 Jason Gunthorpe 2025-11-21  1508  
f8983286b74340 Jason Gunthorpe 2026-02-09  1509  err_unmap:
f8983286b74340 Jason Gunthorpe 2026-02-09  1510  	dma_buf_pal_unmap_phys(attach, pages->dmabuf.exp_phys);
8c5f9645c3893f Leon Romanovsky 2026-01-31  1511  err_unpin:
8c5f9645c3893f Leon Romanovsky 2026-01-31  1512  	dma_buf_unpin(attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1513  err_detach:
71db84a092c399 Jason Gunthorpe 2025-11-21  1514  	dma_resv_unlock(dmabuf->resv);
71db84a092c399 Jason Gunthorpe 2025-11-21  1515  	dma_buf_detach(dmabuf, attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1516  	return rc;
71db84a092c399 Jason Gunthorpe 2025-11-21  1517  }
71db84a092c399 Jason Gunthorpe 2025-11-21  1518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
