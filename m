Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A71D547
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk40D26K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701259315; x=1732795315;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4ZTsUUcyXHpkSsTZMY0o7oA2Ncwf/o0XaIAtbGXZvYU=;
  b=Xk40D26Kmw2OXSDawhda1zXZ0x167wj8Z/mjLS6Su57b8saU23ij0V/e
   3QAJL7+jEPUlg5ajnCiwyBKh2Cw0AqkOoJ9vF3gZKju7Xb/uD73cLK2zy
   dv6RRflHFhodr4rncG4AaNgfAguADprckcAkF3MlDK6dpI80kR4NZMAJK
   SFKYfzk81MIjZRM1u/wcZ2pHBz51xO7AzFFVOXBg0hvGGxIpeMtA0MkoF
   1RjOs7KWGO/2T28ZVNUZ4ViZ4gkUgcGqetfVoVRI8Hc8kqEyrhNqHIRJu
   TICUEfznnEObNbl5Fl4Zq6LVQAnzQo8dLm2+R8xV/6pwSbL0p3sRIKac5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372515837"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="372515837"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762295548"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762295548"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2023 04:01:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8JGH-0000C8-2M;
	Wed, 29 Nov 2023 12:01:49 +0000
Date: Wed, 29 Nov 2023 20:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/max98373.c:111 avs_create_dai_link()
 warn: excess argument passed to 'devm_kasprintf'
Message-ID: <202311291958.z9smYefo-lkp@intel.com>
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
commit: a1ec836b17f7dea35f6b4b3a7c2ad4306da804c9 ASoC: Intel: avs: max98373: Validate machine board configuration
date:   7 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231129/202311291958.z9smYefo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291958.z9smYefo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311291958.z9smYefo-lkp@intel.com/

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
