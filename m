Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40448210A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwNd0rk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702197339; x=1733733339;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OGJSHQapaqVhDLU/0qtwn6Ck4ZseHVoQpiIqVTlUKCA=;
  b=WwNd0rk+kbQckDKM7ii8yEf+A0cQRKmIwDWbbUYnwDZ/em8vPh8j12xc
   vCR9v3vGJ/F7nun+Wxq9Lz7V1HIgk7QkI2lpLIXuyQ5VRLufP4y7NONg6
   nRcIAVFnaYzc+aR8TrX6Jqd4+dbsAJxewi86XggsD5TOACmvaM+2LbVeX
   EbVGM+1fKgadqxaIyTUUmtQFk0NDf3FW09aMdpIWVuX69wEhx9HIDERtq
   +s1lSVnI+k3wQ3FcD+qK78fAZ2rfqMnEwXccG+QKsChmdh+OR+wFAfBoM
   DirdnVyf43pzd3/avqkJqOv3ZtWUDRNBPTyd0fjcmmlSWUfygjnP98cFr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="391714127"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="391714127"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 00:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="806885945"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="806885945"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Dec 2023 00:35:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCFHi-000GcQ-1p;
	Sun, 10 Dec 2023 08:35:34 +0000
Date: Sun, 10 Dec 2023 16:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5682.c:219 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202312101652.6krC3ZJW-lkp@intel.com>
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
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 2172c5b90d80aedc7cbe571e353ae45040e03a3b ASoC: Intel: avs: rt5682: Validate machine board configuration
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231210/202312101652.6krC3ZJW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101652.6krC3ZJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312101652.6krC3ZJW-lkp@intel.com/

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
