Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877B379C43
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827323; cv=none; b=Q/hoS70CGj54OgXfSKoZndXjQUP5LJguijZkKNgH/up1f9vYkMgjq1LpIyqhii6eHMcby5dsZeciUpK0FRqbmRC7ZkCU4Tbnu+uJHL5VnHJXHeWrz5m5LsbZI6HEeUP3Uq4iishGv1pA1zwnxAf5xPyO4pUvEs7DJu8Kf/lMqpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827323; c=relaxed/simple;
	bh=vZYSA9rhJgkg5Rmh43IHsizJq6XP24aj0ZXUOYNJQb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a0j0ZH4zkaWCRDivwx42gmcMzCHE8CsljDH1/5WNNzgqDD6ndnFDUPo59lanZm+qAvI4V6yZ9c9RYMDnS1AtSLAaj2qhA5IQmVZa2zJrdIEJIggKYXxC/gonI2ubVqUAkgEYXuvm7r3UsHYSiZhhUNRYWjeHmShWEJhiv/hjTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwoiCVUH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwoiCVUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784827321; x=1816363321;
  h=date:from:to:cc:subject:message-id;
  bh=vZYSA9rhJgkg5Rmh43IHsizJq6XP24aj0ZXUOYNJQb8=;
  b=FwoiCVUHOgfeiRhYOXlQqrgYYwGbsDNMLxZAC9YBPQAnS8oPxUDG4uoX
   /E6Y9UPU7s5CrAue6OEbV8wXmQHrNknYlqOIPij3pX8zyxSr4qTYbP4Jp
   4sgx3Gy5GuqP1AalByVcWpaSHezB9vT8/ASHmvDA55VM8WBTshV8t77bz
   sncs5BV559BkvXv8E0yaJf8HtqEQEzfwG4uAHeQfBfUtOD15GQGaCP26q
   1Wy8JACU+RR3WjWrtfFvecnnodUU2ZB0MOKsm9gdA8fsGWXT5DK4gyR1Y
   ZhSsyek9OvpN6HaOQH073HNRq+tL+CHAOtYaLHmmXlIvcYorliMR69D3v
   A==;
X-CSE-ConnectionGUID: ycYaSl/wRw+73PDyopKUXw==
X-CSE-MsgGUID: B5a3wx0kT/KLHITeT0s6hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96080643"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96080643"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 10:21:29 -0700
X-CSE-ConnectionGUID: H2XY6OoNTDKhrqD7MIQTOw==
X-CSE-MsgGUID: etHTiduvSiKJKFewvH+d3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="260417035"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2026 10:21:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmx6r-00000000Zwg-4B5Q;
	Thu, 23 Jul 2026 17:21:25 +0000
Date: Fri, 24 Jul 2026 01:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202607240142.F1obpna5-lkp@intel.com>
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
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: ae332ec0009d762982540635411caefeafa92a5b thermal/drivers/rockchip: Support reading trim values from OTP
date:   1 year ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year ago
config: hexagon-randconfig-r132-20260723 (https://download.01.org/0day-ci/archive/20260724/202607240142.F1obpna5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607240142.F1obpna5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ae332ec0009d ("thermal/drivers/rockchip: Support reading trim values from OTP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607240142.F1obpna5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/thermal/rockchip_thermal.c:1514:16: sparse: signed value source

vim +1509 drivers/thermal/rockchip_thermal.c

cbac8f63943773 Caesar Wang        2014-11-24  1472  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1473  /**
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1474   * rockchip_get_efuse_value - read an OTP cell from a device node
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1475   * @np: pointer to the device node with the nvmem-cells property
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1476   * @cell_name: name of cell that should be read
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1477   * @value: pointer to where the read value will be placed
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1478   *
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1479   * Return: Negative errno on failure, during which *value will not be touched,
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1480   * or 0 on success.
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1481   */
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1482  static int rockchip_get_efuse_value(struct device_node *np, const char *cell_name,
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1483  				    int *value)
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1484  {
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1485  	struct nvmem_cell *cell;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1486  	int ret = 0;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1487  	size_t len;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1488  	u8 *buf;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1489  	int i;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1490  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1491  	cell = of_nvmem_cell_get(np, cell_name);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1492  	if (IS_ERR(cell))
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1493  		return PTR_ERR(cell);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1494  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1495  	buf = nvmem_cell_read(cell, &len);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1496  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1497  	nvmem_cell_put(cell);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1498  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1499  	if (IS_ERR(buf))
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1500  		return PTR_ERR(buf);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1501  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1502  	if (len > sizeof(*value)) {
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1503  		ret = -ERANGE;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1504  		goto exit;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1505  	}
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1506  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1507  	/* Copy with implicit endian conversion */
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1508  	*value = 0;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10 @1509  	for (i = 0; i < len; i++)
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1510  		*value |= (int) buf[i] << (8 * i);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1511  
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1512  exit:
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1513  	kfree(buf);
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1514  	return ret;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1515  }
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1516  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
