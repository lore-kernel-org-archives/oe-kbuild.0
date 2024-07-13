Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227B87344A
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720870761; cv=none; b=bksDCgsKghqL1M2CxJpOVSZnhrIhsvO2ZKYNxezsSDWUbzGVmGjld8x+N4bjrU59sVcnNO3qs+sigO31eh+Qr5P4WmKVx5ZDBN4mZ/osqrQjadXdfREdz+dD+axx7TeVka9nS92KAaMWHGGAZI3oKwDxx6Sng6zDycY48Az6MG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720870761; c=relaxed/simple;
	bh=qoCaLakiGjOyAZJsrqbqbHtah3UQrHDYP3+ZG+7BQwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTSQOlrRLgz7I+R970oKeqLK8r1e94cmyptetSOiic8weeJPc3dcJ177ff9ueAzRd46TQ7rxF301zDmqECyXaWb6ImcCLIUtI0c5cCpgWa7Onoqrst6azmsD/2OiM7ytrnemgqOwinvgkNmxdfBah/dVAWMLVHfow4NBTad8u9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQLNIYZW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQLNIYZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720870759; x=1752406759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoCaLakiGjOyAZJsrqbqbHtah3UQrHDYP3+ZG+7BQwQ=;
  b=hQLNIYZWGo38z7yPONxG5nrb9Tow2BpQPp3cet+3RB6DC9aegJKjMPsn
   APnc86zC1hjkMh7tPI51KXj/+F3G0AhJHMpsFxInbHXncW5IKHE1oqK/0
   y9l+bZv6nSsZD5khWbbBXbF0U+0tijzCuBbXHP+R6H6HYRMGufiUWVrnh
   IJoLdkFW1SoBoz0ufKZhgu7wFAMEYEb/QbFaIfYi2gs15cyM2js3pmYSq
   4yiIyS1IhF4mFFgxnjA8Lk1Mx8A0KREnot/LCnOdbz9QIaVWe/Oo8gaI4
   utO9N9DWg3Xq0YTMHP9OckztTxI5GX3SW17UTJjF3DqqA3GBFrDktMSF4
   w==;
X-CSE-ConnectionGUID: OhqDReIzTMO9U7DolMGu0w==
X-CSE-MsgGUID: 1rbQ7qKISpiVN6dzyGsJIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28985500"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="28985500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 04:39:16 -0700
X-CSE-ConnectionGUID: roxDSZ6+Tqq/t2scGn8r8w==
X-CSE-MsgGUID: nqlNnem/SmSOBnYhB9//LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="86665986"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jul 2024 04:36:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSb31-000c1O-0C;
	Sat, 13 Jul 2024 11:36:15 +0000
Date: Sat, 13 Jul 2024 19:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [groeck-staging:hwmon-staging 111/143] drivers/hwmon/lm95234.c:223
 lm95234_temp_read() error: uninitialized symbol 'ret'.
Message-ID: <202407131905.rNPAD1Ac-lkp@intel.com>
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
CC: linux-hwmon@vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
head:   80e45111b670e9c913398f5ad54196a99a739497
commit: 85a6f963ad7f3657dff782c3e3ac40ab6c95f62c [111/143] hwmon: (lm9534) Convert to with_info hwmon API
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131905.rNPAD1Ac-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407131905.rNPAD1Ac-lkp@intel.com/

New smatch warnings:
drivers/hwmon/lm95234.c:223 lm95234_temp_read() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/hwmon/lm95234.c:231 lm95234_temp_read() error: uninitialized symbol 'ret'.

vim +/ret +223 drivers/hwmon/lm95234.c

