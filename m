Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022831C84DC
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780771856; cv=none; b=joywuH6UrmmsV1NsRyfbchI+NRxgX7vexxi35XcaCxKVP8eCI13JbsQ4ounwwXxTCr+DKpvXnFl5LrdMf4Fwn9hl/UYVbM3Xjn2zLvGDaI7OVVwbpEvmvJrotelv+pAJLcpvdvWSfjHgsmU9/ryGSGWdynUKuKHryIh+nEcTUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780771856; c=relaxed/simple;
	bh=v+E/d5YtEA1ZZry30w/S2FSJaC7UdnckmQaAh9s4CMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TafCKQAhEyIyf8T3EK+WM67GJQSecVcWWucFYBIfBI0ZDug/g9ecwtwmxLNRmi7tMhndeeQLq5dSAp5DCsRFTZoylxpih8mmWQhxA5CKdpeEol07HHSbbDqPl7iQ96P4ema84dbW1DZKe0QnBcjU7Jf9bu+CSwU3cBe08lKlAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzh7Hy2T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzh7Hy2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780771854; x=1812307854;
  h=date:from:to:cc:subject:message-id;
  bh=v+E/d5YtEA1ZZry30w/S2FSJaC7UdnckmQaAh9s4CMM=;
  b=kzh7Hy2TyAtuZMf34Wd2jCmP7WUIX+AHtojB+qcIosVUhsikLOJvoEwz
   2ntZ6g6IpzI4FXXIJB1tBwaoQJxGfCFSgYbfotS2jBbtnVrzDXnoWokhP
   rPMY9spoR43G0eq3CBl8X54Qdw3eYobLetu+ts5YbiIGKdv7F5jGo+79f
   hmyJQBv2iQ3nT/CccKRAWIvYTcIGP3Qdp6mpItezSeejbeevyYCnaEkiA
   XqVSC34ebdysCgT/aaB55+qp4oYy3347eyutZnhkfiuVHIvJZmZh0VP9q
   Af8cYmVG+lfZM2j2wYSccFtx8rgGTkmap4Y/AM1ZjH4n1WR9tjh/7ddVp
   w==;
X-CSE-ConnectionGUID: +4k/gBqeTUitnYYyVry23A==
X-CSE-MsgGUID: Ywjdq9N0R9GjDgAJw5m6Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81566195"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="81566195"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 11:50:54 -0700
X-CSE-ConnectionGUID: j1NhU58lQu6aKHfstVtnTg==
X-CSE-MsgGUID: TRnIIfpyR0m6Dmkbtv8iBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="249062692"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jun 2026 11:50:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVw6b-00000000HEo-3W7v;
	Sat, 06 Jun 2026 18:50:49 +0000
Date: Sun, 07 Jun 2026 02:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11684/11755] sound/soc/soc-pcm.c:31:1:
 sparse: sparse: an expression is expected before ')'
Message-ID: <202606070234.qjPSVNSX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: sound/soc/soc-pcm.c:31:1: sparse: sparse: an expression is expected before ')'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ingo Molnar <mingo@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: bf2f2ad04c7d25a690b0e4bcabf05e6f3a80c598 [11684/11755] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
:::::: branch date: 29 hours ago
:::::: commit date: 30 hours ago
config: powerpc-randconfig-r131-20260606 (https://download.01.org/0day-ci/archive/20260607/202606070234.qjPSVNSX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070234.qjPSVNSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606070234.qjPSVNSX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/soc-pcm.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/mutex.h:253:1: sparse: sparse: an expression is expected before ')'
   include/linux/mutex.h:257:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/rwsem.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/spinlock.h:535:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:545:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:551:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:561:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:571:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:583:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:587:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:597:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:608:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:619:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:631:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:635:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:641:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:647:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:654:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:660:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:666:1: sparse: sparse: an expression is expected before ')'
   include/linux/spinlock.h:673:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/rwsem.h:259:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:270:1: sparse: sparse: an expression is expected before ')'
   include/linux/rwsem.h:281:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcu.h:620:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:627:1: sparse: sparse: an expression is expected before ')'
   include/linux/srcu.h:634:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/seqlock.h:1362:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/local_lock.h:86:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:89:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:92:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:103:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:107:1: sparse: sparse: an expression is expected before ')'
   include/linux/local_lock.h:120:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/task.h:228:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/fs/super_types.h, include/linux/fs/super.h, include/linux/fs.h, include/linux/debugfs.h):
   include/linux/percpu-rwsem.h:141:1: sparse: sparse: an expression is expected before ')'
   include/linux/percpu-rwsem.h:145:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
   include/linux/fs/super.h:128:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/sound/core.h):
   include/linux/device.h:1058:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/linux/mm.h, include/sound/pcm.h):
   include/linux/mmap_lock.h:622:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file:
   include/sound/pcm.h:676:1: sparse: sparse: an expression is expected before ')'
   include/sound/pcm.h:679:1: sparse: sparse: an expression is expected before ')'
   include/sound/pcm.h:682:1: sparse: sparse: an expression is expected before ')'
   sound/soc/soc-pcm.c: note: in included file (through include/sound/soc.h):
   include/linux/interrupt.h:242:1: sparse: sparse: an expression is expected before ')'
>> sound/soc/soc-pcm.c:31:1: sparse: sparse: an expression is expected before ')'

vim +31 sound/soc/soc-pcm.c

ddee627cf6bb60 Liam Girdwood     2011-06-09  29  
2555c62275a10b Troy Mitchell     2026-05-22  30  
2555c62275a10b Troy Mitchell     2026-05-22 @31  DEFINE_GUARD(snd_soc_card_mutex, struct snd_soc_card *,
2555c62275a10b Troy Mitchell     2026-05-22  32  	     snd_soc_card_mutex_lock(_T), snd_soc_card_mutex_unlock(_T))
041107289c5ceb Kuninori Morimoto 2022-08-30  33  #define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
041107289c5ceb Kuninori Morimoto 2022-08-30  34  static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
041107289c5ceb Kuninori Morimoto 2022-08-30  35  			       const char *func, int ret)
041107289c5ceb Kuninori Morimoto 2022-08-30  36  {
943116ba2a6ab4 Kuninori Morimoto 2025-02-05  37  	return snd_soc_ret(rtd->dev, ret,
943116ba2a6ab4 Kuninori Morimoto 2025-02-05  38  			   "at %s() on %s\n", func, rtd->dai_link->name);
041107289c5ceb Kuninori Morimoto 2022-08-30  39  }
041107289c5ceb Kuninori Morimoto 2022-08-30  40  

:::::: The code at line 31 was first introduced by commit
:::::: 2555c62275a10bb7dfb4476ebe73d48df11f3112 ASoC: soc-pcm: add DEFINE_GUARD for snd_soc_card_mutex

:::::: TO: Troy Mitchell <troy.mitchell@linux.spacemit.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
