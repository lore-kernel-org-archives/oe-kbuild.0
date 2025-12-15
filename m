Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB695328244
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 23:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765840398; cv=none; b=c2e/QLAggKQ3DAcv4fnP/G4bDng+nN4GQtVV5ucidZ9edxYbouF0ZoJqtdtOq7RNgiKi6IKyowUS1weCXbAAhRrMEDFq3AeGpS46Zv2JmoHxWLm/1SOgSiDa/m8nHNCZn3uYgKs2VM3V0Carwv+9DxklaOqODyHsM2V/mncNnb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765840398; c=relaxed/simple;
	bh=4DHbFipToeIA7Njms2cLTXWnGUpcC2BbalOcvrydUwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iprougzSwRY4GRppKhyHP0Cp7tKocfkXlvfGuKBt2raaJGhCE0c9YwQC2Hi8+FgaPVXTLRP9VnhcQn03OBwjlfVJz7V2TmhzZxPftlMF1/aqMecRdcoLzO6NNSzNSUSqz/sFkm0pfIurB4LVbm7Nluv/vmKGHQXgV9SCKBtU3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6H+mYRi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6H+mYRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765840397; x=1797376397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4DHbFipToeIA7Njms2cLTXWnGUpcC2BbalOcvrydUwo=;
  b=G6H+mYRimImoRXLJgMZ4mNQBqclGJ9ioJvJFGGG6hKBBTDT/7GJJjJw/
   F3r6czxxCzFFEkmNgAiewkbMu/kw6Bmc3Nhx72wJh4+AmEGLE2+squpic
   Xc66LLNLXE6uzSkeTWyPRlxvmUED/SptkVi/XsGoGJEgPRHIf+if9jpMw
   gV1/cvNcqg5MhgkfsW655XGop7eBDmjXD1CqEKDXI46Kfte69WaHbA+m6
   cMTUYj9JcQNqnhlWzwX10Yj65mdGcOKtReORAw7OCsBtPHOmp4+SY3sD5
   NANaLkmdtj0oFbagoq3itzH54YWHx0Ppqyj4+JSUuPWG3S1+4MIz46NFo
   Q==;
X-CSE-ConnectionGUID: jb0t+LmtRO+TwyGjfF66yg==
X-CSE-MsgGUID: GOon2jEDRtOjyyfsH38DpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78872311"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78872311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 15:13:16 -0800
X-CSE-ConnectionGUID: WG9xN6BXTQ+EUfkbOinGBQ==
X-CSE-MsgGUID: 5oqzWgWeRkiwEX8EfCSiLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197604159"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 15:13:16 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVHka-000000000uR-0O72;
	Mon, 15 Dec 2025 23:13:09 +0000
Date: Tue, 16 Dec 2025 07:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/imu/smi330/smi330_core.c:413 smi330_set_sensor_config()
 error: uninitialized symbol 'reg_val'.
