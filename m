Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18613FF2
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRR8tsFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702121783; x=1733657783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSJxA8fXeXgH0Mrep5yueOkWGVEYSuX/dLuEVK9Lv40=;
  b=iRR8tsFxwI1MvXA5wRO5qRWYNafnOQ6d2EAe3D3VqWAPPzaWLMM39OFV
   HiHoIn5/Gd630kR7dmQ+bL2PQtC8jb8u0gjO3XLXUlGxmG7tMipESqxwA
   +m20OnRYHr6gP3BAwn4vqPHZQbWqMgeG/1MNWeVbbu05jsMtQs+3Xf9nq
   CiTYkH9obxZ8o7pcPqn50eL+KZYU+3z29yc5JGfCDeMHZh/7K2hoOTOHm
   pnNuHn8SyoHk8xXgviyUxJ1n2zKiqrTntnUbh0EXGZ3wyFZSk/89RPPA4
   uDwwZqINIXPTANTgDK9T+IqYYn6/xh7HvoCUt/oHGMa5N8KuL7SDz9oSo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="460979646"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="460979646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 03:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="863186579"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="863186579"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2023 03:36:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBvcy-000FIA-21;
	Sat, 09 Dec 2023 11:36:12 +0000
Date: Sat, 9 Dec 2023 19:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add driver support for
 DWMAC5 safety IRQ Support
Message-ID: <202312091949.GRIkVREF-lkp@intel.com>
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
In-Reply-To: <64edc073307ef9cb1bebf2c999cf2b5f56f3d906.1701939695.git.quic_jsuraj@quicinc.com>
References: <64edc073307ef9cb1bebf2c999cf2b5f56f3d906.1701939695.git.quic_jsuraj@quicinc.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-safety-IRQ-for-sa8775p/20231207-172835
base:   net-next/main
patch link:    https://lore.kernel.org/r/64edc073307ef9cb1bebf2c999cf2b5f56f3d906.1701939695.git.quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v4 3/3] net: stmmac: Add driver support for DWMAC5 safety IRQ Support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091949.GRIkVREF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091949.GRIkVREF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312091949.GRIkVREF-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3820 stmmac_request_irq_single() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3820.

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3757 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3757.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3757 stmmac_request_irq_multi_msi() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3757.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3757 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ce_irq' from request_irq() not released on lines: 3757.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3757 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ue_irq' from request_irq() not released on lines: 3757.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3757 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3757.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3820 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3820.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3820 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3820.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5566 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5578 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5604 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

vim +3820 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

8532f613bc78b6 Ong Boon Leong 2021-03-26  3759  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3760  static int stmmac_request_irq_single(struct net_device *dev)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3761  {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3762  	struct stmmac_priv *priv = netdev_priv(dev);
3e6dc7b650250f Wong Vee Khee  2021-06-11  3763  	enum request_irq_err irq_err;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3764  	int ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3765  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3766  	ret = request_irq(dev->irq, stmmac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3767  			  IRQF_SHARED, dev->name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3768  	if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3769  		netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3770  			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3771  			   __func__, dev->irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3772  		irq_err = REQ_IRQ_ERR_MAC;
3e6dc7b650250f Wong Vee Khee  2021-06-11  3773  		goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3774  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3775  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3776  	/* Request the Wake IRQ in case of another line
8532f613bc78b6 Ong Boon Leong 2021-03-26  3777  	 * is used for WoL
8532f613bc78b6 Ong Boon Leong 2021-03-26  3778  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3779  	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3780  		ret = request_irq(priv->wol_irq, stmmac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3781  				  IRQF_SHARED, dev->name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3782  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3783  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3784  				   "%s: ERROR: allocating the WoL IRQ %d (%d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3785  				   __func__, priv->wol_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3786  			irq_err = REQ_IRQ_ERR_WOL;
3e6dc7b650250f Wong Vee Khee  2021-06-11  3787  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3788  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3789  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3790  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3791  	/* Request the IRQ lines */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3792  	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3793  		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3794  				  IRQF_SHARED, dev->name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3795  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3796  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3797  				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3798  				   __func__, priv->lpi_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3799  			irq_err = REQ_IRQ_ERR_LPI;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3800  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3801  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3802  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3803  
6d021ebe71062e Suraj Jaiswal  2023-12-07  3804  	if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq) {
6d021ebe71062e Suraj Jaiswal  2023-12-07  3805  		ret = request_irq(priv->safety_common_irq, stmmac_safety_interrupt,
6d021ebe71062e Suraj Jaiswal  2023-12-07  3806  				  0, "safety", dev);
6d021ebe71062e Suraj Jaiswal  2023-12-07  3807  		if (unlikely(ret < 0)) {
6d021ebe71062e Suraj Jaiswal  2023-12-07  3808  			netdev_err(priv->dev,
6d021ebe71062e Suraj Jaiswal  2023-12-07  3809  				   "%s: alloc safety failed %d (error: %d)\n",
6d021ebe71062e Suraj Jaiswal  2023-12-07  3810  				   __func__, priv->safety_common_irq, ret);
6d021ebe71062e Suraj Jaiswal  2023-12-07  3811  			irq_err = REQ_IRQ_ERR_SAFETY;
6d021ebe71062e Suraj Jaiswal  2023-12-07  3812  			goto irq_error;
6d021ebe71062e Suraj Jaiswal  2023-12-07  3813  		}
6d021ebe71062e Suraj Jaiswal  2023-12-07  3814  	}
6d021ebe71062e Suraj Jaiswal  2023-12-07  3815  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3816  	return 0;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3817  
8532f613bc78b6 Ong Boon Leong 2021-03-26  3818  irq_error:
8532f613bc78b6 Ong Boon Leong 2021-03-26  3819  	stmmac_free_irq(dev, irq_err, 0);
8532f613bc78b6 Ong Boon Leong 2021-03-26 @3820  	return ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3821  }
8532f613bc78b6 Ong Boon Leong 2021-03-26  3822  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
