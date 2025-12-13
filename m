Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9F1DA60D
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 01:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765588733; cv=none; b=c32BaZRb9qosP042X/5L7zsHO+agQIg9LXGDACTBZyc69DLryvmfpw55jY4YUhRxRDASeglgA8peVwfev2GiihDxuejRwmYob9pd045HnbNwMOVk1bc/JHIuJJcOOWHlVxV6UsCGGJNTXjjIG2BuxiLJ4XPqQp3HLQyZy704WCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765588733; c=relaxed/simple;
	bh=yRNTezAOi1hZgHjer5pk60H5TxpZGLh+5D/zggV38VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Keu/S/FyJZkQQps2N9xdsxRs7EtxSrSIVYkqP+/57G7Ei9fbLTTMe+yfSV3Uitul+BG5h2wSWXalu+6pQEetwzk4NvpKcemZo/NyJEPtwf+YOrIDlJCPOQpo01oG+qqdOl1ssgXG6HdtfzJyl6NRQbOpQKZ6ATv7XkS6MIpoAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAV7fH04; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAV7fH04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765588731; x=1797124731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRNTezAOi1hZgHjer5pk60H5TxpZGLh+5D/zggV38VA=;
  b=FAV7fH04+el+dv/Bkv1xzfvs5TyXiTrNgMzHo4ofuOhT7p6jZ/fpwu9R
   qRqJxyGwt12AFKw3jBTHjk/OZdt0o4FtC4DfhQeuw2W8BSDZfBuwzaMG2
   QP4SriKTcwZcj6ruMnUmRsErBUYIetd7+/yYZxROWtubZpssD/lNijs3p
   Hh9mhYR2UXztOjjfFsiy/zMzF5EMsTQBZrLBsDvWPjosRzzWOw+GduhBU
   sxbXFq2uy48LEZatimr20H39fhro1+mkZ8r/lEq9gpnZj+tfVvjvrdmeT
   woACgIhlaTqmTW7k3adz/6Oxz20MedST4HQr+VKL+jlfWPBsdDWLrrAnZ
   w==;
X-CSE-ConnectionGUID: wjfKC1FuTjWIa2cPdm/PuA==
X-CSE-MsgGUID: v4hURqj+TdGUdsYADqyIgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67469846"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67469846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:18:47 -0800
X-CSE-ConnectionGUID: wwtciVXaRZ+ZBVnUfwUaNw==
X-CSE-MsgGUID: WcdJL0j5Tia9wJZlzk33/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201711641"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 17:18:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEHT-000000006sh-3BNM;
	Sat, 13 Dec 2025 01:18:43 +0000
Date: Sat, 13 Dec 2025 09:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/aw88395/aw88395_device.c:1063
 aw_dev_update_reg_container() error: uninitialized symbol 'ret'.
Message-ID: <202512130914.y9vWToJH-lkp@intel.com>
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
TO: Weidong Wang <wangweidong.a@awinic.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: fd16593d456053d110c6e7bd141a7f381a1b10f7 ASoC: codecs: Modify awinic amplifier dsp read and write functions
date:   2 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130914.y9vWToJH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130914.y9vWToJH-lkp@intel.com/

smatch warnings:
sound/soc/codecs/aw88395/aw88395_device.c:1063 aw_dev_update_reg_container() error: uninitialized symbol 'ret'.

vim +/ret +1063 sound/soc/codecs/aw88395/aw88395_device.c

