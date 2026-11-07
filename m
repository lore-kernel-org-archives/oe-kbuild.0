Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794086468;
	b=1YPj5dg1c7HzvDgE2Vkhy22CqwEgEE5MDPht8YmBjMFdFzm63yG9tfxdB8QpGveyhlFW
	 IhNrzFgHtm32Jfvs9s6ZGdVAOsMNS6uDdXdghC3zGlTd7bu9d/sxpXB5jTpgT4iS5FU2N
	 PI1SLI6vjqr41vSoSFevdm6iN39VxpOA/l4Hm9lnjgvg+AmkMEgnwVV4GguFhM1eHdEbg
	 8K5zXKnGA3ma0dtvYoOE60B3unqiBS0ZzEs8yAOOHMlZ6HtshWxwEuu6emqS+y4RJ7vvm
	 KnzgnkNsV/LoQALlte5KLqljv6CYgXPCa3Yz+WuYuJGHMuHyhZUXszWttjkt5eFw0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086468;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=67YDwfaW74b1O/+h3tY6MVeJ3KUZFcmSpwGvJ+g0/oM=;
	b=G+mu4FA07FlZ2CeTBBFOKypzeU55Re22jRVyDRv7C1TJGN2sYkhyq6d/hGp+gtGdTYc4
	 FSF+SmuiXUa+A16ZZTzQNzcPdVh+alDubL1tw6UqEjxjh6Xo6vrQTE9aDfLSLQpTRBfy5
	 4355xfZMH6kVMjBjQLfMPIJMGzEy0hEbNx3VQX67wNmhEdiX3CZK1jrWMFXSksPJNvSOE
	 lwcQwsqBY6kliUq6+cwDdjKAVXxPHJUF/x9lPqcDlq0HHfPchzDiltjlk9DwB0SabLPWe
	 q2A79rnlPonzh1vfaCx2Eh6BN1ftPKkA97eURupbxOniRxLgR5DgNoyhojUXOBUvB1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KLTfQelU;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB0606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 21:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FDB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KLTfQelU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794086465; x=1825622465;
  h=date:from:to:cc:subject:message-id;
  bh=XeupXyu2mrU5+Ml9gMH0mPMyb8jQ4WgGgLHyDHr1hO8=;
  b=KLTfQelUUqk3GUIe0hU6sscqliXiKw1aTxHHaBNDI/U3afipZwToBjbE
   0c6JLS2NfHF6oCeeHaYvuTPWpfDIVBOFtI3EyTGyw3MZp4wX3+KwdeAXk
   x1cofe6ubXXmPiQzRwxqb3xvBzD2/c55Nn57RI4UfoGsY2QPikd2AbL4L
   QU1wNqO/lDtkaKY+iB0P9Zts8cHMDe8MyAYrUqbhnoHtpCoEjS0zBsHlq
   eDUrLO1FCtQqfRxkS9cwMD4dN+FiVUgKWtoyLQhpYE1RRdt4ljITQuAOM
   YplxPdMZOkFo47iAlbzjDk7YqeVOa32e8CdKM+iRlkwvxvOo9LpoJcubx
   A==;
X-CSE-ConnectionGUID: N67MKwOBR6WbZI50sA52DQ==
X-CSE-MsgGUID: s0G3cHTUQwKuSZJjjcfViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2858949"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2858949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 13:21:04 -0800
X-CSE-ConnectionGUID: o+hb4YsfT/OywtnVGc1rGg==
X-CSE-MsgGUID: YI6ssMRST2+FlaB84goxvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7888430"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2026 13:21:03 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPnqN-00000000AnH-48x6;
	Sat, 07 Nov 2026 21:20:59 +0000
Date: Sat, 07 Nov 2026 22:20:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:7.4-rc 120/154]
 drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn:
 'apb_base' from ioremap() not released on lines: 177.
Message-ID: <202611072240.CeYrxv6G-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: b749f2f10701adacb70f0231da1e7a031435856c [120/154] net: phy: mtk-2p5ge: extend priv for firmware loading
:::::: branch date: 6 hours ago
:::::: commit date: 8 hours ago
config: xtensa-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072240.CeYrxv6G-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611072240.CeYrxv6G-lkp@intel.com/

