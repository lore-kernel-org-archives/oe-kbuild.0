Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674243019A5
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624056; cv=none; b=mifcO4CbxoCMRplX02ZhvdouZ2wVkKPZfim6oDeP2/Rkk4Mp05PMlwIO8AhakOL46HACVsj3ddXV6I6M7QusgwTqD1x3OTUMd+L/K6MaZ33Bq5h3suARBkzy9X+OUNBPX88T2kS8LiLHccVMFSvba6UCJWkSARWE4zi/D8Cde5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624056; c=relaxed/simple;
	bh=I0ZpCHcSR8nXN59KpbBDmcJ1q9SC28xShcnIeLW9PfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2W9emYkzDgmCQ6WLuBiMtEbYa3aUdIVX/R6CjElWUsUcWS3grcHhmWjP90COP/fBrgW14c26iJbTOW6hGDw81yzbEWZe/yBBcR0D+m3L2JBZ6V3wnHL6FrcQxGF/FPkxUTfPwLRp8k+4Q8mDtLga9VGsTP4dD4HOGhuULb78IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQqlVjbN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQqlVjbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765624054; x=1797160054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0ZpCHcSR8nXN59KpbBDmcJ1q9SC28xShcnIeLW9PfU=;
  b=hQqlVjbNwzUlUT9NOX+uzvCP5sioAwcWasplBwk6acm8PkI1Jiwhrb+Z
   wewqb0HNeP/wSSlero+J1nlLd6O50oAt+8r6xk03dqL3F5r0rMHyDhpeL
   nTjs3ux72GvQZ/aTkeM8HzLrOrmBVHaPL3ct5v1EMZMDAS4OssRkmTq/A
   cmju+0xdicZw3Jnqzsjf1ubma02eg1bBRZsJs/Ow+ixGMT0aH84MDQYfH
   6YMl2YfM4wXRShX37Y9J0O5aGiRbXszyFTQYpBrMYjZ8065OpldhALZrR
   knJW0cszn0ZTs/pEE1SwNjXQZyS4Nev14+MkMBsCrQwp/+vVUgl5mZER3
   A==;
X-CSE-ConnectionGUID: t2Ixf8DrQzmoY1Ufxzmd6g==
X-CSE-MsgGUID: hDcQR+MISsqBCoba+OE5qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67548593"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67548593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:07:33 -0800
X-CSE-ConnectionGUID: 3UxhmlskTNe8VtC+ALI+pA==
X-CSE-MsgGUID: IToMRkHEQDeoxR/hAScZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197056726"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 03:07:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNTF-000000007Wr-368S;
	Sat, 13 Dec 2025 11:07:29 +0000
Date: Sat, 13 Dec 2025 19:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/light/veml6046x00.c:688 veml6046x00_single_read() error:
 uninitialized symbol 'it_usec'.
Message-ID: <202512131940.nFZLp9Ko-lkp@intel.com>
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
TO: Andreas Klinger <ak@it-klinger.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 4bfb29e8be7338ad33b905a7ce11fd26d0139287 iio: light: add support for veml6046x00 RGBIR color sensor
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131940.nFZLp9Ko-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131940.nFZLp9Ko-lkp@intel.com/

smatch warnings:
drivers/iio/light/veml6046x00.c:688 veml6046x00_single_read() error: uninitialized symbol 'it_usec'.

vim +/it_usec +688 drivers/iio/light/veml6046x00.c

