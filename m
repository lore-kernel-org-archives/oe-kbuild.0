Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219A35C193
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205840; cv=none; b=f2xPs24YbwRVdmSMsH6RXCkJlPs10EnEkc7h6LectvFusJyozSn1QdYIacMoAX0YQvyijPYgJ1erz63PotQ/R28Nswx65b3URuI3mFbFlj5Cc8G4KBRQTsrsWQJ5IGM++y9ZI8wzaixroF7HdhSj1+Qax4c0MgqzJCMzaoYWnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205840; c=relaxed/simple;
	bh=VIkc+wVCjJOLcjbXDQLb7tJAnUwqr60sSy2p1LU7FhU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G2c50KnDqxf9GRMVuUYNwSnH/VZfNTaTBPBCUEf6SNLay0349JpaqN/CUQ5ut+lJFQI/pPng2OWj0UGSjyUwAN2V2Flnpt3iN2V+wUzB3QsoftPqVn/rnQ88rczVuxycSSS7SALE5fHCs5GNag/jJ6CgHJQDrSbVZuPuzuD/Lh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuslCyPR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuslCyPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205839; x=1806741839;
  h=date:from:to:cc:subject:message-id;
  bh=VIkc+wVCjJOLcjbXDQLb7tJAnUwqr60sSy2p1LU7FhU=;
  b=VuslCyPRKlOJ0ReXEZPh6RI6OvZUNYW8qh03NJtwKzD2uBCbDQvN5kVM
   kmvGJ/gNbX0rh2iadErR/4Y9TWkc3M5eEi8BvTkjWy3QoiIrBdBMqLjs5
   BAYTKQGtIqba0URa0WYFbl9E7PNY7/Kir5eVK2mJH87dJBU1JrsZzLi4u
   nZrdlhEJIWLPce1XCDYrbcZPaiebCXORDyWuTGgNofKC1ZOwnkNJvIUix
   PDWnhW7/OxUf3ouzUDtJ2v5fv2rPcRdd0BmeDla68xFQYV6RYnrs2lzSO
   NwcGll0CzMPiZaK5NPqmY5MvWYc+qBF49dqIvh3NvUrD7h10un2ama/Ys
   A==;
X-CSE-ConnectionGUID: bl//TOQ2RkmrRexzfZWnnw==
X-CSE-MsgGUID: uX8yKhb3SqqK5qx0hOgu3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852228"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:43:58 -0700
X-CSE-ConnectionGUID: liZNA/TdTw66q50WNX4+Cw==
X-CSE-MsgGUID: fSo3DfaOTCKxsq/AwKyYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943411"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8B-0000000014R-3cQ2;
	Fri, 03 Apr 2026 08:43:55 +0000
Date: Fri, 03 Apr 2026 16:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-misc:asoc-7.1 9/26]
 sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <202604030438.omM2s8Vm-lkp@intel.com>
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
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-7.1
head:   e8f504c790103a3221a2f2082704b9f2245d81e8
commit: 00541b86fb578d4949cfdd6aff1f82d43fcf07af [9/26] ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
:::::: branch date: 5 hours ago
:::::: commit date: 27 hours ago
config: csky-randconfig-r121-20260402 (https://download.01.org/0day-ci/archive/20260403/202604030438.omM2s8Vm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030438.omM2s8Vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604030438.omM2s8Vm-lkp@intel.com/

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
