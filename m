Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588CF382F1E
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600145; cv=none; b=Zv08lARBK3eAww5gjVP6RtJ/ZB8qeACyYwk2ip0zIVf17jjxxKvutEXM/VkJGnJDQjPlUEYFz/u2A2sUs5wfOW5kZ5vWQMDFYWKdhfXWVbmPA8J+GQagMjUSqDh90l+1T8JracmL2ZwWGmbWSQZ8w4VnfRVZVHvwC4LDl/w5mmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600145; c=relaxed/simple;
	bh=4A05+t2ZYhkVuOWoRzg1TD0+avE/HSrS4YkQ6wKGzT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bSFozBQb7MGdJ3+CJIUslBUtWhvRfX6uyZMaQNDzDmQTiWaMatGwzvhgrOErXVUTYVLeokE+78PPJw0czrUTTl07izw/u9WO9CO/1NDgUPfc5LRykiShhW0KGKQhNVOIQoRE35W/V3UosrOw015U1wrYnF3sGwTdM4E/GJfxXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPQZg4ct; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPQZg4ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780600143; x=1812136143;
  h=date:from:to:cc:subject:message-id;
  bh=4A05+t2ZYhkVuOWoRzg1TD0+avE/HSrS4YkQ6wKGzT8=;
  b=EPQZg4cts1oxKB/fc7T6Ru3YGgqyqjE+2efDcYmeHUWR1Jv12nUNd7hu
   +kN17IYHurW3Y0eXAoB7O7lJMKY47aC/fScqtfCrjPKsBInkyvrcyTrgd
   QvEnvga+GltsvzUjehyOm1HzIwhNxuaiVcTPyKQv+yk8mGkluSFeMRIjq
   d3qRETcbmsjLw6cFCpvyCt808sDiB0Cl2NfqFcQAIAvze3WPUU04Z4kzg
   P8VQ6t2YBDG4mkcDtl3nj2mDLCvBsqdIq2mFW2H3fso4ZFtVOCYaVanvW
   tZPUZe7T4A22AB557Z1frwrQcKzt9r3npnE2yYE4oi/Th14E3jxflGxBL
   A==;
X-CSE-ConnectionGUID: JstllbLJRiCdUbb2PZPipw==
X-CSE-MsgGUID: kIvjfOuyT8amkXkAeBNepg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80470159"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="80470159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 12:09:03 -0700
X-CSE-ConnectionGUID: gSb3o0xPQjiQCo4pndOM4Q==
X-CSE-MsgGUID: 5KO/2F+NR2m3VsHrmStVlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="249725319"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jun 2026 12:09:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVDR5-00000000F6m-1viD;
	Thu, 04 Jun 2026 19:08:59 +0000
Date: Fri, 05 Jun 2026 03:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/i2c/i2c-atr.c:265:6-9: ERROR: invalid reference to
 the index variable of the iterator on line 261
Message-ID: <202606050244.q6ApjQY8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Romain Gantois <romain.gantois@bootlin.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: c3f55241882bd5b4bc84dbe77d2efd0d9574ed9c i2c: Support dynamic address translation
date:   1 year, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050244.q6ApjQY8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c3f55241882b ("i2c: Support dynamic address translation")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606050244.q6ApjQY8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/i2c-atr.c:265:6-9: ERROR: invalid reference to the index variable of the iterator on line 261

vim +265 drivers/i2c/i2c-atr.c

