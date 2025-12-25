Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBCA1E885A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 02:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766630164; cv=none; b=RWC1pcOmTok6g9kFSWtaK0Vd3fNyK7kaJSoqQn4jjiPdfU/5bTFZDb2Xn+qeGdSYu4DFXAYBHgn9KXA5H44obWdx81ChyQPcIaWktnSCcUTKOFoD/2s3olzU2BAh9BL2UlF8Mff1foDT76hZHX4YMkvXtvPnjNpMZYOqU5wxirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766630164; c=relaxed/simple;
	bh=mRqQFpLB2Z6fBWwLOIsultLKjLgUIMrl1VkFZKXZtLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fyYl9BrIvwycYIdjHuVP9iD/DlVLi4JwZ6cN3FMJKxLx+iykifIpaJcxfQ6LcDXo5ifkC8MQmeL4zRcEAou6Nf0Sh0XqkVmISXKyEETQzGaVj7+8suz4uuoXQ3pmRlg/bJOCDqDqX+n0vf5K6EgDbbc2N7QI6hCyjCiGEG2EdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIqQ0J6M; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIqQ0J6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766630162; x=1798166162;
  h=date:from:to:cc:subject:message-id;
  bh=mRqQFpLB2Z6fBWwLOIsultLKjLgUIMrl1VkFZKXZtLE=;
  b=kIqQ0J6MOgCFMkc2MuKUtXhQIgSY4rAB8K8YDypa9JUoLLXGo4Z228Pu
   Xfver6Hx/HeXvVPD9odrUNYPl03HCwewp/KqX4DCZBE+tGASPCohy4NtK
   TlRjoRkEehO1MBcB1jQlZoYe59IIlYziTf1hBPt8s6OW8MSMZ1hGDxYRp
   BzMZ7BTfU1WC2BpaSfADGd5F1QPfyx4nXdV11i/no+Fxw6qwW4v6YE/ky
   uF2oFep+HC/+b9toGJHOrdC35jsUaUULlDEWv1Ffa8GvtJkwoOJ0hNgQw
   UMGwrQAHnkAJ9vv6cZvvJkmissqJNHcnNX+8gIP9+3HDELl7DkO3dkXgp
   A==;
X-CSE-ConnectionGUID: rBOneVIbSkO3YUZyjdlTFg==
X-CSE-MsgGUID: 79JdyjiNR8uwRahyCEHGHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67448120"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="67448120"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:36:02 -0800
X-CSE-ConnectionGUID: /PV4H5CaRYe7hxy+3xA+Nw==
X-CSE-MsgGUID: vn/Qs3l3T2WMeT8OGcBiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200440056"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2025 18:36:01 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbCo-000000003ef-2PGL;
	Thu, 25 Dec 2025 02:35:58 +0000
Date: Thu, 25 Dec 2025 10:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 50/50]
 drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error:
 buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)
Message-ID: <202512251032.CRikw3RC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1937a62dd1dad3155e2ec8c130f263e8f74ddf32
commit: b882b8502c3496eb2520d2d03fa94f7e6fa23075 [50/50] ANDROID: dma-buf: system_heap: Add pagepool support to system heap
:::::: branch date: 17 hours ago
:::::: commit date: 2 years, 9 months ago
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251225/202512251032.CRikw3RC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512251032.CRikw3RC-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error: buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)

vim +347 drivers/dma-buf/heaps/system_heap.c

b882b8502c3496 John Stultz 2019-06-06  328  
5f9d15ca7993a6 John Stultz 2020-09-25  329  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
5f9d15ca7993a6 John Stultz 2020-09-25  330  {
5f9d15ca7993a6 John Stultz 2020-09-25  331  	struct system_heap_buffer *buffer = dmabuf->priv;
5f9d15ca7993a6 John Stultz 2020-09-25  332  	struct sg_table *table;
5f9d15ca7993a6 John Stultz 2020-09-25  333  	struct scatterlist *sg;
b882b8502c3496 John Stultz 2019-06-06  334  	int i, j;
b882b8502c3496 John Stultz 2019-06-06  335  
b882b8502c3496 John Stultz 2019-06-06  336  	/* Zero the buffer pages before adding back to the pool */
b882b8502c3496 John Stultz 2019-06-06  337  	system_heap_zero_buffer(buffer);
5f9d15ca7993a6 John Stultz 2020-09-25  338  
5f9d15ca7993a6 John Stultz 2020-09-25  339  	table = &buffer->sg_table;
679d94cd7d9008 Guangming   2021-11-26  340  	for_each_sgtable_sg(table, sg, i) {
0597bca8783840 John Stultz 2020-09-26  341  		struct page *page = sg_page(sg);
0597bca8783840 John Stultz 2020-09-26  342  
b882b8502c3496 John Stultz 2019-06-06  343  		for (j = 0; j < NUM_ORDERS; j++) {
b882b8502c3496 John Stultz 2019-06-06  344  			if (compound_order(page) == orders[j])
b882b8502c3496 John Stultz 2019-06-06  345  				break;
b882b8502c3496 John Stultz 2019-06-06  346  		}
b882b8502c3496 John Stultz 2019-06-06 @347  		dmabuf_page_pool_free(pools[j], page);
0597bca8783840 John Stultz 2020-09-26  348  	}
5f9d15ca7993a6 John Stultz 2020-09-25  349  	sg_free_table(table);
efa04fefebbd72 John Stultz 2019-12-03  350  	kfree(buffer);
efa04fefebbd72 John Stultz 2019-12-03  351  }
efa04fefebbd72 John Stultz 2019-12-03  352  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
