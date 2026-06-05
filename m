Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CB4071C8
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687265; cv=none; b=kyFX50ObKkSStx6Y+Y7rhzm7BB5IXoOB2DyDfkfO4aHONpoKHF6p3qIEHfYwA7gAxRo1YEqF3ktChYP9Jz5NkvW1A1vulTuQLIJCtg6IYX86s0OjmD0YzFaE3WJzk1+xlMg66b6MoJAXLLkkC1hpMOGK1FIfcQN/s5wG1voCxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687265; c=relaxed/simple;
	bh=GdKjyOUBejz+GuXmdadZo2HhW47paRNKuGVe/YKecYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGe1z/pyCoWhJUtH71muR7kzeSmMAKdNDPuTxYFnD8drbIfpupz6oOoJ9dSZWgobACmTzfy9t1TtSDhgQt49K890AmI3DgCG7icxYhBCDGN2bs0wqoWR7vvY0SfnPHafGRpm+P3fCrYrVumC1YHfjiqINP0rDm/pmn/UKCaCG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUwoGCxn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUwoGCxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780687263; x=1812223263;
  h=date:from:to:cc:subject:message-id;
  bh=GdKjyOUBejz+GuXmdadZo2HhW47paRNKuGVe/YKecYM=;
  b=HUwoGCxnkEhZHtIzwEi60X13BDNMZMSCIpKp/Jf5Ah3fQZ8lRUV6bCzI
   ZSphO7wy1/mOymwJXKMeCMU7i/8Yj0zcMfmqU2IHeU+sq4/V6QbmIjcaQ
   M+fhAxuZn8EsmB7YIBocGIMDHUmedOlTrzBUk1/UWI56AU4XyyTdSah6N
   66Ii/P4Qab4yaY/LBVX3BT674zXFncQIdR4wJ1XGheFOP/kC6l1Gj7v+V
   Fr55eZEtXu7MGc6Z4ghrv220wgQlZR7YchobGL1xMGXeiJBdzvV36Pkyz
   DsRnZZZiXceddME7RAzlOZrFxhoSE69J6lZqtpVKQwWa4ddLSUSRZLUuA
   g==;
X-CSE-ConnectionGUID: E3UAyE79SwmwyfIBEXJJhA==
X-CSE-MsgGUID: 1P01zU/ZQpm5Dx6sy6puNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92902080"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="92902080"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 12:21:03 -0700
X-CSE-ConnectionGUID: cTlTszJxRIC3Hckq1m4G4A==
X-CSE-MsgGUID: 5jGEy1vIQSuC+wsSF2DMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="249261383"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jun 2026 12:21:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVa6E-00000000GP6-46WC;
	Fri, 05 Jun 2026 19:20:58 +0000
Date: Sat, 06 Jun 2026 03:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/rtc/rtc-pic32.c:249:41-47: opportunity for
 str_yes_no(repeat)
Message-ID: <202606060336.oixjwTRj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Brian Masney <bmasney@redhat.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 095a3e886dd250acc9ff692f8fcc296f0023a5c6 rtc: pic32: allow driver to be compiled with COMPILE_TEST
date:   8 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 weeks ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260606/202606060336.oixjwTRj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 095a3e886dd2 ("rtc: pic32: allow driver to be compiled with COMPILE_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606060336.oixjwTRj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-pic32.c:249:41-47: opportunity for str_yes_no(repeat)

vim +249 drivers/rtc/rtc-pic32.c

51aa905c912385 Joshua Henderson 2016-02-25  238  
51aa905c912385 Joshua Henderson 2016-02-25  239  static int pic32_rtc_proc(struct device *dev, struct seq_file *seq)
51aa905c912385 Joshua Henderson 2016-02-25  240  {
51aa905c912385 Joshua Henderson 2016-02-25  241  	struct pic32_rtc_dev *pdata = dev_get_drvdata(dev);
51aa905c912385 Joshua Henderson 2016-02-25  242  	void __iomem *base = pdata->reg_base;
51aa905c912385 Joshua Henderson 2016-02-25  243  	unsigned int repeat;
51aa905c912385 Joshua Henderson 2016-02-25  244  
51aa905c912385 Joshua Henderson 2016-02-25  245  	clk_enable(pdata->clk);
51aa905c912385 Joshua Henderson 2016-02-25  246  
51aa905c912385 Joshua Henderson 2016-02-25  247  	repeat = readw(base + PIC32_RTCALRM);
51aa905c912385 Joshua Henderson 2016-02-25  248  	repeat &= PIC32_RTCALRM_ARPT;
51aa905c912385 Joshua Henderson 2016-02-25 @249  	seq_printf(seq, "periodic_IRQ\t: %s\n", repeat  ? "yes" : "no");
51aa905c912385 Joshua Henderson 2016-02-25  250  
51aa905c912385 Joshua Henderson 2016-02-25  251  	clk_disable(pdata->clk);
51aa905c912385 Joshua Henderson 2016-02-25  252  	return 0;
51aa905c912385 Joshua Henderson 2016-02-25  253  }
51aa905c912385 Joshua Henderson 2016-02-25  254  

:::::: The code at line 249 was first introduced by commit
:::::: 51aa905c912385ee99791b2ced80646f37b9fe0a rtc: pic32: Add PIC32 real time clock driver

:::::: TO: Joshua Henderson <joshua.henderson@microchip.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
