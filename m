Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05C37649A
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776649665; cv=none; b=c2Qmmgc6EbEoa7Vwp50vCcD6vx/ipQZ6kQ33WqFht1PSYYeSBNC3c92XFb7i2YsyqKzHHOmBvpIcDFiQnCrIiWz9DPehBBwCm8Fk66MXqvGZOwF3/TJd4yoz0VBcokDFi6Fu0AiEGFgQDts+wZTmMxVKzseAdb5gZJyRPEXGUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776649665; c=relaxed/simple;
	bh=B0EaIGPqleQUvcIuz2EfCN2F2tdpIzhPMURIHxTTqXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nB9YLrrS6XyAnc4JE4EY/mSTtMMiWqO1pHDa5vW3FxdsQNB3PcDrseGB6+z8IMxHAfJUzGm8dWCn6eKvzPNulDasV4Y09vYYKUCGk/Om+a7bv6dkZ4p7PmbgfJOluIbt6KAM7th6Igo+WoGYlMtyfJPfCQ194GhGTdKbpkDvCs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtrZdZ95; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtrZdZ95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776649657; x=1808185657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0EaIGPqleQUvcIuz2EfCN2F2tdpIzhPMURIHxTTqXI=;
  b=LtrZdZ95BGlOE2xVbBXNrWbdD/w7BntCetSFAAoBMXnN+E1+/0baWtjT
   2o+1MXUsJVwV/bNKPy5JAxxRPgGZn+mo+AUmYJFt6hhw9F8TbgIuELa5j
   6JiGJzsjnZZEaJYy9GQlJzUuFzTgZxfk2lZJx04CmHZgCGWEoKNIA+bhz
   r2ir6QOMsw3GNdhNwcwG/fJDqAf5jQhG2WdXAMjQ27VCgc7/McUlMQVib
   h1aeLLqiqUkLTpJwxhkFn0OLsrQaOMj8bu2/d7741tukLPcYI1/Ed0buO
   E6TQUgUtFNvLJADPbz0wKsPfztDetXjHEhiVByDynBQPMdlp0a8Jsvy/Y
   g==;
X-CSE-ConnectionGUID: 80UZwoPMSGSY9bsGhf++kA==
X-CSE-MsgGUID: gs9mzOYDSaS5UJytmBsxZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88940049"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="88940049"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 18:47:22 -0700
X-CSE-ConnectionGUID: edi+ZozJQLy5ES3nvmwrtw==
X-CSE-MsgGUID: H54JrVtuSzOjKxKk104O0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="231866675"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2026 18:47:19 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEdjI-000000001zf-1aE1;
	Mon, 20 Apr 2026 01:47:16 +0000
Date: Mon, 20 Apr 2026 09:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:7.0-rc 107/107]
 drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn:
 'apb_base' from ioremap() not released on lines: 177.
Message-ID: <202604200426.aVDrguaY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=-=YwfHzRrzIIxvx3POcuU6df0xlC3C7oXMX8ZV=-="

This is a multi-part message in MIME format.

--=-=YwfHzRrzIIxvx3POcuU6df0xlC3C7oXMX8ZV=-=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-ID: <20260420014634.CRgKP%lkp@intel.com>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   e19a7a97b655aa7788568c091007fae4016cd872
commit: 9dd404f52458435d3875ea1b358a440e5187fa45 [107/107] net: phy: mtk-2p5ge: extend priv for firmware loading
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: xtensa-randconfig-r071-20260420
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604200426.aVDrguaY-lkp@intel.com/

smatch warnings:
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'apb_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'chip_scu_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'mcu_csr_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'pmd_reg_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'xbz_pcs_reg_base' from ioremap() not released on lines: 177.
drivers/net/phy/mediatek/mtk-2p5ge.c:356 mt7987_2p5ge_phy_load_fw() warn: 'xbz_pma_rx_base' from ioremap() not released on lines: 177.

vim +/apb_base +356 drivers/net/phy/mediatek/mtk-2p5ge.c

