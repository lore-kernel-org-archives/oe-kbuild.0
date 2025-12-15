Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D01FA178
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765758838; cv=none; b=i8hpuRRoTu+ndlKGTofnpQid7E/RKnkPLSOxBAIecyPsh+4ojkSQA8r1QmkFKlFskZAPbGzvW2egZqcSgq2fpZuXerYIKjusvqQxUeh+2jH83D83NHIQWN7wADwIX76U6YkQ2VD6j+BxKf7gxjQgm2HtewNGdkZQ7kgmjFUEOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765758838; c=relaxed/simple;
	bh=GpjuOD+zaHY8hl1X00FY62A6iY6wdlS1GXYMCvRQHqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrSKwAYrI3fxZ2WdLr5RHDLAdlXDWZ8rcGePvsf+VgutAD4Hl/YTKYTL9txFEo6K+Q/Q3uDQBs+OCDIMTToGsaSPxT+PPAsso4M9JXwXM/Fx+oxO1zSDeuZnWDnGlKGGYDmVxmV5EQ22HswuvAOvAN7epDAscQP9x7iP4RyjwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDKYi2K7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDKYi2K7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765758836; x=1797294836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GpjuOD+zaHY8hl1X00FY62A6iY6wdlS1GXYMCvRQHqI=;
  b=VDKYi2K7ZNfRkJG+LTIL3k2WISqL2istqlrIUR1eybVDg3yoWKjnB6Ra
   x6Wtom09Tih6Au5phur9sO4Sy/WKDYd99b/HhH1p3MryO11d73+p1axyR
   dLKSc/QO6K4Mai+S1DbXR3oUkb7v/kU4N9UAys3kBZq4iPRdX/2mtfm6x
   JcugWAagnZI6+by347W4tElCfU0SGcDp60+zbxeyohLqYdf0SbTPh1STM
   QuxTpyej6eBLkG79fPt4uxUtBhp+VMixJGlO6icnnoCT7O4PLcDKmIbP8
   A2w841ck86/ORnUZBTwY/hLiDPJsBrU6SulorSC5JZPRkuklcRfFnAQu3
   g==;
X-CSE-ConnectionGUID: LTHisqN+Qrm86y/XjYNaYQ==
X-CSE-MsgGUID: aetAI9AHRKOUco9hMjcJJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="93138038"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="93138038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:33:56 -0800
X-CSE-ConnectionGUID: 56MSsiw0RWmaBX8EQGSOcw==
X-CSE-MsgGUID: AbdvJ9hlS6eYTR9RREfS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228659231"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 16:33:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUwXA-000000009X3-26Jp;
	Mon, 15 Dec 2025 00:33:52 +0000
Date: Mon, 15 Dec 2025 08:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwmon/hwmon.c:442 hwmon_attr_show() error: uninitialized
 symbol 'val64'.
Message-ID: <202512150841.TyArcxBC-lkp@intel.com>
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
TO: Guenter Roeck <linux@roeck-us.net>
CC: Chris Packham <chris.packham@alliedtelesis.co.nz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 0bcd01f757bc06471c82a137eafee281ef1b6e38 hwmon: Introduce 64-bit energy attribute support
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150841.TyArcxBC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150841.TyArcxBC-lkp@intel.com/

New smatch warnings:
drivers/hwmon/hwmon.c:442 hwmon_attr_show() error: uninitialized symbol 'val64'.

Old smatch warnings:
drivers/hwmon/hwmon.c:439 hwmon_attr_show() error: uninitialized symbol 'val'.

vim +/val64 +442 drivers/hwmon/hwmon.c

d560168b5d0fb4 Guenter Roeck 2015-08-26  424  
d560168b5d0fb4 Guenter Roeck 2015-08-26  425  static ssize_t hwmon_attr_show(struct device *dev,
d560168b5d0fb4 Guenter Roeck 2015-08-26  426  			       struct device_attribute *devattr, char *buf)
d560168b5d0fb4 Guenter Roeck 2015-08-26  427  {
d560168b5d0fb4 Guenter Roeck 2015-08-26  428  	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
0bcd01f757bc06 Guenter Roeck 2024-08-28  429  	s64 val64;
d560168b5d0fb4 Guenter Roeck 2015-08-26  430  	long val;
d560168b5d0fb4 Guenter Roeck 2015-08-26  431  	int ret;
d560168b5d0fb4 Guenter Roeck 2015-08-26  432  
d560168b5d0fb4 Guenter Roeck 2015-08-26  433  	ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
0bcd01f757bc06 Guenter Roeck 2024-08-28  434  			       (hattr->type == hwmon_energy64) ? (long *)&val64 : &val);
d560168b5d0fb4 Guenter Roeck 2015-08-26  435  	if (ret < 0)
d560168b5d0fb4 Guenter Roeck 2015-08-26  436  		return ret;
d560168b5d0fb4 Guenter Roeck 2015-08-26  437  
0bcd01f757bc06 Guenter Roeck 2024-08-28  438  	if (hattr->type != hwmon_energy64)
0bcd01f757bc06 Guenter Roeck 2024-08-28  439  		val64 = val;
0bcd01f757bc06 Guenter Roeck 2024-08-28  440  
61b8ab2c5481dc Nicolin Chen  2018-10-09  441  	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
0bcd01f757bc06 Guenter Roeck 2024-08-28 @442  			      hattr->name, val64);
61b8ab2c5481dc Nicolin Chen  2018-10-09  443  
0bcd01f757bc06 Guenter Roeck 2024-08-28  444  	return sprintf(buf, "%lld\n", val64);
d560168b5d0fb4 Guenter Roeck 2015-08-26  445  }
d560168b5d0fb4 Guenter Roeck 2015-08-26  446  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
