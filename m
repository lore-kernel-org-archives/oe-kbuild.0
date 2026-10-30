Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371606;
	b=x6fDLgNbiQGSr7BJ6FsQ1jkaUP4yieHEBAr6R/co7bjaloatWkWPeN/RXUZH8Be9+3pQ
	 tRG7CP8ed2poJyD3T3WyviUEaQvnhuR2OdvmgA/aEklKssaRRfJkhKJITe9Fb5q7+MHQ+
	 fw87sSM/Zd/5ZTAYfgLhqGrSY82h8BdblKmxJc1lsgq0vEN1jmSsXGFzNYCFjYbq6YKuX
	 hUn95Ay9IqV8F/xkAl0NhLTaMRVX2Fs5GWT6N5XYkAuhEkMXSWxGqLV0HFz3V4daE+Msr
	 5NkxFrWWqjUD5G/6A9qbop4q3A4+9CMixBkbQAGJG0e2zU+U+pcb3f6tvecAJmFYrDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371606;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+Amp3u7mPlnrK8MqCB4y9sZajOxgpRrJxPFEWy1mzEs=;
	b=gkOIjI1yF5neXYBF5Nt27hUdCx5Sqq3ZYXGC8iQ25jKNKHSOVe2zonpluFz5NzMkmh4s
	 HWgMB4/24/CbuYq3U3wbvFAUd0lfsW9pRAvz6HSo0lOPFfKfkfDxAsXk44y0NUo/awvso
	 PKeMjuFjPWunVomdoctdbpbrIzCb0usDbwKEVWNRpk25rxXdfE+kNVhvwAb6VjuMzsgQ+
	 W59XyxT7PVodoLSua/ml7aFdRU5spvi1cX+tSiW14b49kSjX6NaiHHhk3dvMBgm7mN4FS
	 TpKCmqhNcAiOr5FqTl+DAajfPJIjmc4QbkyL/6eceuxFBeoISxGG0FJGtCbC3A0OTTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HnnibVxB;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA54606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Oct 2026 14:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HnnibVxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793371603; x=1824907603;
  h=date:from:to:cc:subject:message-id;
  bh=sV0Evs3epZH1m9uBRbUg12SGGs/Dy4CXBNJnIzKouss=;
  b=HnnibVxBI1+a5a6N2L7dRZD/I+9ayrMm+PuTZB/ZayTXnflroDQV6aqI
   ReDc6JGUsWMk5wB4SHhlopjQQeADlJW4Rq2pKTyJp4ZpCMtnj1b+JJ0Oy
   KBUhnePz9QTtnGiQF8jkpEm6MHezfgOIKuPi26aHKECHS8W9TX4kikAIj
   3a+CyWlzhEhokszVsDgg3eDq0ZwlQ+LxZHV7ITYHn1Mlo8jHA39mLgldx
   UO3MpG0I4SpSnytncDPYzZWjtIQAQLvQxWWSxeeGtgC39dO4wic2DOIBo
   NPJZrOgVDCrMu2NyW5jA5t8sCvVpYwjOVkMiF/8CWr1cJGszVMebw+yMR
   Q==;
X-CSE-ConnectionGUID: gZ4Yo8qlRZ2GJz52tFwkqw==
X-CSE-MsgGUID: Awc+Emm/QvyRkD4Wqm1bfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2150018"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2150018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 07:46:43 -0700
X-CSE-ConnectionGUID: f5abmnovR22QzyVsjLdHzg==
X-CSE-MsgGUID: WsXnvQRxRkOD/852WUKcTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5856497"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2026 07:46:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMnsN-000000005bn-32je;
	Fri, 30 Oct 2026 14:46:39 +0000
Date: Fri, 30 Oct 2026 15:45:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/clk/renesas/rzg2l-cpg.c:1222:52-58: opportunity for
 str_enable_disable(enable)
Message-ID: <202610301526.XkacnSyK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d89e1d186ec9271bf78e62771779e9fc03bf0fc3
commit: 78db1faa6b681da20ec167268b28778ebb0f98b7 clk: renesas: rzg2l: Add support for enabling PLLs
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-r2109-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301526.XkacnSyK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 78db1faa6b68 ("clk: renesas: rzg2l: Add support for enabling PLLs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610301526.XkacnSyK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/rzg2l-cpg.c:1222:52-58: opportunity for str_enable_disable(enable)

vim +1222 drivers/clk/renesas/rzg2l-cpg.c

78db1faa6b681d Biju Das 2026-03-26  1195  
78db1faa6b681d Biju Das 2026-03-26  1196  static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
78db1faa6b681d Biju Das 2026-03-26  1197  {
78db1faa6b681d Biju Das 2026-03-26  1198  	struct pll_clk *pll_clk = to_pll(hw);
78db1faa6b681d Biju Das 2026-03-26  1199  	struct rzg2l_cpg_priv *priv = pll_clk->priv;
78db1faa6b681d Biju Das 2026-03-26  1200  	u32 stby_offset, mon_offset;
78db1faa6b681d Biju Das 2026-03-26  1201  	u32 val, mon_val;
78db1faa6b681d Biju Das 2026-03-26  1202  	int ret;
78db1faa6b681d Biju Das 2026-03-26  1203  
78db1faa6b681d Biju Das 2026-03-26  1204  	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
78db1faa6b681d Biju Das 2026-03-26  1205  	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
78db1faa6b681d Biju Das 2026-03-26  1206  
78db1faa6b681d Biju Das 2026-03-26  1207  	if (enable) {
78db1faa6b681d Biju Das 2026-03-26  1208  		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
78db1faa6b681d Biju Das 2026-03-26  1209  		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
78db1faa6b681d Biju Das 2026-03-26  1210  	} else {
78db1faa6b681d Biju Das 2026-03-26  1211  		val = RZG3L_PLL_STBY_RESETB_WEN;
78db1faa6b681d Biju Das 2026-03-26  1212  		mon_val = 0;
78db1faa6b681d Biju Das 2026-03-26  1213  	}
78db1faa6b681d Biju Das 2026-03-26  1214  
78db1faa6b681d Biju Das 2026-03-26  1215  	writel(val, priv->base + stby_offset);
78db1faa6b681d Biju Das 2026-03-26  1216  
78db1faa6b681d Biju Das 2026-03-26  1217  	/* ensure PLL is in normal/standby mode */
78db1faa6b681d Biju Das 2026-03-26  1218  	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
78db1faa6b681d Biju Das 2026-03-26  1219  					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
78db1faa6b681d Biju Das 2026-03-26  1220  					10, 100);
78db1faa6b681d Biju Das 2026-03-26  1221  	if (ret)
78db1faa6b681d Biju Das 2026-03-26 @1222  		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
78db1faa6b681d Biju Das 2026-03-26  1223  			"enable" : "disable", stby_offset, hw->clk);
78db1faa6b681d Biju Das 2026-03-26  1224  
78db1faa6b681d Biju Das 2026-03-26  1225  	return ret;
78db1faa6b681d Biju Das 2026-03-26  1226  }
78db1faa6b681d Biju Das 2026-03-26  1227  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
