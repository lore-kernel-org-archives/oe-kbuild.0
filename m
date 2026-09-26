Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70700235C01
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790391907; cv=none; b=q2VQygPCGUk/mx8czQ4yYkKxKXFSD1YS2IkgwOXJegsld/xHa1bba8Cibx+JE/XplrCjUM4eYXFxyUuD9GHaws5gP7GE1v079IT7FRfzSBqiBajYtKuW7WZp+6v1g45F1ZrO1cdv924jf5HflaQBy72ASS5V4pTb4brHtPr9l48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790391907; c=relaxed/simple;
	bh=zU5IPESNhpoDQEevuolFy/B7NX2Jt+kq4EJd74Dzvps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nZ7BNSV5qzrWuPRpByuhLrMvBaf+xRMzeVCWuQJNHuZxGH1o6zIDK5+wXRS8XDmLZUh4cDgWg4ykMMbNbB3o6RvjOUEQR7ds3jjXe1e5lY2oapwAGa8QhyjRPntERdzXbD3i2P5a+dG/x1wJrVSa4E58CC9MDqiIFQMHblWekhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh43mJ+y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh43mJ+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790391905; x=1821927905;
  h=date:from:to:cc:subject:message-id;
  bh=zU5IPESNhpoDQEevuolFy/B7NX2Jt+kq4EJd74Dzvps=;
  b=dh43mJ+yjtYIznWiDtWRTF+I+1xr41Q+QxgHEIGch57vL4nlTHVZqMG0
   5qNzuDB55t8eRq+rjINdEZ4JdlUD/bmbEr1pQT8GH/Ogq8ospr7v5WMK2
   LRKIESpgd/sdQovaxubTl1BH95XpCS5jVCSFN3l8JBRI6uGTtnJ6w2g+j
   clZRggW582KzH2T4l+paHKqTG0uUKl7doSOcMXcOp79O66hN2yVY3/iKX
   vTU5EltOOC8++bo0t5f6wPFp5vUB/4fyS1r+g8SuQYuUYp7WsJSH03MNw
   IuYtO2Xl63oQl4WrHqHaPnox/ZES5M6EGuy2bXhPNXE6aaXWt2CSbZ+yw
   Q==;
X-CSE-ConnectionGUID: MVCvnpehTi66sfDK7jWgNQ==
X-CSE-MsgGUID: eypeyMiwQzqp7k97//Aa+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94059076"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="94059076"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:05:04 -0700
X-CSE-ConnectionGUID: BrjfxkxXT7akVZx8FWf1DA==
X-CSE-MsgGUID: 6hhBsOuXRt2bWZrtbbdLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274058321"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2026 20:04:00 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAIhh-000000000BX-3ODQ;
	Sat, 26 Sep 2026 03:03:57 +0000
Date: Sat, 26 Sep 2026 05:03:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/rtc/rtc-pic32.c:249:41-47: opportunity for
 str_yes_no(repeat)
Message-ID: <202609260529.vI2i7Zlp-lkp@intel.com>
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
head:   6812ce4e4379ffc99c52401ec28f0d7ffbc36206
commit: 095a3e886dd250acc9ff692f8fcc296f0023a5c6 rtc: pic32: allow driver to be compiled with COMPILE_TEST
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r2101-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260529.vI2i7Zlp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 095a3e886dd2 ("rtc: pic32: allow driver to be compiled with COMPILE_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609260529.vI2i7Zlp-lkp@intel.com/

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
