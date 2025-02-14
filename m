Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6618B460
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739560266; cv=none; b=B60+ifnSYaIvCD9cFro6nPu+Xxe1CmxYbqlD9nM5dqBCpXoPbqIUp3/o/e7YyWgQ20BR4coi3ktP4lIyzZ9XfbrgZpVM64DdtQs6LfCi/CZPloLS1DVT+aw8FbWNNSRJcqASNbHOzCyvBIOxsY/t6FZm3YiukS8osfNinrN6aHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739560266; c=relaxed/simple;
	bh=15OysBzgIBTa+dEJ3PsBWEO4eopjT2eCFKyBN9tDn5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAMcXC1MPDXsvsA9cVKO8IhJ+r05XZVq0+yptGC4LcPgjwETpg0RO1aM+xxDudAHXnH6Nkth8LrRwAP7JKnwGQzQx9Rq/ajYqTpBDgHsQOv52MLN0TyxV0lY7gAPpJDLdmybJUkY7SulDvQjv1z5JcnaBWJS0yv9dFxCywyk46E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKd0VTST; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKd0VTST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739560264; x=1771096264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15OysBzgIBTa+dEJ3PsBWEO4eopjT2eCFKyBN9tDn5U=;
  b=OKd0VTSTe4xIW5xQEpAum3i2o8HXtdUCiwY8Bdo0a6GIU1+prfl0SR5d
   2+1QqCn2Ezq9s5UXsGPpSv7IkGZIeDnX0zHrpHNKv094A87LTdBIHKzKl
   Ly9AUdoDBh4KgmMaDFKAR39MovcctLQ3em1wYpKCRw0kS3ooT0bhxmtyk
   Sa+RI3mrPRG2PjQXGca0aUGIIBshiuBnMvALNURsF8veS6zmEzmUSN1wi
   QreXYHWVbcxVJ0T1ZV/HJ6D7ZlrTOJfYmM9/vb3j0tUnogNobNrAfWcbL
   SJ4pOpFmxVOm0bWml9r6gRJ2EoEXIioEYgfJ/7v6ofDPIprE3uxJSyG7p
   A==;
X-CSE-ConnectionGUID: yjoMrtOYS9mGV3JGfvSDzA==
X-CSE-MsgGUID: DV30KDxkSi+cMRsYff5mBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="27918215"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="27918215"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:11:03 -0800
X-CSE-ConnectionGUID: C7PtiUYHQfO6tIVtB6uTdw==
X-CSE-MsgGUID: +MIKL38ESUG5VA6/gUk5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118464064"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 11:11:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj15X-001A4F-0O;
	Fri, 14 Feb 2025 19:10:59 +0000
Date: Sat, 15 Feb 2025 03:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [esmil:visionfive 27/33] sound/soc/starfive/pwmdac.c:151
 pwmdac_duty_cycle_put() error: buffer overflow 'pwmdac_ct_duty_cycle' 3 <= 3
Message-ID: <202502150325.e0HHs9Rb-lkp@intel.com>
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
TO: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux visionfive
head:   dcb5a245dbe2203ae35f6b1b5cb28929f758008c
commit: e8916d018c5219f3e996f1a11f11ed767dd727ff [27/33] ASoC: starfive: Add StarFive JH7100 audio drivers
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: um-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150325.e0HHs9Rb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502150325.e0HHs9Rb-lkp@intel.com/

smatch warnings:
sound/soc/starfive/pwmdac.c:151 pwmdac_duty_cycle_put() error: buffer overflow 'pwmdac_ct_duty_cycle' 3 <= 3
sound/soc/starfive/pwmdac.c:231 pwmdac_data_mode_put() error: buffer overflow 'pwmdac_ct_data_mode' 2 <= 2
sound/soc/starfive/pwmdac.c:273 pwmdac_shift_put() error: buffer overflow 'pwmdac_ct_shift' 7 <= 7
sound/soc/starfive/pwmdac.c:314 pwmdac_lr_change_put() error: buffer overflow 'pwmdac_ct_lr_change' 2 <= 2

vim +/pwmdac_ct_duty_cycle +151 sound/soc/starfive/pwmdac.c

