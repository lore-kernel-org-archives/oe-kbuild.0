Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB652877DA
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305963; cv=none; b=r0ADHRIWQRPTq9reco3ZeWghqeuGbXNLBaZgDSKNE12qeWZKslBeNCcFjOrVbXLLbRjWM851UUCUI/yAOil31q1vQcnivv1J5aE52zo5j233yLxFw3UGOf7LqIB8KskAm8gqxcOcSsGyLHYyoLPgb9/2LdWcwoyWSarfkb6Krds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305963; c=relaxed/simple;
	bh=R8fCxhbJ0Wr743Tq69UbVbn1bmnKjRZn7zmr37f2Hak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a1TEH0z0z3bh0q+YORqcGVjUZk/+v5FdUTPBSExHUV/HgCdjAFEFYgSQwjoGdaXQxBLIQN3FhLyAbNW3BXjsfoGsa6DiBOjDXivv6aV0ztUP0SYxIJDwZjJMj92nadL+HwnYXHEbCXeogvMjFNq3Ub+zwMBYJhEfkVMLNccDuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9GeEiTR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9GeEiTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768305961; x=1799841961;
  h=date:from:to:cc:subject:message-id;
  bh=R8fCxhbJ0Wr743Tq69UbVbn1bmnKjRZn7zmr37f2Hak=;
  b=k9GeEiTRhfU/md0ELa3OfxQXElaj1bvW7vv4rRZU5HTKxMBJpJdXHu0H
   6ZeYlkOZVhO0P3Q/SD4SfRl8p8FP1mOYnd7w4VQ6GomojfsxihHQzuliu
   WppfGsMz/puPLzfcndbT4QZlKxYDCW6fQW9tsQ64vYBfVaEd7oS/WtG4S
   6cZdGpNHCkRESTOf5iLuIc9Nfgq/Ee4wMnZPJWjv3aH3IpIY+/l6JQUBc
   rev2HfY5Q+jRg/gFz6hri5FSdnWEXvlaoodkS8yu7vzcO56uE9Pp+BVpF
   h+or9FYW5pSfZSBNCNhJ61rqAxqeBvRmTVTfQFXK8sBp7XxswtQgucPjJ
   g==;
X-CSE-ConnectionGUID: sqUiClUsTh6X8g9lDDeH7A==
X-CSE-MsgGUID: B9zGiLM7TwCjyZ1oUwnCBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87004570"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="87004570"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:06:01 -0800
X-CSE-ConnectionGUID: VqJC93EmSIS6j0H3d/iFYQ==
X-CSE-MsgGUID: rjIgEyl8QymT0jt1xXjD3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227567221"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 04:05:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfd9o-00000000Ei2-2w9x;
	Tue, 13 Jan 2026 12:05:56 +0000
Date: Tue, 13 Jan 2026 20:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/bridge/tda998x_drv.c:1883:8-28: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202601131929.hu6imWfs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Dmitry,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 325ba852d148434c5bcb06d513af1933a7f77b70 drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260113/202601131929.hu6imWfs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601131929.hu6imWfs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tda998x_drv.c:1883:8-28: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +1883 drivers/gpu/drm/bridge/tda998x_drv.c

