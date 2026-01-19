Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F004E1D6187
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804094; cv=none; b=XHNK0hcyhTVRDmUS6/YqQCey5JavDIAuj1gM3vrVo6Ok+UxmK4DglIzvAn4Bv01gTZvppysYnSnHIgJB2lsU3vIGcqAi2Lr8JNZd6U3uyjfB2hTCw+n+WOYG+V5gziosbOp4iC8r8nl+h1Rg7wl9rsYG0U+PnRYn20u9Gg/DxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804094; c=relaxed/simple;
	bh=h7u8PypE3rJ0apUwR8QcAG4wfunrs3EqismLNhp3VV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RxFp2g9qC4bubn1xv/1MuwaTarbZ/EPd7xtz1z01y8iqHs8fCEx+L+1L175QJl9/+YP3iBD3rJfl30zdQOvDdep2QRzdYi/iIDTmgoZtHAJbLpSIEt37vb2hsiSSCNLRsCOwez+7ncjoY7sky4Y3Ji/7oAeTWPLdYOT1ziCLGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYT6rW9v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYT6rW9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768804093; x=1800340093;
  h=date:from:to:cc:subject:message-id;
  bh=h7u8PypE3rJ0apUwR8QcAG4wfunrs3EqismLNhp3VV8=;
  b=WYT6rW9voZVhbY0X+OfFrxyOSBCgtyK8uE4WG9FKqc4YlzwB4+05xzcK
   OnNoV7YwPo292lHN5jOwmKbNFZc3EGjNk468Clj2AffvlQLYr+bHsCaji
   PWF0C4/k/c3P1cA89zZzMKL7zqI+dzD/uIrdKpw7AHiZxs6t+Sdxar6g+
   HZs4+zavQiV7nQZ6CfJ1i2QTenLr+Se4kXekiFKbw9c5Lk4k0QI/Hb++u
   G3MVRFhovMqSL82hkFY4PhY4iZsD4vrwB6h48covhJ4ynWH4KwaAXR2kz
   bTlp9IW7NkaFv3Xtt5MUcyW/3/IP0B1/mStWvQXEV7+r4c83fwUFmGS/b
   A==;
X-CSE-ConnectionGUID: bMIkbMIMQMmOtYLYhTpVpA==
X-CSE-MsgGUID: EGLbGFYdQzyiiDyb2/0Flg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73869364"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="73869364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:28:12 -0800
X-CSE-ConnectionGUID: iPHEK++KSGGEA+QvmhhG9Q==
X-CSE-MsgGUID: N6CZIZBzTh2DGJGINymAsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210270432"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 22:28:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhikD-00000000NVp-1IPA;
	Mon, 19 Jan 2026 06:28:09 +0000
Date: Mon, 19 Jan 2026 14:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 1/1]
 drivers/md/dm-user.c:364:9-12: WARNING: Unsigned expression compared with
 zero: out < 0
Message-ID: <202601191435.bzwOkjU7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d3bb4c7e113d5a4b9dc34ff54df1423aeb814369
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1/1] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
:::::: branch date: 15 hours ago
:::::: commit date: 5 years ago
config: i386-randconfig-r061-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191435.bzwOkjU7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601191435.bzwOkjU7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-user.c:364:9-12: WARNING: Unsigned expression compared with zero: out < 0

vim +364 drivers/md/dm-user.c

83bf345abc0bc0 Palmer Dabbelt 2020-09-29  279  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  280  static inline long bio_flags_to_user_flags(struct bio *bio)
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  281  {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  282  	u64 out = 0;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  283  	typeof(bio->bi_opf) opf = bio->bi_opf & ~REQ_OP_MASK;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  284  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  285  	if (opf & REQ_FAILFAST_DEV) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  286  		opf &= ~REQ_FAILFAST_DEV;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  287  		out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DEV;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  288  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  289  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  290  	if (opf & REQ_FAILFAST_TRANSPORT) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  291  		opf &= ~REQ_FAILFAST_TRANSPORT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  292  		out |= DM_USER_REQ_MAP_FLAG_FAILFAST_TRANSPORT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  293  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  294  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  295  	if (opf & REQ_FAILFAST_DRIVER) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  296  		opf &= ~REQ_FAILFAST_DRIVER;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  297  		out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DRIVER;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  298  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  299  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  300  	if (opf & REQ_SYNC) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  301  		opf &= ~REQ_SYNC;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  302  		out |= DM_USER_REQ_MAP_FLAG_SYNC;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  303  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  304  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  305  	if (opf & REQ_META) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  306  		opf &= ~REQ_META;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  307  		out |= DM_USER_REQ_MAP_FLAG_META;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  308  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  309  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  310  	if (opf & REQ_PRIO) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  311  		opf &= ~REQ_PRIO;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  312  		out |= DM_USER_REQ_MAP_FLAG_PRIO;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  313  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  314  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  315  	if (opf & REQ_NOMERGE) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  316  		opf &= ~REQ_NOMERGE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  317  		out |= DM_USER_REQ_MAP_FLAG_NOMERGE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  318  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  319  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  320  	if (opf & REQ_IDLE) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  321  		opf &= ~REQ_IDLE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  322  		out |= DM_USER_REQ_MAP_FLAG_IDLE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  323  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  324  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  325  	if (opf & REQ_INTEGRITY) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  326  		opf &= ~REQ_INTEGRITY;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  327  		out |= DM_USER_REQ_MAP_FLAG_INTEGRITY;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  328  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  329  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  330  	if (opf & REQ_FUA) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  331  		opf &= ~REQ_FUA;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  332  		out |= DM_USER_REQ_MAP_FLAG_FUA;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  333  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  334  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  335  	if (opf & REQ_PREFLUSH) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  336  		opf &= ~REQ_PREFLUSH;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  337  		out |= DM_USER_REQ_MAP_FLAG_PREFLUSH;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  338  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  339  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  340  	if (opf & REQ_RAHEAD) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  341  		opf &= ~REQ_RAHEAD;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  342  		out |= DM_USER_REQ_MAP_FLAG_RAHEAD;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  343  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  344  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  345  	if (opf & REQ_BACKGROUND) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  346  		opf &= ~REQ_BACKGROUND;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  347  		out |= DM_USER_REQ_MAP_FLAG_BACKGROUND;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  348  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  349  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  350  	if (opf & REQ_NOWAIT) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  351  		opf &= ~REQ_NOWAIT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  352  		out |= DM_USER_REQ_MAP_FLAG_NOWAIT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  353  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  354  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  355  	if (opf & REQ_NOUNMAP) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  356  		opf &= ~REQ_NOUNMAP;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  357  		out |= DM_USER_REQ_MAP_FLAG_NOUNMAP;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  358  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  359  
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  360  	if (unlikely(opf)) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  361  		pr_warn("unsupported BIO type %x\n", opf);
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  362  		return -EOPNOTSUPP;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  363  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29 @364  	WARN_ON(out < 0);
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  365  	return out;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  366  }
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
