Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AEA17BB0C
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728511467; cv=none; b=gcwqfdm3AYZycKRgMspXSIruKEf51pnlS7LCmv01qZ7xXwEpSHqbG3btrn+JBnNprMUruxDall39D2CJ+bpk935pVKTNJEIg0EFopQZtvheBs0valZFV1nofHBTbAcuJuMpoVX1aySHjCzQw/EaNXPbbL/Dexoan5nbAYtBhuOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728511467; c=relaxed/simple;
	bh=h6Sbv89PH1BtyZg949BgXtRf8kxy05CZMq8tWYiFOLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFIe7n5nzQzHZWqz38QuMEypS0g9N0V+x7Xs7MwCwQLIeVCN6JRbqBW+JeoUk5tXmndH3TzE+2K+Zn1/SpHsXmTeWoC1UuUUz+TsDmo6N1BN1n+FkCUE74Dfye4FinZ60bAZkR6jNjCyFohxvjCZZfvsRg+q+dB36TDgjE17Xmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAM25kVH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAM25kVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728511465; x=1760047465;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h6Sbv89PH1BtyZg949BgXtRf8kxy05CZMq8tWYiFOLM=;
  b=bAM25kVHSX05f3O9QK96GaUAfSNqIZqq0oQ2f1mpQmrnpza4vcXC3WEE
   9ZFKlfYD4cYBLDFC9NvRUULVxaOtA6zDf4kWzRcZ9UB49zIoNtR4ZfERA
   I4l4jK54EfVBk07aod1fj3K6q9AnCJ8/pfVm1lr9eEKwKv6VKJp/IpqJ5
   zMFdbBePbxweQAzWLrqaeiGLJHi/sB2fu4OmNtnT9HdqimP5yn2zq/+5r
   UPjZMLX8CvgSKn2T2wIULwhAiVi3IPZTQ60zQraRf/AgZrr1u9nl4CToR
   zlQvTZavs+nyvCZGLDk/gw7ShebP/3kU249ifC1vA/Dchb44LRfRaeViN
   Q==;
X-CSE-ConnectionGUID: YBvrjqpFTh6F2kBcGIzpxQ==
X-CSE-MsgGUID: gUjFa+JiRKy8wTjZCR2CVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38972806"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="38972806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 15:04:24 -0700
X-CSE-ConnectionGUID: ZERYqlcoT3qB2/NUhv/Rkg==
X-CSE-MsgGUID: GQI7W2kmTsy5aNG0T/QGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="76052263"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2024 15:04:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syen7-0009rA-0x;
	Wed, 09 Oct 2024 22:04:21 +0000
Date: Thu, 10 Oct 2024 06:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/es8336.c:210 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202410100508.gyqVZpgQ-lkp@intel.com>
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
head:   b983b271662bd6104d429b0fd97af3333ba760bf
commit: 8d5fed3312ebaa83338cf42746b29a01b9d3d13e ASoC: Intel: avs: es8336: Validate machine board configuration
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100508.gyqVZpgQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410100508.gyqVZpgQ-lkp@intel.com/

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
