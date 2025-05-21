Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBF22ACFB
	for <oe-kbuild@lists.linux.dev>; Wed, 21 May 2025 03:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747798514; cv=none; b=NTWC6QGS7LoNBXloxccDIbrvmsil+F3Y2xrEJ+gFLo1hX5WSMPujtmxuB2PNBSn84FKvbMmbcX50WNh57Gg2RFiACjid2q2ZI4P0BOgQMby01Len5fCqhfE8xshSKs6gu4r8T6Ni29Mj/Ecf5QA8ctagugWwofsRc9ZYiMMRXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747798514; c=relaxed/simple;
	bh=402F17lJpuu3rZxSa1BK2kFxiD1DAiw79RJQlPBYkmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xy7c8TguO9Xmljde8JmYfDzj3BbDgYaJxl4Vmq2rB9V1/621yL9K/GoFJX4U3XqlFGoPmGkZLU2MLv6hek1HunTzKlstM86d2LBu7Iu9vN1YazxXlTSfg3ARCkNWeRcnSLcEvclooUperrVGj5pX0HbrDOBqfqPBsec1A/Vh3+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7IMzdVW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7IMzdVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747798511; x=1779334511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=402F17lJpuu3rZxSa1BK2kFxiD1DAiw79RJQlPBYkmk=;
  b=X7IMzdVWMdsjGEYZz0IPAklVep9Bc0Nry8qTd/K46+obNVdYYSnjv5mH
   g2+5GA9icd29nH4Q/LZxB0uBzW4eMzeopHNZ7AE0IFMC9HrTj/zkussa9
   rUx3Yf1LNqlCBJCRiRVH7Si5FuG8tDQPcUGgRaLv53Dx+8hHF6n3678Y8
   iVuUfiwaYyn3i792Bl2c9Q32WcNt3/alzfTlg2FbtKgd2b7Mhj+K+NXd9
   DZZnYh/tYfuNImfWlKmnVVRYqDhEEd+P/GTJxguZpT4ztXgDLZXZ5dD9P
   X56WFLaa0A4FU5UtLVn7Ex+hge/b+tzACXf4W8gh8LuAFpr+K2pIdI3sK
   w==;
X-CSE-ConnectionGUID: WjWUe/jlTby0ikmGPKYBow==
X-CSE-MsgGUID: 7F++zX7YTYKmh5l3un3kug==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60796176"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60796176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:35:11 -0700
X-CSE-ConnectionGUID: CPip1pgtTUOC/dONUHH6MQ==
X-CSE-MsgGUID: aVuLHw4tQ8uquIhvRI8KQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="163168062"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2025 20:35:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHaEV-000Npk-1m;
	Wed, 21 May 2025 03:35:07 +0000
Date: Wed, 21 May 2025 11:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] block: fix lock dependency between percpu alloc lock and
 elevator lock
Message-ID: <202505211110.xlMp4URV-lkp@intel.com>
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
In-Reply-To: <20250520103425.1259712-1-nilay@linux.ibm.com>
References: <20250520103425.1259712-1-nilay@linux.ibm.com>
TO: Nilay Shroff <nilay@linux.ibm.com>
TO: linux-block@vger.kernel.org
CC: ming.lei@redhat.com
CC: hch@lst.de
CC: axboe@kernel.dk
CC: sth@linux.ibm.com
CC: gjoyce@ibm.com

Hi Nilay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20250516]
[cannot apply to linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/block-fix-lock-dependency-between-percpu-alloc-lock-and-elevator-lock/20250520-183641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250520103425.1259712-1-nilay%40linux.ibm.com
patch subject: [PATCH] block: fix lock dependency between percpu alloc lock and elevator lock
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: powerpc64-randconfig-r072-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211110.xlMp4URV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505211110.xlMp4URV-lkp@intel.com/

New smatch warnings:
block/blk-mq-sched.c:406 blk_mq_sched_tags_release() warn: iterator 'i' not incremented
block/blk-mq-sched.c:611 blk_mq_sched_copy_tags() warn: iterator 'i' not incremented

Old smatch warnings:
block/blk-mq-sched.c:434 blk_mq_sched_reg_debugfs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:445 blk_mq_sched_unreg_debugfs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:572 blk_mq_init_sched() warn: iterator 'i' not incremented
block/blk-mq-sched.c:621 blk_mq_exit_sched() warn: iterator 'i' not incremented

vim +/i +406 block/blk-mq-sched.c

bd166ef183c263 Jens Axboe   2017-01-17  395  
cc96aa538d1d8f Nilay Shroff 2025-05-20  396  /*
cc96aa538d1d8f Nilay Shroff 2025-05-20  397   * Called in queue's release handler, tagset has gone away. Sched tags
cc96aa538d1d8f Nilay Shroff 2025-05-20  398   * are freed later when we finish switching the elevator and release
cc96aa538d1d8f Nilay Shroff 2025-05-20  399   * the ->elevator_lock and ->frezze_lock.
cc96aa538d1d8f Nilay Shroff 2025-05-20  400   */
cc96aa538d1d8f Nilay Shroff 2025-05-20  401  static void blk_mq_sched_tags_release(struct request_queue *q, unsigned int flags)
bd166ef183c263 Jens Axboe   2017-01-17  402  {
bd166ef183c263 Jens Axboe   2017-01-17  403  	struct blk_mq_hw_ctx *hctx;
4f481208749a22 Ming Lei     2022-03-08  404  	unsigned long i;
bd166ef183c263 Jens Axboe   2017-01-17  405  
cc96aa538d1d8f Nilay Shroff 2025-05-20 @406  	queue_for_each_hw_ctx(q, hctx, i)
c3e2219216c929 Ming Lei     2019-06-04  407  		hctx->sched_tags = NULL;
e155b0c238b20f John Garry   2021-10-05  408  
079a2e3e862548 John Garry   2021-10-05  409  	if (blk_mq_is_shared_tags(flags))
cc96aa538d1d8f Nilay Shroff 2025-05-20  410  		q->sched_shared_tags = NULL;
bd166ef183c263 Jens Axboe   2017-01-17  411  }
cc96aa538d1d8f Nilay Shroff 2025-05-20  412  static int blk_mq_init_sched_shared_tags(struct request_queue *queue,
cc96aa538d1d8f Nilay Shroff 2025-05-20  413  		struct elv_data *elv)
d97e594c51660b John Garry   2021-05-13  414  {
d97e594c51660b John Garry   2021-05-13  415  	/*
cc96aa538d1d8f Nilay Shroff 2025-05-20  416  	 * We allocated the sched shared tags before initiating the elevator
cc96aa538d1d8f Nilay Shroff 2025-05-20  417  	 * switch, prior to acquiring ->elevator_lock and ->freeze_lock, and
cc96aa538d1d8f Nilay Shroff 2025-05-20  418  	 * stored them in the elevator context. So assign those pre-allocated
cc96aa538d1d8f Nilay Shroff 2025-05-20  419  	 * tags now.
d97e594c51660b John Garry   2021-05-13  420  	 */
cc96aa538d1d8f Nilay Shroff 2025-05-20  421  	queue->sched_shared_tags = elv->shared_tags;
079a2e3e862548 John Garry   2021-10-05  422  	blk_mq_tag_update_sched_shared_tags(queue);
d97e594c51660b John Garry   2021-05-13  423  
d97e594c51660b John Garry   2021-05-13  424  	return 0;
d97e594c51660b John Garry   2021-05-13  425  }
d97e594c51660b John Garry   2021-05-13  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
