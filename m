Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22C01350FD
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717531510; cv=none; b=ELkJMj1dNeRh8PdrvMyww1zo1baChJFqBiQCbgeXuKUUqfJoLqcpZSUNyO+2Lkx6RCzBmYu7qSm51vivheoEHJDvo5ULGiOO7wqLeA7reWZMp0hEWPDFb2VoZbn+vCYStpw5YVA3Qn5ynP1QyhCGFmL6iw1L+3HxAI71PKpHmNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717531510; c=relaxed/simple;
	bh=vCXnQyJ3vTNkE4irWp0eSEwMPj138zdiZ3KTzjVA9MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvMayI079zEeCZjRHli2tXR1gBjO3GKPT8eq+4B1Vcqwh97whkWEd3XoseF4G4D0xkoIye+C1DzaSiyaI/22Ug75gNJh/YqtssHDp2TXlVRMsO1eItC8hJguEze+VTfX3xdZ/ll51glnYLBIxnhTAmBKHmbQHNtu9BgEqLqQoaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZziXb5+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZziXb5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717531508; x=1749067508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCXnQyJ3vTNkE4irWp0eSEwMPj138zdiZ3KTzjVA9MU=;
  b=nZziXb5+K3naQSBPPLCU8zdxq22MqFXP1VzufFOCCbs/nTYA1OFqmspX
   b8L3pLqsZ5X8WOcR5xecGfDEvO2x/MlSkAQMitnJuHIGiUFkWfXhc9fmN
   5W97QyOFhFbR6pvwhsJCC0b5eoVPC+VbIY8IqtluKT/5qWndba6AmzD31
   IxjU34Hy/xelLdWYPCrM9Sa1t4Jpuc30nUTMkG5NVt5jp+HaYAc/1yOP0
   LDme9WV5XLUVpdpbgPM3soRL7CrCbdRmiUKve8HeGDkLaiHxmYNorwMth
   OyZLrlqLC9XXLm9DpFzYjuR3EAqFMBQ6hxzbZu21lAPj8YTUwM+wInxqe
   Q==;
X-CSE-ConnectionGUID: dO4KuTy9RFujxf7Se6ZsBg==
X-CSE-MsgGUID: TcyRjhOtRy2gWOrbmqbVnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="39512350"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="39512350"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 13:05:08 -0700
X-CSE-ConnectionGUID: bV0iScHQSfmUQ5cA8gEYgw==
X-CSE-MsgGUID: eLNc6QXKRQmEsxNCRbzOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37803965"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2024 13:05:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEaP0-0000Uk-2A;
	Tue, 04 Jun 2024 20:05:03 +0000
Date: Wed, 5 Jun 2024 04:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net v2 PATCH] net: stmmac: Update CBS parameters when speed
 changes after linking up
Message-ID: <202406050318.jsyBFsxx-lkp@intel.com>
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
In-Reply-To: <20240530061453.561708-1-xiaolei.wang@windriver.com>
References: <20240530061453.561708-1-xiaolei.wang@windriver.com>
TO: Xiaolei Wang <xiaolei.wang@windriver.com>
TO: linux@armlinux.org.uk
TO: alexandre.torgue@foss.st.com
TO: joabreu@synopsys.com
TO: andrew@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: mcoquelin.stm32@gmail.com
CC: netdev@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Xiaolei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaolei-Wang/net-stmmac-Update-CBS-parameters-when-speed-changes-after-linking-up/20240530-141843
base:   net/main
patch link:    https://lore.kernel.org/r/20240530061453.561708-1-xiaolei.wang%40windriver.com
patch subject: [net v2 PATCH] net: stmmac: Update CBS parameters when speed changes after linking up
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050318.jsyBFsxx-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406050318.jsyBFsxx-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3234 stmmac_configure_cbs() error: uninitialized symbol 'ptr'.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3234 stmmac_configure_cbs() error: uninitialized symbol 'speed_div'.

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3819 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3819.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3819 stmmac_request_irq_multi_msi() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3819.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3819 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ce_irq' from request_irq() not released on lines: 3819.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3819 stmmac_request_irq_multi_msi() warn: 'priv->sfty_irq' from request_irq() not released on lines: 3819.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3819 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ue_irq' from request_irq() not released on lines: 3819.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3819 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3819.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3885 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3885.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3885 stmmac_request_irq_single() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3885.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3885 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3885.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5669 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5681 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5707 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

vim +/ptr +3234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

