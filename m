Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222B4C79
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762023780; cv=none; b=cAo+h7jLzxt4y4bOLwZgPjCeHynxfQv+XpUSygVsxhMNAvtLHd75mw8dVVewDAEGpV/fdlIEbNxXmzb1N55gNJj8b9IGWkUonMjsq60f+w8aHJ9T6ruqf5hR0Yy74mybVJlnbaVlNcwZW/rqAr35y4tP2nDSwuNVgB5Bnf04FfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762023780; c=relaxed/simple;
	bh=NhdGjKZJvwHEnXA+v0S+qltuG+iLWwetUbVocnXjcjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+XI7szw33SBCDI1mWODsO9UcCzSGuRUpxJnGhvd4cEPbsBVRtsr2g2XRJYKcxIeDnfEJpkPBQ3+vMwGKrEbOZB1l2MoE10dnM0UBwjodC6K6uLi7sf3G0vZvLrqfgTTyU48XHUz61GS+zT039fC8Nlp/GhS1WkvzO3a7PtJoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSvp5kBR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSvp5kBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762023778; x=1793559778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NhdGjKZJvwHEnXA+v0S+qltuG+iLWwetUbVocnXjcjc=;
  b=eSvp5kBR/4MUnYhN/JxN4BjCf42KiEpb5vszBf4HEWMGPbEWIGIpDztE
   z1dvYOSnZZk642SrO8HBBKjSXnPFV0HAZHJNyMrlwsB1pbIfGsNG4U2vq
   vFdpZWtZ6rsr5Y42Sh/yk7AyGwJPoMI2mlg+ZtqOod6QreHD28R4kPRHs
   1ykAogu5IYkXM56dRKqXrqu/V7pq96aK550YrcOOTzjPFTTNxZc0YA7gZ
   WN9hSQgj9lkxi6flUoTgYemWhaFgFaX1s/YTlG6/SjcFPrp2myRHzOsLh
   PGND4jyyqqATXJTH4Hm292YWQ5JmMh34o0n7molUnKVx6WuVS5xBzaJph
   A==;
X-CSE-ConnectionGUID: chCYNK8BQTKpANdCQj92tQ==
X-CSE-MsgGUID: 1cXA7wVQRI+mMXMTvXT0fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="75273961"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="75273961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 12:02:58 -0700
X-CSE-ConnectionGUID: 5xsUQZsoQBe+FBfecbN6Lg==
X-CSE-MsgGUID: of9qiEPoQIWZDuwoTjBVnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="223746682"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2025 12:02:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFGsH-000ObM-2H;
	Sat, 01 Nov 2025 19:02:53 +0000
Date: Sun, 2 Nov 2025 03:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V3 2/7] ASoC: codecs: Rework the aw88395 driver
Message-ID: <202511020233.9TQ2ZVHu-lkp@intel.com>
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
In-Reply-To: <20251028123357.46161-3-wangweidong.a@awinic.com>
References: <20251028123357.46161-3-wangweidong.a@awinic.com>
TO: wangweidong.a@awinic.com
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: perex@perex.cz
TO: tiwai@suse.com
TO: srinivas.kandagatla@oss.qualcomm.com
TO: wangweidong.a@awinic.com
TO: arnd@arndb.de
TO: cy_huang@richtek.com
TO: nick.li@foursemi.com
TO: shenghao-ding@ti.com
TO: alexey.klimov@linaro.org
TO: niranjan.hy@ti.com
TO: linux@treblig.org
TO: zhangyi@everest-semi.com
TO: thorsten.blum@linux.dev
TO: kuninori.morimoto.gx@renesas.com
TO: yesanishhere@gmail.com
TO: marco.crivellari@suse.com
TO: ebiggers@google.com
TO: ardb@kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-sound@vger.kernel.org
CC: yijiangtao@awinic.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2103a2df654868faf4ac0924ce529b11cca729bc]

url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-codecs-Rework-the-awinic-driver-lib/20251028-210642
base:   2103a2df654868faf4ac0924ce529b11cca729bc
patch link:    https://lore.kernel.org/r/20251028123357.46161-3-wangweidong.a%40awinic.com
patch subject: [PATCH V3 2/7] ASoC: codecs: Rework the aw88395 driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020233.9TQ2ZVHu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020233.9TQ2ZVHu-lkp@intel.com/

smatch warnings:
sound/soc/codecs/aw88395.c:635 aw88395_reg_update() error: uninitialized symbol 'ret'.

vim +/ret +635 sound/soc/codecs/aw88395.c

