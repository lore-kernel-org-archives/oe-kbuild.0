Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972F340A76
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060264; cv=none; b=MVsaHuJyVWk6jl+dlnPdySWH7jRmgqQaQbX4Z9WqgXIwRblwGN4z9KhfE40NwG4CJHxkdd2/Qa+u4nk8az8doAcz3eoJMhD+L4Oo+NWYd8T/USVi7Rctc2CPCFgEzPXVcUsC7EJMZi9aRRwGOZY49QlHnvP6DiwmcTIijtmnCW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060264; c=relaxed/simple;
	bh=Exx8ufPYn2NOBW63qhi5921/Qh7WhQyHa9rWFUczEbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/paaPXDFiFcwXeRWFJPLOW6KEGBTFLtLL9oXv6Y2LLml8+diGTsZXDRb/LdN4L/FsMAIYnwJDRtWvE9bNjNzTPpOysY59Ten1YfEyIxTLqOGkGiqigya2mO/kuB3Sresmiq1rmKYykSor1V2lx/dgjRv+TBbbz0hY81iyRX0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7uYbs5v; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7uYbs5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761060262; x=1792596262;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Exx8ufPYn2NOBW63qhi5921/Qh7WhQyHa9rWFUczEbY=;
  b=l7uYbs5vctgj1Souh0dc50u8wpdaMBNwX3+F96LSgUOXdCrt5L++D4g4
   g3cybe3WLQn/VoNkqJWvUPkfbnANwhfRx7suLke2H7P456cC4BjHPtrMi
   j8oMbUoZzWwtacOn2g22w6lWjbL1UhPKQzF+gNhvB4qQ9KQRJVgoXOjcO
   /YRe8rBpOICxMt6BCcZH1qHHGUCYZMnAdL0iRmLf9XppgGyAbujDEQ5XP
   787umj1UbSKB0ZC4lHc+PhTdhXzhIEArVOQBu5qhf6r7DS6i7NRbuM24Q
   bDNfbNH8KCfhU4Uciz9fcz1GyPitdUQW4NUidd4io1aPZMofXelom9Zf3
   w==;
X-CSE-ConnectionGUID: BYPHqr03SdqnkQUB0BJ/Cw==
X-CSE-MsgGUID: OV773TaZS2uGDh6IcTtuVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62220142"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62220142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:24:22 -0700
X-CSE-ConnectionGUID: 5xEGvMSTTqa7psmGJazoMQ==
X-CSE-MsgGUID: yTvH0w7bRKGcv0zH/VCGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="214571017"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2025 08:24:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBEDj-000AwZ-04;
	Tue, 21 Oct 2025 15:24:19 +0000
Date: Tue, 21 Oct 2025 23:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/vdpa/vdpa_user/iova_domain.c:406:26: sparse: signed value
 source
Message-ID: <202510212344.qeNCAr9d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/vdpa/vdpa_user/iova_domain.c:406:26: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Eugenio Pérez" <eperezma@redhat.com>

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 1c14b0e4ba988381e362ad8a9651eff0b21bd47f vduse: switch to use virtio map API instead of DMA API
date:   3 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: powerpc-randconfig-r132-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212344.qeNCAr9d-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212344.qeNCAr9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212344.qeNCAr9d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vdpa/vdpa_user/iova_domain.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/asm-generic/memory_model.h:30:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/vdpa/vdpa_user/iova_domain.c:406:26: sparse: signed value source

vim +406 drivers/vdpa/vdpa_user/iova_domain.c

d7b4e3287ca3a7b Maxime Coquelin 2024-02-19  398  
8c773d53fb7b642 Xie Yongji      2021-08-31  399  dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
8c773d53fb7b642 Xie Yongji      2021-08-31  400  				 struct page *page, unsigned long offset,
8c773d53fb7b642 Xie Yongji      2021-08-31  401  				 size_t size, enum dma_data_direction dir,
8c773d53fb7b642 Xie Yongji      2021-08-31  402  				 unsigned long attrs)
8c773d53fb7b642 Xie Yongji      2021-08-31  403  {
8c773d53fb7b642 Xie Yongji      2021-08-31  404  	struct iova_domain *iovad = &domain->stream_iovad;
8c773d53fb7b642 Xie Yongji      2021-08-31  405  	unsigned long limit = domain->bounce_size - 1;
8c773d53fb7b642 Xie Yongji      2021-08-31 @406  	phys_addr_t pa = page_to_phys(page) + offset;
8c773d53fb7b642 Xie Yongji      2021-08-31  407  	dma_addr_t iova = vduse_domain_alloc_iova(iovad, size, limit);
8c773d53fb7b642 Xie Yongji      2021-08-31  408  
8c773d53fb7b642 Xie Yongji      2021-08-31  409  	if (!iova)
8c773d53fb7b642 Xie Yongji      2021-08-31  410  		return DMA_MAPPING_ERROR;
8c773d53fb7b642 Xie Yongji      2021-08-31  411  
8c773d53fb7b642 Xie Yongji      2021-08-31  412  	if (vduse_domain_init_bounce_map(domain))
8c773d53fb7b642 Xie Yongji      2021-08-31  413  		goto err;
8c773d53fb7b642 Xie Yongji      2021-08-31  414  
6c77ed22880d3e8 Xie Yongji      2022-08-03  415  	read_lock(&domain->bounce_lock);
8c773d53fb7b642 Xie Yongji      2021-08-31  416  	if (vduse_domain_map_bounce_page(domain, (u64)iova, (u64)size, pa))
6c77ed22880d3e8 Xie Yongji      2022-08-03  417  		goto err_unlock;
8c773d53fb7b642 Xie Yongji      2021-08-31  418  
d7b4e3287ca3a7b Maxime Coquelin 2024-02-19  419  	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
d7b4e3287ca3a7b Maxime Coquelin 2024-02-19  420  	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
8c773d53fb7b642 Xie Yongji      2021-08-31  421  		vduse_domain_bounce(domain, iova, size, DMA_TO_DEVICE);
8c773d53fb7b642 Xie Yongji      2021-08-31  422  
6c77ed22880d3e8 Xie Yongji      2022-08-03  423  	read_unlock(&domain->bounce_lock);
6c77ed22880d3e8 Xie Yongji      2022-08-03  424  
8c773d53fb7b642 Xie Yongji      2021-08-31  425  	return iova;
6c77ed22880d3e8 Xie Yongji      2022-08-03  426  err_unlock:
6c77ed22880d3e8 Xie Yongji      2022-08-03  427  	read_unlock(&domain->bounce_lock);
8c773d53fb7b642 Xie Yongji      2021-08-31  428  err:
8c773d53fb7b642 Xie Yongji      2021-08-31  429  	vduse_domain_free_iova(iovad, iova, size);
8c773d53fb7b642 Xie Yongji      2021-08-31  430  	return DMA_MAPPING_ERROR;
8c773d53fb7b642 Xie Yongji      2021-08-31  431  }
8c773d53fb7b642 Xie Yongji      2021-08-31  432  

:::::: The code at line 406 was first introduced by commit
:::::: 8c773d53fb7b64267b0f55c1d3517cb8c5e29b3c vduse: Implement an MMU-based software IOTLB

:::::: TO: Xie Yongji <xieyongji@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