06d2fe9cb42354 Weidong Wang 2023-01-13   997  
06d2fe9cb42354 Weidong Wang 2023-01-13   998  static int aw_dev_update_reg_container(struct aw_device *aw_dev,
06d2fe9cb42354 Weidong Wang 2023-01-13   999  				unsigned char *data, unsigned int len)
06d2fe9cb42354 Weidong Wang 2023-01-13  1000  {
06d2fe9cb42354 Weidong Wang 2023-01-13  1001  	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
06d2fe9cb42354 Weidong Wang 2023-01-13  1002  	unsigned int read_val;
06d2fe9cb42354 Weidong Wang 2023-01-13  1003  	int16_t *reg_data;
06d2fe9cb42354 Weidong Wang 2023-01-13  1004  	int data_len;
06d2fe9cb42354 Weidong Wang 2023-01-13  1005  	u16 read_vol;
06d2fe9cb42354 Weidong Wang 2023-01-13  1006  	u16 reg_val;
06d2fe9cb42354 Weidong Wang 2023-01-13  1007  	u8 reg_addr;
06d2fe9cb42354 Weidong Wang 2023-01-13  1008  	int i, ret;
06d2fe9cb42354 Weidong Wang 2023-01-13  1009  
06d2fe9cb42354 Weidong Wang 2023-01-13  1010  	reg_data = (int16_t *)data;
06d2fe9cb42354 Weidong Wang 2023-01-13  1011  	data_len = len >> 1;
06d2fe9cb42354 Weidong Wang 2023-01-13  1012  
06d2fe9cb42354 Weidong Wang 2023-01-13  1013  	if (data_len & 0x1) {
06d2fe9cb42354 Weidong Wang 2023-01-13  1014  		dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
06d2fe9cb42354 Weidong Wang 2023-01-13  1015  		return -EINVAL;
06d2fe9cb42354 Weidong Wang 2023-01-13  1016  	}
06d2fe9cb42354 Weidong Wang 2023-01-13  1017  
06d2fe9cb42354 Weidong Wang 2023-01-13  1018  	for (i = 0; i < data_len; i += 2) {
06d2fe9cb42354 Weidong Wang 2023-01-13  1019  		reg_addr = reg_data[i];
06d2fe9cb42354 Weidong Wang 2023-01-13  1020  		reg_val = reg_data[i + 1];
06d2fe9cb42354 Weidong Wang 2023-01-13  1021  
06d2fe9cb42354 Weidong Wang 2023-01-13  1022  		if (reg_addr == AW88395_SYSCTRL_REG) {
06d2fe9cb42354 Weidong Wang 2023-01-13  1023  			ret = regmap_read(aw_dev->regmap, reg_addr, &read_val);
06d2fe9cb42354 Weidong Wang 2023-01-13  1024  			if (ret)
06d2fe9cb42354 Weidong Wang 2023-01-13  1025  				break;
06d2fe9cb42354 Weidong Wang 2023-01-13  1026  			read_val &= (~AW88395_HMUTE_MASK);
06d2fe9cb42354 Weidong Wang 2023-01-13  1027  			reg_val &= AW88395_HMUTE_MASK;
06d2fe9cb42354 Weidong Wang 2023-01-13  1028  			reg_val |= read_val;
06d2fe9cb42354 Weidong Wang 2023-01-13  1029  		}
06d2fe9cb42354 Weidong Wang 2023-01-13  1030  		if (reg_addr == AW88395_HAGCCFG7_REG)
06d2fe9cb42354 Weidong Wang 2023-01-13  1031  			reg_val &= AW88395_AGC_DSP_CTL_MASK;
06d2fe9cb42354 Weidong Wang 2023-01-13  1032  
06d2fe9cb42354 Weidong Wang 2023-01-13  1033  		if (reg_addr == AW88395_I2SCFG1_REG) {
06d2fe9cb42354 Weidong Wang 2023-01-13  1034  			/* close tx */
06d2fe9cb42354 Weidong Wang 2023-01-13  1035  			reg_val &= AW88395_I2STXEN_MASK;
06d2fe9cb42354 Weidong Wang 2023-01-13  1036  			reg_val |= AW88395_I2STXEN_DISABLE_VALUE;
06d2fe9cb42354 Weidong Wang 2023-01-13  1037  		}
06d2fe9cb42354 Weidong Wang 2023-01-13  1038  
06d2fe9cb42354 Weidong Wang 2023-01-13  1039  		if (reg_addr == AW88395_SYSCTRL2_REG) {
06d2fe9cb42354 Weidong Wang 2023-01-13  1040  			read_vol = (reg_val & (~AW88395_VOL_MASK)) >>
06d2fe9cb42354 Weidong Wang 2023-01-13  1041  				AW88395_VOL_START_BIT;
06d2fe9cb42354 Weidong Wang 2023-01-13  1042  			aw_dev->volume_desc.init_volume =
06d2fe9cb42354 Weidong Wang 2023-01-13  1043  				reg_val_to_db(read_vol);
06d2fe9cb42354 Weidong Wang 2023-01-13  1044  		}
06d2fe9cb42354 Weidong Wang 2023-01-13  1045  		ret = regmap_write(aw_dev->regmap, reg_addr, reg_val);
06d2fe9cb42354 Weidong Wang 2023-01-13  1046  		if (ret)
06d2fe9cb42354 Weidong Wang 2023-01-13  1047  			break;
06d2fe9cb42354 Weidong Wang 2023-01-13  1048  
06d2fe9cb42354 Weidong Wang 2023-01-13  1049  	}
06d2fe9cb42354 Weidong Wang 2023-01-13  1050  
06d2fe9cb42354 Weidong Wang 2023-01-13  1051  	aw_dev_get_cur_mode_st(aw_dev);
06d2fe9cb42354 Weidong Wang 2023-01-13  1052  
06d2fe9cb42354 Weidong Wang 2023-01-13  1053  	if (aw_dev->prof_cur != aw_dev->prof_index) {
06d2fe9cb42354 Weidong Wang 2023-01-13  1054  		/* clear control volume when PA change profile */
06d2fe9cb42354 Weidong Wang 2023-01-13  1055  		vol_desc->ctl_volume = 0;
06d2fe9cb42354 Weidong Wang 2023-01-13  1056  	} else {
06d2fe9cb42354 Weidong Wang 2023-01-13  1057  		/* keep control volume when PA start with sync mode */
06d2fe9cb42354 Weidong Wang 2023-01-13  1058  		aw_dev_set_volume(aw_dev, vol_desc->ctl_volume);
06d2fe9cb42354 Weidong Wang 2023-01-13  1059  	}
06d2fe9cb42354 Weidong Wang 2023-01-13  1060  
06d2fe9cb42354 Weidong Wang 2023-01-13  1061  	aw_dev_get_dsp_config(aw_dev, &aw_dev->dsp_cfg);
06d2fe9cb42354 Weidong Wang 2023-01-13  1062  
06d2fe9cb42354 Weidong Wang 2023-01-13 @1063  	return ret;
06d2fe9cb42354 Weidong Wang 2023-01-13  1064  }
06d2fe9cb42354 Weidong Wang 2023-01-13  1065  

:::::: The code at line 1063 was first introduced by commit
:::::: 06d2fe9cb42354e9910b1305ec984d0de7225f3e ASoC: codecs: Aw88395 function for ALSA Audio Driver

:::::: TO: Weidong Wang <wangweidong.a@awinic.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
