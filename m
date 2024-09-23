Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099EA184
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 02:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727060234; cv=none; b=rQppQZ9EAirzuZbxRwmjDe5GiCKTzWlDES4qMmy3WYZBRIqa/itfoffk2kW1fInHPIfv9J5RlF+rgP0MxDCjcAS5WKVhNfB0/DZNYyP+5S+skOLNdS2L97VpbFyIT679d4oUk6gNsXaKfL7p29OkYAUSa5FLOR5QcLrEzyvY8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727060234; c=relaxed/simple;
	bh=Mu4ObyN2e6RFN4MPkGe4ZXHIfSwMfQpURtKI+jS5tL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBOan5FlpPzU4AdOqoClBQjHwHdTJu04X7quwd/VoUrKJ2zY+MUIsx74dfLm1NfvCkLPDvccZ3PXTmYpBomBATO6VwjBbpUdvr0g3pfA5ovX48BH7DxU5kCqA7ZE1LROgiqsdO4UswDwyqXez39St+nZIn5fi2IjMYYgLslY8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPPQXGf8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPPQXGf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727060233; x=1758596233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mu4ObyN2e6RFN4MPkGe4ZXHIfSwMfQpURtKI+jS5tL4=;
  b=QPPQXGf8GsnyLAiVLtpCTsGaqaUATD76p7AvudKvs6CMadMJV+hiMKj3
   Sh30J7YKSBR1MNW0rBZP7KxY+mEMIFVtoEgN212GqDZxCGPEzSPxGkUGV
   YEOfjVo6XdO/7CUiZovaKLhKEK9NHnF6359Cww5swrqh/klCjlpnMIqVu
   h+2dopStf52Uz/yT+rimNhQCsUsnlD75zhkkdDffHfW2FTqVuw4EjJezM
   Zla7iCa3ZPAAZQziYL3k2It6rH4SShfhp51BjcKVKW+YEpb1bx+coFdVV
   Ek924l/3DYMEYhYUC4eGFtklBPTiOI8UGCRGs03V7UiMZJiH475ReiYrl
   g==;
X-CSE-ConnectionGUID: K6kUU9eaRbK+jYLRQnofGA==
X-CSE-MsgGUID: PN1sCStTR3yWPFT4T56kGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43461594"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="43461594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 19:57:12 -0700
X-CSE-ConnectionGUID: M9QruhteQsiqo+RZZ2XaMg==
X-CSE-MsgGUID: t4d0oVcvRpekgH7nRr0mMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70519920"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2024 19:57:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssZG8-000GqS-1y;
	Mon, 23 Sep 2024 02:57:08 +0000
Date: Mon, 23 Sep 2024 10:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/typec/tcpm/tcpm.c:6356:20-21: WARNING opportunity for
 max()
Message-ID: <202409231009.2efXAh9b-lkp@intel.com>
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
TO: Frank Wang <frank.wang@rock-chips.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: 8be558dcffe69b078b34b1fa93b82acaf4ce4957 usb: typec: tcpm: add get max power support
date:   1 year, 3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 3 months ago
config: arc-randconfig-r054-20240923 (https://download.01.org/0day-ci/archive/20240923/202409231009.2efXAh9b-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409231009.2efXAh9b-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/typec/tcpm/tcpm.c:6356:20-21: WARNING opportunity for max()

vim +6356 drivers/usb/typec/tcpm/tcpm.c

f2a8aa053c1761 drivers/usb/typec/tcpm.c      Adam Thomson 2018-04-23  6342  
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6343  static int tcpm_psy_get_input_power_limit(struct tcpm_port *port,
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6344  					  union power_supply_propval *val)
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6345  {
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6346  	unsigned int src_mv, src_ma, max_src_uw = 0;
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6347  	unsigned int i, tmp;
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6348  
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6349  	for (i = 0; i < port->nr_source_caps; i++) {
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6350  		u32 pdo = port->source_caps[i];
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6351  
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6352  		if (pdo_type(pdo) == PDO_TYPE_FIXED) {
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6353  			src_mv = pdo_fixed_voltage(pdo);
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6354  			src_ma = pdo_max_current(pdo);
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6355  			tmp = src_mv * src_ma;
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16 @6356  			max_src_uw = tmp > max_src_uw ? tmp : max_src_uw;
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6357  		}
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6358  	}
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6359  
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6360  	val->intval = max_src_uw;
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6361  	return 0;
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6362  }
8be558dcffe69b drivers/usb/typec/tcpm/tcpm.c Frank Wang   2023-06-16  6363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