e1eb49063b301f Guenter Roeck 2013-03-10  177  
85a6f963ad7f36 Guenter Roeck 2024-07-10  178  static int lm95234_temp_read(struct device *dev, u32 attr, int channel, long *val)
e1eb49063b301f Guenter Roeck 2013-03-10  179  {
9d86bd6ba3ba2f Guenter Roeck 2013-09-04  180  	struct lm95234_data *data = dev_get_drvdata(dev);
85a6f963ad7f36 Guenter Roeck 2024-07-10  181  	struct regmap *regmap = data->regmap;
85a6f963ad7f36 Guenter Roeck 2024-07-10  182  	u32 regval, mask;
efae967d04e36c Guenter Roeck 2024-07-07  183  	int ret;
e1eb49063b301f Guenter Roeck 2013-03-10  184  
85a6f963ad7f36 Guenter Roeck 2024-07-10  185  	switch (attr) {
85a6f963ad7f36 Guenter Roeck 2024-07-10  186  	case hwmon_temp_input:
85a6f963ad7f36 Guenter Roeck 2024-07-10  187  		return lm95234_read_temp(regmap, channel, val);
85a6f963ad7f36 Guenter Roeck 2024-07-10  188  	case hwmon_temp_max_alarm:
85a6f963ad7f36 Guenter Roeck 2024-07-10  189  		ret =  regmap_read(regmap, lm95234_alarm_reg(channel), &regval);
85a6f963ad7f36 Guenter Roeck 2024-07-10  190  		if (ret)
e1eb49063b301f Guenter Roeck 2013-03-10  191  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  192  		*val = !!(regval & BIT(channel));
85a6f963ad7f36 Guenter Roeck 2024-07-10  193  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  194  	case hwmon_temp_crit_alarm:
85a6f963ad7f36 Guenter Roeck 2024-07-10  195  		ret =  regmap_read(regmap, LM95234_REG_STS_TCRIT1, &regval);
efae967d04e36c Guenter Roeck 2024-07-07  196  		if (ret)
efae967d04e36c Guenter Roeck 2024-07-07  197  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  198  		*val = !!(regval & BIT(channel));
85a6f963ad7f36 Guenter Roeck 2024-07-10  199  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  200  	case hwmon_temp_crit_hyst:
85a6f963ad7f36 Guenter Roeck 2024-07-10  201  		return lm95234_hyst_get(data, LM95234_REG_TCRIT1(channel), val);
85a6f963ad7f36 Guenter Roeck 2024-07-10  202  	case hwmon_temp_type:
85a6f963ad7f36 Guenter Roeck 2024-07-10  203  		ret = regmap_read(regmap, LM95234_REG_REM_MODEL, &regval);
efae967d04e36c Guenter Roeck 2024-07-07  204  		if (ret)
85a6f963ad7f36 Guenter Roeck 2024-07-10  205  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  206  		*val = (regval & BIT(channel)) ? 1 : 2;
85a6f963ad7f36 Guenter Roeck 2024-07-10  207  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  208  	case hwmon_temp_offset:
85a6f963ad7f36 Guenter Roeck 2024-07-10  209  		ret = regmap_read(regmap, LM95234_REG_OFFSET(channel - 1), &regval);
efae967d04e36c Guenter Roeck 2024-07-07  210  		if (ret)
efae967d04e36c Guenter Roeck 2024-07-07  211  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  212  		*val = sign_extend32(regval, 7) * 500;
85a6f963ad7f36 Guenter Roeck 2024-07-10  213  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  214  	case hwmon_temp_fault:
85a6f963ad7f36 Guenter Roeck 2024-07-10  215  		ret = regmap_read(regmap, LM95234_REG_STS_FAULT, &regval);
efae967d04e36c Guenter Roeck 2024-07-07  216  		if (ret)
efae967d04e36c Guenter Roeck 2024-07-07  217  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  218  		mask = (BIT(0) | BIT(1)) << ((channel - 1) << 1);
85a6f963ad7f36 Guenter Roeck 2024-07-10  219  		*val = !!(regval & mask);
85a6f963ad7f36 Guenter Roeck 2024-07-10  220  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  221  	case hwmon_temp_max:
85a6f963ad7f36 Guenter Roeck 2024-07-10  222  		regmap_read(regmap, lm95234_crit_reg(channel), &regval);
85a6f963ad7f36 Guenter Roeck 2024-07-10 @223  		if (ret)
e1eb49063b301f Guenter Roeck 2013-03-10  224  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  225  		*val = regval * 1000;
85a6f963ad7f36 Guenter Roeck 2024-07-10  226  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  227  	case hwmon_temp_max_hyst:
85a6f963ad7f36 Guenter Roeck 2024-07-10  228  		return lm95234_hyst_get(data, lm95234_crit_reg(channel), val);
85a6f963ad7f36 Guenter Roeck 2024-07-10  229  	case hwmon_temp_crit:
85a6f963ad7f36 Guenter Roeck 2024-07-10  230  		regmap_read(regmap, LM95234_REG_TCRIT1(channel), &regval);
efae967d04e36c Guenter Roeck 2024-07-07  231  		if (ret)
efae967d04e36c Guenter Roeck 2024-07-07  232  			return ret;
85a6f963ad7f36 Guenter Roeck 2024-07-10  233  		*val = regval * 1000;
85a6f963ad7f36 Guenter Roeck 2024-07-10  234  		break;
85a6f963ad7f36 Guenter Roeck 2024-07-10  235  	default:
85a6f963ad7f36 Guenter Roeck 2024-07-10  236  		return -EOPNOTSUPP;
e1eb49063b301f Guenter Roeck 2013-03-10  237  	}
85a6f963ad7f36 Guenter Roeck 2024-07-10  238  	return 0;
e1eb49063b301f Guenter Roeck 2013-03-10  239  }
e1eb49063b301f Guenter Roeck 2013-03-10  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