e8916d018c5219 Walker Chen 2021-11-17  139  
e8916d018c5219 Walker Chen 2021-11-17  140  static int pwmdac_duty_cycle_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  141  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  142  {
e8916d018c5219 Walker Chen 2021-11-17  143  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  144  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  145  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  146  	unsigned int items = ARRAY_SIZE(pwmdac_ct_duty_cycle);
e8916d018c5219 Walker Chen 2021-11-17  147  
e8916d018c5219 Walker Chen 2021-11-17  148  	if (sel > items)
e8916d018c5219 Walker Chen 2021-11-17  149  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  150  
e8916d018c5219 Walker Chen 2021-11-17 @151  	dev->duty_cycle = pwmdac_ct_duty_cycle[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  152  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  153  }
e8916d018c5219 Walker Chen 2021-11-17  154  
e8916d018c5219 Walker Chen 2021-11-17  155  /*
e8916d018c5219 Walker Chen 2021-11-17  156  static int pwmdac_datan_info(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  157  				struct snd_ctl_elem_info *uinfo)
e8916d018c5219 Walker Chen 2021-11-17  158  {
e8916d018c5219 Walker Chen 2021-11-17  159  	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
e8916d018c5219 Walker Chen 2021-11-17  160  	uinfo->count = 1;
e8916d018c5219 Walker Chen 2021-11-17  161  	uinfo->value.integer.min = 1;
e8916d018c5219 Walker Chen 2021-11-17  162  	uinfo->value.integer.max = PWMDAC_SAMPLE_CNT_511;
e8916d018c5219 Walker Chen 2021-11-17  163  	uinfo->value.integer.step = 1;
e8916d018c5219 Walker Chen 2021-11-17  164  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  165  }
e8916d018c5219 Walker Chen 2021-11-17  166  
e8916d018c5219 Walker Chen 2021-11-17  167  static int pwmdac_datan_get(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  168  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  169  {
e8916d018c5219 Walker Chen 2021-11-17  170  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  171  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  172  
e8916d018c5219 Walker Chen 2021-11-17  173  	ucontrol->value.integer.value[0] = dev->datan;
e8916d018c5219 Walker Chen 2021-11-17  174  
e8916d018c5219 Walker Chen 2021-11-17  175  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  176  }
e8916d018c5219 Walker Chen 2021-11-17  177  
e8916d018c5219 Walker Chen 2021-11-17  178  static int pwmdac_datan_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  179  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  180  {
e8916d018c5219 Walker Chen 2021-11-17  181  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  182  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  183  	int sel = ucontrol->value.integer.value[0];
e8916d018c5219 Walker Chen 2021-11-17  184  
e8916d018c5219 Walker Chen 2021-11-17  185  	if (sel > PWMDAC_SAMPLE_CNT_511)
e8916d018c5219 Walker Chen 2021-11-17  186  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  187  
e8916d018c5219 Walker Chen 2021-11-17  188  	dev->datan = sel;
e8916d018c5219 Walker Chen 2021-11-17  189  
e8916d018c5219 Walker Chen 2021-11-17  190  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  191  }
e8916d018c5219 Walker Chen 2021-11-17  192  */
e8916d018c5219 Walker Chen 2021-11-17  193  
e8916d018c5219 Walker Chen 2021-11-17  194  static int pwmdac_data_mode_info(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  195  				struct snd_ctl_elem_info *uinfo)
e8916d018c5219 Walker Chen 2021-11-17  196  {
e8916d018c5219 Walker Chen 2021-11-17  197  	unsigned int items = ARRAY_SIZE(pwmdac_ct_data_mode);
e8916d018c5219 Walker Chen 2021-11-17  198  
e8916d018c5219 Walker Chen 2021-11-17  199  	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
e8916d018c5219 Walker Chen 2021-11-17  200  	uinfo->count = 1;
e8916d018c5219 Walker Chen 2021-11-17  201  	uinfo->value.enumerated.items = items;
e8916d018c5219 Walker Chen 2021-11-17  202  	if (uinfo->value.enumerated.item >= items)
e8916d018c5219 Walker Chen 2021-11-17  203  		uinfo->value.enumerated.item = items - 1;
e8916d018c5219 Walker Chen 2021-11-17  204  	strcpy(uinfo->value.enumerated.name,
e8916d018c5219 Walker Chen 2021-11-17  205  		pwmdac_ct_data_mode[uinfo->value.enumerated.item].name);
e8916d018c5219 Walker Chen 2021-11-17  206  
e8916d018c5219 Walker Chen 2021-11-17  207  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  208  }
e8916d018c5219 Walker Chen 2021-11-17  209  
e8916d018c5219 Walker Chen 2021-11-17  210  static int pwmdac_data_mode_get(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  211  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  212  {
e8916d018c5219 Walker Chen 2021-11-17  213  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  214  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  215  
e8916d018c5219 Walker Chen 2021-11-17  216  	ucontrol->value.enumerated.item[0] = dev->data_mode;
e8916d018c5219 Walker Chen 2021-11-17  217  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  218  }
e8916d018c5219 Walker Chen 2021-11-17  219  
e8916d018c5219 Walker Chen 2021-11-17  220  static int pwmdac_data_mode_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  221  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  222  {
e8916d018c5219 Walker Chen 2021-11-17  223  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  224  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  225  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  226  	unsigned int items = ARRAY_SIZE(pwmdac_ct_data_mode);
e8916d018c5219 Walker Chen 2021-11-17  227  
e8916d018c5219 Walker Chen 2021-11-17  228  	if (sel > items)
e8916d018c5219 Walker Chen 2021-11-17  229  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  230  
e8916d018c5219 Walker Chen 2021-11-17 @231  	dev->data_mode = pwmdac_ct_data_mode[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  232  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  233  }
e8916d018c5219 Walker Chen 2021-11-17  234  
e8916d018c5219 Walker Chen 2021-11-17  235  static int pwmdac_shift_info(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  236  				struct snd_ctl_elem_info *uinfo)
e8916d018c5219 Walker Chen 2021-11-17  237  {
e8916d018c5219 Walker Chen 2021-11-17  238  	unsigned int items = ARRAY_SIZE(pwmdac_ct_shift);
e8916d018c5219 Walker Chen 2021-11-17  239  
e8916d018c5219 Walker Chen 2021-11-17  240  	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
e8916d018c5219 Walker Chen 2021-11-17  241  	uinfo->count = 1;
e8916d018c5219 Walker Chen 2021-11-17  242  	uinfo->value.enumerated.items = items;
e8916d018c5219 Walker Chen 2021-11-17  243  	if (uinfo->value.enumerated.item >= items)
e8916d018c5219 Walker Chen 2021-11-17  244  		uinfo->value.enumerated.item = items - 1;
e8916d018c5219 Walker Chen 2021-11-17  245  	strcpy(uinfo->value.enumerated.name,
e8916d018c5219 Walker Chen 2021-11-17  246  		pwmdac_ct_shift[uinfo->value.enumerated.item].name);
e8916d018c5219 Walker Chen 2021-11-17  247  
e8916d018c5219 Walker Chen 2021-11-17  248  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  249  }
e8916d018c5219 Walker Chen 2021-11-17  250  
e8916d018c5219 Walker Chen 2021-11-17  251  static int pwmdac_shift_get(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  252  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  253  {
e8916d018c5219 Walker Chen 2021-11-17  254  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  255  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  256  	unsigned int item = dev->shift;
e8916d018c5219 Walker Chen 2021-11-17  257  
e8916d018c5219 Walker Chen 2021-11-17  258  	ucontrol->value.enumerated.item[0] = pwmdac_ct_shift[item].vals;
e8916d018c5219 Walker Chen 2021-11-17  259  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  260  }
e8916d018c5219 Walker Chen 2021-11-17  261  
e8916d018c5219 Walker Chen 2021-11-17  262  static int pwmdac_shift_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  263  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  264  {
e8916d018c5219 Walker Chen 2021-11-17  265  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  266  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  267  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  268  	unsigned int items = ARRAY_SIZE(pwmdac_ct_shift);
e8916d018c5219 Walker Chen 2021-11-17  269  
e8916d018c5219 Walker Chen 2021-11-17  270  	if (sel > items)
e8916d018c5219 Walker Chen 2021-11-17  271  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  272  
e8916d018c5219 Walker Chen 2021-11-17 @273  	dev->shift = pwmdac_ct_shift[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  274  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  275  }
e8916d018c5219 Walker Chen 2021-11-17  276  
e8916d018c5219 Walker Chen 2021-11-17  277  static int pwmdac_lr_change_info(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  278  				struct snd_ctl_elem_info *uinfo)
e8916d018c5219 Walker Chen 2021-11-17  279  {
e8916d018c5219 Walker Chen 2021-11-17  280  	unsigned int items = ARRAY_SIZE(pwmdac_ct_lr_change);
e8916d018c5219 Walker Chen 2021-11-17  281  
e8916d018c5219 Walker Chen 2021-11-17  282  	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
e8916d018c5219 Walker Chen 2021-11-17  283  	uinfo->count = 1;
e8916d018c5219 Walker Chen 2021-11-17  284  	uinfo->value.enumerated.items = items;
e8916d018c5219 Walker Chen 2021-11-17  285  	if (uinfo->value.enumerated.item >= items)
e8916d018c5219 Walker Chen 2021-11-17  286  		uinfo->value.enumerated.item = items - 1;
e8916d018c5219 Walker Chen 2021-11-17  287  	strcpy(uinfo->value.enumerated.name,
e8916d018c5219 Walker Chen 2021-11-17  288  		pwmdac_ct_lr_change[uinfo->value.enumerated.item].name);
e8916d018c5219 Walker Chen 2021-11-17  289  
e8916d018c5219 Walker Chen 2021-11-17  290  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  291  }
e8916d018c5219 Walker Chen 2021-11-17  292  
e8916d018c5219 Walker Chen 2021-11-17  293  static int pwmdac_lr_change_get(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  294  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  295  {
e8916d018c5219 Walker Chen 2021-11-17  296  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  297  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  298  
e8916d018c5219 Walker Chen 2021-11-17  299  	ucontrol->value.enumerated.item[0] = dev->lr_change;
e8916d018c5219 Walker Chen 2021-11-17  300  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  301  }
e8916d018c5219 Walker Chen 2021-11-17  302  
e8916d018c5219 Walker Chen 2021-11-17  303  static int pwmdac_lr_change_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  304  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  305  {
e8916d018c5219 Walker Chen 2021-11-17  306  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  307  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  308  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  309  	unsigned int items = ARRAY_SIZE(pwmdac_ct_lr_change);
e8916d018c5219 Walker Chen 2021-11-17  310  
e8916d018c5219 Walker Chen 2021-11-17  311  	if (sel > items)
e8916d018c5219 Walker Chen 2021-11-17  312  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  313  
e8916d018c5219 Walker Chen 2021-11-17 @314  	dev->lr_change = pwmdac_ct_lr_change[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  315  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  316  }
e8916d018c5219 Walker Chen 2021-11-17  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
