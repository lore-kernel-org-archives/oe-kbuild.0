Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123843;
	b=dI2jC1VBcPEdbLotvkOgiunk+CyQCbz5vwWd+qgnMuyPqdj2P4sQePBxOdQDthr/mOyZ
	 5UyO60kwe3lVYWoAALrtG4yDbl7wet+Wtct8j0Yprjp6HX86vBt57fRqrAgYTYHRZqO0I
	 z+EAcRfAGccGIcru6D3GegfiSqnV0/lV7k/ZGaTrvJjEK/HCbjSi6kcip+8t3Sp1xeXQR
	 KUz/yI9jmcTSS7fCPcHcsH3vmE/r4lzMPMJr6VUYMwgp5IkL/mEuB3FhG7COGJBh7Zx2s
	 BwQDxtu5ndAIwQclXpGlQRoZStegMLN/1QawETraememB09Ycr4arn9bi85iN2NfLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123843;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3L59WCD2hqrbdAeZu/lWC26cvdHytavEIlO+UGeBY/4=;
	b=G/SeJ9oA20eVgBPuMjxFAtsOiWp8DhJpDAg6ALyCflis8qMq/p24J9oX+BFLMWIZAKTJ
	 TJ7FF9b4YfzRmjUiNCHNIWw+nQMcOx0HuHKVOdkkxESRMAKrKsBXi7IGb5hVF7006Mpr9
	 0s0Zmb75ewobM7+8ZPgme3wG1PNDPnoMyQ4hDMpGqgsPyGHxGNN3uzhA2bQI/WOd3CyDy
	 JfJTrA/ywgrlEh5fAZC3b9LXnep9IHy+/hqFkwHBG7HYdAuX9CpIpUfPfR+1cYeg4J0c+
	 n4hePdklTb2yS8d86gDz8TGYJ4OIXVtkYdXHTTgMp5TXxwMbdI9tPDcYqElldq1lFtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FyZqlGxN;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA5606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 07:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FyZqlGxN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794123842; x=1825659842;
  h=date:from:to:cc:subject:message-id;
  bh=vZWIzWQKtOUe8FI/s23N8htPu8bPxMAd4fgNua4riWs=;
  b=FyZqlGxNO67I1r0qvCxGGlqAyoAGD5iHKOsfevcVrfTn/Wf7LfPl6I1d
   Wkc14n4jML/hgGqsspif/0CDQrSB41hCZt0RD3X1B17cFglEVc5QG/hl9
   8AV268wuujCq47OJzWUlJws7yGZVbkj6HZyUnVIAkyzRycdpdNLju5beu
   Yd1bsWRnCC4mdlPKdXWcDVeyJ4Cf4OI//qU9cKMSkqtth90XUPSmZY2bI
   hE943BUmRi9aoSF3D9qTnucNLiIjGlMVKr9X1BkWPplkOVQs5ndmXTMWG
   FpHFijzSIj/pIstwlALfd5Esmt0f+gbU/2eVdaIMzGfMdRVvbqR778WTv
   w==;
X-CSE-ConnectionGUID: gbrhvyXMTaO7dQZfz4T5Yw==
X-CSE-MsgGUID: xt2LPS1YRp20XA/VQoBk/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2908760"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2908760"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 23:44:02 -0800
X-CSE-ConnectionGUID: z694oO3jSoelEW/1NVB0aA==
X-CSE-MsgGUID: 6eXQCTfzTRiI7WPiJ8c8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7645430"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2026 23:44:00 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPxZG-00000000BAX-3KlK;
	Sun, 08 Nov 2026 07:43:58 +0000
Date: Sun, 08 Nov 2026 08:43:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:7.3-main 154/154]
 drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap
 on line 135 and execution via conditional on line 176
Message-ID: <202611080805.nBIlS11v-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-main
head:   933c2827bb87dddc6074db77c90f8c3b965e13f5
commit: 4185b7abd09088ac0bedf86a4c281036299feb3c [154/154] net: phy: mtk-2p5ge: extend priv for firmware loading
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r2100-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080805.nBIlS11v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611080805.nBIlS11v-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap on line 135 and execution via conditional on line 176
   drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap on line 140 and execution via conditional on line 176
   drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap on line 147 and execution via conditional on line 176
   drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap on line 154 and execution via conditional on line 176
   drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap on line 161 and execution via conditional on line 176
   drivers/net/phy/mediatek/mtk-2p5ge.c:177:2-8: ERROR: missing iounmap; ioremap on line 168 and execution via conditional on line 176

vim +177 drivers/net/phy/mediatek/mtk-2p5ge.c

