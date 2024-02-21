Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E985275
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Feb 2024 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708540601; cv=none; b=hgYL/JLjxoy1/c5m/yoNibdM3BNXPSq//jn2Vb3ARo/Fo8gheyMIo0dRpsatl/BoBP975SCReoJ94uBYaKNSKSJlx2MJY/cPRsu1Mxe84Ov7gwEjAEsCEhsqptzN45ofc8Lui8IYOxPIvwBpFTDS3HmNmUv0YGXOLRMi2NyqFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708540601; c=relaxed/simple;
	bh=7Heg5D9hxy8S55qlNHvj5J7L80Tqt5GL/TYnHumh6A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVPgz15Hmk+b8PNUvJw0t/mA71qeJj04JDjwbLqZ+jfXczEOvQq2iGO+qi2uGomNnP4ET1UMDnY8FMtH4NL7G46XVpnsnJGOuWI9TTFQwXAIFhceOMnp+RKt3Z0QFNU3+fdmKXjGUQrBFLQ33zjmxuIupe03F5J9KDf00yK4hmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8MK1as0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8MK1as0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540599; x=1740076599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Heg5D9hxy8S55qlNHvj5J7L80Tqt5GL/TYnHumh6A4=;
  b=b8MK1as0w6GDyqZ40LnN+xxSX/gzR4NwcAQUcuEsGiRU6FUukHDXnX3+
   6X8+cF9BOUp6mU+1dJerJrffcQU31V99RC+R7QrOyKA3zNcpSfZaETeMi
   GrCBpezE4gRSYEL/PiSHwUtUQi7Ixn2NHW/jq5FF1HPlf9BJ3UecvbO4H
   4IZjDGbSY2BEfKjuxqlpNWNt0P5T8y5C+sYvMkNFQcujuqXaRvZQBZ/eI
   tzfRNdiM+3xvrZiHnlhZjfPkqULlnFoiXTkJii53CNbr3LXO85sYQiycD
   7ZXd5xLJMCWZOQTonZGhAIKNofSxyxeUzlCORpoom3QXgJ2bVqnP+r4GW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2869342"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2869342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="36013318"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Feb 2024 10:36:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcrS9-0005bH-1O;
	Wed, 21 Feb 2024 18:36:23 +0000
Date: Thu, 22 Feb 2024 02:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/property.c:985 acpi_data_prop_read_single() error:
 uninitialized symbol 'obj'.
Message-ID: <202402220250.W1ggembF-lkp@intel.com>
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
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Hi Andy,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
commit: 1fbd9029c8d5ccd3de49cb0f5382cffc7444a32b ACPI: property: Refactor acpi_data_prop_read_single()
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220250.W1ggembF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402220250.W1ggembF-lkp@intel.com/

New smatch warnings:
drivers/acpi/property.c:985 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.

Old smatch warnings:
drivers/acpi/property.c:991 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:997 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1004 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.

vim +/obj +985 drivers/acpi/property.c

b31384fa5de37a Rafael J. Wysocki 2014-11-04   968  
99a85464693faa Sakari Ailus      2017-07-21   969  static int acpi_data_prop_read_single(const struct acpi_device_data *data,
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27   970  				      const char *propname,
b31384fa5de37a Rafael J. Wysocki 2014-11-04   971  				      enum dev_prop_type proptype, void *val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   972  {
b31384fa5de37a Rafael J. Wysocki 2014-11-04   973  	const union acpi_object *obj;
1fbd9029c8d5cc Andy Shevchenko   2023-03-24   974  	int ret = 0;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   975  
1fbd9029c8d5cc Andy Shevchenko   2023-03-24   976  	if (proptype >= DEV_PROP_U8 && proptype <= DEV_PROP_U64)
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27   977  		ret = acpi_data_get_property(data, propname, ACPI_TYPE_INTEGER, &obj);
1fbd9029c8d5cc Andy Shevchenko   2023-03-24   978  	else if (proptype == DEV_PROP_STRING)
1fbd9029c8d5cc Andy Shevchenko   2023-03-24   979  		ret = acpi_data_get_property(data, propname, ACPI_TYPE_STRING, &obj);
b31384fa5de37a Rafael J. Wysocki 2014-11-04   980  	if (ret)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   981  		return ret;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   982  
b31384fa5de37a Rafael J. Wysocki 2014-11-04   983  	switch (proptype) {
b31384fa5de37a Rafael J. Wysocki 2014-11-04   984  	case DEV_PROP_U8:
b31384fa5de37a Rafael J. Wysocki 2014-11-04  @985  		if (obj->integer.value > U8_MAX)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   986  			return -EOVERFLOW;
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11   987  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   988  			*(u8 *)val = obj->integer.value;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   989  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   990  	case DEV_PROP_U16:
b31384fa5de37a Rafael J. Wysocki 2014-11-04   991  		if (obj->integer.value > U16_MAX)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   992  			return -EOVERFLOW;
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11   993  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   994  			*(u16 *)val = obj->integer.value;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   995  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   996  	case DEV_PROP_U32:
b31384fa5de37a Rafael J. Wysocki 2014-11-04   997  		if (obj->integer.value > U32_MAX)
b31384fa5de37a Rafael J. Wysocki 2014-11-04   998  			return -EOVERFLOW;
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11   999  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1000  			*(u32 *)val = obj->integer.value;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1001  		break;
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1002  	case DEV_PROP_U64:
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1003  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1004  			*(u64 *)val = obj->integer.value;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1005  		break;
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1006  	case DEV_PROP_STRING:
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1007  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1008  			*(char **)val = obj->string.pointer;
b0b027cee090a1 Sakari Ailus      2017-03-28  1009  		return 1;
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1010  	default:
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1011  		return -EINVAL;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1012  	}
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1013  
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1014  	/* When no storage provided return number of available values */
1fbd9029c8d5cc Andy Shevchenko   2023-03-24  1015  	return val ? 0 : 1;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1016  }
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1017  

:::::: The code at line 985 was first introduced by commit
:::::: b31384fa5de37a100507751dfb5c0a49d06cee67 Driver core: Unified device properties interface for platform firmware

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
