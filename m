Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6A557C8D
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721375475; cv=none; b=HDnAhBXxDTcg51r0PwhmH5xzmyiQK7g7iotIELIUstflIZEK1rKpcOkQZcHvrLWDjgXvQAslx0773GVmps843zK5Avl5K/9FWSpVu2gyvt/NkCGTzlI27X4QW97iGj1J/5JjQgti42wHqqsnJSRvRu0ElYJmQYwRA7pRTO+2gv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721375475; c=relaxed/simple;
	bh=jUG8KHueFJVezPfwggJHhDFZEspcf9hgjhil6IanCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RKz9lAN6PI/qs55UUtHIK3ZzK2Xt8Teb0/K1Q16T+i+pQaq8MKiolC9WR1D8jO0IH6jqdZh0NOi5UeEfmYrAEhpVHUqQA5ty8OM6kE63fFM0eqbNJJie8apRsYhwn6SyLk2/JUs2nqEqcgIJ+jKKYONz4w7mnH0W60+ze1Octxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKNMMBTf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKNMMBTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721375473; x=1752911473;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jUG8KHueFJVezPfwggJHhDFZEspcf9hgjhil6IanCGE=;
  b=HKNMMBTf2j/FJOydtijEJWpq5GqOiuqNUyVphP3hLNkq3YAIvTVOO2X7
   MzZUrf2oVI8V+vVXbLryjpjErVaUaFzLO/T5NZ5d/htz3IAMCmLVQVPDa
   TSfixTyVfniLuHpFGp3W9EXXqY7YKiWX+0ykwrLTLZqQbrIK5dllhN1Uq
   +fAGDLGiJ5UAra0wiK4rDW8Kh30tT663IHkurGhLHIBkGAFc98nk4vzUB
   fL4S676phMVg4kB/KOQSHnbB+GnEBiBZyZlApnmdvz8RYUYpdTZbkQXTO
   HotyMgsRtR8tUENSsvdIbDjHUckxd/pYt5XALAbnRfjMsPmr1AQmohYsn
   g==;
X-CSE-ConnectionGUID: MEiZUJepQ0Wz9uIo8SlKHA==
X-CSE-MsgGUID: dbB1NPJKRhCI3Xu70AsLzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22784292"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="22784292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 00:51:11 -0700
X-CSE-ConnectionGUID: 9lCy/T9LQbW+ABZ67keGGQ==
X-CSE-MsgGUID: WfLB0FdmT+CV/pKv+DSB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="51057784"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jul 2024 00:51:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUiOQ-000hy6-2q;
	Fri, 19 Jul 2024 07:51:06 +0000
Date: Fri, 19 Jul 2024 15:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/2] hwmon: add GPD devices sensor driver
Message-ID: <202407191502.ZETraOLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/gpd-fan.c:545:17: sparse: sparse: not in switch scope"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240718-gpd_fan-v4-1-116e5431a9fe@gmail.com>
References: <20240718-gpd_fan-v4-1-116e5431a9fe@gmail.com>
TO: Cryolitia PukNgae via B4 Relay <devnull+Cryolitia.gmail.com@kernel.org>
TO: Jean Delvare <jdelvare@suse.com>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Cryolitia PukNgae <Cryolitia@gmail.com>
TO: Jonathan Corbet <corbet@lwn.net>
CC: linux-kernel@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Celeste Liu <CoelacanthusHex@gmail.com>
CC: Yao Zi <ziyao@disroot.org>
CC: "Marcin Strągowski" <marcin@stragowski.com>

Hi Cryolitia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d67978318827d06f1c0fa4c31343a279e9df6fde]

url:    https://github.com/intel-lab-lkp/linux/commits/Cryolitia-PukNgae-via-B4-Relay/hwmon-add-GPD-devices-sensor-driver/20240718-104420
base:   d67978318827d06f1c0fa4c31343a279e9df6fde
patch link:    https://lore.kernel.org/r/20240718-gpd_fan-v4-1-116e5431a9fe%40gmail.com
patch subject: [PATCH v4 1/2] hwmon: add GPD devices sensor driver
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-061-20240719 (https://download.01.org/0day-ci/archive/20240719/202407191502.ZETraOLX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407191502.ZETraOLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407191502.ZETraOLX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/gpd-fan.c:496:25: sparse: sparse: typename in expression
   drivers/hwmon/gpd-fan.c:496:29: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:496:29: sparse: sparse: got ret
   drivers/hwmon/gpd-fan.c:513:25: sparse: sparse: typename in expression
   drivers/hwmon/gpd-fan.c:513:29: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:513:29: sparse: sparse: got ret
   drivers/hwmon/gpd-fan.c:541:25: sparse: sparse: typename in expression
   drivers/hwmon/gpd-fan.c:541:28: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:541:28: sparse: sparse: got var
   drivers/hwmon/gpd-fan.c:541:34: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:541:34: sparse: sparse: got )
   drivers/hwmon/gpd-fan.c:541:34: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:541:34: sparse: sparse: got )
