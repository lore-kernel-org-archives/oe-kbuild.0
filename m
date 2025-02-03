Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF13D97A
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 03:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738554026; cv=none; b=n03uiAasSg0RRrq+LopDrDypQUF24l1Qyb/cqWW1lO62iPINRq7WpyF92ftrcAmeeO5cbtUDwzDhSn7zjTKe3YGDxr7ObtEIHXmQGCWocrg6cr30GySWE/ksMFkTjmDxE8TvCg8crMAsQWQtbzOugL4WF0Tb5apnWONCgX7iUKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738554026; c=relaxed/simple;
	bh=agtym3u7Z3zIVLhlRgmwKsTUzgICFWNGOsiX1kaGqZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpPvlhshFCTsNKnd+4UdWsF4L5b25Iy5IXfr5ZXTKiWPa9vlc7wFfP5wS1YABOxpDBZLyK+/UkIOQA6fQuCELCuEWzvpnNJog4vnxyVhCXs+9ciog3gzns2s2xrquL6BzVe2fqCnuic0hjC5eeytl3sd6wGC2sqAaIDYUDrkUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaTx8rWH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaTx8rWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738554023; x=1770090023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agtym3u7Z3zIVLhlRgmwKsTUzgICFWNGOsiX1kaGqZQ=;
  b=ZaTx8rWHnUcgPRyKat9zzYT2T5/bYX5peVzpNXwLkqICfBpLoSS6V7NY
   ctEWZltVhd9fv9VPcOOkWyfcRWhzdRF2wAF8tx21Remt3Qx9Z4FibN1La
   z3TanWTzzGGH7LzdH1tnyelMHQ9GuaCX95QU7Ja4NxrCm8YyH5C6+SF0H
   +rXMQwoQR586ax7FS2dsQvV8T6BBdSh+hLw1ichKSC/Hr/wPZvHHyBxRf
   wYVfZbhEfM/HMMqZ5CLR6b21pB6cuxix4sMqF7WjZuuVK5AYWofEdcxrp
   l1hNcEgBAe4ZwzeMWfbVq6OR6OZOQ3XwItad9x/kSVl2fcmrSTa9vpjDH
   Q==;
X-CSE-ConnectionGUID: dM7uoiJaQdm4zLVcStZzJw==
X-CSE-MsgGUID: ON+WujmOSd6syijlMPkR0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38941992"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38941992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 19:40:23 -0800
X-CSE-ConnectionGUID: ZP7i/WJhTQSMtDwth3WdyA==
X-CSE-MsgGUID: 9w8UEZPoR2+rmii+JtviDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110070616"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Feb 2025 19:40:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tenJr-000qSF-1I;
	Mon, 03 Feb 2025 03:40:19 +0000
Date: Mon, 3 Feb 2025 11:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:sparse-friendly-direct-mode 52/166]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1863 st_lsm6dsx_write_raw()
 error: uninitialized symbol 'err'.
Message-ID: <202502031102.at6cwiup-lkp@intel.com>
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
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git sparse-friendly-direct-mode
head:   bada9cd0235b288b74ee2bd65fd4223d71f62b02
commit: 3e53e337047467484ef3689555b5fe392679790b [52/166] iio: imu: st_lsm6dsx: Switch to sparse friendly claim/release_direct()
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-161-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031102.at6cwiup-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502031102.at6cwiup-lkp@intel.com/

smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1863 st_lsm6dsx_write_raw() error: uninitialized symbol 'err'.

vim +/err +1863 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

290a6ce11d938b Lorenzo Bianconi 2017-01-10  1830  
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1831  static int st_lsm6dsx_write_raw(struct iio_dev *iio_dev,
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1832  				struct iio_chan_spec const *chan,
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1833  				int val, int val2, long mask)
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1834  {
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1835  	struct st_lsm6dsx_sensor *sensor = iio_priv(iio_dev);
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1836  	int err;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1837  
3e53e337047467 Jonathan Cameron 2025-01-05  1838  	if (!iio_device_claim_direct(iio_dev))
3e53e337047467 Jonathan Cameron 2025-01-05  1839  		return -EBUSY;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1840  
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1841  	switch (mask) {
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1842  	case IIO_CHAN_INFO_SCALE:
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1843  		err = st_lsm6dsx_set_full_scale(sensor, val2);
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1844  		break;
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1845  	case IIO_CHAN_INFO_SAMP_FREQ: {
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1846  		u8 data;
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1847  
f8710f0357bc36 Lorenzo Bianconi 2019-11-03  1848  		val = val * 1000 + val2 / 1000;
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1849  		val = st_lsm6dsx_check_odr(sensor, val, &data);
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1850  		if (val < 0)
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1851  			err = val;
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1852  		else
5e3c3e3382e87a Lorenzo Bianconi 2017-09-18  1853  			sensor->odr = val;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1854  		break;
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1855  	}
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1856  	default:
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1857  		err = -EINVAL;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1858  		break;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1859  	}
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1860  
3e53e337047467 Jonathan Cameron 2025-01-05  1861  	iio_device_release_direct(iio_dev);
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1862  
290a6ce11d938b Lorenzo Bianconi 2017-01-10 @1863  	return err;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1864  }
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1865  

:::::: The code at line 1863 was first introduced by commit
:::::: 290a6ce11d938be52634b3ce1bbc6b78be4d23c1 iio: imu: add support to lsm6dsx driver

:::::: TO: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
