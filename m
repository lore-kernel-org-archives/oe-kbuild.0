Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EBB205E32
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Apr 2024 04:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713587609; cv=none; b=HLCnD3jnsmjW44HiQJvwzyxUw0GP8F9IURzYxDjrj9YwwbIhq+84omrWTiFXmk5yFGOvhNWjmmlrLAodn/0N7xLQdW/5+Kde3PVcGrHVyyqoSfOB4b7UJ3z5T9scuIziYpE/YzCTlVVfcZfKykbaMty5wLYNb3NxlhqX6iisbGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713587609; c=relaxed/simple;
	bh=6z3aPpcYDjCxxA3Yc+/77CYbutFyD7AmYNVeJzxPHn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJEqNprUE8cloXQ3NtG7XlvgECDOWuugip8v2FwZssTlKSQR3nyzhc+WEOYL/L+h6xush8PCks5Q3rph2eNnE9nHkjlGa0pUWo82D9QadglKkZuk9PVPVp/PlYpKF3Rq2o9pay52En4xTpyWr5v+hxIwTumbAgECI5mkcfSmwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amxBRkH9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amxBRkH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713587608; x=1745123608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6z3aPpcYDjCxxA3Yc+/77CYbutFyD7AmYNVeJzxPHn0=;
  b=amxBRkH99JldTXIwpnv+l/XYahIt5yZB3DINVPzbBsNdYXglDNxgUHtB
   bYRg/OVyPqxl5gQVcF2oKQphu9oRiEPKJZbaMOQqkcsnvOqrxm4GRtb//
   1sgvR/aSjPHFK8FGbQwbgTEq2kYQGn9BVXWLPfTvzo2gONbbikrVZwY/a
   BLs10dF3LjgUufRs/VxnLWxuLz4QIqA5J0kEDT663pIaoDzbusTaj0bn6
   ubZNeKqsFfByus+wLDdKLKSCsLJXWVj+zl2vf5XEjrI27PbQnLNjZBLtY
   eL1Fx+y5Tmxx4iclaLhdMJBnXUh52Kpy/hV3TzCAKLFOF/zrelIwXqGKL
   A==;
X-CSE-ConnectionGUID: bmL2hkNYRACkmmlGrRM10A==
X-CSE-MsgGUID: B4AsFWfXQ3KJ2pV8mkcsuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="19811656"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="19811656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 21:33:27 -0700
X-CSE-ConnectionGUID: +r1AYhxcQCaRWjIb6ecpNw==
X-CSE-MsgGUID: VV/eRKBHQxa0yym+qOUYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="28179580"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2024 21:33:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry2Pj-000AjM-0O;
	Sat, 20 Apr 2024 04:33:23 +0000
Date: Sat, 20 Apr 2024 12:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 8/8] iio: adc: ad9467: support digital interface
 calibration
