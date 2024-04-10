Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02383E48C
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 23:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712792398; cv=none; b=t7u4kGvvGuCR5TvfUwrsK2LZ8o5DzKaBUVfF0upAZxZNqMGvRhF/11FxZJlGCcYNaCJWetydlLHFLGX7AgUdIZGC8zdeJIhRl6ui/CpQZNKoJUTc9JeQIPEyk4ufM1fJqYQHJ83mewE4gtKclAWskwFhLq6nR+SXAPN2PfpXDHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712792398; c=relaxed/simple;
	bh=+LmjgOo0YEJB5lCLEzNtroj0o714xdk4YrpERAPnsjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gpKc+XdI2uPC3aK/XeexV89G/mZqf0J7C9Ml1v1byWhcwG1ppIIQs8Ko+kLfC7zBvWm8ch2Anmly84oKB/cOCTF8kSBcFs8B0+RtaH+GmEYIjfMjbIi8H2uUpwsdx9PmWpOvX3G6K9t7ZdedLCWxxNofuTnTYndtrKI6aU14ReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hc4KzZwz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hc4KzZwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712792396; x=1744328396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LmjgOo0YEJB5lCLEzNtroj0o714xdk4YrpERAPnsjg=;
  b=hc4KzZwzDRNZHTKOfhDM1mAHQho/7RjEYy4mYVOaro0wUsoLsHr9n1o0
   ToZc5lV7hCSbQbHKPaZpb90ivCxkolLHHP2e0j6X6pIAVb76iRPms7W1X
   47yLK0jZvKAvcYzukSKg4RyLKal0r97qIp2ZgffXw6Mg5fJSVvGFt0Arm
   1oo8v4j4sBe40quDyC64kbdTcWqkxRHjZTMXD4A0HTA4nVVPFtKLsNLaF
   cidKC26bqlFEcMcwqqSbkgxxbbthI3rGWTr8+n3FQq+/4Ty8iLs7dvQ/q
   KinKLbS1Swpjo/x3q1STj4fkdcqF73xG+TyL5xg1aCY9W2M7ZEoAgNJ3A
   w==;
X-CSE-ConnectionGUID: hkohZkAJS2mNHnzLu8SNAw==
X-CSE-MsgGUID: jVHsEnshT7ytKfsBJI4iSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8047941"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8047941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 16:39:56 -0700
X-CSE-ConnectionGUID: yAQMJAb7QL2Sx8T0yqfxXA==
X-CSE-MsgGUID: KrqnLElORWWUVXIM6iQRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="20799258"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2024 16:39:54 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruhXj-0007xm-1K;
	Wed, 10 Apr 2024 23:39:51 +0000
Date: Thu, 11 Apr 2024 07:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/4] iio: pressure: dps310: introduce consistent error
 handling
Message-ID: <202404110708.7BQYVa7Z-lkp@intel.com>
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
In-Reply-To: <20240410103604.992989-3-thomas.haemmerle@leica-geosystems.com>
References: <20240410103604.992989-3-thomas.haemmerle@leica-geosystems.com>
TO: Thomas Haemmerle <thomas.haemmerle@leica-geosystems.com>
TO: joel@jms.id.au
CC: bsp-development.geo@leica-geosystems.com
CC: Thomas Haemmerle <thomas.haemmerle@leica-geosystems.com>
CC: Eddie James <eajames@linux.ibm.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Haemmerle/iio-pressure-dps310-support-negative-temperature-values/20240410-183937
base:   2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
patch link:    https://lore.kernel.org/r/20240410103604.992989-3-thomas.haemmerle%40leica-geosystems.com
patch subject: [PATCH v2 2/4] iio: pressure: dps310: introduce consistent error handling
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110708.7BQYVa7Z-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404110708.7BQYVa7Z-lkp@intel.com/

smatch warnings:
drivers/iio/pressure/dps310.c:497 dps310_read_pres_raw() warn: inconsistent returns '&data->lock'.
drivers/iio/pressure/dps310.c:541 dps310_read_temp_raw() warn: inconsistent returns '&data->lock'.

vim +497 drivers/iio/pressure/dps310.c

