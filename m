Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A7029ACE5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992352; cv=none; b=V0VRWBAnLUrhiafgKrLKOMLsBDsYp2DPBLVXytrBW7d4WqCTmvuOAZOqhAtYJhSgmUMpZGx/q9P1u1BZvu1LNPslS/oziXO9LJStaVNDiUETMA+1uMSKDwqA8QTyYNcK5sTyZRJdBcu+APogJCj51dBJX4zvdn1UkSqRYUryOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992352; c=relaxed/simple;
	bh=gdjkouX/PXo4SM/52MBZT5x3+6XwoNoYtwK4Hu3NTXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhxzZovgnKcEr+VFLnszP1AnxINHLcYdwpoZyn0ye9kyV1QAgPdEo29Db8wwnE3RRyjwAsPm3aR7xtSJGZmTSOBlY2Ddl7ldqKBJNdFO/QsoFHHtGueQgV3tOG/oBDo5jFiioRjSj07aM9Y+Pb2biNBznGESZY34SEIkk4v/x2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl7VvTtu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl7VvTtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760992350; x=1792528350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdjkouX/PXo4SM/52MBZT5x3+6XwoNoYtwK4Hu3NTXo=;
  b=Zl7VvTtuBGGvPdVR2Tandmbl52Tiuaf9oaoX85v2pcal786LKsIuVDQI
   K//X43Flz2ITuAftszk9aK9yIrE07QEJ2FHPI/5om6oDuktD9rMx53Lt9
   yy7aWL3AaPKeA9E+jVeycG0JeFw6wJyd4I418DHYn31hIFyl+3r4ynL9K
   5NSmBsaRyHvX7MRYPKkeE3b5dz8qxkfIItzVl01Ge5zUhketl6YADJPjx
   Eb22qTe2IpdOSHv4BWyX/Z8nSDRRqTGs7qR8cNmxYEO8IVM1T+d5cOvpQ
   /ECg7xqf7mhvR58XRdzQJAIlurWie8iZu6naABirbqn4aq3uBeRWItAy1
   A==;
X-CSE-ConnectionGUID: PEg5YEoTRyK5Ei6LR3aoxA==
X-CSE-MsgGUID: SyXsSjVpRSK2gFWFGz87JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63012978"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63012978"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:32:30 -0700
X-CSE-ConnectionGUID: NcAX23uxSmebdSIuzGZyaA==
X-CSE-MsgGUID: IQc5mOAfSxaxGtG0KExatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="214382434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2025 13:32:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAwYN-000A9K-0K;
	Mon, 20 Oct 2025 20:32:27 +0000
Date: Tue, 21 Oct 2025 04:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: io_uring/io_uring.c:3243:60: sparse: signed value source
Message-ID: <202510210402.YKS6g2Lb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/io_uring.c:3243:60: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>
CC: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   211ddde0823f1442e4ad052a2f30f050145ccada
commit: 371b47da25e1f7a1a6323f84c776bd9fa079a490 io_uring: change io_get_ext_arg() to use uaccess begin + end
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: um-randconfig-r133-20251020 (https://download.01.org/0day-ci/archive/20251021/202510210402.YKS6g2Lb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210402.YKS6g2Lb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210402.YKS6g2Lb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:182:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:602:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:604:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:44:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> io_uring/io_uring.c:3243:60: sparse: signed value source

vim +3243 io_uring/io_uring.c

f81440d33cc61b fs/io_uring.c       Pavel Begunkov 2022-03-22  3239  
f42b58e44802b0 io_uring/io_uring.c Jens Axboe     2024-08-15  3240  static int io_get_ext_arg(unsigned flags, const void __user *argp,
f42b58e44802b0 io_uring/io_uring.c Jens Axboe     2024-08-15  3241  			  struct ext_arg *ext_arg)
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3242  {
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22 @3243  	const struct io_uring_getevents_arg __user *uarg = argp;
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3244  	struct io_uring_getevents_arg arg;
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3245  
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3246  	/*
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3247  	 * If EXT_ARG isn't set, then we have no timespec and the argp pointer
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3248  	 * is just a pointer to the sigset_t.
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3249  	 */
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3250  	if (!(flags & IORING_ENTER_EXT_ARG)) {
f42b58e44802b0 io_uring/io_uring.c Jens Axboe     2024-08-15  3251  		ext_arg->sig = (const sigset_t __user *) argp;
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3252  		return 0;
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3253  	}
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3254  
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3255  	/*
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3256  	 * EXT_ARG is set - ensure we agree on the size of it and copy in our
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3257  	 * timespec and sigset_t pointers if good.
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3258  	 */
f42b58e44802b0 io_uring/io_uring.c Jens Axboe     2024-08-15  3259  	if (ext_arg->argsz != sizeof(arg))
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3260  		return -EINVAL;
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3261  #ifdef CONFIG_64BIT
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3262  	if (!user_access_begin(uarg, sizeof(*uarg)))
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3263  		return -EFAULT;
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3264  	unsafe_get_user(arg.sigmask, &uarg->sigmask, uaccess_end);
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3265  	unsafe_get_user(arg.sigmask_sz, &uarg->sigmask_sz, uaccess_end);
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3266  	unsafe_get_user(arg.min_wait_usec, &uarg->min_wait_usec, uaccess_end);
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3267  	unsafe_get_user(arg.ts, &uarg->ts, uaccess_end);
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3268  	user_access_end();
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3269  #else
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3270  	if (copy_from_user(&arg, uarg, sizeof(arg)))
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3271  		return -EFAULT;
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3272  #endif
7ed9e09e2d13d5 io_uring/io_uring.c Jens Axboe     2024-01-04  3273  	ext_arg->min_time = arg.min_wait_usec * NSEC_PER_USEC;
f42b58e44802b0 io_uring/io_uring.c Jens Axboe     2024-08-15  3274  	ext_arg->sig = u64_to_user_ptr(arg.sigmask);
f42b58e44802b0 io_uring/io_uring.c Jens Axboe     2024-08-15  3275  	ext_arg->argsz = arg.sigmask_sz;
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe     2024-10-22  3276  	if (arg.ts) {
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe     2024-10-22  3277  		if (get_timespec64(&ext_arg->ts, u64_to_user_ptr(arg.ts)))
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe     2024-10-22  3278  			return -EFAULT;
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe     2024-10-22  3279  		ext_arg->ts_set = true;
0a54a7dd0a12b7 io_uring/io_uring.c Jens Axboe     2024-10-22  3280  	}
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3281  	return 0;
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3282  #ifdef CONFIG_64BIT
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3283  uaccess_end:
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3284  	user_access_end();
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3285  	return -EFAULT;
371b47da25e1f7 io_uring/io_uring.c Jens Axboe     2024-10-22  3286  #endif
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3287  }
c73ebb685fb6df fs/io_uring.c       Hao Xu         2020-11-03  3288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
