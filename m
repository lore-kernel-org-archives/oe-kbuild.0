Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC02AE8D
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Mar 2025 01:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741053374; cv=none; b=fkUmp5BhvQxuU6IG4GvfftjbdyLdYV8UcDgehx7Hd8wHlHYjAe9LLml3DZ67D+G4lXO02Vl28y4Mh+r4hMOQO72FXMR0l7jpNwCLToHZlvQKzcwfNITFV2qxZTObkkurVHMqZpdwHvaC7Lz1dURi5asQLP1W94Tg1JaBQ7dzJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741053374; c=relaxed/simple;
	bh=zNQNFTjxl4blfb/Kuke0I3loQ/OOqc3D6kBMYntF57g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbQ7zuekt+k1TDf7F7Pudkmg8WREFGH/igtRbkadq+OG49AdR6uzqztt5zcDzVrTSJN14RTWNR2HFq0l7+saYr/GuOvKyNQVQDPmmZ44sdXLVvICsuxuXseSOLj40CkP/ndCd32MTIHuzouFCfb+91TUOCmff/o9xYk2HsTblyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRuSbN3e; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRuSbN3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741053372; x=1772589372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNQNFTjxl4blfb/Kuke0I3loQ/OOqc3D6kBMYntF57g=;
  b=mRuSbN3eAcDcKYrcp9VE9mOG15d87L//6xlJZfCyVHrG/2oroIsPYGOP
   Vh2D1x/HPxys9CkBKcFLqhUB1VRxf4xKIOAiIvMgl/+m/U/I7didZBuot
   wu9bJEUkvEUsxdxcbSUwHdlFNPE4m4Ndu27x/QtcA7CBkL6eOJs7B0uyz
   Li7NFcmT/hG97xBE9zFevL4l+OZGDUdspyEW6WA1TiKNn0h1M/dKgBFpI
   SmER1a5CKzvHE8WvDBBeep1QSVbUlx8gVU9juVE+5uGtd6+xK1RZaBWIL
   WVFJK3cd8IBArvLul06mr9IaH3Azt8G+MIHu+horwStsQfqJsFi5m0hhH
   g==;
X-CSE-ConnectionGUID: jnhCuRsiS1avhzLN5IbRdg==
X-CSE-MsgGUID: 9O6a7y9uQ/ygHxJhd41Suw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52160200"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="52160200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 17:56:11 -0800
X-CSE-ConnectionGUID: Sg0B9Qm3RnGPaBJPfj22hw==
X-CSE-MsgGUID: bs8HwvBMR7m77mxBiv6L3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118227499"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2025 17:56:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpHVw-000J9S-0z;
	Tue, 04 Mar 2025 01:56:08 +0000
Date: Tue, 4 Mar 2025 09:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3206/7719] drivers/iio/adc/ad4030.c:378
 ad4030_get_chan_scale() error: 'scan_type' dereferencing possible ERR_PTR()
Message-ID: <202503040954.n6MhjSsV-lkp@intel.com>
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
TO: Esteban Blanc <eblanc@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: 949abd1ca5a4342d9fb8c774035222e65dd1cfe4 [3206/7719] iio: adc: ad4030: add averaging support
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: openrisc-randconfig-r071-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040954.n6MhjSsV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503040954.n6MhjSsV-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4030.c:378 ad4030_get_chan_scale() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +378 drivers/iio/adc/ad4030.c

0cb8b324852f3e3 Esteban Blanc 2025-02-14  365  
0cb8b324852f3e3 Esteban Blanc 2025-02-14  366  static int ad4030_get_chan_scale(struct iio_dev *indio_dev,
0cb8b324852f3e3 Esteban Blanc 2025-02-14  367  				 struct iio_chan_spec const *chan,
0cb8b324852f3e3 Esteban Blanc 2025-02-14  368  				 int *val,
0cb8b324852f3e3 Esteban Blanc 2025-02-14  369  				 int *val2)
0cb8b324852f3e3 Esteban Blanc 2025-02-14  370  {
0cb8b324852f3e3 Esteban Blanc 2025-02-14  371  	struct ad4030_state *st = iio_priv(indio_dev);
949abd1ca5a4342 Esteban Blanc 2025-02-14  372  	const struct iio_scan_type *scan_type;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  373  
0cb8b324852f3e3 Esteban Blanc 2025-02-14  374  	if (chan->differential) {
949abd1ca5a4342 Esteban Blanc 2025-02-14  375  		scan_type = iio_get_current_scan_type(indio_dev,
949abd1ca5a4342 Esteban Blanc 2025-02-14  376  						      st->chip->channels);
0cb8b324852f3e3 Esteban Blanc 2025-02-14  377  		*val = (st->vref_uv * 2) / MILLI;
949abd1ca5a4342 Esteban Blanc 2025-02-14 @378  		*val2 = scan_type->realbits;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  379  		return IIO_VAL_FRACTIONAL_LOG2;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  380  	}
0cb8b324852f3e3 Esteban Blanc 2025-02-14  381  
0cb8b324852f3e3 Esteban Blanc 2025-02-14  382  	*val = st->vref_uv / MILLI;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  383  	*val2 = chan->scan_type.realbits;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  384  	return IIO_VAL_FRACTIONAL_LOG2;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  385  }
0cb8b324852f3e3 Esteban Blanc 2025-02-14  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
