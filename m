Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD60219EB
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870751; cv=none; b=ixLu1pb4NMXsbp/n8Hv5lmMbxiInYsKiJrd5up/Ta5FE3NB/c6ZDnpVpvdPjAKdd2o4UEIB6jt6U6Trf7gz0Lmjk2vmUa2s9q++hfpTxx8NbL8VwBsn4icLRsL51mw7H6i0PfyZM3s12H3HNxA0VTsu13dBU3XgrOxiLQDsLjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870751; c=relaxed/simple;
	bh=wzVipjgkBbufU/VAcni4ervRv2XD4IBenKhbWUhyHmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNWd5bKh5euqbWr1v6/Tl8YOsDmEf6qhZ1OrFP2WUEMS+NSgeOp0hY040kf5P9nq3NGqm5FTL6KdTi0t8AFb1FnZx/eyNWHzg+27vSj9oXSva7QNTzD9HisgeS0N+GqC5M7/FFiXTB9O0bmsWG+chk+tgdQ7P1CWisvVgUfH90Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDC6b/r0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDC6b/r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766870750; x=1798406750;
  h=date:from:to:cc:subject:message-id;
  bh=wzVipjgkBbufU/VAcni4ervRv2XD4IBenKhbWUhyHmg=;
  b=ZDC6b/r0/XaeHCMfoD+JPoFtmlhWdH6k/nwHQghF5dmBtHV/LezC5hXg
   iulhaID2DDahFx22K2RSZNc5ICTtz2eJDmBP86DbGeHQv3Ot0fSuiCYdX
   INhnyVK1tR2K7cihXVVH7A9M1ALBANzFwNXaRceF4Mp+bckR+T09CFE2y
   YuoVa3+oAgUko7GQICoRyO0cP7Rn7NSagvdrExjdjlLSFTLdrukigSTvO
   ANMX0QgDlCKI5Pi3vjTs5/A2sAUqAe2Hxmn/5NU1SVBkbd415Fvxh8FMv
   zji5AjF2GHh5VfG/A0K45Cx+yQ1EOn8uvd8J3nRRPvxkO5W49ozbTHKMN
   w==;
X-CSE-ConnectionGUID: SF2RTqXqRfOZHl7H9+DWww==
X-CSE-MsgGUID: p2AIux+DTwWPX9vn4Qh1mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="85974142"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="85974142"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 13:25:49 -0800
X-CSE-ConnectionGUID: r3Ddeh+0SBiIYowKIl3++Q==
X-CSE-MsgGUID: hEv15UsrRrG8s4JdE1fpxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="205522478"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Dec 2025 13:25:47 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZbnF-0000000065Z-2OuD;
	Sat, 27 Dec 2025 21:25:45 +0000
Date: Sun, 28 Dec 2025 05:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 56/65] drivers/iio/adc/ad4062.c:806
 ad4062_sizeof_storagebits() error: 'scan_type' dereferencing possible
 ERR_PTR()
Message-ID: <202512280539.AholFF7m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jorge Marques <jorge.marques@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   cdffe36e1cf26b53250ed99d70c71c34ff5d4ac5
commit: 26e26d404918dbe6ae2c04b68f59b07364e77974 [56/65] iio: adc: ad4062: Add IIO Trigger support
:::::: branch date: 3 hours ago
:::::: commit date: 5 hours ago
config: csky-randconfig-r071-20251228 (https://download.01.org/0day-ci/archive/20251228/202512280539.AholFF7m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512280539.AholFF7m-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4062.c:806 ad4062_sizeof_storagebits() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +806 drivers/iio/adc/ad4062.c

f752ac3ab77fca Jorge Marques 2025-12-17  796  
26e26d404918db Jorge Marques 2025-12-17  797  /*
26e26d404918db Jorge Marques 2025-12-17  798   * The AD4062 in burst averaging mode increases realbits from 16-bits to
26e26d404918db Jorge Marques 2025-12-17  799   * 20-bits, increasing the storagebits from 16-bits to 32-bits.
26e26d404918db Jorge Marques 2025-12-17  800   */
26e26d404918db Jorge Marques 2025-12-17  801  static inline size_t ad4062_sizeof_storagebits(struct ad4062_state *st)
26e26d404918db Jorge Marques 2025-12-17  802  {
26e26d404918db Jorge Marques 2025-12-17  803  	const struct iio_scan_type *scan_type =
26e26d404918db Jorge Marques 2025-12-17  804  		iio_get_current_scan_type(st->indio_dev, st->chip->channels);
26e26d404918db Jorge Marques 2025-12-17  805  
26e26d404918db Jorge Marques 2025-12-17 @806  	return BITS_TO_BYTES(scan_type->storagebits);
26e26d404918db Jorge Marques 2025-12-17  807  }
26e26d404918db Jorge Marques 2025-12-17  808  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
