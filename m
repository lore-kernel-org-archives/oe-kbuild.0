Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777553A5
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 03:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695611356; x=1727147356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9H4abOG5LJd0WpcdOWhEf4u2fKAU0zBNBSUCMyHjN0U=;
  b=kav/q2tgl6r9MBMMN279Nk+80dQdRsCsrjhdz6hABoYLkKtUWngOI9Sw
   eqLUUu/hf0sUaLv6HBR+KUxY5hypTNmbEthCFJ1RzEAFJhuHXwFx6vNLB
   YJfd6NZpckNYWFZ2YvP19AbCe7l4QYl2Rk18w4GOVPZHs14OvVzJ4smjz
   DrTbtqy9n5FOB0n1Fv8gGJM6zudtiAuKDcFE1DKa5EQ0EZChJ+VU/FInQ
   i3bCQN4dLVntYP1n7HBc/DMHOoGPGpErpTt0zWnflJo0YSrrJYPHS0K9O
   MoAA/C/RLIk+hlFWsuQ3DpiBDk+rFabncX/JHHaZCDESb3sSiHv+ebgKP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467440688"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="467440688"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 20:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863703306"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="863703306"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2023 20:09:14 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkbyC-00017h-1X;
	Mon, 25 Sep 2023 03:09:12 +0000
Date: Mon, 25 Sep 2023 11:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards2 18/38] kernel/events/core.c:5493
 perf_read_group() warn: inconsistent returns 'scope'.
Message-ID: <202309251025.2VTWIM8V-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   d131dfd46333faf6f8bafdc688402f8e1847b4c6
commit: 40986e7b9f54e0eae23e7680fb85b86f6914b508 [18/38] perf: Simplify perf_read_group()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230925/202309251025.2VTWIM8V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309251025.2VTWIM8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309251025.2VTWIM8V-lkp@intel.com/

smatch warnings:
kernel/events/core.c:5493 perf_read_group() warn: inconsistent returns 'scope'.

vim +/scope +5493 kernel/events/core.c

3dab77fb1bf896 kernel/perf_counter.c Peter Zijlstra      2009-08-13  5457  
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5458  static int perf_read_group(struct perf_event *event,
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5459  				   u64 read_format, char __user *buf)
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5460  {
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5461  	struct perf_event *leader = event->group_leader, *child;
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5462  	struct perf_event_context *ctx = leader->ctx;
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5463  	int ret;
3dab77fb1bf896 kernel/perf_counter.c Peter Zijlstra      2009-08-13  5464  
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5465  	lockdep_assert_held(&ctx->mutex);
3dab77fb1bf896 kernel/perf_counter.c Peter Zijlstra      2009-08-13  5466  
40986e7b9f54e0 kernel/events/core.c  Peter Zijlstra      2023-06-09  5467  	u64 *values __free(kfree) = kzalloc(event->read_size, GFP_KERNEL);
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5468  	if (!values)
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5469  		return -ENOMEM;
abf4868b8548ca kernel/perf_event.c   Peter Zijlstra      2009-11-20  5470  
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5471  	values[0] = 1 + leader->nr_siblings;
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5472  
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5473  	/*
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5474  	 * By locking the child_mutex of the leader we effectively
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5475  	 * lock the child list of all siblings.. XXX explain how.
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5476  	 */
40986e7b9f54e0 kernel/events/core.c  Peter Zijlstra      2023-06-09  5477  	scoped_guard (mutex, &leader->child_mutex) {
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5478  		ret = __perf_read_group_add(leader, read_format, values);
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5479  		if (ret)
40986e7b9f54e0 kernel/events/core.c  Peter Zijlstra      2023-06-09  5480  			return ret;
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5481  
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5482  		list_for_each_entry(child, &leader->child_list, child_list) {
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5483  			ret = __perf_read_group_add(child, read_format, values);
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5484  			if (ret)
40986e7b9f54e0 kernel/events/core.c  Peter Zijlstra      2023-06-09  5485  				return ret;
40986e7b9f54e0 kernel/events/core.c  Peter Zijlstra      2023-06-09  5486  		}
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5487  	}
abf4868b8548ca kernel/perf_event.c   Peter Zijlstra      2009-11-20  5488  
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  5489  	ret = event->read_size;
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5490  	if (copy_to_user(buf, values, event->read_size))
40986e7b9f54e0 kernel/events/core.c  Peter Zijlstra      2023-06-09  5491  		return -EFAULT;
fa8c269353d560 kernel/events/core.c  Peter Zijlstra      2015-09-03  5492  
abf4868b8548ca kernel/perf_event.c   Peter Zijlstra      2009-11-20 @5493  	return ret;
3dab77fb1bf896 kernel/perf_counter.c Peter Zijlstra      2009-08-13  5494  }
3dab77fb1bf896 kernel/perf_counter.c Peter Zijlstra      2009-08-13  5495  

:::::: The code at line 5493 was first introduced by commit
:::::: abf4868b8548cae18d4fe8bbfb4e207443be01be perf: Fix PERF_FORMAT_GROUP scale info

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