26948c2430412b Sky Huang        2025-05-16  116  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  117  static int mt7987_2p5ge_phy_load_fw(struct phy_device *phydev)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  118  {
4185b7abd09088 Frank Wunderlich 2025-10-09  119  	struct mtk_socphy_priv *priv = phydev->priv;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  120  	struct device *dev = &phydev->mdio.dev;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  121  	void __iomem *xbz_pcs_reg_base;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  122  	void __iomem *xbz_pma_rx_base;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  123  	void __iomem *chip_scu_base;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  124  	void __iomem *pmd_reg_base;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  125  	void __iomem *mcu_csr_base;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  126  	const struct firmware *fw;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  127  	void __iomem *apb_base;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  128  	void __iomem *pmb_addr;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  129  	int ret, i;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  130  	u32 reg;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  131  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  132  	if (priv->fw_loaded)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  133  		return 0;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  134  
2326b5d0e8afaa Frank Wunderlich 2025-10-09 @135  	apb_base = ioremap(MTK_2P5GPHY_APB_BASE,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  136  			   MTK_2P5GPHY_APB_LEN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  137  	if (!apb_base)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  138  		return -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  139  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  140  	pmd_reg_base = ioremap(MTK_2P5GPHY_PMD_REG_BASE,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  141  			       MTK_2P5GPHY_PMD_REG_LEN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  142  	if (!pmd_reg_base) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  143  		ret = -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  144  		goto free_apb;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  145  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  146  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  147  	xbz_pcs_reg_base = ioremap(MTK_2P5GPHY_XBZ_PCS_REG_BASE,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  148  				   MTK_2P5GPHY_XBZ_PCS_REG_LEN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  149  	if (!xbz_pcs_reg_base) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  150  		ret = -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  151  		goto free_pmd;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  152  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  153  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  154  	xbz_pma_rx_base = ioremap(MTK_2P5GPHY_XBZ_PMA_RX_BASE,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  155  				  MTK_2P5GPHY_XBZ_PMA_RX_LEN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  156  	if (!xbz_pma_rx_base) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  157  		ret = -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  158  		goto free_pcs;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  159  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  160  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  161  	chip_scu_base = ioremap(MTK_2P5GPHY_CHIP_SCU_BASE,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  162  				MTK_2P5GPHY_CHIP_SCU_LEN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  163  	if (!chip_scu_base) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  164  		ret = -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  165  		goto free_pma;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  166  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  167  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  168  	mcu_csr_base = ioremap(MTK_2P5GPHY_MCU_CSR_BASE,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  169  			       MTK_2P5GPHY_MCU_CSR_LEN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  170  	if (!mcu_csr_base) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  171  		ret = -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  172  		goto free_chip_scu;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  173  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  174  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  175  	pmb_addr = ioremap(MTK_2P5GPHY_PMB_FW_BASE, MT7987_2P5GE_PMB_FW_SIZE);
2326b5d0e8afaa Frank Wunderlich 2025-10-09 @176  	if (!pmb_addr) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09 @177  		return -ENOMEM;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  178  		goto free_mcu_csr;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  179  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  180  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  181  	ret = request_firmware(&fw, MT7987_2P5GE_PMB_FW, dev);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  182  	if (ret) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  183  		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
2326b5d0e8afaa Frank Wunderlich 2025-10-09  184  			MT7987_2P5GE_PMB_FW, ret);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  185  		goto free_pmb_addr;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  186  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  187  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  188  	if (fw->size != MT7987_2P5GE_PMB_FW_SIZE) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  189  		dev_err(dev, "PMb firmware size 0x%zx != 0x%x\n",
2326b5d0e8afaa Frank Wunderlich 2025-10-09  190  			fw->size, MT7987_2P5GE_PMB_FW_SIZE);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  191  		ret = -EINVAL;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  192  		goto release_fw;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  193  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  194  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  195  	/* Force 2.5Gphy back to AN state */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  196  	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  197  	usleep_range(5000, 6000);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  198  	phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  199  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  200  	reg = readw(apb_base + SW_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  201  	writew(reg & ~MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  202  	writew(reg | MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  203  	writew(reg & ~MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  204  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  205  	reg = readw(mcu_csr_base + MD32_EN_CFG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  206  	writew(reg & ~MD32_EN, mcu_csr_base + MD32_EN_CFG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  207  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  208  	for (i = 0; i < MT7987_2P5GE_PMB_FW_SIZE - 1; i += 4)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  209  		writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  210  	dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
2326b5d0e8afaa Frank Wunderlich 2025-10-09  211  		 be16_to_cpu(*((__be16 *)(fw->data +
2326b5d0e8afaa Frank Wunderlich 2025-10-09  212  					  MT7987_2P5GE_PMB_FW_SIZE - 8))),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  213  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 6),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  214  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 5),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  215  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 2),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  216  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 1));
2326b5d0e8afaa Frank Wunderlich 2025-10-09  217  	release_firmware(fw);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  218  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  219  	/* Enable 100Mbps module clock. */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  220  	writel(FIELD_PREP(RG_SPEED_MASK, RG_SPEED_100),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  221  	       pmd_reg_base + FNPLL_PWR_CTRL1);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  222  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  223  	/* Check if 100Mbps module clock is ready. */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  224  	ret = readl_poll_timeout(pmd_reg_base + FNPLL_PWR_CTRL_STATUS, reg,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  225  				 reg & RG_SPEED_100_STABLE, 1, 10000);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  226  	if (ret)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  227  		dev_err(dev, "Fail to enable 100Mbps module clock: %d\n", ret);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  228  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  229  	/* Enable 2.5Gbps module clock. */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  230  	writel(FIELD_PREP(RG_SPEED_MASK, RG_SPEED_2500),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  231  	       pmd_reg_base + FNPLL_PWR_CTRL1);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  232  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  233  	/* Check if 2.5Gbps module clock is ready. */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  234  	ret = readl_poll_timeout(pmd_reg_base + FNPLL_PWR_CTRL_STATUS, reg,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  235  				 reg & RG_SPEED_2500_STABLE, 1, 10000);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  236  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  237  	if (ret)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  238  		dev_err(dev, "Fail to enable 2.5Gbps module clock: %d\n", ret);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  239  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  240  	/* Disable AN */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  241  	phy_clear_bits(phydev, MII_BMCR, BMCR_ANENABLE);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  242  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  243  	/* Force to run at 2.5G speed */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  244  	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_AN_FORCE_SPEED_REG,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  245  		       MTK_PHY_MASTER_FORCE_SPEED_SEL_MASK,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  246  		       MTK_PHY_MASTER_FORCE_SPEED_SEL_EN |
2326b5d0e8afaa Frank Wunderlich 2025-10-09  247  		       FIELD_PREP(MTK_PHY_MASTER_FORCE_SPEED_SEL_MASK, 0x1b));
2326b5d0e8afaa Frank Wunderlich 2025-10-09  248  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  249  	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_RELATED,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  250  			 MTK_PHY_BYPASS_LINK_STATUS_OK |
2326b5d0e8afaa Frank Wunderlich 2025-10-09  251  			 MTK_PHY_FORCE_LINK_STATUS_HCD);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  252  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  253  	/* Set xbz, pma and rx as "do not reset" in order to input DSP code. */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  254  	reg = readl(pmd_reg_base + DO_NOT_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  255  	reg |= DO_NOT_RESET_XBZ | DO_NOT_RESET_PMA | DO_NOT_RESET_RX;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  256  	writel(reg, pmd_reg_base + DO_NOT_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  257  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  258  	reg = readl(chip_scu_base + SYS_SW_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  259  	writel(reg & ~RESET_RST_CNT, chip_scu_base + SYS_SW_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  260  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  261  	writel(WRITE_PROTECT_KEY, xbz_pcs_reg_base + PMU_WP);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  262  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  263  	reg = readl(xbz_pcs_reg_base + PMU_PMA_AUTO_CFG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  264  	reg |= PMU_AUTO_MODE_EN | POWER_ON_AUTO_MODE;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  265  	writel(reg, xbz_pcs_reg_base + PMU_PMA_AUTO_CFG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  266  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  267  	/* Check if clock in auto mode is disabled. */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  268  	ret = readl_poll_timeout(xbz_pcs_reg_base + PMU_PMA_STATUS, reg,
2326b5d0e8afaa Frank Wunderlich 2025-10-09  269  				 (reg & CLK_IS_DISABLED) == 0x0, 1, 100000);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  270  	if (ret)
2326b5d0e8afaa Frank Wunderlich 2025-10-09  271  		dev_err(dev, "Clock isn't disabled in auto mode: %d\n", ret);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  272  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  273  	reg = readl(xbz_pma_rx_base + SMEM_CTRL);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  274  	writel(reg | SMEM_HW_RDATA_ZERO, xbz_pma_rx_base + SMEM_CTRL);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  275  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  276  	reg = readl(xbz_pcs_reg_base + PHY_CTRL_CONFIG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  277  	writel(reg | BIT(16), xbz_pcs_reg_base + PHY_CTRL_CONFIG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  278  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  279  	/* Initialize data memory */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  280  	reg = readl(xbz_pma_rx_base + DM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  281  	writel(reg | BIT(28), xbz_pma_rx_base + DM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  282  	reg = readl(xbz_pma_rx_base + DM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  283  	writel(reg | BIT(28), xbz_pma_rx_base + DM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  284  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  285  	/* Initialize coefficient memory */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  286  	reg = readl(xbz_pma_rx_base + CM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  287  	writel(reg | BIT(28), xbz_pma_rx_base + CM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  288  	reg = readl(xbz_pma_rx_base + CM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  289  	writel(reg | BIT(28), xbz_pma_rx_base + CM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  290  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  291  	/* Initilize PM offset */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  292  	writel(0, xbz_pma_rx_base + SMEM_ADDR_REF_ADDR);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  293  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  294  	ret = request_firmware(&fw, MT7987_2P5GE_DSPBITTB, dev);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  295  	if (ret) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  296  		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
2326b5d0e8afaa Frank Wunderlich 2025-10-09  297  			MT7987_2P5GE_DSPBITTB, ret);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  298  		goto free_pmb_addr;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  299  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  300  	if (fw->size != MT7987_2P5GE_DSPBITTB_SIZE) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  301  		dev_err(dev, "DSPBITTB size 0x%zx != 0x%x\n",
2326b5d0e8afaa Frank Wunderlich 2025-10-09  302  			fw->size, MT7987_2P5GE_DSPBITTB_SIZE);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  303  		ret = -EINVAL;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  304  		goto release_fw;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  305  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  306  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  307  	for (i = 0; i < fw->size - 1; i += 16) {
2326b5d0e8afaa Frank Wunderlich 2025-10-09  308  		writel(*((uint32_t *)(fw->data + i)),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  309  		       xbz_pma_rx_base + SMEM_WDAT0);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  310  		writel(*((uint32_t *)(fw->data + i + 0x4)),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  311  		       xbz_pma_rx_base + SMEM_WDAT1);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  312  		writel(*((uint32_t *)(fw->data + i + 0x8)),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  313  		       xbz_pma_rx_base + SMEM_WDAT2);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  314  		writel(*((uint32_t *)(fw->data + i + 0xc)),
2326b5d0e8afaa Frank Wunderlich 2025-10-09  315  		       xbz_pma_rx_base + SMEM_WDAT3);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  316  	}
2326b5d0e8afaa Frank Wunderlich 2025-10-09  317  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  318  	reg = readl(xbz_pma_rx_base + DM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  319  	writel(reg & ~BIT(28), xbz_pma_rx_base + DM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  320  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  321  	reg = readl(xbz_pma_rx_base + DM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  322  	writel(reg & ~BIT(28), xbz_pma_rx_base + DM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  323  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  324  	reg = readl(xbz_pma_rx_base + CM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  325  	writel(reg & ~BIT(28), xbz_pma_rx_base + CM_CTRL_P01);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  326  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  327  	reg = readl(xbz_pma_rx_base + CM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  328  	writel(reg & ~BIT(28), xbz_pma_rx_base + CM_CTRL_P23);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  329  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  330  	reg = readw(mcu_csr_base + MD32_EN_CFG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  331  	writew(reg | MD32_EN, mcu_csr_base + MD32_EN_CFG);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  332  	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  333  	/* We need a delay here to stabilize initialization of MCU */
2326b5d0e8afaa Frank Wunderlich 2025-10-09  334  	usleep_range(7000, 8000);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  335  	dev_info(dev, "Firmware loading/trigger ok.\n");
2326b5d0e8afaa Frank Wunderlich 2025-10-09  336  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  337  	priv->fw_loaded = true;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  338  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  339  release_fw:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  340  	release_firmware(fw);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  341  free_pmb_addr:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  342  	iounmap(pmb_addr);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  343  free_mcu_csr:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  344  	iounmap(mcu_csr_base);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  345  free_chip_scu:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  346  	iounmap(chip_scu_base);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  347  free_pma:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  348  	iounmap(xbz_pma_rx_base);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  349  free_pcs:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  350  	iounmap(xbz_pcs_reg_base);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  351  free_pmd:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  352  	iounmap(pmd_reg_base);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  353  free_apb:
2326b5d0e8afaa Frank Wunderlich 2025-10-09  354  	iounmap(apb_base);
2326b5d0e8afaa Frank Wunderlich 2025-10-09  355  
2326b5d0e8afaa Frank Wunderlich 2025-10-09  356  	return ret;
2326b5d0e8afaa Frank Wunderlich 2025-10-09  357  }
2326b5d0e8afaa Frank Wunderlich 2025-10-09  358  

:::::: The code at line 177 was first introduced by commit
:::::: 2326b5d0e8afaa36d2ea1e63ca09208dc81f43dd net: phy: mtk-2p5ge: add support for mt7987

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
