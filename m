Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B30524D1
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761005516; cv=none; b=uNC0MxZ9XeEsmfPg83MYM0KuttvxMbY4Fk0b9IgH1nf/TI5IA91s02Qtt8V7aVD/nVPUd76LYPSvlSBtN7YYpBNzYz2p4FTWXyw3DE5tn5Fq082pvmG+k5JFiqj2wI5tc2sbWQ4a5unEAQX9qhkXOKLe/O8LT2Gv2hPBkrq9Dks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761005516; c=relaxed/simple;
	bh=eoaiOq7otX3rn5LX3ujaeLXGDNswZguoUkcaddtbxVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJlB6sGSEiq0gmgNll7gBEl/kIEHp30HYcWRAI2XN4L5ldwug2YqHGlIDF7UMtk1KuOVgoLnR2lCjKOf+QxvE1Se5SU9Djgqvg45ITS8u22l2P8pTq6PIvuVlk0Ygc4dc+UIBFK55RyB8xFcG5aM2acuAybPOXM/YKnAu4LSYAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BieT3A7r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BieT3A7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761005515; x=1792541515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoaiOq7otX3rn5LX3ujaeLXGDNswZguoUkcaddtbxVM=;
  b=BieT3A7rAWKmx/lzuuPVmXfqowjUoxUJSvnRGmVeMUi/2s/5NyT7xgmc
   pX2d3SwxdH+sCptD9KxrYEHwFlAazwIh7sECQA6QIzKuF5TZi3uj6l/Xg
   j78/RxOm/yCkY4qEdWoLtUxssmOUv2Kz7uAuiY2OGojp15iAyRWQkuO/C
   uEIaHqgXP1qCPeDTpDuvezywtvuoroCenYYbqWzlBObmUMi792RPhkA+P
   TSIM3VeRyacHhyVxfmY/hbn2LQ9a7batfv0qBhv6pN6k5EQoNASsXcNNE
   3s6rlDO8UYSrhNcz7ZGb7reriqgVENo73elNot7j1WKhCsDkzwUA/C+1J
   g==;
X-CSE-ConnectionGUID: JVm/uqfMRUqDcq6NHD8B0w==
X-CSE-MsgGUID: yVVXCLw0QYShv5fPCz0Eig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62161056"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62161056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:11:54 -0700
X-CSE-ConnectionGUID: nTaHJ1tDT4OsMo9q34QWaA==
X-CSE-MsgGUID: V5c/ULMySran0TVZfq05Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="220616119"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2025 17:11:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAzyb-000AH1-1D;
	Tue, 21 Oct 2025 00:11:47 +0000
Date: Tue, 21 Oct 2025 08:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202510210808.FqJMUhmR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: ae332ec0009d762982540635411caefeafa92a5b thermal/drivers/rockchip: Support reading trim values from OTP
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-r122-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210808.FqJMUhmR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210808.FqJMUhmR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210808.FqJMUhmR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/thermal/rockchip_thermal.c:1509:25: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/thermal/rockchip_thermal.c:1514:16: sparse: signed value source

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
ae332ec0009d76 Nicolas Frattaroli 2025-06-10 @1514  	return ret;
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1515  }
ae332ec0009d76 Nicolas Frattaroli 2025-06-10  1516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
