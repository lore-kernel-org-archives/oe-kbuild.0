Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013533E9
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679844586; x=1711380586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjTiilvxNTWHU0XHo4gblgsMdtDspZhCbCGJVrSwPew=;
  b=i9M+yZgquTNqdXfCRTLUJzJKTlW9wehNVwTfZNpOVx1Q9nTZf3IdFW1c
   RXYfJjzxVVZW+hUiH2JFFAEJ+fDHiabnkWMzfV8MpmuiW1kdUiwsTndF+
   ZM3otwAi7sCb3qjC60uyMbYftinLGMH2ou//wIFgQEy0d5decRsT3tSba
   Qh6FKFtctJZqC7kom+zKEDD4Y26nI/FtcpQChQ3jEiicBQK12LQjQmV/c
   3MldH2YKZwTwDgwLIuvU7NtyBNOsYy6RkqJzUgYzBTt0jP7Aj9yiPeVKj
   mUVDf3beauWoOZ/xn+oq7nDkUQd80mpg8AoygxTrVOlRhCi4EeB7W1goC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426358841"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="426358841"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 08:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="683196195"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="683196195"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Mar 2023 08:29:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgSJU-000HD1-0N;
	Sun, 26 Mar 2023 15:29:44 +0000
Date: Sun, 26 Mar 2023 23:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 1/1] ACPI: property: Refactor
 acpi_data_prop_read_single()
Message-ID: <202303262312.a3ISTjXP-lkp@intel.com>
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
In-Reply-To: <20230324114146.4037-1-andriy.shevchenko@linux.intel.com>
References: <20230324114146.4037-1-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: linux-acpi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Len Brown <lenb@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on sailus-media-tree/streams linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ACPI-property-Refactor-acpi_data_prop_read_single/20230324-194227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230324114146.4037-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] ACPI: property: Refactor acpi_data_prop_read_single()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230326/202303262312.a3ISTjXP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303262312.a3ISTjXP-lkp@intel.com/

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
b7de12063ff88b Andy Shevchenko   2023-03-24   974  	int ret = 0;
b31384fa5de37a Rafael J. Wysocki 2014-11-04   975  
b7de12063ff88b Andy Shevchenko   2023-03-24   976  	if (proptype >= DEV_PROP_U8 && proptype <= DEV_PROP_U64)
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27   977  		ret = acpi_data_get_property(data, propname, ACPI_TYPE_INTEGER, &obj);
b7de12063ff88b Andy Shevchenko   2023-03-24   978  	else if (proptype == DEV_PROP_STRING)
b7de12063ff88b Andy Shevchenko   2023-03-24   979  		ret = acpi_data_get_property(data, propname, ACPI_TYPE_STRING, &obj);
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
b7de12063ff88b Andy Shevchenko   2023-03-24  1002  	case DEV_PROP_U64:
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1003  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1004  			*(u64 *)val = obj->integer.value;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1005  		break;
b7de12063ff88b Andy Shevchenko   2023-03-24  1006  	case DEV_PROP_STRING:
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1007  		if (val)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1008  			*(char **)val = obj->string.pointer;
b0b027cee090a1 Sakari Ailus      2017-03-28  1009  		return 1;
b7de12063ff88b Andy Shevchenko   2023-03-24  1010  	default:
b7de12063ff88b Andy Shevchenko   2023-03-24  1011  		return -EINVAL;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1012  	}
b7de12063ff88b Andy Shevchenko   2023-03-24  1013  
b7de12063ff88b Andy Shevchenko   2023-03-24  1014  	/* When no storage provided return number of available values */
b7de12063ff88b Andy Shevchenko   2023-03-24  1015  	return val ? 0 : 1;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1016  }
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
