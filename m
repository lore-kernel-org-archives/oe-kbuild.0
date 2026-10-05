Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71130D40E
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219877; cv=none; b=Rpg/cdUc8UeS8Tdml8LLtqrT7l8K8Qko5Y5xtTkh6cNFsYvfMlanbah+dCYbIcnO/E28lEMrtqiJM/skv5DubxjJrunHvgEj8xCM1b/iA6ifKux3CaKEY9IMxKzM3G/93/xajU84C7RIkIdJI7cRq9uwxTEqoXwumH2J6MyL0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219877; c=relaxed/simple;
	bh=EyhudfFTWk4zl6EuYBFwwpaMnEoRToGbV8lb1nOVBxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UAeql1O3jd7HTOLcgoDtD0/ttiu8T2E8Blaf47zOyNfmi0oiqwgKSUiHnfecvnQa2CEYgZ/qksXY4X3r7uZTJYnLel0CTMvYFli0+ZO7vmtKPuOhWtcXwv4UYah3H4DO1qYLzE2E4qY4IahFgq1dYbXolhSJxaxOpPPE339diQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEZIziyL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEZIziyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791219876; x=1822755876;
  h=date:from:to:cc:subject:message-id;
  bh=EyhudfFTWk4zl6EuYBFwwpaMnEoRToGbV8lb1nOVBxA=;
  b=DEZIziyLVeJ7LkfHG0cX0qtMaYBFgbr1mZA6PWXL5fKl+3NHVEl3J4Gb
   5gWra0XpHZuK4EhFTNL5l1XelbLuwmbEwwVBSNmllIcZ8qN4UNSEw2CbS
   b3Cq1lqoaCPvAdb9PIf1LS+3pxeao1XeSMGzuHppQXyozSIX/C4pEy6tx
   MwHtJhtjGarAHhTJGEioDmrtnr2XMllKoIHwov6dJnMhEAc267C8q1mA3
   JIcPHkORCgTTbHN4fpR0i3aJFz5VdK82iHNHjvZqJJMlhlPS2/crBLhuu
   vaFZIwx4XAbBUge3JQ3e+7QsXWU4v5C96eCmQsbaHkKY87oGypEgJfrG+
   w==;
X-CSE-ConnectionGUID: 4tsdMDC4Snqx26A9Lx0WMA==
X-CSE-MsgGUID: o+gv5jboTtSg7x7SMfFQSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91921370"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91921370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:04:35 -0700
X-CSE-ConnectionGUID: VSX5rD3WQ7S6pa2MPBSjsw==
X-CSE-MsgGUID: lMOUD+1CR3OIGxZCJT1Cgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="274667638"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Oct 2026 10:04:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDm76-000000000ER-0TG8;
	Mon, 05 Oct 2026 17:04:32 +0000
Date: Mon, 05 Oct 2026 19:03:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/ac97/bus.c:327:12-21: ERROR: reference preceded by
 free on line 324
Message-ID: <202610051849.ZRLR47eV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67f0943b394d920b6c142aad8c6af94340342ae7
commit: 830988b6cf197e6dcffdfe2008c5738e6c6c3c0f ALSA: ac97: fix a double free in snd_ac97_controller_register()
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: sparc64-randconfig-r2103-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051849.ZRLR47eV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 830988b6cf19 ("ALSA: ac97: fix a double free in snd_ac97_controller_register()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610051849.ZRLR47eV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/ac97/bus.c:327:12-21: ERROR: reference preceded by free on line 324

vim +327 sound/ac97/bus.c

74426fbff66eea8 Robert Jarzmik 2017-09-02  308  
74426fbff66eea8 Robert Jarzmik 2017-09-02  309  static int ac97_add_adapter(struct ac97_controller *ac97_ctrl)
74426fbff66eea8 Robert Jarzmik 2017-09-02  310  {
74426fbff66eea8 Robert Jarzmik 2017-09-02  311  	int ret;
74426fbff66eea8 Robert Jarzmik 2017-09-02  312  
c07824a14d99c10 Takashi Iwai   2025-08-29  313  	guard(mutex)(&ac97_controllers_mutex);
74426fbff66eea8 Robert Jarzmik 2017-09-02  314  	ret = idr_alloc(&ac97_adapter_idr, ac97_ctrl, 0, 0, GFP_KERNEL);
74426fbff66eea8 Robert Jarzmik 2017-09-02  315  	ac97_ctrl->nr = ret;
74426fbff66eea8 Robert Jarzmik 2017-09-02  316  	if (ret >= 0) {
74426fbff66eea8 Robert Jarzmik 2017-09-02  317  		dev_set_name(&ac97_ctrl->adap, "ac97-%d", ret);
74426fbff66eea8 Robert Jarzmik 2017-09-02  318  		ac97_ctrl->adap.type = &ac97_adapter_type;
74426fbff66eea8 Robert Jarzmik 2017-09-02  319  		ac97_ctrl->adap.parent = ac97_ctrl->parent;
74426fbff66eea8 Robert Jarzmik 2017-09-02  320  		ret = device_register(&ac97_ctrl->adap);
74426fbff66eea8 Robert Jarzmik 2017-09-02  321  		if (ret)
74426fbff66eea8 Robert Jarzmik 2017-09-02  322  			put_device(&ac97_ctrl->adap);
830988b6cf197e6 Haoxiang Li    2025-12-20  323  	} else
830988b6cf197e6 Haoxiang Li    2025-12-20 @324  		kfree(ac97_ctrl);
830988b6cf197e6 Haoxiang Li    2025-12-20  325  
c07824a14d99c10 Takashi Iwai   2025-08-29  326  	if (!ret) {
74426fbff66eea8 Robert Jarzmik 2017-09-02 @327  		list_add(&ac97_ctrl->controllers, &ac97_controllers);
74426fbff66eea8 Robert Jarzmik 2017-09-02  328  		dev_dbg(&ac97_ctrl->adap, "adapter registered by %s\n",
74426fbff66eea8 Robert Jarzmik 2017-09-02  329  			dev_name(ac97_ctrl->parent));
c07824a14d99c10 Takashi Iwai   2025-08-29  330  	}
74426fbff66eea8 Robert Jarzmik 2017-09-02  331  	return ret;
74426fbff66eea8 Robert Jarzmik 2017-09-02  332  }
74426fbff66eea8 Robert Jarzmik 2017-09-02  333  

:::::: The code at line 327 was first introduced by commit
:::::: 74426fbff66eea8e8d1f42c8238c268d1e63a832 ALSA: ac97: add an ac97 bus

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