smatch warnings:
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'apb_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'chip_scu_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'mcu_csr_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'pmd_reg_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'xbz_pcs_reg_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'xbz_pma_rx_base' from ioremap() not released on lines: 177.

vim +/apb_base +356 drivers/net/phy/mediatek/mtk-2p5ge.c

26948c2430412b Sky Huang        2025-05-16  116  
b1b0e07f073671 Frank Wunderlich 2025-10-09  117  static int mt7987_2p5ge_phy_load_fw(struct phy_device *phydev)
b1b0e07f073671 Frank Wunderlich 2025-10-09  118  {
b749f2f10701ad Frank Wunderlich 2025-10-09  119  	struct mtk_socphy_priv *priv = phydev->priv;
b1b0e07f073671 Frank Wunderlich 2025-10-09  120  	struct device *dev = &phydev->mdio.dev;
b1b0e07f073671 Frank Wunderlich 2025-10-09  121  	void __iomem *xbz_pcs_reg_base;
b1b0e07f073671 Frank Wunderlich 2025-10-09  122  	void __iomem *xbz_pma_rx_base;
b1b0e07f073671 Frank Wunderlich 2025-10-09  123  	void __iomem *chip_scu_base;
b1b0e07f073671 Frank Wunderlich 2025-10-09  124  	void __iomem *pmd_reg_base;
b1b0e07f073671 Frank Wunderlich 2025-10-09  125  	void __iomem *mcu_csr_base;
b1b0e07f073671 Frank Wunderlich 2025-10-09  126  	const struct firmware *fw;
b1b0e07f073671 Frank Wunderlich 2025-10-09  127  	void __iomem *apb_base;
b1b0e07f073671 Frank Wunderlich 2025-10-09  128  	void __iomem *pmb_addr;
b1b0e07f073671 Frank Wunderlich 2025-10-09  129  	int ret, i;
b1b0e07f073671 Frank Wunderlich 2025-10-09  130  	u32 reg;
b1b0e07f073671 Frank Wunderlich 2025-10-09  131  
b1b0e07f073671 Frank Wunderlich 2025-10-09  132  	if (priv->fw_loaded)
b1b0e07f073671 Frank Wunderlich 2025-10-09  133  		return 0;
b1b0e07f073671 Frank Wunderlich 2025-10-09  134  
b1b0e07f073671 Frank Wunderlich 2025-10-09  135  	apb_base = ioremap(MTK_2P5GPHY_APB_BASE,
b1b0e07f073671 Frank Wunderlich 2025-10-09  136  			   MTK_2P5GPHY_APB_LEN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  137  	if (!apb_base)
b1b0e07f073671 Frank Wunderlich 2025-10-09  138  		return -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  139  
b1b0e07f073671 Frank Wunderlich 2025-10-09  140  	pmd_reg_base = ioremap(MTK_2P5GPHY_PMD_REG_BASE,
b1b0e07f073671 Frank Wunderlich 2025-10-09  141  			       MTK_2P5GPHY_PMD_REG_LEN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  142  	if (!pmd_reg_base) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  143  		ret = -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  144  		goto free_apb;
b1b0e07f073671 Frank Wunderlich 2025-10-09  145  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  146  
b1b0e07f073671 Frank Wunderlich 2025-10-09  147  	xbz_pcs_reg_base = ioremap(MTK_2P5GPHY_XBZ_PCS_REG_BASE,
b1b0e07f073671 Frank Wunderlich 2025-10-09  148  				   MTK_2P5GPHY_XBZ_PCS_REG_LEN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  149  	if (!xbz_pcs_reg_base) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  150  		ret = -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  151  		goto free_pmd;
b1b0e07f073671 Frank Wunderlich 2025-10-09  152  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  153  
b1b0e07f073671 Frank Wunderlich 2025-10-09  154  	xbz_pma_rx_base = ioremap(MTK_2P5GPHY_XBZ_PMA_RX_BASE,
b1b0e07f073671 Frank Wunderlich 2025-10-09  155  				  MTK_2P5GPHY_XBZ_PMA_RX_LEN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  156  	if (!xbz_pma_rx_base) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  157  		ret = -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  158  		goto free_pcs;
b1b0e07f073671 Frank Wunderlich 2025-10-09  159  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  160  
b1b0e07f073671 Frank Wunderlich 2025-10-09  161  	chip_scu_base = ioremap(MTK_2P5GPHY_CHIP_SCU_BASE,
b1b0e07f073671 Frank Wunderlich 2025-10-09  162  				MTK_2P5GPHY_CHIP_SCU_LEN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  163  	if (!chip_scu_base) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  164  		ret = -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  165  		goto free_pma;
b1b0e07f073671 Frank Wunderlich 2025-10-09  166  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  167  
b1b0e07f073671 Frank Wunderlich 2025-10-09  168  	mcu_csr_base = ioremap(MTK_2P5GPHY_MCU_CSR_BASE,
b1b0e07f073671 Frank Wunderlich 2025-10-09  169  			       MTK_2P5GPHY_MCU_CSR_LEN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  170  	if (!mcu_csr_base) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  171  		ret = -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  172  		goto free_chip_scu;
b1b0e07f073671 Frank Wunderlich 2025-10-09  173  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  174  
b1b0e07f073671 Frank Wunderlich 2025-10-09  175  	pmb_addr = ioremap(MTK_2P5GPHY_PMB_FW_BASE, MT7987_2P5GE_PMB_FW_SIZE);
b1b0e07f073671 Frank Wunderlich 2025-10-09  176  	if (!pmb_addr) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  177  		return -ENOMEM;
b1b0e07f073671 Frank Wunderlich 2025-10-09  178  		goto free_mcu_csr;
b1b0e07f073671 Frank Wunderlich 2025-10-09  179  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  180  
b1b0e07f073671 Frank Wunderlich 2025-10-09  181  	ret = request_firmware(&fw, MT7987_2P5GE_PMB_FW, dev);
b1b0e07f073671 Frank Wunderlich 2025-10-09  182  	if (ret) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  183  		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
b1b0e07f073671 Frank Wunderlich 2025-10-09  184  			MT7987_2P5GE_PMB_FW, ret);
b1b0e07f073671 Frank Wunderlich 2025-10-09  185  		goto free_pmb_addr;
b1b0e07f073671 Frank Wunderlich 2025-10-09  186  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  187  
b1b0e07f073671 Frank Wunderlich 2025-10-09  188  	if (fw->size != MT7987_2P5GE_PMB_FW_SIZE) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  189  		dev_err(dev, "PMb firmware size 0x%zx != 0x%x\n",
b1b0e07f073671 Frank Wunderlich 2025-10-09  190  			fw->size, MT7987_2P5GE_PMB_FW_SIZE);
b1b0e07f073671 Frank Wunderlich 2025-10-09  191  		ret = -EINVAL;
b1b0e07f073671 Frank Wunderlich 2025-10-09  192  		goto release_fw;
b1b0e07f073671 Frank Wunderlich 2025-10-09  193  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  194  
b1b0e07f073671 Frank Wunderlich 2025-10-09  195  	/* Force 2.5Gphy back to AN state */
b1b0e07f073671 Frank Wunderlich 2025-10-09  196  	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  197  	usleep_range(5000, 6000);
b1b0e07f073671 Frank Wunderlich 2025-10-09  198  	phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
b1b0e07f073671 Frank Wunderlich 2025-10-09  199  
b1b0e07f073671 Frank Wunderlich 2025-10-09  200  	reg = readw(apb_base + SW_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  201  	writew(reg & ~MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  202  	writew(reg | MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  203  	writew(reg & ~MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  204  
b1b0e07f073671 Frank Wunderlich 2025-10-09  205  	reg = readw(mcu_csr_base + MD32_EN_CFG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  206  	writew(reg & ~MD32_EN, mcu_csr_base + MD32_EN_CFG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  207  
b1b0e07f073671 Frank Wunderlich 2025-10-09  208  	for (i = 0; i < MT7987_2P5GE_PMB_FW_SIZE - 1; i += 4)
b1b0e07f073671 Frank Wunderlich 2025-10-09  209  		writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
b1b0e07f073671 Frank Wunderlich 2025-10-09  210  	dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
b1b0e07f073671 Frank Wunderlich 2025-10-09  211  		 be16_to_cpu(*((__be16 *)(fw->data +
b1b0e07f073671 Frank Wunderlich 2025-10-09  212  					  MT7987_2P5GE_PMB_FW_SIZE - 8))),
b1b0e07f073671 Frank Wunderlich 2025-10-09  213  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 6),
b1b0e07f073671 Frank Wunderlich 2025-10-09  214  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 5),
b1b0e07f073671 Frank Wunderlich 2025-10-09  215  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 2),
b1b0e07f073671 Frank Wunderlich 2025-10-09  216  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 1));
b1b0e07f073671 Frank Wunderlich 2025-10-09  217  	release_firmware(fw);
b1b0e07f073671 Frank Wunderlich 2025-10-09  218  
b1b0e07f073671 Frank Wunderlich 2025-10-09  219  	/* Enable 100Mbps module clock. */
b1b0e07f073671 Frank Wunderlich 2025-10-09  220  	writel(FIELD_PREP(RG_SPEED_MASK, RG_SPEED_100),
b1b0e07f073671 Frank Wunderlich 2025-10-09  221  	       pmd_reg_base + FNPLL_PWR_CTRL1);
b1b0e07f073671 Frank Wunderlich 2025-10-09  222  
b1b0e07f073671 Frank Wunderlich 2025-10-09  223  	/* Check if 100Mbps module clock is ready. */
b1b0e07f073671 Frank Wunderlich 2025-10-09  224  	ret = readl_poll_timeout(pmd_reg_base + FNPLL_PWR_CTRL_STATUS, reg,
b1b0e07f073671 Frank Wunderlich 2025-10-09  225  				 reg & RG_SPEED_100_STABLE, 1, 10000);
b1b0e07f073671 Frank Wunderlich 2025-10-09  226  	if (ret)
b1b0e07f073671 Frank Wunderlich 2025-10-09  227  		dev_err(dev, "Fail to enable 100Mbps module clock: %d\n", ret);
b1b0e07f073671 Frank Wunderlich 2025-10-09  228  
b1b0e07f073671 Frank Wunderlich 2025-10-09  229  	/* Enable 2.5Gbps module clock. */
b1b0e07f073671 Frank Wunderlich 2025-10-09  230  	writel(FIELD_PREP(RG_SPEED_MASK, RG_SPEED_2500),
b1b0e07f073671 Frank Wunderlich 2025-10-09  231  	       pmd_reg_base + FNPLL_PWR_CTRL1);
b1b0e07f073671 Frank Wunderlich 2025-10-09  232  
b1b0e07f073671 Frank Wunderlich 2025-10-09  233  	/* Check if 2.5Gbps module clock is ready. */
b1b0e07f073671 Frank Wunderlich 2025-10-09  234  	ret = readl_poll_timeout(pmd_reg_base + FNPLL_PWR_CTRL_STATUS, reg,
b1b0e07f073671 Frank Wunderlich 2025-10-09  235  				 reg & RG_SPEED_2500_STABLE, 1, 10000);
b1b0e07f073671 Frank Wunderlich 2025-10-09  236  
b1b0e07f073671 Frank Wunderlich 2025-10-09  237  	if (ret)
b1b0e07f073671 Frank Wunderlich 2025-10-09  238  		dev_err(dev, "Fail to enable 2.5Gbps module clock: %d\n", ret);
b1b0e07f073671 Frank Wunderlich 2025-10-09  239  
b1b0e07f073671 Frank Wunderlich 2025-10-09  240  	/* Disable AN */
b1b0e07f073671 Frank Wunderlich 2025-10-09  241  	phy_clear_bits(phydev, MII_BMCR, BMCR_ANENABLE);
b1b0e07f073671 Frank Wunderlich 2025-10-09  242  
b1b0e07f073671 Frank Wunderlich 2025-10-09  243  	/* Force to run at 2.5G speed */
b1b0e07f073671 Frank Wunderlich 2025-10-09  244  	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_AN_FORCE_SPEED_REG,
b1b0e07f073671 Frank Wunderlich 2025-10-09  245  		       MTK_PHY_MASTER_FORCE_SPEED_SEL_MASK,
b1b0e07f073671 Frank Wunderlich 2025-10-09  246  		       MTK_PHY_MASTER_FORCE_SPEED_SEL_EN |
b1b0e07f073671 Frank Wunderlich 2025-10-09  247  		       FIELD_PREP(MTK_PHY_MASTER_FORCE_SPEED_SEL_MASK, 0x1b));
b1b0e07f073671 Frank Wunderlich 2025-10-09  248  
b1b0e07f073671 Frank Wunderlich 2025-10-09  249  	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_RELATED,
b1b0e07f073671 Frank Wunderlich 2025-10-09  250  			 MTK_PHY_BYPASS_LINK_STATUS_OK |
b1b0e07f073671 Frank Wunderlich 2025-10-09  251  			 MTK_PHY_FORCE_LINK_STATUS_HCD);
b1b0e07f073671 Frank Wunderlich 2025-10-09  252  
b1b0e07f073671 Frank Wunderlich 2025-10-09  253  	/* Set xbz, pma and rx as "do not reset" in order to input DSP code. */
b1b0e07f073671 Frank Wunderlich 2025-10-09  254  	reg = readl(pmd_reg_base + DO_NOT_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  255  	reg |= DO_NOT_RESET_XBZ | DO_NOT_RESET_PMA | DO_NOT_RESET_RX;
b1b0e07f073671 Frank Wunderlich 2025-10-09  256  	writel(reg, pmd_reg_base + DO_NOT_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  257  
b1b0e07f073671 Frank Wunderlich 2025-10-09  258  	reg = readl(chip_scu_base + SYS_SW_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  259  	writel(reg & ~RESET_RST_CNT, chip_scu_base + SYS_SW_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  260  
b1b0e07f073671 Frank Wunderlich 2025-10-09  261  	writel(WRITE_PROTECT_KEY, xbz_pcs_reg_base + PMU_WP);
b1b0e07f073671 Frank Wunderlich 2025-10-09  262  
b1b0e07f073671 Frank Wunderlich 2025-10-09  263  	reg = readl(xbz_pcs_reg_base + PMU_PMA_AUTO_CFG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  264  	reg |= PMU_AUTO_MODE_EN | POWER_ON_AUTO_MODE;
b1b0e07f073671 Frank Wunderlich 2025-10-09  265  	writel(reg, xbz_pcs_reg_base + PMU_PMA_AUTO_CFG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  266  
b1b0e07f073671 Frank Wunderlich 2025-10-09  267  	/* Check if clock in auto mode is disabled. */
b1b0e07f073671 Frank Wunderlich 2025-10-09  268  	ret = readl_poll_timeout(xbz_pcs_reg_base + PMU_PMA_STATUS, reg,
b1b0e07f073671 Frank Wunderlich 2025-10-09  269  				 (reg & CLK_IS_DISABLED) == 0x0, 1, 100000);
b1b0e07f073671 Frank Wunderlich 2025-10-09  270  	if (ret)
b1b0e07f073671 Frank Wunderlich 2025-10-09  271  		dev_err(dev, "Clock isn't disabled in auto mode: %d\n", ret);
b1b0e07f073671 Frank Wunderlich 2025-10-09  272  
b1b0e07f073671 Frank Wunderlich 2025-10-09  273  	reg = readl(xbz_pma_rx_base + SMEM_CTRL);
b1b0e07f073671 Frank Wunderlich 2025-10-09  274  	writel(reg | SMEM_HW_RDATA_ZERO, xbz_pma_rx_base + SMEM_CTRL);
b1b0e07f073671 Frank Wunderlich 2025-10-09  275  
b1b0e07f073671 Frank Wunderlich 2025-10-09  276  	reg = readl(xbz_pcs_reg_base + PHY_CTRL_CONFIG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  277  	writel(reg | BIT(16), xbz_pcs_reg_base + PHY_CTRL_CONFIG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  278  
b1b0e07f073671 Frank Wunderlich 2025-10-09  279  	/* Initialize data memory */
b1b0e07f073671 Frank Wunderlich 2025-10-09  280  	reg = readl(xbz_pma_rx_base + DM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  281  	writel(reg | BIT(28), xbz_pma_rx_base + DM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  282  	reg = readl(xbz_pma_rx_base + DM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  283  	writel(reg | BIT(28), xbz_pma_rx_base + DM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  284  
b1b0e07f073671 Frank Wunderlich 2025-10-09  285  	/* Initialize coefficient memory */
b1b0e07f073671 Frank Wunderlich 2025-10-09  286  	reg = readl(xbz_pma_rx_base + CM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  287  	writel(reg | BIT(28), xbz_pma_rx_base + CM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  288  	reg = readl(xbz_pma_rx_base + CM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  289  	writel(reg | BIT(28), xbz_pma_rx_base + CM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  290  
b1b0e07f073671 Frank Wunderlich 2025-10-09  291  	/* Initilize PM offset */
b1b0e07f073671 Frank Wunderlich 2025-10-09  292  	writel(0, xbz_pma_rx_base + SMEM_ADDR_REF_ADDR);
b1b0e07f073671 Frank Wunderlich 2025-10-09  293  
b1b0e07f073671 Frank Wunderlich 2025-10-09  294  	ret = request_firmware(&fw, MT7987_2P5GE_DSPBITTB, dev);
b1b0e07f073671 Frank Wunderlich 2025-10-09  295  	if (ret) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  296  		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
b1b0e07f073671 Frank Wunderlich 2025-10-09  297  			MT7987_2P5GE_DSPBITTB, ret);
b1b0e07f073671 Frank Wunderlich 2025-10-09  298  		goto free_pmb_addr;
b1b0e07f073671 Frank Wunderlich 2025-10-09  299  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  300  	if (fw->size != MT7987_2P5GE_DSPBITTB_SIZE) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  301  		dev_err(dev, "DSPBITTB size 0x%zx != 0x%x\n",
b1b0e07f073671 Frank Wunderlich 2025-10-09  302  			fw->size, MT7987_2P5GE_DSPBITTB_SIZE);
b1b0e07f073671 Frank Wunderlich 2025-10-09  303  		ret = -EINVAL;
b1b0e07f073671 Frank Wunderlich 2025-10-09  304  		goto release_fw;
b1b0e07f073671 Frank Wunderlich 2025-10-09  305  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  306  
b1b0e07f073671 Frank Wunderlich 2025-10-09  307  	for (i = 0; i < fw->size - 1; i += 16) {
b1b0e07f073671 Frank Wunderlich 2025-10-09  308  		writel(*((uint32_t *)(fw->data + i)),
b1b0e07f073671 Frank Wunderlich 2025-10-09  309  		       xbz_pma_rx_base + SMEM_WDAT0);
b1b0e07f073671 Frank Wunderlich 2025-10-09  310  		writel(*((uint32_t *)(fw->data + i + 0x4)),
b1b0e07f073671 Frank Wunderlich 2025-10-09  311  		       xbz_pma_rx_base + SMEM_WDAT1);
b1b0e07f073671 Frank Wunderlich 2025-10-09  312  		writel(*((uint32_t *)(fw->data + i + 0x8)),
b1b0e07f073671 Frank Wunderlich 2025-10-09  313  		       xbz_pma_rx_base + SMEM_WDAT2);
b1b0e07f073671 Frank Wunderlich 2025-10-09  314  		writel(*((uint32_t *)(fw->data + i + 0xc)),
b1b0e07f073671 Frank Wunderlich 2025-10-09  315  		       xbz_pma_rx_base + SMEM_WDAT3);
b1b0e07f073671 Frank Wunderlich 2025-10-09  316  	}
b1b0e07f073671 Frank Wunderlich 2025-10-09  317  
b1b0e07f073671 Frank Wunderlich 2025-10-09  318  	reg = readl(xbz_pma_rx_base + DM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  319  	writel(reg & ~BIT(28), xbz_pma_rx_base + DM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  320  
b1b0e07f073671 Frank Wunderlich 2025-10-09  321  	reg = readl(xbz_pma_rx_base + DM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  322  	writel(reg & ~BIT(28), xbz_pma_rx_base + DM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  323  
b1b0e07f073671 Frank Wunderlich 2025-10-09  324  	reg = readl(xbz_pma_rx_base + CM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  325  	writel(reg & ~BIT(28), xbz_pma_rx_base + CM_CTRL_P01);
b1b0e07f073671 Frank Wunderlich 2025-10-09  326  
b1b0e07f073671 Frank Wunderlich 2025-10-09  327  	reg = readl(xbz_pma_rx_base + CM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  328  	writel(reg & ~BIT(28), xbz_pma_rx_base + CM_CTRL_P23);
b1b0e07f073671 Frank Wunderlich 2025-10-09  329  
b1b0e07f073671 Frank Wunderlich 2025-10-09  330  	reg = readw(mcu_csr_base + MD32_EN_CFG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  331  	writew(reg | MD32_EN, mcu_csr_base + MD32_EN_CFG);
b1b0e07f073671 Frank Wunderlich 2025-10-09  332  	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
b1b0e07f073671 Frank Wunderlich 2025-10-09  333  	/* We need a delay here to stabilize initialization of MCU */
b1b0e07f073671 Frank Wunderlich 2025-10-09  334  	usleep_range(7000, 8000);
b1b0e07f073671 Frank Wunderlich 2025-10-09  335  	dev_info(dev, "Firmware loading/trigger ok.\n");
b1b0e07f073671 Frank Wunderlich 2025-10-09  336  
b1b0e07f073671 Frank Wunderlich 2025-10-09  337  	priv->fw_loaded = true;
b1b0e07f073671 Frank Wunderlich 2025-10-09  338  
b1b0e07f073671 Frank Wunderlich 2025-10-09  339  release_fw:
b1b0e07f073671 Frank Wunderlich 2025-10-09  340  	release_firmware(fw);
b1b0e07f073671 Frank Wunderlich 2025-10-09  341  free_pmb_addr:
b1b0e07f073671 Frank Wunderlich 2025-10-09  342  	iounmap(pmb_addr);
b1b0e07f073671 Frank Wunderlich 2025-10-09  343  free_mcu_csr:
b1b0e07f073671 Frank Wunderlich 2025-10-09  344  	iounmap(mcu_csr_base);
b1b0e07f073671 Frank Wunderlich 2025-10-09  345  free_chip_scu:
b1b0e07f073671 Frank Wunderlich 2025-10-09  346  	iounmap(chip_scu_base);
b1b0e07f073671 Frank Wunderlich 2025-10-09  347  free_pma:
b1b0e07f073671 Frank Wunderlich 2025-10-09  348  	iounmap(xbz_pma_rx_base);
b1b0e07f073671 Frank Wunderlich 2025-10-09  349  free_pcs:
b1b0e07f073671 Frank Wunderlich 2025-10-09  350  	iounmap(xbz_pcs_reg_base);
b1b0e07f073671 Frank Wunderlich 2025-10-09  351  free_pmd:
b1b0e07f073671 Frank Wunderlich 2025-10-09  352  	iounmap(pmd_reg_base);
b1b0e07f073671 Frank Wunderlich 2025-10-09  353  free_apb:
b1b0e07f073671 Frank Wunderlich 2025-10-09  354  	iounmap(apb_base);
b1b0e07f073671 Frank Wunderlich 2025-10-09  355  
b1b0e07f073671 Frank Wunderlich 2025-10-09 @356  	return ret;
b1b0e07f073671 Frank Wunderlich 2025-10-09  357  }
b1b0e07f073671 Frank Wunderlich 2025-10-09  358  

:::::: The code at line 356 was first introduced by commit
:::::: b1b0e07f0736711d2ebf77d657ecd55bef0dedc2 net: phy: mtk-2p5ge: add support for mt7987

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
