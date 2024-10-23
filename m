Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74821AC438
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709460; cv=none; b=kmYLy0geBAGj2XXpftiNL07myQa2gdOwK3idd7jDcfZkGmF4F1oiXEjSZSnWAqsegFqKlj5s3i1ZraOOVfRBeO7z0VYSApNtJjzpr/Z/pTNb9FWzbQ6L0LxtIhCPU+59gQtxZ7L4x651Jn8uDwAfvyKrJJS/wHgmIbUo5xelCgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709460; c=relaxed/simple;
	bh=dK5HHwPazscxu77S1sH0RlPn6snVxuM93baoRreyu7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5W3YrPXB85xunomQh1k6UN7zJuW5NE/nmxW4JDQI5WccHIV1ZWQQjdWgccorXw3/fPZmk/UnAUCfL/IAZDeh2eCVJv3kREeEq2MxjtgGf6SYci8ecwsuaE8HUxl8eewn4z30LKrrTSF+YLi/2Faw1bhnMTA6b95NjkeEaQQjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gdknf8Pd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gdknf8Pd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729709459; x=1761245459;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dK5HHwPazscxu77S1sH0RlPn6snVxuM93baoRreyu7A=;
  b=Gdknf8PdCYNQAYf+MBs5YWsmnOAxG+AV8VFDxKsVHS3yHIGFWvZYNYKg
   SxCuDH7JDEmCdE2q48sreeqiDTFIARGL4A8YBUXQC0Qj5gDuxGQp5Ye00
   izPRP7kX2xX2m755K2sT5CRwtEDPtIUIkmCYmYUMLtKDmpXPGeMi77LHD
   bHf3pyTJwsFAmxOMqEZub4FUKOafy6qH/4cOisIJjYncuRrUKfypLCCsy
   clsPtC2njybyxLYgR6tIbbKfepMbW89ZKUZgd5vg0dlOFIRpOu7bCp6Sc
   KpMh4pkicnx+ak3mFdyupGDkUQxVwKJMghe+yqZWNFIgauA7uHqoiR4pL
   Q==;
X-CSE-ConnectionGUID: bit+AD+lTaODy33o+KPpEw==
X-CSE-MsgGUID: 4IvwV0qYR8WROq06tWBVIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29095061"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29095061"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 11:50:58 -0700
X-CSE-ConnectionGUID: KGElv/1FS9qB8IBFMNimuw==
X-CSE-MsgGUID: qhahLp4LQ0OJ35Pq2YUKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="103658711"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2024 11:50:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3gRa-000VIq-2Z;
	Wed, 23 Oct 2024 18:50:54 +0000
Date: Thu, 24 Oct 2024 02:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5682.c:219 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202410240230.Zlkr83mc-lkp@intel.com>
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
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 2172c5b90d80aedc7cbe571e353ae45040e03a3b ASoC: Intel: avs: rt5682: Validate machine board configuration
date:   1 year ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: sparc64-randconfig-r073-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240230.Zlkr83mc-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410240230.Zlkr83mc-lkp@intel.com/

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
