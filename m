Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386A714A9F
	for <oe-kbuild@lists.linux.dev>; Wed,  8 May 2024 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715193709; cv=none; b=SYyuTDupPjTO+6WOjC9Hr3pA0wR+XwtRNbc81QgwHep0yts9t0VVakxuSXb84N9SpmDFgvRVKgt4DAxw6dOygqy96CzfSTfrDisy9gYQrIb1ZcjRb+DIJ4UCRSCg/t8Mv2I1A6CuGtIXOCZtksCiLeFOOgjWuQzuEL+lTEoWEAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715193709; c=relaxed/simple;
	bh=C8nqs210n7xuccy4tAIhmxoGOFcLQxYmHNPJ/E08gJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1buw8BacPCuPLcVJMGx8yq+2vdM5/H9l5ZDFp4rQlPVF+E/Xd+0oH8gUXTBC95w+UyKOPivyhN0FHOLNNQ9qOsVEqLIXXQcLIT/Yy8nlmlDPR4umougvzGs0p7G5JTiKURC/qyZtyZQMbYXfSwRQg5NV6EAXNhuEyvLPyhfyqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShFN20nl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShFN20nl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715193708; x=1746729708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8nqs210n7xuccy4tAIhmxoGOFcLQxYmHNPJ/E08gJQ=;
  b=ShFN20nltDpWMZqrJRhAUFnP+ZWatTqoYZuvGzInHzQXmAtR4qRZn2Sy
   W4x7kVET2FT3eK2SYkr6aCsgtm1swbxztQKC6AGnxz3eDw+ebYJYbEXVW
   oV0eIKJV7Ja1QZXetvgVndgT5JPKrwZxfDHV30ZOGZljb58op3QgrXQbL
   ErlEGeQr6xbPmlwqFqgrehfuFDsWleAGD7H3QQdL+Z1ROnPXtjXPPK8F9
   JycuMPFKuZ07cplG3/C+xzOz0jVKatWMpBYUabDyz4zZmqmVeH+KeyoLc
   Y46lYCu9mmH9O1EwvkTWYSQp63+GoDprNpY0TbA6VQhHm9hgu22hpKSY1
   Q==;
X-CSE-ConnectionGUID: s3AXgXw4TyCQalb8hQh71g==
X-CSE-MsgGUID: r1enj1I4SoGwqRQaTVOaWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21674953"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="21674953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 11:41:48 -0700
X-CSE-ConnectionGUID: wauxo6IxSSK6JYH2lpXxpA==
X-CSE-MsgGUID: 2Kvkk9rzQoGipdTIhxoopg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="29349280"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2024 11:41:46 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4mEY-00040k-2m;
	Wed, 08 May 2024 18:41:42 +0000
Date: Thu, 9 May 2024 02:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe
 transport
Message-ID: <202405090205.jaKU4QVI-lkp@intel.com>
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
In-Reply-To: <20240507155658.294676-2-kiran.k@intel.com>
References: <20240507155658.294676-2-kiran.k@intel.com>
TO: Kiran K <kiran.k@intel.com>

Hi Kiran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.9-rc7]
[cannot apply to next-20240508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiran-K/Bluetooth-btintel_pcie-Add-support-for-PCIe-transport/20240507-234447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240507155658.294676-2-kiran.k%40intel.com
patch subject: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe transport
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-103-20240508 (https://download.01.org/0day-ci/archive/20240509/202405090205.jaKU4QVI-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405090205.jaKU4QVI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel_pcie.c:771:19-37: WARNING: dma_alloc_coherent used in rxq -> buf_v_addr already zeroes out memory, so memset is not needed
>> drivers/bluetooth/btintel_pcie.c:726:19-37: WARNING: dma_alloc_coherent used in txq -> buf_v_addr already zeroes out memory, so memset is not needed

vim +771 drivers/bluetooth/btintel_pcie.c

3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  711  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  712  static int btintel_pcie_setup_txq_bufs(struct btintel_pcie_data *data,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  713  				       struct txq *txq)
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  714  {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  715  	int i;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  716  	struct data_buf *buf;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  717  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  718  	/* Allocate the same number of buffers as the descriptor */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  719  	txq->bufs = kmalloc_array(txq->count, sizeof(*buf), GFP_KERNEL);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  720  	if (!txq->bufs)
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  721  		return -ENOMEM;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  722  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  723  	/* Allocate full chunk of data buffer for DMA first and do indexing and
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  724  	 * initialization next, so it can be freed easily
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  725  	 */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07 @726  	txq->buf_v_addr = dma_alloc_coherent(&data->pdev->dev,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  727  					     txq->count * BTINTEL_PCIE_BUFFER_SIZE,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  728  					     &txq->buf_p_addr,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  729  					     GFP_KERNEL | __GFP_NOWARN);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  730  	if (!txq->buf_v_addr) {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  731  		kfree(txq->bufs);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  732  		return -ENOMEM;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  733  	}
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  734  	memset(txq->buf_v_addr, 0, txq->count * BTINTEL_PCIE_BUFFER_SIZE);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  735  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  736  	/* Setup the allocated DMA buffer to bufs. Each data_buf should
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  737  	 * have virtual address and physical address
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  738  	 */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  739  	for (i = 0; i < txq->count; i++) {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  740  		buf = &txq->bufs[i];
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  741  		buf->data_p_addr = txq->buf_p_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  742  		buf->data = txq->buf_v_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  743  	}
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  744  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  745  	return 0;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  746  }
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  747  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  748  static void btintel_pcie_free_rxq_bufs(struct btintel_pcie_data *data,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  749  				       struct rxq *rxq)
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  750  {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  751  	/* Free data buffers first */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  752  	dma_free_coherent(&data->pdev->dev, rxq->count * BTINTEL_PCIE_BUFFER_SIZE,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  753  			  rxq->buf_v_addr, rxq->buf_p_addr);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  754  	kfree(rxq->bufs);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  755  }
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  756  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  757  static int btintel_pcie_setup_rxq_bufs(struct btintel_pcie_data *data,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  758  				       struct rxq *rxq)
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  759  {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  760  	int i;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  761  	struct data_buf *buf;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  762  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  763  	/* Allocate the same number of buffers as the descriptor */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  764  	rxq->bufs = kmalloc_array(rxq->count, sizeof(*buf), GFP_KERNEL);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  765  	if (!rxq->bufs)
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  766  		return -ENOMEM;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  767  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  768  	/* Allocate full chunk of data buffer for DMA first and do indexing and
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  769  	 * initialization next, so it can be freed easily
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  770  	 */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07 @771  	rxq->buf_v_addr = dma_alloc_coherent(&data->pdev->dev,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  772  					     rxq->count * BTINTEL_PCIE_BUFFER_SIZE,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  773  					     &rxq->buf_p_addr,
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  774  					     GFP_KERNEL | __GFP_NOWARN);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  775  	if (!rxq->buf_v_addr) {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  776  		kfree(rxq->bufs);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  777  		return -ENOMEM;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  778  	}
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  779  	memset(rxq->buf_v_addr, 0, rxq->count * BTINTEL_PCIE_BUFFER_SIZE);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  780  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  781  	/* Setup the allocated DMA buffer to bufs. Each data_buf should
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  782  	 * have virtual address and physical address
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  783  	 */
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  784  	for (i = 0; i < rxq->count; i++) {
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  785  		buf = &rxq->bufs[i];
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  786  		buf->data_p_addr = rxq->buf_p_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  787  		buf->data = rxq->buf_v_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  788  	}
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  789  
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  790  	return 0;
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  791  }
3d4982728d8896 Tedd Ho-Jeong An 2024-05-07  792  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
