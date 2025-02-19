Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680111925AF
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Feb 2025 02:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739932490; cv=none; b=EHwssRn3/LHx0ei3/7RbQR/AkbIGqH4O/G/yqUuvRXiC+zWNxL3x9Ygx8Ysp2sVgYjGhL+P0ORwVdSWMdxg3TJSCx9wuybN8bsvnHMIJ3W7VmQN4N5eDM2IgcgRqW/CnyeGnfRTuLYbVaZucEhykqDNX8Iu9WBeCD83JhS4Noog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739932490; c=relaxed/simple;
	bh=DduKFCckXdhdEkEpz+PZEo5wJKT4XoAPt71cK5pplKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDbH6Ypd/DI6fqFhml8OBtFICA/HC56sGSDRfuyyWqntmJJPiBIREU8h9be6OZp/aLa7p63Z7xPWy7fUCVlXRWIesaKrb3RfGISGYVTCjignON6E8Xnt/p79ORVlOTsoSLfPEP28zqhjVTvL1NIjYtK/9RNmY7tcUtd5FZh60ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcgKjTq4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcgKjTq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739932488; x=1771468488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DduKFCckXdhdEkEpz+PZEo5wJKT4XoAPt71cK5pplKg=;
  b=jcgKjTq45jN3ah9wkvoopTUzJua6ETA8zjR3v3uM2gwh4WkxafHIhIks
   KsF48u954xI3p6j6FqnGRgMwvlT9NWJmdbL/GfFZPQVorQuSq0FJd8iSy
   /jRSE/rSq95BqIuzlmfn5lu0ScWs8l4e35PFNQmkyDuFZM5WPilDi9T53
   4VWgMfBtduDxzLqXC9Sae1x6eQDuyvu3lEn6Vd71F5QP4hK3+aV9BOtPf
   Zxuc9hRoMFCEERCSUSuTIbLwX4anQXRXsnIi0YiDv2OtCj8btem6fomAE
   TeLEh0jQGuXRQ0Uo5DFFABHJ0adofM+KtHldZRx3qOccWkcdl8sUjPxsD
   A==;
X-CSE-ConnectionGUID: sQIiwVL/T5C+U0cv0aqC8w==
X-CSE-MsgGUID: zV2oik4/QD+ZdcO63PxPvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63128684"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="63128684"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:34:47 -0800
X-CSE-ConnectionGUID: 8+vy8PcKSSOT6L3y0PZnCQ==
X-CSE-MsgGUID: Y4us08cfS1OZyrmRnOQe5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118711748"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2025 18:34:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkZv8-00019F-02;
	Wed, 19 Feb 2025 02:34:42 +0000
Date: Wed, 19 Feb 2025 10:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/170-atcphy 5/16] drivers/phy/apple/atc.c:2156
 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) =>
 (0-u32max > u32max)'
Message-ID: <202502191004.5HCUpXEb-lkp@intel.com>
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
TO: Sven Peter <sven@svenpeter.dev>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   d9133ae802014bca51082790e834546f42d21231
commit: 6dcc9a0b2ca8beb8f112cdf4a06be2a70b83111b [5/16] WIP: phy: apple: Add Apple Type-C PHY
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: sparc-randconfig-r071-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191004.5HCUpXEb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502191004.5HCUpXEb-lkp@intel.com/

New smatch warnings:
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(mask > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2157 atcphy_parse_new_tunable() warn: impossible condition '(value > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
drivers/phy/apple/atc.c:1609 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.

vim +2156 drivers/phy/apple/atc.c

6dcc9a0b2ca8be Sven Peter 2022-11-30  2113  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2114  static int atcphy_parse_new_tunable(struct apple_atcphy *atcphy,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2115  				    struct atcphy_tunable *tunable,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2116  				    const char *name)
6dcc9a0b2ca8be Sven Peter 2022-11-30  2117  {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2118  	struct property *prop;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2119  	u64 *fdt_tunable;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2120  	int ret, i;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2121  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2122  	prop = of_find_property(atcphy->np, name, NULL);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2123  	if (!prop) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2124  		dev_err(atcphy->dev, "tunable %s not found\n", name);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2125  		return -ENOENT;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2126  	}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2127  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2128  	if (prop->length % (4 * sizeof(u64)))
6dcc9a0b2ca8be Sven Peter 2022-11-30  2129  		return -EINVAL;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2130  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2131  	fdt_tunable = kzalloc(prop->length, GFP_KERNEL);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2132  	if (!fdt_tunable)
6dcc9a0b2ca8be Sven Peter 2022-11-30  2133  		return -ENOMEM;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2134  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2135  	tunable->sz = prop->length / (4 * sizeof(u64));
6dcc9a0b2ca8be Sven Peter 2022-11-30  2136  	ret = of_property_read_variable_u64_array(atcphy->np, name, fdt_tunable,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2137  						  tunable->sz, tunable->sz);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2138  	if (ret < 0)
6dcc9a0b2ca8be Sven Peter 2022-11-30  2139  		goto err_free_fdt;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2140  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2141  	tunable->values = devm_kcalloc(atcphy->dev, tunable->sz,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2142  				       sizeof(*tunable->values), GFP_KERNEL);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2143  	if (!tunable->values) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2144  		ret = -ENOMEM;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2145  		goto err_free_fdt;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2146  	}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2147  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2148  	for (i = 0; i < tunable->sz; ++i) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2149  		u32 offset, size, mask, value;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2150  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2151  		offset = fdt_tunable[4 * i];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2152  		size = fdt_tunable[4 * i + 1];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2153  		mask = fdt_tunable[4 * i + 2];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2154  		value = fdt_tunable[4 * i + 3];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2155  
6dcc9a0b2ca8be Sven Peter 2022-11-30 @2156  		if (offset > U32_MAX || size != 4 || mask > U32_MAX ||
6dcc9a0b2ca8be Sven Peter 2022-11-30 @2157  		    value > U32_MAX) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2158  			ret = -EINVAL;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2159  			goto err_free_values;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2160  		}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2161  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2162  		tunable->values[i].offset = offset;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2163  		tunable->values[i].mask = mask;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2164  		tunable->values[i].value = value;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2165  	}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2166  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2167  	trace_atcphy_parsed_tunable(name, tunable);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2168  	kfree(fdt_tunable);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2169  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2170  	BUG_ON(1);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2171  	return 0;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2172  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2173  err_free_values:
6dcc9a0b2ca8be Sven Peter 2022-11-30  2174  	devm_kfree(atcphy->dev, tunable->values);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2175  err_free_fdt:
6dcc9a0b2ca8be Sven Peter 2022-11-30  2176  	kfree(fdt_tunable);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2177  	return ret;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2178  }
6dcc9a0b2ca8be Sven Peter 2022-11-30  2179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