26948c2430412b Sky Huang        2025-05-16  116  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  117  static int mt7987_2p5ge_phy_load_fw(struct phy_device *phydev)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  118  {
9dd404f5245843 Frank Wunderlich 2025-10-09  119  	struct mtk_socphy_priv *priv = phydev->priv;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  120  	struct device *dev = &phydev->mdio.dev;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  121  	void __iomem *xbz_pcs_reg_base;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  122  	void __iomem *xbz_pma_rx_base;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  123  	void __iomem *chip_scu_base;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  124  	void __iomem *pmd_reg_base;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  125  	void __iomem *mcu_csr_base;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  126  	const struct firmware *fw;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  127  	void __iomem *apb_base;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  128  	void __iomem *pmb_addr;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  129  	int ret, i;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  130  	u32 reg;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  131  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  132  	if (priv->fw_loaded)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  133  		return 0;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  134  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  135  	apb_base = ioremap(MTK_2P5GPHY_APB_BASE,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  136  			   MTK_2P5GPHY_APB_LEN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  137  	if (!apb_base)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  138  		return -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  139  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  140  	pmd_reg_base = ioremap(MTK_2P5GPHY_PMD_REG_BASE,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  141  			       MTK_2P5GPHY_PMD_REG_LEN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  142  	if (!pmd_reg_base) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  143  		ret = -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  144  		goto free_apb;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  145  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  146  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  147  	xbz_pcs_reg_base = ioremap(MTK_2P5GPHY_XBZ_PCS_REG_BASE,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  148  				   MTK_2P5GPHY_XBZ_PCS_REG_LEN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  149  	if (!xbz_pcs_reg_base) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  150  		ret = -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  151  		goto free_pmd;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  152  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  153  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  154  	xbz_pma_rx_base = ioremap(MTK_2P5GPHY_XBZ_PMA_RX_BASE,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  155  				  MTK_2P5GPHY_XBZ_PMA_RX_LEN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  156  	if (!xbz_pma_rx_base) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  157  		ret = -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  158  		goto free_pcs;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  159  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  160  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  161  	chip_scu_base = ioremap(MTK_2P5GPHY_CHIP_SCU_BASE,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  162  				MTK_2P5GPHY_CHIP_SCU_LEN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  163  	if (!chip_scu_base) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  164  		ret = -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  165  		goto free_pma;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  166  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  167  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  168  	mcu_csr_base = ioremap(MTK_2P5GPHY_MCU_CSR_BASE,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  169  			       MTK_2P5GPHY_MCU_CSR_LEN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  170  	if (!mcu_csr_base) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  171  		ret = -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  172  		goto free_chip_scu;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  173  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  174  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  175  	pmb_addr = ioremap(MTK_2P5GPHY_PMB_FW_BASE, MT7987_2P5GE_PMB_FW_SIZE);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  176  	if (!pmb_addr) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  177  		return -ENOMEM;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  178  		goto free_mcu_csr;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  179  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  180  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  181  	ret = request_firmware(&fw, MT7987_2P5GE_PMB_FW, dev);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  182  	if (ret) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  183  		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
7fc7fdcb265989 Frank Wunderlich 2025-10-09  184  			MT7987_2P5GE_PMB_FW, ret);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  185  		goto free_pmb_addr;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  186  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  187  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  188  	if (fw->size != MT7987_2P5GE_PMB_FW_SIZE) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  189  		dev_err(dev, "PMb firmware size 0x%zx != 0x%x\n",
7fc7fdcb265989 Frank Wunderlich 2025-10-09  190  			fw->size, MT7987_2P5GE_PMB_FW_SIZE);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  191  		ret = -EINVAL;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  192  		goto release_fw;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  193  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  194  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  195  	/* Force 2.5Gphy back to AN state */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  196  	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  197  	usleep_range(5000, 6000);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  198  	phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  199  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  200  	reg = readw(apb_base + SW_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  201  	writew(reg & ~MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  202  	writew(reg | MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  203  	writew(reg & ~MD32_RESTART_EN_CLEAR, apb_base + SW_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  204  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  205  	reg = readw(mcu_csr_base + MD32_EN_CFG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  206  	writew(reg & ~MD32_EN, mcu_csr_base + MD32_EN_CFG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  207  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  208  	for (i = 0; i < MT7987_2P5GE_PMB_FW_SIZE - 1; i += 4)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  209  		writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  210  	dev_info(dev, "Firmware date code: %x/%x/%x, version: %x.%x\n",
7fc7fdcb265989 Frank Wunderlich 2025-10-09  211  		 be16_to_cpu(*((__be16 *)(fw->data +
7fc7fdcb265989 Frank Wunderlich 2025-10-09  212  					  MT7987_2P5GE_PMB_FW_SIZE - 8))),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  213  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 6),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  214  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 5),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  215  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 2),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  216  		 *(fw->data + MT7987_2P5GE_PMB_FW_SIZE - 1));
7fc7fdcb265989 Frank Wunderlich 2025-10-09  217  	release_firmware(fw);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  218  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  219  	/* Enable 100Mbps module clock. */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  220  	writel(FIELD_PREP(RG_SPEED_MASK, RG_SPEED_100),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  221  	       pmd_reg_base + FNPLL_PWR_CTRL1);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  222  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  223  	/* Check if 100Mbps module clock is ready. */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  224  	ret = readl_poll_timeout(pmd_reg_base + FNPLL_PWR_CTRL_STATUS, reg,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  225  				 reg & RG_SPEED_100_STABLE, 1, 10000);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  226  	if (ret)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  227  		dev_err(dev, "Fail to enable 100Mbps module clock: %d\n", ret);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  228  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  229  	/* Enable 2.5Gbps module clock. */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  230  	writel(FIELD_PREP(RG_SPEED_MASK, RG_SPEED_2500),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  231  	       pmd_reg_base + FNPLL_PWR_CTRL1);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  232  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  233  	/* Check if 2.5Gbps module clock is ready. */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  234  	ret = readl_poll_timeout(pmd_reg_base + FNPLL_PWR_CTRL_STATUS, reg,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  235  				 reg & RG_SPEED_2500_STABLE, 1, 10000);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  236  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  237  	if (ret)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  238  		dev_err(dev, "Fail to enable 2.5Gbps module clock: %d\n", ret);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  239  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  240  	/* Disable AN */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  241  	phy_clear_bits(phydev, MII_BMCR, BMCR_ANENABLE);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  242  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  243  	/* Force to run at 2.5G speed */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  244  	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_AN_FORCE_SPEED_REG,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  245  		       MTK_PHY_MASTER_FORCE_SPEED_SEL_MASK,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  246  		       MTK_PHY_MASTER_FORCE_SPEED_SEL_EN |
7fc7fdcb265989 Frank Wunderlich 2025-10-09  247  		       FIELD_PREP(MTK_PHY_MASTER_FORCE_SPEED_SEL_MASK, 0x1b));
7fc7fdcb265989 Frank Wunderlich 2025-10-09  248  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  249  	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_RELATED,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  250  			 MTK_PHY_BYPASS_LINK_STATUS_OK |
7fc7fdcb265989 Frank Wunderlich 2025-10-09  251  			 MTK_PHY_FORCE_LINK_STATUS_HCD);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  252  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  253  	/* Set xbz, pma and rx as "do not reset" in order to input DSP code. */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  254  	reg = readl(pmd_reg_base + DO_NOT_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  255  	reg |= DO_NOT_RESET_XBZ | DO_NOT_RESET_PMA | DO_NOT_RESET_RX;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  256  	writel(reg, pmd_reg_base + DO_NOT_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  257  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  258  	reg = readl(chip_scu_base + SYS_SW_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  259  	writel(reg & ~RESET_RST_CNT, chip_scu_base + SYS_SW_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  260  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  261  	writel(WRITE_PROTECT_KEY, xbz_pcs_reg_base + PMU_WP);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  262  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  263  	reg = readl(xbz_pcs_reg_base + PMU_PMA_AUTO_CFG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  264  	reg |= PMU_AUTO_MODE_EN | POWER_ON_AUTO_MODE;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  265  	writel(reg, xbz_pcs_reg_base + PMU_PMA_AUTO_CFG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  266  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  267  	/* Check if clock in auto mode is disabled. */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  268  	ret = readl_poll_timeout(xbz_pcs_reg_base + PMU_PMA_STATUS, reg,
7fc7fdcb265989 Frank Wunderlich 2025-10-09  269  				 (reg & CLK_IS_DISABLED) == 0x0, 1, 100000);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  270  	if (ret)
7fc7fdcb265989 Frank Wunderlich 2025-10-09  271  		dev_err(dev, "Clock isn't disabled in auto mode: %d\n", ret);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  272  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  273  	reg = readl(xbz_pma_rx_base + SMEM_CTRL);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  274  	writel(reg | SMEM_HW_RDATA_ZERO, xbz_pma_rx_base + SMEM_CTRL);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  275  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  276  	reg = readl(xbz_pcs_reg_base + PHY_CTRL_CONFIG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  277  	writel(reg | BIT(16), xbz_pcs_reg_base + PHY_CTRL_CONFIG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  278  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  279  	/* Initialize data memory */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  280  	reg = readl(xbz_pma_rx_base + DM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  281  	writel(reg | BIT(28), xbz_pma_rx_base + DM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  282  	reg = readl(xbz_pma_rx_base + DM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  283  	writel(reg | BIT(28), xbz_pma_rx_base + DM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  284  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  285  	/* Initialize coefficient memory */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  286  	reg = readl(xbz_pma_rx_base + CM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  287  	writel(reg | BIT(28), xbz_pma_rx_base + CM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  288  	reg = readl(xbz_pma_rx_base + CM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  289  	writel(reg | BIT(28), xbz_pma_rx_base + CM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  290  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  291  	/* Initilize PM offset */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  292  	writel(0, xbz_pma_rx_base + SMEM_ADDR_REF_ADDR);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  293  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  294  	ret = request_firmware(&fw, MT7987_2P5GE_DSPBITTB, dev);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  295  	if (ret) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  296  		dev_err(dev, "failed to load firmware: %s, ret: %d\n",
7fc7fdcb265989 Frank Wunderlich 2025-10-09  297  			MT7987_2P5GE_DSPBITTB, ret);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  298  		goto free_pmb_addr;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  299  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  300  	if (fw->size != MT7987_2P5GE_DSPBITTB_SIZE) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  301  		dev_err(dev, "DSPBITTB size 0x%zx != 0x%x\n",
7fc7fdcb265989 Frank Wunderlich 2025-10-09  302  			fw->size, MT7987_2P5GE_DSPBITTB_SIZE);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  303  		ret = -EINVAL;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  304  		goto release_fw;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  305  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  306  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  307  	for (i = 0; i < fw->size - 1; i += 16) {
7fc7fdcb265989 Frank Wunderlich 2025-10-09  308  		writel(*((uint32_t *)(fw->data + i)),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  309  		       xbz_pma_rx_base + SMEM_WDAT0);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  310  		writel(*((uint32_t *)(fw->data + i + 0x4)),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  311  		       xbz_pma_rx_base + SMEM_WDAT1);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  312  		writel(*((uint32_t *)(fw->data + i + 0x8)),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  313  		       xbz_pma_rx_base + SMEM_WDAT2);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  314  		writel(*((uint32_t *)(fw->data + i + 0xc)),
7fc7fdcb265989 Frank Wunderlich 2025-10-09  315  		       xbz_pma_rx_base + SMEM_WDAT3);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  316  	}
7fc7fdcb265989 Frank Wunderlich 2025-10-09  317  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  318  	reg = readl(xbz_pma_rx_base + DM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  319  	writel(reg & ~BIT(28), xbz_pma_rx_base + DM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  320  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  321  	reg = readl(xbz_pma_rx_base + DM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  322  	writel(reg & ~BIT(28), xbz_pma_rx_base + DM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  323  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  324  	reg = readl(xbz_pma_rx_base + CM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  325  	writel(reg & ~BIT(28), xbz_pma_rx_base + CM_CTRL_P01);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  326  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  327  	reg = readl(xbz_pma_rx_base + CM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  328  	writel(reg & ~BIT(28), xbz_pma_rx_base + CM_CTRL_P23);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  329  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  330  	reg = readw(mcu_csr_base + MD32_EN_CFG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  331  	writew(reg | MD32_EN, mcu_csr_base + MD32_EN_CFG);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  332  	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  333  	/* We need a delay here to stabilize initialization of MCU */
7fc7fdcb265989 Frank Wunderlich 2025-10-09  334  	usleep_range(7000, 8000);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  335  	dev_info(dev, "Firmware loading/trigger ok.\n");
7fc7fdcb265989 Frank Wunderlich 2025-10-09  336  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  337  	priv->fw_loaded = true;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  338  
7fc7fdcb265989 Frank Wunderlich 2025-10-09  339  release_fw:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  340  	release_firmware(fw);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  341  free_pmb_addr:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  342  	iounmap(pmb_addr);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  343  free_mcu_csr:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  344  	iounmap(mcu_csr_base);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  345  free_chip_scu:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  346  	iounmap(chip_scu_base);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  347  free_pma:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  348  	iounmap(xbz_pma_rx_base);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  349  free_pcs:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  350  	iounmap(xbz_pcs_reg_base);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  351  free_pmd:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  352  	iounmap(pmd_reg_base);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  353  free_apb:
7fc7fdcb265989 Frank Wunderlich 2025-10-09  354  	iounmap(apb_base);
7fc7fdcb265989 Frank Wunderlich 2025-10-09  355  
7fc7fdcb265989 Frank Wunderlich 2025-10-09 @356  	return ret;
7fc7fdcb265989 Frank Wunderlich 2025-10-09  357  }
7fc7fdcb265989 Frank Wunderlich 2025-10-09  358  

:::::: The code at line 356 was first introduced by commit
:::::: 7fc7fdcb26598907c057fbfebfd3daa1f0774089 net: phy: mtk-2p5ge: add support for mt7987

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--=-=YwfHzRrzIIxvx3POcuU6df0xlC3C7oXMX8ZV=-=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config"
Content-ID: <20260420014634.Dv94-%lkp@intel.com>

#
# Automatically generated file; DO NOT EDIT.
# Linux/xtensa 7.0.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="xtensa-linux-gcc (GCC) 8.5.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=80500
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23601
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23601
CONFIG_LLD_VERSION=0
CONFIG_RUSTC_VERSION=0
CONFIG_RUSTC_LLVM_VERSION=0
CONFIG_GCC_ASM_GOTO_OUTPUT_BROKEN=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY=y
CONFIG_PAHOLE_VERSION=131
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_TIME_KUNIT_TEST=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# CONFIG_POSIX_AUX_CLOCKS is not set
# end of Timers subsystem

CONFIG_BPF=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_TASKSTATS=y
# CONFIG_TASK_DELAY_ACCT is not set
# CONFIG_TASK_XACCT is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TINY_SRCU=y
CONFIG_NEED_TASKS_RCU=y
CONFIG_TASKS_TRACE_RCU=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
# CONFIG_IKCONFIG_PROC is not set
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_INDEX=y
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC10_NO_ARRAY_BOUNDS=y
CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
CONFIG_CC_NO_STRINGOP_OVERFLOW=y
CONFIG_SLAB_OBJ_EXT=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_V1=y
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_GROUP_SCHED_WEIGHT=y
CONFIG_GROUP_SCHED_BANDWIDTH=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
# CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED is not set
# CONFIG_CGROUP_PIDS is not set
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_DMEM=y
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_FORCE=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_CMDLINE_LOG_WRAP_IDEAL_LEN=1021
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_INITRAMFS_TEST=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_RINGBUFFER_KUNIT_TEST=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_FUTEX_PRIVATE_HASH=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KCMP=y
CONFIG_CACHESTAT_SYSCALL=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y

#
# Kexec and crash features
#
CONFIG_VMCORE_INFO=y
# end of Kexec and crash features

#
# Live Update and Kexec HandOver
#
# end of Live Update and Kexec HandOver
# end of General setup

CONFIG_XTENSA=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_ARCH_MTD_XIP=y
CONFIG_HZ=100
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_HAVE_XTENSA_GPIO32=y
CONFIG_KASAN_SHADOW_OFFSET=0x6e400000
CONFIG_CPU_BIG_ENDIAN=y

#
# Processor type and features
#
# CONFIG_XTENSA_VARIANT_FSF is not set
CONFIG_XTENSA_VARIANT_DC232B=y
# CONFIG_XTENSA_VARIANT_DC233C is not set
# CONFIG_XTENSA_VARIANT_CUSTOM is not set
CONFIG_XTENSA_VARIANT_NAME="dc232b"
CONFIG_PFAULT=y
# CONFIG_XTENSA_UNALIGNED_USER is not set
# CONFIG_XTENSA_LOAD_STORE is not set
# CONFIG_FAST_SYSCALL_XTENSA is not set
CONFIG_FAST_SYSCALL_SPILL_REGISTERS=y
CONFIG_KERNEL_ABI_DEFAULT=y
CONFIG_USER_ABI_CALL0=y
# CONFIG_USER_ABI_DEFAULT is not set
CONFIG_USER_ABI_CALL0_ONLY=y
# CONFIG_USER_ABI_CALL0_PROBE is not set
# end of Processor type and features

CONFIG_XTENSA_CALIBRATE_CCOUNT=y
CONFIG_SERIAL_CONSOLE=y

#
# Platform options
#
CONFIG_XTENSA_PLATFORM_ISS=y
# CONFIG_XTENSA_PLATFORM_XT2000 is not set
# CONFIG_XTENSA_PLATFORM_XTFPGA is not set
CONFIG_PLATFORM_NR_IRQS=0
CONFIG_GENERIC_CALIBRATE_DELAY=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_USE_OF=y
CONFIG_BUILTIN_DTB_NAME=""
CONFIG_PARSE_BOOTPARAM=y
# CONFIG_XTENSA_SIMCALL_ISS is not set
CONFIG_XTENSA_SIMCALL_GDBIO=y
# CONFIG_BLK_DEV_SIMDISK is not set

#
# Kernel memory layout
#
CONFIG_KERNEL_LOAD_ADDRESS=0xd0003000
CONFIG_XTENSA_VECTORS_SEPARATE=y
CONFIG_VECTORS_ADDR=0x00000000
CONFIG_DEFAULT_MEM_START=0x00000000
CONFIG_XTENSA_KSEG_MMU_V2=y
CONFIG_HIGHMEM=y
CONFIG_ARCH_FORCE_MAX_ORDER=10
# end of Platform options

#
# Power management options
#
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
# CONFIG_HIBERNATION is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_ENERGY_MODEL=y
# end of Power management options

CONFIG_CPU_MITIGATIONS=y

#
# General architecture-dependent options
#
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_ARCH_HAS_DMA_SET_UNCACHED=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_HAVE_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=12
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_LOCK_EVENT_COUNTS=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_FUNCTION_ALIGNMENT=0
CONFIG_ARCH_NEED_CMPXCHG_1_EMU=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
# CONFIG_BLK_DEV_WRITE_MOUNTED is not set
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
# CONFIG_ACORN_PARTITION_CUMANA is not set
CONFIG_ACORN_PARTITION_EESOX=y
CONFIG_ACORN_PARTITION_ICS=y
CONFIG_ACORN_PARTITION_ADFS=y
CONFIG_ACORN_PARTITION_POWERTEC=y
CONFIG_ACORN_PARTITION_RISCIX=y
CONFIG_AIX_PARTITION=y
# CONFIG_OSF_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
CONFIG_ATARI_PARTITION=y
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
CONFIG_OF_PARTITION=y
# end of Partition Types

CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_ELF_KUNIT_TEST=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
CONFIG_EXEC_KUNIT_TEST=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
CONFIG_ZSWAP=y
CONFIG_ZSWAP_DEFAULT_ON=y
# CONFIG_ZSWAP_SHRINKER_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lz4hc"
CONFIG_ZSMALLOC=y

#
# Zsmalloc allocator options
#

#
# Zsmalloc is a common backend allocator for zswap & zram
#
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8
# end of Zsmalloc allocator options

#
# Slab allocator options
#
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SLAB_BUCKETS=y
# CONFIG_SLUB_STATS is not set
CONFIG_RANDOM_KMALLOC_CACHES=y
# end of Slab allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_FLATMEM=y
# CONFIG_COMPACTION is not set
# CONFIG_PAGE_REPORTING is not set
CONFIG_PCP_BATCH_SCALE_MAX=5
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_PAGE_MAPCOUNT=y
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_PAGE_BLOCK_MAX_ORDER=10
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CPU_CACHE_ALIASING=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_HMM_MIRROR=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_DMAPOOL_TEST=y
CONFIG_KMAP_LOCAL=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
CONFIG_LRU_GEN=y
# CONFIG_LRU_GEN_ENABLED is not set
# CONFIG_LRU_GEN_STATS is not set
CONFIG_LOCK_MM_AND_FIND_VMA=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_KUNIT_TEST=y
# CONFIG_DAMON_VADDR is not set
CONFIG_DAMON_PADDR=y
# CONFIG_DAMON_SYSFS is not set
CONFIG_DAMON_RECLAIM=y
CONFIG_DAMON_LRU_SORT=y
# CONFIG_DAMON_STAT is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_XGRESS=y
CONFIG_SKB_DECRYPTED=y
CONFIG_SKB_EXTENSIONS=y
CONFIG_NET_DEVMEM=y
CONFIG_NET_SHAPER=y
CONFIG_NET_CRC32C=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=y
CONFIG_INET_PSP=y
CONFIG_UNIX=y
# CONFIG_AF_UNIX_OOB is not set
CONFIG_UNIX_DIAG=y
CONFIG_TLS=y
# CONFIG_TLS_DEVICE is not set
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=y
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XFRM_IPTFS=y
CONFIG_XFRM_ESPINTCP=y
# CONFIG_SMC is not set
CONFIG_DIBS=y
CONFIG_DIBS_LO=y
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=y
CONFIG_NET_HANDSHAKE_KUNIT_TEST=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
# CONFIG_NET_IPGRE is not set
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=y
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
CONFIG_INET_ESP_OFFLOAD=y
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=y
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=y
CONFIG_TCP_CONG_HTCP=y
CONFIG_TCP_CONG_HSTCP=y
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=y
CONFIG_TCP_CONG_NV=y
# CONFIG_TCP_CONG_SCALABLE is not set
CONFIG_TCP_CONG_LP=y
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=y
CONFIG_TCP_CONG_ILLINOIS=y
# CONFIG_TCP_CONG_DCTCP is not set
# CONFIG_TCP_CONG_CDG is not set
# CONFIG_TCP_CONG_BBR is not set
# CONFIG_DEFAULT_BIC is not set
# CONFIG_DEFAULT_CUBIC is not set
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_HYBLA is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_WESTWOOD is not set
CONFIG_DEFAULT_RENO=y
CONFIG_DEFAULT_TCP_CONG="reno"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_MPTCP_KUNIT_TEST=y
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_IP_SCTP is not set
CONFIG_RDS=y
# CONFIG_RDS_RDMA is not set
CONFIG_RDS_TCP=y
CONFIG_RDS_DEBUG=y
CONFIG_TIPC=y
CONFIG_TIPC_MEDIA_IB=y
# CONFIG_TIPC_MEDIA_UDP is not set
# CONFIG_TIPC_CRYPTO is not set
CONFIG_TIPC_DIAG=y
# CONFIG_ATM is not set
CONFIG_L2TP=y
CONFIG_L2TP_DEBUGFS=y
# CONFIG_L2TP_V3 is not set
CONFIG_STP=y
CONFIG_MRP=y
CONFIG_BRIDGE=y
# CONFIG_BRIDGE_IGMP_SNOOPING is not set
# CONFIG_BRIDGE_VLAN_FILTERING is not set
# CONFIG_BRIDGE_MRP is not set
CONFIG_BRIDGE_CFM=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
# CONFIG_LLC2 is not set
CONFIG_ATALK=y
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
CONFIG_PHONET=y
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=y
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
# CONFIG_DNS_RESOLVER is not set
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
CONFIG_BATMAN_ADV_BLA=y
# CONFIG_BATMAN_ADV_DAT is not set
# CONFIG_BATMAN_ADV_MCAST is not set
CONFIG_BATMAN_ADV_DEBUG=y
CONFIG_OPENVSWITCH=y
# CONFIG_OPENVSWITCH_VXLAN is not set
# CONFIG_OPENVSWITCH_GENEVE is not set
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
# CONFIG_VSOCKETS_LOOPBACK is not set
CONFIG_VIRTIO_VSOCKETS=y
CONFIG_VIRTIO_VSOCKETS_COMMON=y
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=y
CONFIG_MPLS_IPTUNNEL=y
CONFIG_NET_NSH=y
CONFIG_HSR=y
CONFIG_PRP_DUP_DISCARD_KUNIT_TEST=y
CONFIG_NET_SWITCHDEV=y
# CONFIG_NET_L3_MASTER_DEV is not set
CONFIG_QRTR=y
# CONFIG_QRTR_SMD is not set
# CONFIG_QRTR_TUN is not set
# CONFIG_QRTR_MHI is not set
# CONFIG_NET_NCSI is not set
CONFIG_MAX_SKB_FRAGS=17
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
# CONFIG_BQL is not set

#
# Network testing
#
CONFIG_NET_PKTGEN=y
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=y
# CONFIG_AX25_DAMA_SLAVE is not set
CONFIG_NETROM=y
CONFIG_ROSE=y

#
# AX.25 network device drivers
#
CONFIG_MKISS=y
# CONFIG_6PACK is not set
CONFIG_BPQETHER=y
CONFIG_BAYCOM_PAR=y
# CONFIG_BAYCOM_EPP is not set
# end of AX.25 network device drivers

# CONFIG_CAN is not set
CONFIG_BT=y
CONFIG_BT_BREDR=y
# CONFIG_BT_RFCOMM is not set
CONFIG_BT_BNEP=y
# CONFIG_BT_BNEP_MC_FILTER is not set
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_HIDP=y
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
# CONFIG_BT_AOSPEXT is not set
# CONFIG_BT_DEBUGFS is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_FEATURE_DEBUG=y

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=y
CONFIG_BT_QCA=y
CONFIG_BT_MTK=y
# CONFIG_BT_HCIBTUSB is not set
# CONFIG_BT_HCIBTSDIO is not set
CONFIG_BT_HCIUART=y
CONFIG_BT_HCIUART_H4=y
# CONFIG_BT_HCIUART_BCSP is not set
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
CONFIG_BT_HCIUART_AG6XX=y
CONFIG_BT_HCIBCM203X=y
CONFIG_BT_HCIBPA10X=y
CONFIG_BT_HCIBFUSB=y
# CONFIG_BT_HCIVHCI is not set
CONFIG_BT_MRVL=y
CONFIG_BT_MRVL_SDIO=y
CONFIG_BT_MTKSDIO=y
CONFIG_BT_QCOMSMD=y
# CONFIG_BT_VIRTIO is not set
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
CONFIG_AF_RXRPC_INJECT_LOSS=y
CONFIG_AF_RXRPC_INJECT_RX_DELAY=y
# CONFIG_AF_RXRPC_DEBUG is not set
# CONFIG_RXKAD is not set
CONFIG_RXGK=y
CONFIG_RXPERF=y
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
CONFIG_MCTP=y
CONFIG_MCTP_TEST=y
CONFIG_MCTP_FLOWS=y
# CONFIG_WIRELESS is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
CONFIG_PSAMPLE=y
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y
CONFIG_NETDEV_ADDR_LIST_TEST=y
CONFIG_NET_TEST=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_GENERIC_PCI_IOMAP=y
# CONFIG_PCI is not set
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_PM_RUNTIME_KUNIT_TEST=y
CONFIG_DM_KUNIT_TEST=y
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_KUNIT=y
# CONFIG_REGMAP_BUILD is not set
CONFIG_REGMAP_AC97=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_RAM=y
CONFIG_REGMAP_SOUNDWIRE=y
CONFIG_REGMAP_SOUNDWIRE_MBQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
CONFIG_BT1_AXI=y
# CONFIG_IMX_WEIM is not set
# CONFIG_INTEL_IXP4XX_EB is not set
CONFIG_OMAP_OCP2SCP=y
# CONFIG_QCOM_EBI2 is not set
CONFIG_STM32_FIREWALL=y
CONFIG_MHI_BUS=y
CONFIG_MHI_BUS_DEBUG=y
CONFIG_MHI_BUS_EP=y
# end of Bus devices

CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=y
CONFIG_ARM_SCMI_NEED_DEBUGFS=y
# CONFIG_ARM_SCMI_RAW_MODE_SUPPORT is not set
CONFIG_ARM_SCMI_DEBUG_COUNTERS=y
# CONFIG_ARM_SCMI_QUIRKS is not set

#
# SCMI Transport Drivers
#
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_HAVE_MSG=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_VERSION1_COMPLIANCE is not set
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE=y
# end of SCMI Transport Drivers

#
# ARM SCMI NXP i.MX Vendor Protocols
#
CONFIG_IMX_SCMI_BBM_EXT=y
# end of ARM SCMI NXP i.MX Vendor Protocols

CONFIG_ARM_SCMI_POWER_CONTROL=y
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_MTK_ADSP_IPC=y
CONFIG_TH1520_AON_PROTOCOL=y
CONFIG_TURRIS_MOX_RWTM=y
CONFIG_BCM47XX_NVRAM=y
# CONFIG_BCM47XX_SPROM is not set
# CONFIG_TEE_BNXT_FW is not set
CONFIG_FW_CS_DSP=y
CONFIG_FW_CS_DSP_KUNIT_TEST_UTILS=y
CONFIG_FW_CS_DSP_KUNIT_TEST=y
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_CBMEM is not set
CONFIG_GOOGLE_COREBOOT_TABLE=y
CONFIG_GOOGLE_MEMCONSOLE=y
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=y
CONFIG_GOOGLE_VPD=y
# CONFIG_IMX_SCMI_CPU_DRV is not set
# CONFIG_IMX_SCMI_LMM_DRV is not set
# CONFIG_IMX_SCMI_MISC_DRV is not set

#
# Qualcomm firmware drivers
#
CONFIG_QCOM_SCM=y
CONFIG_QCOM_TZMEM=y
CONFIG_QCOM_TZMEM_MODE_GENERIC=y
# CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE is not set
# CONFIG_QCOM_QSEECOM is not set
# end of Qualcomm firmware drivers

CONFIG_EXYNOS_ACPM_PROTOCOL=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_FWCTL=y
CONFIG_GNSS=y
CONFIG_GNSS_USB=y
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_BCM63XX_PARTS is not set
CONFIG_MTD_BRCM_U_BOOT=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_OF_PARTS_BCM4908=y
# CONFIG_MTD_OF_PARTS_LINKSYS_NS is not set
CONFIG_MTD_PARSER_IMAGETAG=y
# CONFIG_MTD_PARSER_TPLINK_SAFELOADER is not set
CONFIG_MTD_PARSER_TRX=y
CONFIG_MTD_SHARPSL_PARTS=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=y
# CONFIG_NFTL is not set
CONFIG_INFTL=y
# CONFIG_RFD_FTL is not set
CONFIG_SSFDC=y
CONFIG_SM_FTL=y
# CONFIG_MTD_OOPS is not set
CONFIG_MTD_PSTORE=y
# CONFIG_MTD_SWAP is not set
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y
CONFIG_MTD_XIP=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SC520CDP=y
# CONFIG_MTD_NETSC520 is not set
CONFIG_MTD_TS5500=y
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_SPEAR_SMI=y
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=y
# CONFIG_MTD_INTEL_DG is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
CONFIG_MTD_ONENAND_GENERIC=y
CONFIG_MTD_ONENAND_SAMSUNG=y
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
CONFIG_MTD_NAND_DENALI_DT=y
CONFIG_MTD_NAND_AMS_DELTA=y
CONFIG_MTD_NAND_SHARPSL=y
CONFIG_MTD_NAND_ATMEL=y
CONFIG_MTD_NAND_MARVELL=y
# CONFIG_MTD_NAND_SLC_LPC32XX is not set
CONFIG_MTD_NAND_MLC_LPC32XX=y
CONFIG_MTD_NAND_BRCMNAND=y
CONFIG_MTD_NAND_BRCMNAND_BCM63XX=y
CONFIG_MTD_NAND_BRCMNAND_BCMBCA=y
# CONFIG_MTD_NAND_BRCMNAND_BRCMSTB is not set
# CONFIG_MTD_NAND_BRCMNAND_IPROC is not set
CONFIG_MTD_NAND_VF610_NFC=y
CONFIG_MTD_NAND_MXC=y
CONFIG_MTD_NAND_SH_FLCTL=y
CONFIG_MTD_NAND_TXX9NDFMC=y
CONFIG_MTD_NAND_FSMC=y
CONFIG_MTD_NAND_SUNXI=y
CONFIG_MTD_NAND_HISI504=y
# CONFIG_MTD_NAND_QCOM is not set
# CONFIG_MTD_NAND_MTK is not set
CONFIG_MTD_NAND_MXIC=y
CONFIG_MTD_NAND_TEGRA=y
CONFIG_MTD_NAND_STM32_FMC2=y
CONFIG_MTD_NAND_MESON=y
# CONFIG_MTD_NAND_GPIO is not set
CONFIG_MTD_NAND_PLATFORM=y
# CONFIG_MTD_NAND_CADENCE is not set
CONFIG_MTD_NAND_ARASAN=y
# CONFIG_MTD_NAND_INTEL_LGM is not set
# CONFIG_MTD_NAND_RENESAS is not set
CONFIG_MTD_NAND_NUVOTON_MA35=y
# CONFIG_MTD_NAND_LOONGSON is not set

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_NAND_DISKONCHIP=y
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
CONFIG_MTD_NAND_ECC_MEDIATEK=y
CONFIG_MTD_NAND_ECC_REALTEK=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_UBI_NVMEM is not set
CONFIG_MTD_HYPERBUS=y
CONFIG_HBMC_AM654=y
CONFIG_DTC=y
CONFIG_GENERIC_BUILTIN_DTB=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_KUNIT_TEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
# CONFIG_OF_OVERLAY is not set
CONFIG_OF_OVERLAY_KUNIT_TEST=y
CONFIG_PARPORT=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_RDMA=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_HOST_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
# CONFIG_DUMMY_IRQ is not set
# CONFIG_RPMB is not set
CONFIG_TI_FPC202=y
# CONFIG_ICS932S401 is not set
CONFIG_ATMEL_SSC=y
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_SMPRO_ERRMON is not set
CONFIG_SMPRO_MISC=y
# CONFIG_HI6421V600_IRQ is not set
CONFIG_QCOM_COINCELL=y
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
CONFIG_DS1682=y
CONFIG_SRAM=y
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
CONFIG_HISI_HIKEY_USB=y
# CONFIG_OPEN_DICE is not set
CONFIG_NTSYNC=y
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_TPS6594_ESM=y
CONFIG_TPS6594_PFSM=y
CONFIG_NSM=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=y
CONFIG_EEPROM_M24LR=y
# end of EEPROM support

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_MISC_RTSX_USB=y
CONFIG_UACCE=y
# CONFIG_PVPANIC is not set
CONFIG_AMD_SBRMI_I2C=y
# CONFIG_AMD_SBRMI_HWMON is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
# CONFIG_SCSI_PROC_FS is not set
CONFIG_SCSI_LIB_KUNIT_TEST=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
CONFIG_CHR_DEV_ST=y
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_CONSTANTS=y
# CONFIG_SCSI_LOGGING is not set
CONFIG_SCSI_SCAN_ASYNC=y
CONFIG_SCSI_PROTO_TEST=y

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
CONFIG_SCSI_FC_ATTRS=y
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
# CONFIG_SCSI_SAS_ATA is not set
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
CONFIG_SCSI_HISI_SAS=y
# CONFIG_SCSI_HISI_SAS_DEBUGFS_DEFAULT_ENABLE is not set
CONFIG_LIBFC=y
CONFIG_LIBFCOE=y
CONFIG_SCSI_DEBUG=y
# CONFIG_SCSI_VIRTIO is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI_PLATFORM=y
CONFIG_AHCI_BRCM=y
# CONFIG_AHCI_DA850 is not set
CONFIG_AHCI_DM816=y
# CONFIG_AHCI_DWC is not set
# CONFIG_AHCI_ST is not set
CONFIG_AHCI_IMX=y
CONFIG_AHCI_CEVA=y
CONFIG_AHCI_MTK=y
# CONFIG_AHCI_MVEBU is not set
CONFIG_AHCI_SUNXI=y
CONFIG_AHCI_TEGRA=y
CONFIG_AHCI_XGENE=y
CONFIG_AHCI_QORIQ=y
CONFIG_SATA_FSL=y
CONFIG_SATA_GEMINI=y
CONFIG_SATA_AHCI_SEATTLE=y
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_SATA_HIGHBANK=y
CONFIG_SATA_MV=y
CONFIG_SATA_RCAR=y

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_FTIDE010 is not set
CONFIG_PATA_IMX=y
# CONFIG_PATA_PXA is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_IXP4XX_CF is not set
CONFIG_PATA_PLATFORM=y
CONFIG_PATA_OF_PLATFORM=y

#
# Generic fallback / legacy drivers
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
# CONFIG_MD_BITMAP is not set
CONFIG_MD_LLBITMAP=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
# CONFIG_MD_RAID456 is not set
# CONFIG_MD_CLUSTER is not set
CONFIG_BCACHE=y
CONFIG_BCACHE_DEBUG=y
CONFIG_BCACHE_ASYNC_REGISTRATION=y
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
CONFIG_DM_DEBUG_BLOCK_STACK_TRACING=y
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
CONFIG_DM_UNSTRIPED=y
CONFIG_DM_CRYPT=y
# CONFIG_DM_SNAPSHOT is not set
CONFIG_DM_THIN_PROVISIONING=y
CONFIG_DM_CACHE=y
# CONFIG_DM_CACHE_SMQ is not set
CONFIG_DM_WRITECACHE=y
CONFIG_DM_ERA=y
CONFIG_DM_CLONE=y
# CONFIG_DM_MIRROR is not set
# CONFIG_DM_RAID is not set
# CONFIG_DM_ZERO is not set
# CONFIG_DM_MULTIPATH is not set
CONFIG_DM_DELAY=y
CONFIG_DM_DUST=y
CONFIG_DM_INIT=y
# CONFIG_DM_UEVENT is not set
CONFIG_DM_FLAKEY=y
CONFIG_DM_VERITY=y
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=y
# CONFIG_DM_LOG_WRITES is not set
# CONFIG_DM_INTEGRITY is not set
# CONFIG_DM_ZONED is not set
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=y
CONFIG_TCM_FILEIO=y
CONFIG_TCM_PSCSI=y
# CONFIG_TCM_USER2 is not set
# CONFIG_LOOPBACK_TARGET is not set
CONFIG_TCM_FC=y
# CONFIG_ISCSI_TARGET is not set
CONFIG_SBP_TARGET=y
CONFIG_REMOTE_TARGET=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_KUNIT_UAPI_TEST=y
CONFIG_FIREWIRE_KUNIT_DEVICE_ATTRIBUTE_TEST=y
CONFIG_FIREWIRE_KUNIT_PACKET_SERDES_TEST=y
CONFIG_FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST=y
CONFIG_FIREWIRE_KUNIT_OHCI_SERDES_TEST=y
CONFIG_FIREWIRE_SBP2=y
# CONFIG_FIREWIRE_NET is not set
# end of IEEE 1394 (FireWire) support

CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=y
CONFIG_DUMMY=y
# CONFIG_WIREGUARD is not set
CONFIG_OVPN=y
CONFIG_EQUALIZER=y
CONFIG_NET_TEAM=y
CONFIG_NET_TEAM_MODE_BROADCAST=y
CONFIG_NET_TEAM_MODE_ROUNDROBIN=y
# CONFIG_NET_TEAM_MODE_RANDOM is not set
# CONFIG_NET_TEAM_MODE_ACTIVEBACKUP is not set
# CONFIG_NET_TEAM_MODE_LOADBALANCE is not set
CONFIG_MACVLAN=y
CONFIG_MACVTAP=y
CONFIG_IPVLAN=y
CONFIG_IPVTAP=y
CONFIG_VXLAN=y
CONFIG_GENEVE=y
CONFIG_BAREUDP=y
CONFIG_GTP=y
CONFIG_PFCP=y
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=y
CONFIG_NETCONSOLE_DYNAMIC=y
# CONFIG_NETCONSOLE_EXTENDED_LOG is not set
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=y
CONFIG_TAP=y
CONFIG_TUN_VNET_CROSS_LE=y
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=y
CONFIG_NLMON=y
CONFIG_NETKIT=y
# CONFIG_MHI_NET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_ACTIONS=y
CONFIG_OWL_EMAC=y
CONFIG_NET_VENDOR_AIROHA=y
CONFIG_NET_AIROHA_NPU=y
CONFIG_NET_AIROHA=y
# CONFIG_NET_AIROHA_FLOW_STATS is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_ALTERA_TSE is not set
# CONFIG_NET_VENDOR_AMAZON is not set
CONFIG_NET_XGENE=y
CONFIG_NET_XGENE_V2=y
# CONFIG_NET_VENDOR_AQUANTIA is not set
# CONFIG_NET_VENDOR_ARC is not set
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
CONFIG_AG71XX=y
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=y
CONFIG_BCM4908_ENET=y
# CONFIG_BCMGENET is not set
CONFIG_BGMAC=y
CONFIG_BGMAC_BCMA=y
# CONFIG_BGMAC_PLATFORM is not set
CONFIG_SYSTEMPORT=y
# CONFIG_BCMASP is not set
# CONFIG_NET_VENDOR_CADENCE is not set
CONFIG_NET_CALXEDA_XGMAC=y
# CONFIG_NET_VENDOR_CAVIUM is not set
# CONFIG_NET_VENDOR_CIRRUS is not set
# CONFIG_NET_VENDOR_CORTINA is not set
# CONFIG_NET_VENDOR_DAVICOM is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=y
# CONFIG_NET_VENDOR_FARADAY is not set
# CONFIG_NET_VENDOR_FREESCALE is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HISILICON=y
CONFIG_HIX5HD2_GMAC=y
# CONFIG_HISI_FEMAC is not set
CONFIG_HIP04_ETH=y
CONFIG_HI13X1_GMAC=y
CONFIG_HNS_MDIO=y
CONFIG_HNS=y
CONFIG_HNS_DSAF=y
CONFIG_HNS_ENET=y
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_NET_VENDOR_I825XX is not set
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_LIBETH is not set
# CONFIG_LIBETH_XDP is not set
CONFIG_KORINA=y
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_LITEX_LITEETH is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MEDIATEK is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
CONFIG_NET_VENDOR_META=y
# CONFIG_NET_VENDOR_MICREL is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN966X_SWITCH is not set
CONFIG_SPARX5_SWITCH=y
# CONFIG_SPARX5_DCB is not set
# CONFIG_LAN969X_SWITCH is not set
CONFIG_VCAP=y
CONFIG_VCAP_KUNIT_TEST=y
CONFIG_FDMA=y
# CONFIG_NET_VENDOR_MICROSEMI is not set
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_NET_VENDOR_MUCSE is not set
CONFIG_NET_VENDOR_NI=y
CONFIG_NI_XGE_MANAGEMENT_ENET=y
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_LPC_ENET=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_NET_VENDOR_QUALCOMM is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_SH_ETH=y
CONFIG_RAVB=y
CONFIG_RENESAS_ETHER_SWITCH=y
CONFIG_RENESAS_GEN4_PTP=y
CONFIG_RTSN=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_NET_VENDOR_SAMSUNG is not set
CONFIG_NET_VENDOR_SEEQ=y
# CONFIG_NET_VENDOR_SOLARFLARE is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC91X is not set
CONFIG_SMSC911X=y
# CONFIG_NET_VENDOR_SOCIONEXT is not set
# CONFIG_NET_VENDOR_SPACEMIT is not set
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=y
# CONFIG_STMMAC_SELFTESTS is not set
CONFIG_STMMAC_PLATFORM=y
CONFIG_DWMAC_DWC_QOS_ETH=y
# CONFIG_DWMAC_GENERIC is not set
# CONFIG_DWMAC_ANARION is not set
CONFIG_DWMAC_EIC7700=y
CONFIG_DWMAC_INGENIC=y
CONFIG_DWMAC_IPQ806X=y
CONFIG_DWMAC_LPC18XX=y
# CONFIG_DWMAC_MEDIATEK is not set
CONFIG_DWMAC_MESON=y
# CONFIG_DWMAC_QCOM_ETHQOS is not set
CONFIG_DWMAC_RENESAS_GBETH=y
CONFIG_DWMAC_ROCKCHIP=y
CONFIG_DWMAC_RZN1=y
CONFIG_DWMAC_S32=y
CONFIG_DWMAC_SOCFPGA=y
CONFIG_DWMAC_SOPHGO=y
CONFIG_DWMAC_STARFIVE=y
CONFIG_DWMAC_STI=y
# CONFIG_DWMAC_STM32 is not set
# CONFIG_DWMAC_SUNXI is not set
CONFIG_DWMAC_SUN8I=y
CONFIG_DWMAC_SUN55I=y
CONFIG_DWMAC_THEAD=y
CONFIG_DWMAC_IMX8=y
CONFIG_DWMAC_INTEL_PLAT=y
CONFIG_DWMAC_LOONGSON1=y
CONFIG_DWMAC_TEGRA=y
CONFIG_DWMAC_VISCONTI=y
# CONFIG_NET_VENDOR_SUNPLUS is not set
# CONFIG_NET_VENDOR_SYNOPSYS is not set
# CONFIG_NET_VENDOR_VERTEXCOM is not set
CONFIG_NET_VENDOR_VIA=y
CONFIG_VIA_VELOCITY=y
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XILINX=y
CONFIG_XILINX_EMACLITE=y
CONFIG_XILINX_LL_TEMAC=y
CONFIG_MDIO_BUS=y
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_PHY_PACKAGE=y
CONFIG_LED_TRIGGER_PHY=y
CONFIG_OPEN_ALLIANCE_HELPERS=y
CONFIG_PHYLIB_LEDS=y
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
CONFIG_AS21XXX_PHY=y
CONFIG_AS21XXX_PHY_DS=y
CONFIG_AIR_EN8811H_PHY=y
CONFIG_AMD_PHY=y
CONFIG_MESON_GXL_PHY=y
# CONFIG_ADIN_PHY is not set
CONFIG_ADIN1100_PHY=y
CONFIG_AQUANTIA_PHY=y
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
CONFIG_BCM54140_PHY=y
# CONFIG_BCM63XX_PHY is not set
CONFIG_BCM7XXX_PHY=y
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_CYGNUS_PHY=y
CONFIG_BCM_NET_PHYLIB=y
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=y
CONFIG_INTEL_XWAY_PHY=y
# CONFIG_LSI_ET1011C_PHY is not set
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y
CONFIG_MARVELL_88Q2XXX_PHY=y
CONFIG_MARVELL_88X2222_PHY=y
CONFIG_MAXLINEAR_GPHY=y
# CONFIG_MAXLINEAR_86110_PHY is not set
CONFIG_MEDIATEK_2P5GE_PHY=y
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MEDIATEK_GE_SOC_PHY=y
CONFIG_MTK_NET_PHYLIB=y
# CONFIG_MICREL_PHY is not set
CONFIG_MICROCHIP_T1S_PHY=y
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=y
CONFIG_MOTORCOMM_PHY=y
# CONFIG_NATIONAL_PHY is not set
CONFIG_NXP_CBTX_PHY=y
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_NCN26000_PHY=y
CONFIG_QCOM_NET_PHYLIB=y
CONFIG_AT803X_PHY=y
CONFIG_QCA83XX_PHY=y
# CONFIG_QCA808X_PHY is not set
CONFIG_QCA807X_PHY=y
CONFIG_QSEMI_PHY=y
CONFIG_REALTEK_PHY=y
CONFIG_REALTEK_PHY_HWMON=y
CONFIG_RENESAS_PHY=y
CONFIG_ROCKCHIP_PHY=y
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=y
# CONFIG_TERANETICS_PHY is not set
CONFIG_DP83822_PHY=y
CONFIG_DP83TC811_PHY=y
# CONFIG_DP83848_PHY is not set
CONFIG_DP83867_PHY=y
CONFIG_DP83869_PHY=y
CONFIG_DP83TD510_PHY=y
CONFIG_DP83TG720_PHY=y
CONFIG_VITESSE_PHY=y
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_PSE_CONTROLLER=y
CONFIG_PSE_REGULATOR=y
# CONFIG_PSE_PD692X0 is not set
# CONFIG_PSE_SI3474 is not set
CONFIG_PSE_TPS23881=y

#
# MCTP Device Drivers
#
CONFIG_MCTP_SERIAL=y
CONFIG_MCTP_SERIAL_TEST=y
CONFIG_MCTP_TRANSPORT_I2C=y
CONFIG_MCTP_TRANSPORT_I3C=y
CONFIG_MCTP_TRANSPORT_USB=y
# end of MCTP Device Drivers

CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_MDIO_AIROHA=y
# CONFIG_MDIO_SUN4I is not set
CONFIG_MDIO_XGENE=y
CONFIG_MDIO_ASPEED=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_BCM_IPROC=y
CONFIG_MDIO_BCM_UNIMAC=y
CONFIG_MDIO_CAVIUM=y
CONFIG_MDIO_GPIO=y
# CONFIG_MDIO_HISI_FEMAC is not set
# CONFIG_MDIO_MVUSB is not set
CONFIG_MDIO_MSCC_MIIM=y
# CONFIG_MDIO_MOXART is not set
CONFIG_MDIO_OCTEON=y
CONFIG_MDIO_IPQ4019=y
CONFIG_MDIO_IPQ8064=y
CONFIG_MDIO_REALTEK_RTL9300=y
CONFIG_MDIO_REGMAP=y

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=y
# CONFIG_MDIO_BUS_MUX_MESON_G12A is not set
CONFIG_MDIO_BUS_MUX_MESON_GXL=y
CONFIG_MDIO_BUS_MUX_BCM6368=y
# CONFIG_MDIO_BUS_MUX_BCM_IPROC is not set
CONFIG_MDIO_BUS_MUX_GPIO=y
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
CONFIG_MDIO_BUS_MUX_MMIOREG=y

#
# PCS device drivers
#
CONFIG_FWNODE_PCS=y
# CONFIG_PCS_AIROHA is not set
CONFIG_PCS_XPCS=y
CONFIG_PCS_LYNX=y
CONFIG_PCS_MTK_LYNXI=y
CONFIG_PCS_MTK_USXGMII=y
CONFIG_PCS_RZN1_MIIC=y
# end of PCS device drivers

CONFIG_PLIP=y
CONFIG_PPP=y
# CONFIG_PPP_BSDCOMP is not set
CONFIG_PPP_DEFLATE=y
# CONFIG_PPP_FILTER is not set
# CONFIG_PPP_MPPE is not set
CONFIG_PPP_MULTILINK=y
# CONFIG_PPPOE is not set
CONFIG_PPPOE_HASH_BITS=4
# CONFIG_PPTP is not set
# CONFIG_PPPOL2TP is not set
CONFIG_PPP_ASYNC=y
# CONFIG_PPP_SYNC_TTY is not set
# CONFIG_SLIP is not set
CONFIG_SLHC=y
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
# CONFIG_USB_KAWETH is not set
CONFIG_USB_PEGASUS=y
CONFIG_USB_RTL8150=y
CONFIG_USB_RTL8152=y
CONFIG_USB_LAN78XX=y
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
# CONFIG_USB_NET_AX88179_178A is not set
CONFIG_USB_NET_CDCETHER=y
# CONFIG_USB_NET_CDC_EEM is not set
CONFIG_USB_NET_CDC_NCM=y
CONFIG_USB_NET_HUAWEI_CDC_NCM=y
CONFIG_USB_NET_CDC_MBIM=y
# CONFIG_USB_NET_DM9601 is not set
CONFIG_USB_NET_SR9700=y
CONFIG_USB_NET_SR9800=y
CONFIG_USB_NET_SMSC75XX=y
# CONFIG_USB_NET_SMSC95XX is not set
CONFIG_USB_NET_GL620A=y
# CONFIG_USB_NET_NET1080 is not set
CONFIG_USB_NET_PLUSB=y
CONFIG_USB_NET_MCS7830=y
CONFIG_USB_NET_RNDIS_HOST=y
# CONFIG_USB_NET_CDC_SUBSET is not set
CONFIG_USB_NET_ZAURUS=y
CONFIG_USB_NET_CX82310_ETH=y
CONFIG_USB_NET_KALMIA=y
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_CDC_PHONET is not set
# CONFIG_USB_IPHETH is not set
CONFIG_USB_SIERRA_NET=y
CONFIG_USB_VL600=y
CONFIG_USB_NET_CH9200=y
# CONFIG_USB_NET_AQC111 is not set
CONFIG_USB_RTL8153_ECM=y
# CONFIG_WLAN is not set
CONFIG_WAN=y
CONFIG_HDLC=y
# CONFIG_HDLC_RAW is not set
CONFIG_HDLC_RAW_ETH=y
# CONFIG_HDLC_CISCO is not set
CONFIG_HDLC_FR=y
CONFIG_HDLC_PPP=y

#
# X.25/LAPB support is disabled
#
CONFIG_FRAMER=y
CONFIG_GENERIC_FRAMER=y
CONFIG_FRAMER_PEF2256=y
# CONFIG_IEEE802154_DRIVERS is not set

#
# Wireless WAN
#
CONFIG_WWAN=y
CONFIG_WWAN_DEBUGFS=y
CONFIG_WWAN_HWSIM=y
CONFIG_MHI_WWAN_CTRL=y
CONFIG_MHI_WWAN_MBIM=y
CONFIG_QCOM_BAM_DMUX=y
CONFIG_RPMSG_WWAN_CTRL=y
# end of Wireless WAN

CONFIG_NETDEVSIM=y
CONFIG_NET_FAILOVER=y
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_KUNIT_TEST=y

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
# CONFIG_JOYSTICK_GF2K is not set
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
# CONFIG_JOYSTICK_IFORCE is not set
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
# CONFIG_JOYSTICK_SPACEBALL is not set
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_DB9=y
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=y
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
CONFIG_JOYSTICK_PXRC=y
# CONFIG_JOYSTICK_QWIIC is not set
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=y
CONFIG_JOYSTICK_SEESAW=y
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F1A is not set
CONFIG_RMI4_F21=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_LIBPS2 is not set
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_APBPS2 is not set
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_SUN4I_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
# CONFIG_SERIAL_8250_FSL is not set
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_EM=y
# CONFIG_SERIAL_8250_IOC3 is not set
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_OMAP=y
CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP=y
# CONFIG_SERIAL_8250_LOONGSON is not set
CONFIG_SERIAL_8250_LPC18XX=y
CONFIG_SERIAL_8250_MT6577=y
CONFIG_SERIAL_8250_UNIPHIER=y
# CONFIG_SERIAL_8250_INGENIC is not set
CONFIG_SERIAL_8250_PXA=y
# CONFIG_SERIAL_8250_TEGRA is not set
CONFIG_SERIAL_8250_BCM7271=y
CONFIG_SERIAL_8250_NI=y
# CONFIG_SERIAL_OF_PLATFORM is not set
CONFIG_SERIAL_8250_DWLIB=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=y
CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
CONFIG_SERIAL_ATMEL=y
CONFIG_SERIAL_ATMEL_CONSOLE=y
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_MESON=y
# CONFIG_SERIAL_MESON_CONSOLE is not set
CONFIG_SERIAL_CLPS711X=y
# CONFIG_SERIAL_CLPS711X_CONSOLE is not set
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_TEGRA is not set
# CONFIG_SERIAL_TEGRA_TCU is not set
CONFIG_SERIAL_TEGRA_UTC=y
# CONFIG_SERIAL_TEGRA_UTC_CONSOLE is not set
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_IMX_EARLYCON=y
# CONFIG_SERIAL_UARTLITE is not set
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_HS_LPC32XX=y
CONFIG_SERIAL_HS_LPC32XX_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_VT8500 is not set
CONFIG_SERIAL_OMAP=y
CONFIG_SERIAL_OMAP_CONSOLE=y
CONFIG_SERIAL_SIFIVE=y
# CONFIG_SERIAL_SIFIVE_CONSOLE is not set
CONFIG_SERIAL_LANTIQ=y
# CONFIG_SERIAL_LANTIQ_CONSOLE is not set
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_MXS_AUART=y
# CONFIG_SERIAL_MXS_AUART_CONSOLE is not set
CONFIG_SERIAL_XILINX_PS_UART=y
# CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
# CONFIG_SERIAL_MPS2_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
# CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
CONFIG_SERIAL_ST_ASC=y
CONFIG_SERIAL_ST_ASC_CONSOLE=y
CONFIG_SERIAL_MEN_Z135=y
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
CONFIG_SERIAL_STM32=y
CONFIG_SERIAL_STM32_CONSOLE=y
CONFIG_SERIAL_MVEBU_UART=y
CONFIG_SERIAL_MVEBU_CONSOLE=y
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
CONFIG_SERIAL_MILBEAUT_USIO=y
CONFIG_SERIAL_MILBEAUT_USIO_PORTS=4
# CONFIG_SERIAL_MILBEAUT_USIO_CONSOLE is not set
# CONFIG_SERIAL_LITEUART is not set
CONFIG_SERIAL_SUNPLUS=y
CONFIG_SERIAL_SUNPLUS_CONSOLE=y
CONFIG_SERIAL_NUVOTON_MA35D1=y
CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE=y
# CONFIG_SERIAL_ESP32 is not set
# CONFIG_SERIAL_ESP32_ACM is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_N_GSM=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_RPMSG_TTY=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=y
# CONFIG_IPMI_WATCHDOG is not set
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=y
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
CONFIG_IPMI_KCS_BMC_SERIO=y
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_SSIF_IPMI_BMC=y
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_AIROHA is not set
CONFIG_HW_RANDOM_ATMEL=y
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_BCM2835=y
CONFIG_HW_RANDOM_BCM74110=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_MXC_RNGA=y
CONFIG_HW_RANDOM_IMX_RNGC=y
# CONFIG_HW_RANDOM_INGENIC_RNG is not set
CONFIG_HW_RANDOM_INGENIC_TRNG=y
CONFIG_HW_RANDOM_HISI=y
# CONFIG_HW_RANDOM_HISTB is not set
# CONFIG_HW_RANDOM_ST is not set
# CONFIG_HW_RANDOM_XGENE is not set
CONFIG_HW_RANDOM_STM32=y
# CONFIG_HW_RANDOM_PIC32 is not set
# CONFIG_HW_RANDOM_MESON is not set
CONFIG_HW_RANDOM_MTK=y
# CONFIG_HW_RANDOM_EXYNOS is not set
CONFIG_HW_RANDOM_NPCM=y
# CONFIG_HW_RANDOM_KEYSTONE is not set
CONFIG_HW_RANDOM_CCTRNG=y
# CONFIG_HW_RANDOM_XIPHERA is not set
CONFIG_HW_RANDOM_JH7110=y
CONFIG_HW_RANDOM_ROCKCHIP=y
CONFIG_DEVMEM=y
CONFIG_TCG_TPM=y
CONFIG_TCG_TPM2_HMAC=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C=y
CONFIG_TCG_TIS_SYNQUACER=y
CONFIG_TCG_TIS_I2C_CR50=y
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=y
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_INFINEON=y
CONFIG_TCG_VTPM_PROXY=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_OF=y
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=y
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=y
# CONFIG_I2C_MUX_MULE is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_ATR=y
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ALTERA=y
CONFIG_I2C_ASPEED=y
CONFIG_I2C_AT91=y
# CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL is not set
CONFIG_I2C_AXXIA=y
# CONFIG_I2C_BCM2835 is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=y
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_AMDISP=y
CONFIG_I2C_DIGICOLOR=y
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_EXYNOS5 is not set
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_GXP=y
# CONFIG_I2C_HIGHLANDER is not set
CONFIG_I2C_HISI=y
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=y
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_IOP3XX=y
CONFIG_I2C_JZ4780=y
# CONFIG_I2C_K1 is not set
CONFIG_I2C_KEBA=y
# CONFIG_I2C_KEMPLD is not set
CONFIG_I2C_LPC2K=y
CONFIG_I2C_LS2X=y
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MICROCHIP_CORE is not set
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=y
# CONFIG_I2C_MV64XXX is not set
CONFIG_I2C_MXS=y
CONFIG_I2C_NOMADIK=y
# CONFIG_I2C_NPCM is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_OMAP=y
CONFIG_I2C_OWL=y
CONFIG_I2C_APPLE=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
CONFIG_I2C_PXA=y
# CONFIG_I2C_PXA_SLAVE is not set
CONFIG_I2C_QCOM_CCI=y
CONFIG_I2C_QUP=y
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_RTL9300 is not set
# CONFIG_I2C_RZV2M is not set
CONFIG_I2C_S3C2410=y
# CONFIG_I2C_SH_MOBILE is not set
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_SPRD=y
CONFIG_I2C_ST=y
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=y
# CONFIG_I2C_UNIPHIER_F is not set
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=y
CONFIG_I2C_XILINX=y
CONFIG_I2C_XLP9XX=y
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_CP2615=y
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_ADI_I3C_MASTER=y
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=y
# CONFIG_AST2600_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=y
# CONFIG_RENESAS_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
# CONFIG_SPMI_APPLE is not set
CONFIG_SPMI_HISI3670=y
CONFIG_SPMI_MSM_PMIC_ARB=y
# CONFIG_SPMI_MTK_PMIF is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set
# CONFIG_PPS_GENERATOR is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
CONFIG_PTP_1588_CLOCK_DTE=y
# CONFIG_PTP_1588_CLOCK_QORIQ is not set

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
CONFIG_PTP_1588_CLOCK_IDTCM=y
CONFIG_PTP_1588_CLOCK_FC3W=y
CONFIG_PTP_1588_CLOCK_MOCK=y
# end of PTP clock support

#
# DPLL device support
#
CONFIG_DPLL=y
CONFIG_DPLL_REFCNT_TRACKER=y
CONFIG_ZL3073X=y
CONFIG_ZL3073X_I2C=y
# end of DPLL device support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_AMDISP=y
CONFIG_PINCTRL_AS3722=y
CONFIG_PINCTRL_AT91=y
# CONFIG_PINCTRL_AT91PIO4 is not set
# CONFIG_PINCTRL_AXP209 is not set
# CONFIG_PINCTRL_AW9523 is not set
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA850_PUPD=y
CONFIG_PINCTRL_EIC7700=y
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_PINCTRL_EYEQ5=y
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_K210 is not set
# CONFIG_PINCTRL_K230 is not set
CONFIG_PINCTRL_LOONGSON2=y
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MAX7360=y
CONFIG_PINCTRL_MAX77620=y
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OCELOT=y
CONFIG_PINCTRL_PEF2256=y
# CONFIG_PINCTRL_PISTACHIO is not set
CONFIG_PINCTRL_RK805=y
# CONFIG_PINCTRL_ROCKCHIP is not set
CONFIG_PINCTRL_SCMI=y
CONFIG_PINCTRL_SINGLE=y
CONFIG_PINCTRL_STMFX=y
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_TB10X is not set
CONFIG_PINCTRL_TPS6594=y
CONFIG_PINCTRL_TH1520=y
# CONFIG_PINCTRL_ZYNQ is not set
CONFIG_PINCTRL_MLXBF3=y
CONFIG_PINCTRL_OWL=y
CONFIG_PINCTRL_S500=y
CONFIG_PINCTRL_S700=y
CONFIG_PINCTRL_S900=y
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
CONFIG_PINCTRL_ASPEED_G5=y
CONFIG_PINCTRL_ASPEED_G6=y
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
CONFIG_PINCTRL_BCM4908=y
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
CONFIG_PINCTRL_BCM6362=y
CONFIG_PINCTRL_BCM6368=y
CONFIG_PINCTRL_BCM63268=y
CONFIG_PINCTRL_BRCMSTB=y
# CONFIG_PINCTRL_BCM2712 is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
CONFIG_PINCTRL_NS=y
CONFIG_PINCTRL_NSP_GPIO=y
CONFIG_PINCTRL_NS2_MUX=y
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_CS42L43 is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y
CONFIG_PINCTRL_SKY1_BASE=y
CONFIG_PINCTRL_SKY1=y
CONFIG_PINCTRL_IMX=y
# CONFIG_PINCTRL_IMX_SCMI is not set
CONFIG_PINCTRL_IMX_SCU=y
# CONFIG_PINCTRL_IMX1 is not set
# CONFIG_PINCTRL_IMX27 is not set
CONFIG_PINCTRL_IMX25=y
CONFIG_PINCTRL_IMX35=y
# CONFIG_PINCTRL_IMX50 is not set
# CONFIG_PINCTRL_IMX51 is not set
# CONFIG_PINCTRL_IMX53 is not set
CONFIG_PINCTRL_IMX6Q=y
# CONFIG_PINCTRL_IMX6SL is not set
# CONFIG_PINCTRL_IMX6SLL is not set
CONFIG_PINCTRL_IMX6SX=y
# CONFIG_PINCTRL_IMX6UL is not set
# CONFIG_PINCTRL_IMX7D is not set
CONFIG_PINCTRL_IMX7ULP=y
CONFIG_PINCTRL_IMX8MM=y
CONFIG_PINCTRL_IMX8MN=y
# CONFIG_PINCTRL_IMX8MP is not set
CONFIG_PINCTRL_IMX8MQ=y
CONFIG_PINCTRL_IMX8QM=y
CONFIG_PINCTRL_IMX8QXP=y
CONFIG_PINCTRL_IMX8DXL=y
# CONFIG_PINCTRL_IMX8ULP is not set
CONFIG_PINCTRL_IMXRT1050=y
# CONFIG_PINCTRL_IMX93 is not set
# CONFIG_PINCTRL_VF610 is not set
CONFIG_PINCTRL_IMXRT1170=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
CONFIG_PINCTRL_CHERRYVIEW=y
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_INTEL_PLATFORM=y
CONFIG_PINCTRL_ALDERLAKE=y
CONFIG_PINCTRL_BROXTON=y
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=y
CONFIG_PINCTRL_DENVERTON=y
CONFIG_PINCTRL_ELKHARTLAKE=y
CONFIG_PINCTRL_EMMITSBURG=y
# CONFIG_PINCTRL_GEMINILAKE is not set
CONFIG_PINCTRL_ICELAKE=y
CONFIG_PINCTRL_JASPERLAKE=y
# CONFIG_PINCTRL_LAKEFIELD is not set
CONFIG_PINCTRL_LEWISBURG=y
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_METEORPOINT=y
# CONFIG_PINCTRL_SUNRISEPOINT is not set
CONFIG_PINCTRL_TIGERLAKE=y
CONFIG_PINCTRL_TANGIER=y
CONFIG_PINCTRL_MERRIFIELD=y
# CONFIG_PINCTRL_MOOREFIELD is not set
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
CONFIG_PINCTRL_MT7623=y
# CONFIG_PINCTRL_MT7629 is not set
# CONFIG_PINCTRL_MT8135 is not set
CONFIG_PINCTRL_MT8127=y
# CONFIG_PINCTRL_AIROHA is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
# CONFIG_PINCTRL_MT6779 is not set
CONFIG_PINCTRL_MT6795=y
# CONFIG_PINCTRL_MT6797 is not set
CONFIG_PINCTRL_MT6878=y
# CONFIG_PINCTRL_MT6893 is not set
CONFIG_PINCTRL_MT7622=y
# CONFIG_PINCTRL_MT7981 is not set
# CONFIG_PINCTRL_MT7986 is not set
CONFIG_PINCTRL_MT7987=y
CONFIG_PINCTRL_MT7988=y
CONFIG_PINCTRL_MT8167=y
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
# CONFIG_PINCTRL_MT8186 is not set
# CONFIG_PINCTRL_MT8188 is not set
CONFIG_PINCTRL_MT8189=y
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
CONFIG_PINCTRL_MT8196=y
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
CONFIG_PINCTRL_MESON8=y
CONFIG_PINCTRL_MESON8B=y
# CONFIG_PINCTRL_MESON_GXBB is not set
# CONFIG_PINCTRL_MESON_GXL is not set
CONFIG_PINCTRL_MESON8_PMX=y
CONFIG_PINCTRL_MESON_AXG=y
CONFIG_PINCTRL_MESON_AXG_PMX=y
CONFIG_PINCTRL_MESON_G12A=y
# CONFIG_PINCTRL_MESON_A1 is not set
# CONFIG_PINCTRL_MESON_S4 is not set
CONFIG_PINCTRL_AMLOGIC_A4=y
CONFIG_PINCTRL_AMLOGIC_C3=y
CONFIG_PINCTRL_AMLOGIC_T7=y
CONFIG_PINCTRL_PIC64GX=y
# CONFIG_PINCTRL_POLARFIRE_SOC is not set
CONFIG_PINCTRL_NOMADIK=y
# CONFIG_PINCTRL_WPCM450 is not set
CONFIG_PINCTRL_NPCM7XX=y
# CONFIG_PINCTRL_NPCM8XX is not set
CONFIG_PINCTRL_MA35=y
CONFIG_PINCTRL_MA35D1=y
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
CONFIG_PINCTRL_PXA27X=y
# CONFIG_PINCTRL_MSM is not set
CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A7742=y
CONFIG_PINCTRL_PFC_R8A7743=y
CONFIG_PINCTRL_PFC_R8A7744=y
CONFIG_PINCTRL_PFC_R8A7745=y
CONFIG_PINCTRL_PFC_R8A77470=y
CONFIG_PINCTRL_PFC_R8A774A1=y
CONFIG_PINCTRL_PFC_R8A774B1=y
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
CONFIG_PINCTRL_PFC_R8A7790=y
CONFIG_PINCTRL_PFC_R8A7791=y
CONFIG_PINCTRL_PFC_R8A7792=y
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7794=y
CONFIG_PINCTRL_PFC_R8A77951=y
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
CONFIG_PINCTRL_PFC_R8A77965=y
# CONFIG_PINCTRL_PFC_R8A77970 is not set
CONFIG_PINCTRL_PFC_R8A77980=y
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
# CONFIG_PINCTRL_PFC_R8A779H0 is not set
CONFIG_PINCTRL_PFC_SH7203=y
CONFIG_PINCTRL_PFC_SH7264=y
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH73A0 is not set
CONFIG_PINCTRL_PFC_SH7720=y
# CONFIG_PINCTRL_PFC_SH7722 is not set
CONFIG_PINCTRL_PFC_SH7723=y
CONFIG_PINCTRL_PFC_SH7724=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
CONFIG_PINCTRL_PFC_SH7757=y
CONFIG_PINCTRL_PFC_SH7785=y
# CONFIG_PINCTRL_PFC_SH7786 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# CONFIG_PINCTRL_RZA1 is not set
CONFIG_PINCTRL_RZA2=y
# CONFIG_PINCTRL_RZG2L is not set
CONFIG_PINCTRL_RZN1=y
# CONFIG_PINCTRL_RZV2M is not set
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
CONFIG_PINCTRL_EXYNOS=y
CONFIG_PINCTRL_EXYNOS_ARM=y
# CONFIG_PINCTRL_EXYNOS_ARM64 is not set
CONFIG_PINCTRL_S3C64XX=y
CONFIG_PINCTRL_SOPHGO_COMMON=y
CONFIG_PINCTRL_SOPHGO_CV18XX_OPS=y
CONFIG_PINCTRL_SOPHGO_CV1800B=y
# CONFIG_PINCTRL_SOPHGO_CV1812H is not set
CONFIG_PINCTRL_SOPHGO_SG2000=y
CONFIG_PINCTRL_SOPHGO_SG2002=y
CONFIG_PINCTRL_SOPHGO_SG2042_OPS=y
# CONFIG_PINCTRL_SOPHGO_SG2042 is not set
CONFIG_PINCTRL_SOPHGO_SG2044=y
# CONFIG_PINCTRL_SPACEMIT_K1 is not set
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STARFIVE_JH7100=y
CONFIG_PINCTRL_STARFIVE_JH7110=y
CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
CONFIG_PINCTRL_STM32F746=y
CONFIG_PINCTRL_STM32F769=y
CONFIG_PINCTRL_STM32H743=y
CONFIG_PINCTRL_STM32MP135=y
CONFIG_PINCTRL_STM32MP157=y
CONFIG_PINCTRL_STM32MP257=y
CONFIG_PINCTRL_STM32_HDP=y
CONFIG_PINCTRL_TI_IODELAY=y
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
CONFIG_PINCTRL_UNIPHIER_PRO4=y
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
CONFIG_PINCTRL_UNIPHIER_LD6B=y
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
CONFIG_PINCTRL_UNIPHIER_PXS3=y
CONFIG_PINCTRL_UNIPHIER_NX1=y
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB_LEGACY=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_GPIO_SHARED=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
CONFIG_GPIO_RASPBERRYPI_EXP=y
CONFIG_GPIO_BCM_KONA=y
CONFIG_GPIO_BCM_XGS_IPROC=y
CONFIG_GPIO_BLZP1600=y
CONFIG_GPIO_BRCMSTB=y
CONFIG_GPIO_CADENCE=y
CONFIG_GPIO_CLPS711X=y
# CONFIG_GPIO_DAVINCI is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EIC_SPRD is not set
CONFIG_GPIO_EM=y
CONFIG_GPIO_EP93XX=y
# CONFIG_GPIO_GE_FPGA is not set
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRANITERAPIDS=y
CONFIG_GPIO_GRGPIO=y
CONFIG_GPIO_HISI=y
CONFIG_GPIO_HLWD=y
CONFIG_GPIO_IXP4XX=y
CONFIG_GPIO_LOGICVC=y
# CONFIG_GPIO_LOONGSON_64BIT is not set
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_LPC32XX is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_MVEBU=y
# CONFIG_GPIO_MXC is not set
CONFIG_GPIO_MXS=y
CONFIG_GPIO_NOMADIK=y
# CONFIG_GPIO_NPCM_SGPIO is not set
CONFIG_GPIO_OMAP=y
CONFIG_GPIO_PL061=y
CONFIG_GPIO_POLARFIRE_SOC=y
CONFIG_GPIO_PXA=y
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_RDA is not set
CONFIG_GPIO_REALTEK_OTTO=y
# CONFIG_GPIO_ROCKCHIP is not set
# CONFIG_GPIO_RTD is not set
CONFIG_GPIO_SAMA5D2_PIOBU=y
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
CONFIG_GPIO_SPACEMIT_K1=y
# CONFIG_GPIO_SPRD is not set
CONFIG_GPIO_STP_XWAY=y
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_TB10X=y
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
CONFIG_GPIO_TS4800=y
CONFIG_GPIO_UNIPHIER=y
CONFIG_GPIO_VF610=y
CONFIG_GPIO_VISCONTI=y
# CONFIG_GPIO_WCD934X is not set
CONFIG_GPIO_XGENE_SB=y
CONFIG_GPIO_XILINX=y
CONFIG_GPIO_XLP=y
# CONFIG_GPIO_XTENSA is not set
CONFIG_GPIO_ZYNQ=y
CONFIG_GPIO_ZYNQMP_MODEPIN=y
CONFIG_GPIO_LOONGSON1=y
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_MSC313 is not set
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_FXL6408=y
CONFIG_GPIO_DS4520=y
# CONFIG_GPIO_GW_PLD is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_BD71815 is not set
CONFIG_GPIO_BD71828=y
# CONFIG_GPIO_BD72720 is not set
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DA9055=y
CONFIG_HTC_EGPIO=y
# CONFIG_GPIO_KEMPLD is not set
# CONFIG_GPIO_LP873X is not set
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_MAX7360=y
CONFIG_GPIO_MAX77620=y
CONFIG_GPIO_MAX77650=y
CONFIG_GPIO_MAX77759=y
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
CONFIG_GPIO_QIXIS_FPGA=y
CONFIG_GPIO_SL28CPLD=y
CONFIG_GPIO_STMPE=y
CONFIG_GPIO_TN48M_CPLD=y
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS65218=y
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_WM831X=y
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_MPSSE is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_LINE_MUX=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# CONFIG_GPIO_SHARED_PROXY is not set
# end of Virtual GPIO drivers

#
# GPIO Debugging utilities
#
CONFIG_GPIO_VIRTUSER=y
# end of GPIO Debugging utilities

CONFIG_DEV_SYNC_PROBE=y
CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_AMD_AXI=y
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_MXC=y
CONFIG_W1_MASTER_GPIO=y
# CONFIG_HDQ_MASTER_OMAP is not set
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_AS3722=y
# CONFIG_POWER_RESET_BRCMKONA is not set
# CONFIG_POWER_RESET_BRCMSTB is not set
# CONFIG_POWER_RESET_EP93XX is not set
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
CONFIG_POWER_RESET_GPIO=y
CONFIG_POWER_RESET_GPIO_RESTART=y
CONFIG_POWER_RESET_LINKSTATION=y
# CONFIG_POWER_RESET_OCELOT_RESET is not set
# CONFIG_POWER_RESET_ODROID_GO_ULTRA_POWEROFF is not set
CONFIG_POWER_RESET_LTC2952=y
CONFIG_POWER_RESET_MT6323=y
# CONFIG_POWER_RESET_REGULATOR is not set
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_TH1520_AON=y
CONFIG_POWER_RESET_TORADEX_EC=y
CONFIG_POWER_RESET_TPS65086=y
# CONFIG_POWER_RESET_KEYSTONE is not set
CONFIG_POWER_RESET_SPACEMIT_P1=y
CONFIG_POWER_RESET_SYSCON=y
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
# CONFIG_POWER_RESET_RMOBILE is not set
CONFIG_REBOOT_MODE=y
CONFIG_SYSCON_REBOOT_MODE=y
CONFIG_POWER_RESET_SC27XX=y
# CONFIG_NVMEM_REBOOT_MODE is not set
CONFIG_POWER_SEQUENCING=y
# CONFIG_POWER_SEQUENCING_QCOM_WCN is not set
# CONFIG_POWER_SEQUENCING_TH1520_GPU is not set
# CONFIG_POWER_SEQUENCING_PCIE_M2 is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_ADC_BATTERY_HELPER=y
CONFIG_IP5XXX_POWER=y
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
CONFIG_TEST_POWER=y
CONFIG_BATTERY_88PM860X=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_CHAGALL=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1720X=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_88PM860X=y
CONFIG_CHARGER_PF1550=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX14577 is not set
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77650=y
CONFIG_CHARGER_MAX77693=y
CONFIG_CHARGER_MAX77705=y
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MAX8971 is not set
CONFIG_CHARGER_MT6360=y
CONFIG_CHARGER_QCOM_SMBB=y
# CONFIG_BATTERY_PM8916_BMS_VM is not set
# CONFIG_CHARGER_PM8916_LBC is not set
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ257XX=y
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_RK817=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65217=y
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_RT9467 is not set
# CONFIG_CHARGER_RT9471 is not set
# CONFIG_CHARGER_RT9756 is not set
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_FUEL_GAUGE_STC3117 is not set
CONFIG_CHARGER_UCS1002=y
# CONFIG_CHARGER_BD71828 is not set
CONFIG_CHARGER_BD99954=y
# CONFIG_BATTERY_ACER_A500 is not set
CONFIG_BATTERY_UG3105=y
CONFIG_FUEL_GAUGE_MM8013=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_SMPRO is not set
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1025=y
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=y
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=y
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_ASUS_ROG_RYUJIN is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ARM_SCMI is not set
CONFIG_SENSORS_ARM_SCPI=y
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ASPEED_G6=y
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_BT1_PVT is not set
CONFIG_SENSORS_CHIPCAP2=y
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=y
CONFIG_SENSORS_DRIVETEMP=y
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DA9052_ADC=y
# CONFIG_SENSORS_DA9055 is not set
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F75375S=y
# CONFIG_SENSORS_GSC is not set
CONFIG_SENSORS_MC13783_ADC=y
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GIGABYTE_WATERFORCE=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_GXP_FAN_CTRL=y
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_HS3001=y
CONFIG_SENSORS_HTU31=y
# CONFIG_SENSORS_IBMAEM is not set
# CONFIG_SENSORS_IBMPEX is not set
# CONFIG_SENSORS_ISL28022 is not set
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWERZ=y
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LAN966X=y
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2990=y
CONFIG_SENSORS_LTC2991=y
CONFIG_SENSORS_LTC2992=y
CONFIG_SENSORS_LTC4151=y
CONFIG_SENSORS_LTC4215=y
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_LTC4282=y
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX31760=y
# CONFIG_MAX31827 is not set
CONFIG_SENSORS_MAX6620=y
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MAX77705=y
# CONFIG_SENSORS_MC34VR500 is not set
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_LM63=y
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775_I2C=y
CONFIG_SENSORS_NCT7363=y
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_NSA320=y
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_KRAKEN3 is not set
CONFIG_SENSORS_NZXT_SMART2=y
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_PT5161L is not set
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
CONFIG_SENSORS_SA67MCU=y
# CONFIG_SENSORS_SL28CPLD is not set
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SHT15=y
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC2305=y
CONFIG_SENSORS_EMC6W201=y
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SFCTEMP=y
# CONFIG_SENSORS_SG2042_MCU is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA238=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_SPD5118=y
# CONFIG_SENSORS_SPD5118_DETECT is not set
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=y
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_TSC1641=y
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=y
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_WM831X=y
# CONFIG_SENSORS_WM8350 is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
# CONFIG_THERMAL_DEBUGFS is not set
CONFIG_THERMAL_CORE_TESTING=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_OF is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=y
# CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_GOV_STEP_WISE is not set
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=y
CONFIG_HISI_THERMAL=y
# CONFIG_IMX_THERMAL is not set
CONFIG_IMX8MM_THERMAL=y
CONFIG_IMX91_THERMAL=y
CONFIG_K3_THERMAL=y
CONFIG_MAX77620_THERMAL=y
# CONFIG_AIROHA_THERMAL is not set
CONFIG_SPEAR_THERMAL=y
# CONFIG_SUN8I_THERMAL is not set
# CONFIG_ROCKCHIP_THERMAL is not set
CONFIG_KIRKWOOD_THERMAL=y
# CONFIG_DOVE_THERMAL is not set
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y

#
# Mediatek thermal drivers
#
# end of Mediatek thermal drivers

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BRCMSTB_THERMAL=y
CONFIG_BCM_NS_THERMAL=y
CONFIG_BCM_SR_THERMAL=y
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
CONFIG_OMAP3_THERMAL=y
# CONFIG_OMAP4_THERMAL is not set
# CONFIG_OMAP5_THERMAL is not set
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

# CONFIG_RCAR_THERMAL is not set
CONFIG_RCAR_GEN3_THERMAL=y
CONFIG_RZG2L_THERMAL=y
CONFIG_RZG3E_THERMAL=y

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=y
# CONFIG_TEGRA_BPMP_THERMAL is not set
CONFIG_TEGRA30_TSENSOR=y
# end of NVIDIA Tegra thermal drivers

#
# Qualcomm thermal drivers
#
# CONFIG_QCOM_TSENS is not set
# CONFIG_QCOM_LMH is not set
# end of Qualcomm thermal drivers

# CONFIG_SPRD_THERMAL is not set
# CONFIG_KHADAS_MCU_FAN_THERMAL is not set
CONFIG_LOONGSON2_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_BD957XMUF_WATCHDOG=y
CONFIG_BD96801_WATCHDOG=y
CONFIG_DA9052_WATCHDOG=y
# CONFIG_DA9055_WATCHDOG is not set
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG is not set
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_MENZ069_WATCHDOG=y
# CONFIG_WM831X_WATCHDOG is not set
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_XILINX_WINDOW_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_MLX_WDT=y
# CONFIG_SL28CPLD_WATCHDOG is not set
CONFIG_AIROHA_WATCHDOG=y
CONFIG_ARMADA_37XX_WATCHDOG=y
# CONFIG_ASM9260_WATCHDOG is not set
# CONFIG_AT91RM9200_WATCHDOG is not set
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
CONFIG_SA1100_WATCHDOG=y
# CONFIG_DW_WATCHDOG is not set
CONFIG_EP93XX_WATCHDOG=y
CONFIG_OMAP_WATCHDOG=y
# CONFIG_PNX4008_WATCHDOG is not set
# CONFIG_DAVINCI_WATCHDOG is not set
# CONFIG_K3_RTI_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=y
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=y
CONFIG_TS4800_WATCHDOG=y
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_MAX77620_WATCHDOG is not set
# CONFIG_IMX2_WDT is not set
# CONFIG_IMX7ULP_WDT is not set
# CONFIG_S32G_WDT is not set
CONFIG_MOXART_WDT=y
# CONFIG_ST_LPC_WATCHDOG is not set
CONFIG_TEGRA_WATCHDOG=y
CONFIG_QCOM_WDT=y
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
# CONFIG_MEDIATEK_WATCHDOG is not set
CONFIG_DIGICOLOR_WATCHDOG=y
# CONFIG_LPC18XX_WATCHDOG is not set
CONFIG_RENESAS_WDT=y
# CONFIG_RENESAS_WWDT is not set
# CONFIG_RENESAS_RZAWDT is not set
# CONFIG_RENESAS_RZN1WDT is not set
CONFIG_RENESAS_RZG2LWDT=y
CONFIG_RENESAS_RZV2HWDT=y
CONFIG_ASPEED_WATCHDOG=y
CONFIG_STM32_WATCHDOG=y
# CONFIG_STPMIC1_WATCHDOG is not set
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
# CONFIG_REALTEK_OTTO_WDT is not set
CONFIG_SPRD_WATCHDOG=y
CONFIG_PM8916_WATCHDOG=y
CONFIG_VISCONTI_WATCHDOG=y
CONFIG_MSC313E_WATCHDOG=y
CONFIG_APPLE_WATCHDOG=y
CONFIG_SUNPLUS_WATCHDOG=y
CONFIG_SC520_WDT=y
CONFIG_KEMPLD_WDT=y
CONFIG_TQMX86_WDT=y
# CONFIG_BCM47XX_WDT is not set
# CONFIG_JZ4740_WDT is not set
# CONFIG_BCM2835_WDT is not set
CONFIG_BCM_KONA_WDT=y
# CONFIG_BCM_KONA_WDT_DEBUG is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
CONFIG_LOONGSON1_WDT=y
# CONFIG_GXP_WATCHDOG is not set
CONFIG_MT7621_WDT=y
CONFIG_MPC5200_WDT=y
CONFIG_MEN_A21_WDT=y
# CONFIG_STARFIVE_WATCHDOG is not set
# CONFIG_UML_WATCHDOG is not set

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_HOST_SOC=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_MIPS is not set
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ADP5585 is not set
# CONFIG_MFD_ALTERA_SYSMGR is not set
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_SUN4I_GPADC=y
CONFIG_MFD_AS3711=y
CONFIG_MFD_SMPRO=y
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CS40L50_CORE=y
CONFIG_MFD_CS40L50_I2C=y
CONFIG_MFD_CS42L43=y
# CONFIG_MFD_CS42L43_I2C is not set
CONFIG_MFD_CS42L43_SDW=y
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
# CONFIG_MFD_TN48M_CPLD is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
# CONFIG_MFD_DA9062 is not set
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_ENE_KB3930 is not set
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_MFD_MXS_LRADC=y
CONFIG_MFD_MX25_TSADC=y
CONFIG_MFD_PF1550=y
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_MFD_HI6421_SPMI=y
# CONFIG_MFD_HI655X_PMIC is not set
# CONFIG_INTEL_SOC_PMIC is not set
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_88PM886_PMIC is not set
CONFIG_MFD_MAX5970=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77541=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77705=y
# CONFIG_MFD_MAX77714 is not set
CONFIG_MFD_MAX77759=y
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_NCT6694 is not set
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_NTXEC=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_SPACEMIT_P1=y
CONFIG_MFD_SPMI_PMIC=y
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK8XX=y
CONFIG_MFD_RK8XX_I2C=y
CONFIG_MFD_RN5T618=y
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SEC_ACPM=y
CONFIG_MFD_SEC_I2C=y
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
CONFIG_RZ_MTU3=y
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
# CONFIG_STMPE_I2C is not set
# end of STMicroelectronics STMPE Interface Drivers

# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_BQ257XX=y
CONFIG_MFD_OMAP_USB_HOST=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TI_LP87565 is not set
CONFIG_MFD_TPS65218=y
# CONFIG_MFD_TPS65219 is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS6594=y
CONFIG_MFD_TPS6594_I2C=y
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
CONFIG_MFD_STW481X=y
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD71828=y
CONFIG_MFD_ROHM_BD957XMUF=y
CONFIG_MFD_ROHM_BD96801=y
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_MFD_KHADAS_MCU=y
CONFIG_MFD_ACER_A500_EC=y
CONFIG_MFD_QCOM_PM8008=y
CONFIG_MFD_RSMU_I2C=y
CONFIG_MFD_MAX7360=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_NETLINK_EVENTS=y
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ADP5055=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=y
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
# CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
CONFIG_REGULATOR_ARM_SCMI=y
# CONFIG_REGULATOR_AS3711 is not set
CONFIG_REGULATOR_AS3722=y
# CONFIG_REGULATOR_AW37503 is not set
CONFIG_REGULATOR_AXP20X=y
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_BD71815=y
CONFIG_REGULATOR_BD71828=y
CONFIG_REGULATOR_BD718XX=y
CONFIG_REGULATOR_BD9571MWV=y
# CONFIG_REGULATOR_BD957XMUF is not set
CONFIG_REGULATOR_BD96801=y
CONFIG_REGULATOR_BQ257XX=y
CONFIG_REGULATOR_DA9052=y
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9063 is not set
CONFIG_REGULATOR_DA9121=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_FAN53880=y
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_HI6421V600 is not set
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_FP9931=y
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP873X=y
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP8788=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX5970=y
CONFIG_REGULATOR_MAX77503=y
CONFIG_REGULATOR_MAX77541=y
CONFIG_REGULATOR_MAX77620=y
CONFIG_REGULATOR_MAX77650=y
# CONFIG_REGULATOR_MAX77675 is not set
CONFIG_REGULATOR_MAX77857=y
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX20411 is not set
CONFIG_REGULATOR_MAX77686=y
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MAX77838=y
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MCP16502 is not set
CONFIG_REGULATOR_MP5416=y
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MP886X=y
CONFIG_REGULATOR_MPQ7920=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6316=y
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6331=y
# CONFIG_REGULATOR_MT6332 is not set
CONFIG_REGULATOR_MT6357=y
# CONFIG_REGULATOR_MT6358 is not set
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_MT6363=y
CONFIG_REGULATOR_MT6397=y
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PF9453=y
# CONFIG_REGULATOR_PF0900 is not set
CONFIG_REGULATOR_PF530X=y
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PF1550=y
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_PM8008=y
# CONFIG_REGULATOR_QCOM_REFGEN is not set
CONFIG_REGULATOR_QCOM_RPMH=y
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=y
# CONFIG_REGULATOR_RAA215300 is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2=y
# CONFIG_REGULATOR_RK808 is not set
CONFIG_REGULATOR_RN5T618=y
CONFIG_REGULATOR_ROHM=y
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT4803 is not set
CONFIG_REGULATOR_RT4831=y
# CONFIG_REGULATOR_RT5033 is not set
CONFIG_REGULATOR_RT5120=y
# CONFIG_REGULATOR_RT5133 is not set
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5739=y
CONFIG_REGULATOR_RT5759=y
CONFIG_REGULATOR_RT6160=y
# CONFIG_REGULATOR_RT6190 is not set
# CONFIG_REGULATOR_RT6245 is not set
CONFIG_REGULATOR_RT8092=y
CONFIG_REGULATOR_RTQ2134=y
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_RTQ2208=y
CONFIG_REGULATOR_S2DOS05=y
CONFIG_REGULATOR_S2MPA01=y
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SKY81452=y
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_SPACEMIT_P1=y
# CONFIG_REGULATOR_STM32_BOOSTER is not set
CONFIG_REGULATOR_STM32_VREFBUF=y
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STPMIC1=y
CONFIG_REGULATOR_TI_ABB=y
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SUN20I=y
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_SY8824X=y
CONFIG_REGULATOR_SY8827N=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS6286X=y
CONFIG_REGULATOR_TPS6287X=y
CONFIG_REGULATOR_TPS65023=y
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65132=y
# CONFIG_REGULATOR_TPS65185 is not set
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65218=y
CONFIG_REGULATOR_TPS6594=y
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TPS68470=y
# CONFIG_REGULATOR_UNIPHIER is not set
CONFIG_REGULATOR_RZG2L_VBCTRL=y
CONFIG_REGULATOR_VCTRL=y
# CONFIG_REGULATOR_WM831X is not set
# CONFIG_REGULATOR_WM8350 is not set
CONFIG_REGULATOR_WM8400=y
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=y
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=y
# CONFIG_IR_NEC_DECODER is not set
# CONFIG_IR_RC5_DECODER is not set
# CONFIG_IR_RC6_DECODER is not set
# CONFIG_IR_RCMM_DECODER is not set
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_SONY_DECODER=y
CONFIG_IR_XMP_DECODER=y
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_RC=y
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
CONFIG_CEC_NXP_TDA9950=y
CONFIG_CEC_MESON_AO=y
# CONFIG_CEC_MESON_G12A_AO is not set
# CONFIG_CEC_GPIO is not set
CONFIG_CEC_SAMSUNG_S5P=y
CONFIG_CEC_STI=y
CONFIG_CEC_STM32=y
CONFIG_CEC_TEGRA=y
CONFIG_USB_EXTRON_DA_HD_4K_PLUS_CEC=y
CONFIG_USB_PULSE8_CEC=y
CONFIG_USB_RAINSHADOW_CEC=y
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y
# CONFIG_DVB_CORE is not set
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_V4L2_JPEG_HELPER=y
CONFIG_V4L2_H264=y
CONFIG_V4L2_VP9=y
CONFIG_V4L2_MEM2MEM_DEV=y
CONFIG_V4L2_FLASH_LED_CLASS=y
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
CONFIG_V4L2_CCI=y
CONFIG_V4L2_CCI_I2C=y
CONFIG_V4L2_ISP=y
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_SAA7706H=y
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_RADIO_TEA5764 is not set
CONFIG_RADIO_TEF6862=y
CONFIG_USB_DSBR=y
# CONFIG_USB_KEENE is not set
CONFIG_USB_MA901=y
CONFIG_USB_MR800=y
CONFIG_USB_RAREMONO=y
CONFIG_RADIO_SI470X=y
# CONFIG_USB_SI470X is not set
# CONFIG_I2C_SI470X is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
CONFIG_V4L_MEM2MEM_DRIVERS=y
CONFIG_VIDEO_MEM2MEM_DEINTERLACE=y

#
# Allegro DVT media platform drivers
#
CONFIG_VIDEO_ALLEGRO_DVT=y

#
# Amlogic media platform drivers
#
CONFIG_VIDEO_C3_ISP=y
# CONFIG_VIDEO_C3_MIPI_ADAPTER is not set
CONFIG_VIDEO_C3_MIPI_CSI2=y
# CONFIG_VIDEO_MESON_GE2D is not set

#
# Amphion drivers
#
CONFIG_VIDEO_AMPHION_VPU=y

#
# ARM media platform drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#
CONFIG_VIDEO_BCM2835_UNICAM=y

#
# Cadence media platform drivers
#
# CONFIG_VIDEO_CADENCE_CSI2RX is not set
# CONFIG_VIDEO_CADENCE_CSI2TX is not set

#
# Chips&Media media platform drivers
#
# CONFIG_VIDEO_CODA is not set
CONFIG_VIDEO_WAVE_VPU=y
CONFIG_VIDEO_E5010_JPEG_ENC=y

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#
CONFIG_VIDEO_MEDIATEK_JPEG=y
# CONFIG_VIDEO_MEDIATEK_MDP is not set
CONFIG_VIDEO_MEDIATEK_VCODEC_SCP=y
CONFIG_VIDEO_MEDIATEK_VCODEC_VPU=y
CONFIG_VIDEO_MEDIATEK_VCODEC=y
CONFIG_VIDEO_MEDIATEK_VPU=y

#
# Microchip Technology, Inc. media platform drivers
#

#
# Nuvoton media platform drivers
#

#
# NVidia media platform drivers
#
CONFIG_VIDEO_TEGRA_VDE=y

#
# NXP media platform drivers
#
# CONFIG_VIDEO_IMX7_CSI is not set
# CONFIG_VIDEO_IMX8MQ_MIPI_CSI2 is not set
# CONFIG_VIDEO_IMX_MIPI_CSIS is not set
CONFIG_VIDEO_IMX8_ISI=y
# CONFIG_VIDEO_IMX8_ISI_M2M is not set
CONFIG_VIDEO_IMX_PXP=y
CONFIG_VIDEO_MX2_EMMAPRP=y
CONFIG_VIDEO_DW100=y
CONFIG_VIDEO_IMX8_JPEG=y

#
# Qualcomm media platform drivers
#
# CONFIG_VIDEO_QCOM_IRIS is not set

#
# Raspberry Pi media platform drivers
#
CONFIG_VIDEO_RP1_CFE=y

#
# Renesas media platform drivers
#
CONFIG_VIDEO_RENESAS_FCP=y
# CONFIG_VIDEO_RENESAS_FDP1 is not set
CONFIG_VIDEO_RENESAS_JPU=y
# CONFIG_VIDEO_RENESAS_VSP1 is not set

#
# Rockchip media platform drivers
#
CONFIG_VIDEO_ROCKCHIP_RGA=y
CONFIG_VIDEO_ROCKCHIP_VDEC=y

#
# Samsung media platform drivers
#
CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=y
CONFIG_VIDEO_SAMSUNG_S5P_G2D=y
# CONFIG_VIDEO_SAMSUNG_S5P_JPEG is not set
CONFIG_VIDEO_SAMSUNG_S5P_MFC=y

#
# STMicroelectronics media platform drivers
#
CONFIG_VIDEO_STI_BDISP=y
# CONFIG_VIDEO_STI_DELTA is not set
# CONFIG_VIDEO_STI_HVA is not set
# CONFIG_VIDEO_STM32_DMA2D is not set

#
# Sunxi media platform drivers
#
# CONFIG_VIDEO_SUN8I_DEINTERLACE is not set
CONFIG_VIDEO_SUN8I_ROTATE=y
CONFIG_VIDEO_SYNOPSYS_HDMIRX=y
CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y

#
# Texas Instruments drivers
#
# CONFIG_VIDEO_TI_VIP is not set
# CONFIG_VIDEO_TI_VPE is not set

#
# Verisilicon media platform drivers
#
# CONFIG_VIDEO_HANTRO is not set

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
CONFIG_V4L_TEST_DRIVERS=y
CONFIG_VIDEO_VIM2M=y
# CONFIG_VIDEO_VICODEC is not set
CONFIG_VIDEO_VIMC=y
# CONFIG_VIDEO_VIVID is not set
# CONFIG_VIDEO_VISL is not set
CONFIG_VIDEO_V4L2_TPG=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y
# end of Media drivers

#
# Media ancillary drivers
#

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=y
CONFIG_VIDEO_CAMERA_SENSOR=y
CONFIG_VIDEO_APTINA_PLL=y
CONFIG_VIDEO_ALVIUM_CSI2=y
CONFIG_VIDEO_AR0521=y
CONFIG_VIDEO_GC0308=y
# CONFIG_VIDEO_GC0310 is not set
CONFIG_VIDEO_GC05A2=y
CONFIG_VIDEO_GC08A3=y
CONFIG_VIDEO_GC2145=y
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_HI846 is not set
CONFIG_VIDEO_HI847=y
CONFIG_VIDEO_IMX111=y
# CONFIG_VIDEO_IMX208 is not set
# CONFIG_VIDEO_IMX214 is not set
CONFIG_VIDEO_IMX219=y
CONFIG_VIDEO_IMX258=y
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX283=y
CONFIG_VIDEO_IMX290=y
# CONFIG_VIDEO_IMX296 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX334 is not set
CONFIG_VIDEO_IMX335=y
CONFIG_VIDEO_IMX355=y
CONFIG_VIDEO_IMX412=y
# CONFIG_VIDEO_IMX415 is not set
CONFIG_VIDEO_MAX9271_LIB=y
CONFIG_VIDEO_MT9M001=y
# CONFIG_VIDEO_MT9M111 is not set
CONFIG_VIDEO_MT9M114=y
CONFIG_VIDEO_MT9P031=y
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_OG01A1B is not set
# CONFIG_VIDEO_OG0VE1B is not set
CONFIG_VIDEO_OS05B10=y
CONFIG_VIDEO_OV01A10=y
# CONFIG_VIDEO_OV02A10 is not set
CONFIG_VIDEO_OV02E10=y
# CONFIG_VIDEO_OV02C10 is not set
# CONFIG_VIDEO_OV08D10 is not set
CONFIG_VIDEO_OV08X40=y
# CONFIG_VIDEO_OV13858 is not set
CONFIG_VIDEO_OV13B10=y
CONFIG_VIDEO_OV2640=y
CONFIG_VIDEO_OV2659=y
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV2735 is not set
CONFIG_VIDEO_OV2740=y
# CONFIG_VIDEO_OV4689 is not set
CONFIG_VIDEO_OV5640=y
CONFIG_VIDEO_OV5645=y
# CONFIG_VIDEO_OV5647 is not set
CONFIG_VIDEO_OV5648=y
CONFIG_VIDEO_OV5670=y
CONFIG_VIDEO_OV5675=y
CONFIG_VIDEO_OV5693=y
CONFIG_VIDEO_OV5695=y
CONFIG_VIDEO_OV6211=y
CONFIG_VIDEO_OV64A40=y
# CONFIG_VIDEO_OV7251 is not set
CONFIG_VIDEO_OV7640=y
# CONFIG_VIDEO_OV7670 is not set
CONFIG_VIDEO_OV772X=y
CONFIG_VIDEO_OV7740=y
CONFIG_VIDEO_OV8856=y
CONFIG_VIDEO_OV8858=y
CONFIG_VIDEO_OV8865=y
CONFIG_VIDEO_OV9282=y
CONFIG_VIDEO_OV9640=y
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_RDACM20=y
CONFIG_VIDEO_RDACM21=y
CONFIG_VIDEO_RJ54N1=y
# CONFIG_VIDEO_S5K3M5 is not set
CONFIG_VIDEO_S5K5BAF=y
CONFIG_VIDEO_S5K6A3=y
CONFIG_VIDEO_S5KJN1=y
# CONFIG_VIDEO_VD55G1 is not set
CONFIG_VIDEO_VD56G3=y
CONFIG_VIDEO_VGXY61=y
# CONFIG_VIDEO_CCS is not set
# CONFIG_VIDEO_ET8EK8 is not set

#
# Camera ISPs
#
CONFIG_VIDEO_THP7312=y
# end of Camera ISPs

# CONFIG_VIDEO_CAMERA_LENS is not set

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
CONFIG_VIDEO_LM3646=y
# end of Flash devices

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_CS3308 is not set
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
# CONFIG_VIDEO_MSP3400 is not set
CONFIG_VIDEO_SONY_BTF_MPX=y
CONFIG_VIDEO_TDA1997X=y
CONFIG_VIDEO_TDA7432=y
CONFIG_VIDEO_TDA9840=y
CONFIG_VIDEO_TEA6415C=y
# CONFIG_VIDEO_TEA6420 is not set
# CONFIG_VIDEO_TLV320AIC23B is not set
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_UDA1342=y
CONFIG_VIDEO_VP27SMPX=y
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_WM8775 is not set
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV748X=y
CONFIG_VIDEO_ADV7604=y
# CONFIG_VIDEO_ADV7604_CEC is not set
# CONFIG_VIDEO_ADV7842 is not set
CONFIG_VIDEO_BT819=y
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
CONFIG_VIDEO_ISL7998X=y
CONFIG_VIDEO_KS0127=y
# CONFIG_VIDEO_MAX9286 is not set
CONFIG_VIDEO_ML86V7667=y
CONFIG_VIDEO_SAA7110=y
CONFIG_VIDEO_SAA711X=y
# CONFIG_VIDEO_TC358743 is not set
CONFIG_VIDEO_TC358746=y
CONFIG_VIDEO_TVP514X=y
CONFIG_VIDEO_TVP5150=y
CONFIG_VIDEO_TVP7002=y
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9900=y
# CONFIG_VIDEO_TW9903 is not set
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=y
CONFIG_VIDEO_CX25840=y
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_ADV7170=y
CONFIG_VIDEO_ADV7175=y
CONFIG_VIDEO_ADV7343=y
CONFIG_VIDEO_ADV7393=y
CONFIG_VIDEO_ADV7511=y
# CONFIG_VIDEO_ADV7511_CEC is not set
CONFIG_VIDEO_AK881X=y
# CONFIG_VIDEO_SAA7127 is not set
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_THS8200=y
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
# CONFIG_VIDEO_UPD64083 is not set
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y
# end of Audio/Video compression chips

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=y
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_ST_MIPID02=y
CONFIG_VIDEO_THS7303=y
# end of Miscellaneous helper chips

#
# Video serializers and deserializers
#
CONFIG_VIDEO_DS90UB913=y
CONFIG_VIDEO_DS90UB953=y
CONFIG_VIDEO_DS90UB960=y
# CONFIG_VIDEO_MAX96714 is not set
# CONFIG_VIDEO_MAX96717 is not set
# end of Video serializers and deserializers

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=y
# CONFIG_MEDIA_TUNER_FC0011 is not set
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_FC2580=y
CONFIG_MEDIA_TUNER_IT913X=y
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
# CONFIG_MEDIA_TUNER_MAX2165 is not set
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT2060=y
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=y
# CONFIG_MEDIA_TUNER_MT2131 is not set
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_R820T=y
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18212=y
# CONFIG_MEDIA_TUNER_TDA18218 is not set
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_LINEDISP=y
CONFIG_IMG_ASCII_LCD=y
CONFIG_MAX6959=y
CONFIG_SEG_LED_GPIO=y
CONFIG_PANEL=y
CONFIG_TEGRA_HOST1X_CONTEXT_BUS=y
CONFIG_TEGRA_HOST1X=y
# CONFIG_TEGRA_HOST1X_FIREWALL is not set
CONFIG_IMX_IPUV3_CORE=y
# CONFIG_DRM is not set

#
# Frame buffer Devices
#
# CONFIG_FB is not set
CONFIG_MMP_DISP=y
CONFIG_MMP_DISP_CONTROLLER=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_PLATFORM is not set
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support

CONFIG_TRACE_GPU_MEM=y
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
# CONFIG_SND_CORE_TEST is not set
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
CONFIG_SND_PCM_OSS=y
# CONFIG_SND_PCM_OSS_PLUGINS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_CTL_FAST_LOOKUP=y
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
CONFIG_SND_PCM_XRUN_DEBUG=y
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
# CONFIG_SND_CTL_DEBUG is not set
CONFIG_SND_JACK_INJECTION_DEBUG=y
CONFIG_SND_UTIMER=y
CONFIG_SND_VMASTER=y
CONFIG_SND_CTL_LED=y
CONFIG_SND_SEQUENCER=y
# CONFIG_SND_SEQ_DUMMY is not set
CONFIG_SND_SEQUENCER_OSS=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
# CONFIG_SND_SEQ_UMP is not set
CONFIG_SND_AC97_CODEC=y
CONFIG_SND_DRIVERS=y
# CONFIG_SND_DUMMY is not set
CONFIG_SND_ALOOP=y
# CONFIG_SND_PCMTEST is not set
# CONFIG_SND_VIRMIDI is not set
# CONFIG_SND_MTS64 is not set
CONFIG_SND_PORTMAN2X4=y
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0

#
# HD-Audio
#
CONFIG_SND_HDA=y
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_HDA_CIX_IPBLOQ=y
CONFIG_SND_HDA_GENERIC_LEDS=y
CONFIG_SND_HDA_CODEC_ANALOG=y
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
CONFIG_SND_HDA_CODEC_VIA=y
CONFIG_SND_HDA_CODEC_CONEXANT=y
CONFIG_SND_HDA_CODEC_SENARYTECH=y
CONFIG_SND_HDA_CODEC_CA0110=y
CONFIG_SND_HDA_CODEC_CA0132=y
# CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
# CONFIG_SND_HDA_CODEC_CMEDIA is not set
CONFIG_SND_HDA_CODEC_CM9825=y
CONFIG_SND_HDA_CODEC_SI3054=y
CONFIG_SND_HDA_GENERIC=y
# CONFIG_SND_HDA_CODEC_REALTEK is not set
CONFIG_SND_HDA_CODEC_CIRRUS=y
CONFIG_SND_HDA_CODEC_CS420X=y
CONFIG_SND_HDA_CODEC_CS421X=y
CONFIG_SND_HDA_CODEC_CS8409=y
CONFIG_SND_HDA_CODEC_HDMI=y
CONFIG_SND_HDA_CODEC_HDMI_GENERIC=y
CONFIG_SND_HDA_CODEC_HDMI_SIMPLE=y
CONFIG_SND_HDA_CODEC_HDMI_INTEL=y
# CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM is not set
CONFIG_SND_HDA_CODEC_HDMI_ATI=y
CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=y
CONFIG_SND_HDA_CODEC_HDMI_NVIDIA_MCP=y
CONFIG_SND_HDA_CODEC_HDMI_TEGRA=y
CONFIG_SND_HDA_SCODEC_COMPONENT=y
CONFIG_SND_HDA_CORE=y
CONFIG_SND_HDA_ALIGNED_MMIO=y
CONFIG_SND_HDA_EXT_CORE=y
CONFIG_SND_INTEL_DSP_CONFIG=y
# end of HD-Audio

CONFIG_SND_PXA2XX_LIB=y
# CONFIG_SND_USB is not set
# CONFIG_SND_FIREWIRE is not set
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
# CONFIG_SND_SOC_TOPOLOGY_BUILD is not set
CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST=y
CONFIG_SND_SOC_CARD_KUNIT_TEST=y
# CONFIG_SND_SOC_UTILS_KUNIT_TEST is not set
# CONFIG_SND_SOC_OPS_KUNIT_TEST is not set

#
# Analog Devices
#
# CONFIG_SND_SOC_ADI_AXI_I2S is not set
CONFIG_SND_SOC_ADI_AXI_SPDIF=y
# end of Analog Devices

#
# AMD
#
CONFIG_SND_SOC_AMD_ACP=y
CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=y
CONFIG_SND_AMD_ACP_CONFIG=y
# CONFIG_SND_SOC_AMD_ACP63_TOPLEVEL is not set
# end of AMD

#
# Apple
#
CONFIG_SND_SOC_APPLE_MCA=y
# end of Apple

#
# Atmel
#
CONFIG_SND_ATMEL_SOC_PDC=y
CONFIG_SND_ATMEL_SOC_DMA=y
CONFIG_SND_ATMEL_SOC_SSC=y
CONFIG_SND_ATMEL_SOC_SSC_PDC=y
CONFIG_SND_ATMEL_SOC_SSC_DMA=y
# CONFIG_SND_AT91_SOC_SAM9G20_WM8731 is not set
# CONFIG_SND_ATMEL_SOC_WM8904 is not set
CONFIG_SND_AT91_SOC_SAM9X5_WM8731=y
CONFIG_SND_ATMEL_SOC_CLASSD=y
CONFIG_SND_ATMEL_SOC_PDMIC=y
# CONFIG_SND_ATMEL_SOC_I2S is not set
CONFIG_SND_SOC_MIKROE_PROTO=y
CONFIG_SND_MCHP_SOC_I2S_MCC=y
CONFIG_SND_MCHP_SOC_SPDIFTX=y
# CONFIG_SND_MCHP_SOC_SPDIFRX is not set
CONFIG_SND_MCHP_SOC_PDMC=y
# end of Atmel

#
# Au1x
#
# end of Au1x

#
# Broadcom
#
# CONFIG_SND_BCM2835_SOC_I2S is not set
CONFIG_SND_SOC_CYGNUS=y
CONFIG_SND_BCM63XX_I2S_WHISTLER=y
# end of Broadcom

#
# Cirrus Logic
#
CONFIG_SND_EP93XX_SOC=y
# CONFIG_SND_EP93XX_SOC_I2S is not set
# end of Cirrus Logic

#
# DesignWare
#
# CONFIG_SND_DESIGNWARE_I2S is not set
# end of DesignWare

#
# Freescale
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
CONFIG_SND_SOC_FSL_AUDMIX=y
CONFIG_SND_SOC_FSL_SSI=y
CONFIG_SND_SOC_FSL_SPDIF=y
CONFIG_SND_SOC_FSL_ESAI=y
CONFIG_SND_SOC_FSL_MICFIL=y
CONFIG_SND_SOC_FSL_XCVR=y
CONFIG_SND_SOC_FSL_AUD2HTX=y
CONFIG_SND_SOC_FSL_UTILS=y
CONFIG_SND_SOC_FSL_RPMSG=y
CONFIG_SND_SOC_FSL_LPC3XXX=y
CONFIG_SND_SOC_IMX_PCM_DMA=y
CONFIG_SND_SOC_IMX_AUDIO_RPMSG=y
CONFIG_SND_SOC_IMX_PCM_RPMSG=y
CONFIG_SND_SOC_IMX_AUDMUX=y
CONFIG_SND_IMX_SOC=y

#
# SoC Audio support for Freescale i.MX boards:
#
CONFIG_SND_SOC_IMX_ES8328=y
# CONFIG_SND_SOC_IMX_SGTL5000 is not set
CONFIG_SND_SOC_FSL_ASOC_CARD=y
CONFIG_SND_SOC_IMX_AUDMIX=y
# CONFIG_SND_SOC_IMX_HDMI is not set
CONFIG_SND_SOC_IMX_RPMSG=y
CONFIG_SND_SOC_IMX_CARD=y
# end of Freescale

#
# Google
#
# CONFIG_SND_SOC_CHV3_I2S is not set
# end of Google

#
# Hisilicon
#
CONFIG_SND_I2S_HI6210_I2S=y
# end of Hisilicon

#
# JZ4740
#
# CONFIG_SND_JZ4740_SOC_I2S is not set
# end of JZ4740

#
# Kirkwood
#
CONFIG_SND_KIRKWOOD_SOC=y
CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB=y
# end of Kirkwood

#
# Loongson
#
CONFIG_SND_SOC_LOONGSON_CARD=y
CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM=y
# end of Loongson

#
# Imagination Technologies
#
# CONFIG_SND_SOC_IMG_I2S_IN is not set
CONFIG_SND_SOC_IMG_I2S_OUT=y
# CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
CONFIG_SND_SOC_IMG_SPDIF_IN=y
CONFIG_SND_SOC_IMG_SPDIF_OUT=y
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=y
# end of Imagination Technologies

#
# Intel
#
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SOC_ACPI_INTEL_MATCH=y
CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y
CONFIG_SND_SOC_INTEL_KEEMBAY=y
CONFIG_SND_SOC_INTEL_MACH=y
CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES=y
CONFIG_SND_SOC_INTEL_BDW_RT5650_MACH=y
# CONFIG_SND_SOC_INTEL_BROADWELL_MACH is not set
# end of Intel

#
# Mediatek
#
CONFIG_SND_SOC_MEDIATEK=y
# CONFIG_SND_SOC_MT8186 is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_MT8188 is not set
CONFIG_SND_SOC_MT8195=y
CONFIG_SND_SOC_MT8365=y
# end of Mediatek

#
# Amlogic
#
CONFIG_SND_MESON_AIU=y
CONFIG_SND_MESON_AXG_FIFO=y
CONFIG_SND_MESON_AXG_FRDDR=y
# CONFIG_SND_MESON_AXG_TODDR is not set
CONFIG_SND_MESON_AXG_TDM_FORMATTER=y
CONFIG_SND_MESON_AXG_TDM_INTERFACE=y
CONFIG_SND_MESON_AXG_TDMIN=y
# CONFIG_SND_MESON_AXG_TDMOUT is not set
CONFIG_SND_MESON_AXG_SOUND_CARD=y
CONFIG_SND_MESON_AXG_SPDIFOUT=y
CONFIG_SND_MESON_AXG_SPDIFIN=y
CONFIG_SND_MESON_AXG_PDM=y
CONFIG_SND_MESON_CARD_UTILS=y
CONFIG_SND_MESON_CODEC_GLUE=y
CONFIG_SND_MESON_GX_SOUND_CARD=y
CONFIG_SND_MESON_G12A_TOACODEC=y
CONFIG_SND_MESON_G12A_TOHDMITX=y
CONFIG_SND_SOC_MESON_T9015=y
# end of Amlogic

CONFIG_SND_MXS_SOC=y
# CONFIG_SND_SOC_MXS_SGTL5000 is not set

#
# PXA
#
CONFIG_SND_PXA2XX_SOC=y
# end of PXA

# CONFIG_SND_SOC_QCOM is not set

#
# Renesas
#
CONFIG_SND_SOC_SH4_FSI=y
CONFIG_SND_SOC_RCAR=y
CONFIG_SND_SOC_MSIOF=y
CONFIG_SND_SOC_RZ=y
# end of Renesas

#
# Rockchip
#
CONFIG_SND_SOC_ROCKCHIP_I2S=y
CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=y
CONFIG_SND_SOC_ROCKCHIP_PDM=y
CONFIG_SND_SOC_ROCKCHIP_SAI=y
# CONFIG_SND_SOC_ROCKCHIP_SPDIF is not set
CONFIG_SND_SOC_ROCKCHIP_MAX98090=y
# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
CONFIG_SND_SOC_RK3288_HDMI_ANALOG=y
# end of Rockchip

# CONFIG_SND_SOC_SAMSUNG is not set

#
# SoundWire (SDCA)
#
CONFIG_SND_SOC_SDCA_OPTIONAL=y
# end of SoundWire (SDCA)

#
# Sophgo
#
CONFIG_SND_SOC_CV1800B_TDM=y
# CONFIG_SND_SOC_CV1800B_ADC_CODEC is not set
CONFIG_SND_SOC_CV1800B_DAC_CODEC=y
# end of Sophgo

#
# SpacemiT
#
# end of SpacemiT

#
# ST SPEAr
#
# end of ST SPEAr

#
# Spreadtrum
#
CONFIG_SND_SOC_SPRD=y
# CONFIG_SND_SOC_SPRD_MCDT is not set
# end of Spreadtrum

#
# StarFive
#
CONFIG_SND_SOC_JH7110_PWMDAC=y
CONFIG_SND_SOC_JH7110_TDM=y
# end of StarFive

CONFIG_SND_SOC_STI=y

#
# STMicroelectronics STM32
#
CONFIG_SND_SOC_STM32_SAI=y
# CONFIG_SND_SOC_STM32_I2S is not set
CONFIG_SND_SOC_STM32_SPDIFRX=y
# end of STMicroelectronics STM32

#
# Allwinner
#
CONFIG_SND_SUN4I_CODEC=y
CONFIG_SND_SUN8I_CODEC=y
CONFIG_SND_SUN8I_CODEC_ANALOG=y
CONFIG_SND_SUN50I_CODEC_ANALOG=y
CONFIG_SND_SUN4I_I2S=y
CONFIG_SND_SUN4I_SPDIF=y
CONFIG_SND_SUN50I_DMIC=y
CONFIG_SND_SUN8I_ADDA_PR_REGMAP=y
# end of Allwinner

#
# Tegra
#
# CONFIG_SND_SOC_TEGRA is not set
# end of Tegra

#
# Texas Instruments
#
CONFIG_SND_SOC_TI_EDMA_PCM=y
CONFIG_SND_SOC_TI_SDMA_PCM=y
CONFIG_SND_SOC_TI_UDMA_PCM=y

#
# Texas Instruments DAI support for:
#
CONFIG_SND_SOC_DAVINCI_ASP=y
CONFIG_SND_SOC_DAVINCI_MCASP=y
# CONFIG_SND_SOC_OMAP_DMIC is not set
CONFIG_SND_SOC_OMAP_MCBSP=y
CONFIG_SND_SOC_OMAP_MCPDM=y

#
# Audio support for boards with Texas Instruments SoCs
#
CONFIG_SND_SOC_OMAP_AMS_DELTA=y
CONFIG_SND_SOC_OMAP_HDMI=y
CONFIG_SND_SOC_J721E_EVM=y
# end of Texas Instruments

#
# UniPhier
#
CONFIG_SND_SOC_UNIPHIER_AIO=y
CONFIG_SND_SOC_UNIPHIER_LD11=y
CONFIG_SND_SOC_UNIPHIER_PXS2=y
CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC=y
# end of UniPhier

#
# Xilinx
#
CONFIG_SND_SOC_XILINX_I2S=y
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
# CONFIG_SND_SOC_XILINX_SPDIF is not set
# end of Xilinx

#
# Xtensa
#
# CONFIG_SND_SOC_XTFPGA_I2S is not set
# end of Xtensa

CONFIG_SND_SOC_SOF_TOPLEVEL=y
CONFIG_SND_SOC_SOF_ACPI=y
CONFIG_SND_SOC_SOF_ACPI_DEV=y
CONFIG_SND_SOC_SOF_OF=y
CONFIG_SND_SOC_SOF=y
CONFIG_SND_SOC_SOF_IPC3=y
# CONFIG_SND_SOC_SOF_AMD_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_IMX_TOPLEVEL is not set
CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=y
CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC=y
CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP=y
CONFIG_SND_SOC_SOF_INTEL_COMMON=y
CONFIG_SND_SOC_SOF_BAYTRAIL=y
CONFIG_SND_SOC_SOF_BROADWELL=y
# CONFIG_SND_SOC_SOF_MTK_TOPLEVEL is not set
CONFIG_SND_SOC_SOF_XTENSA=y
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_ALL_CODECS=y
CONFIG_SND_SOC_88PM860X=y
CONFIG_SND_SOC_ARIZONA=y
CONFIG_SND_SOC_WM_HUBS=y
CONFIG_SND_SOC_WM_ADSP=y
# CONFIG_SND_SOC_AB8500_CODEC is not set
CONFIG_SND_SOC_AC97_CODEC=y
# CONFIG_SND_SOC_AD1836 is not set
CONFIG_SND_SOC_AD193X=y
# CONFIG_SND_SOC_AD193X_SPI is not set
CONFIG_SND_SOC_AD193X_I2C=y
CONFIG_SND_SOC_AD1980=y
CONFIG_SND_SOC_AD73311=y
CONFIG_SND_SOC_ADAU_UTILS=y
CONFIG_SND_SOC_ADAU1372=y
CONFIG_SND_SOC_ADAU1372_I2C=y
# CONFIG_SND_SOC_ADAU1372_SPI is not set
# CONFIG_SND_SOC_ADAU1373 is not set
CONFIG_SND_SOC_ADAU1701=y
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
# CONFIG_SND_SOC_ADAU1761_SPI is not set
CONFIG_SND_SOC_ADAU1781=y
CONFIG_SND_SOC_ADAU1781_I2C=y
# CONFIG_SND_SOC_ADAU1781_SPI is not set
CONFIG_SND_SOC_ADAU1977=y
# CONFIG_SND_SOC_ADAU1977_SPI is not set
CONFIG_SND_SOC_ADAU1977_I2C=y
CONFIG_SND_SOC_ADAU7002=y
CONFIG_SND_SOC_ADAU7118=y
# CONFIG_SND_SOC_ADAU7118_HW is not set
CONFIG_SND_SOC_ADAU7118_I2C=y
CONFIG_SND_SOC_ADAV80X=y
# CONFIG_SND_SOC_ADAV801 is not set
CONFIG_SND_SOC_ADAV803=y
CONFIG_SND_SOC_ADS117X=y
# CONFIG_SND_SOC_AK4104 is not set
CONFIG_SND_SOC_AK4118=y
# CONFIG_SND_SOC_AK4375 is not set
CONFIG_SND_SOC_AK4458=y
CONFIG_SND_SOC_AK4535=y
# CONFIG_SND_SOC_AK4554 is not set
# CONFIG_SND_SOC_AK4613 is not set
CONFIG_SND_SOC_AK4619=y
CONFIG_SND_SOC_AK4642=y
CONFIG_SND_SOC_AK4671=y
# CONFIG_SND_SOC_AK5386 is not set
CONFIG_SND_SOC_AK5558=y
CONFIG_SND_SOC_ALC5623=y
CONFIG_SND_SOC_ALC5632=y
# CONFIG_SND_SOC_AUDIO_IIO_AUX is not set
CONFIG_SND_SOC_AW8738=y
CONFIG_SND_SOC_AW88395_LIB=y
CONFIG_SND_SOC_AW88395=y
# CONFIG_SND_SOC_AW88166 is not set
CONFIG_SND_SOC_AW88261=y
CONFIG_SND_SOC_AW88081=y
CONFIG_SND_SOC_AW87390=y
CONFIG_SND_SOC_AW88399=y
CONFIG_SND_SOC_BD28623=y
CONFIG_SND_SOC_BT_SCO=y
# CONFIG_SND_SOC_CHV3_CODEC is not set
CONFIG_SND_SOC_CPCAP=y
CONFIG_SND_SOC_CQ0093VC=y
# CONFIG_SND_SOC_CROS_EC_CODEC is not set
CONFIG_SND_SOC_CS_AMP_LIB=y
CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS=y
CONFIG_SND_SOC_CS_AMP_LIB_TEST=y
CONFIG_SND_SOC_CS35L32=y
CONFIG_SND_SOC_CS35L33=y
# CONFIG_SND_SOC_CS35L34 is not set
CONFIG_SND_SOC_CS35L35=y
CONFIG_SND_SOC_CS35L36=y
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
# CONFIG_SND_SOC_CS35L41_SPI is not set
CONFIG_SND_SOC_CS35L41_I2C=y
# CONFIG_SND_SOC_CS35L45_SPI is not set
# CONFIG_SND_SOC_CS35L45_I2C is not set
CONFIG_SND_SOC_CS35L56=y
CONFIG_SND_SOC_CS35L56_SHARED=y
CONFIG_SND_SOC_CS35L56_I2C=y
# CONFIG_SND_SOC_CS35L56_SPI is not set
# CONFIG_SND_SOC_CS35L56_SDW is not set

#
# CS35L56 driver options
#
# CONFIG_SND_SOC_CS35L56_CAL_DEBUGFS is not set
# CONFIG_SND_SOC_CS35L56_CAL_SET_CTRL is not set
CONFIG_SND_SOC_CS35L56_TEST=y
CONFIG_SND_SOC_CS35L56_SHARED_TEST=y
# end of CS35L56 driver options

CONFIG_SND_SOC_CS40L50=y
CONFIG_SND_SOC_CS42L42_CORE=y
CONFIG_SND_SOC_CS42L42=y
CONFIG_SND_SOC_CS42L42_SDW=y
# CONFIG_SND_SOC_CS42L43 is not set
# CONFIG_SND_SOC_CS42L43_SDW is not set
CONFIG_SND_SOC_CS42L51=y
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
CONFIG_SND_SOC_CS42L56=y
CONFIG_SND_SOC_CS42L73=y
CONFIG_SND_SOC_CS42L83=y
CONFIG_SND_SOC_CS42L84=y
CONFIG_SND_SOC_CS4234=y
# CONFIG_SND_SOC_CS4265 is not set
CONFIG_SND_SOC_CS4270=y
# CONFIG_SND_SOC_CS4271_I2C is not set
# CONFIG_SND_SOC_CS4271_SPI is not set
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=y
# CONFIG_SND_SOC_CS47L15 is not set
CONFIG_SND_SOC_CS47L24=y
# CONFIG_SND_SOC_CS47L35 is not set
CONFIG_SND_SOC_CS47L85=y
CONFIG_SND_SOC_CS47L90=y
CONFIG_SND_SOC_CS47L92=y
# CONFIG_SND_SOC_CS48L32 is not set
# CONFIG_SND_SOC_CS53L30 is not set
CONFIG_SND_SOC_CS530X=y
CONFIG_SND_SOC_CS530X_I2C=y
# CONFIG_SND_SOC_CS530X_SPI is not set
CONFIG_SND_SOC_CX20442=y
# CONFIG_SND_SOC_CX2072X is not set
# CONFIG_SND_SOC_JZ4740_CODEC is not set
# CONFIG_SND_SOC_JZ4725B_CODEC is not set
CONFIG_SND_SOC_JZ4760_CODEC=y
# CONFIG_SND_SOC_JZ4770_CODEC is not set
CONFIG_SND_SOC_DA7210=y
CONFIG_SND_SOC_DA7213=y
CONFIG_SND_SOC_DA7218=y
CONFIG_SND_SOC_DA7219=y
CONFIG_SND_SOC_DA732X=y
CONFIG_SND_SOC_DA9055=y
CONFIG_SND_SOC_DMIC=y
CONFIG_SND_SOC_HDMI_CODEC=y
CONFIG_SND_SOC_ES7134=y
CONFIG_SND_SOC_ES7241=y
# CONFIG_SND_SOC_ES8311 is not set
CONFIG_SND_SOC_ES8316=y
CONFIG_SND_SOC_ES8323=y
CONFIG_SND_SOC_ES8326=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
# CONFIG_SND_SOC_ES8328_SPI is not set
CONFIG_SND_SOC_ES8375=y
# CONFIG_SND_SOC_ES8389 is not set
CONFIG_SND_SOC_FRAMER=y
# CONFIG_SND_SOC_FS210X is not set
CONFIG_SND_SOC_GTM601=y
CONFIG_SND_SOC_HDAC_HDMI=y
CONFIG_SND_SOC_HDAC_HDA=y
CONFIG_SND_SOC_HDA=y
# CONFIG_SND_SOC_ICS43432 is not set
# CONFIG_SND_SOC_IDT821034 is not set
# CONFIG_SND_SOC_INNO_RK3036 is not set
CONFIG_SND_SOC_ISABELLE=y
CONFIG_SND_SOC_LM49453=y
# CONFIG_SND_SOC_LOCHNAGAR_SC is not set
CONFIG_SND_SOC_MADERA=y
CONFIG_SND_SOC_MAX98088=y
CONFIG_SND_SOC_MAX98090=y
CONFIG_SND_SOC_MAX98095=y
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98371=y
CONFIG_SND_SOC_MAX98504=y
CONFIG_SND_SOC_MAX9867=y
CONFIG_SND_SOC_MAX98925=y
CONFIG_SND_SOC_MAX98926=y
CONFIG_SND_SOC_MAX98927=y
CONFIG_SND_SOC_MAX98520=y
CONFIG_SND_SOC_MAX98363=y
CONFIG_SND_SOC_MAX98373=y
CONFIG_SND_SOC_MAX98373_I2C=y
CONFIG_SND_SOC_MAX98373_SDW=y
# CONFIG_SND_SOC_MAX98388 is not set
CONFIG_SND_SOC_MAX98390=y
CONFIG_SND_SOC_MAX98396=y
CONFIG_SND_SOC_MAX9850=y
CONFIG_SND_SOC_MAX9860=y
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
CONFIG_SND_SOC_PCM1681=y
CONFIG_SND_SOC_PCM1754=y
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
CONFIG_SND_SOC_PCM179X=y
CONFIG_SND_SOC_PCM179X_I2C=y
# CONFIG_SND_SOC_PCM179X_SPI is not set
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
# CONFIG_SND_SOC_PCM186X_SPI is not set
CONFIG_SND_SOC_PCM3008=y
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
# CONFIG_SND_SOC_PCM3060_SPI is not set
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
# CONFIG_SND_SOC_PCM3168A_SPI is not set
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
# CONFIG_SND_SOC_PCM512x_SPI is not set
CONFIG_SND_SOC_PCM6240=y
# CONFIG_SND_SOC_PEB2466 is not set
CONFIG_SND_SOC_PM4125=y
CONFIG_SND_SOC_PM4125_SDW=y
# CONFIG_SND_SOC_RK3308 is not set
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RK817=y
CONFIG_SND_SOC_RL6231=y
CONFIG_SND_SOC_RT_SDW_COMMON=y
CONFIG_SND_SOC_RL6347A=y
CONFIG_SND_SOC_RT274=y
CONFIG_SND_SOC_RT286=y
CONFIG_SND_SOC_RT298=y
CONFIG_SND_SOC_RT1011=y
CONFIG_SND_SOC_RT1015=y
CONFIG_SND_SOC_RT1015P=y
CONFIG_SND_SOC_RT1016=y
CONFIG_SND_SOC_RT1017_SDCA_SDW=y
CONFIG_SND_SOC_RT1019=y
CONFIG_SND_SOC_RT1305=y
CONFIG_SND_SOC_RT1308=y
CONFIG_SND_SOC_RT1308_SDW=y
CONFIG_SND_SOC_RT1316_SDW=y
CONFIG_SND_SOC_RT1318=y
CONFIG_SND_SOC_RT1318_SDW=y
# CONFIG_SND_SOC_RT1320_SDW is not set
CONFIG_SND_SOC_RT5514=y
CONFIG_SND_SOC_RT5575=y
CONFIG_SND_SOC_RT5616=y
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=y
CONFIG_SND_SOC_RT5645=y
CONFIG_SND_SOC_RT5651=y
# CONFIG_SND_SOC_RT5659 is not set
CONFIG_SND_SOC_RT5660=y
CONFIG_SND_SOC_RT5663=y
CONFIG_SND_SOC_RT5665=y
CONFIG_SND_SOC_RT5668=y
CONFIG_SND_SOC_RT5670=y
CONFIG_SND_SOC_RT5677=y
CONFIG_SND_SOC_RT5682=y
CONFIG_SND_SOC_RT5682_I2C=y
# CONFIG_SND_SOC_RT5682_SDW is not set
CONFIG_SND_SOC_RT5682S=y
CONFIG_SND_SOC_RT700=y
CONFIG_SND_SOC_RT700_SDW=y
CONFIG_SND_SOC_RT711=y
CONFIG_SND_SOC_RT711_SDW=y
CONFIG_SND_SOC_RT711_SDCA_SDW=y
CONFIG_SND_SOC_RT712_SDCA_SDW=y
# CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW is not set
CONFIG_SND_SOC_RT721_SDCA_SDW=y
# CONFIG_SND_SOC_RT722_SDCA_SDW is not set
CONFIG_SND_SOC_RT715=y
CONFIG_SND_SOC_RT715_SDW=y
# CONFIG_SND_SOC_RT715_SDCA_SDW is not set
# CONFIG_SND_SOC_RT9120 is not set
CONFIG_SND_SOC_RT9123=y
CONFIG_SND_SOC_RT9123P=y
CONFIG_SND_SOC_RTQ9124=y
# CONFIG_SND_SOC_RTQ9128 is not set
# CONFIG_SND_SOC_SDW_MOCKUP is not set
CONFIG_SND_SOC_SGTL5000=y
# CONFIG_SND_SOC_SI476X is not set
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
CONFIG_SND_SOC_SIMPLE_MUX=y
CONFIG_SND_SOC_SMA1303=y
CONFIG_SND_SOC_SMA1307=y
CONFIG_SND_SOC_SPDIF=y
CONFIG_SND_SOC_SRC4XXX_I2C=y
CONFIG_SND_SOC_SRC4XXX=y
CONFIG_SND_SOC_SSM2305=y
CONFIG_SND_SOC_SSM2518=y
CONFIG_SND_SOC_SSM2602=y
# CONFIG_SND_SOC_SSM2602_SPI is not set
CONFIG_SND_SOC_SSM2602_I2C=y
CONFIG_SND_SOC_SSM3515=y
# CONFIG_SND_SOC_SSM4567 is not set
CONFIG_SND_SOC_STA32X=y
# CONFIG_SND_SOC_STA350 is not set
CONFIG_SND_SOC_STA529=y
CONFIG_SND_SOC_STAC9766=y
CONFIG_SND_SOC_STI_SAS=y
CONFIG_SND_SOC_TAS2552=y
CONFIG_SND_SOC_TAS2562=y
CONFIG_SND_SOC_TAS2764=y
CONFIG_SND_SOC_TAS2770=y
# CONFIG_SND_SOC_TAS2780 is not set
# CONFIG_SND_SOC_TAS2781_I2C is not set
# CONFIG_SND_SOC_TAS2783_SDW is not set
# CONFIG_SND_SOC_TAS5086 is not set
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
CONFIG_SND_SOC_TAS5805M=y
CONFIG_SND_SOC_TAS6424=y
CONFIG_SND_SOC_TDA7419=y
# CONFIG_SND_SOC_TFA9879 is not set
CONFIG_SND_SOC_TFA989X=y
CONFIG_SND_SOC_TLV320ADC3XXX=y
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
# CONFIG_SND_SOC_TLV320AIC26 is not set
CONFIG_SND_SOC_TLV320AIC31XX=y
# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
# CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
CONFIG_SND_SOC_TLV320AIC3X=y
CONFIG_SND_SOC_TLV320AIC3X_I2C=y
# CONFIG_SND_SOC_TLV320AIC3X_SPI is not set
CONFIG_SND_SOC_TLV320DAC33=y
CONFIG_SND_SOC_TLV320ADCX140=y
CONFIG_SND_SOC_TS3A227E=y
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
# CONFIG_SND_SOC_TWL4030 is not set
# CONFIG_SND_SOC_TWL6040 is not set
CONFIG_SND_SOC_UDA1334=y
CONFIG_SND_SOC_UDA1342=y
CONFIG_SND_SOC_UDA1380=y
CONFIG_SND_SOC_WCD_CLASSH=y
CONFIG_SND_SOC_WCD_COMMON=y
CONFIG_SND_SOC_WCD9335=y
CONFIG_SND_SOC_WCD_MBHC=y
CONFIG_SND_SOC_WCD934X=y
CONFIG_SND_SOC_WCD937X=y
CONFIG_SND_SOC_WCD937X_SDW=y
# CONFIG_SND_SOC_WCD938X_SDW is not set
CONFIG_SND_SOC_WCD939X=y
CONFIG_SND_SOC_WCD939X_SDW=y
# CONFIG_SND_SOC_WM0010 is not set
CONFIG_SND_SOC_WM1250_EV1=y
CONFIG_SND_SOC_WM2000=y
CONFIG_SND_SOC_WM2200=y
CONFIG_SND_SOC_WM5100=y
# CONFIG_SND_SOC_WM5102 is not set
# CONFIG_SND_SOC_WM5110 is not set
CONFIG_SND_SOC_WM8350=y
CONFIG_SND_SOC_WM8400=y
CONFIG_SND_SOC_WM8510=y
# CONFIG_SND_SOC_WM8523 is not set
CONFIG_SND_SOC_WM8524=y
CONFIG_SND_SOC_WM8580=y
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8727=y
CONFIG_SND_SOC_WM8728=y
CONFIG_SND_SOC_WM8731=y
CONFIG_SND_SOC_WM8731_I2C=y
# CONFIG_SND_SOC_WM8731_SPI is not set
# CONFIG_SND_SOC_WM8737 is not set
# CONFIG_SND_SOC_WM8741 is not set
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
# CONFIG_SND_SOC_WM8770 is not set
CONFIG_SND_SOC_WM8776=y
CONFIG_SND_SOC_WM8782=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
# CONFIG_SND_SOC_WM8804_SPI is not set
CONFIG_SND_SOC_WM8900=y
CONFIG_SND_SOC_WM8903=y
# CONFIG_SND_SOC_WM8904 is not set
# CONFIG_SND_SOC_WM8940 is not set
CONFIG_SND_SOC_WM8955=y
# CONFIG_SND_SOC_WM8960 is not set
# CONFIG_SND_SOC_WM8961 is not set
CONFIG_SND_SOC_WM8962=y
CONFIG_SND_SOC_WM8971=y
CONFIG_SND_SOC_WM8974=y
# CONFIG_SND_SOC_WM8978 is not set
CONFIG_SND_SOC_WM8983=y
# CONFIG_SND_SOC_WM8985 is not set
CONFIG_SND_SOC_WM8988=y
CONFIG_SND_SOC_WM8990=y
CONFIG_SND_SOC_WM8991=y
CONFIG_SND_SOC_WM8993=y
CONFIG_SND_SOC_WM8994=y
CONFIG_SND_SOC_WM8995=y
CONFIG_SND_SOC_WM8996=y
CONFIG_SND_SOC_WM8997=y
CONFIG_SND_SOC_WM8998=y
CONFIG_SND_SOC_WM9081=y
CONFIG_SND_SOC_WM9090=y
CONFIG_SND_SOC_WM9705=y
CONFIG_SND_SOC_WM9712=y
CONFIG_SND_SOC_WM9713=y
# CONFIG_SND_SOC_WSA881X is not set
# CONFIG_SND_SOC_WSA883X is not set
CONFIG_SND_SOC_WSA884X=y
# CONFIG_SND_SOC_ZL38060 is not set
CONFIG_SND_SOC_LM4857=y
CONFIG_SND_SOC_MAX9759=y
CONFIG_SND_SOC_MAX9768=y
CONFIG_SND_SOC_MAX9877=y
CONFIG_SND_SOC_MC13783=y
CONFIG_SND_SOC_ML26124=y
CONFIG_SND_SOC_MT6351=y
CONFIG_SND_SOC_MT6357=y
# CONFIG_SND_SOC_MT6358 is not set
# CONFIG_SND_SOC_MT6359 is not set
# CONFIG_SND_SOC_MT6660 is not set
CONFIG_SND_SOC_NAU8315=y
CONFIG_SND_SOC_NAU8325=y
# CONFIG_SND_SOC_NAU8540 is not set
CONFIG_SND_SOC_NAU8810=y
CONFIG_SND_SOC_NAU8821=y
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=y
CONFIG_SND_SOC_NAU8825=y
CONFIG_SND_SOC_NTPFW=y
CONFIG_SND_SOC_NTP8918=y
CONFIG_SND_SOC_NTP8835=y
CONFIG_SND_SOC_TPA6130A2=y
CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
CONFIG_SND_SOC_LPASS_WSA_MACRO=y
# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
CONFIG_SND_SOC_LPASS_RX_MACRO=y
CONFIG_SND_SOC_LPASS_TX_MACRO=y
# end of CODEC drivers

#
# Generic drivers
#
CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
# CONFIG_SND_AUDIO_GRAPH_CARD is not set
CONFIG_SND_AUDIO_GRAPH_CARD2=y
CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE=y
CONFIG_SND_TEST_COMPONENT=y
# end of Generic drivers

CONFIG_SND_VIRTIO=y
CONFIG_AC97_BUS=y
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
CONFIG_UHID=y
CONFIG_HID_GENERIC=y
CONFIG_HID_HAPTIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACCUTOUCH=y
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=y
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=y
# CONFIG_HID_BELKIN is not set
CONFIG_HID_BETOP_FF=y
CONFIG_HID_BIGBEN_FF=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_PRODIKEYS=y
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
CONFIG_HID_CREATIVE_SB0540=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELAN=y
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
CONFIG_HID_EVISION=y
CONFIG_HID_EZKEY=y
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
CONFIG_HID_HOLTEK=y
CONFIG_HOLTEK_FF=y
CONFIG_HID_GOOGLE_STADIA_FF=y
# CONFIG_HID_VIVALDI is not set
CONFIG_HID_GT683R=y
CONFIG_HID_KEYTOUCH=y
CONFIG_HID_KYE=y
# CONFIG_HID_KYSONA is not set
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_VRC2=y
CONFIG_HID_XIAOMI=y
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
CONFIG_HID_TWINHAN=y
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
CONFIG_HID_LETSKETCH=y
CONFIG_HID_LOGITECH=y
# CONFIG_HID_LOGITECH_DJ is not set
CONFIG_HID_LOGITECH_HIDPP=y
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
# CONFIG_LOGIG940_FF is not set
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_MEGAWORLD_FF=y
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=y
CONFIG_HID_NTRIG=y
CONFIG_HID_NVIDIA_SHIELD=y
# CONFIG_NVIDIA_SHIELD_FF is not set
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PENMOUNT=y
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=y
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_PXRC=y
# CONFIG_HID_RAPOO is not set
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=y
CONFIG_HID_RETRODE=y
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SIGMAMICRO=y
CONFIG_HID_SONY=y
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=y
# CONFIG_STEAM_FF is not set
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=y
# CONFIG_SMARTJOYPLUS_FF is not set
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=y
CONFIG_HID_TOPRE=y
CONFIG_HID_THINGM=y
CONFIG_HID_THRUSTMASTER=y
# CONFIG_THRUSTMASTER_FF is not set
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_WINWING=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y
# CONFIG_HID_MCP2200 is not set
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

CONFIG_I2C_HID=y
CONFIG_I2C_HID_OF=y
# CONFIG_I2C_HID_OF_ELAN is not set
CONFIG_I2C_HID_OF_GOODIX=y
CONFIG_I2C_HID_CORE=y

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_FEW_INIT_RETRIES=y
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=1
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_XHCI_HISTB=y
CONFIG_USB_XHCI_MTK=y
CONFIG_USB_XHCI_MVEBU=y
CONFIG_USB_XHCI_RCAR=y
CONFIG_USB_XHCI_SIDEBAND=y
# CONFIG_USB_BRCMSTB is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_FSL=y
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
CONFIG_USB_EHCI_HCD_OMAP=y
CONFIG_USB_EHCI_HCD_ORION=y
# CONFIG_USB_EHCI_HCD_SPEAR is not set
CONFIG_USB_EHCI_HCD_STI=y
CONFIG_USB_EHCI_HCD_AT91=y
CONFIG_USB_EHCI_SH=y
# CONFIG_USB_EHCI_EXYNOS is not set
CONFIG_USB_EHCI_MV=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_SPEAR=y
CONFIG_USB_OHCI_HCD_STI=y
CONFIG_USB_OHCI_HCD_S3C2410=y
CONFIG_USB_OHCI_HCD_AT91=y
CONFIG_USB_OHCI_HCD_OMAP3=y
# CONFIG_USB_OHCI_HCD_DAVINCI is not set
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_EXYNOS=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=y
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=y
# CONFIG_REALTEK_AUTOPM is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
CONFIG_USB_STORAGE_FREECOM=y
CONFIG_USB_STORAGE_ISD200=y
CONFIG_USB_STORAGE_USBAT=y
CONFIG_USB_STORAGE_SDDR09=y
CONFIG_USB_STORAGE_SDDR55=y
CONFIG_USB_STORAGE_JUMPSHOT=y
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
CONFIG_USB_STORAGE_CYPRESS_ATACB=y
CONFIG_USB_STORAGE_ENE_UB6250=y
CONFIG_USB_UAS=y

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=y
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
# CONFIG_USBIP_HOST is not set
# CONFIG_USBIP_DEBUG is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
CONFIG_USB_FOTG210=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_MTU3=y
CONFIG_USB_MTU3_HOST=y
# CONFIG_USB_MTU3_DEBUG is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_TUSB6010=y
CONFIG_USB_MUSB_OMAP2PLUS=y
CONFIG_USB_MUSB_DSPS=y
CONFIG_USB_MUSB_UX500=y
CONFIG_USB_MUSB_MEDIATEK=y
CONFIG_USB_MUSB_POLARFIRE_SOC=y

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
# CONFIG_USB_DWC3_ULPI is not set
CONFIG_USB_DWC3_HOST=y

#
# Platform Glue Driver Support
#
# CONFIG_USB_DWC3_OMAP is not set
CONFIG_USB_DWC3_EXYNOS=y
# CONFIG_USB_DWC3_KEYSTONE is not set
# CONFIG_USB_DWC3_MESON_G12A is not set
CONFIG_USB_DWC3_OF_SIMPLE=y
# CONFIG_USB_DWC3_ST is not set
CONFIG_USB_DWC3_QCOM=y
CONFIG_USB_DWC3_IMX8MP=y
# CONFIG_USB_DWC3_XILINX is not set
CONFIG_USB_DWC3_AM62=y
CONFIG_USB_DWC3_OCTEON=y
CONFIG_USB_DWC3_GENERIC_PLAT=y
# CONFIG_USB_DWC3_GOOGLE is not set
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_NPCM=y
CONFIG_USB_CHIPIDEA_IMX=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_CHIPIDEA_TEGRA=y
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=y
CONFIG_USB_SERIAL_ARK3116=y
# CONFIG_USB_SERIAL_BELKIN is not set
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
CONFIG_USB_SERIAL_IPAQ=y
# CONFIG_USB_SERIAL_IR is not set
CONFIG_USB_SERIAL_EDGEPORT=y
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
CONFIG_USB_SERIAL_F81232=y
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
CONFIG_USB_SERIAL_KEYSPAN=y
CONFIG_USB_SERIAL_KLSI=y
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
CONFIG_USB_SERIAL_SAFE=y
# CONFIG_USB_SERIAL_SAFE_PADDED is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
CONFIG_USB_SERIAL_TI=y
CONFIG_USB_SERIAL_CYBERJACK=y
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
# CONFIG_USB_SERIAL_XSENS_MT is not set
CONFIG_USB_SERIAL_WISHBONE=y
# CONFIG_USB_SERIAL_SSU100 is not set
CONFIG_USB_SERIAL_QT2=y
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_XR=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
CONFIG_USB_USS720=y
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_QCOM_EUD is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_SISUSBVGA=y
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
# CONFIG_USB_CHAOSKEY is not set
CONFIG_BRCM_USB_PINMAP=y
CONFIG_USB_ONBOARD_DEV=y
CONFIG_USB_ONBOARD_DEV_USB5744=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=y
CONFIG_AM335X_CONTROL_USB=y
CONFIG_AM335X_PHY_USB=y
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SD8787=y
CONFIG_PWRSEQ_SIMPLE=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
CONFIG_MMC_TEST=y

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SUNPLUS=y
CONFIG_MMC_PXA=y
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_UHS2=y
# CONFIG_MMC_SDHCI_PLTFM is not set
CONFIG_MMC_SDHCI_S3C=y
CONFIG_MMC_SDHCI_SPEAR=y
CONFIG_MMC_SDHCI_S3C_DMA=y
# CONFIG_MMC_MESON_GX is not set
CONFIG_MMC_MESON_MX_SDHC=y
# CONFIG_MMC_MESON_MX_SDIO is not set
CONFIG_MMC_MOXART=y
CONFIG_MMC_OMAP_HS=y
# CONFIG_MMC_MXC is not set
CONFIG_MMC_DAVINCI=y
CONFIG_MMC_TMIO_CORE=y
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_UNIPHIER=y
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
CONFIG_MMC_DW_BLUEFIELD=y
# CONFIG_MMC_DW_EXYNOS is not set
CONFIG_MMC_DW_HI3798CV200=y
CONFIG_MMC_DW_HI3798MV200=y
CONFIG_MMC_DW_K3=y
# CONFIG_MMC_DW_ROCKCHIP is not set
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
CONFIG_MMC_WMT=y
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_REALTEK_USB=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
CONFIG_MMC_BCM2835=y
CONFIG_MMC_MTK=y
CONFIG_MMC_OWL=y
# CONFIG_MMC_LOONGSON2 is not set
CONFIG_MMC_LITEX=y
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=y
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_REALTEK_USB is not set
CONFIG_LEDS_EXPRESSWIRE=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
CONFIG_LEDS_KUNIT_TEST=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
CONFIG_LEDS_OSRAM_AMS_AS3668=y
CONFIG_LEDS_AW200XX=y
CONFIG_LEDS_AW2013=y
CONFIG_LEDS_BCM6328=y
# CONFIG_LEDS_BCM6358 is not set
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=y
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_LM3692X is not set
# CONFIG_LEDS_MT6323 is not set
CONFIG_LEDS_COBALT_QUBE=y
CONFIG_LEDS_COBALT_RAQ=y
# CONFIG_LEDS_SUN50I_A100 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_LP55XX_COMMON=y
# CONFIG_LEDS_LP5521 is not set
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=y
CONFIG_LEDS_LP5569=y
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_LP8864=y
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_PCA995X=y
CONFIG_LEDS_WM831X_STATUS=y
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2606MVV=y
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_MAX5970=y
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX77650=y
CONFIG_LEDS_MAX77705=y
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_BLINKM_MULTICOLOR=y
# CONFIG_LEDS_SYSCON is not set
# CONFIG_LEDS_PM8058 is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
# CONFIG_LEDS_LM36274 is not set
CONFIG_LEDS_ST1202=y
CONFIG_LEDS_TPS6105X=y
CONFIG_LEDS_IP30=y
CONFIG_LEDS_ACER_A500=y
CONFIG_LEDS_BCM63138=y
CONFIG_LEDS_LGM=y

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=y
# CONFIG_LEDS_AS3645A is not set
CONFIG_LEDS_KTD2692=y
CONFIG_LEDS_LM3601X=y
CONFIG_LEDS_MAX77693=y
CONFIG_LEDS_MT6360=y
CONFIG_LEDS_QCOM_FLASH=y
CONFIG_LEDS_RT4505=y
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=y
CONFIG_LEDS_SY7802=y
CONFIG_LEDS_TPS6131X=y

#
# RGB LED drivers
#
# CONFIG_LEDS_GROUP_MULTICOLOR is not set
CONFIG_LEDS_KTD202X=y
CONFIG_LEDS_LP5812=y
CONFIG_LEDS_NCP5623=y
CONFIG_LEDS_PWM_MULTICOLOR=y
CONFIG_LEDS_QCOM_LPG=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_TTY=y
CONFIG_LEDS_TRIGGER_INPUT_EVENTS=y

#
# Simatic LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=y
CONFIG_INFINIBAND_USER_MAD=y
CONFIG_INFINIBAND_USER_ACCESS=y
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_IPOIB=y
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=y
CONFIG_INFINIBAND_SRP=y
CONFIG_INFINIBAND_SRPT=y
CONFIG_INFINIBAND_ISER=y
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

CONFIG_UIO=y
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=y
CONFIG_VFIO=y
CONFIG_VFIO_GROUP=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_DEBUGFS=y

#
# VFIO support for platform devices
#
CONFIG_VFIO_PLATFORM_BASE=y
CONFIG_VFIO_PLATFORM=y
CONFIG_VFIO_AMBA=y

#
# VFIO platform reset drivers
#
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=y
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=y
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=y
# end of VFIO platform reset drivers
# end of VFIO support for platform devices

CONFIG_VFIO_CDX=y
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VIRTIO_DEBUG=y
CONFIG_VIRTIO_RTC=y
CONFIG_VIRTIO_RTC_PTP=y

#
# Enable RTC_CLASS in order to enable VIRTIO_RTC_CLASS.
#
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
CONFIG_GPIB=y
CONFIG_GPIB_COMMON=y
CONFIG_GPIB_AGILENT_82357A=y
# CONFIG_GPIB_NI_USB is not set
# CONFIG_GPIB_FLUKE is not set
CONFIG_GPIB_GPIO=y
CONFIG_GPIB_LPVO=y
CONFIG_STAGING=y
CONFIG_OCTEON_ETHERNET=y
CONFIG_STAGING_MEDIA=y
# CONFIG_VIDEO_IMX_MEDIA is not set
CONFIG_VIDEO_MAX96712=y
# CONFIG_VIDEO_MESON_VDEC is not set

#
# StarFive media platform drivers
#
CONFIG_VIDEO_SUNXI=y
CONFIG_VIDEO_SUNXI_CEDRUS=y
# CONFIG_VIDEO_TEGRA is not set
# CONFIG_STAGING_MEDIA_DEPRECATED is not set
CONFIG_MOST_COMPONENTS=y
# CONFIG_MOST_NET is not set
CONFIG_MOST_VIDEO=y
CONFIG_MOST_DIM2=y
# CONFIG_XIL_AXIS_FIFO is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_CZNIC_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_ARM64_PLATFORM_DEVICES is not set
# CONFIG_BCM_VIDEOCORE is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
CONFIG_COMMON_CLK_APPLE_NCO=y
# CONFIG_COMMON_CLK_MAX77686 is not set
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_RK808=y
# CONFIG_COMMON_CLK_RP1 is not set
CONFIG_COMMON_CLK_SCMI=y
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_SI570=y
# CONFIG_COMMON_CLK_BM1880 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_TPS68470 is not set
CONFIG_COMMON_CLK_CDCE925=y
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_COMMON_CLK_EN7523=y
# CONFIG_COMMON_CLK_EP93XX is not set
CONFIG_COMMON_CLK_EYEQ=y
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_NPCM8XX is not set
# CONFIG_COMMON_CLK_LOONGSON2 is not set
CONFIG_COMMON_CLK_PWM=y
CONFIG_COMMON_CLK_RS9_PCIE=y
CONFIG_COMMON_CLK_SI521XX=y
# CONFIG_COMMON_CLK_VC3 is not set
CONFIG_COMMON_CLK_VC5=y
CONFIG_COMMON_CLK_VC7=y
CONFIG_COMMON_CLK_MMP2_AUDIO=y
CONFIG_COMMON_CLK_BD718XX=y
CONFIG_COMMON_CLK_FIXED_MMIO=y
CONFIG_COMMON_CLK_SP7021=y
CONFIG_COMMON_CLK_RPMI=y
# CONFIG_CLK_ACTIONS is not set
# CONFIG_COMMON_CLK_ASPEED is not set
# CONFIG_COMMON_CLK_AST2700 is not set
# CONFIG_CLK_BAIKAL_T1 is not set
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_63XX_GATE=y
CONFIG_CLK_BCM63268_TIMER=y
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
# CONFIG_CLK_BCM_HR2 is not set
CONFIG_CLK_BCM_NSP=y
CONFIG_CLK_BCM_NS2=y
# CONFIG_CLK_BCM_SR is not set
CONFIG_CLK_RASPBERRYPI=y
# CONFIG_COMMON_CLK_HI3516CV300 is not set
CONFIG_COMMON_CLK_HI3519=y
# CONFIG_COMMON_CLK_HI3559A is not set
CONFIG_COMMON_CLK_HI3660=y
# CONFIG_COMMON_CLK_HI3670 is not set
CONFIG_COMMON_CLK_HI3798CV200=y
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
CONFIG_STUB_CLK_HI6220=y
CONFIG_STUB_CLK_HI3660=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=y
# CONFIG_CLK_IMX8MN is not set
CONFIG_CLK_IMX8MP=y
CONFIG_CLK_IMX8MQ=y
# CONFIG_CLK_IMX8ULP is not set
CONFIG_CLK_IMX93=y
CONFIG_CLK_IMX95_BLK_CTL=y
CONFIG_CLK_IMXRT1050=y

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
CONFIG_INGENIC_CGU_JZ4755=y
CONFIG_INGENIC_CGU_JZ4725B=y
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
# CONFIG_INGENIC_CGU_JZ4780 is not set
CONFIG_INGENIC_CGU_X1000=y
# CONFIG_INGENIC_CGU_X1830 is not set
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

CONFIG_COMMON_CLK_KEYSTONE=y
CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MEDIATEK_FHCTL=y
CONFIG_COMMON_CLK_MT2701=y
# CONFIG_COMMON_CLK_MT2701_MMSYS is not set
# CONFIG_COMMON_CLK_MT2701_IMGSYS is not set
# CONFIG_COMMON_CLK_MT2701_VDECSYS is not set
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
CONFIG_COMMON_CLK_MT2701_ETHSYS=y
CONFIG_COMMON_CLK_MT2701_BDPSYS=y
# CONFIG_COMMON_CLK_MT2701_AUDSYS is not set
CONFIG_COMMON_CLK_MT2701_G3DSYS=y
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6735 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=y
CONFIG_COMMON_CLK_MT6779_MMSYS=y
# CONFIG_COMMON_CLK_MT6779_IMGSYS is not set
CONFIG_COMMON_CLK_MT6779_IPESYS=y
CONFIG_COMMON_CLK_MT6779_CAMSYS=y
# CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
CONFIG_COMMON_CLK_MT6779_VENCSYS=y
# CONFIG_COMMON_CLK_MT6779_MFGCFG is not set
CONFIG_COMMON_CLK_MT6779_AUDSYS=y
CONFIG_COMMON_CLK_MT6795=y
# CONFIG_COMMON_CLK_MT6795_MFGCFG is not set
CONFIG_COMMON_CLK_MT6795_MMSYS=y
CONFIG_COMMON_CLK_MT6795_VDECSYS=y
CONFIG_COMMON_CLK_MT6795_VENCSYS=y
# CONFIG_COMMON_CLK_MT6797 is not set
CONFIG_COMMON_CLK_MT7622=y
# CONFIG_COMMON_CLK_MT7622_ETHSYS is not set
CONFIG_COMMON_CLK_MT7622_HIFSYS=y
# CONFIG_COMMON_CLK_MT7622_AUDSYS is not set
# CONFIG_COMMON_CLK_MT7629 is not set
CONFIG_COMMON_CLK_MT7981=y
CONFIG_COMMON_CLK_MT7981_ETHSYS=y
# CONFIG_COMMON_CLK_MT7986 is not set
CONFIG_COMMON_CLK_MT7987=y
CONFIG_COMMON_CLK_MT7987_ETHSYS=y
CONFIG_COMMON_CLK_MT7988=y
# CONFIG_COMMON_CLK_MT8135 is not set
CONFIG_COMMON_CLK_MT8167=y
# CONFIG_COMMON_CLK_MT8167_AUDSYS is not set
# CONFIG_COMMON_CLK_MT8167_IMGSYS is not set
# CONFIG_COMMON_CLK_MT8167_MFGCFG is not set
CONFIG_COMMON_CLK_MT8167_MMSYS=y
CONFIG_COMMON_CLK_MT8167_VDECSYS=y
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_IMGSYS is not set
# CONFIG_COMMON_CLK_MT8173_MMSYS is not set
# CONFIG_COMMON_CLK_MT8173_VDECSYS is not set
CONFIG_COMMON_CLK_MT8173_VENCSYS=y
CONFIG_COMMON_CLK_MT8183=y
CONFIG_COMMON_CLK_MT8183_AUDIOSYS=y
CONFIG_COMMON_CLK_MT8183_CAMSYS=y
CONFIG_COMMON_CLK_MT8183_IMGSYS=y
# CONFIG_COMMON_CLK_MT8183_IPU_CORE0 is not set
CONFIG_COMMON_CLK_MT8183_IPU_CORE1=y
# CONFIG_COMMON_CLK_MT8183_IPU_ADL is not set
# CONFIG_COMMON_CLK_MT8183_IPU_CONN is not set
CONFIG_COMMON_CLK_MT8183_MFGCFG=y
# CONFIG_COMMON_CLK_MT8183_MMSYS is not set
CONFIG_COMMON_CLK_MT8183_VDECSYS=y
CONFIG_COMMON_CLK_MT8183_VENCSYS=y
CONFIG_COMMON_CLK_MT8186=y
CONFIG_COMMON_CLK_MT8186_CAMSYS=y
CONFIG_COMMON_CLK_MT8186_IMGSYS=y
CONFIG_COMMON_CLK_MT8186_IPESYS=y
CONFIG_COMMON_CLK_MT8186_WPESYS=y
# CONFIG_COMMON_CLK_MT8186_IMP_IIC_WRAP is not set
CONFIG_COMMON_CLK_MT8186_MCUSYS=y
CONFIG_COMMON_CLK_MT8186_MDPSYS=y
CONFIG_COMMON_CLK_MT8186_MFGCFG=y
# CONFIG_COMMON_CLK_MT8186_MMSYS is not set
CONFIG_COMMON_CLK_MT8186_VDECSYS=y
CONFIG_COMMON_CLK_MT8186_VENCSYS=y
# CONFIG_COMMON_CLK_MT8188 is not set
CONFIG_COMMON_CLK_MT8192=y
CONFIG_COMMON_CLK_MT8192_AUDSYS=y
# CONFIG_COMMON_CLK_MT8192_CAMSYS is not set
CONFIG_COMMON_CLK_MT8192_IMGSYS=y
CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP=y
CONFIG_COMMON_CLK_MT8192_IPESYS=y
CONFIG_COMMON_CLK_MT8192_MDPSYS=y
# CONFIG_COMMON_CLK_MT8192_MFGCFG is not set
CONFIG_COMMON_CLK_MT8192_MMSYS=y
CONFIG_COMMON_CLK_MT8192_MSDC=y
CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
CONFIG_COMMON_CLK_MT8192_VDECSYS=y
CONFIG_COMMON_CLK_MT8192_VENCSYS=y
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8196 is not set
CONFIG_COMMON_CLK_MT8365=y
CONFIG_COMMON_CLK_MT8365_APU=y
CONFIG_COMMON_CLK_MT8365_CAM=y
CONFIG_COMMON_CLK_MT8365_MFG=y
CONFIG_COMMON_CLK_MT8365_MMSYS=y
CONFIG_COMMON_CLK_MT8365_VDEC=y
CONFIG_COMMON_CLK_MT8365_VENC=y
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

# CONFIG_COMMON_CLK_PXA1908 is not set

#
# Clock support for Amlogic platforms
#
# CONFIG_COMMON_CLK_AXG_AUDIO is not set
# end of Clock support for Amlogic platforms

CONFIG_MSTAR_MSC313_CPUPLL=y
# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_MCHP_CLK_MPFS is not set
CONFIG_COMMON_CLK_NUVOTON=y
CONFIG_CLK_MA35D1=y
# CONFIG_COMMON_CLK_PISTACHIO is not set
CONFIG_QCOM_GDSC=y
CONFIG_COMMON_CLK_QCOM=y
# CONFIG_CLK_GLYMUR_DISPCC is not set
CONFIG_CLK_GLYMUR_GCC=y
CONFIG_CLK_GLYMUR_TCSRCC=y
# CONFIG_CLK_KAANAPALI_CAMCC is not set
# CONFIG_CLK_KAANAPALI_DISPCC is not set
CONFIG_CLK_KAANAPALI_GCC=y
# CONFIG_CLK_KAANAPALI_GPUCC is not set
# CONFIG_CLK_KAANAPALI_TCSRCC is not set
CONFIG_CLK_KAANAPALI_VIDEOCC=y
CONFIG_CLK_X1E80100_CAMCC=y
# CONFIG_CLK_X1E80100_DISPCC is not set
CONFIG_CLK_X1E80100_GCC=y
# CONFIG_CLK_X1E80100_GPUCC is not set
# CONFIG_CLK_X1E80100_TCSRCC is not set
CONFIG_CLK_X1P42100_GPUCC=y
CONFIG_CLK_QCM2290_GPUCC=y
CONFIG_QCOM_A53PLL=y
CONFIG_QCOM_A7PLL=y
CONFIG_QCOM_CLK_APCS_MSM8916=y
CONFIG_QCOM_CLK_APCS_SDX55=y
CONFIG_QCOM_CLK_RPMH=y
# CONFIG_APQ_GCC_8084 is not set
# CONFIG_APQ_MMCC_8084 is not set
CONFIG_IPQ_APSS_PLL=y
# CONFIG_IPQ_APSS_5424 is not set
CONFIG_IPQ_CMN_PLL=y
CONFIG_IPQ_GCC_4019=y
CONFIG_IPQ_GCC_5018=y
# CONFIG_IPQ_GCC_5332 is not set
CONFIG_IPQ_GCC_5424=y
CONFIG_IPQ_GCC_6018=y
CONFIG_IPQ_GCC_806X=y
CONFIG_IPQ_LCC_806X=y
CONFIG_IPQ_GCC_8074=y
# CONFIG_IPQ_GCC_9574 is not set
CONFIG_IPQ_NSSCC_5424=y
CONFIG_IPQ_NSSCC_QCA8K=y
CONFIG_MSM_GCC_8660=y
CONFIG_MSM_GCC_8909=y
CONFIG_MSM_GCC_8916=y
# CONFIG_MSM_GCC_8917 is not set
CONFIG_MSM_GCC_8939=y
CONFIG_MSM_GCC_8960=y
CONFIG_MSM_LCC_8960=y
CONFIG_MDM_GCC_9607=y
CONFIG_MDM_GCC_9615=y
# CONFIG_MSM_MMCC_8960 is not set
CONFIG_MSM_GCC_8953=y
CONFIG_MSM_GCC_8974=y
CONFIG_MSM_MMCC_8974=y
# CONFIG_MSM_GCC_8976 is not set
# CONFIG_MSM_MMCC_8994 is not set
CONFIG_MSM_GCC_8994=y
CONFIG_MSM_GCC_8996=y
CONFIG_MSM_MMCC_8996=y
CONFIG_MSM_GCC_8998=y
# CONFIG_MSM_GPUCC_8998 is not set
# CONFIG_MSM_MMCC_8998 is not set
CONFIG_QCM_GCC_2290=y
# CONFIG_QCM_DISPCC_2290 is not set
CONFIG_QCS_DISPCC_615=y
CONFIG_QCS_CAMCC_615=y
CONFIG_QCS_GCC_404=y
CONFIG_SA_CAMCC_8775P=y
CONFIG_QCS_GCC_8300=y
CONFIG_QCS_GCC_615=y
# CONFIG_QCS_GPUCC_615 is not set
CONFIG_QCS_VIDEOCC_615=y
CONFIG_SC_CAMCC_7180=y
CONFIG_SC_CAMCC_7280=y
CONFIG_SC_CAMCC_8180X=y
CONFIG_SC_CAMCC_8280XP=y
CONFIG_SA_DISPCC_8775P=y
CONFIG_SC_DISPCC_7180=y
# CONFIG_SC_DISPCC_7280 is not set
CONFIG_SC_DISPCC_8280XP=y
CONFIG_SA_GCC_8775P=y
CONFIG_SA_GPUCC_8775P=y
CONFIG_SAR_GCC_2130P=y
# CONFIG_SAR_GPUCC_2130P is not set
CONFIG_SC_GCC_7180=y
CONFIG_SC_GCC_7280=y
CONFIG_SC_GCC_8180X=y
CONFIG_SC_GCC_8280XP=y
CONFIG_SC_GPUCC_7180=y
CONFIG_SC_GPUCC_7280=y
CONFIG_SC_GPUCC_8280XP=y
CONFIG_SC_LPASSCC_7280=y
CONFIG_SC_LPASSCC_8280XP=y
# CONFIG_SC_LPASS_CORECC_7180 is not set
# CONFIG_SC_LPASS_CORECC_7280 is not set
# CONFIG_SC_VIDEOCC_7180 is not set
CONFIG_SC_VIDEOCC_7280=y
# CONFIG_SDM_CAMCC_845 is not set
CONFIG_SDM_GCC_660=y
# CONFIG_SDM_MMCC_660 is not set
CONFIG_SDM_GPUCC_660=y
CONFIG_QCS_TURING_404=y
CONFIG_QCS_Q6SSTOP_404=y
# CONFIG_QDU_GCC_1000 is not set
# CONFIG_QDU_ECPRICC_1000 is not set
CONFIG_SDM_GCC_845=y
CONFIG_SDM_GPUCC_845=y
CONFIG_SDM_VIDEOCC_845=y
CONFIG_SDM_DISPCC_845=y
CONFIG_SDM_LPASSCC_845=y
CONFIG_SDX_GCC_55=y
CONFIG_SDX_GCC_65=y
CONFIG_SDX_GCC_75=y
CONFIG_SM_CAMCC_4450=y
# CONFIG_SM_CAMCC_6350 is not set
CONFIG_SM_CAMCC_7150=y
CONFIG_SM_CAMCC_MILOS=y
CONFIG_SM_CAMCC_8150=y
CONFIG_SM_CAMCC_8250=y
CONFIG_SM_CAMCC_8450=y
CONFIG_SM_CAMCC_8550=y
CONFIG_SM_CAMCC_8650=y
CONFIG_SM_CAMCC_8750=y
CONFIG_SM_DISPCC_4450=y
CONFIG_SM_DISPCC_6115=y
CONFIG_SM_DISPCC_6125=y
# CONFIG_SM_DISPCC_7150 is not set
CONFIG_SM_DISPCC_8250=y
# CONFIG_SM_DISPCC_6350 is not set
CONFIG_SM_DISPCC_6375=y
# CONFIG_SM_DISPCC_MILOS is not set
CONFIG_SM_DISPCC_8450=y
CONFIG_SM_DISPCC_8550=y
CONFIG_SM_DISPCC_8750=y
CONFIG_SM_GCC_4450=y
CONFIG_SM_GCC_6115=y
CONFIG_SM_GCC_6125=y
CONFIG_SM_GCC_6350=y
CONFIG_SM_GCC_6375=y
CONFIG_SM_GCC_7150=y
CONFIG_SM_GCC_MILOS=y
CONFIG_SM_GCC_8150=y
CONFIG_SM_GCC_8250=y
CONFIG_SM_GCC_8350=y
CONFIG_SM_GCC_8450=y
CONFIG_SM_GCC_8550=y
CONFIG_SM_GCC_8650=y
CONFIG_SM_GCC_8750=y
CONFIG_SM_GPUCC_4450=y
CONFIG_SM_GPUCC_6115=y
CONFIG_SM_GPUCC_6125=y
CONFIG_SM_GPUCC_6375=y
# CONFIG_SM_GPUCC_6350 is not set
# CONFIG_SM_GPUCC_MILOS is not set
# CONFIG_SM_GPUCC_8150 is not set
CONFIG_SM_GPUCC_8250=y
# CONFIG_SM_GPUCC_8350 is not set
CONFIG_SM_GPUCC_8450=y
# CONFIG_SM_GPUCC_8550 is not set
CONFIG_SM_GPUCC_8650=y
CONFIG_SM_LPASSCC_6115=y
CONFIG_SM_TCSRCC_8550=y
CONFIG_SM_TCSRCC_8650=y
CONFIG_SM_TCSRCC_8750=y
# CONFIG_SA_VIDEOCC_8775P is not set
CONFIG_SM_VIDEOCC_6350=y
CONFIG_SM_VIDEOCC_7150=y
CONFIG_SM_VIDEOCC_MILOS=y
CONFIG_SM_VIDEOCC_8150=y
CONFIG_SM_VIDEOCC_8250=y
CONFIG_SM_VIDEOCC_8350=y
CONFIG_SM_VIDEOCC_8550=y
# CONFIG_SM_VIDEOCC_8750 is not set
# CONFIG_SPMI_PMIC_CLKDIV is not set
# CONFIG_QCOM_HFPLL is not set
# CONFIG_KPSS_XCC is not set
# CONFIG_CLK_GFM_LPASS_SM8250 is not set
CONFIG_SM_VIDEOCC_8450=y
# CONFIG_CLK_MT7621 is not set
CONFIG_CLK_MTMIPS=y
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
CONFIG_S3C64XX_COMMON_CLK=y
CONFIG_S5PV210_COMMON_CLK=y
CONFIG_EXYNOS_3250_COMMON_CLK=y
CONFIG_EXYNOS_4_COMMON_CLK=y
CONFIG_EXYNOS_5250_COMMON_CLK=y
CONFIG_EXYNOS_5260_COMMON_CLK=y
CONFIG_EXYNOS_5410_COMMON_CLK=y
CONFIG_EXYNOS_5420_COMMON_CLK=y
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
CONFIG_EXYNOS_AUDSS_CLK_CON=y
CONFIG_EXYNOS_CLKOUT=y
# CONFIG_EXYNOS_ACPM_CLK is not set
# CONFIG_TESLA_FSD_COMMON_CLK is not set
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_CLK_SOPHGO_CV1800 is not set
CONFIG_CLK_SOPHGO_SG2042_PLL=y
CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
CONFIG_CLK_SOPHGO_SG2044=y
CONFIG_CLK_SOPHGO_SG2044_PLL=y

#
# Clock support for SpacemiT platforms
#
CONFIG_SPACEMIT_CCU=y
# CONFIG_SPACEMIT_K1_CCU is not set
CONFIG_SPACEMIT_K3_CCU=y
# end of Clock support for SpacemiT platforms

CONFIG_SPRD_COMMON_CLK=y
# CONFIG_SPRD_SC9860_CLK is not set
CONFIG_SPRD_SC9863A_CLK=y
CONFIG_SPRD_UMS512_CLK=y
CONFIG_CLK_STARFIVE_JH71X0=y
CONFIG_CLK_STARFIVE_JH7100=y
CONFIG_CLK_STARFIVE_JH7100_AUDIO=y
CONFIG_CLK_STARFIVE_JH7110_PLL=y
# CONFIG_CLK_STARFIVE_JH7110_SYS is not set
# CONFIG_CLK_SUNXI is not set
# CONFIG_SUNXI_CCU is not set
CONFIG_COMMON_CLK_STM32MP=y
CONFIG_COMMON_CLK_STM32MP135=y
# CONFIG_COMMON_CLK_STM32MP157 is not set
# CONFIG_COMMON_CLK_STM32MP215 is not set
CONFIG_COMMON_CLK_STM32MP257=y
CONFIG_COMMON_CLK_TI_ADPLL=y
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
# CONFIG_CLK_LGM_CGU is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_CLK_KUNIT_TEST=y
CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
CONFIG_CLK_GATE_KUNIT_TEST=y
CONFIG_CLK_FD_KUNIT_TEST=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
CONFIG_DAVINCI_TIMER=y
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
CONFIG_DW_APB_TIMER=y
CONFIG_ECONET_EN751221_TIMER=y
CONFIG_FTTMR010_TIMER=y
CONFIG_IXP4XX_TIMER=y
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
CONFIG_RDA_TIMER=y
# CONFIG_REALTEK_OTTO_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
CONFIG_TEGRA186_TIMER=y
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
CONFIG_CADENCE_TTC_TIMER=y
# CONFIG_ASM9260_TIMER is not set
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_TI_32K=y
CONFIG_CLKSRC_STM32_LP=y
# CONFIG_CLKSRC_MPS2 is not set
CONFIG_ARC_TIMERS=y
CONFIG_ARC_TIMERS_64BIT=y
CONFIG_ARM_TIMER_SP804=y
# CONFIG_ARMV7M_SYSTICK is not set
CONFIG_ATMEL_PIT=y
CONFIG_ATMEL_ST=y
CONFIG_CLKSRC_SAMSUNG_PWM=y
# CONFIG_FSL_FTM_TIMER is not set
CONFIG_NXP_PIT_TIMER=y
# CONFIG_MTK_TIMER is not set
# CONFIG_MTK_CPUX_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
CONFIG_SH_TIMER_MTU2=y
# CONFIG_RENESAS_OSTM is not set
CONFIG_SH_TIMER_TMU=y
CONFIG_EM_TIMER_STI=y
# CONFIG_CLKSRC_VERSATILE is not set
CONFIG_CLKSRC_PXA=y
CONFIG_TIMER_IMX_SYS_CTR=y
CONFIG_CLKSRC_LOONGSON1_PWM=y
# CONFIG_CLKSRC_ST_LPC is not set
CONFIG_GXP_TIMER=y
CONFIG_MSC313E_TIMER=y
# CONFIG_INGENIC_TIMER is not set
CONFIG_INGENIC_SYSOST=y
# CONFIG_INGENIC_OST is not set
# CONFIG_RALINK_TIMER is not set
# CONFIG_NXP_STM_TIMER is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_ARM_MHU_V3 is not set
CONFIG_AST2700_MBOX=y
# CONFIG_CV1800_MBOX is not set
# CONFIG_EXYNOS_MBOX is not set
# CONFIG_IMX_MBOX is not set
# CONFIG_PLATFORM_MHU is not set
CONFIG_ARMADA_37XX_RWTM_MBOX=y
# CONFIG_OMAP2PLUS_MBOX is not set
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_TI_MESSAGE_MANAGER is not set
CONFIG_MAILBOX_TEST=y
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
CONFIG_QCOM_APCS_IPC=y
CONFIG_BCM_PDC_MBOX=y
# CONFIG_STM32_IPCC is not set
CONFIG_MTK_ADSP_MBOX=y
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_MTK_GPUEB_MBOX is not set
CONFIG_MTK_VCP_MBOX=y
CONFIG_SUN6I_MSGBOX=y
CONFIG_SPRD_MBOX=y
CONFIG_QCOM_IPCC=y
# CONFIG_THEAD_TH1520_MBOX is not set
CONFIG_CIX_MBOX=y
CONFIG_BCM74110_MAILBOX=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set
CONFIG_GENERIC_PT=y
CONFIG_DEBUG_GENERIC_PT=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# CONFIG_INGENIC_VPU_RPROC is not set
CONFIG_MTK_SCP=y
CONFIG_MESON_MX_AO_ARC_REMOTEPROC=y
# CONFIG_PRU_REMOTEPROC is not set
CONFIG_RCAR_REMOTEPROC=y
CONFIG_STM32_RPROC=y
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_MTK_SCP=y
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#
# CONFIG_SOUNDWIRE_QCOM is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
CONFIG_MESON_GX_SOCINFO=y
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_SART=y
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_UART_ROUTING=y
CONFIG_ASPEED_P2A_CTRL=y
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
CONFIG_SOC_BRCMSTB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_DPAA2_CONSOLE=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# Hisilicon SoC drivers
#
# end of Hisilicon SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
CONFIG_SOC_IMX9=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_LOONGSON2_GUTS is not set

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_REGULATOR_COUPLER is not set
# CONFIG_MTK_MMSYS is not set
CONFIG_MTK_SVS=y
# CONFIG_MTK_SOCINFO is not set
# end of MediaTek SoC drivers

CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_AOSS_QMP=y
CONFIG_QCOM_COMMAND_DB=y
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_PD_MAPPER is not set
CONFIG_QCOM_PDR_HELPERS=y
CONFIG_QCOM_PDR_MSG=y
CONFIG_QCOM_QMI_HELPERS=y
CONFIG_QCOM_RAMP_CTRL=y
# CONFIG_QCOM_RMTFS_MEM is not set
CONFIG_QCOM_RPM_MASTER_STATS=y
CONFIG_QCOM_RPMH=y
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
CONFIG_QCOM_WCNSS_CTRL=y
CONFIG_QCOM_APR=y
CONFIG_QCOM_ICC_BWMON=y
# CONFIG_QCOM_PBS is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
CONFIG_ROCKCHIP_IODOMAIN=y
# CONFIG_SOC_SAMSUNG is not set

#
# Sophgo SoC drivers
#
CONFIG_SOPHGO_CV1800_RTCSYS=y
# CONFIG_SOPHGO_SG2044_TOPSYS is not set
# end of Sophgo SoC drivers

CONFIG_SUNXI_SRAM=y
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
CONFIG_SOC_TI=y
# CONFIG_TI_K3_SOCINFO is not set
CONFIG_TI_PRUSS=y
# CONFIG_UX500_SOC_ID is not set
# CONFIG_SOC_INTEGRATOR_CM is not set
CONFIG_SOC_REALVIEW=y

#
# VIA/WonderMedia SoC drivers
#
CONFIG_WMT_SOCINFO=y
# end of VIA/WonderMedia SoC drivers

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic PM Domains
#
CONFIG_MESON_EE_PM_DOMAINS=y
# end of Amlogic PM Domains

CONFIG_APPLE_PMGR_PWRSTATE=y
CONFIG_ARM_SCMI_PERF_DOMAIN=y
# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
# CONFIG_ARM_SCPI_POWER_DOMAIN is not set

#
# Broadcom PM Domains
#
# CONFIG_BCM2835_POWER is not set
CONFIG_BCM_PMB=y
# CONFIG_BCM63XX_POWER is not set
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
CONFIG_IMX_GPCV2_PM_DOMAINS=y
CONFIG_IMX8M_BLK_CTRL=y
CONFIG_IMX9_BLK_CTRL=y
# end of i.MX PM Domains

#
# Marvell PM Domains
#
CONFIG_PXA1908_PM_DOMAINS=y
# end of Marvell PM Domains

#
# MediaTek PM Domains
#
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
# CONFIG_MTK_MFG_PM_DOMAIN is not set
# end of MediaTek PM Domains

#
# Qualcomm PM Domains
#
CONFIG_QCOM_RPMHPD=y
# end of Qualcomm PM Domains

CONFIG_UX500_PM_DOMAIN=y
CONFIG_JH71XX_PMU=y
CONFIG_SUN20I_PPU=y
CONFIG_SUN50I_H6_PRCM_PPU=y
# CONFIG_SUN55I_PCK600 is not set
CONFIG_TH1520_PM_DOMAINS=y
# end of PM Domains

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
# CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is not set
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
CONFIG_ARM_IMX_BUS_DEVFREQ=y
CONFIG_ARM_TEGRA_DEVFREQ=y
# CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
# CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_LC824206XA=y
# CONFIG_EXTCON_MAX14577 is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77693=y
CONFIG_EXTCON_MAX14526=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_PWM=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_PROVIDE_GPIO=y
# CONFIG_PWM_AIROHA is not set
CONFIG_PWM_APPLE=y
# CONFIG_PWM_ARGON_FAN_HAT is not set
# CONFIG_PWM_ATMEL is not set
CONFIG_PWM_ATMEL_HLCDC_PWM=y
# CONFIG_PWM_ATMEL_TCB is not set
# CONFIG_PWM_AXI_PWMGEN is not set
CONFIG_PWM_BCM2835=y
CONFIG_PWM_BCM_IPROC=y
# CONFIG_PWM_BCM_KONA is not set
CONFIG_PWM_BERLIN=y
CONFIG_PWM_BRCMSTB=y
CONFIG_PWM_CLK=y
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_EP93XX is not set
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_HIBVT is not set
CONFIG_PWM_IMG=y
# CONFIG_PWM_IMX1 is not set
CONFIG_PWM_IMX27=y
# CONFIG_PWM_IMX_TPM is not set
CONFIG_PWM_INTEL_LGM=y
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_JZ4740 is not set
CONFIG_PWM_KEEMBAY=y
CONFIG_PWM_LOONGSON=y
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_MAX7360 is not set
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_MESON=y
CONFIG_PWM_MICROCHIP_CORE=y
CONFIG_PWM_MTK_DISP=y
CONFIG_PWM_MXS=y
CONFIG_PWM_NTXEC=y
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
CONFIG_PWM_RENESAS_RCAR=y
# CONFIG_PWM_RENESAS_RZG2L_GPT is not set
CONFIG_PWM_RENESAS_RZ_MTU3=y
CONFIG_PWM_RENESAS_TPU=y
CONFIG_PWM_ROCKCHIP=y
CONFIG_PWM_SAMSUNG=y
CONFIG_PWM_SIFIVE=y
CONFIG_PWM_SL28CPLD=y
CONFIG_PWM_SOPHGO_SG2042=y
CONFIG_PWM_SPEAR=y
# CONFIG_PWM_SPRD is not set
CONFIG_PWM_STI=y
CONFIG_PWM_STM32=y
CONFIG_PWM_STM32_LP=y
CONFIG_PWM_STMPE=y
CONFIG_PWM_SUN4I=y
CONFIG_PWM_SUNPLUS=y
CONFIG_PWM_TEGRA=y
CONFIG_PWM_TIECAP=y
CONFIG_PWM_TIEHRPWM=y
CONFIG_PWM_VISCONTI=y
CONFIG_PWM_VT8500=y
CONFIG_PWM_XILINX=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_BCM7038_L1_IRQ=y
CONFIG_BCM7120_L2_IRQ=y
# CONFIG_BRCMSTB_L2_IRQ is not set
CONFIG_LAN966X_OIC=y
CONFIG_MADERA_IRQ=y
# CONFIG_JCORE_AIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
CONFIG_RENESAS_IRQC=y
CONFIG_RENESAS_RZA1_IRQC=y
CONFIG_RENESAS_RZG2L_IRQC=y
# CONFIG_RENESAS_RZT2H_ICU is not set
# CONFIG_RENESAS_RZV2H_ICU is not set
CONFIG_SL28CPLD_INTC=y
# CONFIG_TS4800_IRQ is not set
CONFIG_XILINX_INTC=y
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_STM32MP_EXTI is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_MESON_IRQ_GPIO=y
# CONFIG_IMX_IRQSTEER is not set
CONFIG_IMX_INTMUX=y
CONFIG_TI_PRUSS_INTC=y
CONFIG_STARFIVE_JH8100_INTC=y
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=y
CONFIG_RESET_ASPEED=y
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
CONFIG_RESET_BCM6345=y
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
CONFIG_RESET_EIC7700=y
# CONFIG_RESET_EYEQ is not set
CONFIG_RESET_GPIO=y
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=y
CONFIG_RESET_IMX8MP_AUDIOMIX=y
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
CONFIG_RESET_K230=y
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
CONFIG_RESET_MCHP_SPARX5=y
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_NUVOTON_MA35D1 is not set
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=y
CONFIG_RESET_RZV2H_USB2PHY=y
CONFIG_RESET_SCMI=y
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_SUNPLUS=y
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TH1520=y
CONFIG_RESET_TI_SCI=y
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=y
CONFIG_RESET_TN48M_CPLD=y
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_GLUE is not set
CONFIG_RESET_ZYNQ=y
# CONFIG_RESET_ZYNQMP is not set
CONFIG_RESET_MESON_COMMON=y
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUX=y
# CONFIG_RESET_MESON_AUDIO_ARB is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# Reset support for SpacemiT platforms
#
CONFIG_RESET_SPACEMIT_COMMON=y
CONFIG_RESET_SPACEMIT_K3=y
# end of Reset support for SpacemiT platforms

CONFIG_RESET_STARFIVE_JH71X0=y
CONFIG_RESET_STARFIVE_JH7100=y
# CONFIG_STIH407_RESET is not set
# CONFIG_RESET_TEGRA_BPMP is not set

#
# PHY Subsystem
#
CONFIG_PHY_COMMON_PROPS=y
CONFIG_PHY_COMMON_PROPS_TEST=y
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_LPC18XX_USB_OTG=y
CONFIG_PHY_PISTACHIO_USB=y
CONFIG_PHY_SNPS_EUSB2=y
CONFIG_PHY_XGENE=y
CONFIG_USB_LGM_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set
CONFIG_PHY_AIROHA_PCIE=y
# CONFIG_PHY_NXP_PTN3222 is not set
# CONFIG_PHY_SPACEMIT_K1_PCIE is not set
CONFIG_PHY_SUN4I_USB=y
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
CONFIG_PHY_SUN9I_USB=y
CONFIG_PHY_SUN50I_USB3=y
CONFIG_PHY_MESON8_HDMI_TX=y
CONFIG_PHY_MESON8B_USB2=y
CONFIG_PHY_MESON_GXL_USB2=y
# CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
CONFIG_PHY_MESON_G12A_USB2=y
CONFIG_PHY_MESON_G12A_USB3_PCIE=y
CONFIG_PHY_MESON_AXG_PCIE=y
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
CONFIG_PHY_BCM_SR_USB=y
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_BCM_NS_USB2=y
CONFIG_PHY_BCM_NS_USB3=y
CONFIG_PHY_NS2_PCIE=y
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=y
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=y
CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_DPHY_RX=y
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=y
CONFIG_PHY_FSL_IMX8MQ_USB=y
CONFIG_PHY_MIXEL_LVDS_PHY=y
CONFIG_PHY_MIXEL_MIPI_DPHY=y
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
CONFIG_PHY_FSL_IMX8QM_HSIO=y
CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=y
CONFIG_PHY_FSL_LYNX_28G=y
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HI3660_USB=y
CONFIG_PHY_HI3670_USB=y
CONFIG_PHY_HI3670_PCIE=y
CONFIG_PHY_HISTB_COMBPHY=y
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_INGENIC_USB is not set
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
CONFIG_PHY_LANTIQ_RCU_USB2=y
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
CONFIG_PHY_BERLIN_SATA=y
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
CONFIG_PHY_MVEBU_A38X_COMPHY=y
CONFIG_PHY_MVEBU_CP110_UTMI=y
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_PXA_USB=y
CONFIG_PHY_MMP3_USB=y
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_MTK_PCIE is not set
# CONFIG_PHY_MTK_XFI_TPHY is not set
# CONFIG_PHY_MTK_TPHY is not set
# CONFIG_PHY_MTK_UFS is not set
CONFIG_PHY_MTK_XSPHY=y
CONFIG_PHY_MTK_HDMI=y
CONFIG_PHY_MTK_MIPI_CSI_0_5=y
CONFIG_PHY_MTK_MIPI_DSI=y
# CONFIG_PHY_MTK_DP is not set
CONFIG_PHY_SPARX5_SERDES=y
CONFIG_PHY_LAN966X_SERDES=y
CONFIG_PHY_MAPPHONE_MDM6600=y
CONFIG_PHY_OCELOT_SERDES=y
# CONFIG_PHY_MA35_USB is not set
CONFIG_PHY_ATH79_USB=y
CONFIG_PHY_QCOM_EDP=y
CONFIG_PHY_QCOM_IPQ4019_USB=y
# CONFIG_PHY_QCOM_PCIE2 is not set
CONFIG_PHY_QCOM_QMP=y
CONFIG_PHY_QCOM_QMP_COMBO=y
CONFIG_PHY_QCOM_QMP_PCIE=y
CONFIG_PHY_QCOM_QMP_PCIE_8996=y
CONFIG_PHY_QCOM_QMP_UFS=y
# CONFIG_PHY_QCOM_QMP_USB is not set
CONFIG_PHY_QCOM_QMP_USB_LEGACY=y
# CONFIG_PHY_QCOM_QUSB2 is not set
CONFIG_PHY_QCOM_EUSB2_REPEATER=y
# CONFIG_PHY_QCOM_M31_USB is not set
CONFIG_PHY_QCOM_M31_EUSB=y
CONFIG_PHY_QCOM_USB_HS=y
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_QCOM_USB_HS_28NM=y
# CONFIG_PHY_QCOM_USB_SS is not set
CONFIG_PHY_QCOM_IPQ806X_USB=y
# CONFIG_PHY_QCOM_SGMII_ETH is not set
CONFIG_PHY_MT7621_PCI=y
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RTK_RTD_USB2PHY=y
CONFIG_PHY_RTK_RTD_USB3PHY=y
CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_RZ_G3E_USB3 is not set
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
CONFIG_PHY_ROCKCHIP_INNO_HDMI=y
CONFIG_PHY_ROCKCHIP_INNO_USB2=y
CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=y
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
CONFIG_PHY_ROCKCHIP_PCIE=y
CONFIG_PHY_ROCKCHIP_SAMSUNG_DCPHY=y
CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y
CONFIG_PHY_ROCKCHIP_TYPEC=y
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_SAMSUNG_UFS=y
CONFIG_PHY_SAMSUNG_USB2=y
CONFIG_PHY_S5PV210_USB2=y
CONFIG_PHY_EXYNOS5_USBDRD=y
# CONFIG_PHY_UNIPHIER_USB2 is not set
CONFIG_PHY_UNIPHIER_USB3=y
CONFIG_PHY_UNIPHIER_PCIE=y
# CONFIG_PHY_UNIPHIER_AHCI is not set
CONFIG_PHY_SOPHGO_CV1800_USB2=y
CONFIG_PHY_SPACEMIT_K1_USB2=y
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_COMBOPHY=y
CONFIG_PHY_STM32_USBPHYC=y
# CONFIG_PHY_STARFIVE_JH7110_DPHY_RX is not set
# CONFIG_PHY_STARFIVE_JH7110_DPHY_TX is not set
CONFIG_PHY_STARFIVE_JH7110_PCIE=y
CONFIG_PHY_STARFIVE_JH7110_USB=y
CONFIG_PHY_SUNPLUS_USB=y
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=y
# CONFIG_PHY_DM816X_USB is not set
CONFIG_PHY_AM654_SERDES=y
CONFIG_PHY_J721E_WIZ=y
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_OMAP_USB2=y
CONFIG_TI_PIPE3=y
# CONFIG_PHY_TUSB1210 is not set
CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=y
CONFIG_MCB_LPC=y
CONFIG_RAS=y

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
# CONFIG_ANDROID_BINDERFS is not set
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
CONFIG_ANDROID_BINDER_ALLOC_KUNIT_TEST=y
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_LAYOUTS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
CONFIG_NVMEM_LAYOUT_U_BOOT_ENV=y
# end of Layout Types

CONFIG_NVMEM_AN8855_EFUSE=y
CONFIG_NVMEM_APPLE_EFUSES=y
CONFIG_NVMEM_APPLE_SPMI=y
CONFIG_NVMEM_BCM_OCOTP=y
# CONFIG_NVMEM_BRCM_NVRAM is not set
CONFIG_NVMEM_IMX_IIM=y
CONFIG_NVMEM_IMX_OCOTP=y
# CONFIG_NVMEM_IMX_OCOTP_ELE is not set
CONFIG_NVMEM_JZ4780_EFUSE=y
CONFIG_NVMEM_LAN9662_OTPC=y
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MAX77759=y
CONFIG_NVMEM_MESON_MX_EFUSE=y
CONFIG_NVMEM_MICROCHIP_OTPC=y
CONFIG_NVMEM_MTK_EFUSE=y
# CONFIG_NVMEM_MXS_OCOTP is not set
CONFIG_NVMEM_NINTENDO_OTP=y
CONFIG_NVMEM_QCOM_QFPROM=y
CONFIG_NVMEM_QCOM_SEC_QFPROM=y
CONFIG_NVMEM_RCAR_EFUSE=y
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_ROCKCHIP_EFUSE=y
CONFIG_NVMEM_ROCKCHIP_OTP=y
# CONFIG_NVMEM_SC27XX_EFUSE is not set
CONFIG_NVMEM_SNVS_LPGPR=y
CONFIG_NVMEM_SPMI_SDAM=y
# CONFIG_NVMEM_SPRD_EFUSE is not set
CONFIG_NVMEM_STM32_ROMEM=y
CONFIG_NVMEM_SUNPLUS_OCOTP=y
CONFIG_NVMEM_U_BOOT_ENV=y
CONFIG_NVMEM_UNIPHIER_EFUSE=y
CONFIG_NVMEM_VF610_OCOTP=y
# CONFIG_NVMEM_QORIQ_EFUSE is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=y
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_ALTERA_PR_IP_CORE_PLAT=y
CONFIG_FPGA_MGR_ZYNQ_FPGA=y
CONFIG_FPGA_MGR_XILINX_CORE=y
CONFIG_FPGA_MGR_XILINX_SELECTMAP=y
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
# CONFIG_XILINX_PR_DECOUPLER is not set
# CONFIG_FPGA_REGION is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
CONFIG_FPGA_MGR_VERSAL_FPGA=y
# CONFIG_FSI is not set
CONFIG_TEE=y
CONFIG_TEE_DMABUF_HEAPS=y
CONFIG_OPTEE_STATIC_PROTMEM_POOL=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
CONFIG_INTERCONNECT_MTK=y
CONFIG_INTERCONNECT_QCOM_OSM_L3=y
CONFIG_INTERCONNECT_SAMSUNG=y
CONFIG_INTERCONNECT_EXYNOS=y
CONFIG_INTERCONNECT_CLK=y
CONFIG_INTERCONNECT_KUNIT_TEST=y
CONFIG_COUNTER=y
CONFIG_104_QUAD_8=y
# CONFIG_FTM_QUADDEC is not set
CONFIG_INTERRUPT_CNT=y
# CONFIG_MICROCHIP_TCB_CAPTURE is not set
CONFIG_RZ_MTU3_CNT=y
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_STM32_TIMER_CNT is not set
CONFIG_TI_ECAP_CAPTURE=y
CONFIG_TI_EQEP=y
CONFIG_MOST=y
CONFIG_MOST_USB_HDM=y
# CONFIG_MOST_CDEV is not set
CONFIG_MOST_SND=y
# CONFIG_PECI is not set
# CONFIG_HTE is not set
CONFIG_CDX_BUS=y
# CONFIG_CDX_CONTROLLER is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_FS_STACK=y
CONFIG_BUFFER_HEAD=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
# CONFIG_EXT4_FS is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_SUPPORT_ASCII_CI=y
CONFIG_XFS_QUOTA=y
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
CONFIG_XFS_DEBUG=y
# CONFIG_XFS_DEBUG_EXPENSIVE is not set
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=y
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=y
# CONFIG_OCFS2_FS_O2CB is not set
# CONFIG_OCFS2_FS_USERSPACE_CLUSTER is not set
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
CONFIG_OCFS2_DEBUG_FS=y
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_EXPERIMENTAL=y
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_FUSE_PASSTHROUGH=y
# CONFIG_FUSE_IO_URING is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_METACOPY=y
# CONFIG_OVERLAY_FS_DEBUG is not set

#
# Caches
#
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_FAT_KUNIT_TEST=y
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS3_FS=y
CONFIG_NTFS3_LZX_XPRESS=y
# CONFIG_NTFS3_FS_POSIX_ACL is not set
CONFIG_NTFS_FS=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_HFS_FS=y
CONFIG_HFS_KUNIT_TEST=y
CONFIG_HFSPLUS_FS=y
CONFIG_HFSPLUS_KUNIT_TEST=y
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_WRITEBUFFER is not set
CONFIG_JFFS2_SUMMARY=y
# CONFIG_JFFS2_FS_XATTR is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_JFFS2_CMODE_NONE is not set
CONFIG_JFFS2_CMODE_PRIORITY=y
# CONFIG_JFFS2_CMODE_SIZE is not set
# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
# CONFIG_UBIFS_FS_ZSTD is not set
CONFIG_UBIFS_ATIME_SUPPORT=y
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_SECURITY=y
# CONFIG_UBIFS_FS_AUTHENTICATION is not set
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=y
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_MULTI=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_MOUNT_DECOMP_THREADS=y
# CONFIG_SQUASHFS_XATTR is not set
CONFIG_SQUASHFS_COMP_CACHE_FULL=y
# CONFIG_SQUASHFS_ZLIB is not set
CONFIG_SQUASHFS_LZ4=y
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
CONFIG_MINIX_FS=y
CONFIG_MINIX_FS_NATIVE_ENDIAN=y
CONFIG_OMFS_FS=y
CONFIG_HPFS_FS=y
CONFIG_QNX4FS_FS=y
# CONFIG_QNX6FS_FS is not set
CONFIG_ROMFS_FS=y
# CONFIG_ROMFS_BACKED_BY_BLOCK is not set
# CONFIG_ROMFS_BACKED_BY_MTD is not set
CONFIG_ROMFS_BACKED_BY_BOTH=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_ROMFS_ON_MTD=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_CONSOLE is not set
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_RAM is not set
CONFIG_PSTORE_ZONE=y
CONFIG_PSTORE_BLK=y
CONFIG_PSTORE_BLK_BLKDEV=""
CONFIG_PSTORE_BLK_KMSG_SIZE=64
CONFIG_PSTORE_BLK_MAX_REASON=2
CONFIG_PSTORE_BLK_PMSG_SIZE=64
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_NLS_UCS2_UTILS=y
CONFIG_DLM=y
# CONFIG_DLM_DEBUG is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_HAVE_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
# CONFIG_TRUSTED_KEYS_TEE is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_PROC_MEM_ALWAYS_FORCE=y
# CONFIG_PROC_MEM_FORCE_PTRACE is not set
# CONFIG_PROC_MEM_NO_FORCE is not set
CONFIG_SECURITY=y
CONFIG_HAS_SECURITY_AUDIT=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_INFINIBAND is not set
# CONFIG_SECURITY_NETWORK_XFRM is not set
CONFIG_SECURITY_PATH=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING=y
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_DEBUG=y
# CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS is not set
CONFIG_SECURITY_APPARMOR_DEBUG_MESSAGES=y
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_EXPORT_BINARY is not set
# CONFIG_SECURITY_APPARMOR_PARANOID_LOAD is not set
CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_LOADPIN_VERITY=y
# CONFIG_SECURITY_YAMA is not set
CONFIG_SECURITY_SAFESETID=y
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_SECURITY_LANDLOCK_KUNIT_TEST=y
# CONFIG_SECURITY_IPE is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
# CONFIG_INTEGRITY_AUDIT is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_TOMOYO=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,tomoyo,ipe,bpf"
CONFIG_SECURITY_COMMONCAP_KUNIT_TEST=y

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization

#
# Bounds checking
#
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_DEFAULT_ON=y
# end of Bounds checking

#
# Hardening of kernel data structures
#
CONFIG_LIST_HARDENED=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Hardening of kernel data structures

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG=y
CONFIG_CRYPTO_SIG2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
# CONFIG_CRYPTO_NULL is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_KRB5ENC=y
# end of Crypto core or helper

#
# Public-key cryptography
#
# CONFIG_CRYPTO_RSA is not set
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_MLDSA=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
CONFIG_CRYPTO_SEED=y
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
# CONFIG_CRYPTO_XTS is not set
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_GENIV=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
# CONFIG_CRYPTO_MD5 is not set
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=64
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE=32
CONFIG_CRYPTO_JITTERENTROPY_OSR=1
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# end of Userspace interface

# CONFIG_CRYPTO_HW is not set
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
CONFIG_OPENSSL_SUPPORTS_ML_DSA=y
# end of Certificates for signature checking

CONFIG_CRYPTO_KRB5=y
# CONFIG_CRYPTO_KRB5_SELFTESTS is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_PACKING_KUNIT_TEST=y
CONFIG_BITREVERSE=y
CONFIG_ARCH_HAS_STRNLEN_USER=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_STMP_DEVICE=y
CONFIG_CRC7=y
CONFIG_CRC8=y
CONFIG_CRC16=y
CONFIG_CRC_CCITT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC32=y
CONFIG_CRC64=y
CONFIG_CRC_OPTIMIZATIONS=y
CONFIG_CRC_KUNIT_TEST=y
# CONFIG_CRC_BENCHMARK is not set

#
# Crypto library routines
#
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_AESCFB=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2B=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_MD5=y
CONFIG_CRYPTO_LIB_MLDSA=y
CONFIG_CRYPTO_LIB_NH=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLYVAL=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA512=y
CONFIG_CRYPTO_LIB_SHA3=y
CONFIG_CRYPTO_LIB_SM3=y
CONFIG_CRYPTO_LIB_BLAKE2B_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_BLAKE2S_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_CURVE25519_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_MD5_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_MLDSA_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_NH_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_POLYVAL_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_SHA3_KUNIT_TEST=y
CONFIG_CRYPTO_LIB_BENCHMARK_VISIBLE=y
CONFIG_CRYPTO_LIB_BENCHMARK=y
# end of Crypto library routines

CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_ARM64=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_RISCV=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_CLOSURES=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
CONFIG_DMA_NEED_SYNC=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_FORCE_NR_CPUS=y
CONFIG_GLOB=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONT_8x16=y
CONFIG_FONT_AUTOSELECT=y
CONFIG_SG_POOL=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_STACKDEPOT_MAX_FRAMES=64
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
CONFIG_OBJAGG=y
CONFIG_LWQ_TEST=y
# end of Library routines

CONFIG_GENERIC_IOREMAP=y
CONFIG_GENERIC_LIB_MULDI3=y
CONFIG_GENERIC_LIB_CMPDI2=y
CONFIG_GENERIC_LIB_UCMPDI2=y
CONFIG_ASN1_ENCODER=y
CONFIG_POLYNOMIAL=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_PRINTK_CALLER=y
CONFIG_PRINTK_EXECUTION_CTX=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_ULEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED_NONE is not set
CONFIG_DEBUG_INFO_COMPRESSED_ZLIB=y
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_BTF is not set
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KCSAN=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
CONFIG_NET_NS_REFCNT_TRACKER=y
# CONFIG_DEBUG_NET is not set
# CONFIG_DEBUG_NET_SMALL_RTNL is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_DEBUG_ON=y
CONFIG_SLUB_RCU_DEBUG=y
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VFS is not set
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
CONFIG_DEBUG_VM_RB=y
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_KMAP_LOCAL is not set
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_STACK=y
# CONFIG_KASAN_EXTRA_INFO is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=0
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_ATOMIC is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CLOSURES=y
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# xtensa Debugging
#
# CONFIG_DEBUG_TLB_SANITY is not set
# CONFIG_LD_NO_RELAX is not set
CONFIG_S32C1I_SELFTEST=y
CONFIG_PRINT_STACK_DEPTH=64
# CONFIG_PRINT_USER_CODE_ON_UNHANDLED_EXCEPTION is not set
# end of xtensa Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
# CONFIG_KUNIT_FAULT_TEST is not set
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
CONFIG_KUNIT_DEFAULT_ENABLED=y
CONFIG_KUNIT_AUTORUN_ENABLED=y
CONFIG_KUNIT_DEFAULT_FILTER_GLOB=""
CONFIG_KUNIT_DEFAULT_FILTER=""
CONFIG_KUNIT_DEFAULT_FILTER_ACTION=""
CONFIG_KUNIT_DEFAULT_TIMEOUT=300
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

#
# Documentation
#
# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Documentation

CONFIG_IO_URING_ZCRX=y
CONFIG_IO_URING_BPF=y

--=-=YwfHzRrzIIxvx3POcuU6df0xlC3C7oXMX8ZV=-=--
