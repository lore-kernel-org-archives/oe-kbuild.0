Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8C2C80
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 16:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694104436; x=1725640436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esnBVOr3H26S9BOZM6pNw0pTLO/ZpppguMhN+Qkf37g=;
  b=bSWvqL5N58WdHBaMMA3fH/6SpNrLhySVuuvArKZ7wy+phqO1m3boSS9Q
   TbRfRCnoEcVUmG4DMlIhBM4vyrHVfH7hs8YFVLMuIUF4PfcMfpuA5g6i6
   ITOZRB9f+nKWZgTby0p2wfcSX7AzBPb01iVymvhWsQ57EWXzybb4AJJfp
   lHKbW0/LHBmkvCB1OgWwojERbf8QlVOVYoTQdFaGV7qgfCaXv+tA2Xewz
   1uyN6YhIVGlAXgS9aS9GJgg7uBqXT1nrtdT+aCYS2KeudSCkUbKWRccSz
   C5Zzq4rc7n/7F/cA2fCRV8X0I79Rf12Ocns9Wif/RA+oGaNR7nzeeKYMi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367659785"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="367659785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 09:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="691859210"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="691859210"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2023 09:32:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeHvR-0001NX-33;
	Thu, 07 Sep 2023 16:32:13 +0000
Date: Fri, 8 Sep 2023 00:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y 45/107] drivers/media/i2c/ds90ub960.c:1780
 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
Message-ID: <202309080024.9FjHTyqa-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Jai Luthra <j-luthra@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   6c7b09058d06625c8386decb5573da65e3c4ccfc
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080024.9FjHTyqa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080024.9FjHTyqa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309080024.9FjHTyqa-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.

vim +/pll_div +1780 drivers/media/i2c/ds90ub960.c

cf0136753f9892 Tomi Valkeinen 2023-05-09  1749  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1750  static int ub960_init_tx_ports(struct ub960_data *priv)
cf0136753f9892 Tomi Valkeinen 2023-05-09  1751  {
cf0136753f9892 Tomi Valkeinen 2023-05-09  1752  	unsigned int nport;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1753  	u8 speed_select;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1754  	u8 pll_div;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1755  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1756  	/* TX ports */
cf0136753f9892 Tomi Valkeinen 2023-05-09  1757  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1758  	switch (priv->tx_data_rate) {
cf0136753f9892 Tomi Valkeinen 2023-05-09  1759  	case MHZ(1600):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1760  	default:
cf0136753f9892 Tomi Valkeinen 2023-05-09  1761  		speed_select = 0;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1762  		pll_div = 0x10;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1763  		break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1764  	case MHZ(1200):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1765  		speed_select = 1;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1766  		break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1767  	case MHZ(800):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1768  		speed_select = 2;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1769  		pll_div = 0x10;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1770  		break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1771  	case MHZ(400):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1772  		speed_select = 3;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1773  		pll_div = 0x10;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1774  		break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1775  	}
cf0136753f9892 Tomi Valkeinen 2023-05-09  1776  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1777  	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1778  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1779  	if (priv->hw_data->is_ub9702) {
cf0136753f9892 Tomi Valkeinen 2023-05-09 @1780  		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1781  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1782  		switch (priv->tx_data_rate) {
cf0136753f9892 Tomi Valkeinen 2023-05-09  1783  		case MHZ(1600):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1784  		default:
cf0136753f9892 Tomi Valkeinen 2023-05-09  1785  			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1786  			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1787  			break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1788  		case MHZ(800):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1789  			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1790  			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1791  			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1792  			break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1793  		case MHZ(400):
cf0136753f9892 Tomi Valkeinen 2023-05-09  1794  			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1795  			break;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1796  		}
cf0136753f9892 Tomi Valkeinen 2023-05-09  1797  	}
cf0136753f9892 Tomi Valkeinen 2023-05-09  1798  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1799  	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
cf0136753f9892 Tomi Valkeinen 2023-05-09  1800  		struct ub960_txport *txport = priv->txports[nport];
cf0136753f9892 Tomi Valkeinen 2023-05-09  1801  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1802  		if (!txport)
cf0136753f9892 Tomi Valkeinen 2023-05-09  1803  			continue;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1804  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1805  		ub960_init_tx_port(priv, txport);
cf0136753f9892 Tomi Valkeinen 2023-05-09  1806  	}
cf0136753f9892 Tomi Valkeinen 2023-05-09  1807  
cf0136753f9892 Tomi Valkeinen 2023-05-09  1808  	return 0;
cf0136753f9892 Tomi Valkeinen 2023-05-09  1809  }
cf0136753f9892 Tomi Valkeinen 2023-05-09  1810  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
