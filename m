Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378FD3A0E80
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114394; cv=none; b=RpEbuWPVo4rHoef4OKozB3L89zglkpdnUXqDiZ9JKFhGn+ZX89Fdz2+ooqwLC5QYX/SOmdT4sT1e3XGivbUQ1d3UJZqsQN7S7vdY6XAKy7mr9S1Xw9huHU3fnH2E9U2RxcZ5f6UhR0wRmnl3xQIet+GHn0pPdFz6J22NvB696iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114394; c=relaxed/simple;
	bh=xKInxMiDUFAX/6q+Y6m6Tz8YMmNNcm/IgAz3Nkg0CTo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c06es6SbVPpORY0XJH9CtO/CRzVRppy1a6d00vrcImsfc6u1gIV956fQsi4OpCDeoo9W3sVwtjFCMoEwLJHmlZj3RRRX2K/JeQfX23ZPl2+vKw5hDky+jxgmBQuxI0m+ofp4Eg08oqzFdE8bcXf56apY7V7lu2PzJj1Gfcj5OVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmHhWils; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmHhWils"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789114394; x=1820650394;
  h=date:from:to:cc:subject:message-id;
  bh=xKInxMiDUFAX/6q+Y6m6Tz8YMmNNcm/IgAz3Nkg0CTo=;
  b=VmHhWilsEroXRYEikRseyGPXjq+0lK5oowVTvaYFz6wWJQ3EbJJV7HIF
   lGeOLTPc4h+mTsbyueqpa418Yql/CzAvvRWhfqwgbz10CoGGbvIunjh9B
   3m88mL29EY76grekn4JxHNEdgrK6Wik4Lp+VFLWrQPAbSaGZ69OfeI19u
   xLj+kucGgbUT2Bnb5sfDcsye5GgCMIvkiBcceVi2I+c34jVvaZUXNjmSp
   lPGAt02uXFAkdfhJRnfSEfxqsAyRDqkk6wQLPs9uR6oWXuWWZ3ezEQfSq
   3vstIKhKC5rHud2xjbk0Lw0AE/HsHiA99y4Wg5Af8epnyoGawUDKk/lFB
   Q==;
X-CSE-ConnectionGUID: wdAywuNTRNijC0EyTiPuRg==
X-CSE-MsgGUID: t3tSFbraRmCaRICilk+9qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89508846"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89508846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:13:13 -0700
X-CSE-ConnectionGUID: WfhfaFMiQa+KYCKTLWujXQ==
X-CSE-MsgGUID: ZEyb+vG7RxG5LOXkTdtqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="271834695"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2026 01:13:12 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4wNZ-000000001HT-25HC;
	Fri, 11 Sep 2026 08:13:05 +0000
Date: Fri, 11 Sep 2026 16:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/pmbus/tda38740.c:65:1: warning: control
 reaches end of non-void function
Message-ID: <202609111602.MwxG0uhP-lkp@intel.com>
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
date:   18 hours ago
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111602.MwxG0uhP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111602.MwxG0uhP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111602.MwxG0uhP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/tda38740.c: In function 'tda38740_probe':
   drivers/hwmon/pmbus/tda38740.c:58:49: error: invalid application of 'sizeof' to incomplete type 'struct tda38740_data'
      58 |         data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
         |                                                 ^
   drivers/hwmon/pmbus/tda38740.c:62:21: error: invalid use of undefined type 'struct tda38740_data'
      62 |         memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
         |                     ^~
   drivers/hwmon/pmbus/tda38740.c:64:44: error: invalid use of undefined type 'struct tda38740_data'
      64 |         return pmbus_do_probe(client, &data->info);
         |                                            ^~
>> drivers/hwmon/pmbus/tda38740.c:65:1: warning: control reaches end of non-void function [-Wreturn-type]
      65 | }
         | ^


vim +65 drivers/hwmon/pmbus/tda38740.c

624603abe6d524d Colin Huang 2026-09-10  53  
624603abe6d524d Colin Huang 2026-09-10  54  static int tda38740_probe(struct i2c_client *client)
624603abe6d524d Colin Huang 2026-09-10  55  {
624603abe6d524d Colin Huang 2026-09-10  56  	struct tda38740_data *data;
624603abe6d524d Colin Huang 2026-09-10  57  
624603abe6d524d Colin Huang 2026-09-10  58  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
624603abe6d524d Colin Huang 2026-09-10  59  	if (!data)
624603abe6d524d Colin Huang 2026-09-10  60  		return -ENOMEM;
624603abe6d524d Colin Huang 2026-09-10  61  
624603abe6d524d Colin Huang 2026-09-10  62  	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
624603abe6d524d Colin Huang 2026-09-10  63  
624603abe6d524d Colin Huang 2026-09-10  64  	return pmbus_do_probe(client, &data->info);
624603abe6d524d Colin Huang 2026-09-10 @65  }
624603abe6d524d Colin Huang 2026-09-10  66  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
