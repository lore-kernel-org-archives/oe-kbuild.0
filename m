Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535E8C0B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716018610; cv=none; b=HH/FrOdTQWGroPEZtJVdcAP7xKa7o26UelkIXGL0Nu2Mh049bCCOAWr+U2tcdAmyQn/mx41DKk2osFKnObHMofw3ce/MVd4FvgyeTMJcjLJnOHWh13W8fK4k1XVWpewlIeu917ehXr8rK4rsYobCgJCKG7FZPRksiNNXjYeWk1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716018610; c=relaxed/simple;
	bh=sgA2yS400PLp0VIzLf00uR1TEd7nJq4uI8OLzBiizsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBboo8+vBXr+c7ftyanxuYTFE8txiSt1O9wtEiMP8xxVZHngjWKvxyujqhXHxK0zUqJPEBo3ZQoWmXCmc4EIR0cMfymI4uILSgCJ6oAedDdlDEf59m+FVnx1LOH6aYzKE0Ea+RWzEdfv0xObzEaxrY3G1T5Z5bj+HXZ5TVLMF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMmJLnh0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMmJLnh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716018608; x=1747554608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sgA2yS400PLp0VIzLf00uR1TEd7nJq4uI8OLzBiizsI=;
  b=fMmJLnh0PMRle6Wx2A4ZJzcv7VDCIjwNhhFpdTT7wNcnYrGt/CuyXrYo
   a2oSzl9rdSBmcqQ+yzXNd2PLeAExe7t+kwFudP5R69Vpqinq9P2S+xr/q
   nWIEcYqCoalppB0LAocydY6iGUPDmegLxwI/eRg8P3/4O2auqf6ozCYZV
   jBRTLIeesCUsSitMaQ/8jnZaq2WG7eyqWACQU/O4/e85NkXOlaMDwDzTb
   MEqIe1vB77xP2rZ55VpoDzL+N4x2546W8lkchwFpFZLWo7koGyeoGL1H3
   fLHd55DT7EE+pam3xhWmDmlngoPLTWxIkty8mH88ItTUVfx3b64lsQLkL
   Q==;
X-CSE-ConnectionGUID: zAtyfFrATdC4Rsgzg8sVww==
X-CSE-MsgGUID: bZSEKa2AQsOQXZ7aDDER1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12080275"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12080275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 00:50:07 -0700
X-CSE-ConnectionGUID: m072n3soR5iW/lJ37904Kw==
X-CSE-MsgGUID: TYI/waEvTt27jsUMdGJWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="32180905"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2024 00:50:06 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8EpM-0001lA-39;
	Sat, 18 May 2024 07:50:01 +0000
Date: Sat, 18 May 2024 15:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
Message-ID: <202405181557.HpbDJU4b-lkp@intel.com>
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
In-Reply-To: <6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh@melexis.com>
References: <6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh@melexis.com>
TO: Volodymyr Kharuk <vkh@melexis.com>
TO: linux-media@vger.kernel.org
CC: Andrii Kyselov <ays@melexis.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: devicetree@vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
CC: Volodymyr Kharuk <vkh@melexis.com>

Hi Volodymyr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8771b7f31b7fff91a998e6afdb60650d4bac59a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-uapi-ctrls-Add-camera-trigger-controls/20240517-004536
base:   8771b7f31b7fff91a998e6afdb60650d4bac59a5
patch link:    https://lore.kernel.org/r/6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh%40melexis.com
patch subject: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r071-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181557.HpbDJU4b-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405181557.HpbDJU4b-lkp@intel.com/

smatch warnings:
drivers/media/i2c/mlx7502x.c:664 mlx7502x_runtime_resume() warn: 'sensor->xclk' from clk_prepare_enable() not released on lines: 664.
drivers/media/i2c/mlx7502x.c:1586 mlx7502x_link_freq_init() error: buffer overflow 'link_freq' 6 <= 6 (assuming for loop doesn't break)

vim +664 drivers/media/i2c/mlx7502x.c

93b22d3a235baf Volodymyr Kharuk 2024-05-16  619  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  620  static int __maybe_unused mlx7502x_runtime_resume(struct device *dev)
93b22d3a235baf Volodymyr Kharuk 2024-05-16  621  {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  622  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  623  	struct mlx7502x *sensor = to_mlx7502x(sd);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  624  	int ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  625  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  626  	gpiod_set_value_cansleep(sensor->reset, 0);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  627  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  628  	ret = regulator_bulk_enable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  629  	if (ret) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  630  		dev_err(sensor->dev, "failed to enable supply: %d\n", ret);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  631  		return ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  632  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  633  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  634  	ret = clk_prepare_enable(sensor->xclk);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  635  	if (ret) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  636  		dev_err(sensor->dev, "failed to enable external clock: %d\n",
93b22d3a235baf Volodymyr Kharuk 2024-05-16  637  			ret);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  638  		goto fail_clk;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  639  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  640  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  641  	gpiod_set_value_cansleep(sensor->reset, 1);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  642  	msleep(MLX7502X_RESET_DELAY_MS);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  643  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  644  	dev_dbg(sensor->dev, "power on\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  645  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  646  	ret = mlx7502x_write_regval(sd, mlx7502x_common_init_cfg,
93b22d3a235baf Volodymyr Kharuk 2024-05-16  647  				    ARRAY_SIZE(mlx7502x_common_init_cfg));
93b22d3a235baf Volodymyr Kharuk 2024-05-16  648  	if (ret < 0) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  649  		dev_err(sensor->dev, "failed to write init_cfg\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  650  		goto fail_clk;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  651  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  652  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  653  	ret = mlx7502x_write_regval(sd, sensor->cur_desc->init_cfg,
93b22d3a235baf Volodymyr Kharuk 2024-05-16  654  				    sensor->cur_desc->init_cfg_size);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  655  	if (ret < 0) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  656  		dev_err(sensor->dev, "failed to write sensor specific init_cfg\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  657  		goto fail_clk;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  658  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  659  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  660  	return 0;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  661  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  662  fail_clk:
93b22d3a235baf Volodymyr Kharuk 2024-05-16  663  	regulator_bulk_disable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
93b22d3a235baf Volodymyr Kharuk 2024-05-16 @664  	return ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  665  }
93b22d3a235baf Volodymyr Kharuk 2024-05-16  666  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
