Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954593;
	b=KCWYG+I318JHCdUc2w1LVAIYAe7sz/UYxhFlBAd9r9NNgKmzp5syWBeHnuTXO/mzgX15
	 7jjxMbO6lrYzsGm9WSR8yu51pprysfD+4UZC0ibBgABCrEDj1uvhw1kJeN2rddQcDhkoQ
	 pO3fUhyw74sQqKsTuDMxam13fEZOek83EaLl0/nX8COMxNA8+s0bqy3trVN+oGYdylhWZ
	 RTfK2XV/20BvDZVG+6FwsR5Z2/qFxXNZ9ITt4e738N4ol1ODMT2p4ES/vovMhSXXYrQty
	 UXnFMlYXPwiHBrPryCpX61qDCuJhAJ2LIjIuMn9T1AxDOY+DOHmsOnj2eN6x/wNOs/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9OyKKH7RB/bf2PniQJLkWlw5oL8jl6p9nVf/2843Rk4=;
	b=C9RNl1hbAtdHKZnjGL4wH/tIaDEmbxjdyfxytNlnOEji32hW0jQr/w6tppSFYYvxFyzx
	 ct4gJwzuYD3ZhnPUcI9pM+E2ozo+H7IjxwlylqSMV8zAJJ0AxAfJL0JYEAgmX2KjabqcM
	 Bfei5uXlftp+Y8/gd4TqfS8L+tcPnJHKjdY5t5gKZVk5EODGdg6XzYSAZwdaaPZY/Mzmm
	 GwE1+KVnysCZMyq0eBQXS1brM5R7VnM6+WGtLN0bU0KpkZTA+hrVWA2DB57accXHCyeGF
	 RKg8X7RCVASfhBOIJCw8ob4Pv+MAagfOJ/lhwUaccr4HP8cJvIpGqAxGfkGiK3TZdKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZaoHbJKN;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60031606A328
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 08:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60031606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZaoHbJKN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793954592; x=1825490592;
  h=date:from:to:cc:subject:message-id;
  bh=zW5QX5yrPVT/pZBb0qFPumHmK9Xv3skU0CuMd8asOfo=;
  b=ZaoHbJKNHSzrMWJspdYJCQkXIDdk1YE6rjzyoWONEuaZR6mVMOHgFobm
   MbOqnsfHU8pShlMCy6NVmRJKd9E2IjirQmGW16FtJGesAzBvICVta9NAq
   1+B2f8XVZm6bQtbPZZrrMV0g+nUe3BptSiQVHDW0q6v5sIVt+Bx5YoVge
   jTTWt7i4OIDIDrhGDm6zopC1GcA6x92WPVJ6sMH92iWkjtpuZ3neqkrjf
   yIkZc/aXZMWCMdLMCWhtDa4pgjgloHmOMAyDuZNljybJkwW1ah3jetxKs
   3QK1PGy9IBKTxJwdrcCu7VkmxlXIGYKKDGpow9c2yH8lN9WVUOtPuOoNZ
   A==;
X-CSE-ConnectionGUID: pGxYOrD1S5CfO5nloW2S5Q==
X-CSE-MsgGUID: FWUgjzwcQCCWF8u/Sgp6Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2642845"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2642845"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:43:11 -0800
X-CSE-ConnectionGUID: Ez3JOCauSVC1KdcyIXqfDQ==
X-CSE-MsgGUID: cBTjoknPQ7ideEGN5plwxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7565289"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2026 00:43:10 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPFXP-00000000A9z-1bxc;
	Fri, 06 Nov 2026 08:43:07 +0000
Date: Fri, 06 Nov 2026 09:42:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/iomap/direct-io.c:939:36-37: WARNING opportunity for
 min()
Message-ID: <202611060930.LoRvnTKC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Fengnan Chang <changfengnan@bytedance.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 36f199c8d0ee4b8dab3559c8bc23dd5e7c366972 iomap: add simple dio path for small direct I/O
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060930.LoRvnTKC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 36f199c8d0ee ("iomap: add simple dio path for small direct I/O")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611060930.LoRvnTKC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/iomap/direct-io.c:939:36-37: WARNING opportunity for min()

vim +939 fs/iomap/direct-io.c

36f199c8d0ee4b8 Fengnan Chang 2026-07-01  913  
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  914  static ssize_t iomap_dio_simple_complete(struct iomap_dio_simple *sr)
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  915  {
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  916  	struct bio *bio = &sr->bio;
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  917  	struct kiocb *iocb = sr->iocb;
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  918  	struct inode *inode = file_inode(iocb->ki_filp);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  919  	ssize_t ret;
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  920  
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  921  	if (unlikely(bio->bi_status)) {
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  922  		ret = blk_status_to_errno(bio->bi_status);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  923  		if (should_report_dio_fserror(ret))
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  924  			fserror_report_io(inode, FSERR_DIRECTIO_READ,
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  925  					  iocb->ki_pos, sr->size, ret,
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  926  					  GFP_NOFS);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  927  	} else {
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  928  		ret = sr->size;
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  929  		iocb->ki_pos += ret;
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  930  	}
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  931  
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  932  	if (sr->dio_flags & IOMAP_DIO_USER_BACKED) {
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  933  		bio_check_pages_dirty(bio);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  934  	} else {
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  935  		bio_release_pages(bio, false);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  936  		bio_put(bio);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  937  	}
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  938  	inode_dio_end(inode);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01 @939  	trace_iomap_dio_complete(iocb, ret < 0 ? ret : 0, ret);
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  940  	return ret;
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  941  }
36f199c8d0ee4b8 Fengnan Chang 2026-07-01  942  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
