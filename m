Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C612B86
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Dec 2023 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALsuOCzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703048599; x=1734584599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B04IswVCH0tOjnrMkHjlB/m+UvmxyqZVvH3kJ3QXkks=;
  b=ALsuOCzfUaJ+iNMFZgzH1lfiES3Sy+3XK/9dVltGescRHEJPjHgNsZcE
   E4mL5NpAv7dmqvn1BWFjF30ggXuDPE1o+CFw3+W0b6f0jFO5aLjQrFuKO
   CXhWbt8x8ed7Ej5UAYoDITgUxOaQKxLqw3CTU+JDHttu9JlpaFx0LGiyH
   /0AgHLgSUCD54Afe4wiG7ZLDVruAEcOirmsjCp3G1V806vlXdsB0g8omr
   qH2LeSKjaZ30SP68Jckj025D0gjIgOFq2cJxXNi7hKXrg+9QR8/vMd5pa
   I8mymFGMVKSHvRLiRGMekasYkrx9e8NBsKOpJ1oSrBSjz3sFn0cwyvY0m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9225781"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="9225781"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 21:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="846591885"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="846591885"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Dec 2023 21:03:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFojh-0006Ps-0L;
	Wed, 20 Dec 2023 05:03:13 +0000
Date: Wed, 20 Dec 2023 13:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: Add driver support for
 DWMAC5 common safety IRQ
