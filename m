Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DE3AE1B4
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781553303; cv=none; b=KZ2qKvlSHNmNIdZXYSTe+63Zb1ck7LTUK3orQeG2NKmjzCug3ctnPI088QGVP5pDkQCDwvh0d3T1v+QN+pYmMLqv4Nsyg683j78Lc13JcQVE26+UH+m0PiAMV9s7WGw0Ryum9gsacFWJsb/5LXcBMglu1wMUE9++tezv3RcaM3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781553303; c=relaxed/simple;
	bh=ieIK1K+J3jUDejNB6wNlW/0fdXIz+ShFhWDVLwjZwmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LU+2q97qySdjQLuGGaGxyLNuHR20CrkoSCE5ga7g/NIvGvOQmVUpoK305U797EQsdd609VU1JvTFlQUmNudxR5ziHDexqdS28A0Z5s5w6yxfL1uGf2/DYKNca0Gh5dAZbKOldCRf4Bhuoe8in4IxuUlbgYLSlYNBaRvk/bbLDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahptdsAs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahptdsAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781553302; x=1813089302;
  h=date:from:to:cc:subject:message-id;
  bh=ieIK1K+J3jUDejNB6wNlW/0fdXIz+ShFhWDVLwjZwmY=;
  b=ahptdsAsRd/a6RwXeP7TygMwuxVF+Jp47CYAuihLaeIuF9JVpl8qQ2aK
   IdPmgzPVwuNwwDTxFMZuZUPt9BMUbv05coV+M9ozSTCoo2F+dF6bJGIN9
   KRGsP1hMVbNKMUHGYDtj5s+M9Vu9GbCthlXewFU3D+EaTN7Y+Lzfuo0yL
   ZAzKdjuLOlkeZh+WpznJNrsJuVWqDj64lLf8Jxk/lTqUHtBpn3614AwAE
   a8xGPxU+H4CnwImrBww84dq2k6oyu0XMf+xeomoBr2I2iF8Epz9Wk6bnF
   0o3QSpvPF8z/mADr55D5UUrbHqxPp+wnMsinjKyNwOD657DH1kxqQnNq3
   g==;
X-CSE-ConnectionGUID: g51WtqUlSYqfM9vYDIrw+w==
X-CSE-MsgGUID: 6906YiM4SnW4iVumHGiVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86207377"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="86207377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 12:55:01 -0700
X-CSE-ConnectionGUID: J7nPo/sUSGSWP6IwOptl6A==
X-CSE-MsgGUID: uhwCgERDSzerCuS6P4dYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="252527438"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2026 12:55:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZDOa-00000000SJq-3uyR;
	Mon, 15 Jun 2026 19:54:56 +0000
Date: Tue, 16 Jun 2026 03:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202606160300.iVZmi5SV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: ae332ec0009d762982540635411caefeafa92a5b thermal/drivers/rockchip: Support reading trim values from OTP
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: csky-randconfig-r112-20260615 (https://download.01.org/0day-ci/archive/20260616/202606160300.iVZmi5SV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160300.iVZmi5SV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ae332ec0009d ("thermal/drivers/rockchip: Support reading trim values from OTP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606160300.iVZmi5SV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/thermal/rockchip_thermal.c:1514:16: sparse: signed value source

vim +1509 drivers/thermal/rockchip_thermal.c

cbac8f639437732 Caesar Wang        2014-11-24  1472  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1473  /**
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1474   * rockchip_get_efuse_value - read an OTP cell from a device node
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1475   * @np: pointer to the device node with the nvmem-cells property
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1476   * @cell_name: name of cell that should be read
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1477   * @value: pointer to where the read value will be placed
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1478   *
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1479   * Return: Negative errno on failure, during which *value will not be touched,
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1480   * or 0 on success.
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1481   */
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1482  static int rockchip_get_efuse_value(struct device_node *np, const char *cell_name,
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1483  				    int *value)
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1484  {
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1485  	struct nvmem_cell *cell;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1486  	int ret = 0;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1487  	size_t len;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1488  	u8 *buf;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1489  	int i;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1490  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1491  	cell = of_nvmem_cell_get(np, cell_name);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1492  	if (IS_ERR(cell))
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1493  		return PTR_ERR(cell);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1494  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1495  	buf = nvmem_cell_read(cell, &len);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1496  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1497  	nvmem_cell_put(cell);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1498  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1499  	if (IS_ERR(buf))
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1500  		return PTR_ERR(buf);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1501  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1502  	if (len > sizeof(*value)) {
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1503  		ret = -ERANGE;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1504  		goto exit;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1505  	}
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1506  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1507  	/* Copy with implicit endian conversion */
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1508  	*value = 0;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10 @1509  	for (i = 0; i < len; i++)
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1510  		*value |= (int) buf[i] << (8 * i);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1511  
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1512  exit:
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1513  	kfree(buf);
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1514  	return ret;
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1515  }
ae332ec0009d762 Nicolas Frattaroli 2025-06-10  1516  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
