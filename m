Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302325C838
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 02:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851472; cv=none; b=Qn80053W5PGye41fGgGrf7i4SJrD4MUJEOfaWZ0cwHx4659Y8A3jx55+Py/vMAzeNBMygFoIVK62C6mP8wyKAdVWvhSZirzlaa+VHT6ivoDJUiU5BcDTBImTm8E1ffA8IpDxsCywOWboicI1HQqfbjXBBFWIt2SyomhKrU0S0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851472; c=relaxed/simple;
	bh=d+0ozNYXdfjEZ12RR+RKgoaAdabug3Bg7X0Ptvzi5wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cuM2Wi1FCRxUeTCv7WHTyOFqbC3sJ5ZB5WpMEpj7lCR4hIuzOnSwPBK8EnonB9XQ57jRya2wGWqs0Mnm5hjfyT/QxsNRturdeX4ZoJmoCHGO+OXgshT2YwYh88td3q0osbdZJmwFCx0NlRoWRZcJ9Qg4821ga7lxtaiR6bbPvFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfAWwmBA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfAWwmBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765851470; x=1797387470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+0ozNYXdfjEZ12RR+RKgoaAdabug3Bg7X0Ptvzi5wg=;
  b=NfAWwmBApK1xXeV/Tei7+XSM+ZQc71dYz+vpUgyUIA1DH1ounnCHOEI2
   MX2h7pDSC+WprAi5XFyxrz2om86eWVbXMr1Q5GXvD3mjOIvEnOfRfoQvK
   SKrYlZ9xXre45fAqsZkZdwsBynLlFSaFnj36J3KbCXhsU/kT6K6h6tSYm
   oIA58UgBYmf0rIgU+C8lNSTc7AYiN9Bl2TlohveQfIXAngazUL2uPP+bh
   VAOGqEPw3s0DgQmLIJ9vn38JEDJ+KyJOK90qnunopd5uTn+cF8ZstUFmK
   Zpnk3enwOtfxsHICpi2CTLr7z2W3pZQJoH5QCF9NaV79FLB+U3CNW/Knh
   g==;
X-CSE-ConnectionGUID: NHl02kTSRoyleThv6hMZAA==
X-CSE-MsgGUID: gld5WkPhSpu1mNWmrOu2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78073236"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78073236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 18:17:48 -0800
X-CSE-ConnectionGUID: FllDdbFRRLSs/rmPdKODnQ==
X-CSE-MsgGUID: cBu6PpbRQz+Eb8EnIqqJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197875748"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 18:17:48 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVKdF-0000000013n-137A;
	Tue, 16 Dec 2025 02:17:45 +0000
Date: Tue, 16 Dec 2025 10:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/power/supply/bd71828-power.c:469
 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.
Message-ID: <202512161012.YCn72zq9-lkp@intel.com>
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
TO: Andreas Kemnade <andreas@kemnade.info>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 5bff79dad20a51fed3ff6d78f6b60321cd145a99 power: supply: Add bd718(15/28/78) charger driver
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: openrisc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251216/202512161012.YCn72zq9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512161012.YCn72zq9-lkp@intel.com/

smatch warnings:
drivers/power/supply/bd71828-power.c:469 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.

vim +/tmp +469 drivers/power/supply/bd71828-power.c

