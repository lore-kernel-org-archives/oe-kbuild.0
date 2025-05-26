Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF21C6B4
	for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 02:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748227194; cv=none; b=h8uuix+Gc3zF9/SGhV3hqpn0q+Cmjw4Khu76udw0q0VfjQYtTbSGF+LrkR3MKl3Bb/n438D2Ng3zb8Fqm1XnlQLMn/dKKfZdFGLMkjwyV1mT5BrAUvfN9crp/VFwZqCSeL9yWfLvkf/vPyR8io1/yu28RQy4QtXzAPkZINELlQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748227194; c=relaxed/simple;
	bh=9nxU2oAYero+OGLPimKxW1CLQpeWLvh0EZ7n+czbNhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jf3VVtDH6rXo3gnQRUxPNkeEwkmlO+tvrAza0e04y/yTs6I3osLbubIwCgvLJVW3JiTdERCAv7VStW9L2yIXJ6Vkg6n0jQmHN1FnWCVH8427pK4WH7ZA9bpPUyScP1nEgD7OswaE8UKlRf7UATDOFliQTgOuMKL8/+yA6L5bZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtVUGS2o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtVUGS2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748227192; x=1779763192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nxU2oAYero+OGLPimKxW1CLQpeWLvh0EZ7n+czbNhY=;
  b=EtVUGS2oW1dAsf3rO16FO6yuo8C0xDAEhkL6DdHuvD2RAZktoWiEx4qf
   OQk8alugrY25ZCRfFoRwIvJao2mc3V9Bl/mq+g5EuISfF8Py58Makpfu/
   /YGiwXlAeYFhxJIrOwx7NM8Ct1bcmy1Hvqh2Nt476sc63OF0t0rjHzGSp
   /gOW/SAjYLL89lOdbfRsSfORumQs6qU3WG6P0jBxlMOoEIupTBP2BllIN
   fVY49giRuRv18L5Lv7eSbC0VCdyA72b2fJ2g5BfRdIlBQOPd8Q3DwtsqL
   9S8CqWv6/jYNzhcX2izJNzrBisW3eDMo3ZgC//hAzccob1oHV7c8mwq9F
   w==;
X-CSE-ConnectionGUID: dWR1/+sSR7mWfZJmL9AIyg==
X-CSE-MsgGUID: hkuZTkRxQdKGusbBRF0Vuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50117064"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="50117064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 19:39:51 -0700
X-CSE-ConnectionGUID: shDoWkoaTfS7eY84Xf2u6Q==
X-CSE-MsgGUID: 1tu0emsPTx+mgWkVwVmdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="146917990"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 May 2025 19:39:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJNkh-000S64-2a;
	Mon, 26 May 2025 02:39:47 +0000
Date: Mon, 26 May 2025 10:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [leon-rdma:rdma-next 21/57]
 drivers/infiniband/core/umem_odp.c:107:21-22: WARNING kvmalloc is used to
 allocate this memory at line 87
