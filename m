Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AE286A9
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Apr 2025 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743923569; cv=none; b=OHR7flMoqyvfe6lJ9ltrBPG0m6G0prUZobthZ12oSR051Yoj1IkWHzVAp5gzIVvHdGPeM7qAxUn1P3mhtP4EZSDCg6Q9S9agS/8aoI7/xe3qUByo2wsXHimemZR88GYoqpOSg88QUdVtMTTr4OngmCclqmG35m7yempum5c242Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743923569; c=relaxed/simple;
	bh=UNMah1qAXWFmKvpIQeMzXFkS+38YCWxjSED871TRtrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBmpgC2Jcni/eOFRpbmS+wbaRuAFD6xsTm47zQZRPRnrn7yKHMQJOq+01uE66U9bABHSwI73NlKLsztw8rfIt2ZBYBMLhiuCptvGwZyjoHNjTrcf0BffIEoC7FYuSZR7LThHb5dgPNCFPmlye1xXtIn7KioXQVuyymYAz93kFr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuS3eMlV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuS3eMlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743923567; x=1775459567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNMah1qAXWFmKvpIQeMzXFkS+38YCWxjSED871TRtrw=;
  b=fuS3eMlVDq9xCGdf6H7p2hcv2gjhPfMP+1L06PaeSTkw7KIqlq277oKm
   IYMIZO4FO6dukSnyzYAURHThQwRlesy49LbbypeDv1C4qoK+Fw5i+RNZV
   tEDc9nBrKAV3X1ouX56jFtCo3ca8w10UY+6skmecfVoB2EW89aE1a2/P4
   oFfzUp6iTbeaaeWL4C4X758SXFT8NQXIWsuEB9ByqqMd+xUtMUuw/TXQT
   o4xUuZ4f686+IyBZB9NaYM4sIKraiSRYu97TYm+IjUKrrwiA7Mkjzzkh9
   l6YRHCG/2AEUtBi2jt4tb+/UU11SZ1WuXyD+uc/tMkE/8Sl8PuoSrktLA
   g==;
X-CSE-ConnectionGUID: mfHZsJWcSq2+Zjxf9l13Cw==
X-CSE-MsgGUID: XGUQl3G6TDGB7mbUNItFXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="55956139"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="55956139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 00:12:46 -0700
X-CSE-ConnectionGUID: UD/2UAgqTTiqS/WysdfP9A==
X-CSE-MsgGUID: v4S4iMqSSp2CdJXk4JqpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="128571698"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2025 00:12:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1KBO-0002Tn-0e;
	Sun, 06 Apr 2025 07:12:42 +0000
Date: Sun, 6 Apr 2025 15:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ast-bpf:trylock 2/11] drivers/md/raid5.c:2279 raid_run_ops() warn:
 statement has no effect 31
Message-ID: <202504061507.5PnBJHdq-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>
CC: Shakeel Butt <shakeel.butt@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   a8b51ec33155e2a633ff561d09e3ac44faaa3117
commit: 1a3651c92680654bbdbd212e40eb5384bcc27fc9 [2/11] locking/local_lock, mm: Replace localtry_ helpers with local_trylock_t type
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061507.5PnBJHdq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504061507.5PnBJHdq-lkp@intel.com/

New smatch warnings:
drivers/md/raid5.c:2279 raid_run_ops() warn: statement has no effect 31
fs/squashfs/decompressor_multi_percpu.c:85 squashfs_decompress() warn: statement has no effect 31

Old smatch warnings:
drivers/md/raid5.c:2340 raid_run_ops() warn: statement has no effect 31
drivers/md/raid5.c:2884 raid5_end_write_request() error: uninitialized symbol 'rdev'.
drivers/md/raid5.c:2889 raid5_end_write_request() error: uninitialized symbol 'rdev'.
drivers/md/raid5.c:8523 raid5_start_reshape() warn: mixing irq and irqsave
fs/squashfs/decompressor_multi_percpu.c:91 squashfs_decompress() warn: statement has no effect 31

vim +2279 drivers/md/raid5.c

