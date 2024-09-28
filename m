Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B112E75
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511247; cv=none; b=g+0zf871tzWbQZfzJtSHWrMPTjwHmOGhI2Y1hD0VJa1DF/HN7U00fAhCMXj+YEw2rYzPq/9o1xuXtTaj+9fTLLvt9Yh3zbS2EUytBQNgcYhnJxrhb0GB2Sha3l+74WWbYSkrNhZbh/YtHxrUXGSOkQu+YM0/dbjmb5/1PA4ih5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511247; c=relaxed/simple;
	bh=HvBrzVSl26dvcBTQ90qrzofuQkrocjXACJvBoWpg2xI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGNx/JL9KWQGj7aOed+CFnft6NAk5OWKnPSpEIrjsfKx6CrNOUGyuP4UNlFmHJs+KizD6FrGXRHgD0+z97gY+8Ikm+S1/IaJhcZcpLDOu8nebgD95InvpAMnA7JIb2HjC8UaRnrKLd/jzCzNKW+oRubPmNLnv+tqa7I4KKiFDUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tat5Qz6i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tat5Qz6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727511246; x=1759047246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HvBrzVSl26dvcBTQ90qrzofuQkrocjXACJvBoWpg2xI=;
  b=Tat5Qz6i/a1ocVpmP8f+oovGNjWN0P/gn89YzCd5ctNcFXwfR41zPR5F
   Om+7KBA/0XY6HJ3fHdMqHubXKa2B2Dih4k9fegG7+8bs8aAdTKtgD+m2p
   GoHD8dGEcxhwg9JIUyrgDYopIu8vBH0efR0+niP72tuQ6zmtUVVPB+c5o
   cqV/s5m7RLIERdEP0yc3shYlXz+ZdHnd65rph7zEDkEORFI2VQ6L3tJov
   ZY1sos5ZSH/PxkoEcBHRNCe5hWEFcXD3lmJoe92s8njm36dFh6Cakf/K1
   40FgBO534H3vClIhnu9BJcCmLBHyF1Fw8iPiJOY/cb3Pyd9a+gXYdsvdN
   Q==;
X-CSE-ConnectionGUID: 1XPmdmOFT+2Hq5WQ2vPxBw==
X-CSE-MsgGUID: /1ad8iyoRKWST80a+gSG3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37221085"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37221085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:14:05 -0700
X-CSE-ConnectionGUID: JJfjmJ61Tiye8Wb8t6uiTg==
X-CSE-MsgGUID: yTc7wrelTum0Pxb1i+hSwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73559156"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2024 01:14:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSaX-000N1f-2G;
	Sat, 28 Sep 2024 08:14:01 +0000
Date: Sat, 28 Sep 2024 16:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6-2024-09 10099/17425]
 kernel/futex/waitwake.c:180 futex_wake() error: uninitialized symbol
 'target_nr'.
Message-ID: <202409281621.3StHnzmV-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-09
head:   cb6342e5f3b49fdfca7ba496ed2d66223b2c2cc9
commit: 69957edeefc91bb1b72621b1c90a5cc7b6ea1b94 [10099/17425] ANDROID: vendor_hooks: Add hooks for oem futex optimization
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281621.3StHnzmV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409281621.3StHnzmV-lkp@intel.com/

smatch warnings:
kernel/futex/waitwake.c:180 futex_wake() error: uninitialized symbol 'target_nr'.

vim +/target_nr +180 kernel/futex/waitwake.c

a046f1a0d3e320 Peter Zijlstra 2021-09-23  140  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  141  /*
a046f1a0d3e320 Peter Zijlstra 2021-09-23  142   * Wake up waiters matching bitset queued on this futex (uaddr).
a046f1a0d3e320 Peter Zijlstra 2021-09-23  143   */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  144  int futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bitset)
a046f1a0d3e320 Peter Zijlstra 2021-09-23  145  {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  146  	struct futex_hash_bucket *hb;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  147  	struct futex_q *this, *next;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  148  	union futex_key key = FUTEX_KEY_INIT;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  149  	int ret;
69957edeefc91b xieliujie      2024-02-23  150  	int target_nr;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  151  	DEFINE_WAKE_Q(wake_q);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  152  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  153  	if (!bitset)
a046f1a0d3e320 Peter Zijlstra 2021-09-23  154  		return -EINVAL;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  155  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  156  	ret = get_futex_key(uaddr, flags & FLAGS_SHARED, &key, FUTEX_READ);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  157  	if (unlikely(ret != 0))
a046f1a0d3e320 Peter Zijlstra 2021-09-23  158  		return ret;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  159  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  160  	hb = futex_hash(&key);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  161  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  162  	/* Make sure we really have tasks to wakeup */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  163  	if (!futex_hb_waiters_pending(hb))
a046f1a0d3e320 Peter Zijlstra 2021-09-23  164  		return ret;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  165  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  166  	spin_lock(&hb->lock);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  167  
69957edeefc91b xieliujie      2024-02-23  168  	trace_android_vh_futex_wake_traverse_plist(&hb->chain, &target_nr, key, bitset);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  169  	plist_for_each_entry_safe(this, next, &hb->chain, list) {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  170  		if (futex_match (&this->key, &key)) {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  171  			if (this->pi_state || this->rt_waiter) {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  172  				ret = -EINVAL;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  173  				break;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  174  			}
a046f1a0d3e320 Peter Zijlstra 2021-09-23  175  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  176  			/* Check if one of the bits is set in both bitsets */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  177  			if (!(this->bitset & bitset))
a046f1a0d3e320 Peter Zijlstra 2021-09-23  178  				continue;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  179  
69957edeefc91b xieliujie      2024-02-23 @180  			trace_android_vh_futex_wake_this(ret, nr_wake, target_nr, this->task);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  181  			futex_wake_mark(&wake_q, this);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  182  			if (++ret >= nr_wake)
a046f1a0d3e320 Peter Zijlstra 2021-09-23  183  				break;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  184  		}
a046f1a0d3e320 Peter Zijlstra 2021-09-23  185  	}
a046f1a0d3e320 Peter Zijlstra 2021-09-23  186  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  187  	spin_unlock(&hb->lock);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  188  	wake_up_q(&wake_q);
69957edeefc91b xieliujie      2024-02-23  189  	trace_android_vh_futex_wake_up_q_finish(nr_wake, target_nr);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  190  	return ret;
a046f1a0d3e320 Peter Zijlstra 2021-09-23  191  }
a046f1a0d3e320 Peter Zijlstra 2021-09-23  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
