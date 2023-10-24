Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47982F2F
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Oct 2023 05:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROVAqFmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698126477; x=1729662477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qdcuiILBVmSPV6qRT/1CNIGWi7q9dcqczbgOkI6BZkM=;
  b=ROVAqFmJa5sJOrhgnXH4T12+lccfJTEfMau+6b8VNCH+J9tvvRD8Ppem
   bz4VQirBNqdiUSkGDhWUOYFs4yr555w2AD3to5B26Wf3AJgvr7E3k0NDa
   Jzvp71jzv/z48//m52MjiJuolKp8G4dhGopVTxBvAgmdxTJoioWJfScCD
   5yxohM/zKp0w4kxSHhDbvgCAXgdZNmBxtqYA9xTcK54oZlQpSAq4DXmEO
   vF2ey3395vHOqWhqkahXBZggvPPiOR3c4L7WzG110+vPKmeE0ST8IYDDT
   S5bqhordiFQROQtBSjxkZMA5iTLsDAROfqqOJSrvaT0o2BzCeIBLo3tqH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385886101"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385886101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 22:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="874949750"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="874949750"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2023 22:47:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvAGS-0007c5-0C;
	Tue, 24 Oct 2023 05:47:40 +0000
Date: Tue, 24 Oct 2023 13:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/43]
 kernel/events/core.c:6629:7-10: WARNING: Unsigned expression compared with
 zero: ret     <     0
Message-ID: <202310241300.2N1vx69n-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   e136b1438e7e7838acc6127c3f1a9200356d7248
commit: 028231d5f2c4db12a43a4c54c45622bb547975be [33/43] WIP: perf: support mmapping event on noMMU
:::::: branch date: 5 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-103-20231024 (https://download.01.org/0day-ci/archive/20231024/202310241300.2N1vx69n-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310241300.2N1vx69n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310241300.2N1vx69n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/events/core.c:6629:7-10: WARNING: Unsigned expression compared with zero: ret     <     0

vim +6629 kernel/events/core.c

028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6582  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6583  unsigned long perf_get_unmapped_area(struct file *file,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6584  				     unsigned long addr, unsigned long len,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6585  				     unsigned long pgoff, unsigned long flags)
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6586  {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6587  	unsigned long ret = -EINVAL;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6588  	struct perf_event *event = file->private_data;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6589  	unsigned long nr_pages = len / PAGE_SIZE;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6590  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6591  	pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6592  		 __func__, addr, len, pgoff, flags, event, event->rb);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6593  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6594  	if (!event->rb) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6595  		int flags = RING_BUFFER_WRITABLE;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6596  		struct perf_buffer *rb = NULL;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6597  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6598  		if (pgoff != 0) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6599  			ret = -EINVAL;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6600  			goto unlock;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6601  		}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6602  		--nr_pages;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6603  		rb = rb_alloc(nr_pages,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6604  			      event->attr.watermark ? event->attr.wakeup_watermark : 0,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6605  			      event->cpu, flags);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6606  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6607  		if (!rb) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6608  			ret = -ENOMEM;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6609  			goto unlock;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6610  		}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6611  		atomic_set(&rb->mmap_count, 1);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6612  		rb->mmap_user = get_current_user();
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6613  		rb->mmap_locked = 0;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6614  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6615  		ring_buffer_attach(event, rb);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6616  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6617  		perf_event_update_time(event);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6618  		perf_event_init_userpage(event);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6619  		perf_event_update_userpage(event);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6620  	}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6621  	if (event->rb) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6622  		struct perf_buffer *rb = event->rb;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6623  
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6624  		if (!pgoff) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6625  			ret = (unsigned long)rb->user_page;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6626  		} else {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6627  			ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6628  					   event->attr.aux_watermark, flags);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26 @6629  			if (ret < 0)
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6630  				goto unlock;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6631  			ret = (unsigned long)rb->data_pages[pgoff - 1];
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6632  		}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6633  	}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6634  unlock:
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6635  	pr_debug("%s: ret = 0x%lx\n", __func__, ret);
7b732a75047738 kernel/perf_counter.c Peter Zijlstra 2009-03-23  6636  	return ret;
37d81828385f8f kernel/perf_counter.c Paul Mackerras 2009-03-23  6637  }
37d81828385f8f kernel/perf_counter.c Paul Mackerras 2009-03-23  6638  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
