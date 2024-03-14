Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822571B2F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430898; cv=none; b=Am/pTxLIPFSINrmtbtGTjYGcfmJ2fNlrxKfxBIHg3Ylvzb3yz3OWpDZ5PoH/7wMECHUgFIBXzVJIxwNlBslaggC1h5KTfTKAoEbW73wfp4UA2uJx1rstdeuBqKhxh0aPS9h7kj19JgrPzZW7Meru6wpCxbN4qrr6fGs9s56evpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430898; c=relaxed/simple;
	bh=F6/WmA0cKen57lx0qjjkbOTBRxl6zWUFFQ9wZqF2Pkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XnWbzP1C60DaBwjoaEwFC0XX8zLCz0gZk8ptBemSCtZlc5WftLuBKO5EZQpzR47XQeag9yFbf3gsq+9lWzBcvzpdm04sEkT5obMdRWVBW2syXfYwIotBJVAsPMJY8qWpT2m4W6eSmZPBg1mCjGt1XTwvqOuFCqAFv8bqF06zI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHkwdDXu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHkwdDXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710430896; x=1741966896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6/WmA0cKen57lx0qjjkbOTBRxl6zWUFFQ9wZqF2Pkk=;
  b=cHkwdDXuNALxjOKEbr/kmzENUnHCvE9vUciQJsWgA3X5xTNuCVnVbVn7
   2k9Bf5/BeC0zpKUqZvgrk1Wma6vJoEBXftl4M81HCM7nwBbJVsyjKe0MX
   SSbqsZKSbVcxgqb5zI4s/a6JVsieKwS5xieLiW4vX0gZUMS1sc10VwNrc
   3CUJmiBtJz5H72fgSOzAayYoS+XloQlQQHBeXzEp7jnidb3ON70d7dVHE
   Zyw2ful9r0rp1XJkeZUTACy7S6sP+hW1U5wLy3trxDSS4dcGtCPTBwcsq
   uPfrh08o0donWUXGz0POy7c+pO2RCB3zgrrLDMg6dv6gVidUySOJSpS3q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15982483"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="15982483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="49755487"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Mar 2024 08:41:34 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rknD1-000DZb-1W;
	Thu, 14 Mar 2024 15:41:31 +0000
Date: Thu, 14 Mar 2024 23:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:io_uring-recvsend-bundle 16/16]
 io_uring/io_uring.c:2878 io_mem_alloc() warn: 'ret' is an error pointer or
 valid
Message-ID: <202403142336.zEgQS4hl-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45
commit: 57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45 [16/16] io_uring: alloc ring memory as a compound page, if possible
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-141-20240314 (https://download.01.org/0day-ci/archive/20240314/202403142336.zEgQS4hl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403142336.zEgQS4hl-lkp@intel.com/

New smatch warnings:
io_uring/io_uring.c:2878 io_mem_alloc() warn: 'ret' is an error pointer or valid

Old smatch warnings:
io_uring/io_uring.c:2062 io_file_get_normal() warn: fd re-used after fget(): 'fd'

vim +/ret +2878 io_uring/io_uring.c

57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2859  
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2860  void *io_mem_alloc(struct page ***out_pages, unsigned short *npages,
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2861  		   size_t size)
b9bd2bea0f22f5 fs/io_uring.c       Pavel Begunkov 2021-08-09  2862  {
73572984481907 io_uring/io_uring.c Jens Axboe     2022-06-13  2863  	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN | __GFP_COMP;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2864  	struct page **pages;
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2865  	int nr_pages;
e27cef86a0edd4 io_uring/io_uring.c Jens Axboe     2021-11-05  2866  	void *ret;
b9bd2bea0f22f5 fs/io_uring.c       Pavel Begunkov 2021-08-09  2867  
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2868  	nr_pages = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2869  	pages = kvmalloc_array(nr_pages, sizeof(struct page *), gfp);
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2870  	if (!pages)
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2871  		return NULL;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2872  
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2873  	ret = io_mem_alloc_compound(pages, nr_pages, size, gfp);
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2874  	if (ret)
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2875  		goto done;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2876  
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2877  	ret = io_mem_alloc_single(pages, nr_pages, size, gfp);
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13 @2878  	if (ret) {
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2879  done:
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2880  		*out_pages = pages;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2881  		*npages = nr_pages;
e27cef86a0edd4 io_uring/io_uring.c Jens Axboe     2021-11-05  2882  		return ret;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2883  	}
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2884  
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2885  	return NULL;
73572984481907 io_uring/io_uring.c Jens Axboe     2022-06-13  2886  }
b9bd2bea0f22f5 fs/io_uring.c       Pavel Begunkov 2021-08-09  2887  

:::::: The code at line 2878 was first introduced by commit
:::::: 469421fb116f26e61d8e079f98f1bb89d3f3f39a io_uring: get rid of remap_pfn_range() for mapping rings/sqes

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
