Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D725B090
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709631; cv=none; b=Jmtxe0UM8T2HxPFk8qz4XuedXBYc4Z3/FVFP6kYtEKreSKjqtJRvyvhxO+msqU6WDyVIIKggTig442cwbtMvr/6PVaUtAWVlGfH/yh4Q0vWoXUGSJGzxeW06iWyDZncRZqV+IqO++LErNWQm5+Re1uIWNzPMzNYf3KkIcGWgzlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709631; c=relaxed/simple;
	bh=i5IP9iWggcVDvEuRVO0xzWgpIqv6zwx27pDfQSPSoCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VrPxy4eXZXUAWvlfMF1+YkaLgAr9SezxniPSQeeiV83URpZaf5CbgcPBwQFGxM4t+z564vpwXkjBYWMwIKEtpnsluA0qVfCVDi1uev/6sdDzDUf2AQZrhDCRwrk9VtNjPURGbvhFY2Ui1/oarWH0QrxPplg8El339+xvVbkdMMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjeY1OwP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjeY1OwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785709629; x=1817245629;
  h=date:from:to:cc:subject:message-id;
  bh=i5IP9iWggcVDvEuRVO0xzWgpIqv6zwx27pDfQSPSoCA=;
  b=ZjeY1OwP9s7Tyqn9YOjsxOyu+apGmqyL1Hxht5iRkWXxuxvtnXyui99g
   0Cdpg8uY3PIDjf8OenVRjQiYchDkD87LFugUDd+1QozeLnReP3oGj0fIX
   gBmJDJWKDW8QJN1Z+Fmxg9LjMHwE7t1Z3wZbRqX+Q5R0mS59AaT/WB+R8
   qIZ3rpcG4hoeSoqQdOkpdXGhn8hbfXFF+6dKz/QvAEu9nNvvctZBJBBDn
   mzPfHu2PIG0A//gdFqAsOEbbeHwrrguXUtDd4t3VczWcR0dMMlxCMpIYT
   jU2tP0a8r/gV9nxC4p43T9Nw5bKdiftKIBfyDSPx+8RCjwmtIH6sCu8qF
   g==;
X-CSE-ConnectionGUID: i4znuWIRToCLl5FV26r20A==
X-CSE-MsgGUID: RpM0i/l/RwSp88VISMKt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86200295"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="86200295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 15:27:08 -0700
X-CSE-ConnectionGUID: ypmaSQPdTX28bklv99z51A==
X-CSE-MsgGUID: v2H2OmU0T1qktKLn2fbtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="259827006"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2026 15:27:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqee9-000000005bh-1hRL;
	Sun, 02 Aug 2026 22:27:05 +0000
Date: Mon, 03 Aug 2026 06:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:rw-dmabuf-v5 1/16]
 drivers/dma-buf/dma-buf-io.c:169 dma_buf_io_create_map() warn: inconsistent
 returns 'dmabuf->resv'.
Message-ID: <202608030631.jIkiKCzz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux rw-dmabuf-v5
head:   71c75106fd3c8852b3856e472b586db82e480f7b
commit: ff5dccf71e8c03d62797352c4bb5fbb7c6c759c8 [1/16] dma-buf: introduce initial file I/O infrastructure
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20260803 (https://download.01.org/0day-ci/archive/20260803/202608030631.jIkiKCzz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608030631.jIkiKCzz-lkp@intel.com/

smatch warnings:
drivers/dma-buf/dma-buf-io.c:169 dma_buf_io_create_map() warn: inconsistent returns 'dmabuf->resv'.

vim +169 drivers/dma-buf/dma-buf-io.c

ff5dccf71e8c03 Pavel Begunkov 2026-04-19  118  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  119  struct dma_buf_io_map *dma_buf_io_create_map(struct dma_buf_io_ctx *ctx)
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  120  {
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  121  	struct dma_buf *dmabuf = ctx->dmabuf;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  122  	struct dma_buf_io_map *map;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  123  	long ret;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  124  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  125  retry:
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  126  	/*
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  127  	 * ->dmabuf_map() will be calling dma_buf_map_attachment(), for which
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  128  	 * we'll need to wait for fences. Do a bit nicer and try to wait
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  129  	 * without the resv lock first.
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  130  	 */
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  131  	ret = dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_KERNEL,
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  132  				    true, MAX_SCHEDULE_TIMEOUT);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  133  	if (!ret)
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  134  		ret = -EAGAIN;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  135  	if (ret < 0)
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  136  		return ERR_PTR(ret);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  137  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  138  	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  139  	if (ret)
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  140  		return ERR_PTR(ret);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  141  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  142  	map = dma_buf_io_get_map(ctx);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  143  	if (map) {
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  144  		ret = 0;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  145  		goto out;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  146  	}
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  147  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  148  	if (dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_KERNEL,
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  149  				  true, 0) < 0) {
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  150  		dma_resv_unlock(dmabuf->resv);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  151  		goto retry;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  152  	}
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  153  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  154  	map = ctx->dev_ops->map(ctx);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  155  	if (IS_ERR(map)) {
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  156  		ret = PTR_ERR(map);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  157  		goto out;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  158  	}
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  159  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  160  	if (WARN_ON_ONCE(!map->seg_shift))
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  161  		return ERR_PTR(-EFAULT);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  162  
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  163  	percpu_ref_get(&map->refs);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  164  	rcu_assign_pointer(ctx->map, map);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  165  out:
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  166  	dma_resv_unlock(dmabuf->resv);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  167  	if (ret < 0)
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  168  		return ERR_PTR(ret);
ff5dccf71e8c03 Pavel Begunkov 2026-04-19 @169  	return map;
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  170  }
ff5dccf71e8c03 Pavel Begunkov 2026-04-19  171  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
