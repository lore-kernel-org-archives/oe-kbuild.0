Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC73C3C
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 02:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731290838; cv=none; b=Bom8WrNZ2XDhcmi5AsB1Ar2VFrOb/iNFaQeqwUXKnrFdYAxu0lwdGINc/ufqBt1jhAWp/TVpVT0aPNVAsLJzTwlX6zC9qmx6kprQ2+9T0iDL0HDXni/+D6WNHNjRo+W31QX4D91vUHVywhe1ZGusn3+Fn7LPBGmwYCdIgjP794Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731290838; c=relaxed/simple;
	bh=bS0fNfBjfwbSc+2RfE0gq0x63ULm/MDVlezS+Z+4txY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfaMTsCsiuqHfSW8PXRGIDlxIvJ/TsZk4R3dCfFOkKBnS9V3I1FiBPYMJz9iR1XOsfziC/yN+HVeGNcBTMZK9ZphfaeeRCeAjHk6fBajymgCctfI/ILA5ne/ImYM74GIPD/gZdP9lsnLjPUo4SIg6NEoJ3MdCkfGAIAQiMrpCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ldi2sbJh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ldi2sbJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731290836; x=1762826836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bS0fNfBjfwbSc+2RfE0gq0x63ULm/MDVlezS+Z+4txY=;
  b=Ldi2sbJhSVXg27b0WY3JZcBjTO2HGFnpjVMGOqRiDXfL0T/NL4JhYilL
   ZbSu06zi/1SONuZYhqAJKPNjxX+gz4keWipwZvI+HB4jKwLWhGA7Fd3ER
   2NqP7yh5d0EJ0m4zkTKpbAGGoxQRIsBAqT2oR2dZdb6rAAYYnb1WFnTr1
   muZDRE+vXw+wun/Uj1yXWeg0y4Szj/UZXrQYln3zczYkKYWiFsS7wSPzw
   aH+sIjjW5TB4kUvtbYnY5FJdReVwKOAD0YQDdfAdw3M4Xhdtsn1xFHZWE
   1/K7MP39YVKCenINs+xLetRYAntAVGWWnhmf7GxWjZxpP6AnzKc1IWpjF
   Q==;
X-CSE-ConnectionGUID: s3qIDay0QYK3CxR+RXKRIw==
X-CSE-MsgGUID: rPPEYmEHQaSAbQfcnQk42w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30503826"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30503826"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 18:07:16 -0800
X-CSE-ConnectionGUID: L9WxTSpCQe6JjUApj3oi4w==
X-CSE-MsgGUID: 0w/xdzjzQJC9+Q4wOtJ/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="109969567"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Nov 2024 18:07:14 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAJpg-0000YG-0P;
	Mon, 11 Nov 2024 02:07:12 +0000
Date: Mon, 11 Nov 2024 10:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of
 tx_clk handling routines
Message-ID: <202411110911.fxtHBKSw-lkp@intel.com>
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
In-Reply-To: <20241108173334.2973603-1-mordan@ispras.ru>
References: <20241108173334.2973603-1-mordan@ispras.ru>
TO: Vitalii Mordan <mordan@ispras.ru>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Vitalii Mordan <mordan@ispras.ru>
CC: Jose Abreu <joabreu@synopsys.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: netdev@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: lvc-project@linuxtesting.org
CC: Fedor Pchelkin <pchelkin@ispras.ru>
CC: Alexey Khoroshilov <khoroshilov@ispras.ru>
CC: Vadim Mutilin <mutilin@ispras.ru>

Hi Vitalii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitalii-Mordan/stmmac-dwmac-intel-plat-fix-call-balance-of-tx_clk-handling-routines/20241109-013647
base:   net/main
patch link:    https://lore.kernel.org/r/20241108173334.2973603-1-mordan%40ispras.ru
patch subject: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of tx_clk handling routines
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r071-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110911.fxtHBKSw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411110911.fxtHBKSw-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c:163 intel_eth_plat_probe() error: we previously assumed 'dwmac->data' could be null (see line 101)

vim +163 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c

