Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4BFA94F
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752791022; cv=none; b=YemhV9+Imqcf6lSOCeznLwPKI5IPN5mawnpb2uz7Bkk7RiocrFgNNSXESHbgUI8ueVrHx7lioJAXJIf2KSfXyu/HWpnywByqyuuG+xWQeFh+TQ1kkz7vs1nlU1E4uE0L1vvEuxpiYIW8yQftXlMuxis0nMdGognjk00SE87erGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752791022; c=relaxed/simple;
	bh=oS4uWs8fBAJM1cDMFdla4No81TliTbljgtKASb7B9fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=timGVkN2B5McCIQGOXExmzzLOSNXnSyL1fUvugYzi8o88NVWa0vDhpEPrOHLulysp2dd56Yr6MsxNRmJJW7nXZVnjK2PZEqDq/d/D3lWvEdav5H9fr2cAlNDLjflIPHEkWM+VHmGOha1OsgfFmuzHvmlnsQijAIitY79QqR0oio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzBZZC06; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzBZZC06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752791020; x=1784327020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oS4uWs8fBAJM1cDMFdla4No81TliTbljgtKASb7B9fg=;
  b=hzBZZC06WaHiSgJPVAeMklzoKrw2FpwbhGcwlC8uustqZ6R6A/cftQYw
   r9KY7Ygd3XR/TaEaNEJzfCX1yt111dbdPx9rbtrUi3tnrKx39BPa9nFf8
   CAUEJDQXq27/OXAFjYvu6bRtMzJoMMqE71xFOu8kZt22/eXLev6z+Jzgw
   /hLleZvtHeyGzCBOCuNXDnWrntPw8jdUutNn58l6f+0AbIGxfQ0GY/OrO
   BxELr6Dk8BJfO4+eW2xGvvrZaQMJiJzTkkE8i+/TCl1Ls1FV1yULw3VpS
   j8BR1e1aBmRicuArNDlmlCoXNA/KQYJfZSRmubBKHlpvAweyI1m0wBh+D
   w==;
X-CSE-ConnectionGUID: GG1UJk8GTvmOulEhe9zAQA==
X-CSE-MsgGUID: 0ARm9RkHQ5u6tsKGkKwuOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54962789"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="54962789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 15:23:40 -0700
X-CSE-ConnectionGUID: wDp1K8pJRt+tszo406v7FQ==
X-CSE-MsgGUID: IAPLu/4bSZ+dyigGAMM+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162188042"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 15:23:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucX0q-000E49-1w;
	Thu, 17 Jul 2025 22:23:36 +0000
Date: Fri, 18 Jul 2025 06:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10555/10823] io_uring/zcrx.c:385
 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null
 (see line 380)
Message-ID: <202507180628.gBxrOgqr-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 262ab205180d2ba3ab6110899a4dbe439c51dfaa [10555/10823] io_uring/zcrx: account area memory
:::::: branch date: 13 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180628.gBxrOgqr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507180628.gBxrOgqr-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:385 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null (see line 380)

vim +385 io_uring/zcrx.c

6f377873cb2390 David Wei      2025-02-14  377  
cf96310c5f9a0d David Wei      2025-02-14  378  static void io_zcrx_free_area(struct io_zcrx_area *area)
cf96310c5f9a0d David Wei      2025-02-14  379  {
0ec33c81d9c734 Pavel Begunkov 2025-05-27 @380  	if (area->ifq)
db070446f5af8c Pavel Begunkov 2025-02-14  381  		io_zcrx_unmap_area(area->ifq, area);
782dfa329ac9d1 Pavel Begunkov 2025-05-01  382  	io_release_area_mem(&area->mem);
db070446f5af8c Pavel Begunkov 2025-02-14  383  
262ab205180d2b Pavel Begunkov 2025-07-16  384  	if (area->mem.account_pages)
262ab205180d2b Pavel Begunkov 2025-07-16 @385  		io_unaccount_mem(area->ifq->ctx, area->mem.account_pages);
262ab205180d2b Pavel Begunkov 2025-07-16  386  
cf96310c5f9a0d David Wei      2025-02-14  387  	kvfree(area->freelist);
cf96310c5f9a0d David Wei      2025-02-14  388  	kvfree(area->nia.niovs);
34a3e60821ab9f Pavel Begunkov 2025-02-14  389  	kvfree(area->user_refs);
cf96310c5f9a0d David Wei      2025-02-14  390  	kfree(area);
cf96310c5f9a0d David Wei      2025-02-14  391  }
cf96310c5f9a0d David Wei      2025-02-14  392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
