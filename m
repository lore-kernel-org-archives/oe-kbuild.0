Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF14258CF0
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332012; cv=none; b=KFX2RKk7XFvX8M8vQzsxcPJF60BKQP0ZfSFTcWVsD8VYJ5f086GTZlB4zaoTUCE1rVcfbLiEHGo/Sqj8UPFV82aLZXNq5oMJJchFmevkYOeMsovc6n1NtO0FCjcT+KbLFamFJgjY98Vra5IOpKLDsPfukNLJpjDAMnKELuO7VfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332012; c=relaxed/simple;
	bh=LMdDbik+aE0PAIU2iPxLSunB1PK0SKo3m4hzlGIDCBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsMDNhtI2Z400c8CK6yI6rYk/y//lqyZRdlrKKzkfEEQW7RU6xD9z7P8zoeFZbDRkNWdkmiUQQPvs4nu4UmN02aofzmhSgFOPLk4f5D8M/U5+sy7duEPSwugAlic2JAlkT2HkeCfOj0qvnClFB777rYVvsFljjopVoT+AgGF310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McxjZ7IJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McxjZ7IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747332009; x=1778868009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMdDbik+aE0PAIU2iPxLSunB1PK0SKo3m4hzlGIDCBI=;
  b=McxjZ7IJleFNMs29o7kSK7JixZNkMh1JXb0/97D4lVu8jaXgfcW1CQ+q
   b1kRFdgPqIVlKG++KeQ79t4gSYlYcpbsLFC9i8fLkl8LUWcpzH24cgJ0P
   Y4aCY24I5EmabUwS4CF8Y1Y4+reiasiAM8mMCAbltna0TlHpnHqXxzHQU
   p/oFm4FNaoQvHFOdnJUU793EtL/fKkTgTT3CXxRFG254Lu2LH/zxInKzu
   ZCc5W1sdWzVZwD9Nr0mhCHGcMX/ObzaFJ4yiFlqJlFeT5Rk8w6StHKZ0P
   ihoGnk5oAH2KycMXs1OrZSmdJZnmuHOJUR1VPOaHwgyRdK2qxg33n48lZ
   Q==;
X-CSE-ConnectionGUID: lKkWtHaGRZ+EXFGoW3Tagg==
X-CSE-MsgGUID: 4w6HGUqCRgK8zgksSsxt2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60682183"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60682183"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 11:00:09 -0700
X-CSE-ConnectionGUID: bUBlaPOCQmOjOAMagTTvwA==
X-CSE-MsgGUID: 3EqzZAWEQGyKcdzXchpfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143569820"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 11:00:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFcsH-000Icx-34;
	Thu, 15 May 2025 18:00:05 +0000
Date: Fri, 16 May 2025 01:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: imu: smi330: Add driver
Message-ID: <202505160110.kvrYTbkG-lkp@intel.com>
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
In-Reply-To: <20250513150028.42775-3-Jianping.Shen@de.bosch.com>
References: <20250513150028.42775-3-Jianping.Shen@de.bosch.com>
TO: Jianping.Shen@de.bosch.com
TO: jic23@kernel.org
TO: lars@metafoo.de
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dima.fedrau@gmail.com
TO: marcelo.schmitt1@gmail.com
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Jianping.Shen@de.bosch.com
TO: Christian.Lorenz3@de.bosch.com
TO: Ulrike.Frauendorf@de.bosch.com
TO: Kai.Dolde@de.bosch.com

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianping-Shen-de-bosch-com/dt-bindings-iio-imu-smi330-Add-binding/20250513-230505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250513150028.42775-3-Jianping.Shen%40de.bosch.com
patch subject: [PATCH v2 2/2] iio: imu: smi330: Add driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r072-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160110.kvrYTbkG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160110.kvrYTbkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505160110.kvrYTbkG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

   WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>> ERROR: modpost: "__ffssi2" [drivers/iio/imu/smi330/smi330.ko] undefined!

smatch warnings:
drivers/iio/imu/smi330/smi330_core.c:267 smi330_set_sensor_config() error: uninitialized symbol 'reg_val'.

vim +/reg_val +267 drivers/iio/imu/smi330/smi330_core.c