9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   74  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   75  static int intel_eth_plat_probe(struct platform_device *pdev)
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   76  {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   77  	struct plat_stmmacenet_data *plat_dat;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   78  	struct stmmac_resources stmmac_res;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   79  	struct intel_dwmac *dwmac;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   80  	unsigned long rate;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   81  	int ret;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   82  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   83  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   84  	if (ret)
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   85  		return ret;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   86  
abea8fd5e801a6 Jisheng Zhang        2023-09-16   87  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   88  	if (IS_ERR(plat_dat)) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   89  		dev_err(&pdev->dev, "dt configuration failed\n");
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   90  		return PTR_ERR(plat_dat);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   91  	}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   92  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   93  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
abea8fd5e801a6 Jisheng Zhang        2023-09-16   94  	if (!dwmac)
abea8fd5e801a6 Jisheng Zhang        2023-09-16   95  		return -ENOMEM;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   96  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   97  	dwmac->dev = &pdev->dev;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   98  	dwmac->tx_clk = NULL;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   99  
b0377116decdee Rob Herring          2023-10-09  100  	dwmac->data = device_get_match_data(&pdev->dev);
b0377116decdee Rob Herring          2023-10-09 @101  	if (dwmac->data) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  102  		if (dwmac->data->fix_mac_speed)
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  103  			plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  104  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  105  		/* Enable TX clock */
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  106  		if (dwmac->data->tx_clk_en) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  107  			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
abea8fd5e801a6 Jisheng Zhang        2023-09-16  108  			if (IS_ERR(dwmac->tx_clk))
abea8fd5e801a6 Jisheng Zhang        2023-09-16  109  				return PTR_ERR(dwmac->tx_clk);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  110  
bd8cfad17c9530 Vitalii Mordan       2024-11-08  111  			ret = clk_prepare_enable(dwmac->tx_clk);
bd8cfad17c9530 Vitalii Mordan       2024-11-08  112  			if (ret) {
bd8cfad17c9530 Vitalii Mordan       2024-11-08  113  				dev_err(&pdev->dev,
bd8cfad17c9530 Vitalii Mordan       2024-11-08  114  					"Failed to enable tx_clk\n");
bd8cfad17c9530 Vitalii Mordan       2024-11-08  115  				return ret;
bd8cfad17c9530 Vitalii Mordan       2024-11-08  116  			}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  117  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  118  			/* Check and configure TX clock rate */
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  119  			rate = clk_get_rate(dwmac->tx_clk);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  120  			if (dwmac->data->tx_clk_rate &&
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  121  			    rate != dwmac->data->tx_clk_rate) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  122  				rate = dwmac->data->tx_clk_rate;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  123  				ret = clk_set_rate(dwmac->tx_clk, rate);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  124  				if (ret) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  125  					dev_err(&pdev->dev,
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  126  						"Failed to set tx_clk\n");
bd8cfad17c9530 Vitalii Mordan       2024-11-08  127  					goto err_tx_clk_disable;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  128  				}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  129  			}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  130  		}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  131  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  132  		/* Check and configure PTP ref clock rate */
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  133  		rate = clk_get_rate(plat_dat->clk_ptp_ref);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  134  		if (dwmac->data->ptp_ref_clk_rate &&
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  135  		    rate != dwmac->data->ptp_ref_clk_rate) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  136  			rate = dwmac->data->ptp_ref_clk_rate;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  137  			ret = clk_set_rate(plat_dat->clk_ptp_ref, rate);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  138  			if (ret) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  139  				dev_err(&pdev->dev,
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  140  					"Failed to set clk_ptp_ref\n");
bd8cfad17c9530 Vitalii Mordan       2024-11-08  141  				goto err_tx_clk_disable;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  142  			}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  143  		}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  144  	}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  145  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  146  	plat_dat->bsp_priv = dwmac;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  147  	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  148  
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  149  	if (plat_dat->eee_usecs_rate > 0) {
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  150  		u32 tx_lpi_usec;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  151  
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  152  		tx_lpi_usec = (plat_dat->eee_usecs_rate / 1000000) - 1;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  153  		writel(tx_lpi_usec, stmmac_res.addr + GMAC_1US_TIC_COUNTER);
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  154  	}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  155  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  156  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
bd8cfad17c9530 Vitalii Mordan       2024-11-08  157  	if (ret)
bd8cfad17c9530 Vitalii Mordan       2024-11-08  158  		goto err_tx_clk_disable;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  159  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  160  	return 0;
bd8cfad17c9530 Vitalii Mordan       2024-11-08  161  
bd8cfad17c9530 Vitalii Mordan       2024-11-08  162  err_tx_clk_disable:
bd8cfad17c9530 Vitalii Mordan       2024-11-08 @163  	if (dwmac->data->tx_clk_en)
bd8cfad17c9530 Vitalii Mordan       2024-11-08  164  		clk_disable_unprepare(dwmac->tx_clk);
bd8cfad17c9530 Vitalii Mordan       2024-11-08  165  	return ret;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  166  }
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
