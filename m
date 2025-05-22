Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC711B0434
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901903; cv=none; b=tG2fLpVyh+731GdLcfBd0TDMOtnc4vocnuz4/f8MKq+bvLkujsqnGHozl+uDF7OlxRwmrZ4KbjE7WnBGEl67EmeN6sBpk5xq6YwW51xK7Y9n9FWBDOT+UGS5ICAr33CkXeZqAtXrwbYQ2jE7XiZO9PJ92ewCvCyQ6H3lQreyWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901903; c=relaxed/simple;
	bh=hGaGQcwETnZiUluDMGp7BGxCGsLiJTCtMG/gjG/ID9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sMNy+5iQTmUsSHJjmhDvz4WgOLmA5UMJcAS+pGj8Ql+onR5ZgnFyWkn+0O2jFlvrhGUj8QchcZ7gB+cjkdkdm5qsZb7vwKLA9N2ANn+7ABbPWV3LoUx1LIh9JJoAh64BjXGv5aRttNn2eq9DCqZpJNoqxBSVAMFptl4jP9NP1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5bKHqMM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5bKHqMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747901902; x=1779437902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGaGQcwETnZiUluDMGp7BGxCGsLiJTCtMG/gjG/ID9M=;
  b=C5bKHqMMQsCKzD0/WMWaQvgSWD0eYhFbF62uDKkooVVnY3XOF9QkDs9F
   i6da5HrarS9Cj93e6MPeScjMw6O1Z7FRBR48N5WPJNb4ofUvsZB0yEQoM
   yhVaMweT1xuUkQJN9Y6W7Lp7SEbaA5peNjAv9rmzq2OQSYD3OghoPjEok
   Fgggke1xBDZrut43J6wrr25H3vC6NYthCiByroLQ5OC59rBxLPD5mphTN
   W73hlnVdV4Ke5vJLYnTraFpFqaFR0lNieF+BcOhjqQqRymaSIDpfiyN6j
   ND5go43TgJrk0RA10SZx5GczOpdTia3mLJCUPKfB5CHlUEQkI5pEn/EAp
   A==;
X-CSE-ConnectionGUID: MDKNXX4dQp6XJtBe8IU7fA==
X-CSE-MsgGUID: y7P7WYUJRyCgbaE1Ev+l9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53718796"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="53718796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 01:18:21 -0700
X-CSE-ConnectionGUID: JiEAGEVFRgK+8WQE/Kbk2w==
X-CSE-MsgGUID: 7ptXyy8/SsWljtl13XxlBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145628799"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2025 01:18:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI185-000P5e-0U;
	Thu, 22 May 2025 08:18:17 +0000
Date: Thu, 22 May 2025 16:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/3] iio: light: add support for veml6046x00 RGBIR
 color sensor
Message-ID: <202505221523.145NG1vP-lkp@intel.com>
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
In-Reply-To: <20250519060804.80464-3-ak@it-klinger.de>
References: <20250519060804.80464-3-ak@it-klinger.de>
TO: Andreas Klinger <ak@it-klinger.de>
TO: jic23@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: lars@metafoo.de
CC: javier.carrasco.cruz@gmail.com
CC: mazziesaccount@gmail.com
CC: andriy.shevchenko@linux.intel.com
CC: arthur.becker@sentec.com
CC: perdaniel.olsson@axis.com
CC: mgonellabolduc@dimonoff.com
CC: muditsharma.info@gmail.com
CC: clamor95@gmail.com
CC: emil.gedenryd@axis.com
CC: ak@it-klinger.de
CC: devicetree@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Klinger/dt-bindings-iio-light-veml6046x00-add-color-sensor/20250519-141432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250519060804.80464-3-ak%40it-klinger.de
patch subject: [PATCH v4 2/3] iio: light: add support for veml6046x00 RGBIR color sensor
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221523.145NG1vP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505221523.145NG1vP-lkp@intel.com/

smatch warnings:
drivers/iio/light/veml6046x00.c:613 veml6046x00_single_read() error: uninitialized symbol 'it_usec'.

vim +/it_usec +613 drivers/iio/light/veml6046x00.c