608c1ac8f6d444 Weidong Wang 2025-10-28  576  
608c1ac8f6d444 Weidong Wang 2025-10-28  577  static int aw88395_reg_update(struct aw_device *aw_dev,
608c1ac8f6d444 Weidong Wang 2025-10-28  578  	unsigned char *data, unsigned int len)
608c1ac8f6d444 Weidong Wang 2025-10-28  579  {
608c1ac8f6d444 Weidong Wang 2025-10-28  580  	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
608c1ac8f6d444 Weidong Wang 2025-10-28  581  	int16_t *reg_data;
608c1ac8f6d444 Weidong Wang 2025-10-28  582  	int data_len;
608c1ac8f6d444 Weidong Wang 2025-10-28  583  	u16 read_vol;
608c1ac8f6d444 Weidong Wang 2025-10-28  584  	u16 reg_val;
608c1ac8f6d444 Weidong Wang 2025-10-28  585  	u8 reg_addr;
608c1ac8f6d444 Weidong Wang 2025-10-28  586  	int i, ret;
608c1ac8f6d444 Weidong Wang 2025-10-28  587  
608c1ac8f6d444 Weidong Wang 2025-10-28  588  	reg_data = (int16_t *)data;
608c1ac8f6d444 Weidong Wang 2025-10-28  589  	data_len = len >> 1;
608c1ac8f6d444 Weidong Wang 2025-10-28  590  
608c1ac8f6d444 Weidong Wang 2025-10-28  591  	if (data_len & 0x1) {
608c1ac8f6d444 Weidong Wang 2025-10-28  592  		dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
608c1ac8f6d444 Weidong Wang 2025-10-28  593  		return -EINVAL;
608c1ac8f6d444 Weidong Wang 2025-10-28  594  	}
608c1ac8f6d444 Weidong Wang 2025-10-28  595  
608c1ac8f6d444 Weidong Wang 2025-10-28  596  	for (i = 0; i < data_len; i += 2) {
608c1ac8f6d444 Weidong Wang 2025-10-28  597  		reg_addr = reg_data[i];
608c1ac8f6d444 Weidong Wang 2025-10-28  598  		reg_val = reg_data[i + 1];
608c1ac8f6d444 Weidong Wang 2025-10-28  599  
608c1ac8f6d444 Weidong Wang 2025-10-28  600  		if (reg_addr == AW88395_SYSCTRL_REG) {
608c1ac8f6d444 Weidong Wang 2025-10-28  601  			if (reg_val & (~AW88395_DSPBY_MASK))
608c1ac8f6d444 Weidong Wang 2025-10-28  602  				aw_dev->dsp_cfg = AW_DEV_DSP_BYPASS;
608c1ac8f6d444 Weidong Wang 2025-10-28  603  			else
608c1ac8f6d444 Weidong Wang 2025-10-28  604  				aw_dev->dsp_cfg = AW_DEV_DSP_WORK;
608c1ac8f6d444 Weidong Wang 2025-10-28  605  
608c1ac8f6d444 Weidong Wang 2025-10-28  606  			reg_val &= (AW88395_HMUTE_MASK | AW88395_PWDN_MASK | AW88395_AMPPD_MASK |
608c1ac8f6d444 Weidong Wang 2025-10-28  607  					AW88395_DSPBY_MASK);
608c1ac8f6d444 Weidong Wang 2025-10-28  608  			reg_val |= (AW88395_HMUTE_DISABLE_VALUE | AW88395_PWDN_POWER_DOWN_VALUE |
608c1ac8f6d444 Weidong Wang 2025-10-28  609  				AW88395_AMPPD_POWER_DOWN_VALUE | AW88395_DSPBY_BYPASS_VALUE);
608c1ac8f6d444 Weidong Wang 2025-10-28  610  		}
608c1ac8f6d444 Weidong Wang 2025-10-28  611  
608c1ac8f6d444 Weidong Wang 2025-10-28  612  		if (reg_addr == AW88395_I2SCFG1_REG) {
608c1ac8f6d444 Weidong Wang 2025-10-28  613  			reg_val &= AW88395_I2STXEN_MASK;
608c1ac8f6d444 Weidong Wang 2025-10-28  614  			reg_val |= AW88395_I2STXEN_DISABLE_VALUE;
608c1ac8f6d444 Weidong Wang 2025-10-28  615  		}
608c1ac8f6d444 Weidong Wang 2025-10-28  616  
608c1ac8f6d444 Weidong Wang 2025-10-28  617  		if (reg_addr == AW88395_SYSCTRL2_REG) {
608c1ac8f6d444 Weidong Wang 2025-10-28  618  			read_vol = (reg_val & (~AW88395_VOL_MASK)) >> AW88395_VOL_START_BIT;
608c1ac8f6d444 Weidong Wang 2025-10-28  619  			aw_dev->volume_desc.init_volume = reg_val_to_db(read_vol);
608c1ac8f6d444 Weidong Wang 2025-10-28  620  		}
608c1ac8f6d444 Weidong Wang 2025-10-28  621  
608c1ac8f6d444 Weidong Wang 2025-10-28  622  		if (reg_addr == AW88395_HAGCCFG7_REG)
608c1ac8f6d444 Weidong Wang 2025-10-28  623  			reg_val &= AW88395_AGC_DSP_CTL_MASK;
608c1ac8f6d444 Weidong Wang 2025-10-28  624  
608c1ac8f6d444 Weidong Wang 2025-10-28  625  		ret = regmap_write(aw_dev->regmap, reg_addr, reg_val);
608c1ac8f6d444 Weidong Wang 2025-10-28  626  		if (ret)
608c1ac8f6d444 Weidong Wang 2025-10-28  627  			break;
608c1ac8f6d444 Weidong Wang 2025-10-28  628  	}
608c1ac8f6d444 Weidong Wang 2025-10-28  629  
608c1ac8f6d444 Weidong Wang 2025-10-28  630  	if (aw_dev->prof_cur != aw_dev->prof_index)
608c1ac8f6d444 Weidong Wang 2025-10-28  631  		vol_desc->ctl_volume = 0;
608c1ac8f6d444 Weidong Wang 2025-10-28  632  	else
608c1ac8f6d444 Weidong Wang 2025-10-28  633  		aw88395_set_volume(aw_dev, vol_desc->ctl_volume);
608c1ac8f6d444 Weidong Wang 2025-10-28  634  
608c1ac8f6d444 Weidong Wang 2025-10-28 @635  	return ret;
608c1ac8f6d444 Weidong Wang 2025-10-28  636  }
608c1ac8f6d444 Weidong Wang 2025-10-28  637  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
