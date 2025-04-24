Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B31F4CA2
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Apr 2025 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531941; cv=none; b=IEnYkGEiEQ5hPktwXWUPHC17g02pUAfdZkqVG67A/zWA3kWFV4+XRJhoX2aLMZdSvbnZQa42MiT4nC/kfwTqov76DxEiNAkXqy+CNwkZ4z7H3pGRV7dMgHzuJyinXuu9X8IVGL9ZyOnamCDTyFsVQzIjviAo5cwT65oyl64Tz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531941; c=relaxed/simple;
	bh=wxHYCeuL0SUOvbr0ayfNAQn+hV0Q8y90J2r8nkQ8AuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLhz+Zo5zsa1vuJupv+fLI2Ol9lCI2XyEKSm4RDOl+fWKTr6616IL2QETZucDpFHNeAmE6TolZGsotyGDckl0Upoho7xqnYTbzdQ8FCSEyHIL1xnYJ7jePajM/xLL1kOhMqbhH5UHKDHyRApKgZ94HQfEwO3ubj4+VbPeXQ4Rnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPpFdO5U; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPpFdO5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745531940; x=1777067940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wxHYCeuL0SUOvbr0ayfNAQn+hV0Q8y90J2r8nkQ8AuE=;
  b=hPpFdO5UZHdLzDaz4W4aV0oaBR2OlFToCoW4YUze45A7UaLgc9pa+Loe
   Wi+d4dJiC3+c5DanvggpdpEraHFZZgIdLeJjX0zTnfes3O4iHdDIFPGPw
   derRAQ6rcJ0CckrI+gQPlwT6h5UD5e7jv8A2Vs+aBa0O3UAk6DjCtpaMh
   meYU4GuFJxMUduwmIfrVigrklWePvoXYbHfRD3jUZdHC90+SU1HgwhN9S
   vLcHMJ/7vBuEGHhAx9UXYRkRrbQK/g+0CxOxpYlrR5eOqv1Xv0HZFtult
   iNJDcHBlzAvvZyqioHyaLjtEjo1B51oDpp617P/gDva+Zgd93tY7HuKBq
   Q==;
X-CSE-ConnectionGUID: 8l3Rbhs0RzGr67yggDZm1Q==
X-CSE-MsgGUID: H3SUk5IITrGkUBT+RBV5yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69680014"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="69680014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 14:59:00 -0700
X-CSE-ConnectionGUID: YiQtMJ4KQDKsuXEROrRx6g==
X-CSE-MsgGUID: 0nozNyAkQnOWtPVGqgiGSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="133245971"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2025 14:58:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u84at-0004cv-2n;
	Thu, 24 Apr 2025 21:58:55 +0000
Date: Fri, 25 Apr 2025 05:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 9/38]
 drivers/platform/x86/dell/alienware-wmi-wmax.c:931 awcc_hwmon_fans_init()
 error: uninitialized symbol 'temp_id'.
Message-ID: <202504250521.HEkFK1Jy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Kurt Borja <kuurtb@gmail.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   4d1e8c8f11c611db5828e4bae7292bc295eea8ef
commit: d699907834959c87a6b6c5214d5e9a3e8ba6b5a1 [9/38] platform/x86: alienware-wmi-wmax: Add HWMON support
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250521.HEkFK1Jy-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504250521.HEkFK1Jy-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/dell/alienware-wmi-wmax.c:931 awcc_hwmon_fans_init() error: uninitialized symbol 'temp_id'.

Old smatch warnings:
drivers/platform/x86/dell/alienware-wmi-wmax.c:1064 awcc_platform_profile_probe() error: uninitialized symbol 'id'.

vim +/temp_id +931 drivers/platform/x86/dell/alienware-wmi-wmax.c