15744d9578b510 Andreas Klinger 2025-05-19  571  
15744d9578b510 Andreas Klinger 2025-05-19  572  static int veml6046x00_single_read(struct iio_dev *iio,
15744d9578b510 Andreas Klinger 2025-05-19  573  					enum iio_modifier modifier, int *val)
15744d9578b510 Andreas Klinger 2025-05-19  574  {
15744d9578b510 Andreas Klinger 2025-05-19  575  	struct veml6046x00_data *data = iio_priv(iio);
15744d9578b510 Andreas Klinger 2025-05-19  576  	struct device *dev = regmap_get_device(data->regmap);
15744d9578b510 Andreas Klinger 2025-05-19  577  	int addr, it_usec, ret;
15744d9578b510 Andreas Klinger 2025-05-19  578  	__le16 reg;
15744d9578b510 Andreas Klinger 2025-05-19  579  
15744d9578b510 Andreas Klinger 2025-05-19  580  	switch (modifier) {
15744d9578b510 Andreas Klinger 2025-05-19  581  	case IIO_MOD_LIGHT_RED:
15744d9578b510 Andreas Klinger 2025-05-19  582  		addr = VEML6046X00_REG_R;
15744d9578b510 Andreas Klinger 2025-05-19  583  		break;
15744d9578b510 Andreas Klinger 2025-05-19  584  	case IIO_MOD_LIGHT_GREEN:
15744d9578b510 Andreas Klinger 2025-05-19  585  		addr = VEML6046X00_REG_G;
15744d9578b510 Andreas Klinger 2025-05-19  586  		break;
15744d9578b510 Andreas Klinger 2025-05-19  587  	case IIO_MOD_LIGHT_BLUE:
15744d9578b510 Andreas Klinger 2025-05-19  588  		addr = VEML6046X00_REG_B;
15744d9578b510 Andreas Klinger 2025-05-19  589  		break;
15744d9578b510 Andreas Klinger 2025-05-19  590  	case IIO_MOD_LIGHT_IR:
15744d9578b510 Andreas Klinger 2025-05-19  591  		addr = VEML6046X00_REG_IR;
15744d9578b510 Andreas Klinger 2025-05-19  592  		break;
15744d9578b510 Andreas Klinger 2025-05-19  593  	default:
15744d9578b510 Andreas Klinger 2025-05-19  594  		return -EINVAL;
15744d9578b510 Andreas Klinger 2025-05-19  595  	}
15744d9578b510 Andreas Klinger 2025-05-19  596  	ret = pm_runtime_resume_and_get(dev);
15744d9578b510 Andreas Klinger 2025-05-19  597  	if (ret)
15744d9578b510 Andreas Klinger 2025-05-19  598  		return ret;
15744d9578b510 Andreas Klinger 2025-05-19  599  
15744d9578b510 Andreas Klinger 2025-05-19  600  	ret = veml6046x00_get_it_usec(data, &it_usec);
15744d9578b510 Andreas Klinger 2025-05-19  601  	if (ret < 0)
15744d9578b510 Andreas Klinger 2025-05-19  602  		return ret;
15744d9578b510 Andreas Klinger 2025-05-19  603  
15744d9578b510 Andreas Klinger 2025-05-19  604  	ret = regmap_field_write(data->rf.mode, 1);
15744d9578b510 Andreas Klinger 2025-05-19  605  	if (ret)
15744d9578b510 Andreas Klinger 2025-05-19  606  		return ret;
15744d9578b510 Andreas Klinger 2025-05-19  607  
15744d9578b510 Andreas Klinger 2025-05-19  608  	ret = regmap_field_write(data->rf.trig, 1);
15744d9578b510 Andreas Klinger 2025-05-19  609  	if (ret)
15744d9578b510 Andreas Klinger 2025-05-19  610  		return ret;
15744d9578b510 Andreas Klinger 2025-05-19  611  
15744d9578b510 Andreas Klinger 2025-05-19  612  	/* integration time + 10 % to ensure completion */
15744d9578b510 Andreas Klinger 2025-05-19 @613  	fsleep(it_usec + it_usec / 10);
15744d9578b510 Andreas Klinger 2025-05-19  614  
15744d9578b510 Andreas Klinger 2025-05-19  615  	ret = veml6046x00_wait_data_available(iio, it_usec * 10);
15744d9578b510 Andreas Klinger 2025-05-19  616  	if (ret != 1)
15744d9578b510 Andreas Klinger 2025-05-19  617  		goto no_data;
15744d9578b510 Andreas Klinger 2025-05-19  618  
15744d9578b510 Andreas Klinger 2025-05-19  619  	if (!iio_device_claim_direct(iio))
15744d9578b510 Andreas Klinger 2025-05-19  620  		return -EBUSY;
15744d9578b510 Andreas Klinger 2025-05-19  621  
15744d9578b510 Andreas Klinger 2025-05-19  622  	ret = regmap_bulk_read(data->regmap, addr, &reg, sizeof(reg));
15744d9578b510 Andreas Klinger 2025-05-19  623  	iio_device_release_direct(iio);
15744d9578b510 Andreas Klinger 2025-05-19  624  	if (ret)
15744d9578b510 Andreas Klinger 2025-05-19  625  		return ret;
15744d9578b510 Andreas Klinger 2025-05-19  626  
15744d9578b510 Andreas Klinger 2025-05-19  627  	pm_runtime_mark_last_busy(dev);
15744d9578b510 Andreas Klinger 2025-05-19  628  	pm_runtime_put_autosuspend(dev);
15744d9578b510 Andreas Klinger 2025-05-19  629  
15744d9578b510 Andreas Klinger 2025-05-19  630  	*val = le16_to_cpu(reg);
15744d9578b510 Andreas Klinger 2025-05-19  631  
15744d9578b510 Andreas Klinger 2025-05-19  632  	return IIO_VAL_INT;
15744d9578b510 Andreas Klinger 2025-05-19  633  
15744d9578b510 Andreas Klinger 2025-05-19  634  no_data:
15744d9578b510 Andreas Klinger 2025-05-19  635  	pm_runtime_mark_last_busy(dev);
15744d9578b510 Andreas Klinger 2025-05-19  636  	pm_runtime_put_autosuspend(dev);
15744d9578b510 Andreas Klinger 2025-05-19  637  
15744d9578b510 Andreas Klinger 2025-05-19  638  	return -EAGAIN;
15744d9578b510 Andreas Klinger 2025-05-19  639  }
15744d9578b510 Andreas Klinger 2025-05-19  640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
