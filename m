Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A3E555
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586027; cv=none; b=fCoiVqE3W4YowKGrFM8gxFYaiOpgXkEeuJWZerai4xaeJfbOFY2K8VWagSb9E4CvdH7JYZL1aBARuUn3tuDzoyeR6/jQBjUMl7dObb57Kr/gGa9RTxuikYkxm+fn1xbJPVU0+1+5a+CPauYdoZ5IC2Gs/smltgqPSgk90JNbwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586027; c=relaxed/simple;
	bh=Ig0zz7dGi7wTjwVgT81OcMaLXuxG/sVAoe272we7ORw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQ8a8GPZuiob0MXe0Gw8FNurYasTJFmU5hwwgAeRU3GiBNTUwphiNWRUlGTzDZiNWPzywfRPbJKONcx5J2mrYxOdvyJolprpliCuoQbFvhQeJzCIQRkFrPd7jcbPPCkEWncakk21mcgBHhWKiW1sOCOpCGV7lAPYOpxmqUk14qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYu5XAES; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYu5XAES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586025; x=1797122025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ig0zz7dGi7wTjwVgT81OcMaLXuxG/sVAoe272we7ORw=;
  b=XYu5XAESp5GNcZ3tmOk7yeshvRWH68XW1nmUG3DaEOYifcKHFgzxhXrN
   QEo5MeIVlNWr+4bgh6DLdcZznN/RTHH/iLf25wKr4vsKsM9sHhmG3183n
   Ozfv3KgBSGmvlaxhBJZSuRmj0OC7LCb1BlPuyg+7sixFn7gJwUX0Pi0hn
   buwBwblkUs8D7au1FGILuT9xf0W08iYvAXWbIsAKDl7eecUFxwgkj4zgL
   1VUsx6/vFl6pVtGtCR6w/tkxQPTbyhUBsf/yo9LXt75d8buJV2++IZx19
   zPaaZPRHiYzyzxx82/438K3wmiTQBLhAvEGYGuqP4ZK6FgKxfamX4Q6Jo
   A==;
X-CSE-ConnectionGUID: X/06xhUhTG6yWOo+3DVvZg==
X-CSE-MsgGUID: y35bcNrPRvW2kaRRWJ7JgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66581149"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66581149"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:33:44 -0800
X-CSE-ConnectionGUID: ZWd7jSr3SyaeT3dEcAjwXw==
X-CSE-MsgGUID: wosIsOmcR3C8oUKTVuaYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197718301"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 16:33:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDZt-000000006pl-1ZKR;
	Sat, 13 Dec 2025 00:33:41 +0000
Date: Sat, 13 Dec 2025 08:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/light/veml6030.c:479 veml6030_read_persistence() error:
 uninitialized symbol 'y'.
Message-ID: <202512130855.lVoURL3r-lkp@intel.com>
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
TO: Javier Carrasco <javier.carrasco.cruz@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 22eaca4283b216f5e1f7721e4ad0ecb3d23c6774 iio: light: veml6030: fix scale to conform to ABI
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130855.lVoURL3r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130855.lVoURL3r-lkp@intel.com/

New smatch warnings:
drivers/iio/light/veml6030.c:479 veml6030_read_persistence() error: uninitialized symbol 'y'.

Old smatch warnings:
drivers/iio/light/veml6030.c:498 veml6030_write_persistence() error: uninitialized symbol 'y'.
drivers/iio/light/veml6030.c:501 veml6030_write_persistence() error: uninitialized symbol 'y'.
drivers/iio/light/veml6030.c:503 veml6030_write_persistence() error: uninitialized symbol 'y'.
drivers/iio/light/veml6030.c:505 veml6030_write_persistence() error: uninitialized symbol 'y'.

vim +/y +479 drivers/iio/light/veml6030.c

7b779f573c48e1 Rishi Gupta     2019-11-04  461  
7b779f573c48e1 Rishi Gupta     2019-11-04  462  static int veml6030_read_persistence(struct iio_dev *indio_dev,
7b779f573c48e1 Rishi Gupta     2019-11-04  463  						int *val, int *val2)
7b779f573c48e1 Rishi Gupta     2019-11-04  464  {
7b779f573c48e1 Rishi Gupta     2019-11-04  465  	int ret, reg, period, x, y;
7b779f573c48e1 Rishi Gupta     2019-11-04  466  	struct veml6030_data *data = iio_priv(indio_dev);
7b779f573c48e1 Rishi Gupta     2019-11-04  467  
22eaca4283b216 Javier Carrasco 2025-01-27  468  	ret = veml6030_get_it(data, &x, &y);
7b779f573c48e1 Rishi Gupta     2019-11-04  469  	if (ret < 0)
7b779f573c48e1 Rishi Gupta     2019-11-04  470  		return ret;
7b779f573c48e1 Rishi Gupta     2019-11-04  471  
7b779f573c48e1 Rishi Gupta     2019-11-04  472  	ret = regmap_read(data->regmap, VEML6030_REG_ALS_CONF, &reg);
7b779f573c48e1 Rishi Gupta     2019-11-04  473  	if (ret) {
7b779f573c48e1 Rishi Gupta     2019-11-04  474  		dev_err(&data->client->dev,
7b779f573c48e1 Rishi Gupta     2019-11-04  475  				"can't read als conf register %d\n", ret);
7b779f573c48e1 Rishi Gupta     2019-11-04  476  	}
7b779f573c48e1 Rishi Gupta     2019-11-04  477  
7b779f573c48e1 Rishi Gupta     2019-11-04  478  	/* integration time multiplied by 1/2/4/8 */
7b779f573c48e1 Rishi Gupta     2019-11-04 @479  	period = y * (1 << ((reg >> 4) & 0x03));
7b779f573c48e1 Rishi Gupta     2019-11-04  480  
7b779f573c48e1 Rishi Gupta     2019-11-04  481  	*val = period / 1000000;
7b779f573c48e1 Rishi Gupta     2019-11-04  482  	*val2 = period % 1000000;
7b779f573c48e1 Rishi Gupta     2019-11-04  483  
7b779f573c48e1 Rishi Gupta     2019-11-04  484  	return IIO_VAL_INT_PLUS_MICRO;
7b779f573c48e1 Rishi Gupta     2019-11-04  485  }
7b779f573c48e1 Rishi Gupta     2019-11-04  486  

:::::: The code at line 479 was first introduced by commit
:::::: 7b779f573c48e1ad6da1d6ea5f181f3ecd666bf6 iio: light: add driver for veml6030 ambient light sensor

:::::: TO: Rishi Gupta <gupt21@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
