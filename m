Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B981AA1F4
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 01:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400497; cv=none; b=W4SBLha95K+f3/gfGXE4WWqREyWcHihHDd4YrT/NAZcy1kQrBquGqCvlDrsLVnScTRTSo1Kke3Hs1qgdk5ows2QqQNN+jVUJLbTpJStqJP78DezI5T+eX8n0Nw3UWs5Y/Tq7MMNRoMaRdB4Eg0uMCqnFgNPHdPEOy+kmqYnP0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400497; c=relaxed/simple;
	bh=jAwkwk/mQAnG7m+Mq0UQ8L64ca179nGDCtJUrB9Vr7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e0dOyNPHX0mNkhKRUKOi+EKT9cdv9thN7+I8RR4j/lmebjwMZ48vwb1EtAqjebFFeRpA63gHigH6W02togi4OfaufPsvfNHbP519bVDtMqvpXV/xwUBAxAEKHlAJWW6FuJlMQY1mPc3IfMcBwExheRa4OsYoy0SO9k9sqcVFMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeRqD2wx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeRqD2wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774400496; x=1805936496;
  h=date:from:to:cc:subject:message-id;
  bh=jAwkwk/mQAnG7m+Mq0UQ8L64ca179nGDCtJUrB9Vr7o=;
  b=WeRqD2wxCgcqbIlUGWdkSjLKcQe6OTiNbGYKShn5+gsj64eHa70ZxQZ+
   Yu7EXpVUN/DDn7jaJUwry+TE2T3vXtPwge+chE8kvLUYYIneA+FRX4CiT
   WGgXoZJEYHdMSnANIQIgYld7HWpHlfESvmEx9oOJuchrckJHCOMlOazqj
   p5UzKexjpwnSD2SuQTVRFo5T8RAx+UVtPSQm8rtt22WN60X/qcSMA8/T4
   pLnsU/7zf6TwhPX2i3LWaTAj45n5vMYBgM7nkbgG9m+aTUr9ZjrHsobMv
   87W8NVUMc/+La9yasHghKyCzWkeMpjX/pwl/p7YuQXdCuiFSodQsGqx+U
   A==;
X-CSE-ConnectionGUID: OWhhKRZET8+kcJpDeh6Svg==
X-CSE-MsgGUID: bQsy2HCXTFK1JzMRNYrpZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78030780"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="78030780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:01:35 -0700
X-CSE-ConnectionGUID: GQgo9qsvRtO8YuCy3634kg==
X-CSE-MsgGUID: KM0bU7x+T/SlfZiDGsCcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="255021555"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Mar 2026 18:01:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Ccm-000000005fF-0QmA;
	Wed, 25 Mar 2026 01:01:32 +0000
Date: Wed, 25 Mar 2026 09:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/i2c/i2c-atr.c:265:6-9: ERROR: invalid reference to
 the index variable of the iterator on line 261
Message-ID: <202603250842.ALLorb9h-lkp@intel.com>
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
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: c3f55241882bd5b4bc84dbe77d2efd0d9574ed9c i2c: Support dynamic address translation
date:   11 months ago
:::::: branch date: 65 minutes ago
:::::: commit date: 11 months ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260325/202603250842.ALLorb9h-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603250842.ALLorb9h-lkp@intel.com/

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
