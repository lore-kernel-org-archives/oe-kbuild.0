Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16C1FAD
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177955; x=1711713955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1537JRVzwhQ5jMtzVnY9Oq0PLmz80snbXaAzJbioDxE=;
  b=TurncRX3x50me0uYNMXKT0/ll81kD2z57d/qObTlG1ucR4kPZmhMGcfT
   6M4scohrO+CI+Uk61gJ34TkbX1PFJyKABLtid4docqaxoXsVexgsxeC/h
   mFg0zdUa0fOzOEnjzroDiOro8buNkqzlb2pKlR61BCnbmW89owsPU+bpi
   bdu+scoynkC3fzvMDA66q5wz5FrfR6uyGUQc31VGVTJ8YDeiLIhW+jbLb
   u48N1woIFIGmZtqChhcTh8NRrdu27f3ejXpQdqrDsP/zSWLG961mWNPu7
   CmPAmHF3+rSYwOc/aNeegUKQ09aic/dR/TKq8KVscEtBxb6//g1b3zp+N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342761047"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="342761047"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 05:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795650786"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="795650786"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 05:05:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phr2O-000KpO-0j;
	Thu, 30 Mar 2023 12:05:52 +0000
Date: Thu, 30 Mar 2023 20:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6622/7844] drivers/acpi/property.c:985
 acpi_data_prop_read_single() error: potentially dereferencing uninitialized
 'obj'.
Message-ID: <202303302002.HioKm3ro-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Hi Andy,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6d9e3034536ba4b68ac34490c02267e6eec9c05
commit: 1fbd9029c8d5ccd3de49cb0f5382cffc7444a32b [6622/7844] ACPI: property: Refactor acpi_data_prop_read_single()
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230330/202303302002.HioKm3ro-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303302002.HioKm3ro-lkp@intel.com/

New smatch warnings:
drivers/acpi/property.c:985 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.

Old smatch warnings:
drivers/acpi/property.c:991 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.
drivers/acpi/property.c:997 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.
drivers/acpi/property.c:1004 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.

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
https://github.com/intel/lkp-tests