Message-ID: <202505261026.tsaDpd0y-lkp@intel.com>
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
TO: Daisuke Matsuda <dskmtsd@gmail.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   dd6e17d0c76b18b587ef05c752351e21033bc4f8
commit: 259e9bd07c57b0fd8588f68e9adbe2c41170f4fe [21/57] RDMA/core: Avoid hmm_dma_map_alloc() for virtual DMA devices
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-051-20250526 (https://download.01.org/0day-ci/archive/20250526/202505261026.tsaDpd0y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505261026.tsaDpd0y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/umem_odp.c:107:21-22: WARNING kvmalloc is used to allocate this memory at line 87

vim +107 drivers/infiniband/core/umem_odp.c

f25a546e65292b Jason Gunthorpe 2019-11-12   57  
15a9f67e286b37 Leon Romanovsky 2025-04-28   58  static int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
15a9f67e286b37 Leon Romanovsky 2025-04-28   59  			    const struct mmu_interval_notifier_ops *ops)
15a9f67e286b37 Leon Romanovsky 2025-04-28   60  {
15a9f67e286b37 Leon Romanovsky 2025-04-28   61  	struct ib_device *dev = umem_odp->umem.ibdev;
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   62  	size_t page_size = 1UL << umem_odp->page_shift;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   63  	struct hmm_dma_map *map;
f25a546e65292b Jason Gunthorpe 2019-11-12   64  	unsigned long start;
f25a546e65292b Jason Gunthorpe 2019-11-12   65  	unsigned long end;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   66  	size_t nr_entries;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   67  	int ret = 0;
15a9f67e286b37 Leon Romanovsky 2025-04-28   68  
15a9f67e286b37 Leon Romanovsky 2025-04-28   69  	umem_odp->umem.is_odp = 1;
15a9f67e286b37 Leon Romanovsky 2025-04-28   70  	mutex_init(&umem_odp->umem_mutex);
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   71  
f25a546e65292b Jason Gunthorpe 2019-11-12   72  	start = ALIGN_DOWN(umem_odp->umem.address, page_size);
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   73  	if (check_add_overflow(umem_odp->umem.address,
15a9f67e286b37 Leon Romanovsky 2025-04-28   74  			       (unsigned long)umem_odp->umem.length, &end))
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   75  		return -EOVERFLOW;
f25a546e65292b Jason Gunthorpe 2019-11-12   76  	end = ALIGN(end, page_size);
f25a546e65292b Jason Gunthorpe 2019-11-12   77  	if (unlikely(end < page_size))
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   78  		return -EOVERFLOW;
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   79  
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   80  	nr_entries = (end - start) >> PAGE_SHIFT;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   81  	if (!(nr_entries * PAGE_SIZE / page_size))
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   82  		return -EINVAL;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   83  
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   84  	map = &umem_odp->map;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   85  	if (ib_uses_virt_dma(dev)) {
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   86  		map->pfn_list = kvcalloc(nr_entries, sizeof(*map->pfn_list),
259e9bd07c57b0 Daisuke Matsuda 2025-05-24  @87  					 GFP_KERNEL | __GFP_NOWARN);
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   88  		if (!map->pfn_list)
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   89  			ret = -ENOMEM;
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   90  	} else
259e9bd07c57b0 Daisuke Matsuda 2025-05-24   91  		ret = hmm_dma_map_alloc(dev->dma_device, map,
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   92  					(end - start) >> PAGE_SHIFT,
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   93  					1 << umem_odp->page_shift);
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   94  	if (ret)
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   95  		return ret;
d07d1d70ce1ad1 Artemy Kovalyov 2017-01-18   96  
f25a546e65292b Jason Gunthorpe 2019-11-12   97  	ret = mmu_interval_notifier_insert(&umem_odp->notifier,
15a9f67e286b37 Leon Romanovsky 2025-04-28   98  					   umem_odp->umem.owning_mm, start,
15a9f67e286b37 Leon Romanovsky 2025-04-28   99  					   end - start, ops);
f25a546e65292b Jason Gunthorpe 2019-11-12  100  	if (ret)
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  101  		goto out_free_map;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  102  
22d79c9a912c9d Jason Gunthorpe 2019-08-19  103  	return 0;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  104  
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  105  out_free_map:
259e9bd07c57b0 Daisuke Matsuda 2025-05-24  106  	if (ib_uses_virt_dma(dev))
259e9bd07c57b0 Daisuke Matsuda 2025-05-24 @107  		kfree(map->pfn_list);
259e9bd07c57b0 Daisuke Matsuda 2025-05-24  108  	else
259e9bd07c57b0 Daisuke Matsuda 2025-05-24  109  		hmm_dma_map_free(dev->dma_device, map);
22d79c9a912c9d Jason Gunthorpe 2019-08-19  110  	return ret;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  111  }
22d79c9a912c9d Jason Gunthorpe 2019-08-19  112  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
