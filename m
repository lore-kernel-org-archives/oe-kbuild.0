Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78603277029
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 10:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940494; cv=none; b=t0NfDyRVd8y/U09HLFnr4KAJaIvxjHPZGdA6JrBbnYeBzqiPYg2v0CHppM3dY+B9SaF1NVTW6O2wU9Z90hkmtY28FDfcUzzeLdr/WfRHXtK6nBeHW6/xeLDhe5EhRij3duhe/nvhuW3ZvIMf/DSsr9W1D7Zl0bjXzFTul0BgMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940494; c=relaxed/simple;
	bh=jhUuU0nKyi+elaqabsBptYNM+a+pIEXdQqEF45ROXhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QuyZwhQ9RnyOTEuwyAtSnxDk2mJCFQnQeUK5pyNjTIs2X6Mo7SN+tMjPNBu1UyLSpHswWJ+0Aw/QM0arWnIdSAuMV0rsJIiJCKvARPLtIMOHXV03ugkya1X1Eva4r/uES1VzZrYzLvnI44zID+ReY/wN0RR3xXFpywbFOj4pSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8pMPNKW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8pMPNKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776940492; x=1808476492;
  h=date:from:to:cc:subject:message-id;
  bh=jhUuU0nKyi+elaqabsBptYNM+a+pIEXdQqEF45ROXhs=;
  b=L8pMPNKWzrNrpzzcqxdtxxnUZ2LUWi9Qy3xDbumKvak6c7+vWyIbP10Y
   WQ/bsJ0fUSGacFj/cUSoQCrfUwFLibTIKoMMc3N8aEW10AEbfc7fyXj0C
   3bDColQgl28CG39u1rg1Us7XXZ+odAyYrM/GhkXmPRp9o0dBA0FZq2nHo
   iBYdDHq1viw4WeLMUxFw7u11/cTB2Flw0E8I4ZvtYtEHD2ST6KiWhVsr2
   3T1v/H0Oie8q+HWe65WrUOIe71qsDL6/x1CM7iaGjz/LmhO8n448RSaND
   SKRLs3OM4yPidvPQBYwCEba/EpgW29zvJB7HbvC15x2LoWYrDCpTAqwfi
   A==;
X-CSE-ConnectionGUID: RoygXRGCRTObrWcszvv6mw==
X-CSE-MsgGUID: EQDR/nq2QOCN5l1vP8jEgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78096184"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="78096184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 03:34:52 -0700
X-CSE-ConnectionGUID: dFbhDq2pTWWSHDLOyyAzkg==
X-CSE-MsgGUID: rmFPcS81QD6E4p/cSKNjjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236991317"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Apr 2026 03:34:51 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFrOS-000000002Z7-1Eij;
	Thu, 23 Apr 2026 10:34:48 +0000
Date: Thu, 23 Apr 2026 18:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 2/2]
 drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error:
 buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)
Message-ID: <202604231850.HWb35U8K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b09267bea1e532363f4939b9489e97c7b108d461
commit: b882b8502c3496eb2520d2d03fa94f7e6fa23075 [2/2] ANDROID: dma-buf: system_heap: Add pagepool support to system heap
:::::: branch date: 14 hours ago
:::::: commit date: 3 years, 1 month ago
config: i386-randconfig-141-20260423 (https://download.01.org/0day-ci/archive/20260423/202604231850.HWb35U8K-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604231850.HWb35U8K-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error: buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)

vim +347 drivers/dma-buf/heaps/system_heap.c

b882b8502c3496e John Stultz 2019-06-06  328  
5f9d15ca7993a69 John Stultz 2020-09-25  329  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
5f9d15ca7993a69 John Stultz 2020-09-25  330  {
5f9d15ca7993a69 John Stultz 2020-09-25  331  	struct system_heap_buffer *buffer = dmabuf->priv;
5f9d15ca7993a69 John Stultz 2020-09-25  332  	struct sg_table *table;
5f9d15ca7993a69 John Stultz 2020-09-25  333  	struct scatterlist *sg;
b882b8502c3496e John Stultz 2019-06-06  334  	int i, j;
b882b8502c3496e John Stultz 2019-06-06  335  
b882b8502c3496e John Stultz 2019-06-06  336  	/* Zero the buffer pages before adding back to the pool */
b882b8502c3496e John Stultz 2019-06-06  337  	system_heap_zero_buffer(buffer);
5f9d15ca7993a69 John Stultz 2020-09-25  338  
5f9d15ca7993a69 John Stultz 2020-09-25  339  	table = &buffer->sg_table;
679d94cd7d90087 Guangming   2021-11-26  340  	for_each_sgtable_sg(table, sg, i) {
0597bca8783840b John Stultz 2020-09-26  341  		struct page *page = sg_page(sg);
0597bca8783840b John Stultz 2020-09-26  342  
b882b8502c3496e John Stultz 2019-06-06  343  		for (j = 0; j < NUM_ORDERS; j++) {
b882b8502c3496e John Stultz 2019-06-06  344  			if (compound_order(page) == orders[j])
b882b8502c3496e John Stultz 2019-06-06  345  				break;
b882b8502c3496e John Stultz 2019-06-06  346  		}
b882b8502c3496e John Stultz 2019-06-06 @347  		dmabuf_page_pool_free(pools[j], page);
0597bca8783840b John Stultz 2020-09-26  348  	}
5f9d15ca7993a69 John Stultz 2020-09-25  349  	sg_free_table(table);
efa04fefebbd724 John Stultz 2019-12-03  350  	kfree(buffer);
efa04fefebbd724 John Stultz 2019-12-03  351  }
efa04fefebbd724 John Stultz 2019-12-03  352  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
