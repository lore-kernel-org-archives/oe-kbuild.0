Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F61B041C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756758; cv=none; b=SJmiebZ8yE4zcAr/maIlXhCC4G9bi52Hz1yNLMSjJ/2DdgE6HUSArAkvqzxlDHWPNo83KCo8loi6ahVD+/Ua98dIzmdryY78jKRBwsrbxGkFVJfaj51lW7cuGBxbEVoL1lP19bCSQkCRzsXn+OUSU2zqf83CBB+5PXQ5EMi5/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756758; c=relaxed/simple;
	bh=bfs2vx0bRljjl8m7sF4B39+qsK5Aw9N/pWr3cLoFtp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5n0kGjlSoSJiQMgzL4wxvX1tyDF9tdQpzh2m7MZJgGN+SW0espZK0pacDflhaXHo9SmLxdulPWzlaItzYLqXBw5mAG1b5choWO7iFr06Os7XkMMCuZKq8SGaZs3Gxec3HT2iYTJxEuR1mPfH4tuHm9jdz4BA4+GAwROUp0dx4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFyJk6VR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFyJk6VR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733756755; x=1765292755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bfs2vx0bRljjl8m7sF4B39+qsK5Aw9N/pWr3cLoFtp4=;
  b=VFyJk6VRvqk6EeQdgWDyw+tyNGOPbB7SMW7/tMjioXnIuj41aA+WS8CU
   DabBeJRphUI7ot/NbTSHJ6QPyzOpFYCy6b9Lx81hYRH8UigtU4icRSrk3
   hSvwQ4a2iP3CxRXXZAbctpV2hXEj8LcFe1Hq3ONlGo4/aMApBkdEpv5Lt
   RjF2Uv0QKD0LO3kemtmlCYsMCJDbc64fXcr5WZi7ZhfPA7xf7k0E/H0lX
   pAi/cLiw8PhJDfbFdWWisEIHajMSnlgk1K2rDXTV+wKsLZEI6v7KE0CIB
   y/aNSzgbUwFToMsIX6e54J+Vq2V2IfUQ5NWpym5yUioFn/7Sudyn+bxv+
   Q==;
X-CSE-ConnectionGUID: 83olkDtAQhuQSXHQ5oDbqg==
X-CSE-MsgGUID: cvLigI+oStyMmZkIUzTzmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51477096"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="51477096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 07:05:54 -0800
X-CSE-ConnectionGUID: fXMTb51SS2qsgB1lFfhE9w==
X-CSE-MsgGUID: 6gUQoeV+RkCsVHY4zVAJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="100143734"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2024 07:05:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKfKY-0004Tw-0D;
	Mon, 09 Dec 2024 15:05:50 +0000
