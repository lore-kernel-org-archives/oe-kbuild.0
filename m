Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4161B6CFE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747557015; cv=none; b=nYSUXFOWPaVvyknj0sszUTlJNOWefVVvSHlDj40lEZ2UBIwb1B6TJbZG2cj1iy0zqXLhs660uQPTPVIZ3F38fcSztg7H7hAkrnYXtSPjasFEJIyKV6lX5Oxigljtj7ftdjAL/4oBtItaQKsNeeDWyM8LZbP/1kZS8bKcIMCuZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747557015; c=relaxed/simple;
	bh=Qe8f+ZtOuANuTnga4ScZl7RZRWZdeIGttsRCokDl60g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjnEHhfb+z1jNa+B8/JzCgAeE4nUg+22ibTTIJaL7VxUAYGaVXWyo+A2X0KOKUDFwpZ5yim9nzuikRcOEyhMDXS+KdOW76ACvG455QRxBe/GLfE/vS9Dnumln19sQu3Xhe9xBc2on28y2LbIfBR7EgwxS1hoELTDZJvBfVqxGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsjhbWpA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsjhbWpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747557013; x=1779093013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qe8f+ZtOuANuTnga4ScZl7RZRWZdeIGttsRCokDl60g=;
  b=lsjhbWpAYVCcC7Rt0WjpoIm88aX4hDeLDoZACURTvFpbiD2yZPgfHWxv
   IY+zBKGMueEq6uasK9pfk/FD/WEtQUKmXjZ8cGemqgeCb1Mk58OWt0nsI
   itgUCHyjJ3tBee5xsVl5Hd1vuj5Jru9eqKJVHttnvZ2v98RlTiG3bBMAm
   c4LGdDwpBCJ77qkCJFC7P41i0zdM5ABEJeonFVllWMVS4m5IhQ9ILKw/v
   sfw1VONqnyOeSj7/N9c/5n4I5HxBQo+xc5MOo7YdntkrqXIjWbbV9yz9m
   oFG3AvU6F+g1salm/FAAKsiYheB6U5Kry+dPl3P2UpjJYtjK8TnyTrspP
   g==;
X-CSE-ConnectionGUID: bLbIa4xqSYKyEbQALZaBMQ==
X-CSE-MsgGUID: n4v1PCxGTh6nHXQWaVxKrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="66884585"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="66884585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 01:30:12 -0700
X-CSE-ConnectionGUID: Zf2EDXXJTIKqDLToyi0W7w==
X-CSE-MsgGUID: bBT+x2uoQoirtn1PARyiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="138934262"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2025 01:30:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGZPM-000Khb-2F;
	Sun, 18 May 2025 08:30:08 +0000
Date: Sun, 18 May 2025 16:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4006/11779] drivers/i2c/i2c-atr.c:265:6-9: ERROR:
 invalid reference to the index variable of the iterator on line 261
Message-ID: <202505181634.qGAGWDQ9-lkp@intel.com>
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
TO: Romain Gantois <romain.gantois@bootlin.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: c3f55241882bd5b4bc84dbe77d2efd0d9574ed9c [4006/11779] i2c: Support dynamic address translation
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: openrisc-randconfig-r064-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181634.qGAGWDQ9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505181634.qGAGWDQ9-lkp@intel.com/

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
