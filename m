Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942420A5D6
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047851; cv=none; b=P9m+hGhjxu52GyQh/gpZQxHPATAf1jUIIGrYQiT3jxvFA6AKNxqEmkoYjJLzAPQIoocmLS+LDXUGiW6CmnN0FWkKg04cOcNA8eKSqtrnfEZGETqd/HLt0n/cCqg142LbUi/tLi/r97QWBp4hSozJX8XA/Xk1JeOHuKCsYQI+Ns0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047851; c=relaxed/simple;
	bh=vHMyQw+3U8ZnksVeK1j0Y7Cvi13qLx2r6H8p08xhvas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhGIiqHk/I9xYM/ep26rqBLQ8X226HZIOU8ViImWCbSENtRjI+JnbOFOp5c7sIaBwE9ZA+wxCg6cQwTedX9fTZyBrkv2q/R7nqEW01NZeUWqmTkAoGzfC8HzQd3oq7Lkzxgv1S5bvU1BNvE676e8V7cb7JAzUUlUp0bXeZlRGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPr1vkUT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPr1vkUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744047849; x=1775583849;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vHMyQw+3U8ZnksVeK1j0Y7Cvi13qLx2r6H8p08xhvas=;
  b=TPr1vkUTSDUna64Mo5wtVcvCokQwyu1WfXJ0qMsZSoDUhA12XG0cbz4c
   qZIGdZTZLN0TfZ/8kPIb1/PDSaXdoNbZkRYH0jUEodpwLw/1/5kw2lMY5
   yiUjE3ADrcd7G6D0CkdDh+YS53KZ+LMs8GE+VU3jyV+XMWD5tWZTbcp20
   e4ITKPqMNCBW18Ro6MGby18AqX9y4CGA5x5CsdRn//0EoWTRJD2npgP5O
   f1QT2Q0LrtQjn7aqPg2MJ0DQYC2fM/h9mLti8qSw4NlfIRRj0eU4Fgjah
   ojSYTR/xHOhpHMDxX7LTqcdM+ElIt2whkrmgAVsWwlKwwf6qeWOU0geeS
   g==;
X-CSE-ConnectionGUID: QvIYOx7cRZq611iUY2RtyQ==
X-CSE-MsgGUID: Oq31jpLVSX6OSLO2C1DSyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45617241"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45617241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:44:08 -0700
X-CSE-ConnectionGUID: KNOq66l9TOyoRhqFhatONA==
X-CSE-MsgGUID: DwwE+CzqTa+6wSQgpSxCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132752893"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2025 10:44:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1qVx-0003fP-01;
	Mon, 07 Apr 2025 17:44:05 +0000
Date: Tue, 8 Apr 2025 01:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [toke:page-pool-track-dma 3/3] include/net/page_pool/types.h:319
 page_pool_page_is_pp() warn: masked condition '(page->pp_magic & ~(((0) +
 (((~((0))) << ((1 + __fls((64 + (6767463209352822784)) -
 (6767463209352822784))))) & (~((0)) >> (64 - 1 - ((((32) <
 (__ffs((6767463209352822784)) -...
Message-ID: <202504080108.OQLQmxdd-lkp@intel.com>
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
TO: "Toke Høiland-Jørgensen" <toke@redhat.com>
CC: Mina Almasry <almasrymina@google.com>
CC: Jesper Dangaard Brouer <hawk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git page-pool-track-dma
head:   00a0b4613ed5cb0e10f2e370a7fd613a742e2c1d
commit: 00a0b4613ed5cb0e10f2e370a7fd613a742e2c1d [3/3] page_pool: Track DMA-mapped pages and unmap them when destroying the pool
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: powerpc64-randconfig-r071-20250407 (https://download.01.org/0day-ci/archive/20250408/202504080108.OQLQmxdd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504080108.OQLQmxdd-lkp@intel.com/

smatch warnings:
include/net/page_pool/types.h:319 page_pool_page_is_pp() warn: masked condition '(page->pp_magic & ~(((0) + (((~((0))) << ((1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) & (~((0)) >> (64 - 1 - ((((32) < (__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) + (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))) - 1))))) | 3)) == (64 + (6767463209352822784))' is always false.

vim +319 include/net/page_pool/types.h

a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  316  
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  317  static inline bool page_pool_page_is_pp(struct page *page)
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  318  {
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10 @319  	return (page->pp_magic & PP_MAGIC_MASK) == PP_SIGNATURE;
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  320  }
a9ca9f9ceff382b Yunsheng Lin           2023-08-04  321  #else
a9ca9f9ceff382b Yunsheng Lin           2023-08-04  322  static inline void page_pool_destroy(struct page_pool *pool)
a9ca9f9ceff382b Yunsheng Lin           2023-08-04  323  {
a9ca9f9ceff382b Yunsheng Lin           2023-08-04  324  }
a9ca9f9ceff382b Yunsheng Lin           2023-08-04  325  

:::::: The code at line 319 was first introduced by commit
:::::: a4a22a1caf31aeb57416327c9dfca479614b6b76 page_pool: Move pp_magic check into helper functions

:::::: TO: Toke Høiland-Jørgensen <toke@redhat.com>
:::::: CC: Toke Høiland-Jørgensen <toke@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
