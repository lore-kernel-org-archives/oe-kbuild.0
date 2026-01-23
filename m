Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B90139D0A
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158443; cv=none; b=L8V+2YHaUu2AbWA0nc3BhJMzO9w2aP1M/CxSp56lIhs2WgQjjkRbcSkJ3r/wjy/IMayf1qJ9ToixD0oL9Fnag0OuYjfTJSkJNwjbqZPXr49KcLTP//7/zYJTvNGj8uryCXJEiH/C4MOM8fbYliQLw+o7PSAJP5Z+fEdIhQ5EHMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158443; c=relaxed/simple;
	bh=RwfAPS1gy0OVHFa43pTx9Rfvw0PRC8Zlbj+jv91JuRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EUx3pk8wQ/fS/QinlcXqmYwKijISy7HKaafz0bJSnt6d5um1XZNUj5PjRfIlwJBhh7BY3KkwKY13xyeiIUoj8dX5XhnP0W0oiOB0Pe2xA+5Jh3gthPZPr79kVD/IAUlyKc5IYAEh1BXc+MBWbcyjwXWHW1lVSA/BU5rhuGTl9UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fF05UBXe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fF05UBXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769158441; x=1800694441;
  h=date:from:to:cc:subject:message-id;
  bh=RwfAPS1gy0OVHFa43pTx9Rfvw0PRC8Zlbj+jv91JuRc=;
  b=fF05UBXe20azE0xYhHTg9T1HagECT1vl3E5Q1y58cmfz/o5SOISFswwU
   zAjMIz5LetDairF7k4Bs5dCSStr4k//Mb8WYsKJSDpj+B2AToBeM3nvua
   yZrunuIjtLD1e9n80nhfAL/V3TbIK2FPwK+cKzQ0TR20Zo1EQsvKCzfC5
   AaYw0mYt9kXWpMVKeLfnhCLx+z7iiifU/SMzFDwXtdbSEC1oKlSMPMu1P
   VQhg/Cya2rorMPwTxMjv/9n1M3FnjyclwX+RCTU5iLfREOhQ5JtTWvZSC
   ZgoKDl9sWB4TW7pEIVrEdYltauEqtWRzrPuQSyoPa4RbhxfE1SiHVWzfx
   w==;
X-CSE-ConnectionGUID: 8y9ABrSzSSCQEOEiTxaEIg==
X-CSE-MsgGUID: yK/+zzdFQTu/g14CtbxIjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70311343"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70311343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:53:45 -0800
X-CSE-ConnectionGUID: 5BEhsroISuO1A/1A7sru1A==
X-CSE-MsgGUID: /aND4rPzQbSHzR2eWlTTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237622839"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 00:53:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjCvD-00000000Tis-2GYb;
	Fri, 23 Jan 2026 08:53:39 +0000
Date: Fri, 23 Jan 2026 16:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:for-7.0/io_uring 20/21] io_uring/io_uring.c:2741
 io_uring_sanitise_params() warn: if statement not indented
Message-ID: <202601231651.HeTmPS8C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/io_uring
head:   82dadc8a494758093e775336390cb31033c6f9a3
commit: 5247c034a67f5a93cc1faa15e9867eec5b22f38a [20/21] io_uring: introduce non-circular SQ
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: alpha-randconfig-r071-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231651.HeTmPS8C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601231651.HeTmPS8C-lkp@intel.com/

smatch warnings:
io_uring/io_uring.c:2741 io_uring_sanitise_params() warn: if statement not indented

vim +2741 io_uring/io_uring.c

2b188cc1bb857a fs/io_uring.c       Jens Axboe     2019-01-07  2732  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2733  static int io_uring_sanitise_params(struct io_uring_params *p)
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2734  {
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2735  	unsigned flags = p->flags;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2736  
712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2737  	if (flags & ~IORING_SETUP_FLAGS)
712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2738  		return -EINVAL;
712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2739  
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2740  	if (flags & IORING_SETUP_SQ_REWIND) {
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20 @2741  		if ((flags & IORING_SETUP_SQPOLL) ||
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2742  		    !(flags & IORING_SETUP_NO_SQARRAY))
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2743  		return -EINVAL;
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2744  	}
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2745  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2746  	/* There is no way to mmap rings without a real fd */
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2747  	if ((flags & IORING_SETUP_REGISTERED_FD_ONLY) &&
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2748  	    !(flags & IORING_SETUP_NO_MMAP))
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2749  		return -EINVAL;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2750  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2751  	if (flags & IORING_SETUP_SQPOLL) {
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2752  		/* IPI related flags don't make sense with SQPOLL */
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2753  		if (flags & (IORING_SETUP_COOP_TASKRUN |
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2754  			     IORING_SETUP_TASKRUN_FLAG |
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2755  			     IORING_SETUP_DEFER_TASKRUN))
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2756  			return -EINVAL;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2757  	}
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2758  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2759  	if (flags & IORING_SETUP_TASKRUN_FLAG) {
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2760  		if (!(flags & (IORING_SETUP_COOP_TASKRUN |
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2761  			       IORING_SETUP_DEFER_TASKRUN)))
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2762  			return -EINVAL;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2763  	}
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2764  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2765  	/* HYBRID_IOPOLL only valid with IOPOLL */
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2766  	if ((flags & IORING_SETUP_HYBRID_IOPOLL) && !(flags & IORING_SETUP_IOPOLL))
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2767  		return -EINVAL;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2768  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2769  	/*
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2770  	 * For DEFER_TASKRUN we require the completion task to be the same as
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2771  	 * the submission task. This implies that there is only one submitter.
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2772  	 */
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2773  	if ((flags & IORING_SETUP_DEFER_TASKRUN) &&
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2774  	    !(flags & IORING_SETUP_SINGLE_ISSUER))
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2775  		return -EINVAL;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2776  
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2777  	/*
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2778  	 * Nonsensical to ask for CQE32 and mixed CQE support, it's not
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2779  	 * supported to post 16b CQEs on a ring setup with CQE32.
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2780  	 */
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2781  	if ((flags & (IORING_SETUP_CQE32|IORING_SETUP_CQE_MIXED)) ==
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2782  	    (IORING_SETUP_CQE32|IORING_SETUP_CQE_MIXED))
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2783  		return -EINVAL;
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2784  	/*
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2785  	 * Nonsensical to ask for SQE128 and mixed SQE support, it's not
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2786  	 * supported to post 64b SQEs on a ring setup with SQE128.
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2787  	 */
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2788  	if ((flags & (IORING_SETUP_SQE128|IORING_SETUP_SQE_MIXED)) ==
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2789  	    (IORING_SETUP_SQE128|IORING_SETUP_SQE_MIXED))
1cba30bf9fdd6c io_uring/io_uring.c Keith Busch    2025-10-16  2790  		return -EINVAL;
e26dca67fde194 io_uring/io_uring.c Jens Axboe     2025-08-07  2791  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2792  	return 0;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2793  }
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2794  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
