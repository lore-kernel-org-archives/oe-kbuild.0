Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0715E9D
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjwHaef6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701253124; x=1732789124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B8HBkHN5HQ6ibe5J+tgriUwrhDZulfxhqtiwVhEKIDQ=;
  b=SjwHaef6UmnVAo0QWPHOHFdwgVtrY0B5rdO2Pw7KDoX5QJWI5iNQ/1vV
   3s8LbD2at3EYKgiC13TB/i9FApHiKeI+vsHPn12sncIsmznYLi/cqO5gE
   9SLEl2yPeUPt+QukdSb1kZSQ7MCAWYqKOia2uTtP34B9hOwysTxhIFnLu
   AUrw/jYaBPyPb7UoQ8024tB/lJUe5Le/919sX3UGvpPEUO7lQlPQlpXxx
   4bFPO0xTWYowUVGnUP53WtfJIT6feKXRMJLFGRBC8vz8aJ2I2nvOwY3Jk
   Wpg5W7WnXc6P1MBDC/SG0Kb1YP7Vi6cnHIRpcd5r/m7LXeizbsGvTgYwk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="34799"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="34799"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839362030"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="839362030"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 02:18:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8He6-00003r-03;
	Wed, 29 Nov 2023 10:18:20 +0000
Date: Wed, 29 Nov 2023 18:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5682.c:219 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202311291534.N6sBnJpC-lkp@intel.com>
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
commit: 2172c5b90d80aedc7cbe571e353ae45040e03a3b ASoC: Intel: avs: rt5682: Validate machine board configuration
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231129/202311291534.N6sBnJpC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291534.N6sBnJpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311291534.N6sBnJpC-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/rt5682.c:219 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/rt5682.c:226 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +219 sound/soc/intel/avs/boards/rt5682.c

d24dbc865c2bd5 Amadeusz Sławiński 2023-03-03  205  
748102786b3ce0 Cezary Rojewski    2022-05-11  206  static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
2172c5b90d80ae Amadeusz Sławiński 2023-10-12  207  			       int tdm_slot, struct snd_soc_dai_link **dai_link)
748102786b3ce0 Cezary Rojewski    2022-05-11  208  {
748102786b3ce0 Cezary Rojewski    2022-05-11  209  	struct snd_soc_dai_link_component *platform;
748102786b3ce0 Cezary Rojewski    2022-05-11  210  	struct snd_soc_dai_link *dl;
748102786b3ce0 Cezary Rojewski    2022-05-11  211  
748102786b3ce0 Cezary Rojewski    2022-05-11  212  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
748102786b3ce0 Cezary Rojewski    2022-05-11  213  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
748102786b3ce0 Cezary Rojewski    2022-05-11  214  	if (!dl || !platform)
748102786b3ce0 Cezary Rojewski    2022-05-11  215  		return -ENOMEM;
748102786b3ce0 Cezary Rojewski    2022-05-11  216  
748102786b3ce0 Cezary Rojewski    2022-05-11  217  	platform->name = platform_name;
748102786b3ce0 Cezary Rojewski    2022-05-11  218  
2172c5b90d80ae Amadeusz Sławiński 2023-10-12 @219  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
2172c5b90d80ae Amadeusz Sławiński 2023-10-12  220  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
748102786b3ce0 Cezary Rojewski    2022-05-11  221  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
748102786b3ce0 Cezary Rojewski    2022-05-11  222  	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
748102786b3ce0 Cezary Rojewski    2022-05-11  223  	if (!dl->name || !dl->cpus || !dl->codecs)
748102786b3ce0 Cezary Rojewski    2022-05-11  224  		return -ENOMEM;
748102786b3ce0 Cezary Rojewski    2022-05-11  225  
2172c5b90d80ae Amadeusz Sławiński 2023-10-12  226  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
2172c5b90d80ae Amadeusz Sławiński 2023-10-12  227  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
748102786b3ce0 Cezary Rojewski    2022-05-11  228  	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5682:00");
19bb7c3053ee54 Amadeusz Sławiński 2022-11-29  229  	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, AVS_RT5682_CODEC_DAI_NAME);
748102786b3ce0 Cezary Rojewski    2022-05-11  230  	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
748102786b3ce0 Cezary Rojewski    2022-05-11  231  		return -ENOMEM;
748102786b3ce0 Cezary Rojewski    2022-05-11  232  
748102786b3ce0 Cezary Rojewski    2022-05-11  233  	dl->num_cpus = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  234  	dl->num_codecs = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  235  	dl->platforms = platform;
748102786b3ce0 Cezary Rojewski    2022-05-11  236  	dl->num_platforms = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  237  	dl->id = 0;
27cd41698de49c Cezary Rojewski    2023-06-29  238  	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
748102786b3ce0 Cezary Rojewski    2022-05-11  239  	dl->init = avs_rt5682_codec_init;
a9d8723c72eada Amadeusz Sławiński 2022-11-29  240  	dl->exit = avs_rt5682_codec_exit;
d24dbc865c2bd5 Amadeusz Sławiński 2023-03-03  241  	dl->be_hw_params_fixup = avs_rt5682_be_fixup;
748102786b3ce0 Cezary Rojewski    2022-05-11  242  	dl->ops = &avs_rt5682_ops;
748102786b3ce0 Cezary Rojewski    2022-05-11  243  	dl->nonatomic = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  244  	dl->no_pcm = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  245  	dl->dpcm_capture = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  246  	dl->dpcm_playback = 1;
748102786b3ce0 Cezary Rojewski    2022-05-11  247  
748102786b3ce0 Cezary Rojewski    2022-05-11  248  	*dai_link = dl;
748102786b3ce0 Cezary Rojewski    2022-05-11  249  
748102786b3ce0 Cezary Rojewski    2022-05-11  250  	return 0;
748102786b3ce0 Cezary Rojewski    2022-05-11  251  }
748102786b3ce0 Cezary Rojewski    2022-05-11  252  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