Message-ID: <202512160738.36BjaLYu-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jianping Shen <Jianping.Shen@de.bosch.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 6f3d8de8886dae587467e1a2600d3bff4ad23e30 iio: imu: smi330: Add driver
date:   5 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20251214 (https://download.01.org/0day-ci/archive/20251216/202512160738.36BjaLYu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160738.36BjaLYu-lkp@intel.com/

smatch warnings:
drivers/iio/imu/smi330/smi330_core.c:413 smi330_set_sensor_config() error: uninitialized symbol 'reg_val'.

vim +/reg_val +413 drivers/iio/imu/smi330/smi330_core.c

6f3d8de8886dae Jianping Shen 2025-10-09  384  
6f3d8de8886dae Jianping Shen 2025-10-09  385  static int smi330_set_sensor_config(struct smi330_data *data,
6f3d8de8886dae Jianping Shen 2025-10-09  386  				    enum smi330_sensor sensor,
6f3d8de8886dae Jianping Shen 2025-10-09  387  				    enum smi330_sensor_conf_select config,
6f3d8de8886dae Jianping Shen 2025-10-09  388  				    int value)
6f3d8de8886dae Jianping Shen 2025-10-09  389  {
6f3d8de8886dae Jianping Shen 2025-10-09  390  	int ret, i, reg, reg_val, error;
6f3d8de8886dae Jianping Shen 2025-10-09  391  	const struct smi330_attributes *attr;
6f3d8de8886dae Jianping Shen 2025-10-09  392  
6f3d8de8886dae Jianping Shen 2025-10-09  393  	ret = smi330_get_attributes(config, sensor, &attr);
6f3d8de8886dae Jianping Shen 2025-10-09  394  	if (ret)
6f3d8de8886dae Jianping Shen 2025-10-09  395  		return ret;
6f3d8de8886dae Jianping Shen 2025-10-09  396  
6f3d8de8886dae Jianping Shen 2025-10-09  397  	for (i = 0; i < attr->len; i++) {
6f3d8de8886dae Jianping Shen 2025-10-09  398  		if (attr->vals[i] == value) {
6f3d8de8886dae Jianping Shen 2025-10-09  399  			if (attr->type == IIO_VAL_INT)
6f3d8de8886dae Jianping Shen 2025-10-09  400  				reg_val = attr->reg_vals[i];
6f3d8de8886dae Jianping Shen 2025-10-09  401  			else
6f3d8de8886dae Jianping Shen 2025-10-09  402  				reg_val = attr->reg_vals[i / 2];
6f3d8de8886dae Jianping Shen 2025-10-09  403  			break;
6f3d8de8886dae Jianping Shen 2025-10-09  404  		}
6f3d8de8886dae Jianping Shen 2025-10-09  405  	}
6f3d8de8886dae Jianping Shen 2025-10-09  406  	if (i == attr->len)
6f3d8de8886dae Jianping Shen 2025-10-09  407  		return -EINVAL;
6f3d8de8886dae Jianping Shen 2025-10-09  408  
6f3d8de8886dae Jianping Shen 2025-10-09  409  	ret = smi330_get_config_reg(sensor, &reg);
6f3d8de8886dae Jianping Shen 2025-10-09  410  	if (ret)
6f3d8de8886dae Jianping Shen 2025-10-09  411  		return ret;
6f3d8de8886dae Jianping Shen 2025-10-09  412  
6f3d8de8886dae Jianping Shen 2025-10-09 @413  	reg_val = smi330_field_prep(attr->mask, reg_val);
6f3d8de8886dae Jianping Shen 2025-10-09  414  	ret = regmap_update_bits(data->regmap, reg, attr->mask, reg_val);
6f3d8de8886dae Jianping Shen 2025-10-09  415  	if (ret)
6f3d8de8886dae Jianping Shen 2025-10-09  416  		return ret;
6f3d8de8886dae Jianping Shen 2025-10-09  417  
6f3d8de8886dae Jianping Shen 2025-10-09  418  	ret = regmap_read(data->regmap, SMI330_ERR_REG, &error);
6f3d8de8886dae Jianping Shen 2025-10-09  419  	if (ret)
6f3d8de8886dae Jianping Shen 2025-10-09  420  		return ret;
6f3d8de8886dae Jianping Shen 2025-10-09  421  
6f3d8de8886dae Jianping Shen 2025-10-09  422  	if (FIELD_GET(SMI330_ERR_ACC_CONF_MASK, error) ||
6f3d8de8886dae Jianping Shen 2025-10-09  423  	    FIELD_GET(SMI330_ERR_GYR_CONF_MASK, error))
6f3d8de8886dae Jianping Shen 2025-10-09  424  		return -EIO;
6f3d8de8886dae Jianping Shen 2025-10-09  425  
6f3d8de8886dae Jianping Shen 2025-10-09  426  	return 0;
6f3d8de8886dae Jianping Shen 2025-10-09  427  }
6f3d8de8886dae Jianping Shen 2025-10-09  428  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