5bff79dad20a51 Andreas Kemnade 2025-09-18  436  
5bff79dad20a51 Andreas Kemnade 2025-09-18  437  static int bd71828_battery_get_property(struct power_supply *psy,
5bff79dad20a51 Andreas Kemnade 2025-09-18  438  					enum power_supply_property psp,
5bff79dad20a51 Andreas Kemnade 2025-09-18  439  					union power_supply_propval *val)
5bff79dad20a51 Andreas Kemnade 2025-09-18  440  {
5bff79dad20a51 Andreas Kemnade 2025-09-18  441  	struct bd71828_power *pwr = dev_get_drvdata(psy->dev.parent);
5bff79dad20a51 Andreas Kemnade 2025-09-18  442  	int ret = 0;
5bff79dad20a51 Andreas Kemnade 2025-09-18  443  	int status, health, tmp, curr, curr_avg, chg_en;
5bff79dad20a51 Andreas Kemnade 2025-09-18  444  
5bff79dad20a51 Andreas Kemnade 2025-09-18  445  	if (psp == POWER_SUPPLY_PROP_STATUS ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  446  	    psp == POWER_SUPPLY_PROP_HEALTH ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  447  	    psp == POWER_SUPPLY_PROP_CHARGE_TYPE)
5bff79dad20a51 Andreas Kemnade 2025-09-18  448  		ret = bd71828_charge_status(pwr, &status, &health);
5bff79dad20a51 Andreas Kemnade 2025-09-18  449  	else if (psp == POWER_SUPPLY_PROP_CURRENT_AVG ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  450  		 psp == POWER_SUPPLY_PROP_CURRENT_NOW)
5bff79dad20a51 Andreas Kemnade 2025-09-18  451  		ret = bd71828_get_current_ds_adc(pwr, &curr, &curr_avg);
5bff79dad20a51 Andreas Kemnade 2025-09-18  452  	if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  453  		return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  454  
5bff79dad20a51 Andreas Kemnade 2025-09-18  455  	switch (psp) {
5bff79dad20a51 Andreas Kemnade 2025-09-18  456  	case POWER_SUPPLY_PROP_STATUS:
5bff79dad20a51 Andreas Kemnade 2025-09-18  457  		val->intval = status;
5bff79dad20a51 Andreas Kemnade 2025-09-18  458  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  459  	case POWER_SUPPLY_PROP_HEALTH:
5bff79dad20a51 Andreas Kemnade 2025-09-18  460  		val->intval = health;
5bff79dad20a51 Andreas Kemnade 2025-09-18  461  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  462  	case POWER_SUPPLY_PROP_PRESENT:
5bff79dad20a51 Andreas Kemnade 2025-09-18  463  		ret = get_bat_online(pwr, &tmp);
5bff79dad20a51 Andreas Kemnade 2025-09-18  464  		if (!ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  465  			val->intval = tmp;
5bff79dad20a51 Andreas Kemnade 2025-09-18  466  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  467  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
5bff79dad20a51 Andreas Kemnade 2025-09-18  468  		ret = bd71828_get_vbat(pwr, &tmp);
5bff79dad20a51 Andreas Kemnade 2025-09-18 @469  		val->intval = tmp;
5bff79dad20a51 Andreas Kemnade 2025-09-18  470  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  471  	case POWER_SUPPLY_PROP_TECHNOLOGY:
5bff79dad20a51 Andreas Kemnade 2025-09-18  472  		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
5bff79dad20a51 Andreas Kemnade 2025-09-18  473  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  474  	case POWER_SUPPLY_PROP_CURRENT_AVG:
5bff79dad20a51 Andreas Kemnade 2025-09-18  475  		val->intval = curr_avg;
5bff79dad20a51 Andreas Kemnade 2025-09-18  476  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  477  	case POWER_SUPPLY_PROP_CURRENT_NOW:
5bff79dad20a51 Andreas Kemnade 2025-09-18  478  		val->intval = curr;
5bff79dad20a51 Andreas Kemnade 2025-09-18  479  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  480  	case POWER_SUPPLY_PROP_CURRENT_MAX:
5bff79dad20a51 Andreas Kemnade 2025-09-18  481  		val->intval = MAX_CURRENT_DEFAULT;
5bff79dad20a51 Andreas Kemnade 2025-09-18  482  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  483  	case POWER_SUPPLY_PROP_TEMP:
5bff79dad20a51 Andreas Kemnade 2025-09-18  484  		ret = pwr->get_temp(pwr, &val->intval);
5bff79dad20a51 Andreas Kemnade 2025-09-18  485  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  486  	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
5bff79dad20a51 Andreas Kemnade 2025-09-18  487  		ret = regmap_read(pwr->regmap, pwr->regs->chg_en, &chg_en);
5bff79dad20a51 Andreas Kemnade 2025-09-18  488  		if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  489  			return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  490  
5bff79dad20a51 Andreas Kemnade 2025-09-18  491  		val->intval = (chg_en & BD7182x_MASK_CHG_EN) ?
5bff79dad20a51 Andreas Kemnade 2025-09-18  492  			POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO :
5bff79dad20a51 Andreas Kemnade 2025-09-18  493  			POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
5bff79dad20a51 Andreas Kemnade 2025-09-18  494  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  495  	default:
5bff79dad20a51 Andreas Kemnade 2025-09-18  496  		ret = -EINVAL;
5bff79dad20a51 Andreas Kemnade 2025-09-18  497  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  498  	}
5bff79dad20a51 Andreas Kemnade 2025-09-18  499  
5bff79dad20a51 Andreas Kemnade 2025-09-18  500  	return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  501  }
5bff79dad20a51 Andreas Kemnade 2025-09-18  502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
