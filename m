Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94B93D0D0
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu5BAmxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703028872; x=1734564872;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JyYibfgef9QUqWfAi9llJnr4jdpD2IqYRtHCNVIkki8=;
  b=hu5BAmxAgg+fbhHAhMqpK7RvC/N//i6sPGVf2EjN0AiXB0P3AVXOqWL/
   qQq1g0w1D/hveS8vqSxYfmrRwql4lJdzBb7ID2R6cdq6+4mu8+fyzxWiJ
   PVd5Y2YyAO0zVnCl19SRuhlT26E1En6OK6PBq/Gpt7CUNZojqbHpZconK
   /KySIHTESmlpd374Yt5ZlJmvYn9LmQ/O7oEfbejVWP5io1EKN2Yj9EvrC
   MgyY776NYKIz91zUE0wLxcDDDCloxtJ0nWOsDwCm54s7w14MQVvQToaWF
   9CgoJxvZziHSOlv7m4UOEmkW0sP8OSHQs+AzRaygpnQupVepD77uBnCN5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2585980"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2585980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 15:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866795401"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="866795401"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2023 15:34:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFjbX-00065J-24;
	Tue, 19 Dec 2023 23:34:27 +0000
Date: Wed, 20 Dec 2023 07:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/es8336.c:210 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202312200737.zAmg94ur-lkp@intel.com>
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
head:   55cb5f43689d7a9ea5bf35ef050f12334f197347
commit: 8d5fed3312ebaa83338cf42746b29a01b9d3d13e ASoC: Intel: avs: es8336: Validate machine board configuration
date:   10 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-141-20231220 (https://download.01.org/0day-ci/archive/20231220/202312200737.zAmg94ur-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312200737.zAmg94ur-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/es8336.c:210 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/es8336.c:217 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +210 sound/soc/intel/avs/boards/es8336.c

32e40c8d6ff920 Cezary Rojewski    2023-06-29  176  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  177  static int avs_es8336_be_fixup(struct snd_soc_pcm_runtime *runtime,
32e40c8d6ff920 Cezary Rojewski    2023-06-29  178  			       struct snd_pcm_hw_params *params)
32e40c8d6ff920 Cezary Rojewski    2023-06-29  179  {
32e40c8d6ff920 Cezary Rojewski    2023-06-29  180  	struct snd_interval *rate, *channels;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  181  	struct snd_mask *fmt;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  182  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  183  	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  184  	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  185  	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  186  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  187  	/* The ADSP will convert the FE rate to 48k, stereo */
32e40c8d6ff920 Cezary Rojewski    2023-06-29  188  	rate->min = rate->max = 48000;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  189  	channels->min = channels->max = 2;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  190  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  191  	/* set SSPN to 24 bit */
32e40c8d6ff920 Cezary Rojewski    2023-06-29  192  	snd_mask_none(fmt);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  193  	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_3LE);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  194  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  195  	return 0;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  196  }
32e40c8d6ff920 Cezary Rojewski    2023-06-29  197  static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
8d5fed3312ebaa Amadeusz Sławiński 2023-10-12  198  			       int tdm_slot, struct snd_soc_dai_link **dai_link)
32e40c8d6ff920 Cezary Rojewski    2023-06-29  199  {
32e40c8d6ff920 Cezary Rojewski    2023-06-29  200  	struct snd_soc_dai_link_component *platform;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  201  	struct snd_soc_dai_link *dl;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  202  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  203  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  204  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  205  	if (!dl || !platform)
32e40c8d6ff920 Cezary Rojewski    2023-06-29  206  		return -ENOMEM;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  207  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  208  	platform->name = platform_name;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  209  
8d5fed3312ebaa Amadeusz Sławiński 2023-10-12 @210  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
8d5fed3312ebaa Amadeusz Sławiński 2023-10-12  211  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
32e40c8d6ff920 Cezary Rojewski    2023-06-29  212  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  213  	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  214  	if (!dl->name || !dl->cpus || !dl->codecs)
32e40c8d6ff920 Cezary Rojewski    2023-06-29  215  		return -ENOMEM;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  216  
8d5fed3312ebaa Amadeusz Sławiński 2023-10-12  217  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
8d5fed3312ebaa Amadeusz Sławiński 2023-10-12  218  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
32e40c8d6ff920 Cezary Rojewski    2023-06-29  219  	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-ESSX8336:00");
32e40c8d6ff920 Cezary Rojewski    2023-06-29  220  	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, ES8336_CODEC_DAI);
32e40c8d6ff920 Cezary Rojewski    2023-06-29  221  	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
32e40c8d6ff920 Cezary Rojewski    2023-06-29  222  		return -ENOMEM;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  223  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  224  	dl->num_cpus = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  225  	dl->num_codecs = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  226  	dl->platforms = platform;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  227  	dl->num_platforms = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  228  	dl->id = 0;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  229  	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  230  	dl->init = avs_es8336_codec_init;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  231  	dl->exit = avs_es8336_codec_exit;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  232  	dl->be_hw_params_fixup = avs_es8336_be_fixup;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  233  	dl->ops = &avs_es8336_ops;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  234  	dl->nonatomic = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  235  	dl->no_pcm = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  236  	dl->dpcm_capture = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  237  	dl->dpcm_playback = 1;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  238  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  239  	*dai_link = dl;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  240  
32e40c8d6ff920 Cezary Rojewski    2023-06-29  241  	return 0;
32e40c8d6ff920 Cezary Rojewski    2023-06-29  242  }
32e40c8d6ff920 Cezary Rojewski    2023-06-29  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
