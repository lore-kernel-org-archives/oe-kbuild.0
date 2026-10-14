Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7B47D93C
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012689; cv=none; b=PV5lX3ygiXU2UkImTnCntIGVj8Y9a22UsSlJz6WFe0PPji9jX16wUidbATMHBQiAMCNYmUrWnpae/NRFzqS5r1Wo2DDr0aQmYXYjM3adKrXJoaPERKOmTJwu5R+YzLLVqM94tFVyo5BuNQIbx/5bhp80DIPMqbDqa4CoYrGZLEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012689; c=relaxed/simple;
	bh=+opmwrjKEMP0wZpBo2aaUo/zaL0nLGvfyC0XWaPKRWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=To1ixaY1m+LRsBsWvp4anW4/Enp9ttzRVcQcs+IBud6b87YtpioGNO3nPZiRNtUCXAmlsdT12gNxF2FJk3ZvUMYmIS2Kkw5V+mYXsa//sY/B0tzkLDCQWPUtCVwz3qyEzbj0ndDxw/ZLzcsQClSZhAd4dBRqejNSTppj4GNChSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHecLhTA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHecLhTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792012688; x=1823548688;
  h=date:from:to:cc:subject:message-id;
  bh=+opmwrjKEMP0wZpBo2aaUo/zaL0nLGvfyC0XWaPKRWI=;
  b=CHecLhTAWweVb+uHfTJ6Gthj3Cvi7yt4l1lqL/tBZGakvvO3P3BXtEUg
   rPX3wcoYYMx6QIBc90xItVSN/TcShN5+hXcTICgq9cb34z9NnuZXuBfQ0
   KMc+YjWqmU+MyozP8Rb6JGLizUqQrJ0AW46NDyuJbZmvTTjHAteRgTLBk
   ODan9lMgz8RWHH4h9flTev0YgQmUcT0CLPu1n2Kor/wZBwyjnordAqbhf
   N75AjIgSQmmsfKOAsLDAedj/QoIfhiMGIVFptdyb+cuP/cCSge+/hRbZe
   y+tU6GJgnBJj+AWQAczt1O++OjT05ZQlzYMcxfEVb3cR2E/Mw+nYlTCjG
   Q==;
X-CSE-ConnectionGUID: pNSXlqKOQxCTEw4bcDZsbA==
X-CSE-MsgGUID: 4FqGOw0RQe2NK3q671HyKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="673035"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="673035"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 14:17:59 -0700
X-CSE-ConnectionGUID: KLfZwpS7TyCIln0wbifLCg==
X-CSE-MsgGUID: DbHogPkdQCm5qs8NnXkMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1635588"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 14:17:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH6MF-00000000BIh-4AL7;
	Wed, 14 Oct 2026 21:17:56 +0000
Date: Wed, 14 Oct 2026 23:16:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [arm-integrator:b4/genexis-xg6846b-bcmbca-xrdp-reset 5/6]
 drivers/bus/bcmbca_pmc3_pmb.c:100:2-8: preceding lock on line 86
Message-ID: <202610142340.SKtimKtj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-bcmbca-xrdp-reset
head:   f576cbf2d1f356edfa8a9a7774037a6f28209ac2
commit: f7d8e26a2c3719e61f34785d5049f1f68f4413cb [5/6] bus: Add a shared BCMBCA PMC3 PMB transport
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: parisc-randconfig-r2111-20261014 (https://download.01.org/0day-ci/archive/20261014/202610142340.SKtimKtj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610142340.SKtimKtj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bus/bcmbca_pmc3_pmb.c:100:2-8: preceding lock on line 86

vim +100 drivers/bus/bcmbca_pmc3_pmb.c

f7d8e26a2c3719e Linus Walleij 2026-10-13   80  
f7d8e26a2c3719e Linus Walleij 2026-10-13   81  int bcmbca_pmb_lock(struct bcmbca_pmb *pmb)
f7d8e26a2c3719e Linus Walleij 2026-10-13   82  {
f7d8e26a2c3719e Linus Walleij 2026-10-13   83  	u32 value;
f7d8e26a2c3719e Linus Walleij 2026-10-13   84  	int ret;
f7d8e26a2c3719e Linus Walleij 2026-10-13   85  
f7d8e26a2c3719e Linus Walleij 2026-10-13  @86  	mutex_lock(&pmb->lock);
f7d8e26a2c3719e Linus Walleij 2026-10-13   87  	if (pmb->stopping) {
f7d8e26a2c3719e Linus Walleij 2026-10-13   88  		ret = -ENODEV;
f7d8e26a2c3719e Linus Walleij 2026-10-13   89  		goto unlock;
f7d8e26a2c3719e Linus Walleij 2026-10-13   90  	}
f7d8e26a2c3719e Linus Walleij 2026-10-13   91  	if (pmb->recovering) {
f7d8e26a2c3719e Linus Walleij 2026-10-13   92  		ret = -EBUSY;
f7d8e26a2c3719e Linus Walleij 2026-10-13   93  		goto unlock;
f7d8e26a2c3719e Linus Walleij 2026-10-13   94  	}
f7d8e26a2c3719e Linus Walleij 2026-10-13   95  
f7d8e26a2c3719e Linus Walleij 2026-10-13   96  	/* Reading bit 0 acquires the hardware lock; writing 1 releases it. */
f7d8e26a2c3719e Linus Walleij 2026-10-13   97  	ret = readl_poll_timeout(pmb->base + PMB_MUTEX, value,
f7d8e26a2c3719e Linus Walleij 2026-10-13   98  				 value & PMB_LOCKED, 1, 1000);
f7d8e26a2c3719e Linus Walleij 2026-10-13   99  	if (!ret)
f7d8e26a2c3719e Linus Walleij 2026-10-13 @100  		return 0;
f7d8e26a2c3719e Linus Walleij 2026-10-13  101  unlock:
f7d8e26a2c3719e Linus Walleij 2026-10-13  102  	mutex_unlock(&pmb->lock);
f7d8e26a2c3719e Linus Walleij 2026-10-13  103  	return ret;
f7d8e26a2c3719e Linus Walleij 2026-10-13  104  }
f7d8e26a2c3719e Linus Walleij 2026-10-13  105  EXPORT_SYMBOL_GPL(bcmbca_pmb_lock);
f7d8e26a2c3719e Linus Walleij 2026-10-13  106  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
