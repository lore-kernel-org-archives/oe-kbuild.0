Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8D423E94
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067247; cv=none; b=npqn3tyyUv4KlmEreGaCzvmYnn+V0BvtYkTKpey083JopXXqlb5/eV3uIF2lceZ+bu3/bKhhXXBvxcOq/4AClSeAXzcT+4JpBG5Hr8uCuxl8XCZwtmu91s9uWVmvc1fhPTFoSiN+0Dl+q+9Qfz7keom/CPsON7uZVM5L3aPwnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067247; c=relaxed/simple;
	bh=Q+VSY5TMTq189TdSvyLQUSa/VfmFX30GjwS6tkiAKaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gDcGHZPEGmwOYDLMgb/pTUqsqNi86RjjOw8FB+VTD9vKC02Lo30SVWnI7yEcLHB/7C9gbKz8bwIhLus4nd6Kr+vZ31RzTvYb2ijx9Yd68hIRwYUy6C37N99Oqwv3UUeVBIsdafeI7cldO6HZtIfbD5pOE+QRcRoYASlQWlaYiRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzKY0gqj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzKY0gqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790067243; x=1821603243;
  h=date:from:to:cc:subject:message-id;
  bh=Q+VSY5TMTq189TdSvyLQUSa/VfmFX30GjwS6tkiAKaQ=;
  b=hzKY0gqjDkIDU8WJUBgx0q19nX55Wb2U1wYpyfbAkicK6hQSPp1uZ/AG
   x6mNMw9BcLomphYmLkIzb50lqBWSpHfWswnSbJGXA882NY0Bwb34mnyiF
   ylovRsSwH93ti1ReJpVyPcdey/6ls54rcYV76qmvJPUowZbc/FxFg13X0
   Va1nK3fM406wFERSVuFncyLGEhsCp3muYuAnD64+DIjkprO3uX1HyqzLH
   XwQ6mLYlEXyZi22jwCZebyOEMiidmgvPGPHBShCyypY+Wp1DP/RPydrx1
   OvMLhXe04Cd/W5EDYlpUyFE2D6QZrNfccGWOe7HaQma2JsLY78pvz8sp3
   Q==;
X-CSE-ConnectionGUID: YGbieGm2TQ2XULiPgr59aw==
X-CSE-MsgGUID: pFGBhFzXQIevUjweZz/iWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90519386"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90519386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:54:02 -0700
X-CSE-ConnectionGUID: tNb5QJH2SuSgEJWJrd8HCA==
X-CSE-MsgGUID: s0+fO57OQuS7cB+jAxIyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="300979134"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2026 01:54:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8wG8-00000000FFG-47sH;
	Tue, 22 Sep 2026 08:53:52 +0000
Date: Tue, 22 Sep 2026 16:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202609221642.vs6fnkMl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 00541b86fb578d4949cfdd6aff1f82d43fcf07af ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: csky-randconfig-r1308-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221642.vs6fnkMl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221642.vs6fnkMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 00541b86fb57 ("ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609221642.vs6fnkMl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   sound/soc/fsl/fsl_easrc.c:54:31: sparse: signed value source

vim +57 sound/soc/fsl/fsl_easrc.c

955ac624058f91 Shengjiu Wang 2020-04-16  33  
955ac624058f91 Shengjiu Wang 2020-04-16  34  #define FSL_EASRC_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  35  				 SNDRV_PCM_FMTBIT_U16_LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  36  				 SNDRV_PCM_FMTBIT_S24_LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  37  				 SNDRV_PCM_FMTBIT_S24_3LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  38  				 SNDRV_PCM_FMTBIT_U24_LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  39  				 SNDRV_PCM_FMTBIT_U24_3LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  40  				 SNDRV_PCM_FMTBIT_S32_LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  41  				 SNDRV_PCM_FMTBIT_U32_LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  42  				 SNDRV_PCM_FMTBIT_S20_3LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  43  				 SNDRV_PCM_FMTBIT_U20_3LE | \
955ac624058f91 Shengjiu Wang 2020-04-16  44  				 SNDRV_PCM_FMTBIT_FLOAT_LE)
955ac624058f91 Shengjiu Wang 2020-04-16  45  
955ac624058f91 Shengjiu Wang 2020-04-16  46  static int fsl_easrc_iec958_put_bits(struct snd_kcontrol *kcontrol,
955ac624058f91 Shengjiu Wang 2020-04-16  47  				     struct snd_ctl_elem_value *ucontrol)
955ac624058f91 Shengjiu Wang 2020-04-16  48  {
955ac624058f91 Shengjiu Wang 2020-04-16  49  	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
955ac624058f91 Shengjiu Wang 2020-04-16  50  	struct fsl_asrc *easrc = snd_soc_component_get_drvdata(comp);
955ac624058f91 Shengjiu Wang 2020-04-16  51  	struct fsl_easrc_priv *easrc_priv = easrc->private;
955ac624058f91 Shengjiu Wang 2020-04-16  52  	struct soc_mreg_control *mc =
955ac624058f91 Shengjiu Wang 2020-04-16  53  		(struct soc_mreg_control *)kcontrol->private_value;
955ac624058f91 Shengjiu Wang 2020-04-16  54  	unsigned int regval = ucontrol->value.integer.value[0];
54a86cf48eaa6d Mark Brown    2026-02-05  55  	int ret;
54a86cf48eaa6d Mark Brown    2026-02-05  56  
00541b86fb578d Shengjiu Wang 2026-04-01 @57  	if (regval < EASRC_WIDTH_16_BIT || regval > EASRC_WIDTH_24_BIT)
00541b86fb578d Shengjiu Wang 2026-04-01  58  		return -EINVAL;
00541b86fb578d Shengjiu Wang 2026-04-01  59  
54a86cf48eaa6d Mark Brown    2026-02-05  60  	ret = (easrc_priv->bps_iec958[mc->regbase] != regval);
955ac624058f91 Shengjiu Wang 2020-04-16  61  
955ac624058f91 Shengjiu Wang 2020-04-16  62  	easrc_priv->bps_iec958[mc->regbase] = regval;
955ac624058f91 Shengjiu Wang 2020-04-16  63  
54a86cf48eaa6d Mark Brown    2026-02-05  64  	return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  65  }
955ac624058f91 Shengjiu Wang 2020-04-16  66  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
