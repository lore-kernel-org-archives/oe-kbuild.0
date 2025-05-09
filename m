Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98325EFA3
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824701; cv=none; b=A+W9wKQYp+Y7I1APRFD4lcSwyLNFFKUd/6DvtiF3uRIyM62cOjyjgykE7kszK/XXHW7No8tBdmHqoSK2exptYgHLqFGUZe3jh1OPPd9/jnkL66uQ+SYEsnyN6Q+7vmcOJCHfUN7MbciWHWnXehSyLM26sjwIcCaHLywNuZjNigE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824701; c=relaxed/simple;
	bh=dV/35L59eYDKdHo8aULfyPfRkbG2CYbrhQhUr9u+1lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDVZsyWKvF2ApGBSmTYwNGlBHj1o+tkwB90YQM9AZ9dL0evrgynnH5VdOpKqQ6/L5g4RQWnP2u0b0ELb+bFIu2lhuZcvwZ5hcoRoDKP4CgLBW7T2BvS+8f05DbWrJy9IQU+w1RpM+1w4KG0uzmdhNxbsHsdwnGw8E+q5NaqcXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btv86XWA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btv86XWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746824700; x=1778360700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dV/35L59eYDKdHo8aULfyPfRkbG2CYbrhQhUr9u+1lw=;
  b=btv86XWARO6OEjbF71NUqra980i3S3RvMOxYzeKZh+q1Cun36KHQLMVX
   F5hFC7yDr+xDZiC8d9ODRjJbfQpxdD59zhvHrkccs5WTV66qDqeRvaoDM
   BO/QKE0xTDMKuys6W7aI75mdR9pwPo9vB9g6+6H2N4gx9vWYNf+FoOZua
   QHkRJ+akmCuNWnaFesJfabRduxXbx9pdWQGBDmhWeb/Q21P9afVPitkbo
   MXihYH/0ijoJMfjrgEar3Eov+bOHop+rv38uAQOYV1ReqmPfxy0x4Xuhk
   ApepgGWp8YChiXt6Ows+YvGLqmnPaR6Jjp7eG53vm+77+K0b5iz5Revsz
   Q==;
X-CSE-ConnectionGUID: SkyDC9lLT+qGZwunR8R6UA==
X-CSE-MsgGUID: hL8uphlMT0K4LyxZas9cvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66204168"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="66204168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 14:04:59 -0700
X-CSE-ConnectionGUID: vb1f07Z/RwO0AMP6HquVMQ==
X-CSE-MsgGUID: +8mZga5NTGyvzABT4r7rmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136680959"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2025 14:04:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDUtr-000CTZ-1I;
	Fri, 09 May 2025 21:04:55 +0000
Date: Sat, 10 May 2025 05:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-nvme:nvme-6.16 11/14] drivers/nvme/target/core.c:1018
 nvmet_sq_init() error: uninitialized symbol 'ret'.
Message-ID: <202505100417.PlIkH5TX-lkp@intel.com>
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
CC: linux-nvme@lists.infradead.org
TO: Wilfred Mallawa <wilfred.mallawa@wdc.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Damien Le Moal <dlemoal@kernel.org>

tree:   git://git.infradead.org/nvme.git nvme-6.16
head:   a0136c6ac4a9aba90a47b9c691bc299a113b5259
commit: 206372d7c565174e6b8289dac03077b23b8369c9 [11/14] nvmet: support completion queue sharing
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100417.PlIkH5TX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505100417.PlIkH5TX-lkp@intel.com/

smatch warnings:
drivers/nvme/target/core.c:1018 nvmet_sq_init() error: uninitialized symbol 'ret'.

vim +/ret +1018 drivers/nvme/target/core.c

a07b4970f464f1 Christoph Hellwig 2016-06-21  1012  
206372d7c56517 Wilfred Mallawa   2025-04-24  1013  int nvmet_sq_init(struct nvmet_sq *sq, struct nvmet_cq *cq)
a07b4970f464f1 Christoph Hellwig 2016-06-21  1014  {
a07b4970f464f1 Christoph Hellwig 2016-06-21  1015  	int ret;
a07b4970f464f1 Christoph Hellwig 2016-06-21  1016  
206372d7c56517 Wilfred Mallawa   2025-04-24  1017  	if (!nvmet_cq_get(cq))
206372d7c56517 Wilfred Mallawa   2025-04-24 @1018  		return ret;
206372d7c56517 Wilfred Mallawa   2025-04-24  1019  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1020  	ret = percpu_ref_init(&sq->ref, nvmet_sq_free, 0, GFP_KERNEL);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1021  	if (ret) {
a07b4970f464f1 Christoph Hellwig 2016-06-21  1022  		pr_err("percpu_ref init failed!\n");
206372d7c56517 Wilfred Mallawa   2025-04-24  1023  		nvmet_cq_put(cq);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1024  		return ret;
a07b4970f464f1 Christoph Hellwig 2016-06-21  1025  	}
a07b4970f464f1 Christoph Hellwig 2016-06-21  1026  	init_completion(&sq->free_done);
427242ce99e432 Sagi Grimberg     2017-03-06  1027  	init_completion(&sq->confirm_done);
1befd944e05050 Christoph Hellwig 2022-09-20  1028  	nvmet_auth_sq_init(sq);
206372d7c56517 Wilfred Mallawa   2025-04-24  1029  	sq->cq = cq;
a07b4970f464f1 Christoph Hellwig 2016-06-21  1030  
a07b4970f464f1 Christoph Hellwig 2016-06-21  1031  	return 0;
a07b4970f464f1 Christoph Hellwig 2016-06-21  1032  }
a07b4970f464f1 Christoph Hellwig 2016-06-21  1033  EXPORT_SYMBOL_GPL(nvmet_sq_init);
a07b4970f464f1 Christoph Hellwig 2016-06-21  1034  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
