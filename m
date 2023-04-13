Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225162F
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681357535; x=1712893535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+ULMArRTekxWWU0z1ga8FoTicgFkAcAQI/IlvnY5dw=;
  b=MruHWBH84x/Zc8IV5LwpqA0q7xYxa2sPgCmaUan765xu0tIGvE9msIOK
   +uU3ouyQ7WqrkiIPC0uZ8mv6mye4HdgLmB0HwsAqa0kG3B28ZbUjNljlt
   T1ki+1Fjs3ZZxYz4xWpGeLejCCF2pC/0Z5dYJykFlbiwPWNA2HVxZB2qO
   DiUfwoioAjI3mlzCpRkp0ddghJp9+tdRAGwN2rre7/TZxhEg+SxnjExp0
   JZTSf8Oh8SCloIdyDksvUABOdqiDYpqcYQ7QHBIQnvU1cZueO/wRYbkUQ
   vrxICr8YspIPPSzWRxS9lv/IyC+VZhIGIuYe07iuf7++fzm0k/2BSI/xe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="345869186"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="345869186"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 20:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639472329"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="639472329"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Apr 2023 20:45:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmntt-000YK1-0w;
	Thu, 13 Apr 2023 03:45:33 +0000
Date: Thu, 13 Apr 2023 11:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:epoll-min_ts.2 9/10] fs/eventpoll.c:2484
 __do_sys_epoll_pwait3() error: uninitialized symbol 'sigmask_sz'.
Message-ID: <202304131131.jk3EMTyS-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: 343353f60bfa9ffcf17dee8189972f43575bbe5e [9/10] eventpoll: add epoll_pwait3()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230413/202304131131.jk3EMTyS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304131131.jk3EMTyS-lkp@intel.com/

smatch warnings:
fs/eventpoll.c:2484 __do_sys_epoll_pwait3() error: uninitialized symbol 'sigmask_sz'.
fs/eventpoll.c:2484 __do_sys_epoll_pwait3() error: uninitialized symbol 'sigmask_sz'.

vim +/sigmask_sz +2484 fs/eventpoll.c

58169a52ebc9a7 Willem de Bruijn 2020-12-18  2451  
343353f60bfa9f Jens Axboe       2023-04-12  2452  #define EPOLL_PWAIT_FLAGS	(EPOLL_PWAIT_TIMEOUT | EPOLL_PWAIT_SIGMASK | \
343353f60bfa9f Jens Axboe       2023-04-12  2453  				 EPOLL_PWAIT_MINWAIT)
343353f60bfa9f Jens Axboe       2023-04-12  2454  
343353f60bfa9f Jens Axboe       2023-04-12  2455  SYSCALL_DEFINE5(epoll_pwait3, int, epfd, struct epoll_event __user *, events,
343353f60bfa9f Jens Axboe       2023-04-12  2456  		int, maxevents, int, flags,
343353f60bfa9f Jens Axboe       2023-04-12  2457  		struct epoll_pwait_data __user *, data)
343353f60bfa9f Jens Axboe       2023-04-12  2458  {
343353f60bfa9f Jens Axboe       2023-04-12  2459  	struct timespec64 ts, *to = NULL;
343353f60bfa9f Jens Axboe       2023-04-12  2460  	const sigset_t __user *sigmask = NULL;
343353f60bfa9f Jens Axboe       2023-04-12  2461  	unsigned int min_wait_ts = 0;
343353f60bfa9f Jens Axboe       2023-04-12  2462  	size_t sigmask_sz;
343353f60bfa9f Jens Axboe       2023-04-12  2463  
343353f60bfa9f Jens Axboe       2023-04-12  2464  	if (flags & ~EPOLL_PWAIT_FLAGS)
343353f60bfa9f Jens Axboe       2023-04-12  2465  		return -EINVAL;
343353f60bfa9f Jens Axboe       2023-04-12  2466  
343353f60bfa9f Jens Axboe       2023-04-12  2467  	if (flags & EPOLL_PWAIT_TIMEOUT) {
343353f60bfa9f Jens Axboe       2023-04-12  2468  		if (get_timespec64(&ts, &data->timeout))
343353f60bfa9f Jens Axboe       2023-04-12  2469  			return -EFAULT;
343353f60bfa9f Jens Axboe       2023-04-12  2470  		to = &ts;
343353f60bfa9f Jens Axboe       2023-04-12  2471  		if (poll_select_set_timeout(to, ts.tv_sec, ts.tv_nsec))
343353f60bfa9f Jens Axboe       2023-04-12  2472  			return -EINVAL;
343353f60bfa9f Jens Axboe       2023-04-12  2473  	}
343353f60bfa9f Jens Axboe       2023-04-12  2474  	if (flags & EPOLL_PWAIT_SIGMASK) {
343353f60bfa9f Jens Axboe       2023-04-12  2475  		sigmask = &data->sigmask;
343353f60bfa9f Jens Axboe       2023-04-12  2476  		if (get_user(sigmask_sz, &data->sigmask_sz))
343353f60bfa9f Jens Axboe       2023-04-12  2477  			return -EFAULT;
343353f60bfa9f Jens Axboe       2023-04-12  2478  	}
343353f60bfa9f Jens Axboe       2023-04-12  2479  	if (flags & EPOLL_PWAIT_MINWAIT) {
343353f60bfa9f Jens Axboe       2023-04-12  2480  		if (get_user(min_wait_ts, &data->min_wait_ts))
343353f60bfa9f Jens Axboe       2023-04-12  2481  			return -EFAULT;
343353f60bfa9f Jens Axboe       2023-04-12  2482  	}
343353f60bfa9f Jens Axboe       2023-04-12  2483  
343353f60bfa9f Jens Axboe       2023-04-12 @2484  	return do_epoll_pwait(epfd, events, maxevents, to, sigmask, sigmask_sz,
343353f60bfa9f Jens Axboe       2023-04-12  2485  				min_wait_ts);
343353f60bfa9f Jens Axboe       2023-04-12  2486  }
343353f60bfa9f Jens Axboe       2023-04-12  2487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