7b4ab4abcea4c0 Eddie James      2022-09-15  465  
d711a3c7dc829c Eddie James      2019-05-20  466  static int dps310_read_pres_raw(struct dps310_data *data)
ba6ec48e76bcd4 Joel Stanley     2019-05-20  467  {
ba6ec48e76bcd4 Joel Stanley     2019-05-20  468  	int rc;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  469  	int rate;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  470  	int timeout;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  471  	s32 raw;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  472  	u8 val[3];
ba6ec48e76bcd4 Joel Stanley     2019-05-20  473  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  474  	if (mutex_lock_interruptible(&data->lock))
ba6ec48e76bcd4 Joel Stanley     2019-05-20  475  		return -EINTR;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  476  
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  477  	rc = dps310_get_pres_samp_freq(data, &rate);
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  478  	if (rc)
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  479  		return rc;
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  480  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  481  	timeout = DPS310_POLL_TIMEOUT_US(rate);
ba6ec48e76bcd4 Joel Stanley     2019-05-20  482  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  483  	/* Poll for sensor readiness; base the timeout upon the sample rate. */
7b4ab4abcea4c0 Eddie James      2022-09-15  484  	rc = dps310_ready(data, DPS310_PRS_RDY, timeout);
d711a3c7dc829c Eddie James      2019-05-20  485  	if (rc)
d711a3c7dc829c Eddie James      2019-05-20  486  		goto done;
d711a3c7dc829c Eddie James      2019-05-20  487  
d711a3c7dc829c Eddie James      2019-05-20  488  	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
ba6ec48e76bcd4 Joel Stanley     2019-05-20  489  	if (rc < 0)
ba6ec48e76bcd4 Joel Stanley     2019-05-20  490  		goto done;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  491  
d711a3c7dc829c Eddie James      2019-05-20  492  	raw = (val[0] << 16) | (val[1] << 8) | val[2];
d711a3c7dc829c Eddie James      2019-05-20  493  	data->pressure_raw = sign_extend32(raw, 23);
d711a3c7dc829c Eddie James      2019-05-20  494  
d711a3c7dc829c Eddie James      2019-05-20  495  done:
d711a3c7dc829c Eddie James      2019-05-20  496  	mutex_unlock(&data->lock);
d711a3c7dc829c Eddie James      2019-05-20 @497  	return rc;
d711a3c7dc829c Eddie James      2019-05-20  498  }
d711a3c7dc829c Eddie James      2019-05-20  499  
d711a3c7dc829c Eddie James      2019-05-20  500  /* Called with lock held */
d711a3c7dc829c Eddie James      2019-05-20  501  static int dps310_read_temp_ready(struct dps310_data *data)
d711a3c7dc829c Eddie James      2019-05-20  502  {
d711a3c7dc829c Eddie James      2019-05-20  503  	int rc;
d711a3c7dc829c Eddie James      2019-05-20  504  	u8 val[3];
d711a3c7dc829c Eddie James      2019-05-20  505  	s32 raw;
d711a3c7dc829c Eddie James      2019-05-20  506  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  507  	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
ba6ec48e76bcd4 Joel Stanley     2019-05-20  508  	if (rc < 0)
d711a3c7dc829c Eddie James      2019-05-20  509  		return rc;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  510  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  511  	raw = (val[0] << 16) | (val[1] << 8) | val[2];
ba6ec48e76bcd4 Joel Stanley     2019-05-20  512  	data->temp_raw = sign_extend32(raw, 23);
ba6ec48e76bcd4 Joel Stanley     2019-05-20  513  
d711a3c7dc829c Eddie James      2019-05-20  514  	return 0;
d711a3c7dc829c Eddie James      2019-05-20  515  }
d711a3c7dc829c Eddie James      2019-05-20  516  
d711a3c7dc829c Eddie James      2019-05-20  517  static int dps310_read_temp_raw(struct dps310_data *data)
d711a3c7dc829c Eddie James      2019-05-20  518  {
d711a3c7dc829c Eddie James      2019-05-20  519  	int rc;
d711a3c7dc829c Eddie James      2019-05-20  520  	int rate;
d711a3c7dc829c Eddie James      2019-05-20  521  	int timeout;
d711a3c7dc829c Eddie James      2019-05-20  522  
d711a3c7dc829c Eddie James      2019-05-20  523  	if (mutex_lock_interruptible(&data->lock))
d711a3c7dc829c Eddie James      2019-05-20  524  		return -EINTR;
d711a3c7dc829c Eddie James      2019-05-20  525  
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  526  	rc = dps310_get_temp_samp_freq(data, &rate);
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  527  	if (rc)
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  528  		return rc;
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  529  
d711a3c7dc829c Eddie James      2019-05-20  530  	timeout = DPS310_POLL_TIMEOUT_US(rate);
d711a3c7dc829c Eddie James      2019-05-20  531  
d711a3c7dc829c Eddie James      2019-05-20  532  	/* Poll for sensor readiness; base the timeout upon the sample rate. */
7b4ab4abcea4c0 Eddie James      2022-09-15  533  	rc = dps310_ready(data, DPS310_TMP_RDY, timeout);
7b4ab4abcea4c0 Eddie James      2022-09-15  534  	if (rc)
d711a3c7dc829c Eddie James      2019-05-20  535  		goto done;
d711a3c7dc829c Eddie James      2019-05-20  536  
d711a3c7dc829c Eddie James      2019-05-20  537  	rc = dps310_read_temp_ready(data);
d711a3c7dc829c Eddie James      2019-05-20  538  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  539  done:
ba6ec48e76bcd4 Joel Stanley     2019-05-20  540  	mutex_unlock(&data->lock);
ba6ec48e76bcd4 Joel Stanley     2019-05-20 @541  	return rc;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  542  }
ba6ec48e76bcd4 Joel Stanley     2019-05-20  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