76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1773  
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1774  static int tda998x_create(struct device *dev)
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1775  {
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1776  	struct i2c_client *client = to_i2c_client(dev);
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1777  	struct device_node *np = client->dev.of_node;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1778  	struct i2c_board_info cec_info;
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1779  	struct tda998x_priv *priv;
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1780  	u32 video;
fb7544d7732f78 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2014-02-02  1781  	int rev_lo, rev_hi, ret;
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1782  
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1783  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1784  	if (!priv)
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1785  		return -ENOMEM;
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1786  
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1787  	dev_set_drvdata(dev, priv);
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1788  
d93ae190e2c952 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1789  	mutex_init(&priv->mutex);	/* protect the page access */
d93ae190e2c952 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1790  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1791  	mutex_init(&priv->edid_mutex);
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1792  	INIT_LIST_HEAD(&priv->bridge.list);
d93ae190e2c952 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1793  	init_waitqueue_head(&priv->edid_delay_waitq);
d93ae190e2c952 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1794  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
d93ae190e2c952 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1795  	INIT_WORK(&priv->detect_work, tda998x_detect_work);
ba300c1787f793 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1796  
5e74c22cd1e0f9 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2013-08-14  1797  	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(2) | VIP_CNTRL_0_SWAP_B(3);
5e74c22cd1e0f9 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2013-08-14  1798  	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(0) | VIP_CNTRL_1_SWAP_D(1);
5e74c22cd1e0f9 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2013-08-14  1799  	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(4) | VIP_CNTRL_2_SWAP_F(5);
5e74c22cd1e0f9 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2013-08-14  1800  
14e5b5889d7589 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-03  1801  	/* CEC I2C address bound to TDA998x I2C addr by configuration pins */
14e5b5889d7589 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-03  1802  	priv->cec_addr = 0x34 + (client->addr & 0x03);
2eb4c7b1e7f275 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1803  	priv->current_page = 0xff;
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1804  	priv->hdmi = client;
ed9a84262a83ab drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-11-29  1805  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1806  	/* wake up the device: */
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1807  	cec_write(priv, REG_CEC_ENAMODS,
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1808  			CEC_ENAMODS_EN_RXSENS | CEC_ENAMODS_EN_HDMI);
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1809  
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1810  	tda998x_reset(priv);
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1811  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1812  	/* read version: */
fb7544d7732f78 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2014-02-02  1813  	rev_lo = reg_read(priv, REG_VERSION_LSB);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1814  	if (rev_lo < 0) {
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1815  		dev_err(dev, "failed to read version: %d\n", rev_lo);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1816  		return rev_lo;
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1817  	}
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1818  
fb7544d7732f78 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2014-02-02  1819  	rev_hi = reg_read(priv, REG_VERSION_MSB);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1820  	if (rev_hi < 0) {
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1821  		dev_err(dev, "failed to read version: %d\n", rev_hi);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1822  		return rev_hi;
fb7544d7732f78 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2014-02-02  1823  	}
fb7544d7732f78 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2014-02-02  1824  
fb7544d7732f78 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2014-02-02  1825  	priv->rev = rev_lo | rev_hi << 8;
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1826  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1827  	/* mask off feature bits: */
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1828  	priv->rev &= ~0x30; /* not-hdcp and not-scalar bit */
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1829  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1830  	switch (priv->rev) {
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1831  	case TDA9989N2:
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1832  		dev_info(dev, "found TDA9989 n2");
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1833  		break;
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1834  	case TDA19989:
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1835  		dev_info(dev, "found TDA19989");
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1836  		break;
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1837  	case TDA19989N2:
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1838  		dev_info(dev, "found TDA19989 n2");
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1839  		break;
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1840  	case TDA19988:
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1841  		dev_info(dev, "found TDA19988");
b728fab7026b9d drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1842  		break;
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1843  	default:
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1844  		dev_err(dev, "found unsupported device: %04x\n", priv->rev);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1845  		return -ENXIO;
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1846  	}
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1847  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1848  	/* after reset, enable DDC: */
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1849  	reg_write(priv, REG_DDC_DISABLE, 0x00);
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1850  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1851  	/* set clock on DDC channel: */
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1852  	reg_write(priv, REG_TX3, 39);
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1853  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1854  	/* if necessary, disable multi-master: */
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1855  	if (priv->rev == TDA19989)
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1856  		reg_set(priv, REG_I2C_MASTER, I2C_MASTER_DIS_MM);
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1857  
2f7f730a4f0fd3 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1858  	cec_write(priv, REG_CEC_FRO_IM_CLK_CTRL,
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1859  			CEC_FRO_IM_CLK_CTRL_GHOST_DIS | CEC_FRO_IM_CLK_CTRL_IMCLK_SEL);
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1860  
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1861  	/* ensure interrupts are disabled */
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1862  	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1863  
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1864  	/* clear pending interrupts */
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1865  	cec_read(priv, REG_CEC_RXSHPDINT);
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1866  	reg_read(priv, REG_INT_FLAGS_0);
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1867  	reg_read(priv, REG_INT_FLAGS_1);
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1868  	reg_read(priv, REG_INT_FLAGS_2);
ba8975f15bb93d drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2017-03-11  1869  
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1870  	/* initialize the optional IRQ */
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1871  	if (client->irq) {
ae81553c30ef86 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-03  1872  		unsigned long irq_flags;
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1873  
6833d26ef823b2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-11-29  1874  		/* init read EDID waitqueue and HDP work */
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1875  		init_waitqueue_head(&priv->wq_edid);
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1876  
ae81553c30ef86 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-03  1877  		irq_flags =
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1878  			irqd_get_trigger_type(irq_get_irq_data(client->irq));
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1879  
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1880  		priv->cec_glue.irq_flags = irq_flags;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1881  
ae81553c30ef86 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-03  1882  		irq_flags |= IRQF_SHARED | IRQF_ONESHOT;
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25 @1883  		ret = request_threaded_irq(client->irq, NULL,
ae81553c30ef86 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-03  1884  					   tda998x_irq_thread, irq_flags,
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1885  					   "tda998x", priv);
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1886  		if (ret) {
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1887  			dev_err(dev, "failed to request IRQ#%u: %d\n",
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1888  				client->irq, ret);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1889  			goto err_irq;
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1890  		}
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1891  
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1892  		/* enable HPD irq */
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1893  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1894  	}
12473b7d8e6074 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1895  
ece485d550dce2 drivers/gpu/drm/i2c/tda998x_drv.c Dariusz Marcinkiewicz 2019-10-17  1896  	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1897  	if (!priv->cec_notify) {
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1898  		ret = -ENOMEM;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1899  		goto fail;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1900  	}
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1901  
76767fdabadbea drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1902  	priv->cec_glue.parent = dev;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1903  	priv->cec_glue.data = priv;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1904  	priv->cec_glue.init = tda998x_cec_hook_init;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1905  	priv->cec_glue.exit = tda998x_cec_hook_exit;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1906  	priv->cec_glue.open = tda998x_cec_hook_open;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1907  	priv->cec_glue.release = tda998x_cec_hook_release;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1908  
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1909  	/*
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1910  	 * Some TDA998x are actually two I2C devices merged onto one piece
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1911  	 * of silicon: TDA9989 and TDA19989 combine the HDMI transmitter
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1912  	 * with a slightly modified TDA9950 CEC device.  The CEC device
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1913  	 * is at the TDA9950 address, with the address pins strapped across
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1914  	 * to the TDA998x address pins.  Hence, it always has the same
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1915  	 * offset.
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1916  	 */
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1917  	memset(&cec_info, 0, sizeof(cec_info));
f4a0659f823e5a drivers/gpu/drm/i2c/tda998x_drv.c Azeem Shaikh          2023-05-22  1918  	strscpy(cec_info.type, "tda9950", sizeof(cec_info.type));
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1919  	cec_info.addr = priv->cec_addr;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1920  	cec_info.platform_data = &priv->cec_glue;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1921  	cec_info.irq = client->irq;
7e8675f000bc7e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-10-05  1922  
bf2993c19b00af drivers/gpu/drm/i2c/tda998x_drv.c Wolfram Sang          2020-03-26  1923  	priv->cec = i2c_new_client_device(client->adapter, &cec_info);
bf2993c19b00af drivers/gpu/drm/i2c/tda998x_drv.c Wolfram Sang          2020-03-26  1924  	if (IS_ERR(priv->cec)) {
bf2993c19b00af drivers/gpu/drm/i2c/tda998x_drv.c Wolfram Sang          2020-03-26  1925  		ret = PTR_ERR(priv->cec);
101e996b8d3215 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1926  		goto fail;
101e996b8d3215 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1927  	}
101e996b8d3215 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1928  
e47826274e8871 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1929  	/* enable EDID read irq: */
e47826274e8871 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1930  	reg_set(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
e47826274e8871 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1931  
6c1187aaa2912f drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1932  	if (np) {
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1933  		/* get the device tree parameters */
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1934  		ret = of_property_read_u32(np, "video-ports", &video);
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1935  		if (ret == 0) {
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1936  			priv->vip_cntrl_0 = video >> 16;
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1937  			priv->vip_cntrl_1 = video >> 8;
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1938  			priv->vip_cntrl_2 = video;
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1939  		}
0d44ea190387e2 drivers/gpu/drm/i2c/tda998x_drv.c Jean-Francois Moine   2014-01-25  1940  
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1941  		ret = tda998x_get_audio_ports(priv, np);
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1942  		if (ret)
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1943  			goto fail;
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1944  
7168916072b549 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2019-03-01  1945  		if (priv->audio_port_enable[AUDIO_ROUTE_I2S] ||
7168916072b549 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2019-03-01  1946  		    priv->audio_port_enable[AUDIO_ROUTE_SPDIF])
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1947  			tda998x_audio_codec_init(priv, &client->dev);
6c1187aaa2912f drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1948  	}
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1949  
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1950  	priv->bridge.funcs = &tda998x_bridge_funcs;
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1951  #ifdef CONFIG_OF
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1952  	priv->bridge.of_node = dev->of_node;
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1953  #endif
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1954  
30bd8b862f5466 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1955  	drm_bridge_add(&priv->bridge);
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1956  
7e567624dc5a44 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha            2016-08-09  1957  	return 0;
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1958  
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1959  fail:
2143adb04b357e drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2018-08-02  1960  	tda998x_destroy(dev);
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1961  err_irq:
6a765c3fe54973 drivers/gpu/drm/i2c/tda998x_drv.c Russell King          2016-11-17  1962  	return ret;
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1963  }
e7792ce2da5ded drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark             2013-01-08  1964  

:::::: The code at line 1883 was first introduced by commit
:::::: 12473b7d8e6074c7d4c2816afa6027354ce9a502 drm/i2c: tda998x: use irq for connection status and EDID read

:::::: TO: Jean-Francois Moine <moinejf@free.fr>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
