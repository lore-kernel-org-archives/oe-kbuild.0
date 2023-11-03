Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6F17725
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jG2WUAX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699032985; x=1730568985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CsiOYE4pqRTR5KJqVatjhq3UXq6HBMTfEHtgONFSf8Q=;
  b=jG2WUAX/bkG6cbL0DGPbYFCI7hc87y+/1YRqXMYD6V7/U+knBuk7YJyZ
   V/NGwUTUv4HUOqXhVBlTng9RV6S3RnOpP4BPgXIaQcywaxkSEegkSgCE3
   gGGXIGf1DlLuFKpbeoYvzaJ1sPw0A25ARG3gWdZY4A3Yy+j5eZ6qnFyoh
   qVp/z1lTOvuI7DIqq9GUtewSjEqpPas6rTsNOP8ArJFKRAQebDtgcfLR7
   /KB0KzgB3kMVg3/hB5tOC0MrBA6N5UzBQDSWnkHThAtQ+9a4tjPH7r2NI
   SBUU8vDwsKO/8OuL0pQLGAiEY1FLMXtYEM029PaeKJFrcTPmtz3XVg7c4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387879589"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="387879589"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 10:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738138409"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738138409"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 10:36:10 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyy5X-0002lg-13;
	Fri, 03 Nov 2023 17:36:07 +0000
Date: Sat, 4 Nov 2023 01:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token
 expansion
Message-ID: <202311040130.AKxgzw9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 minmax: allow min()/max()/clamp() if the arguments have the same signedness.
date:   2 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-123-20231101 (https://download.01.org/0day-ci/archive/20231104/202311040130.AKxgzw9t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040130.AKxgzw9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311040130.AKxgzw9t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion

vim +609 drivers/hwmon/adm1026.c

7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  580  
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  581  static ssize_t in16_show(struct device *dev, struct device_attribute *attr,
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  582  			 char *buf)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  583  {
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  584  	struct adm1026_data *data = adm1026_update_device(dev);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  585  	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in[16]) -
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  586  		NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  587  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  588  static ssize_t in16_min_show(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  589  			     struct device_attribute *attr, char *buf)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  590  {
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  591  	struct adm1026_data *data = adm1026_update_device(dev);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  592  	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_min[16])
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  593  		- NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  594  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  595  static ssize_t in16_min_store(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  596  			      struct device_attribute *attr, const char *buf,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  597  			      size_t count)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  598  {
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  599  	struct adm1026_data *data = dev_get_drvdata(dev);
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  600  	struct i2c_client *client = data->client;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  601  	long val;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  602  	int err;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  603  
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  604  	err = kstrtol(buf, 10, &val);
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  605  	if (err)
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  606  		return err;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  607  
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  608  	mutex_lock(&data->update_lock);
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03 @609  	data->in_min[16] = INS_TO_REG(16,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  610  				      clamp_val(val, INT_MIN,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  611  						INT_MAX - NEG12_OFFSET) +
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  612  				      NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  613  	adm1026_write_value(client, ADM1026_REG_IN_MIN[16], data->in_min[16]);
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  614  	mutex_unlock(&data->update_lock);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  615  	return count;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  616  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  617  static ssize_t in16_max_show(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  618  			     struct device_attribute *attr, char *buf)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  619  {
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  620  	struct adm1026_data *data = adm1026_update_device(dev);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  621  	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_max[16])
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  622  			- NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  623  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  624  static ssize_t in16_max_store(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  625  			      struct device_attribute *attr, const char *buf,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  626  			      size_t count)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  627  {
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  628  	struct adm1026_data *data = dev_get_drvdata(dev);
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  629  	struct i2c_client *client = data->client;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  630  	long val;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  631  	int err;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  632  
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  633  	err = kstrtol(buf, 10, &val);
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  634  	if (err)
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  635  		return err;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  636  
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  637  	mutex_lock(&data->update_lock);
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  638  	data->in_max[16] = INS_TO_REG(16,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  639  				      clamp_val(val, INT_MIN,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  640  						INT_MAX - NEG12_OFFSET) +
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  641  				      NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  642  	adm1026_write_value(client, ADM1026_REG_IN_MAX[16], data->in_max[16]);
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  643  	mutex_unlock(&data->update_lock);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  644  	return count;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  645  }
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  646  

:::::: The code at line 609 was first introduced by commit
:::::: f1b9baa99bd98f83e8601e5cfd3bd28027a6f5a8 hwmon: (adm1026) Fix overflows seen when writing into limit attributes

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
