Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BA332ED7
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672050; cv=none; b=T01eGXodEtGdpXqdOfl+qcOkKmCgWC3iEPwIlbYf2tT/5laQHpchVUN8O00IGNQjctuCTmbW5dE4C7aM+/iuo2r+y3LUWKr97abTPEmgQMfm4qukYn9gYD8XJhYM3pbh8L+phluhoDgb0bSGCYPabrWPHZRY9XBmu6lZ0M3oa7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672050; c=relaxed/simple;
	bh=twduWm7lFnh2ALmq0zCyVYY4XU3bs8lXP8FcSOn+HWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBY9i7vLoBQMGkejTF1OYdY4wEyR5gLYxl3bp9SWqTLb/Xi1SXhrn2gJcZ7+v7Jztg2nKuXWTjl0pNORGoezgTGTRJRM0YUqgFuzE+wlSBpqLHEuYm1u/oEYKySs61T16pqXzop0E6oD/jUsz4WKZ1gbegsk3K68wmz7hbFlqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHU5KRDE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHU5KRDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761672045; x=1793208045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twduWm7lFnh2ALmq0zCyVYY4XU3bs8lXP8FcSOn+HWQ=;
  b=oHU5KRDEPH99KWSov9PIDNCUtf9ydqV39RB2U+QsyfhF/Ho5uKlidc0x
   bTAv3G0rsS14nnZHX542HwoY6fAV++BAMsFNxnWHBxoy78ZnpL+zPqZ5j
   4U8XTZvSA7e+zdz9+GELETSSWAw1/ozbSjXvoCg+TFWaGLRT1cuY3DFcy
   VJMY0iGw6RkM/AQMNkf++UNLsxI/6TrmWc2H3Fxtd7Ai2obPDLOrcpWDE
   AxzMQIyibYYu+izHdIK+zC5hRFweFSMn+u/+Q63F/5uiQmkaXSZpQIjNN
   qeXRJUCc3B3Zp2y6hV3FgiKjlUMkAJEB4bIYWX10yYOlxYvNo64Y1Q2nA
   A==;
X-CSE-ConnectionGUID: aFC2m2b1QVauP1GOgPQKSQ==
X-CSE-MsgGUID: bV5ag1iUTZKksyg+EMDapg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89251305"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="89251305"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:20:44 -0700
X-CSE-ConnectionGUID: xPWImGWJQNKyQpFPloc4hw==
X-CSE-MsgGUID: FWcxiA9VQ02DeJAHX84v4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189462105"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Oct 2025 10:20:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDnMw-000JVt-0Y;
	Tue, 28 Oct 2025 17:20:29 +0000
Date: Wed, 29 Oct 2025 01:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv2 1/4] block: unify elevator tags and type xarrays into
 struct elv_change_ctx
Message-ID: <202510290135.2a5KxEPi-lkp@intel.com>
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
In-Reply-To: <20251027173631.1081005-2-nilay@linux.ibm.com>
References: <20251027173631.1081005-2-nilay@linux.ibm.com>
TO: Nilay Shroff <nilay@linux.ibm.com>
TO: linux-block@vger.kernel.org
CC: ming.lei@redhat.com
CC: hch@lst.de
CC: yukuai1@huaweicloud.com
CC: axboe@kernel.dk
CC: yi.zhang@redhat.com
CC: czhong@redhat.com
CC: gjoyce@ibm.com

Hi Nilay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.18-rc3 next-20251028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/block-unify-elevator-tags-and-type-xarrays-into-struct-elv_change_ctx/20251028-014047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20251027173631.1081005-2-nilay%40linux.ibm.com
patch subject: [PATCHv2 1/4] block: unify elevator tags and type xarrays into struct elv_change_ctx
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: nios2-randconfig-r072-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290135.2a5KxEPi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510290135.2a5KxEPi-lkp@intel.com/

New smatch warnings:
block/blk-mq-sched.c:461 blk_mq_free_sched_ctx_batch() warn: iterator 'i' not incremented

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
block/blk-mq-sched.c:383 blk_mq_sched_tags_teardown() warn: iterator 'i' not incremented
block/blk-mq-sched.c:397 blk_mq_sched_reg_debugfs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:408 blk_mq_sched_unreg_debugfs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:614 blk_mq_init_sched() warn: iterator 'i' not incremented
block/blk-mq-sched.c:646 blk_mq_sched_free_rqs() warn: iterator 'i' not incremented
block/blk-mq-sched.c:660 blk_mq_exit_sched() warn: iterator 'i' not incremented

vim +/i +461 block/blk-mq-sched.c

04225d13aef11b2 Nilay Shroff 2025-07-30  455  
4a0bfffacbac488 Nilay Shroff 2025-10-27  456  void blk_mq_free_sched_ctx_batch(struct xarray *elv_tbl)
4a0bfffacbac488 Nilay Shroff 2025-10-27  457  {
4a0bfffacbac488 Nilay Shroff 2025-10-27  458  	unsigned long i;
4a0bfffacbac488 Nilay Shroff 2025-10-27  459  	struct elv_change_ctx *ctx;
4a0bfffacbac488 Nilay Shroff 2025-10-27  460  
4a0bfffacbac488 Nilay Shroff 2025-10-27 @461  	xa_for_each(elv_tbl, i, ctx) {
4a0bfffacbac488 Nilay Shroff 2025-10-27  462  		xa_erase(elv_tbl, i);
4a0bfffacbac488 Nilay Shroff 2025-10-27  463  		kfree(ctx);
4a0bfffacbac488 Nilay Shroff 2025-10-27  464  	}
4a0bfffacbac488 Nilay Shroff 2025-10-27  465  }
4a0bfffacbac488 Nilay Shroff 2025-10-27  466  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
