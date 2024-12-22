Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3D3944E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734875711; cv=none; b=QvbFh5EGEIV6eGZmeD7iy0Hawty2Zt7A1y6pnKdtzdbPNEzIfcQW/Yq3IYrSUe3dweBN7uiKmcUWFRZSoxizvjFJc6iHM3dwBWw/CaKX7vMGe0H3FENT2Jp2tdx8naFWAZy3HjK7g+jGIidjimneI6i91bH1dNwhd/IMfL8RVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734875711; c=relaxed/simple;
	bh=q0bIvTULj9sD4ftjvnMb9h5GQs6nuS9/aTn7cUtYwA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZMTBf6+hIKVvzE+cl3fo7OsZQN+kJuQ0Owchdb/Bn+DKCNjreS6VDtgMVWAq4Ya7zMoe4rplagplsv1r0EhUK2WRJJREXLNWqPG+1t5TrkECQoz4P7/7xOMDr0axFRmEvL1eKeXAE7sbruBPcptInodFymk8gdkwRq5MlEpzyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huycXDtc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huycXDtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734875709; x=1766411709;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q0bIvTULj9sD4ftjvnMb9h5GQs6nuS9/aTn7cUtYwA0=;
  b=huycXDtcg9xn10HthR1AaQod2/oqeTp7Y0QoBChDuFszvWM6wWP7cl/z
   9cgro1MMZA/qWoS/6WRWDW30dUYXHR+EOYqdnAmE5NeS2ODP1e4Dq2J1v
   oS65Ilo+igsdISWLPHh8E6xsqB2yx9lDGr1wCNGi1hshuToR13usigAhr
   crf77hqQLy7gRSZSZvuQ1CiJImfkKE72kYEAF6gik3rm3cIqYeNYN7hXC
   JxuiZ40si0YpJhst9V7c+9JOef51VBP+7JzQGwX2qYnoxf1Ks6BcY3Lmg
   g1UxSP3pFKGxbq5lhxk4xWOBUr0Tsy/rNcXyCyUkFZ470ITR+NVuh7ZP3
   Q==;
X-CSE-ConnectionGUID: OiuAUY1gS7uY86pjHM7olg==
X-CSE-MsgGUID: S/Jwvd6IRmi9fyxjB1CV3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39296796"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39296796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 05:55:08 -0800
X-CSE-ConnectionGUID: O2BFY2drTkuOhJI22++6jQ==
X-CSE-MsgGUID: oGKc38BRQfinVoHZD6Khjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="103942419"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2024 05:55:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPMQC-0002zL-35;
	Sun, 22 Dec 2024 13:55:04 +0000
Date: Sun, 22 Dec 2024 21:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3636/5236] drivers/spi/atmel-quadspi.c:1282
 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
Message-ID: <202412222135.I9vxNl6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Varshini Rajendran <varshini.rajendran@microchip.com>
CC: "Csókás, Bence" <csokas.bence@prolan.hu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 [3636/5236] spi: atmel-quadspi: Add support for sama7g5 QSPI
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: nios2-randconfig-r072-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222135.I9vxNl6I-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412222135.I9vxNl6I-lkp@intel.com/

smatch warnings:
drivers/spi/atmel-quadspi.c:1282 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1282 drivers/spi/atmel-quadspi.c

161aaab8a067a96 drivers/mtd/spi-nor/atmel-quadspi.c Cyrille Pitchen 2016-06-13  1273  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1274  static int atmel_qspi_dma_init(struct spi_controller *ctrl)
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1275  {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1276  	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1277  	int ret;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1278  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1279  	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1280  	if (IS_ERR(aq->rx_chan)) {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1281  		aq->rx_chan = NULL;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28 @1282  		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1283  				     "RX DMA channel is not available\n");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1284  	}
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1285  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1286  	aq->tx_chan = dma_request_chan(&aq->pdev->dev, "tx");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1287  	if (IS_ERR(aq->tx_chan)) {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1288  		ret = dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->tx_chan),
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1289  				    "TX DMA channel is not available\n");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1290  		goto release_rx_chan;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1291  	}
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1292  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1293  	ctrl->dma_rx = aq->rx_chan;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1294  	ctrl->dma_tx = aq->tx_chan;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1295  	init_completion(&aq->dma_completion);
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1296  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1297  	dev_info(&aq->pdev->dev, "Using %s (tx) and %s (rx) for DMA transfers\n",
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1298  		 dma_chan_name(aq->tx_chan), dma_chan_name(aq->rx_chan));
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1299  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1300  	return 0;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1301  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1302  release_rx_chan:
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1303  	dma_release_channel(aq->rx_chan);
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1304  	aq->rx_chan = NULL;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1305  	aq->tx_chan = NULL;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1306  	return ret;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1307  }
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
