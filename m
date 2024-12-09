Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9F4156649
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717351; cv=none; b=KuHzIrnA9YAhno3i5J7+ncrwTnaYy8ZXTgYaLENCPohPpvSFGPVs8Clcgr+561RNsVnMfFITaXVjncKvWwbpFPn/6OBJSG/2UdAVzMNoTMMCtYZlqZ9Pm+CH+jYzqdKNIQECpRFiYWOXuM7Q+4EdJ6GhvKGGpmmtfcfBo88K8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717351; c=relaxed/simple;
	bh=g1z5fbEYaDf1zL45uS3OKfdbRNj+zzntjfU6BZuhuac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tn8YdsomCdEx+a6KHe3RTL2EB0oLDkr/CNBe+lgTokQWTwyDv+HgUIErHT11iqdj1tuRgMR+x+lUEa7R3MBkwf8/nJ6udqzgh2a2SyAYkPTxHib0NG+PlNg68PiMd+Gkv/WDAKaTJ0Wpk4oJF8y9QkSvE8gmnXmvZstiH2/PIbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijoM07VO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijoM07VO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717350; x=1765253350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1z5fbEYaDf1zL45uS3OKfdbRNj+zzntjfU6BZuhuac=;
  b=ijoM07VOGTw3ho+jRjJwMMZWXE1fXjE+c1zD1amFrBIM9EejePIq8nmQ
   bMv46fSWo63Qvjl/qG2llXJyvvUZeMdzDjDaD6h0cPOlrQWj/Suv3LgJi
   WazvaWyjvCcxwcLdqj21fYLguiVXRiP+viF0Ytqx+sbqO0CwOCQLInL4T
   063YWFHmn0m4MAW2oU0W+ZUXmpN7tYP/ehZqXR2T9xM2swHHCGXfMcOK/
   X78qr9wLRv0dHtU0bpy/1L+mHs0S91/oV6ugmi04nyJAkIgtRWfL9gk3u
   p6HtvT975v9AMqYz56Ur9lsENIQXRoR+yXx1Ruhm0YgTpuVKybLQRYemo
   Q==;
X-CSE-ConnectionGUID: F7hvGsr1QgWpWjFbrebJ3g==
X-CSE-MsgGUID: jMZi/al6R52YdUVNgzOpsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36841933"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="36841933"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:09:08 -0800
X-CSE-ConnectionGUID: hiYAVmcCQyyONs5ozGnHMA==
X-CSE-MsgGUID: gkzTX31VQGGVimRYkHWySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95044966"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:09:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV4x-0003nJ-1q;
	Mon, 09 Dec 2024 04:09:03 +0000
Date: Mon, 9 Dec 2024 12:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] blk-mq: move cpuhp callback registering out of
 q->sysfs_lock
Message-ID: <202412071359.mkWrdtQW-lkp@intel.com>
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
In-Reply-To: <20241206082202.949142-5-ming.lei@redhat.com>
References: <20241206082202.949142-5-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>

Hi Ming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/blk-mq-register-cpuhp-callback-after-hctx-is-added-to-xarray-table/20241206-202805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241206082202.949142-5-ming.lei%40redhat.com
patch subject: [PATCH 2/2] blk-mq: move cpuhp callback registering out of q->sysfs_lock
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071359.mkWrdtQW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071359.mkWrdtQW-lkp@intel.com/

New smatch warnings:
block/blk-mq.c:3827 blk_mq_add_hw_queues_cpuhp() warn: iterator 'i' not incremented

Old smatch warnings:
block/blk-mq.c:377 blk_mq_wake_waiters() warn: iterator 'i' not incremented
block/blk-mq.c:1753 blk_mq_timeout_work() warn: iterator 'i' not incremented
block/blk-mq.c:2395 blk_mq_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2423 blk_mq_delay_run_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2477 blk_mq_stop_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2495 blk_mq_start_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:2521 blk_mq_start_stopped_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:3893 blk_mq_exit_hw_queues() warn: iterator 'i' not incremented
block/blk-mq.c:4206 queue_set_hctx_shared() warn: iterator 'i' not incremented
block/blk-mq.c:4306 blk_mq_release() warn: iterator 'i' not incremented
block/blk-mq.c:4868 blk_mq_update_nr_requests() warn: iterator 'i' not incremented
block/blk-mq.c:5136 blk_mq_cancel_work_sync() warn: iterator 'i' not incremented

vim +/i +3827 block/blk-mq.c

1d0f1a09dafe9b Ming Lei   2024-12-06  3815  
1d0f1a09dafe9b Ming Lei   2024-12-06  3816  /*
1d0f1a09dafe9b Ming Lei   2024-12-06  3817   * Register cpuhp callbacks from all hw queues
1d0f1a09dafe9b Ming Lei   2024-12-06  3818   *
1d0f1a09dafe9b Ming Lei   2024-12-06  3819   * Safe to call if this `request_queue` is live
1d0f1a09dafe9b Ming Lei   2024-12-06  3820   */
1d0f1a09dafe9b Ming Lei   2024-12-06  3821  static void blk_mq_add_hw_queues_cpuhp(struct request_queue *q)
1d0f1a09dafe9b Ming Lei   2024-12-06  3822  {
1d0f1a09dafe9b Ming Lei   2024-12-06  3823  	struct blk_mq_hw_ctx *hctx;
1d0f1a09dafe9b Ming Lei   2024-12-06  3824  	unsigned long i;
1d0f1a09dafe9b Ming Lei   2024-12-06  3825  
1d0f1a09dafe9b Ming Lei   2024-12-06  3826  	mutex_lock(&blk_mq_cpuhp_lock);
1d0f1a09dafe9b Ming Lei   2024-12-06 @3827  	queue_for_each_hw_ctx(q, hctx, i)
1d0f1a09dafe9b Ming Lei   2024-12-06  3828  		__blk_mq_add_cpuhp(hctx);
1d0f1a09dafe9b Ming Lei   2024-12-06  3829  	mutex_unlock(&blk_mq_cpuhp_lock);
484b4061e6683e Jens Axboe 2014-05-21  3830  }
484b4061e6683e Jens Axboe 2014-05-21  3831  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