Message-ID: <202312201246.JxtJzQ4h-lkp@intel.com>
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
In-Reply-To: <20231219104815.3443231-4-quic_jsuraj@quicinc.com>
References: <20231219104815.3443231-4-quic_jsuraj@quicinc.com>
TO: Suraj Jaiswal <quic_jsuraj@quicinc.com>
TO: quic_jsuraj@quicinc.com
TO: Vinod Koul <vkoul@kernel.org>
TO: Bhupesh Sharma <bhupesh.sharma@linaro.org>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Jose Abreu <joabreu@synopsys.com>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-stm32@st-md-mailman.stormreply.com
TO: Prasad Sodagudi <psodagud@quicinc.com>
TO: Andrew Halaney <ahalaney@redhat.com>
CC: kernel@quicinc.com

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-safety-IRQ-for-sa8775p/20231219-185350
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231219104815.3443231-4-quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v7 3/3] net: stmmac: Add driver support for DWMAC5 common safety IRQ
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: powerpc64-randconfig-r071-20231220 (https://download.01.org/0day-ci/archive/20231220/202312201246.JxtJzQ4h-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312201246.JxtJzQ4h-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3773 stmmac_request_irq_multi_msi() warn: 'priv->sfty_irq' from request_irq() not released on lines: 3773.

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3773 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3773.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3773 stmmac_request_irq_multi_msi() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3773.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3773 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ce_irq' from request_irq() not released on lines: 3773.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3773 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ue_irq' from request_irq() not released on lines: 3773.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3773 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3773.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3839 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3839.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3839 stmmac_request_irq_single() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3839.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3839 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3839.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5585 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5597 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5623 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

vim +3773 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

8532f613bc78b6 Ong Boon Leong    2021-03-26  3608  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3609  static int stmmac_request_irq_multi_msi(struct net_device *dev)
8532f613bc78b6 Ong Boon Leong    2021-03-26  3610  {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3611  	struct stmmac_priv *priv = netdev_priv(dev);
3e6dc7b650250f Wong Vee Khee     2021-06-11  3612  	enum request_irq_err irq_err;
8deec94c6040bb Ong Boon Leong    2021-04-01  3613  	cpumask_t cpu_mask;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3614  	int irq_idx = 0;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3615  	char *int_name;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3616  	int ret;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3617  	int i;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3618  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3619  	/* For common interrupt */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3620  	int_name = priv->int_name_mac;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3621  	sprintf(int_name, "%s:%s", dev->name, "mac");
8532f613bc78b6 Ong Boon Leong    2021-03-26  3622  	ret = request_irq(dev->irq, stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3623  			  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3624  	if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3625  		netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3626  			   "%s: alloc mac MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3627  			   __func__, dev->irq, ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3628  		irq_err = REQ_IRQ_ERR_MAC;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3629  		goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3630  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3631  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3632  	/* Request the Wake IRQ in case of another line
8532f613bc78b6 Ong Boon Leong    2021-03-26  3633  	 * is used for WoL
8532f613bc78b6 Ong Boon Leong    2021-03-26  3634  	 */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3635  	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3636  		int_name = priv->int_name_wol;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3637  		sprintf(int_name, "%s:%s", dev->name, "wol");
8532f613bc78b6 Ong Boon Leong    2021-03-26  3638  		ret = request_irq(priv->wol_irq,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3639  				  stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3640  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3641  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3642  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3643  				   "%s: alloc wol MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3644  				   __func__, priv->wol_irq, ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3645  			irq_err = REQ_IRQ_ERR_WOL;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3646  			goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3647  		}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3648  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3649  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3650  	/* Request the LPI IRQ in case of another line
8532f613bc78b6 Ong Boon Leong    2021-03-26  3651  	 * is used for LPI
8532f613bc78b6 Ong Boon Leong    2021-03-26  3652  	 */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3653  	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3654  		int_name = priv->int_name_lpi;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3655  		sprintf(int_name, "%s:%s", dev->name, "lpi");
8532f613bc78b6 Ong Boon Leong    2021-03-26  3656  		ret = request_irq(priv->lpi_irq,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3657  				  stmmac_mac_interrupt,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3658  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3659  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3660  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3661  				   "%s: alloc lpi MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3662  				   __func__, priv->lpi_irq, ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3663  			irq_err = REQ_IRQ_ERR_LPI;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3664  			goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3665  		}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3666  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3667  
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3668  	/* Request the common Safety Feature Correctible/Uncorrectible
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3669  	 * Error line in case of another line is used
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3670  	 */
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3671  	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3672  		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3673  				  0, dev->name, dev);
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3674  		if (unlikely(ret < 0)) {
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3675  			netdev_err(priv->dev,
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3676  				   "%s: alloc safety failed %d (error: %d)\n",
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3677  				   __func__, priv->sfty_irq, ret);
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3678  			irq_err = REQ_IRQ_ERR_SFTY;
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3679  			goto irq_error;
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3680  		}
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3681  	}
d7f6913a94fce7 Suraj Jaiswal     2023-12-19  3682  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3683  	/* Request the Safety Feature Correctible Error line in
8532f613bc78b6 Ong Boon Leong    2021-03-26  3684  	 * case of another line is used
8532f613bc78b6 Ong Boon Leong    2021-03-26  3685  	 */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3686  	if (priv->sfty_ce_irq > 0 && priv->sfty_ce_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3687  		int_name = priv->int_name_sfty_ce;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3688  		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
8532f613bc78b6 Ong Boon Leong    2021-03-26  3689  		ret = request_irq(priv->sfty_ce_irq,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3690  				  stmmac_safety_interrupt,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3691  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3692  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3693  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3694  				   "%s: alloc sfty ce MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3695  				   __func__, priv->sfty_ce_irq, ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3696  			irq_err = REQ_IRQ_ERR_SFTY_CE;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3697  			goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3698  		}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3699  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3700  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3701  	/* Request the Safety Feature Uncorrectible Error line in
8532f613bc78b6 Ong Boon Leong    2021-03-26  3702  	 * case of another line is used
8532f613bc78b6 Ong Boon Leong    2021-03-26  3703  	 */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3704  	if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3705  		int_name = priv->int_name_sfty_ue;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3706  		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
8532f613bc78b6 Ong Boon Leong    2021-03-26  3707  		ret = request_irq(priv->sfty_ue_irq,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3708  				  stmmac_safety_interrupt,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3709  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3710  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3711  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3712  				   "%s: alloc sfty ue MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3713  				   __func__, priv->sfty_ue_irq, ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3714  			irq_err = REQ_IRQ_ERR_SFTY_UE;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3715  			goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3716  		}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3717  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3718  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3719  	/* Request Rx MSI irq */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3720  	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
d68c2e1d19c540 Arnd Bergmann     2021-09-27  3721  		if (i >= MTL_MAX_RX_QUEUES)
3e0d5699a97571 Arnd Bergmann     2021-09-27  3722  			break;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3723  		if (priv->rx_irq[i] == 0)
8532f613bc78b6 Ong Boon Leong    2021-03-26  3724  			continue;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3725  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3726  		int_name = priv->int_name_rx_irq[i];
8532f613bc78b6 Ong Boon Leong    2021-03-26  3727  		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3728  		ret = request_irq(priv->rx_irq[i],
8532f613bc78b6 Ong Boon Leong    2021-03-26  3729  				  stmmac_msi_intr_rx,
8531c80800c10e Christian Marangi 2022-07-23  3730  				  0, int_name, &priv->dma_conf.rx_queue[i]);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3731  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3732  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3733  				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3734  				   __func__, i, priv->rx_irq[i], ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3735  			irq_err = REQ_IRQ_ERR_RX;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3736  			irq_idx = i;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3737  			goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3738  		}
8deec94c6040bb Ong Boon Leong    2021-04-01  3739  		cpumask_clear(&cpu_mask);
8deec94c6040bb Ong Boon Leong    2021-04-01  3740  		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
8deec94c6040bb Ong Boon Leong    2021-04-01  3741  		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3742  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3743  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3744  	/* Request Tx MSI irq */
8532f613bc78b6 Ong Boon Leong    2021-03-26  3745  	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
d68c2e1d19c540 Arnd Bergmann     2021-09-27  3746  		if (i >= MTL_MAX_TX_QUEUES)
3e0d5699a97571 Arnd Bergmann     2021-09-27  3747  			break;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3748  		if (priv->tx_irq[i] == 0)
8532f613bc78b6 Ong Boon Leong    2021-03-26  3749  			continue;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3750  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3751  		int_name = priv->int_name_tx_irq[i];
8532f613bc78b6 Ong Boon Leong    2021-03-26  3752  		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3753  		ret = request_irq(priv->tx_irq[i],
8532f613bc78b6 Ong Boon Leong    2021-03-26  3754  				  stmmac_msi_intr_tx,
8531c80800c10e Christian Marangi 2022-07-23  3755  				  0, int_name, &priv->dma_conf.tx_queue[i]);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3756  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong    2021-03-26  3757  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong    2021-03-26  3758  				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong    2021-03-26  3759  				   __func__, i, priv->tx_irq[i], ret);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3760  			irq_err = REQ_IRQ_ERR_TX;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3761  			irq_idx = i;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3762  			goto irq_error;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3763  		}
8deec94c6040bb Ong Boon Leong    2021-04-01  3764  		cpumask_clear(&cpu_mask);
8deec94c6040bb Ong Boon Leong    2021-04-01  3765  		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
8deec94c6040bb Ong Boon Leong    2021-04-01  3766  		irq_set_affinity_hint(priv->tx_irq[i], &cpu_mask);
8532f613bc78b6 Ong Boon Leong    2021-03-26  3767  	}
8532f613bc78b6 Ong Boon Leong    2021-03-26  3768  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3769  	return 0;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3770  
8532f613bc78b6 Ong Boon Leong    2021-03-26  3771  irq_error:
8532f613bc78b6 Ong Boon Leong    2021-03-26  3772  	stmmac_free_irq(dev, irq_err, irq_idx);
8532f613bc78b6 Ong Boon Leong    2021-03-26 @3773  	return ret;
8532f613bc78b6 Ong Boon Leong    2021-03-26  3774  }
8532f613bc78b6 Ong Boon Leong    2021-03-26  3775  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