Date: Mon, 9 Dec 2024 23:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/thunderbolt/usb4.c:221:4-8: opportunity for str_yes_no(tbt3)
Message-ID: <202412092309.9WyxMQKd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Mika,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 690ac0d20d4022bb3c7d84e0e3760eb40aa8028d thunderbolt: Update Kconfig entries to USB4
date:   5 years ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-101-20241111 (https://download.01.org/0day-ci/archive/20241209/202412092309.9WyxMQKd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412092309.9WyxMQKd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/usb4.c:221:4-8: opportunity for str_yes_no(tbt3)
>> drivers/thunderbolt/usb4.c:221:25-29: opportunity for str_yes_no(xhci)

vim +221 drivers/thunderbolt/usb4.c

b04079837b2094 Mika Westerberg 2019-12-17  191  
b04079837b2094 Mika Westerberg 2019-12-17  192  /**
b04079837b2094 Mika Westerberg 2019-12-17  193   * usb4_switch_setup() - Additional setup for USB4 device
b04079837b2094 Mika Westerberg 2019-12-17  194   * @sw: USB4 router to setup
b04079837b2094 Mika Westerberg 2019-12-17  195   *
b04079837b2094 Mika Westerberg 2019-12-17  196   * USB4 routers need additional settings in order to enable all the
b04079837b2094 Mika Westerberg 2019-12-17  197   * tunneling. This function enables USB and PCIe tunneling if it can be
b04079837b2094 Mika Westerberg 2019-12-17  198   * enabled (e.g the parent switch also supports them). If USB tunneling
b04079837b2094 Mika Westerberg 2019-12-17  199   * is not available for some reason (like that there is Thunderbolt 3
b04079837b2094 Mika Westerberg 2019-12-17  200   * switch upstream) then the internal xHCI controller is enabled
b04079837b2094 Mika Westerberg 2019-12-17  201   * instead.
b04079837b2094 Mika Westerberg 2019-12-17  202   */
b04079837b2094 Mika Westerberg 2019-12-17  203  int usb4_switch_setup(struct tb_switch *sw)
b04079837b2094 Mika Westerberg 2019-12-17  204  {
b04079837b2094 Mika Westerberg 2019-12-17  205  	struct tb_switch *parent;
b04079837b2094 Mika Westerberg 2019-12-17  206  	bool tbt3, xhci;
b04079837b2094 Mika Westerberg 2019-12-17  207  	u32 val = 0;
b04079837b2094 Mika Westerberg 2019-12-17  208  	int ret;
b04079837b2094 Mika Westerberg 2019-12-17  209  
b04079837b2094 Mika Westerberg 2019-12-17  210  	if (!tb_route(sw))
b04079837b2094 Mika Westerberg 2019-12-17  211  		return 0;
b04079837b2094 Mika Westerberg 2019-12-17  212  
b04079837b2094 Mika Westerberg 2019-12-17  213  	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_6, 1);
b04079837b2094 Mika Westerberg 2019-12-17  214  	if (ret)
b04079837b2094 Mika Westerberg 2019-12-17  215  		return ret;
b04079837b2094 Mika Westerberg 2019-12-17  216  
b04079837b2094 Mika Westerberg 2019-12-17  217  	xhci = val & ROUTER_CS_6_HCI;
b04079837b2094 Mika Westerberg 2019-12-17  218  	tbt3 = !(val & ROUTER_CS_6_TNS);
b04079837b2094 Mika Westerberg 2019-12-17  219  
b04079837b2094 Mika Westerberg 2019-12-17  220  	tb_sw_dbg(sw, "TBT3 support: %s, xHCI: %s\n",
b04079837b2094 Mika Westerberg 2019-12-17 @221  		  tbt3 ? "yes" : "no", xhci ? "yes" : "no");
b04079837b2094 Mika Westerberg 2019-12-17  222  
b04079837b2094 Mika Westerberg 2019-12-17  223  	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
b04079837b2094 Mika Westerberg 2019-12-17  224  	if (ret)
b04079837b2094 Mika Westerberg 2019-12-17  225  		return ret;
b04079837b2094 Mika Westerberg 2019-12-17  226  
b04079837b2094 Mika Westerberg 2019-12-17  227  	parent = tb_switch_parent(sw);
b04079837b2094 Mika Westerberg 2019-12-17  228  
b04079837b2094 Mika Westerberg 2019-12-17  229  	/* Only enable PCIe tunneling if the parent router supports it */
b04079837b2094 Mika Westerberg 2019-12-17  230  	if (tb_switch_find_port(parent, TB_TYPE_PCIE_DOWN)) {
b04079837b2094 Mika Westerberg 2019-12-17  231  		val |= ROUTER_CS_5_PTO;
b04079837b2094 Mika Westerberg 2019-12-17  232  		/* xHCI can be enabled if PCIe tunneling is supported */
b04079837b2094 Mika Westerberg 2019-12-17  233  		if (xhci & ROUTER_CS_6_HCI)
b04079837b2094 Mika Westerberg 2019-12-17  234  			val |= ROUTER_CS_5_HCO;
b04079837b2094 Mika Westerberg 2019-12-17  235  	}
b04079837b2094 Mika Westerberg 2019-12-17  236  
b04079837b2094 Mika Westerberg 2019-12-17  237  	/* TBT3 supported by the CM */
b04079837b2094 Mika Westerberg 2019-12-17  238  	val |= ROUTER_CS_5_C3S;
b04079837b2094 Mika Westerberg 2019-12-17  239  	/* Tunneling configuration is ready now */
b04079837b2094 Mika Westerberg 2019-12-17  240  	val |= ROUTER_CS_5_CV;
b04079837b2094 Mika Westerberg 2019-12-17  241  
b04079837b2094 Mika Westerberg 2019-12-17  242  	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
b04079837b2094 Mika Westerberg 2019-12-17  243  	if (ret)
b04079837b2094 Mika Westerberg 2019-12-17  244  		return ret;
b04079837b2094 Mika Westerberg 2019-12-17  245  
b04079837b2094 Mika Westerberg 2019-12-17  246  	return usb4_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_CR,
b04079837b2094 Mika Westerberg 2019-12-17  247  					ROUTER_CS_6_CR, 50);
b04079837b2094 Mika Westerberg 2019-12-17  248  }
b04079837b2094 Mika Westerberg 2019-12-17  249  

:::::: The code at line 221 was first introduced by commit
:::::: b04079837b2094f09e145676eec4b9a56ae8a6aa thunderbolt: Add initial support for USB4

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
