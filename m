Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1F222D6B
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Dec 2024 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606305; cv=none; b=GwpjHgXc+Yq0KliPSU2k5HWJSyNfEFRqde4EyMJJDFIaFYeBFdSG64fCc7sOvukKA0w6P2pkk07C/g7mAt+07qfYKZVXkMfZcBM5ovtfgk97qAzYEOefU1EkVa44Scxg4y472XfRyARt2b/GAxgj+kJtUfvtzdbADXzGMzrcUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606305; c=relaxed/simple;
	bh=5rLPKLskZRhbkyF3fDnp5h7z0QePNH8kcFmcZhcghn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p23/kK7gFjXVRhTbYFvt01RpP04zpxrqcFx8xm+d/MgLFad163viwWIkQUfIsIdAdzbUsdRwfR4r+O56kcq2U4EwZWbE8NJkoh3kknzf7bxqoZWGRanoekM+m8CY6NfMou32PjNR3KQ8sDj0Oud5mhMMKGnlvxY3Lg2vo6PNIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ft3ikrs/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ft3ikrs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734606304; x=1766142304;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5rLPKLskZRhbkyF3fDnp5h7z0QePNH8kcFmcZhcghn4=;
  b=ft3ikrs//ydqqJ5ha+27h7uQZ9kDW6cQtqMH8UxfyQRYjpFOOwE46Hbx
   2AmagCmtVpviozLViSn/h90UA4OM8CVrMPtJEWlDQLG+DDdmayR9wn61+
   dz+lFzqqR2oq8TyAIOTrq0zcNnptJyH79PkD12EemK8CYc5yhN5G4xv0G
   2BS0Ikp6P1z+stBz6WADfGTvzv9leGTqNTYPb7GcP31oO1tOd+jsQp4x3
   AcMAGR/IpqmdxR9sqtqfubaJFGbCtpxvS8x9Cp1L5nd25PlDuSXnfWKNR
   tqHexiQuTnyN3vizCYdzPqGFJQK4fu6/SOMjjFr0mo0pWpBf2jnkrePsL
   Q==;
X-CSE-ConnectionGUID: NxcJ6CK2SGiZ9i1KzsrydQ==
X-CSE-MsgGUID: kWyocUcHQ0efYmF8K0WVDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35140008"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35140008"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 03:05:02 -0800
X-CSE-ConnectionGUID: EyD4Y1i+SYyOYY4UlX4uyw==
X-CSE-MsgGUID: wA59PlErR7WuT2ZUrm4dMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103166935"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2024 03:04:58 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOEKu-0000Br-0Y;
	Thu, 19 Dec 2024 11:04:56 +0000
Date: Thu, 19 Dec 2024 19:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] iio: frequency: adf4371: add ref doubler
Message-ID: <202412191811.lAia02sc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241209104201.25205-3-antoniu.miclaus@analog.com>
References: <20241209104201.25205-3-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: jic23@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-pwm@vger.kernel.org
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>

Hi Antoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.13-rc3 next-20241218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/iio-frequency-adf4371-add-differential-ref/20241209-184437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241209104201.25205-3-antoniu.miclaus%40analog.com
patch subject: [PATCH v2 3/3] iio: frequency: adf4371: add ref doubler
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: parisc-randconfig-r073-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191811.lAia02sc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412191811.lAia02sc-lkp@intel.com/

smatch warnings:
drivers/iio/frequency/adf4371.c:545 adf4371_setup() error: uninitialized symbol 'ref_doubler_en'.

vim +/ref_doubler_en +545 drivers/iio/frequency/adf4371.c