ac6b53b6e6acab Dan Williams       2009-07-14  2270  
51acbcec6c42b2 NeilBrown          2013-02-28  2271  static void raid_run_ops(struct stripe_head *sh, unsigned long ops_request)
91c00924846a00 Dan Williams       2007-01-02  2272  {
91c00924846a00 Dan Williams       2007-01-02  2273  	int overlap_clear = 0, i, disks = sh->disks;
91c00924846a00 Dan Williams       2007-01-02  2274  	struct dma_async_tx_descriptor *tx = NULL;
d1688a6d5515f1 NeilBrown          2011-10-11  2275  	struct r5conf *conf = sh->raid_conf;
ac6b53b6e6acab Dan Williams       2009-07-14  2276  	int level = conf->level;
d6f38f31f3ad4b Dan Williams       2009-07-14  2277  	struct raid5_percpu *percpu;
91c00924846a00 Dan Williams       2007-01-02  2278  
770b1d216d7371 Davidlohr Bueso    2021-11-15 @2279  	local_lock(&conf->percpu->lock);
770b1d216d7371 Davidlohr Bueso    2021-11-15  2280  	percpu = this_cpu_ptr(conf->percpu);
83de75cc92be59 Dan Williams       2008-06-28  2281  	if (test_bit(STRIPE_OP_BIOFILL, &ops_request)) {
91c00924846a00 Dan Williams       2007-01-02  2282  		ops_run_biofill(sh);
91c00924846a00 Dan Williams       2007-01-02  2283  		overlap_clear++;
91c00924846a00 Dan Williams       2007-01-02  2284  	}
91c00924846a00 Dan Williams       2007-01-02  2285  
7b3a871ed99527 Dan Williams       2008-06-28  2286  	if (test_bit(STRIPE_OP_COMPUTE_BLK, &ops_request)) {
ac6b53b6e6acab Dan Williams       2009-07-14  2287  		if (level < 6)
d6f38f31f3ad4b Dan Williams       2009-07-14  2288  			tx = ops_run_compute5(sh, percpu);
ac6b53b6e6acab Dan Williams       2009-07-14  2289  		else {
ac6b53b6e6acab Dan Williams       2009-07-14  2290  			if (sh->ops.target2 < 0 || sh->ops.target < 0)
ac6b53b6e6acab Dan Williams       2009-07-14  2291  				tx = ops_run_compute6_1(sh, percpu);
ac6b53b6e6acab Dan Williams       2009-07-14  2292  			else
ac6b53b6e6acab Dan Williams       2009-07-14  2293  				tx = ops_run_compute6_2(sh, percpu);
ac6b53b6e6acab Dan Williams       2009-07-14  2294  		}
ac6b53b6e6acab Dan Williams       2009-07-14  2295  		/* terminate the chain if reconstruct is not set to be run */
ac6b53b6e6acab Dan Williams       2009-07-14  2296  		if (tx && !test_bit(STRIPE_OP_RECONSTRUCT, &ops_request))
7b3a871ed99527 Dan Williams       2008-06-28  2297  			async_tx_ack(tx);
7b3a871ed99527 Dan Williams       2008-06-28  2298  	}
91c00924846a00 Dan Williams       2007-01-02  2299  
584acdd49cd247 Markus Stockhausen 2014-12-15  2300  	if (test_bit(STRIPE_OP_PREXOR, &ops_request)) {
584acdd49cd247 Markus Stockhausen 2014-12-15  2301  		if (level < 6)
584acdd49cd247 Markus Stockhausen 2014-12-15  2302  			tx = ops_run_prexor5(sh, percpu, tx);
584acdd49cd247 Markus Stockhausen 2014-12-15  2303  		else
584acdd49cd247 Markus Stockhausen 2014-12-15  2304  			tx = ops_run_prexor6(sh, percpu, tx);
584acdd49cd247 Markus Stockhausen 2014-12-15  2305  	}
91c00924846a00 Dan Williams       2007-01-02  2306  
ae1713e296449c Artur Paszkiewicz  2017-04-04  2307  	if (test_bit(STRIPE_OP_PARTIAL_PARITY, &ops_request))
ae1713e296449c Artur Paszkiewicz  2017-04-04  2308  		tx = ops_run_partial_parity(sh, percpu, tx);
ae1713e296449c Artur Paszkiewicz  2017-04-04  2309  
600aa10993012f Dan Williams       2008-06-28  2310  	if (test_bit(STRIPE_OP_BIODRAIN, &ops_request)) {
d8ee0728b5b30d Dan Williams       2008-06-28  2311  		tx = ops_run_biodrain(sh, tx);
91c00924846a00 Dan Williams       2007-01-02  2312  		overlap_clear++;
91c00924846a00 Dan Williams       2007-01-02  2313  	}
91c00924846a00 Dan Williams       2007-01-02  2314  
ac6b53b6e6acab Dan Williams       2009-07-14  2315  	if (test_bit(STRIPE_OP_RECONSTRUCT, &ops_request)) {
ac6b53b6e6acab Dan Williams       2009-07-14  2316  		if (level < 6)
ac6b53b6e6acab Dan Williams       2009-07-14  2317  			ops_run_reconstruct5(sh, percpu, tx);
ac6b53b6e6acab Dan Williams       2009-07-14  2318  		else
ac6b53b6e6acab Dan Williams       2009-07-14  2319  			ops_run_reconstruct6(sh, percpu, tx);
ac6b53b6e6acab Dan Williams       2009-07-14  2320  	}
91c00924846a00 Dan Williams       2007-01-02  2321  
ac6b53b6e6acab Dan Williams       2009-07-14  2322  	if (test_bit(STRIPE_OP_CHECK, &ops_request)) {
ac6b53b6e6acab Dan Williams       2009-07-14  2323  		if (sh->check_state == check_state_run)
ac6b53b6e6acab Dan Williams       2009-07-14  2324  			ops_run_check_p(sh, percpu);
ac6b53b6e6acab Dan Williams       2009-07-14  2325  		else if (sh->check_state == check_state_run_q)
ac6b53b6e6acab Dan Williams       2009-07-14  2326  			ops_run_check_pq(sh, percpu, 0);
ac6b53b6e6acab Dan Williams       2009-07-14  2327  		else if (sh->check_state == check_state_run_pq)
ac6b53b6e6acab Dan Williams       2009-07-14  2328  			ops_run_check_pq(sh, percpu, 1);
ac6b53b6e6acab Dan Williams       2009-07-14  2329  		else
ac6b53b6e6acab Dan Williams       2009-07-14  2330  			BUG();
ac6b53b6e6acab Dan Williams       2009-07-14  2331  	}
91c00924846a00 Dan Williams       2007-01-02  2332  
770b1d216d7371 Davidlohr Bueso    2021-11-15  2333  	if (overlap_clear && !sh->batch_head) {
91c00924846a00 Dan Williams       2007-01-02  2334  		for (i = disks; i--; ) {
91c00924846a00 Dan Williams       2007-01-02  2335  			struct r5dev *dev = &sh->dev[i];
91c00924846a00 Dan Williams       2007-01-02  2336  			if (test_and_clear_bit(R5_Overlap, &dev->flags))
e6a03207b925ae Artur Paszkiewicz  2024-08-27  2337  				wake_up_bit(&dev->flags, R5_Overlap);
91c00924846a00 Dan Williams       2007-01-02  2338  		}
770b1d216d7371 Davidlohr Bueso    2021-11-15  2339  	}
770b1d216d7371 Davidlohr Bueso    2021-11-15  2340  	local_unlock(&conf->percpu->lock);
91c00924846a00 Dan Williams       2007-01-02  2341  }
91c00924846a00 Dan Williams       2007-01-02  2342  

:::::: The code at line 2279 was first introduced by commit
:::::: 770b1d216d7371c94c88713824da4be4bc39a4e0 md/raid5: play nice with PREEMPT_RT

:::::: TO: Davidlohr Bueso <dave@stgolabs.net>
:::::: CC: Song Liu <song@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