6a3a7193b28115 Joao Pinto   2017-03-10  3187  
19d9187317979c Joao Pinto   2017-03-10  3188  /**
19d9187317979c Joao Pinto   2017-03-10  3189   *  stmmac_configure_cbs - Configure CBS in TX queue
19d9187317979c Joao Pinto   2017-03-10  3190   *  @priv: driver private structure
882212f550d669 Xiaolei Wang 2024-05-30  3191   *  Description: It is used for configuring CBS in AVB TX queues,
882212f550d669 Xiaolei Wang 2024-05-30  3192   *  and when the speed changes, update CBS parameters to reconfigure
19d9187317979c Joao Pinto   2017-03-10  3193   */
19d9187317979c Joao Pinto   2017-03-10  3194  static void stmmac_configure_cbs(struct stmmac_priv *priv)
19d9187317979c Joao Pinto   2017-03-10  3195  {
19d9187317979c Joao Pinto   2017-03-10  3196  	u32 tx_queues_count = priv->plat->tx_queues_to_use;
19d9187317979c Joao Pinto   2017-03-10  3197  	u32 mode_to_use;
19d9187317979c Joao Pinto   2017-03-10  3198  	u32 queue;
882212f550d669 Xiaolei Wang 2024-05-30  3199  	u32 ptr, speed_div;
882212f550d669 Xiaolei Wang 2024-05-30  3200  	u64 value;
882212f550d669 Xiaolei Wang 2024-05-30  3201  
882212f550d669 Xiaolei Wang 2024-05-30  3202  	/* Port Transmit Rate and Speed Divider */
882212f550d669 Xiaolei Wang 2024-05-30  3203  	switch (priv->speed) {
882212f550d669 Xiaolei Wang 2024-05-30  3204  	case SPEED_10000:
882212f550d669 Xiaolei Wang 2024-05-30  3205  		ptr = 32;
882212f550d669 Xiaolei Wang 2024-05-30  3206  		speed_div = 10000000;
882212f550d669 Xiaolei Wang 2024-05-30  3207  		break;
882212f550d669 Xiaolei Wang 2024-05-30  3208  	case SPEED_5000:
882212f550d669 Xiaolei Wang 2024-05-30  3209  		ptr = 32;
882212f550d669 Xiaolei Wang 2024-05-30  3210  		speed_div = 5000000;
882212f550d669 Xiaolei Wang 2024-05-30  3211  		break;
882212f550d669 Xiaolei Wang 2024-05-30  3212  	case SPEED_2500:
882212f550d669 Xiaolei Wang 2024-05-30  3213  		ptr = 8;
882212f550d669 Xiaolei Wang 2024-05-30  3214  		speed_div = 2500000;
882212f550d669 Xiaolei Wang 2024-05-30  3215  		break;
882212f550d669 Xiaolei Wang 2024-05-30  3216  	case SPEED_1000:
882212f550d669 Xiaolei Wang 2024-05-30  3217  		ptr = 8;
882212f550d669 Xiaolei Wang 2024-05-30  3218  		speed_div = 1000000;
882212f550d669 Xiaolei Wang 2024-05-30  3219  		break;
882212f550d669 Xiaolei Wang 2024-05-30  3220  	case SPEED_100:
882212f550d669 Xiaolei Wang 2024-05-30  3221  		ptr = 4;
882212f550d669 Xiaolei Wang 2024-05-30  3222  		speed_div = 100000;
882212f550d669 Xiaolei Wang 2024-05-30  3223  		break;
882212f550d669 Xiaolei Wang 2024-05-30  3224  	default:
882212f550d669 Xiaolei Wang 2024-05-30  3225  		netdev_dbg(priv->dev, "link speed is not known\n");
882212f550d669 Xiaolei Wang 2024-05-30  3226  	}
19d9187317979c Joao Pinto   2017-03-10  3227  
44781fef137896 Joao Pinto   2017-03-31  3228  	/* queue 0 is reserved for legacy traffic */
44781fef137896 Joao Pinto   2017-03-31  3229  	for (queue = 1; queue < tx_queues_count; queue++) {
19d9187317979c Joao Pinto   2017-03-10  3230  		mode_to_use = priv->plat->tx_queues_cfg[queue].mode_to_use;
19d9187317979c Joao Pinto   2017-03-10  3231  		if (mode_to_use == MTL_QUEUE_DCB)
19d9187317979c Joao Pinto   2017-03-10  3232  			continue;
19d9187317979c Joao Pinto   2017-03-10  3233  
882212f550d669 Xiaolei Wang 2024-05-30 @3234  		value = div_s64(priv->old_idleslope[queue] * 1024ll * ptr, speed_div);
882212f550d669 Xiaolei Wang 2024-05-30  3235  		priv->plat->tx_queues_cfg[queue].idle_slope = value & GENMASK(31, 0);
882212f550d669 Xiaolei Wang 2024-05-30  3236  
882212f550d669 Xiaolei Wang 2024-05-30  3237  		value = div_s64(-priv->old_sendslope[queue] * 1024ll * ptr, speed_div);
882212f550d669 Xiaolei Wang 2024-05-30  3238  		priv->plat->tx_queues_cfg[queue].send_slope = value & GENMASK(31, 0);
882212f550d669 Xiaolei Wang 2024-05-30  3239  
c10d4c82a5c84c Jose Abreu   2018-04-16  3240  		stmmac_config_cbs(priv, priv->hw,
19d9187317979c Joao Pinto   2017-03-10  3241  				priv->plat->tx_queues_cfg[queue].send_slope,
19d9187317979c Joao Pinto   2017-03-10  3242  				priv->plat->tx_queues_cfg[queue].idle_slope,
19d9187317979c Joao Pinto   2017-03-10  3243  				priv->plat->tx_queues_cfg[queue].high_credit,
19d9187317979c Joao Pinto   2017-03-10  3244  				priv->plat->tx_queues_cfg[queue].low_credit,
19d9187317979c Joao Pinto   2017-03-10  3245  				queue);
19d9187317979c Joao Pinto   2017-03-10  3246  	}
19d9187317979c Joao Pinto   2017-03-10  3247  }
19d9187317979c Joao Pinto   2017-03-10  3248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