7f699bd14913423 Stefan Popa     2019-06-04  486  
7f699bd14913423 Stefan Popa     2019-06-04  487  static int adf4371_setup(struct adf4371_state *st)
7f699bd14913423 Stefan Popa     2019-06-04  488  {
7f699bd14913423 Stefan Popa     2019-06-04  489  	unsigned int synth_timeout = 2, timeout = 1, vco_alc_timeout = 1;
347e385fdd6ecda Antoniu Miclaus 2024-12-09  490  	unsigned int vco_band_div, tmp, ref_doubler_en;
011032df594999f Antoniu Miclaus 2024-12-09  491  	bool ref_diff_en;
7f699bd14913423 Stefan Popa     2019-06-04  492  	int ret;
7f699bd14913423 Stefan Popa     2019-06-04  493  
7f699bd14913423 Stefan Popa     2019-06-04  494  	/* Perform a software reset */
7f699bd14913423 Stefan Popa     2019-06-04  495  	ret = regmap_write(st->regmap, ADF4371_REG(0x0), ADF4371_RESET_CMD);
7f699bd14913423 Stefan Popa     2019-06-04  496  	if (ret < 0)
7f699bd14913423 Stefan Popa     2019-06-04  497  		return ret;
7f699bd14913423 Stefan Popa     2019-06-04  498  
7f699bd14913423 Stefan Popa     2019-06-04  499  	ret = regmap_multi_reg_write(st->regmap, adf4371_reg_defaults,
7f699bd14913423 Stefan Popa     2019-06-04  500  				     ARRAY_SIZE(adf4371_reg_defaults));
7f699bd14913423 Stefan Popa     2019-06-04  501  	if (ret < 0)
7f699bd14913423 Stefan Popa     2019-06-04  502  		return ret;
7f699bd14913423 Stefan Popa     2019-06-04  503  
def914a4c3899b6 Stefan Popa     2019-06-24  504  	/* Mute to Lock Detect */
def914a4c3899b6 Stefan Popa     2019-06-24  505  	if (device_property_read_bool(&st->spi->dev, "adi,mute-till-lock-en")) {
def914a4c3899b6 Stefan Popa     2019-06-24  506  		ret = regmap_update_bits(st->regmap, ADF4371_REG(0x25),
def914a4c3899b6 Stefan Popa     2019-06-24  507  					 ADF4371_MUTE_LD_MSK,
def914a4c3899b6 Stefan Popa     2019-06-24  508  					 ADF4371_MUTE_LD(1));
def914a4c3899b6 Stefan Popa     2019-06-24  509  		if (ret < 0)
def914a4c3899b6 Stefan Popa     2019-06-24  510  			return ret;
def914a4c3899b6 Stefan Popa     2019-06-24  511  	}
def914a4c3899b6 Stefan Popa     2019-06-24  512  
011032df594999f Antoniu Miclaus 2024-12-09  513  	ref_diff_en = device_property_read_bool(&st->spi->dev, "adi,ref-differential-enable");
011032df594999f Antoniu Miclaus 2024-12-09  514  
7f699bd14913423 Stefan Popa     2019-06-04  515  	/* Set address in ascending order, so the bulk_write() will work */
7f699bd14913423 Stefan Popa     2019-06-04  516  	ret = regmap_update_bits(st->regmap, ADF4371_REG(0x0),
7f699bd14913423 Stefan Popa     2019-06-04  517  				 ADF4371_ADDR_ASC_MSK | ADF4371_ADDR_ASC_R_MSK,
7f699bd14913423 Stefan Popa     2019-06-04  518  				 ADF4371_ADDR_ASC(1) | ADF4371_ADDR_ASC_R(1));
7f699bd14913423 Stefan Popa     2019-06-04  519  	if (ret < 0)
7f699bd14913423 Stefan Popa     2019-06-04  520  		return ret;
011032df594999f Antoniu Miclaus 2024-12-09  521  
011032df594999f Antoniu Miclaus 2024-12-09  522  	if ((ref_diff_en && st->clkin_freq > ADF4371_MAX_FREQ_REFIN) ||
011032df594999f Antoniu Miclaus 2024-12-09  523  	    (!ref_diff_en && st->clkin_freq > ADF4371_MAX_FREQ_REFIN_SE))
011032df594999f Antoniu Miclaus 2024-12-09  524  		return -EINVAL;
011032df594999f Antoniu Miclaus 2024-12-09  525  
347e385fdd6ecda Antoniu Miclaus 2024-12-09  526  	if (st->clkin_freq < ADF4371_MAX_CLKIN_DOUB_FREQ &&
347e385fdd6ecda Antoniu Miclaus 2024-12-09  527  	    st->clkin_freq > ADF4371_MIN_CLKIN_DOUB_FREQ)
347e385fdd6ecda Antoniu Miclaus 2024-12-09  528  		ref_doubler_en = 1;
347e385fdd6ecda Antoniu Miclaus 2024-12-09  529  
011032df594999f Antoniu Miclaus 2024-12-09  530  	ret = regmap_update_bits(st->regmap,  ADF4371_REG(0x22),
011032df594999f Antoniu Miclaus 2024-12-09  531  				 ADF4371_REFIN_MODE_MASK,
011032df594999f Antoniu Miclaus 2024-12-09  532  				 ADF4371_REFIN_MODE(ref_diff_en));
011032df594999f Antoniu Miclaus 2024-12-09  533  	if (ret < 0)
011032df594999f Antoniu Miclaus 2024-12-09  534  		return ret;
011032df594999f Antoniu Miclaus 2024-12-09  535  
7f699bd14913423 Stefan Popa     2019-06-04  536  	/*
7f699bd14913423 Stefan Popa     2019-06-04  537  	 * Calculate and maximize PFD frequency
7f699bd14913423 Stefan Popa     2019-06-04  538  	 * fPFD = REFIN × ((1 + D)/(R × (1 + T)))
7f699bd14913423 Stefan Popa     2019-06-04  539  	 * Where D is the REFIN doubler bit, T is the reference divide by 2,
7f699bd14913423 Stefan Popa     2019-06-04  540  	 * R is the reference division factor
7f699bd14913423 Stefan Popa     2019-06-04  541  	 * TODO: it is assumed D and T equal 0.
7f699bd14913423 Stefan Popa     2019-06-04  542  	 */
7f699bd14913423 Stefan Popa     2019-06-04  543  	do {
7f699bd14913423 Stefan Popa     2019-06-04  544  		st->ref_div_factor++;
347e385fdd6ecda Antoniu Miclaus 2024-12-09 @545  		st->fpfd = st->clkin_freq * (1 + ref_doubler_en) /
347e385fdd6ecda Antoniu Miclaus 2024-12-09  546  			   st->ref_div_factor;
7f699bd14913423 Stefan Popa     2019-06-04  547  	} while (st->fpfd > ADF4371_MAX_FREQ_PFD);
7f699bd14913423 Stefan Popa     2019-06-04  548  
7f699bd14913423 Stefan Popa     2019-06-04  549  	/* Calculate Timeouts */
7f699bd14913423 Stefan Popa     2019-06-04  550  	vco_band_div = DIV_ROUND_UP(st->fpfd, 2400000U);
7f699bd14913423 Stefan Popa     2019-06-04  551  
7f699bd14913423 Stefan Popa     2019-06-04  552  	tmp = DIV_ROUND_CLOSEST(st->fpfd, 1000000U);
7f699bd14913423 Stefan Popa     2019-06-04  553  	do {
7f699bd14913423 Stefan Popa     2019-06-04  554  		timeout++;
7f699bd14913423 Stefan Popa     2019-06-04  555  		if (timeout > 1023) {
7f699bd14913423 Stefan Popa     2019-06-04  556  			timeout = 2;
7f699bd14913423 Stefan Popa     2019-06-04  557  			synth_timeout++;
7f699bd14913423 Stefan Popa     2019-06-04  558  		}
7f699bd14913423 Stefan Popa     2019-06-04  559  	} while (synth_timeout * 1024 + timeout <= 20 * tmp);
7f699bd14913423 Stefan Popa     2019-06-04  560  
7f699bd14913423 Stefan Popa     2019-06-04  561  	do {
7f699bd14913423 Stefan Popa     2019-06-04  562  		vco_alc_timeout++;
7f699bd14913423 Stefan Popa     2019-06-04  563  	} while (vco_alc_timeout * 1024 - timeout <= 50 * tmp);
7f699bd14913423 Stefan Popa     2019-06-04  564  
7f699bd14913423 Stefan Popa     2019-06-04  565  	st->buf[0] = vco_band_div;
7f699bd14913423 Stefan Popa     2019-06-04  566  	st->buf[1] = timeout & 0xFF;
7f699bd14913423 Stefan Popa     2019-06-04  567  	st->buf[2] = ADF4371_TIMEOUT(timeout >> 8) | 0x04;
7f699bd14913423 Stefan Popa     2019-06-04  568  	st->buf[3] = synth_timeout;
7f699bd14913423 Stefan Popa     2019-06-04  569  	st->buf[4] = ADF4371_VCO_ALC_TOUT(vco_alc_timeout);
7f699bd14913423 Stefan Popa     2019-06-04  570  
7f699bd14913423 Stefan Popa     2019-06-04  571  	return regmap_bulk_write(st->regmap, ADF4371_REG(0x30), st->buf, 5);
7f699bd14913423 Stefan Popa     2019-06-04  572  }
7f699bd14913423 Stefan Popa     2019-06-04  573  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
