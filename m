Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03115C0
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 00:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726359272; cv=none; b=hQlaq/PffQNLQ4uO7q6Dxq9+b3gr9FGf/6B8zcRP/PUDctceosUPhSrY/1EXVnKNvsmflkM3P9CgyatU3Y7eqrDgefvqqxzTVqNfuIWLOrgN+p3hbgJDzmjAixph4eD7LqxoogSicdOwxdq5VRiUPY75rus/Rc9+W1cAtEDzcdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726359272; c=relaxed/simple;
	bh=A/HrfY3sgY0KqAZ4bp0WWGng2+6qwPwQ3ghnjUco6JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwDBOgCFT4q6P/NmkpdnPtprprfdE0IyVDm7Xv4F3dq2X4xT+HTY1h83qL6BKkmffziGtFa51tnxXzHD1bLwsXSHHM7p1rn/3YXG9q1eYFfA8q/QZE/Edw1ETFolrvSlowrLhDGuJGMOIP9P2mKdXDhDkhw6EjXLnBz8ieoFRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDe9H7W9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDe9H7W9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726359271; x=1757895271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/HrfY3sgY0KqAZ4bp0WWGng2+6qwPwQ3ghnjUco6JI=;
  b=KDe9H7W90e7GB2/NRMmP8Gvnnk8lrYKyuUGUr9bVgq6YLriiH1LP3yzh
   KX/ScH5qS0CjliwRIWxfZlKSC1wGwT7VJGzjOxzOSyF3SDDkOR4QKkE93
   WcuSbw7NFrkbdfS8ojKMNCI32xp4gvm1Oc8fZV3hfZSCQ7BbhPfwzCcdA
   EdHwDBdlNvLBu4Fkjz6FmneTmTaeqExKflNsMZGlXC4SV/EBdtWzeonYW
   yjDBnxZ9mYaFZmPFUKaJ4VeTfLkEnn2H3T05PkVdj0bhmDdi4t/izdu8/
   Vc1w75n0b/F4QYZ1XEOTpR4BHuA9Nek2HBPVAe/CaOiXsx82K6Mq4D9Se
   A==;
X-CSE-ConnectionGUID: mGpWg/2AQsGVtqzaiD6f6Q==
X-CSE-MsgGUID: dlu/2MiYR5Cd1zwTaW3V6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36611766"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="36611766"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 17:14:28 -0700
X-CSE-ConnectionGUID: BVGIF6ddQWima4lLS2Gqvw==
X-CSE-MsgGUID: K6cAo2a5QmijGxwpbXGIXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73330228"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Sep 2024 17:14:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spcuD-0008Gq-32;
	Sun, 15 Sep 2024 00:14:21 +0000
Date: Sun, 15 Sep 2024 08:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 02/11] unwind/x86: Add HAVE_USER_UNWIND
Message-ID: <202409150812.Pg1WBJPn-lkp@intel.com>
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
In-Reply-To: <82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe@kernel.org>
References: <82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 02/11] unwind/x86: Add HAVE_USER_UNWIND
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150812.Pg1WBJPn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409150812.Pg1WBJPn-lkp@intel.com/

smatch warnings:
kernel/unwind/user.c:45 user_unwind_next() error: uninitialized symbol 'ra'.

vim +/ra +45 kernel/unwind/user.c

c970b852d500d4 Josh Poimboeuf 2024-09-14  17  
c970b852d500d4 Josh Poimboeuf 2024-09-14  18  int user_unwind_next(struct user_unwind_state *state)
c970b852d500d4 Josh Poimboeuf 2024-09-14  19  {
c970b852d500d4 Josh Poimboeuf 2024-09-14  20  	struct user_unwind_frame _frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  21  	struct user_unwind_frame *frame = &_frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  22  	unsigned long cfa, fp, ra;
c970b852d500d4 Josh Poimboeuf 2024-09-14  23  	int ret = -EINVAL;
c970b852d500d4 Josh Poimboeuf 2024-09-14  24  
c970b852d500d4 Josh Poimboeuf 2024-09-14  25  	if (state->done)
c970b852d500d4 Josh Poimboeuf 2024-09-14  26  		return -EINVAL;
c970b852d500d4 Josh Poimboeuf 2024-09-14  27  
c970b852d500d4 Josh Poimboeuf 2024-09-14  28  	switch (state->type) {
c970b852d500d4 Josh Poimboeuf 2024-09-14  29  	case USER_UNWIND_TYPE_FP:
c970b852d500d4 Josh Poimboeuf 2024-09-14  30  		frame = &fp_frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  31  		break;
c970b852d500d4 Josh Poimboeuf 2024-09-14  32  	default:
c970b852d500d4 Josh Poimboeuf 2024-09-14  33  		BUG();
c970b852d500d4 Josh Poimboeuf 2024-09-14  34  	}
c970b852d500d4 Josh Poimboeuf 2024-09-14  35  
c970b852d500d4 Josh Poimboeuf 2024-09-14  36  	cfa = (frame->use_fp ? state->fp : state->sp) + frame->cfa_off;
c970b852d500d4 Josh Poimboeuf 2024-09-14  37  
c970b852d500d4 Josh Poimboeuf 2024-09-14  38  	if (frame->ra_off && get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
c970b852d500d4 Josh Poimboeuf 2024-09-14  39  		goto the_end;
c970b852d500d4 Josh Poimboeuf 2024-09-14  40  
c970b852d500d4 Josh Poimboeuf 2024-09-14  41  	if (frame->fp_off && get_user(fp, (unsigned long *)(cfa + frame->fp_off)))
c970b852d500d4 Josh Poimboeuf 2024-09-14  42  		goto the_end;
c970b852d500d4 Josh Poimboeuf 2024-09-14  43  
c970b852d500d4 Josh Poimboeuf 2024-09-14  44  	state->sp = cfa;
c970b852d500d4 Josh Poimboeuf 2024-09-14 @45  	state->ip = ra;
c970b852d500d4 Josh Poimboeuf 2024-09-14  46  	if (frame->fp_off)
c970b852d500d4 Josh Poimboeuf 2024-09-14  47  		state->fp = fp;
c970b852d500d4 Josh Poimboeuf 2024-09-14  48  
c970b852d500d4 Josh Poimboeuf 2024-09-14  49  	return 0;
c970b852d500d4 Josh Poimboeuf 2024-09-14  50  
c970b852d500d4 Josh Poimboeuf 2024-09-14  51  the_end:
c970b852d500d4 Josh Poimboeuf 2024-09-14  52  	state->done = true;
c970b852d500d4 Josh Poimboeuf 2024-09-14  53  	return ret;
c970b852d500d4 Josh Poimboeuf 2024-09-14  54  }
c970b852d500d4 Josh Poimboeuf 2024-09-14  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
