Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF020288B1
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740896728; cv=none; b=d6QeEuHcOXWI5I2LwmwC1N4hGAGttKkZuaMkeyRLW/B5zUi2o8mod64Q2hvQLGXE162Qi6JXlkkc43JB6n4xTpwy+wk0BurJoKwKcMI4zQHVIse+o4ZB5jhpSAMpXWYPhMm4PqSJ2XGOHgE/YrRRhc8Q7sodgvejfmWhb1JD2fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740896728; c=relaxed/simple;
	bh=siVLFuOfP80d8T5ilG0fCu/JSkBS0+WAMnPcTEL+CSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaK/+hkH6JXV+nlTVKEfxr6v8533a5Y74ROnggSxf/NpO1fW+rllcoHwL0d5KTG6u/ZxUWFSRttmrB0sB53n0Xy/D98Rl78nzyj/AzyBFejimSU8q067sWxKlwk+KznQNcnX/6hQlRXDon/AEPxJbz+2HyaihhdGAs/Wngab2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKiq85lu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKiq85lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740896726; x=1772432726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=siVLFuOfP80d8T5ilG0fCu/JSkBS0+WAMnPcTEL+CSI=;
  b=UKiq85luX/JoZqRhKj+yNxC18aW0sThaFK7WPQRTicytVtM5dB2ZY4s7
   5HPt+1v2f0hzoI+ujAZ87FJE9oTaqwwIQ5zfX9eSZD20ocS+BUWJhxWy7
   Ki4bq6S5eUdow/hHae3RpydCXNKCIVHWHmJ0823sy2D1xafVU8shBYm3+
   o+7+TRYd/RaiyI0hSwdnOO/sDcgXoumTQgwXufCWYINGJuNr0S6lBE0IZ
   8viB4mAKXhdDfaBvvG0imnFVZUEe2NuqVK+Avu+4ncLzpgSgOLiyVwHGW
   0KmxrKDZNqvX1KGPXrpMRNNukACNiz1D4n1GVrOmT5xbw3xl3xlw8lxWp
   A==;
X-CSE-ConnectionGUID: spIgQibmQYuz69s7VpvdMg==
X-CSE-MsgGUID: hh7KHX6zS4ygEy2AxPvaWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59330179"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="59330179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 22:25:25 -0800
X-CSE-ConnectionGUID: UIncJ2M5T0KDgdX6buXRwA==
X-CSE-MsgGUID: c+kzB8LmQeaUH0lp2NkO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117489573"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2025 22:25:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toclN-000H7q-2F;
	Sun, 02 Mar 2025 06:25:21 +0000
Date: Sun, 2 Mar 2025 14:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 82/172] drivers/iio/adc/ad4851.c:581:6-7:
 WARNING: Unsigned expression compared with zero: c < 0
Message-ID: <202503021430.iImts3C4-lkp@intel.com>
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
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   bd9ffb54e566ad6f94ec4293f82f06d417b6cfc8
commit: 6250803fe2ec92be32a4df1c3a39c4a460d5bd58 [82/172] iio: adc: ad4851: add ad485x driver
:::::: branch date: 27 hours ago
:::::: commit date: 2 weeks ago
config: m68k-randconfig-r064-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021430.iImts3C4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503021430.iImts3C4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad4851.c:581:6-7: WARNING: Unsigned expression compared with zero: c < 0

vim +581 drivers/iio/adc/ad4851.c

6250803fe2ec92 Antoniu Miclaus 2025-02-14  491  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  492  static int ad4851_calibrate(struct iio_dev *indio_dev)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  493  {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  494  	struct ad4851_state *st = iio_priv(indio_dev);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  495  	unsigned int opt_delay, num_lanes, delay, i, s, c;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  496  	enum iio_backend_interface_type interface_type;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  497  	DECLARE_BITMAP(pn_status, AD4851_MAX_LANES * AD4851_MAX_IODELAY);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  498  	bool status;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  499  	int ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  500  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  501  	ret = iio_backend_interface_type_get(st->back, &interface_type);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  502  	if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  503  		return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  504  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  505  	switch (interface_type) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  506  	case IIO_BACKEND_INTERFACE_SERIAL_CMOS:
6250803fe2ec92 Antoniu Miclaus 2025-02-14  507  		num_lanes = indio_dev->num_channels;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  508  		break;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  509  	case IIO_BACKEND_INTERFACE_SERIAL_LVDS:
6250803fe2ec92 Antoniu Miclaus 2025-02-14  510  		num_lanes = 1;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  511  		break;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  512  	default:
6250803fe2ec92 Antoniu Miclaus 2025-02-14  513  		return -EINVAL;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  514  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  515  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  516  	if (st->info->resolution == 16) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  517  		ret = iio_backend_data_size_set(st->back, 24);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  518  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  519  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  520  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  521  		ret = regmap_write(st->regmap, AD4851_REG_PACKET,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  522  				   AD4851_TEST_PAT | AD4857_PACKET_SIZE_24);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  523  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  524  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  525  	} else {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  526  		ret = iio_backend_data_size_set(st->back, 32);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  527  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  528  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  529  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  530  		ret = regmap_write(st->regmap, AD4851_REG_PACKET,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  531  				   AD4851_TEST_PAT | AD4858_PACKET_SIZE_32);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  532  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  533  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  534  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  535  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  536  	for (i = 0; i < indio_dev->num_channels; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  537  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_0(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  538  				   AD4851_TESTPAT_0_DEFAULT);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  539  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  540  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  541  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  542  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_1(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  543  				   AD4851_TESTPAT_1_DEFAULT);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  544  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  545  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  546  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  547  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_2(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  548  				   AD4851_TESTPAT_2_DEFAULT);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  549  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  550  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  551  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  552  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_3(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  553  				   AD4851_TESTPAT_3_DEFAULT(i));
6250803fe2ec92 Antoniu Miclaus 2025-02-14  554  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  555  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  556  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  557  		ret = iio_backend_chan_enable(st->back,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  558  					      indio_dev->channels[i].channel);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  559  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  560  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  561  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  562  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  563  	for (i = 0; i < num_lanes; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  564  		for (delay = 0; delay < AD4851_MAX_IODELAY; delay++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  565  			ret = iio_backend_iodelay_set(st->back, i, delay);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  566  			if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  567  				return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  568  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  569  			ret = iio_backend_chan_status(st->back, i, &status);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  570  			if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  571  				return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  572  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  573  			__assign_bit(i * AD4851_MAX_IODELAY + delay, pn_status,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  574  				     status);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  575  		}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  576  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  577  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  578  	for (i = 0; i < num_lanes; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  579  		c = ad4851_find_opt(pn_status, i * AD4851_MAX_IODELAY,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  580  				    AD4851_MAX_IODELAY, &s);
6250803fe2ec92 Antoniu Miclaus 2025-02-14 @581  		if (c < 0)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  582  			return c;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  583  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  584  		opt_delay = s + c / 2;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  585  		ret = iio_backend_iodelay_set(st->back, i, opt_delay);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  586  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  587  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  588  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  589  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  590  	for (i = 0; i < indio_dev->num_channels; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  591  		ret = iio_backend_chan_disable(st->back, i);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  592  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  593  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  594  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  595  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  596  	ret = iio_backend_data_size_set(st->back, 20);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  597  	if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  598  		return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  599  
6250803fe2ec92 Antoniu Miclaus 2025-02-14  600  	return regmap_write(st->regmap, AD4851_REG_PACKET, 0);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  601  }
6250803fe2ec92 Antoniu Miclaus 2025-02-14  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
