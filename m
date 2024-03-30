Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060843ADE
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Mar 2024 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711836785; cv=none; b=j8h3IlMgzVVTMlv2C8Je47xHDxRY2yxd4C0DDqqi8Eeaz7NloP1+nIId6WI1PqwbZW5Ce7XDG4MaIViQg418aI61hkWtJlj0QjNyxFhZa/+orNBAzwph6XTvUmZBLK/6CJ83wBLato6LPAUmZwNuD58bAx2Tf66VuWHdje8VaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711836785; c=relaxed/simple;
	bh=0FNbYFwAxLe33F9g+Gu/yYpbysBIxReM89jq3cAm78s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8wKhr8XV/beUaHL/anVI6DHy91+ZXiL6NPClb1elo2kFLuIuZUIFS3/fto7vdxSREQFPTAtDxc09Hcf+m1Rs71oU1hRzrhR40yT9wyHsCPvH1c33mvR0sq4hLpJEJR1nvQPL8g1Zvil+khYong2d36GJB/CsxyyPQEQIbpKvA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mf+T/yUf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mf+T/yUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711836784; x=1743372784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FNbYFwAxLe33F9g+Gu/yYpbysBIxReM89jq3cAm78s=;
  b=mf+T/yUfG2E2NkTqkJHIwEOIehI6DoIWmSlBIsmakrpcj2DJOg8DK/CD
   HaVLxoLkpAxhrqmXrCDU76dRIltDPjT2BO8TnjX7wM93axWgZlcEFW76+
   mguOvym5EbT3I7FIUhiIAHdVm9YRng8NJJ7SZw/ngDzGBHlo/cNvkXqMI
   5VYpbMcORgZodd70v3tB8nVEC+6o4LxPZrRZxERg2fOqu+a793NEf27Vq
   87pKAnQeakVMr3hFKMv0a0mlRSeGcM5DYMhQ8+4PYa0WiFLH5agOokFe1
   71WfCaSy6KE1wQA30pbW8Ki10NUsNHqg+7P5YeDESNeDzDGcgorAN18tR
   w==;
X-CSE-ConnectionGUID: Ft89b6EcQlSdEO6M9PcJrg==
X-CSE-MsgGUID: V5Ss6f4ISTyY7HVgLWa0VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="18437468"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="18437468"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 15:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="21964340"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2024 15:13:01 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqgwd-0000SC-1m;
	Sat, 30 Mar 2024 22:12:59 +0000
Date: Sun, 31 Mar 2024 06:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [alobakin:idpf-libie-new 60/74]
 drivers/net/ethernet/intel/libeth/rx.c:180:11-12: WARNING kvmalloc is used
 to allocate this memory at line 164
Message-ID: <202403310626.XY01b0CL-lkp@intel.com>
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
TO: Alexander Lobakin <aleksander.lobakin@intel.com>

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   f7e5ff9972ee9afd57afebedbc55c37173d39dd3
commit: 1529de47fcee1dc7805a0ddfd8c8d75bd4a99c36 [60/74] libie: support native XDP and register memory model
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-052-20240329 (https://download.01.org/0day-ci/archive/20240331/202403310626.XY01b0CL-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403310626.XY01b0CL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/libeth/rx.c:180:11-12: WARNING kvmalloc is used to allocate this memory at line 164

vim +180 drivers/net/ethernet/intel/libeth/rx.c

e5e39cdea755af Alexander Lobakin 2023-12-04  128  
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  129  /**
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  130   * libeth_rx_fq_create - create a PP with the default libeth settings
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  131   * @fq: buffer queue struct to fill
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  132   * @napi: &napi_struct covering this PP (no usage outside its poll loops)
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  133   *
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  134   * Return: %0 on success, -%errno on failure.
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  135   */
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  136  int libeth_rx_fq_create(struct libeth_fq *fq, struct napi_struct *napi)
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  137  {
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  138  	struct page_pool_params pp = {
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  139  		.flags		= PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  140  		.order		= LIBETH_RX_PAGE_ORDER,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  141  		.pool_size	= fq->count,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  142  		.nid		= NUMA_NO_NODE,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  143  		.dev		= napi->dev->dev.parent,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  144  		.netdev		= napi->dev,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  145  		.napi		= napi,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  146  	};
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  147  	struct libeth_fqe *fqes;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  148  	struct page_pool *pool;
1529de47fcee1d Alexander Lobakin 2023-12-08  149  	int ret;
1529de47fcee1d Alexander Lobakin 2023-12-08  150  
1529de47fcee1d Alexander Lobakin 2023-12-08  151  	pp.dma_dir = fq->xdp ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  152  
e5e39cdea755af Alexander Lobakin 2023-12-04  153  	if (!fq->hsplit)
e5e39cdea755af Alexander Lobakin 2023-12-04  154  		ret = libeth_rx_page_pool_params(fq, &pp);
e5e39cdea755af Alexander Lobakin 2023-12-04  155  	else
e5e39cdea755af Alexander Lobakin 2023-12-04  156  		ret = libeth_rx_page_pool_params_zc(fq, &pp);
e5e39cdea755af Alexander Lobakin 2023-12-04  157  	if (!ret)
e5e39cdea755af Alexander Lobakin 2023-12-04  158  		return -EINVAL;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  159  
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  160  	pool = page_pool_create(&pp);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  161  	if (IS_ERR(pool))
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  162  		return PTR_ERR(pool);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  163  
4fe2fda36b31e0 Alexander Lobakin 2023-06-20 @164  	fqes = kvcalloc(fq->count, sizeof(*fqes), GFP_KERNEL);
1529de47fcee1d Alexander Lobakin 2023-12-08  165  	if (!fqes) {
1529de47fcee1d Alexander Lobakin 2023-12-08  166  		ret = -ENOMEM;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  167  		goto err_buf;
1529de47fcee1d Alexander Lobakin 2023-12-08  168  	}
1529de47fcee1d Alexander Lobakin 2023-12-08  169  
1529de47fcee1d Alexander Lobakin 2023-12-08  170  	ret = xdp_reg_page_pool(pool);
1529de47fcee1d Alexander Lobakin 2023-12-08  171  	if (ret)
1529de47fcee1d Alexander Lobakin 2023-12-08  172  		goto err_mem;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  173  
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  174  	fq->fqes = fqes;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  175  	fq->pp = pool;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  176  
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  177  	return 0;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  178  
1529de47fcee1d Alexander Lobakin 2023-12-08  179  err_mem:
1529de47fcee1d Alexander Lobakin 2023-12-08 @180  	kfree(fqes);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  181  err_buf:
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  182  	page_pool_destroy(pool);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  183  
1529de47fcee1d Alexander Lobakin 2023-12-08  184  	return ret;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  185  }
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  186  EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_create, LIBETH);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
