Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C32701B1
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227508; cv=none; b=u/HoPSiZQFNTcH/myitwjgN5yOpwPz46GYnwDTvtZIOh4NFO/2I4ySk2MmlmmL78e1FdBdw9eEUWZJtkhhz+cqyuFwLYw0gEJpL2wpHABRMVfQHhjVhMuPRvQuKNfXOxExj/kJDiW5yF7zlYW2NICvV7m09z59Ypkp7fssusQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227508; c=relaxed/simple;
	bh=f3LgSTmyl5OcHeGL6P1DdFreJnPtYYWLzsC3SODWSJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fg8gg9JgqzdsqQ3nStFT4rqHYNPBNozr0fVReHVni39GMIvmillC9SKD3HFSQ+zznN8CjIi74Biqv5rRrNxRlh3EPg8f6W0XF/VZhjP5eyqQsq3aL7hnSOl8vZI8Rk+ByepaUhX7un05S8jWU+ulUv5ioDcBzgg8REgAugSQOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUBe8APM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUBe8APM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747227506; x=1778763506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3LgSTmyl5OcHeGL6P1DdFreJnPtYYWLzsC3SODWSJI=;
  b=iUBe8APM5/O75MVUCnGjHKhJEqdc2vagkWiaCyElHPfAAfY1JJ/tIVLV
   6BdKx+Fu0JtPtXr6GCXXi1IICpkFMvM81d/lTyXfy4QeqRYyp6i+kNDNS
   Y3s5inNMn1I+zw2UgQJD69UrxRP7KVhq49UFiiwrURRidALQKFmHcSSJu
   K33v8IAyDrBxk5OIvkRVZoNVQiMI+h0OBIBC6BtX6gW3p32IGEe67NCBg
   kC5dfL63/CwCN/QdIDj3MmB7c1KYvo9D+KHm8ajFP+W2835KKmLiFMj0/
   L+yhbyoxImTCQub44ZvuSyzHOKTkAnq1uEX2oVnIFmPiT9t6DN/+winXb
   g==;
X-CSE-ConnectionGUID: U3GQQLb/Spm1JGRD0uxJIA==
X-CSE-MsgGUID: Bijn5zFqSKe9yWhc9EW0IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52926212"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="52926212"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:58:26 -0700
X-CSE-ConnectionGUID: O38KOgNUQySsnLe7Hm1vgg==
X-CSE-MsgGUID: lTriZc3FQQS6t1FnRhBbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="137739709"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2025 05:58:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFBgj-000H8R-3D;
	Wed, 14 May 2025 12:58:21 +0000
Date: Wed, 14 May 2025 20:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Message-ID: <202505142015.sGmTug2W-lkp@intel.com>
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
In-Reply-To: <20250513092803.2096-1-tao.wangtao@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
TO: wangtao <tao.wangtao@honor.com>
TO: sumit.semwal@linaro.org
TO: christian.koenig@amd.com
TO: benjamin.gaignard@collabora.com
TO: Brian.Starkey@arm.com
TO: jstultz@google.com
TO: tjmercier@google.com
CC: linux-media@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linaro-mm-sig@lists.linaro.org
CC: linux-kernel@vger.kernel.org
CC: bintian.wang@honor.com
CC: yipengxiang@honor.com
CC: liulu.liu@honor.com
CC: feng.han@honor.com
CC: wangtao <tao.wangtao@honor.com>

Hi wangtao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linus/master sailus-media-tree/streams v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangtao/dmabuf-heaps-implement-DMA_BUF_IOCTL_RW_FILE-for-system_heap/20250513-173852
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250513092803.2096-1-tao.wangtao%40honor.com
patch subject: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for system_heap
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: loongarch-randconfig-r071-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142015.sGmTug2W-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505142015.sGmTug2W-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:376 system_heap_dma_buf_rw_file() warn: if statement not indented

vim +376 drivers/dma-buf/heaps/system_heap.c

817989ef7a0f10 wangtao 2025-05-13  363  
817989ef7a0f10 wangtao 2025-05-13  364  static int system_heap_dma_buf_rw_file(struct dma_buf *dmabuf,
817989ef7a0f10 wangtao 2025-05-13  365  			struct dma_buf_rw_file *back)
817989ef7a0f10 wangtao 2025-05-13  366  {
817989ef7a0f10 wangtao 2025-05-13  367  	struct system_heap_buffer *buffer = dmabuf->priv;
817989ef7a0f10 wangtao 2025-05-13  368  	int ret = 0;
817989ef7a0f10 wangtao 2025-05-13  369  	__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
817989ef7a0f10 wangtao 2025-05-13  370  	bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
817989ef7a0f10 wangtao 2025-05-13  371  	struct file *filp;
817989ef7a0f10 wangtao 2025-05-13  372  
817989ef7a0f10 wangtao 2025-05-13  373  	if (op != DMA_BUF_RW_FLAGS_READ && op != DMA_BUF_RW_FLAGS_WRITE)
817989ef7a0f10 wangtao 2025-05-13  374  		return -EINVAL;
817989ef7a0f10 wangtao 2025-05-13  375  	if (direct_io) {
817989ef7a0f10 wangtao 2025-05-13 @376  		if (!PAGE_ALIGNED(back->file_offset) ||
817989ef7a0f10 wangtao 2025-05-13  377  			!PAGE_ALIGNED(back->buf_offset) ||
817989ef7a0f10 wangtao 2025-05-13  378  			!PAGE_ALIGNED(back->buf_len))
817989ef7a0f10 wangtao 2025-05-13  379  		return -EINVAL;
817989ef7a0f10 wangtao 2025-05-13  380  	}
817989ef7a0f10 wangtao 2025-05-13  381  	if (!back->buf_len || back->buf_len > dmabuf->size ||
817989ef7a0f10 wangtao 2025-05-13  382  		back->buf_offset >= dmabuf->size ||
817989ef7a0f10 wangtao 2025-05-13  383  		back->buf_offset + back->buf_len > dmabuf->size)
817989ef7a0f10 wangtao 2025-05-13  384  		return -EINVAL;
817989ef7a0f10 wangtao 2025-05-13  385  	if (back->file_offset + back->buf_len < back->file_offset)
817989ef7a0f10 wangtao 2025-05-13  386  		return -EINVAL;
817989ef7a0f10 wangtao 2025-05-13  387  
817989ef7a0f10 wangtao 2025-05-13  388  	filp = fget(back->fd);
817989ef7a0f10 wangtao 2025-05-13  389  	if (!filp)
817989ef7a0f10 wangtao 2025-05-13  390  		return -EBADF;
817989ef7a0f10 wangtao 2025-05-13  391  
817989ef7a0f10 wangtao 2025-05-13  392  	mutex_lock(&buffer->lock);
817989ef7a0f10 wangtao 2025-05-13  393  	ret = system_heap_rw_file(buffer, op == DMA_BUF_RW_FLAGS_READ, direct_io,
817989ef7a0f10 wangtao 2025-05-13  394  			filp, back->file_offset, back->buf_offset, back->buf_len);
817989ef7a0f10 wangtao 2025-05-13  395  	mutex_unlock(&buffer->lock);
817989ef7a0f10 wangtao 2025-05-13  396  
817989ef7a0f10 wangtao 2025-05-13  397  	fput(filp);
817989ef7a0f10 wangtao 2025-05-13  398  	return ret;
817989ef7a0f10 wangtao 2025-05-13  399  }
817989ef7a0f10 wangtao 2025-05-13  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