fe4852d42413da Jianping Shen 2025-05-13  237  
fe4852d42413da Jianping Shen 2025-05-13  238  static int smi330_set_sensor_config(struct smi330_data *data,
fe4852d42413da Jianping Shen 2025-05-13  239  				    enum smi330_sensor sensor,
fe4852d42413da Jianping Shen 2025-05-13  240  				    enum smi330_sensor_conf_select config,
fe4852d42413da Jianping Shen 2025-05-13  241  				    int value)
fe4852d42413da Jianping Shen 2025-05-13  242  {
fe4852d42413da Jianping Shen 2025-05-13  243  	int ret, i, reg, reg_val, error;
fe4852d42413da Jianping Shen 2025-05-13  244  	const struct smi330_sysfs_attr *attr;
fe4852d42413da Jianping Shen 2025-05-13  245  
fe4852d42413da Jianping Shen 2025-05-13  246  	ret = smi330_get_sysfs_attr(config, sensor, &attr);
fe4852d42413da Jianping Shen 2025-05-13  247  	if (ret)
fe4852d42413da Jianping Shen 2025-05-13  248  		return ret;
fe4852d42413da Jianping Shen 2025-05-13  249  
fe4852d42413da Jianping Shen 2025-05-13  250  	for (i = 0; i < attr->len; i++) {
fe4852d42413da Jianping Shen 2025-05-13  251  		if (attr->vals[i] == value) {
fe4852d42413da Jianping Shen 2025-05-13  252  			if (attr->type == IIO_VAL_INT)
fe4852d42413da Jianping Shen 2025-05-13  253  				reg_val = attr->reg_vals[i];
fe4852d42413da Jianping Shen 2025-05-13  254  			else
fe4852d42413da Jianping Shen 2025-05-13  255  				reg_val = attr->reg_vals[i / 2];
fe4852d42413da Jianping Shen 2025-05-13  256  			break;
fe4852d42413da Jianping Shen 2025-05-13  257  		}
fe4852d42413da Jianping Shen 2025-05-13  258  	}
fe4852d42413da Jianping Shen 2025-05-13  259  	if (i == attr->len)
fe4852d42413da Jianping Shen 2025-05-13  260  		return -EINVAL;
fe4852d42413da Jianping Shen 2025-05-13  261  
fe4852d42413da Jianping Shen 2025-05-13  262  	ret = smi330_get_config_reg(sensor, &reg);
fe4852d42413da Jianping Shen 2025-05-13  263  	if (ret)
fe4852d42413da Jianping Shen 2025-05-13  264  		return ret;
fe4852d42413da Jianping Shen 2025-05-13  265  
fe4852d42413da Jianping Shen 2025-05-13  266  	/* FIELD_PREP is not possible with non-const mask */
fe4852d42413da Jianping Shen 2025-05-13 @267  	reg_val = ((reg_val << (__builtin_ffs(attr->mask) - 1)) & attr->mask);
fe4852d42413da Jianping Shen 2025-05-13  268  
fe4852d42413da Jianping Shen 2025-05-13  269  	ret = regmap_update_bits(data->regmap, reg, attr->mask, reg_val);
fe4852d42413da Jianping Shen 2025-05-13  270  	if (ret)
fe4852d42413da Jianping Shen 2025-05-13  271  		return ret;
fe4852d42413da Jianping Shen 2025-05-13  272  
fe4852d42413da Jianping Shen 2025-05-13  273  	ret = regmap_read(data->regmap, SMI330_ERR_REG, &error);
fe4852d42413da Jianping Shen 2025-05-13  274  	if (ret)
fe4852d42413da Jianping Shen 2025-05-13  275  		return ret;
fe4852d42413da Jianping Shen 2025-05-13  276  
fe4852d42413da Jianping Shen 2025-05-13  277  	if (FIELD_GET(SMI330_ERR_ACC_CONF_MASK, error) ||
fe4852d42413da Jianping Shen 2025-05-13  278  	    FIELD_GET(SMI330_ERR_GYR_CONF_MASK, error))
fe4852d42413da Jianping Shen 2025-05-13  279  		return -EIO;
fe4852d42413da Jianping Shen 2025-05-13  280  
fe4852d42413da Jianping Shen 2025-05-13  281  	return 0;
fe4852d42413da Jianping Shen 2025-05-13  282  }
fe4852d42413da Jianping Shen 2025-05-13  283  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