d699907834959c Kurt Borja 2025-03-29  881  
d699907834959c Kurt Borja 2025-03-29  882  static int awcc_hwmon_fans_init(struct wmi_device *wdev)
d699907834959c Kurt Borja 2025-03-29  883  {
d699907834959c Kurt Borja 2025-03-29  884  	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
d699907834959c Kurt Borja 2025-03-29  885  	unsigned long fan_temps[AWCC_ID_BITMAP_LONGS];
d699907834959c Kurt Borja 2025-03-29  886  	unsigned long gather[AWCC_ID_BITMAP_LONGS];
d699907834959c Kurt Borja 2025-03-29  887  	u32 min_rpm, max_rpm, temp_count, temp_id;
d699907834959c Kurt Borja 2025-03-29  888  	struct awcc_fan_data *fan_data;
d699907834959c Kurt Borja 2025-03-29  889  	unsigned int i, j;
d699907834959c Kurt Borja 2025-03-29  890  	char *label;
d699907834959c Kurt Borja 2025-03-29  891  	int ret;
d699907834959c Kurt Borja 2025-03-29  892  	u8 id;
d699907834959c Kurt Borja 2025-03-29  893  
d699907834959c Kurt Borja 2025-03-29  894  	for (i = 0; i < priv->fan_count; i++) {
d699907834959c Kurt Borja 2025-03-29  895  		fan_data = devm_kzalloc(&wdev->dev, sizeof(*fan_data), GFP_KERNEL);
d699907834959c Kurt Borja 2025-03-29  896  		if (!fan_data)
d699907834959c Kurt Borja 2025-03-29  897  			return -ENOMEM;
d699907834959c Kurt Borja 2025-03-29  898  
d699907834959c Kurt Borja 2025-03-29  899  		/*
d699907834959c Kurt Borja 2025-03-29  900  		 * Fan IDs are listed first at offset 0
d699907834959c Kurt Borja 2025-03-29  901  		 */
d699907834959c Kurt Borja 2025-03-29  902  		ret = awcc_op_get_resource_id(wdev, i, &id);
d699907834959c Kurt Borja 2025-03-29  903  		if (ret)
d699907834959c Kurt Borja 2025-03-29  904  			return ret;
d699907834959c Kurt Borja 2025-03-29  905  
d699907834959c Kurt Borja 2025-03-29  906  		ret = awcc_thermal_information(wdev, AWCC_OP_GET_FAN_MIN_RPM, id,
d699907834959c Kurt Borja 2025-03-29  907  					       &min_rpm);
d699907834959c Kurt Borja 2025-03-29  908  		if (ret)
d699907834959c Kurt Borja 2025-03-29  909  			return ret;
d699907834959c Kurt Borja 2025-03-29  910  
d699907834959c Kurt Borja 2025-03-29  911  		ret = awcc_thermal_information(wdev, AWCC_OP_GET_FAN_MAX_RPM, id,
d699907834959c Kurt Borja 2025-03-29  912  					       &max_rpm);
d699907834959c Kurt Borja 2025-03-29  913  		if (ret)
d699907834959c Kurt Borja 2025-03-29  914  			return ret;
d699907834959c Kurt Borja 2025-03-29  915  
d699907834959c Kurt Borja 2025-03-29  916  		ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_TOTAL_FAN_TEMPS, id,
d699907834959c Kurt Borja 2025-03-29  917  					   0, &temp_count);
d699907834959c Kurt Borja 2025-03-29  918  		if (ret)
d699907834959c Kurt Borja 2025-03-29  919  			return ret;
d699907834959c Kurt Borja 2025-03-29  920  
d699907834959c Kurt Borja 2025-03-29  921  		for (j = 0; j < temp_count; j++) {
d699907834959c Kurt Borja 2025-03-29  922  			ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_FAN_TEMP_ID,
d699907834959c Kurt Borja 2025-03-29  923  						   id, j, &temp_id);
d699907834959c Kurt Borja 2025-03-29  924  			if (ret)
d699907834959c Kurt Borja 2025-03-29  925  				break;
d699907834959c Kurt Borja 2025-03-29  926  
d699907834959c Kurt Borja 2025-03-29  927  			temp_id = FIELD_GET(AWCC_RESOURCE_ID_MASK, temp_id);
d699907834959c Kurt Borja 2025-03-29  928  			__set_bit(temp_id, fan_temps);
d699907834959c Kurt Borja 2025-03-29  929  		}
d699907834959c Kurt Borja 2025-03-29  930  
d699907834959c Kurt Borja 2025-03-29 @931  		label = awcc_get_fan_label(&wdev->dev, temp_count, temp_id);
d699907834959c Kurt Borja 2025-03-29  932  		if (!label)
d699907834959c Kurt Borja 2025-03-29  933  			return -ENOMEM;
d699907834959c Kurt Borja 2025-03-29  934  
d699907834959c Kurt Borja 2025-03-29  935  		fan_data->id = id;
d699907834959c Kurt Borja 2025-03-29  936  		fan_data->min_rpm = min_rpm;
d699907834959c Kurt Borja 2025-03-29  937  		fan_data->max_rpm = max_rpm;
d699907834959c Kurt Borja 2025-03-29  938  		fan_data->label = label;
d699907834959c Kurt Borja 2025-03-29  939  		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
d699907834959c Kurt Borja 2025-03-29  940  		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
d699907834959c Kurt Borja 2025-03-29  941  		priv->fan_data[i] = fan_data;
d699907834959c Kurt Borja 2025-03-29  942  
d699907834959c Kurt Borja 2025-03-29  943  		bitmap_zero(fan_temps, AWCC_ID_BITMAP_SIZE);
d699907834959c Kurt Borja 2025-03-29  944  	}
d699907834959c Kurt Borja 2025-03-29  945  
d699907834959c Kurt Borja 2025-03-29  946  	return 0;
d699907834959c Kurt Borja 2025-03-29  947  }
d699907834959c Kurt Borja 2025-03-29  948  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
