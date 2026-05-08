Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979262809
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 00:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778201221; cv=none; b=kUDCI6kCWYCDexJcH586uBAgUp7WXQyPkw1MPSA83tnDADnmiMflF9K6DFnm+cwQ11QXX6ZPPpjgEMk7JVEiS3wUGzvVkfCra/6/9nPxjMLYCzENPpFjqPXhVTOTNgQnns03/nTxHzW+PBwL81QTDavrksW/UV5RfOoDpDS354k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778201221; c=relaxed/simple;
	bh=G8XWAJ0Z49XbjZitDW3xTpzu2aLbmAMMV8iV0NokyU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bbW9a3HMbL4xrm/SnptheRpP7uzPKQrC9AZDLfJan+BCsnBf/yu71AKa+qTojCfxtWNdpxtNOJM0MAJJYBRijIQQdYXPbexMoBEKTg5M0uOSJTADf57gUh4d3DAcuf54eerkX8wpbhSNl7zbv9WUrMz0qd108Iz0+mxKFe+GIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gyo4tnXe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gyo4tnXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778201219; x=1809737219;
  h=date:from:to:cc:subject:message-id;
  bh=G8XWAJ0Z49XbjZitDW3xTpzu2aLbmAMMV8iV0NokyU4=;
  b=Gyo4tnXeUFIUQ8735wuFQf5/npFA/WGWtlMN/yYBsjxrgdBmXQXO8rOT
   rB6++faO9dYDxINjsuaP4NMG3OIHs5Dp54GUQOoOVWYbwqymuN72Th2U9
   2NyUGngMzzwI05xrdj2Hw7NfDn8ORJqI+Hrzw/MLSM7PPB0aDICSYnRKi
   1P93kkfQ5ZaEboIz7QHzmOZTuC4ShgCD4i/bZ0qw6mel9ggu4BpHGg7Xr
   VsPsHC0DfgCaYtLrM4pwY5JvSabb63mVKSIghY4kY6b3VULc/JNSRXUvv
   tq/zWc5AEpYQwxktTLgKKznWOGDg4AOMfwhqm+Jz+NTdM+j3yKCu+LHgV
   g==;
X-CSE-ConnectionGUID: pbwRrLB7T8G16ZZhQwes/g==
X-CSE-MsgGUID: /1rXoLBzTDqgKsOfKR0C+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78312100"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="78312100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 17:46:59 -0700
X-CSE-ConnectionGUID: uSU2JSasQI+PJwljDaF1Fg==
X-CSE-MsgGUID: cYE6pxl0R+iLbFjjwRAOMw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2026 17:46:58 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL9Mm-000000000f1-0e5V;
	Fri, 08 May 2026 00:46:56 +0000
Date: Fri, 08 May 2026 08:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/fsl/fsl_easrc.c:57:22: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202605080825.0pQD2iZY-lkp@intel.com>
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
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 00541b86fb578d4949cfdd6aff1f82d43fcf07af ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-r132-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080825.0pQD2iZY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080825.0pQD2iZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 00541b86fb57 ("ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080825.0pQD2iZY-lkp@intel.com/

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
