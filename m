Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7B1C2420
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370183; cv=none; b=cOSi0YuSB4LohkQc56IZJni3+nbGwfF98BMXPJxFGOFg7exN2t8yf/YBFCSDKbg1LRF/Cle2UgarO13xK1AfttWgWXf+bBWPSqdFLTOpdEPLzytqVPafQuD6l3IBLylcPEVo2g6NieKw87eKfd0Np24yyMC+ILjnoGRNdJnhJu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370183; c=relaxed/simple;
	bh=+TB+sViWavN3oFmk8jxTFwzQboazX9JkwADOcI8TNHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCUMgBVRy6+Q0/1IDwKihetYll1ndW1IpjB4h9PMaG6f3zf2XAeJnI+miqzIDza/hV1uDmd/isl4d8hT9T3/tuViLl6CEamdcEBv+O6ZRWG6xJhgYs5bgpQ4EfcLqI94k6O+/2gdFZi7r7hUnyRROEL174t7ASQYFrxmfCKYchM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApNlArQB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApNlArQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728370182; x=1759906182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+TB+sViWavN3oFmk8jxTFwzQboazX9JkwADOcI8TNHY=;
  b=ApNlArQBvNAltlPsm4MlbzS5qrbR8P5eN0xNtEJ7d0Unr0CIQzanjJbq
   nT0f0jUyrnHlePrAV5u9eU2xcccuv4i0tv8OzfolUitp1K05yiXsYO/0d
   pSYurupTOQtsUaTrjwZJGaU+1cl1WcwwphqqmxJyWpbQqH4EJfnXOysUD
   b0mcy/0J19oYxy8C3+nLWFQPI4G46arRGr/ZVHC69TkPLhvyovUTuebUX
   hCkOLkcCcy6K5oGzH7J5w2tUx7mBwCc/E18jvFDCSIofkL10cMI49r1y/
   kFXpEiA5uLsEMpsFkIceo7Rz/33QN/HbuNmUMWBLygcB3oi65RL0Ivj/K
   Q==;
X-CSE-ConnectionGUID: P+DuPxjFQS6oghwmFo1V8Q==
X-CSE-MsgGUID: Ba4hOLMpSj66zvamLUl/SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45009507"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45009507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 23:49:41 -0700
X-CSE-ConnectionGUID: 30DoAqwgRqCaqiFIqh1iqQ==
X-CSE-MsgGUID: WyNVKjCBSyeuhzhhMznjBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76158550"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Oct 2024 23:49:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy42L-00060C-0f;
	Tue, 08 Oct 2024 06:49:37 +0000
Date: Tue, 8 Oct 2024 14:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/afs/file.c:420:48-49: WARNING: atomic_add_unless
Message-ID: <202410081451.XtJDvNyj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: 275655d3207b9e65d1561bf21c06a622d9ec1d43 afs: fix __afs_break_callback() / afs_drop_open_mmap() race
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-103-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081451.XtJDvNyj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410081451.XtJDvNyj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   fs/afs/file.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.
>> fs/afs/file.c:420:48-49: WARNING: atomic_add_unless

vim +420 fs/afs/file.c

6e0e99d58a6530 David Howells 2021-09-02  417  
6e0e99d58a6530 David Howells 2021-09-02  418  static void afs_drop_open_mmap(struct afs_vnode *vnode)
6e0e99d58a6530 David Howells 2021-09-02  419  {
275655d3207b9e Al Viro       2023-09-29 @420  	if (atomic_add_unless(&vnode->cb_nr_mmap, -1, 1))
6e0e99d58a6530 David Howells 2021-09-02  421  		return;
6e0e99d58a6530 David Howells 2021-09-02  422  
453924de6212ac David Howells 2023-11-08  423  	down_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530 David Howells 2021-09-02  424  
275655d3207b9e Al Viro       2023-09-29  425  	read_seqlock_excl(&vnode->cb_lock);
275655d3207b9e Al Viro       2023-09-29  426  	// the only place where ->cb_nr_mmap may hit 0
275655d3207b9e Al Viro       2023-09-29  427  	// see __afs_break_callback() for the other side...
275655d3207b9e Al Viro       2023-09-29  428  	if (atomic_dec_and_test(&vnode->cb_nr_mmap))
6e0e99d58a6530 David Howells 2021-09-02  429  		list_del_init(&vnode->cb_mmap_link);
275655d3207b9e Al Viro       2023-09-29  430  	read_sequnlock_excl(&vnode->cb_lock);
6e0e99d58a6530 David Howells 2021-09-02  431  
453924de6212ac David Howells 2023-11-08  432  	up_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530 David Howells 2021-09-02  433  	flush_work(&vnode->cb_work);
6e0e99d58a6530 David Howells 2021-09-02  434  }
6e0e99d58a6530 David Howells 2021-09-02  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
