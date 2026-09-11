Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C445C3191BA
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 03:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098052; cv=none; b=agnatqQe2198HcVlEhi/R3q2c65pIRj6VpFybljLDJ0L4esCPRgJFparpgaxzPplmDL/5iTx4ROLTvJYnu/Ws8vOCv08EBS+0uaYWqVc4lX4G3OD8DbCG+UDs5AeOV7txZV7i1KBQGMZ1q7spZLwj6u+7lWul/yKvTwaN4OcXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098052; c=relaxed/simple;
	bh=jDwHVQffgjMMxa0pm6wLZHjMlGebJ0g1GwfiHbI+lI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O7jG8YatQVB+d5TnVuOEloRfpQ3KH5BHMqbr/Zp6k0rMbHLhstky2Ou4nrpnGeQSCETint903rP2Y+4vW/wfVdre/CEp9hJ6YGXi8ec5+OluUZyOfU4hozFRnFjoB7ipVv/Zv93VUiQ7JwxFkmVxX5Jnxsnb4daGQEtfO+WFVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNvnTkfi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNvnTkfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789098051; x=1820634051;
  h=date:from:to:cc:subject:message-id;
  bh=jDwHVQffgjMMxa0pm6wLZHjMlGebJ0g1GwfiHbI+lI4=;
  b=jNvnTkfiqbUsC+5E2WA0nVDsD3W+uduJWnbiGBdKL2PW/dvBi8wDzymB
   N2YfEowv9Xgd1Ukh9Xhj+wmNZoqdVqzCiNktZvmkJa0Jm6csOoMOB23kM
   RNlhCdmF0I7y6f7wZNfKxnyNfkqeWTWJQ5wi8FJk9p7N18opDS2Tv36H8
   vWSmeUVjrf286FtqUcrbO6UqmfyshTMD58dpupUZ8rt0J/6Dhus2Gvdjg
   8EFicvmi81Xp+t3L8/NAqanftXGoXE6hjQEy0UzNMGy01BoC9731s44KV
   eDeQb0VhKxzf8BUSmsgWvHWpy/0r6xdmosk5E9vgroJRPj+zz2cm35sow
   g==;
X-CSE-ConnectionGUID: v0ovUS70RRSLsltyDC+7jA==
X-CSE-MsgGUID: O0UDCQ7WRdumJZKohGLrNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93249953"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93249953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 20:40:50 -0700
X-CSE-ConnectionGUID: bdO/BzV8QWiOHkJFmnx7Og==
X-CSE-MsgGUID: 6GdCP16xQHa3DpSs0x3qOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="275959134"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2026 20:40:50 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4s87-000000000xD-1NWa;
	Fri, 11 Sep 2026 03:40:47 +0000
Date: Fri, 11 Sep 2026 11:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/pmbus/tda38740.c:58:49: error: invalid
 application of 'sizeof' to incomplete type 'struct tda38740_data'
Message-ID: <202609111110.KRe8lrPe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Colin-Huang/dt-bindings-hwmon-pmbus-Add-Infineon-tda38740-and-tda38725/20260910-203550, commit: 624603abe6d524d514b8131b2532f3515e6b7b2e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Colin Huang <u8813345@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Colin-Huang/dt-bindings-hwmon-pmbus-Add-Infineon-tda38740-and-tda38725/20260910-203550
head:   624603abe6d524d514b8131b2532f3515e6b7b2e
commit: 624603abe6d524d514b8131b2532f3515e6b7b2e hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
date:   13 hours ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260911/202609111110.KRe8lrPe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111110.KRe8lrPe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111110.KRe8lrPe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/tda38740.c: In function 'tda38740_probe':
>> drivers/hwmon/pmbus/tda38740.c:58:49: error: invalid application of 'sizeof' to incomplete type 'struct tda38740_data'
      58 |         data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
         |                                                 ^
>> drivers/hwmon/pmbus/tda38740.c:62:21: error: invalid use of undefined type 'struct tda38740_data'
      62 |         memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
         |                     ^~
   drivers/hwmon/pmbus/tda38740.c:64:44: error: invalid use of undefined type 'struct tda38740_data'
      64 |         return pmbus_do_probe(client, &data->info);
         |                                            ^~


vim +58 drivers/hwmon/pmbus/tda38740.c

624603abe6d524d Colin Huang 2026-09-10  53  
624603abe6d524d Colin Huang 2026-09-10  54  static int tda38740_probe(struct i2c_client *client)
624603abe6d524d Colin Huang 2026-09-10  55  {
624603abe6d524d Colin Huang 2026-09-10  56  	struct tda38740_data *data;
624603abe6d524d Colin Huang 2026-09-10  57  
624603abe6d524d Colin Huang 2026-09-10 @58  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
624603abe6d524d Colin Huang 2026-09-10  59  	if (!data)
624603abe6d524d Colin Huang 2026-09-10  60  		return -ENOMEM;
624603abe6d524d Colin Huang 2026-09-10  61  
624603abe6d524d Colin Huang 2026-09-10 @62  	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
624603abe6d524d Colin Huang 2026-09-10  63  
624603abe6d524d Colin Huang 2026-09-10  64  	return pmbus_do_probe(client, &data->info);
624603abe6d524d Colin Huang 2026-09-10  65  }
624603abe6d524d Colin Huang 2026-09-10  66  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
