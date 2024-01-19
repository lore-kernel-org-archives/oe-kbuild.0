Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2711367
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705632827; cv=none; b=iyrvwQ/Hzncv6WmeuwkYuZNMcSyr0pCKNrotqoa5quxwfxaOQHkWYJqqOmlni0pDgVfPrOODR/PHHJgs0x9SUQQIk2zgxftAEAsvTXPr7/DNUovv9+aCKF0+/dvZO2CIvK2bOke40mwyaV8AvwpI0ezuwwiP6bsYnTP7p21Mzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705632827; c=relaxed/simple;
	bh=gU56s1XDkk0RHvGrXZbRBnhPKUvVugImCW6FjI5aj6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePfquu18tRnQ9gFGMUQtkhiHX7NugehrHgX95lEv0Erzd5FZevqYUOL/iqHAog4ZGFnCNwhfczXI1viOHhaPrml8Jut3B9llB4+Bb6sUKUstg/OFG6tR21nQUAFSbTBNb3HRUoXfZT7UczJnV1fqT2SjTKIpV+mHEwOlrM4lciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+yD6yXP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+yD6yXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705632825; x=1737168825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gU56s1XDkk0RHvGrXZbRBnhPKUvVugImCW6FjI5aj6s=;
  b=S+yD6yXPyTOLHTy2HquzT7zg5bVNQRDQS2/N7D+HJYgk7mZTMPyHUEcE
   6ND7sLvxGC+rjfEY8h4luEcopogtNlN2VlkxcGbM+i4qv0X5ASEsfNnIf
   9vOjYh3Y9PsZhjx92g47Z2uXA3quOYZy433oo24TrlVuFUtLQaxfCfgpY
   w0ik0gq+A9NfFyb4KCDSaqo9vNc+6ujEnYir4D7T0IL/k78ZF+G/NvWgX
   FabQ1LwW/ms1Rem7BurBHLuwIjeiPJRdWD76ktYZFcAmn8uBT5HE+z/cz
   /T08kZWhU3V1dK0OIBsGVyy8nus+ahC1vUMHPNfJd3xTKylK60LcxueZL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7347844"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7347844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 18:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="492149"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2024 18:53:41 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQf0k-0003Xw-2e;
	Fri, 19 Jan 2024 02:53:38 +0000
Date: Fri, 19 Jan 2024 10:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/intel/keembay/ocs-aes.c:1476:49-50: WARNING
 opportunity for min()
Message-ID: <202401191031.nqVcuyDA-lkp@intel.com>
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
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f289bdd4102fc870c8b97652c57d41952040d70
commit: fbf31dd599875cb132d764cf4d05d7985e332c05 crypto: keembay - Move driver to drivers/crypto/intel/keembay
date:   10 months ago
:::::: branch date: 85 minutes ago
:::::: commit date: 10 months ago
config: hexagon-randconfig-r061-20240117 (https://download.01.org/0day-ci/archive/20240119/202401191031.nqVcuyDA-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401191031.nqVcuyDA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/keembay/ocs-aes.c:1476:49-50: WARNING opportunity for min()

vim +1476 drivers/crypto/intel/keembay/ocs-aes.c

88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1400  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1401  /**
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1402   * ocs_create_linked_list_from_sg() - Create OCS DMA linked list from SG list.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1403   * @aes_dev:	  The OCS AES device the list will be created for.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1404   * @sg:		  The SG list OCS DMA linked list will be created from. When
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1405   *		  passed to this function, @sg must have been already mapped
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1406   *		  with dma_map_sg().
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1407   * @sg_dma_count: The number of DMA-mapped entries in @sg. This must be the
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1408   *		  value returned by dma_map_sg() when @sg was mapped.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1409   * @dll_desc:	  The OCS DMA dma_list to use to store information about the
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1410   *		  created linked list.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1411   * @data_size:	  The size of the data (from the SG list) to be mapped into the
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1412   *		  OCS DMA linked list.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1413   * @data_offset:  The offset (within the SG list) of the data to be mapped.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1414   *
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1415   * Return:	0 on success, negative error code otherwise.
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1416   */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1417  int ocs_create_linked_list_from_sg(const struct ocs_aes_dev *aes_dev,
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1418  				   struct scatterlist *sg,
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1419  				   int sg_dma_count,
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1420  				   struct ocs_dll_desc *dll_desc,
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1421  				   size_t data_size, size_t data_offset)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1422  {
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1423  	struct ocs_dma_linked_list *ll = NULL;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1424  	struct scatterlist *sg_tmp;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1425  	unsigned int tmp;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1426  	int dma_nents;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1427  	int i;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1428  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1429  	if (!dll_desc || !sg || !aes_dev)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1430  		return -EINVAL;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1431  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1432  	/* Default values for when no ddl_desc is created. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1433  	dll_desc->vaddr = NULL;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1434  	dll_desc->dma_addr = DMA_MAPPING_ERROR;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1435  	dll_desc->size = 0;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1436  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1437  	if (data_size == 0)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1438  		return 0;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1439  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1440  	/* Loop over sg_list until we reach entry at specified offset. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1441  	while (data_offset >= sg_dma_len(sg)) {
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1442  		data_offset -= sg_dma_len(sg);
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1443  		sg_dma_count--;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1444  		sg = sg_next(sg);
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1445  		/* If we reach the end of the list, offset was invalid. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1446  		if (!sg || sg_dma_count == 0)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1447  			return -EINVAL;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1448  	}
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1449  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1450  	/* Compute number of DMA-mapped SG entries to add into OCS DMA list. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1451  	dma_nents = 0;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1452  	tmp = 0;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1453  	sg_tmp = sg;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1454  	while (tmp < data_offset + data_size) {
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1455  		/* If we reach the end of the list, data_size was invalid. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1456  		if (!sg_tmp)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1457  			return -EINVAL;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1458  		tmp += sg_dma_len(sg_tmp);
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1459  		dma_nents++;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1460  		sg_tmp = sg_next(sg_tmp);
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1461  	}
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1462  	if (dma_nents > sg_dma_count)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1463  		return -EINVAL;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1464  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1465  	/* Allocate the DMA list, one entry for each SG entry. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1466  	dll_desc->size = sizeof(struct ocs_dma_linked_list) * dma_nents;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1467  	dll_desc->vaddr = dma_alloc_coherent(aes_dev->dev, dll_desc->size,
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1468  					     &dll_desc->dma_addr, GFP_KERNEL);
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1469  	if (!dll_desc->vaddr)
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1470  		return -ENOMEM;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1471  
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1472  	/* Populate DMA linked list entries. */
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1473  	ll = dll_desc->vaddr;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1474  	for (i = 0; i < dma_nents; i++, sg = sg_next(sg)) {
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26  1475  		ll[i].src_addr = sg_dma_address(sg) + data_offset;
88574332451380 drivers/crypto/keembay/ocs-aes.c Mike Healy 2020-11-26 @1476  		ll[i].src_len = (sg_dma_len(sg) - data_offset) < data_size ?

:::::: The code at line 1476 was first introduced by commit
:::::: 88574332451380f4b51f6ca88ab9810e714bfb9b crypto: keembay - Add support for Keem Bay OCS AES/SM4

:::::: TO: Mike Healy <mikex.healy@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
