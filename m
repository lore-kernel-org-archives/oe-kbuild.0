Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B8F16C451
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719665; cv=none; b=KR0NnjMwQhAgxzuI0qIVDo5dphqSLbFBEL+45fZLVoFCZnT4T+hSueUGXRGErrUUGzUtbTgjujFPqrV8UP0ekuCxJ+dAngYKLMy0zZm3J4D5HMJNDXxQ1fyrjCfWtFO9aUCnRmL8sOYgoWQbm7Bztk05Sr9eeduQwN9D4QKxEyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719665; c=relaxed/simple;
	bh=18hyyQIy5TZlCpVf4WyWHRw8PrMDqU+N8ALuU0qtEs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsZ2JvVwJ8IaaVqxIOMXhcP0BSY0mvAOl9aLcQDgdivU2NkoUvEH6qDYwHeW24f8SsP489Rl8UXIt0Z4nyJtx06jtRUPj2g44aJ8OM8fy1dBBgHGfgQ60prv5kU+yaBF8wDQBFp842+yj9OIWAaUVjknkUBn25WhWHUeEoDHnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhyoh4DP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhyoh4DP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719663; x=1765255663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18hyyQIy5TZlCpVf4WyWHRw8PrMDqU+N8ALuU0qtEs0=;
  b=hhyoh4DPeYvm4Y+slzOWknWOQS03d1TJCt8rdwKiuHN9SEpBtdm2y42h
   HlbRf0gCL2N1ioCq8/Yxkb5aZ06uaPzaeWjL/L7UHTLoqeCpXJNALi5Oc
   YqMdNQTIfapXiPZT6/oy6XSpwN6wHH99vSFEONHKpk8fWSadZZOC+53vn
   U7+5DrnBMDvox+x5ZwvA0zrz5IRX2tpqc2eqS6IPoF5fzusO7OtNrtHmk
   aCcUie2wXmDHwTiMd81WF20RXidmo+JDTwbbFiVGoKdUJIrjVr9z65xAH
   ey8+EHg3ZIuFObiAXJkKbNSE5vy6wtodwPyDSyIvxDLRfVBmZUGzJNZkR
   Q==;
X-CSE-ConnectionGUID: Rt42qIowQ6WECuwdmxXalQ==
X-CSE-MsgGUID: WGVrrvX8QA2jZruXTE0bAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34060163"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34060163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:47:41 -0800
X-CSE-ConnectionGUID: wKQXPZzPQGS995/0l2+sdw==
X-CSE-MsgGUID: l0ggwh7tQ8u8y90fg7bznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99012431"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:47:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVgH-0003vD-0F;
	Mon, 09 Dec 2024 04:47:37 +0000
Date: Mon, 9 Dec 2024 12:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/sdw_utils/soc_sdw_rt_amp.c:202
 asoc_sdw_rt_amp_spk_rtd_init() error: uninitialized symbol 'ret'.
Message-ID: <202412082018.GUvC80wl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: cb8ea62e6402067ba092d4c1d66a9440513a572b ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20241208 (https://download.01.org/0day-ci/archive/20241208/202412082018.GUvC80wl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412082018.GUvC80wl-lkp@intel.com/

smatch warnings:
sound/soc/sdw_utils/soc_sdw_rt_amp.c:202 asoc_sdw_rt_amp_spk_rtd_init() error: uninitialized symbol 'ret'.

vim +/ret +202 sound/soc/sdw_utils/soc_sdw_rt_amp.c

5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  177  
bd5838c8999838 sound/soc/intel/boards/sof_sdw_rt_amp.c Vijendar Mukunda     2024-08-01  178  int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  179  {
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  180  	struct snd_soc_card *card = rtd->card;
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  181  	const struct snd_soc_dapm_route *rt_amp_map;
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  182  	char codec_name[CODEC_NAME_SIZE];
84e0a19adb73d7 sound/soc/intel/boards/sof_sdw_rt_amp.c Bard Liao            2024-05-09  183  	struct snd_soc_dai *codec_dai;
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  184  	int ret;
9f3763b3628def sound/soc/intel/boards/sof_sdw_rt_amp.c Bard Liao            2024-02-08  185  	int i;
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  186  
4c11132a886ea9 sound/soc/intel/boards/sof_sdw_rt_amp.c Bard Liao            2024-05-09  187  	rt_amp_map = get_codec_name_and_route(dai, codec_name);
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  188  
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  189  	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  190  					  "%s spk:%s",
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  191  					  card->components, codec_name);
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  192  	if (!card->components)
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  193  		return -ENOMEM;
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  194  
84e0a19adb73d7 sound/soc/intel/boards/sof_sdw_rt_amp.c Bard Liao            2024-05-09  195  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
84e0a19adb73d7 sound/soc/intel/boards/sof_sdw_rt_amp.c Bard Liao            2024-05-09  196  		if (strstr(codec_dai->component->name_prefix, "-1"))
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  197  			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
84e0a19adb73d7 sound/soc/intel/boards/sof_sdw_rt_amp.c Bard Liao            2024-05-09  198  		else if (strstr(codec_dai->component->name_prefix, "-2"))
5c10da436ebd93 sound/soc/intel/boards/sof_sdw_rt_amp.c Gongjun Song         2022-12-06  199  			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  200  	}
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  201  
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25 @202  	return ret;
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  203  }
ccc96ae2814a7f sound/soc/sdw_utils/soc_sdw_rt_amp.c    Vijendar Mukunda     2024-08-01  204  EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_spk_rtd_init, SND_SOC_SDW_UTILS);
52db12d193d457 sound/soc/intel/boards/sof_sdw_rt1308.c Pierre-Louis Bossart 2020-03-25  205  

:::::: The code at line 202 was first introduced by commit
:::::: 52db12d193d45728e738df6119702cba08fd46a2 ASoC: Intel: boards: add sof_sdw machine driver

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
