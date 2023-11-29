Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C9238F87
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIrpRtaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272619; x=1732808619;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GMWoVPKPuWm/70KURnQRAofajbMN6v5K2753moXJxpc=;
  b=AIrpRtaUkPZuk7ySOaiImaMZKkOXasvWnT467CfHAjNdGacs/QkDQ6VD
   4ruTmTVq7M2RoiVCs9kSK3lFca9Z/A2S4lqs60/Vg7nAEyPGGCTbt2NHX
   rfuZXDODH8ZGDRSp3/X271TAdRiRmtgHqRR2e39+TG+G4pO+TxB9OyvNo
   y7F+cw0s/c3YUmuDwjD/WYZh9ZE0wYhLi5bw+YJ2Gspjn6oWDyjZI1j/o
   epqlKNbNaARFgfLoJ+Rk/tcIoQLeeORIrxM9zLrLaPpiroIp7s1e7kWQv
   phCbIzxNC6eA3smfxnRQ8t/MrvXMTCBotZvpJj6yM3elaDk4WkhN5fakB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392925483"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392925483"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772724592"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772724592"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 07:43:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mit-0000Ov-0q;
	Wed, 29 Nov 2023 15:43:35 +0000
Date: Wed, 29 Nov 2023 23:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/max98927.c:108 avs_create_dai_link()
 warn: excess argument passed to 'devm_kasprintf'
Message-ID: <202311292330.bWRCZFXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: ef91ae9e682c85e57861234db7d5ad9d071b889b ASoC: Intel: avs: max98927: Validate machine board configuration
date:   7 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231129/202311292330.bWRCZFXh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311292330.bWRCZFXh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311292330.bWRCZFXh-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/max98927.c:108 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/max98927.c:115 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +108 sound/soc/intel/avs/boards/max98927.c

1c993300ab1cec Amadeusz Sławiński 2022-09-30   94  
1c993300ab1cec Amadeusz Sławiński 2022-09-30   95  static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
ef91ae9e682c85 Amadeusz Sławiński 2023-10-12   96  			       int tdm_slot, struct snd_soc_dai_link **dai_link)
1c993300ab1cec Amadeusz Sławiński 2022-09-30   97  {
1c993300ab1cec Amadeusz Sławiński 2022-09-30   98  	struct snd_soc_dai_link_component *platform;
1c993300ab1cec Amadeusz Sławiński 2022-09-30   99  	struct snd_soc_dai_link *dl;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  100  
1c993300ab1cec Amadeusz Sławiński 2022-09-30  101  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  102  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  103  	if (!dl || !platform)
1c993300ab1cec Amadeusz Sławiński 2022-09-30  104  		return -ENOMEM;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  105  
1c993300ab1cec Amadeusz Sławiński 2022-09-30  106  	platform->name = platform_name;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  107  
ef91ae9e682c85 Amadeusz Sławiński 2023-10-12 @108  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
ef91ae9e682c85 Amadeusz Sławiński 2023-10-12  109  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
1c993300ab1cec Amadeusz Sławiński 2022-09-30  110  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  111  	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs) * 2, GFP_KERNEL);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  112  	if (!dl->name || !dl->cpus || !dl->codecs)
1c993300ab1cec Amadeusz Sławiński 2022-09-30  113  		return -ENOMEM;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  114  
ef91ae9e682c85 Amadeusz Sławiński 2023-10-12  115  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
ef91ae9e682c85 Amadeusz Sławiński 2023-10-12  116  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
1c993300ab1cec Amadeusz Sławiński 2022-09-30  117  	dl->codecs[0].name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_DEV0_NAME);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  118  	dl->codecs[0].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_CODEC_NAME);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  119  	dl->codecs[1].name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_DEV1_NAME);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  120  	dl->codecs[1].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_CODEC_NAME);
1c993300ab1cec Amadeusz Sławiński 2022-09-30  121  	if (!dl->cpus->dai_name || !dl->codecs[0].name || !dl->codecs[0].dai_name ||
1c993300ab1cec Amadeusz Sławiński 2022-09-30  122  	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
1c993300ab1cec Amadeusz Sławiński 2022-09-30  123  		return -ENOMEM;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  124  
1c993300ab1cec Amadeusz Sławiński 2022-09-30  125  	dl->num_cpus = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  126  	dl->num_codecs = 2;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  127  	dl->platforms = platform;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  128  	dl->num_platforms = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  129  	dl->id = 0;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  130  	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  131  	dl->be_hw_params_fixup = avs_max98927_be_fixup;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  132  	dl->nonatomic = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  133  	dl->no_pcm = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  134  	dl->dpcm_capture = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  135  	dl->dpcm_playback = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  136  	dl->ignore_pmdown_time = 1;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  137  	dl->ops = &avs_max98927_ops;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  138  
1c993300ab1cec Amadeusz Sławiński 2022-09-30  139  	*dai_link = dl;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  140  
1c993300ab1cec Amadeusz Sławiński 2022-09-30  141  	return 0;
1c993300ab1cec Amadeusz Sławiński 2022-09-30  142  }
1c993300ab1cec Amadeusz Sławiński 2022-09-30  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
