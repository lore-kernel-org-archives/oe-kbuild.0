Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FE23C2B95
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 22:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709759; cv=none; b=Qq3aKmCw7MEOa04rpu2iyZCtp9liClCAiWR2U61t2wNASbAGQDmk3pkSwbpB8A1EJBSk3OILKAkjY/1FA7fisRDQ1hOUNAqiNafsmrNk3MXvtnuXqEGJ3VasT5XNPM5WqBGCLpRX91BSrueFIQfgD8waYRxFZQvNSeN8Xsa4spw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709759; c=relaxed/simple;
	bh=NnDPBncxYTgx+iIbMrl/nXMj7fpKHfgy1Bd4vcP/2Ss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aaAKNGlI3V/fH5ZG+AX6J77dy4N+lfY13KeACr/2nMoyg02RwyWkzS1EyH1jxzPidk4+Tmmp/EV4YnJc6UtZo6x38GRwEP9YCa5qU0GoXbfVvjIdFU7pDJuUooy8p1TIDu5PGcYXESgbJWDjjxQmq4CybTTihLY8fDzi1YRAErw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7KJNq5C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7KJNq5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778709758; x=1810245758;
  h=date:from:to:cc:subject:message-id;
  bh=NnDPBncxYTgx+iIbMrl/nXMj7fpKHfgy1Bd4vcP/2Ss=;
  b=U7KJNq5CrrzZNxtkPoRH0tQ2U9si/dR73GnC2NZeagvWeTN0vWG59mF1
   EUZrVH5ssUIkn/lt0VfBe8l5ePw/gdjrf/dSqTZQ8wy7TLlTV2x7gH4bm
   QURsC0fTDybj0HvR5vgcKabLxDe2iKTSK4q5S4Lhk7BFF3/q55uxuZ0Bf
   3rgVNTDJK45eUS58o0FhyDyQIVwKOiB8i0O7f6RO/VfU3/8rPmjUXYpCy
   GAkukNrIw0jIZ98fd5uIRMlzbv88HUV0mATL2CLeqkHqhz7wUnL5GwolN
   437mabLO7Aege60nS6OuiVKD5+MgQSpi3Fq0f9uaKRa0KSnCHmwnRUZhf
   g==;
X-CSE-ConnectionGUID: og38ga/XT7+mHiaV2al/Mg==
X-CSE-MsgGUID: bykGWQRdQcq9Aq60vUy+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89954452"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="89954452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 15:02:38 -0700
X-CSE-ConnectionGUID: GcxKCKozTUmt5mRNCe7R1Q==
X-CSE-MsgGUID: zXm6zlZ7SY+d1Qij/FJdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242542811"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2026 15:02:36 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNHez-000000005CL-3sLc;
	Wed, 13 May 2026 22:02:33 +0000
Date: Thu, 14 May 2026 06:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202605140524.y3KmLKef-lkp@intel.com>
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
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: ae332ec0009d762982540635411caefeafa92a5b thermal/drivers/rockchip: Support reading trim values from OTP
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: sparc-randconfig-r134-20260513 (https://download.01.org/0day-ci/archive/20260514/202605140524.y3KmLKef-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140524.y3KmLKef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ae332ec0009d ("thermal/drivers/rockchip: Support reading trim values from OTP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140524.y3KmLKef-lkp@intel.com/

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
