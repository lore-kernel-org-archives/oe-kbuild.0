Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17505450FA
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695075409; x=1726611409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kf0BGKrx9piXHyLi+U732uLAOro8M8D0oB0j2YmOeZ4=;
  b=h3TbpIP5yQ+V6ExfwIc4ricrD4g/hZNp6tkivbn1PdJuxNhM2uT9ZWza
   e3XaM8dzYZxg4Xz0abzry09fiWWrkJouN7wm+P73c0YCMW+FTLUXs5b7i
   4+C1zlR61v28NawPlNKQOlvjK2f/Fw+yPoxdSwSSzzuJYKdQxmL5O9UeP
   EZX2wAj/2SfmWfZgYbnGenCd+ZDGrbSgmE9W1EBRAAhRxlbs1or/OzoUS
   hUNSdIbgRT4rOxQviXrT78/lIkiR2QDcjDvZptAH/Plm8ycqpk3VNv9/F
   UAnVIZ1Cw4yfdICRwmoIX9onkpwSzD0pygTc4n7zVJtQv+7p1+VxdMyxv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370109149"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="370109149"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 15:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="749198361"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="749198361"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Sep 2023 15:00:53 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiMIV-0006Yu-07;
	Mon, 18 Sep 2023 22:00:51 +0000
Date: Tue, 19 Sep 2023 06:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202309190520.8GFDnhaY-lkp@intel.com>
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
In-Reply-To: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
References: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.6-rc2]
[cannot apply to next-20230918 next-20230918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-umin-a-b-and-umax-a-b/20230918-162441
base:   linux/master
patch link:    https://lore.kernel.org/r/fe7e6c542e094bfca655abcd323c1c98%40AcuMS.aculab.com
patch subject: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-062-20230919 (https://download.01.org/0day-ci/archive/20230919/202309190520.8GFDnhaY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190520.8GFDnhaY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309190520.8GFDnhaY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion
--
>> arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion
>> arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
