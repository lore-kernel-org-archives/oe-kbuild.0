Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115B3537C8
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186193; cv=none; b=QxjZauud15qGmgvA9bSPe9G9GCCnZc0RQQQ9FW2NHuLvl8lrreSJEA8DqN5JmpAG49MdAdnfUIPwNZyrPLV97XT8wbiTswWzX0oVz7izGkY3vNOe9NsZUWwdZf8VtUokpREf0tAyvsRJMjosmg25GeAvtMOHczdzNdg7j7RMsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186193; c=relaxed/simple;
	bh=UH7VVyqxKAlhuHL40kl8kNAwBx4mcwoL+fimHmNiwU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YhepOE5QGxRAlWKanjbGQglC3M64gMmqQJOLV7mfXkeA6W8N3VhYvhYNtVV6wkmuwcApn9tpwRJnQPWwUDOhQuhEQ2cAuaIqzBntWRxc/P+7zHna7+PDH7D2w2LiBurWFIhcqLln5pfLstGM46+G9QWZY/Eyw+Bhks9K+QmSghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kuc0i4OW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kuc0i4OW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781186191; x=1812722191;
  h=date:from:to:cc:subject:message-id;
  bh=UH7VVyqxKAlhuHL40kl8kNAwBx4mcwoL+fimHmNiwU0=;
  b=Kuc0i4OWFYKt8up7NRoCfnocWMimVbSkT7HJtAHasds12oB8HyWfuAkd
   7T/dFl/hGVlV3tjA91eBJ2S5Kqe2UsHL8rlD7HUj/iTNzvc0JER4Tv9MK
   wuqQxDWDddNFDcMTKiae58AVmebAgvHkuffRiJTPZuAl6dVorVO4r+cn5
   6ERkuz1TwGShI7k5bIVhHIio/0FVveUiU5Xx2TikzwbS8kR+uPoSGY+V0
   4qKg1qH0KwGAMSMVmRhq/YqiiA0lWiT4URPDbsWPK5Msb1YcliqlX/3/R
   86KPjypOXsjfraVOZA7RrKIPVgD1YYnKm/+kOd8NM/bJLHCEXM7bHJSik
   Q==;
X-CSE-ConnectionGUID: oh5n4cuGTemeZ0p1rXj4vw==
X-CSE-MsgGUID: 9SLrI/PBTY6eDxf1H/sAQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82043715"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82043715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:56:31 -0700
X-CSE-ConnectionGUID: fDtRAbxqSrS01UUu+AqCxg==
X-CSE-MsgGUID: G1z+WeJmTlmxcFLlPIHlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251575190"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 06:56:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXftT-00000000N8I-1W3E;
	Thu, 11 Jun 2026 13:56:27 +0000
Date: Thu, 11 Jun 2026 21:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202606112123.1QYcdcfZ-lkp@intel.com>
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
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 00541b86fb578d4949cfdd6aff1f82d43fcf07af ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
date:   2 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-r123-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112123.1QYcdcfZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112123.1QYcdcfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 00541b86fb57 ("ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606112123.1QYcdcfZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   sound/soc/fsl/fsl_easrc.c:54:31: sparse: signed value source

vim +57 sound/soc/fsl/fsl_easrc.c

955ac624058f911 Shengjiu Wang 2020-04-16  33  
955ac624058f911 Shengjiu Wang 2020-04-16  34  #define FSL_EASRC_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  35  				 SNDRV_PCM_FMTBIT_U16_LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  36  				 SNDRV_PCM_FMTBIT_S24_LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  37  				 SNDRV_PCM_FMTBIT_S24_3LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  38  				 SNDRV_PCM_FMTBIT_U24_LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  39  				 SNDRV_PCM_FMTBIT_U24_3LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  40  				 SNDRV_PCM_FMTBIT_S32_LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  41  				 SNDRV_PCM_FMTBIT_U32_LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  42  				 SNDRV_PCM_FMTBIT_S20_3LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  43  				 SNDRV_PCM_FMTBIT_U20_3LE | \
955ac624058f911 Shengjiu Wang 2020-04-16  44  				 SNDRV_PCM_FMTBIT_FLOAT_LE)
955ac624058f911 Shengjiu Wang 2020-04-16  45  
955ac624058f911 Shengjiu Wang 2020-04-16  46  static int fsl_easrc_iec958_put_bits(struct snd_kcontrol *kcontrol,
955ac624058f911 Shengjiu Wang 2020-04-16  47  				     struct snd_ctl_elem_value *ucontrol)
955ac624058f911 Shengjiu Wang 2020-04-16  48  {
955ac624058f911 Shengjiu Wang 2020-04-16  49  	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
955ac624058f911 Shengjiu Wang 2020-04-16  50  	struct fsl_asrc *easrc = snd_soc_component_get_drvdata(comp);
955ac624058f911 Shengjiu Wang 2020-04-16  51  	struct fsl_easrc_priv *easrc_priv = easrc->private;
955ac624058f911 Shengjiu Wang 2020-04-16  52  	struct soc_mreg_control *mc =
955ac624058f911 Shengjiu Wang 2020-04-16  53  		(struct soc_mreg_control *)kcontrol->private_value;
955ac624058f911 Shengjiu Wang 2020-04-16  54  	unsigned int regval = ucontrol->value.integer.value[0];
54a86cf48eaa6d1 Mark Brown    2026-02-05  55  	int ret;
54a86cf48eaa6d1 Mark Brown    2026-02-05  56  
00541b86fb578d4 Shengjiu Wang 2026-04-01 @57  	if (regval < EASRC_WIDTH_16_BIT || regval > EASRC_WIDTH_24_BIT)
00541b86fb578d4 Shengjiu Wang 2026-04-01  58  		return -EINVAL;
00541b86fb578d4 Shengjiu Wang 2026-04-01  59  
54a86cf48eaa6d1 Mark Brown    2026-02-05  60  	ret = (easrc_priv->bps_iec958[mc->regbase] != regval);
955ac624058f911 Shengjiu Wang 2020-04-16  61  
955ac624058f911 Shengjiu Wang 2020-04-16  62  	easrc_priv->bps_iec958[mc->regbase] = regval;
955ac624058f911 Shengjiu Wang 2020-04-16  63  
54a86cf48eaa6d1 Mark Brown    2026-02-05  64  	return ret;
955ac624058f911 Shengjiu Wang 2020-04-16  65  }
955ac624058f911 Shengjiu Wang 2020-04-16  66  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