c3f55241882bd5 Romain Gantois 2025-03-06  235  
c3f55241882bd5 Romain Gantois 2025-03-06  236  /* Must be called with alias_pairs_lock held */
a076a860acae77 Luca Ceresoli  2023-06-19  237  static struct i2c_atr_alias_pair *
c3f55241882bd5 Romain Gantois 2025-03-06  238  i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
a076a860acae77 Luca Ceresoli  2023-06-19  239  {
c3f55241882bd5 Romain Gantois 2025-03-06  240  	struct i2c_atr *atr = chan->atr;
a076a860acae77 Luca Ceresoli  2023-06-19  241  	struct i2c_atr_alias_pair *c2a;
c3f55241882bd5 Romain Gantois 2025-03-06  242  	struct list_head *alias_pairs;
c3f55241882bd5 Romain Gantois 2025-03-06  243  	u16 alias;
c3f55241882bd5 Romain Gantois 2025-03-06  244  	int ret;
c3f55241882bd5 Romain Gantois 2025-03-06  245  
c3f55241882bd5 Romain Gantois 2025-03-06  246  	lockdep_assert_held(&chan->alias_pairs_lock);
a076a860acae77 Luca Ceresoli  2023-06-19  247  
c3f55241882bd5 Romain Gantois 2025-03-06  248  	alias_pairs = &chan->alias_pairs;
c3f55241882bd5 Romain Gantois 2025-03-06  249  
c3f55241882bd5 Romain Gantois 2025-03-06  250  	list_for_each_entry(c2a, alias_pairs, node) {
c3f55241882bd5 Romain Gantois 2025-03-06  251  		if (c2a->addr == addr)
a076a860acae77 Luca Ceresoli  2023-06-19  252  			return c2a;
a076a860acae77 Luca Ceresoli  2023-06-19  253  	}
a076a860acae77 Luca Ceresoli  2023-06-19  254  
c3f55241882bd5 Romain Gantois 2025-03-06  255  	ret = i2c_atr_reserve_alias(chan->alias_pool);
c3f55241882bd5 Romain Gantois 2025-03-06  256  	if (ret < 0) {
c3f55241882bd5 Romain Gantois 2025-03-06  257  		// If no free aliases are left, replace an existing one
c3f55241882bd5 Romain Gantois 2025-03-06  258  		if (unlikely(list_empty(alias_pairs)))
c3f55241882bd5 Romain Gantois 2025-03-06  259  			return NULL;
c3f55241882bd5 Romain Gantois 2025-03-06  260  
c3f55241882bd5 Romain Gantois 2025-03-06 @261  		list_for_each_entry_reverse(c2a, alias_pairs, node)
c3f55241882bd5 Romain Gantois 2025-03-06  262  			if (!c2a->fixed)
c3f55241882bd5 Romain Gantois 2025-03-06  263  				break;
c3f55241882bd5 Romain Gantois 2025-03-06  264  
c3f55241882bd5 Romain Gantois 2025-03-06 @265  		if (c2a->fixed)
c3f55241882bd5 Romain Gantois 2025-03-06  266  			return NULL;
c3f55241882bd5 Romain Gantois 2025-03-06  267  
c3f55241882bd5 Romain Gantois 2025-03-06  268  		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
c3f55241882bd5 Romain Gantois 2025-03-06  269  		c2a->addr = addr;
c3f55241882bd5 Romain Gantois 2025-03-06  270  
c3f55241882bd5 Romain Gantois 2025-03-06  271  		// Move updated entry to beginning of list
c3f55241882bd5 Romain Gantois 2025-03-06  272  		list_move(&c2a->node, alias_pairs);
c3f55241882bd5 Romain Gantois 2025-03-06  273  
c3f55241882bd5 Romain Gantois 2025-03-06  274  		alias = c2a->alias;
c3f55241882bd5 Romain Gantois 2025-03-06  275  	} else {
c3f55241882bd5 Romain Gantois 2025-03-06  276  		alias = ret;
c3f55241882bd5 Romain Gantois 2025-03-06  277  
c3f55241882bd5 Romain Gantois 2025-03-06  278  		c2a = i2c_atr_create_c2a(chan, alias, addr);
c3f55241882bd5 Romain Gantois 2025-03-06  279  		if (!c2a)
c3f55241882bd5 Romain Gantois 2025-03-06  280  			goto err_release_alias;
c3f55241882bd5 Romain Gantois 2025-03-06  281  	}
c3f55241882bd5 Romain Gantois 2025-03-06  282  
c3f55241882bd5 Romain Gantois 2025-03-06  283  	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
c3f55241882bd5 Romain Gantois 2025-03-06  284  	if (ret) {
c3f55241882bd5 Romain Gantois 2025-03-06  285  		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
c3f55241882bd5 Romain Gantois 2025-03-06  286  			addr, chan->chan_id, ret);
c3f55241882bd5 Romain Gantois 2025-03-06  287  		goto err_del_c2a;
c3f55241882bd5 Romain Gantois 2025-03-06  288  	}
c3f55241882bd5 Romain Gantois 2025-03-06  289  
c3f55241882bd5 Romain Gantois 2025-03-06  290  	return c2a;
c3f55241882bd5 Romain Gantois 2025-03-06  291  
c3f55241882bd5 Romain Gantois 2025-03-06  292  err_del_c2a:
c3f55241882bd5 Romain Gantois 2025-03-06  293  	i2c_atr_destroy_c2a(&c2a);
c3f55241882bd5 Romain Gantois 2025-03-06  294  err_release_alias:
c3f55241882bd5 Romain Gantois 2025-03-06  295  	i2c_atr_release_alias(chan->alias_pool, alias);
a076a860acae77 Luca Ceresoli  2023-06-19  296  	return NULL;
a076a860acae77 Luca Ceresoli  2023-06-19  297  }
a076a860acae77 Luca Ceresoli  2023-06-19  298  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
