Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2824ECA
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680769546; x=1712305546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GsdEfo63ZzmByhsBEQIeh+TAuDF0wvHK1a7o5Phaw00=;
  b=J68gsbfoN04NmWewYbuL4OJmFjZl6rxTIe1Sr0hWMPDBpb24HSW1DHUk
   dBdgawpFvfDWJLfdigtEvXZlSbnKWM0OP3lWcV+Uh8p3nkLnfk6odZlW0
   LChmtCPEORQJe0F6WDk8OSaodDpocsF+pjZRO3loUUOmnJWi0z48Yo8Pk
   qOTjhZehfjkcWeUnYWuHqMEMj9p3RK3TtBdbjUAkO7I5GBVtOhmfO/bbV
   UVbuhDBRV9ClSCrjS2ztFz0jYSOhHMp8AikIeFhH0miQI0Lc0G60+TvFS
   l37jYVzFGko8FNnS2Y2F02OnkellmTB5WFsgFyxyL4tMjIayFiFbV+t2d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344413668"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344413668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 01:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="637186995"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="637186995"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Apr 2023 01:25:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkKwB-000RDI-37;
	Thu, 06 Apr 2023 08:25:43 +0000
Date: Thu, 6 Apr 2023 16:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ambarus:s25hx02gt-v3 27/31] drivers/mtd/spi-nor/sfdp.c:1310
 spi_nor_parse_sccr_mc() warn: impossible condition '(params->n_dice > 255)
 => (0-255 > 255)'
Message-ID: <202304061615.oiFHKH9Y-lkp@intel.com>
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
TO: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>

tree:   https://github.com/ambarus/linux-0day s25hx02gt-v3
head:   6b55d2284b55c6de88e5722bb756fad85487d3db
commit: 89b7eb9508b28a48c4d0a8b1ef46983202a0d360 [27/31] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
:::::: branch date: 23 hours ago
:::::: commit date: 26 hours ago
config: arm-randconfig-m041-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061615.oiFHKH9Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304061615.oiFHKH9Y-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/sfdp.c:1310 spi_nor_parse_sccr_mc() warn: impossible condition '(params->n_dice > 255) => (0-255 > 255)'

vim +1310 drivers/mtd/spi-nor/sfdp.c

89b7eb9508b28a Takahiro Kuwano 2023-02-08  1273  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1274  /**
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1275   * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1276   *                           Register Map Offsets for Multi-Chip SPI Memory
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1277   *                           Devices.
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1278   * @nor:		pointer to a 'struct spi_nor'
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1279   * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1280   *			the SCCR Map offsets table length and version.
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1281   *
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1282   * Return: 0 on success, -errno otherwise.
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1283   */
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1284  static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1285  				 const struct sfdp_parameter_header *sccr_mc_header)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1286  {
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1287  	struct spi_nor_flash_parameter *params = nor->params;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1288  	u32 *dwords, addr;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1289  	u8 i, n_dice;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1290  	size_t len;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1291  	int ret;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1292  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1293  	len = sccr_mc_header->length * sizeof(*dwords);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1294  	dwords = kmalloc(len, GFP_KERNEL);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1295  	if (!dwords)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1296  		return -ENOMEM;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1297  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1298  	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1299  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1300  	if (ret)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1301  		goto out;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1302  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1303  	le32_to_cpu_array(dwords, sccr_mc_header->length);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1304  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1305  	/*
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1306  	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1307  	 * additional die. Hence, length = 2 * (number of additional dice).
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1308  	 */
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1309  	n_dice = 1 + sccr_mc_header->length / 2;
89b7eb9508b28a Takahiro Kuwano 2023-02-08 @1310  	if (params->n_dice > SCCR_MC_MAX_DICE) {
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1311  		dev_dbg(nor->dev, "Improbable number of dice defined in SCCR MC table, use one die.\n");
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1312  		ret = -EINVAL;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1313  		goto out;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1314  	}
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1315  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1316  	/* Address offset for volatile registers of additional dice */
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1317  	params->vreg_offset =
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1318  			devm_krealloc(nor->dev, params->vreg_offset,
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1319  				      n_dice * sizeof(*dwords),
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1320  				      GFP_KERNEL);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1321  	if (!params->vreg_offset) {
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1322  		ret = -ENOMEM;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1323  		goto out;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1324  	}
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1325  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1326  	for (i = 1; i < n_dice; i++)
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1327  		params->vreg_offset[i] = dwords[SFDP_DWORD(i) * 2];
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1328  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1329  	params->n_dice = n_dice;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1330  
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1331  out:
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1332  	kfree(dwords);
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1333  	return ret;
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1334  }
89b7eb9508b28a Takahiro Kuwano 2023-02-08  1335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
