Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F43B101F2
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 04:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731817375; cv=none; b=DKS4UzQys24DXCzxxf5ntdtNXABdBAOBa1Kq3m5jGSXGQtIeUXiGvg7HGEs3iQekWqMVL1TraLj7yFdvisgvZ5iHrT1RFIXv5FRU51d9WIqebJG4IiAOudaMSI+4xCGT1sNur/n5+vGopTbx2NunrDSc8mD3YzDDqJ3DhjT95rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731817375; c=relaxed/simple;
	bh=UIAtZaMAc5aThHQkNI87ceBpFeN2WhYUgdrvgcf7eng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMKp7P8OcNdykky9Zx4ZdB8esKnKe0JlTTu3fFnAOqpeCh/OM1rmPEUKAl3bzsJhGhlXJzg40tjRYuNlXro1iszA4W8wqbCm8pR4XBfO+jLLcJQ2jEIAxtfofxaR1/wxZIWc8gpEvR0OtvuKPxjSqMUntP7b2zJAlgQYdJNFFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XN2LexOQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XN2LexOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731817374; x=1763353374;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UIAtZaMAc5aThHQkNI87ceBpFeN2WhYUgdrvgcf7eng=;
  b=XN2LexOQbby58G+TAxKyM6QBRVsWoa6Tk45Ua9hOol2dQx9qklQcAVIg
   OY4TXg74LzPTz2wgVFpX+OAb8tRzuxBeF7fEQHirzdot4ODuzLWAbAg+a
   4pJx8Yqw6FPQouQDpm8sXPn/UVK28lpXp+2NWM1gNzIOHJT+tPfPB9VC4
   M7p5WM+4ujHuHEidVwv3fwLMqHXx+6q6vKWlYXCrKEw+LbkVQlKIQs7Ul
   UNeSzHhCyronmma5lN22iDzS6+V1Ea/+1/5GQvPRycWgmqhedfNo5bWcr
   XNGUixvi1Za43Zm3QRKfmSDtK0ARgLjx2v8+M8hc76+GvKc3M6CZuqxoL
   w==;
X-CSE-ConnectionGUID: 1Y1jVplPTEafeF+1ixwjSQ==
X-CSE-MsgGUID: Mc3djAGRSVqQEqqKDaqsPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54290829"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="54290829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 20:22:51 -0800
X-CSE-ConnectionGUID: jMpkFuXQS26+kbf03FYfyA==
X-CSE-MsgGUID: mHiOrT7IT7+SFDbT6GE8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="89325852"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2024 20:22:48 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWoA-0001Rh-1O;
	Sun, 17 Nov 2024 04:22:46 +0000
Date: Sun, 17 Nov 2024 12:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/max98373.c:111 avs_create_dai_link()
 warn: excess argument passed to 'devm_kasprintf'
Message-ID: <202411171235.z1crtO2m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: a1ec836b17f7dea35f6b4b3a7c2ad4306da804c9 ASoC: Intel: avs: max98373: Validate machine board configuration
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241117/202411171235.z1crtO2m-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411171235.z1crtO2m-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/max98373.c:111 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/max98373.c:118 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +111 sound/soc/intel/avs/boards/max98373.c

223a0a945821b9 Amadeusz Sławiński 2022-05-11   97  
223a0a945821b9 Amadeusz Sławiński 2022-05-11   98  static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
a1ec836b17f7de Amadeusz Sławiński 2023-10-12   99  			       int tdm_slot, struct snd_soc_dai_link **dai_link)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  100  {
223a0a945821b9 Amadeusz Sławiński 2022-05-11  101  	struct snd_soc_dai_link_component *platform;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  102  	struct snd_soc_dai_link *dl;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  103  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  104  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  105  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  106  	if (!dl || !platform)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  107  		return -ENOMEM;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  108  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  109  	platform->name = platform_name;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  110  
a1ec836b17f7de Amadeusz Sławiński 2023-10-12 @111  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
a1ec836b17f7de Amadeusz Sławiński 2023-10-12  112  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
223a0a945821b9 Amadeusz Sławiński 2022-05-11  113  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  114  	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs) * 2, GFP_KERNEL);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  115  	if (!dl->name || !dl->cpus || !dl->codecs)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  116  		return -ENOMEM;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  117  
a1ec836b17f7de Amadeusz Sławiński 2023-10-12  118  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
a1ec836b17f7de Amadeusz Sławiński 2023-10-12  119  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
223a0a945821b9 Amadeusz Sławiński 2022-05-11  120  	dl->codecs[0].name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_DEV0_NAME);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  121  	dl->codecs[0].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_CODEC_NAME);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  122  	dl->codecs[1].name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_DEV1_NAME);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  123  	dl->codecs[1].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_CODEC_NAME);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  124  	if (!dl->cpus->dai_name || !dl->codecs[0].name || !dl->codecs[0].dai_name ||
223a0a945821b9 Amadeusz Sławiński 2022-05-11  125  	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  126  		return -ENOMEM;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  127  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  128  	dl->num_cpus = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  129  	dl->num_codecs = 2;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  130  	dl->platforms = platform;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  131  	dl->num_platforms = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  132  	dl->id = 0;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  133  	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  134  	dl->be_hw_params_fixup = avs_max98373_be_fixup;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  135  	dl->nonatomic = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  136  	dl->no_pcm = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  137  	dl->dpcm_capture = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  138  	dl->dpcm_playback = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  139  	dl->ignore_pmdown_time = 1;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  140  	dl->ops = &avs_max98373_ops;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  141  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  142  	*dai_link = dl;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  143  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  144  	return 0;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  145  }
223a0a945821b9 Amadeusz Sławiński 2022-05-11  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