4bfb29e8be7338 Andreas Klinger 2025-07-28  639  
4bfb29e8be7338 Andreas Klinger 2025-07-28  640  static int veml6046x00_single_read(struct iio_dev *iio,
4bfb29e8be7338 Andreas Klinger 2025-07-28  641  				   enum iio_modifier modifier, int *val)
4bfb29e8be7338 Andreas Klinger 2025-07-28  642  {
4bfb29e8be7338 Andreas Klinger 2025-07-28  643  	struct veml6046x00_data *data = iio_priv(iio);
4bfb29e8be7338 Andreas Klinger 2025-07-28  644  	struct device *dev = regmap_get_device(data->regmap);
4bfb29e8be7338 Andreas Klinger 2025-07-28  645  	unsigned int addr, it_usec;
4bfb29e8be7338 Andreas Klinger 2025-07-28  646  	int ret;
4bfb29e8be7338 Andreas Klinger 2025-07-28  647  	__le16 reg;
4bfb29e8be7338 Andreas Klinger 2025-07-28  648  
4bfb29e8be7338 Andreas Klinger 2025-07-28  649  	switch (modifier) {
4bfb29e8be7338 Andreas Klinger 2025-07-28  650  	case IIO_MOD_LIGHT_RED:
4bfb29e8be7338 Andreas Klinger 2025-07-28  651  		addr = VEML6046X00_REG_R;
4bfb29e8be7338 Andreas Klinger 2025-07-28  652  		break;
4bfb29e8be7338 Andreas Klinger 2025-07-28  653  	case IIO_MOD_LIGHT_GREEN:
4bfb29e8be7338 Andreas Klinger 2025-07-28  654  		addr = VEML6046X00_REG_G;
4bfb29e8be7338 Andreas Klinger 2025-07-28  655  		break;
4bfb29e8be7338 Andreas Klinger 2025-07-28  656  	case IIO_MOD_LIGHT_BLUE:
4bfb29e8be7338 Andreas Klinger 2025-07-28  657  		addr = VEML6046X00_REG_B;
4bfb29e8be7338 Andreas Klinger 2025-07-28  658  		break;
4bfb29e8be7338 Andreas Klinger 2025-07-28  659  	case IIO_MOD_LIGHT_IR:
4bfb29e8be7338 Andreas Klinger 2025-07-28  660  		addr = VEML6046X00_REG_IR;
4bfb29e8be7338 Andreas Klinger 2025-07-28  661  		break;
4bfb29e8be7338 Andreas Klinger 2025-07-28  662  	default:
4bfb29e8be7338 Andreas Klinger 2025-07-28  663  		return -EINVAL;
4bfb29e8be7338 Andreas Klinger 2025-07-28  664  	}
4bfb29e8be7338 Andreas Klinger 2025-07-28  665  	ret = pm_runtime_resume_and_get(dev);
4bfb29e8be7338 Andreas Klinger 2025-07-28  666  	if (ret)
4bfb29e8be7338 Andreas Klinger 2025-07-28  667  		return ret;
4bfb29e8be7338 Andreas Klinger 2025-07-28  668  
4bfb29e8be7338 Andreas Klinger 2025-07-28  669  	ret = veml6046x00_get_it_usec(data, &it_usec);
4bfb29e8be7338 Andreas Klinger 2025-07-28  670  	if (ret < 0) {
4bfb29e8be7338 Andreas Klinger 2025-07-28  671  		dev_err(dev, "Failed to get integration time ret: %d", ret);
4bfb29e8be7338 Andreas Klinger 2025-07-28  672  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  673  	}
4bfb29e8be7338 Andreas Klinger 2025-07-28  674  
4bfb29e8be7338 Andreas Klinger 2025-07-28  675  	ret = regmap_field_write(data->rf.mode, 1);
4bfb29e8be7338 Andreas Klinger 2025-07-28  676  	if (ret) {
4bfb29e8be7338 Andreas Klinger 2025-07-28  677  		dev_err(dev, "Failed to write mode ret: %d", ret);
4bfb29e8be7338 Andreas Klinger 2025-07-28  678  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  679  	}
4bfb29e8be7338 Andreas Klinger 2025-07-28  680  
4bfb29e8be7338 Andreas Klinger 2025-07-28  681  	ret = regmap_field_write(data->rf.trig, 1);
4bfb29e8be7338 Andreas Klinger 2025-07-28  682  	if (ret) {
4bfb29e8be7338 Andreas Klinger 2025-07-28  683  		dev_err(dev, "Failed to write trigger ret: %d", ret);
4bfb29e8be7338 Andreas Klinger 2025-07-28  684  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  685  	}
4bfb29e8be7338 Andreas Klinger 2025-07-28  686  
4bfb29e8be7338 Andreas Klinger 2025-07-28  687  	/* integration time + 12.5 % to ensure completion */
4bfb29e8be7338 Andreas Klinger 2025-07-28 @688  	fsleep(it_usec + it_usec / 8);
4bfb29e8be7338 Andreas Klinger 2025-07-28  689  
4bfb29e8be7338 Andreas Klinger 2025-07-28  690  	ret = veml6046x00_wait_data_available(iio, it_usec * 4);
4bfb29e8be7338 Andreas Klinger 2025-07-28  691  	if (ret < 0)
4bfb29e8be7338 Andreas Klinger 2025-07-28  692  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  693  	if (ret == 0) {
4bfb29e8be7338 Andreas Klinger 2025-07-28  694  		ret = -EAGAIN;
4bfb29e8be7338 Andreas Klinger 2025-07-28  695  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  696  	}
4bfb29e8be7338 Andreas Klinger 2025-07-28  697  
4bfb29e8be7338 Andreas Klinger 2025-07-28  698  	if (!iio_device_claim_direct(iio)) {
4bfb29e8be7338 Andreas Klinger 2025-07-28  699  		ret = -EBUSY;
4bfb29e8be7338 Andreas Klinger 2025-07-28  700  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  701  	}
4bfb29e8be7338 Andreas Klinger 2025-07-28  702  
4bfb29e8be7338 Andreas Klinger 2025-07-28  703  	ret = regmap_bulk_read(data->regmap, addr, &reg, sizeof(reg));
4bfb29e8be7338 Andreas Klinger 2025-07-28  704  	iio_device_release_direct(iio);
4bfb29e8be7338 Andreas Klinger 2025-07-28  705  	if (ret)
4bfb29e8be7338 Andreas Klinger 2025-07-28  706  		goto out;
4bfb29e8be7338 Andreas Klinger 2025-07-28  707  
4bfb29e8be7338 Andreas Klinger 2025-07-28  708  	*val = le16_to_cpu(reg);
4bfb29e8be7338 Andreas Klinger 2025-07-28  709  
4bfb29e8be7338 Andreas Klinger 2025-07-28  710  	ret = IIO_VAL_INT;
4bfb29e8be7338 Andreas Klinger 2025-07-28  711  
4bfb29e8be7338 Andreas Klinger 2025-07-28  712  out:
4bfb29e8be7338 Andreas Klinger 2025-07-28  713  	pm_runtime_put_autosuspend(dev);
4bfb29e8be7338 Andreas Klinger 2025-07-28  714  
4bfb29e8be7338 Andreas Klinger 2025-07-28  715  	return ret;
4bfb29e8be7338 Andreas Klinger 2025-07-28  716  }
4bfb29e8be7338 Andreas Klinger 2025-07-28  717  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