>> drivers/hwmon/gpd-fan.c:545:17: sparse: sparse: not in switch scope
   drivers/hwmon/gpd-fan.c:548:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/hwmon/gpd-fan.c:548:9: sparse: sparse: got }
   drivers/hwmon/gpd-fan.c:550:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/hwmon/gpd-fan.c:550:1: sparse: sparse: got }
   drivers/hwmon/gpd-fan.c:496:25: sparse: sparse: undefined identifier 's32'
   drivers/hwmon/gpd-fan.c:498:29: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:499:40: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:501:32: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:513:25: sparse: sparse: undefined identifier 's16'
   drivers/hwmon/gpd-fan.c:515:29: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:516:40: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:518:32: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:541:25: sparse: sparse: undefined identifier 'u8'
   drivers/hwmon/gpd-fan.c:541:34: sparse: sparse: undefined identifier '__UNIQUE_ID___val306'
   drivers/hwmon/gpd-fan.c:543:43: sparse: sparse: undefined identifier 'var'
   drivers/hwmon/gpd-fan.c:544:61: sparse: sparse: undefined identifier 'var'
   drivers/hwmon/gpd-fan.c:564:20: sparse: sparse: undefined identifier 'gpd_fan_ops'

vim +545 drivers/hwmon/gpd-fan.c

4f5f74416861bb Cryolitia PukNgae 2024-07-18  526  
4f5f74416861bb Cryolitia PukNgae 2024-07-18  527  static int gpd_fan_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
4f5f74416861bb Cryolitia PukNgae 2024-07-18  528  			       u32 attr, __always_unused int channel, long val)
4f5f74416861bb Cryolitia PukNgae 2024-07-18  529  {
4f5f74416861bb Cryolitia PukNgae 2024-07-18  530  	struct gpd_driver_priv *data = dev_get_drvdata(dev);
4f5f74416861bb Cryolitia PukNgae 2024-07-18  531  
4f5f74416861bb Cryolitia PukNgae 2024-07-18  532  	if (type == hwmon_pwm) {
4f5f74416861bb Cryolitia PukNgae 2024-07-18  533  		switch (attr) {
4f5f74416861bb Cryolitia PukNgae 2024-07-18  534  		case hwmon_pwm_enable:
4f5f74416861bb Cryolitia PukNgae 2024-07-18  535  			if (!in_range(val, 0, 3))
4f5f74416861bb Cryolitia PukNgae 2024-07-18  536  				return -EINVAL;
4f5f74416861bb Cryolitia PukNgae 2024-07-18  537  			data->pwm_enable = val;
4f5f74416861bb Cryolitia PukNgae 2024-07-18  538  			return data->quirk->set_pwm_enable(data,
4f5f74416861bb Cryolitia PukNgae 2024-07-18  539  							   data->pwm_enable);
4f5f74416861bb Cryolitia PukNgae 2024-07-18  540  		case hwmon_pwm_input:
4f5f74416861bb Cryolitia PukNgae 2024-07-18  541  			u8 var = clamp_val(val, 0, 255);
4f5f74416861bb Cryolitia PukNgae 2024-07-18  542  
4f5f74416861bb Cryolitia PukNgae 2024-07-18  543  			data->pwm_value = var;
4f5f74416861bb Cryolitia PukNgae 2024-07-18  544  			return data->quirk->write_pwm(data, var);
4f5f74416861bb Cryolitia PukNgae 2024-07-18 @545  		default:
4f5f74416861bb Cryolitia PukNgae 2024-07-18  546  			return -EOPNOTSUPP;
4f5f74416861bb Cryolitia PukNgae 2024-07-18  547  		}
4f5f74416861bb Cryolitia PukNgae 2024-07-18  548  	}
4f5f74416861bb Cryolitia PukNgae 2024-07-18  549  	return -EOPNOTSUPP;
4f5f74416861bb Cryolitia PukNgae 2024-07-18  550  }
4f5f74416861bb Cryolitia PukNgae 2024-07-18  551  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