Message-ID: <202404201240.EYJwoHKf-lkp@intel.com>
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
In-Reply-To: <20240419-ad9467-new-features-v1-8-3e7628ff6d5e@analog.com>
References: <20240419-ad9467-new-features-v1-8-3e7628ff6d5e@analog.com>
TO: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Ardelean <alexandru.ardelean@analog.com>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Olivier Moysan <olivier.moysan@foss.st.com>
CC: Nuno Sa <nuno.sa@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 62d3fb9dcc091ccdf25eb3b716e90e07e3ed861f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/iio-backend-add-API-for-interface-tuning/20240419-233948
base:   62d3fb9dcc091ccdf25eb3b716e90e07e3ed861f
patch link:    https://lore.kernel.org/r/20240419-ad9467-new-features-v1-8-3e7628ff6d5e%40analog.com
patch subject: [PATCH 8/8] iio: adc: ad9467: support digital interface calibration
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: csky-randconfig-r081-20240420 (https://download.01.org/0day-ci/archive/20240420/202404201240.EYJwoHKf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404201240.EYJwoHKf-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad9467.c:587 ad9467_calibrate() error: uninitialized symbol 'inv_val'.

vim +/inv_val +587 drivers/iio/adc/ad9467.c

65ac942f507d901 Nuno Sa 2024-04-19  523  
65ac942f507d901 Nuno Sa 2024-04-19  524  static int ad9467_calibrate(const struct ad9467_state *st)
65ac942f507d901 Nuno Sa 2024-04-19  525  {
65ac942f507d901 Nuno Sa 2024-04-19  526  	DECLARE_BITMAP(err_map, AD9647_MAX_TEST_POINTS * 2);
65ac942f507d901 Nuno Sa 2024-04-19  527  	unsigned int point, val, inv_val, cnt, inv_cnt = 0;
65ac942f507d901 Nuno Sa 2024-04-19  528  	/*
65ac942f507d901 Nuno Sa 2024-04-19  529  	 * Half of the bitmap is for the inverted signal. The number of test
65ac942f507d901 Nuno Sa 2024-04-19  530  	 * points is the same though...
65ac942f507d901 Nuno Sa 2024-04-19  531  	 */
65ac942f507d901 Nuno Sa 2024-04-19  532  	unsigned int test_points = AD9647_MAX_TEST_POINTS;
65ac942f507d901 Nuno Sa 2024-04-19  533  	unsigned long sample_rate = clk_get_rate(st->clk);
65ac942f507d901 Nuno Sa 2024-04-19  534  	struct device *dev = &st->spi->dev;
65ac942f507d901 Nuno Sa 2024-04-19  535  	bool invert = false, stat;
65ac942f507d901 Nuno Sa 2024-04-19  536  	int ret;
65ac942f507d901 Nuno Sa 2024-04-19  537  
65ac942f507d901 Nuno Sa 2024-04-19  538  	ret = ad9647_calibrate_prepare(st);
65ac942f507d901 Nuno Sa 2024-04-19  539  	if (ret)
65ac942f507d901 Nuno Sa 2024-04-19  540  		return ret;
65ac942f507d901 Nuno Sa 2024-04-19  541  retune:
65ac942f507d901 Nuno Sa 2024-04-19  542  	ret = ad9647_calibrate_polarity_set(st, invert);
65ac942f507d901 Nuno Sa 2024-04-19  543  	if (ret)
65ac942f507d901 Nuno Sa 2024-04-19  544  		return ret;
65ac942f507d901 Nuno Sa 2024-04-19  545  
65ac942f507d901 Nuno Sa 2024-04-19  546  	for (point = 0; point < test_points; point++) {
65ac942f507d901 Nuno Sa 2024-04-19  547  		ret = ad9467_calibrate_apply(st, point);
65ac942f507d901 Nuno Sa 2024-04-19  548  		if (ret)
65ac942f507d901 Nuno Sa 2024-04-19  549  			return ret;
65ac942f507d901 Nuno Sa 2024-04-19  550  
65ac942f507d901 Nuno Sa 2024-04-19  551  		ret = ad9467_calibrate_status_check(st, &stat);
65ac942f507d901 Nuno Sa 2024-04-19  552  		if (ret < 0)
65ac942f507d901 Nuno Sa 2024-04-19  553  			return ret;
65ac942f507d901 Nuno Sa 2024-04-19  554  
65ac942f507d901 Nuno Sa 2024-04-19  555  		__assign_bit(point + invert * test_points, err_map, stat);
65ac942f507d901 Nuno Sa 2024-04-19  556  	}
65ac942f507d901 Nuno Sa 2024-04-19  557  
65ac942f507d901 Nuno Sa 2024-04-19  558  	if (!invert) {
65ac942f507d901 Nuno Sa 2024-04-19  559  		cnt = ad9467_find_optimal_point(err_map, 0, test_points, &val);
65ac942f507d901 Nuno Sa 2024-04-19  560  		/*
65ac942f507d901 Nuno Sa 2024-04-19  561  		 * We're happy if we find, at least, three good test points in
65ac942f507d901 Nuno Sa 2024-04-19  562  		 * a row.
65ac942f507d901 Nuno Sa 2024-04-19  563  		 */
65ac942f507d901 Nuno Sa 2024-04-19  564  		if (cnt < 3) {
65ac942f507d901 Nuno Sa 2024-04-19  565  			invert = true;
65ac942f507d901 Nuno Sa 2024-04-19  566  			goto retune;
65ac942f507d901 Nuno Sa 2024-04-19  567  		}
65ac942f507d901 Nuno Sa 2024-04-19  568  	} else {
65ac942f507d901 Nuno Sa 2024-04-19  569  		inv_cnt = ad9467_find_optimal_point(err_map, test_points,
65ac942f507d901 Nuno Sa 2024-04-19  570  						    test_points, &inv_val);
65ac942f507d901 Nuno Sa 2024-04-19  571  		if (!inv_cnt && !cnt)
65ac942f507d901 Nuno Sa 2024-04-19  572  			return -EIO;
65ac942f507d901 Nuno Sa 2024-04-19  573  	}
65ac942f507d901 Nuno Sa 2024-04-19  574  
65ac942f507d901 Nuno Sa 2024-04-19  575  	ad9467_dump_table(err_map, BITS_PER_TYPE(err_map), invert);
65ac942f507d901 Nuno Sa 2024-04-19  576  
65ac942f507d901 Nuno Sa 2024-04-19  577  	if (inv_cnt < cnt) {
65ac942f507d901 Nuno Sa 2024-04-19  578  		ret = ad9647_calibrate_polarity_set(st, false);
65ac942f507d901 Nuno Sa 2024-04-19  579  		if (ret)
65ac942f507d901 Nuno Sa 2024-04-19  580  			return ret;
65ac942f507d901 Nuno Sa 2024-04-19  581  	} else {
65ac942f507d901 Nuno Sa 2024-04-19  582  		/*
65ac942f507d901 Nuno Sa 2024-04-19  583  		 * polarity inverted is the last test to run. Hence, there's no
65ac942f507d901 Nuno Sa 2024-04-19  584  		 * need to re-do any configuration. We just need to "normalize"
65ac942f507d901 Nuno Sa 2024-04-19  585  		 * the selected value.
65ac942f507d901 Nuno Sa 2024-04-19  586  		 */
65ac942f507d901 Nuno Sa 2024-04-19 @587  		val = inv_val - test_points;
65ac942f507d901 Nuno Sa 2024-04-19  588  	}
65ac942f507d901 Nuno Sa 2024-04-19  589  
65ac942f507d901 Nuno Sa 2024-04-19  590  	if (st->info->has_dco)
65ac942f507d901 Nuno Sa 2024-04-19  591  		dev_dbg(dev, "%sDCO 0x%X CLK %lu Hz\n", inv_cnt >= cnt ? "INVERT " : "",
65ac942f507d901 Nuno Sa 2024-04-19  592  			val, sample_rate);
65ac942f507d901 Nuno Sa 2024-04-19  593  	else
65ac942f507d901 Nuno Sa 2024-04-19  594  		dev_dbg(dev, "%sIDELAY 0x%x\n", inv_cnt >= cnt ? "INVERT " : "",
65ac942f507d901 Nuno Sa 2024-04-19  595  			val);
65ac942f507d901 Nuno Sa 2024-04-19  596  
65ac942f507d901 Nuno Sa 2024-04-19  597  	ret = ad9467_calibrate_apply(st, val);
65ac942f507d901 Nuno Sa 2024-04-19  598  	if (ret)
65ac942f507d901 Nuno Sa 2024-04-19  599  		return ret;
65ac942f507d901 Nuno Sa 2024-04-19  600  
65ac942f507d901 Nuno Sa 2024-04-19  601  	/* finally apply the optimal value */
65ac942f507d901 Nuno Sa 2024-04-19  602  	return ad9647_calibrate_stop(st);
65ac942f507d901 Nuno Sa 2024-04-19  603  }
65ac942f507d901 Nuno Sa 2024-04-19  604  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
