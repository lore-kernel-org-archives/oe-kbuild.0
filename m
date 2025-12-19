Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1D28000B
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766166373; cv=none; b=j2ISH8MssmgbcOCq1KqrGHBHw1eoW5FlIUc6Dot/bJOjx4HkYVgdbUj7/8iK432FZXZBttf+ROyqwyAzZu5kB3zDmyQ0pB7uEn2nAGAeHGIjn15cyMQb+eTbyk+5+24M4g1rS+2DHr6uljOs5WiDVFN+K6XENjhNLlpgcrlY+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766166373; c=relaxed/simple;
	bh=eUbM1JBrA2OpDQ7i2bL9rAzt0I1xp0SF6B3eK1blDlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k08hQ1rIe1WdpmYP+9sWZ3X0aNujUTocTKQAbufJ5zEwCHwaj/DmJLBUWTiNCYPH3c1GvU0EUeCnvpdXqikpyffbgNcI2Wc5wFQVjHq6NlfR7SQlZDShahvkbWmmKEbyPmCf5S9ZSjwDairMG3xUiVFZvMyREwZJ+iULFqDv0u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxmQfWBA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxmQfWBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766166372; x=1797702372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eUbM1JBrA2OpDQ7i2bL9rAzt0I1xp0SF6B3eK1blDlE=;
  b=WxmQfWBAarKZ/AS08GemcmADVwq75ykhG9ac+Zse9PPeJH4lgcHvlr1g
   xxuS+iodADcDimRCIY4g9AZATTia0/7Yf4WNHNGe5+HJi2YoGa9H2p3p+
   OA+M5ZoTGW8YFzWSbaC9rNXc1VWijumK8hyMDcU9sui182Dp7HyQJoyGL
   ePt6GUv1eYsQJExrYNxHsZlB0JyPCsP81DqSFhiMjBZNIShy4+GOM50gW
   P7er4VKSbk3jRDI/MhwEEeOAacRSbN7pvnw9AeB/C4+HLVbKqbkNq3zaO
   CpwtTaGUjceXBGEWzk7eTs8D8VTgREWvnKHRUxxmzncjTpnODARdxZJRK
   g==;
X-CSE-ConnectionGUID: iFoPI/bTSVWpvFSRVwYNjg==
X-CSE-MsgGUID: +jgJk75xSQ+I/AOBe0J4cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68062766"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68062766"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 09:46:12 -0800
X-CSE-ConnectionGUID: uJiHphr3RZ+hKJR5QjpWvQ==
X-CSE-MsgGUID: vU0dmnKLRMKHTyOZPyztcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198173670"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Dec 2025 09:46:08 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWeYG-000000003p9-1kZ8;
	Fri, 19 Dec 2025 17:46:04 +0000
Date: Sat, 20 Dec 2025 01:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5640.c:151 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202512200119.zHHDZY9m-lkp@intel.com>
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
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: c95e925daa434ee1a40a86aec6476ce588e4bd77 ASoC: Intel: avs: Add rt5640 machine board
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-r073-20251215 (https://download.01.org/0day-ci/archive/20251220/202512200119.zHHDZY9m-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200119.zHHDZY9m-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/rt5640.c:151 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/rt5640.c:158 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +151 sound/soc/intel/avs/boards/rt5640.c

c95e925daa434e Cezary Rojewski 2025-05-30  129  
c95e925daa434e Cezary Rojewski 2025-05-30  130  static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
c95e925daa434e Cezary Rojewski 2025-05-30  131  			       struct snd_soc_acpi_mach *mach,
c95e925daa434e Cezary Rojewski 2025-05-30  132  			       struct snd_soc_dai_link **dai_link)
c95e925daa434e Cezary Rojewski 2025-05-30  133  {
c95e925daa434e Cezary Rojewski 2025-05-30  134  	struct snd_soc_dai_link_component *platform;
c95e925daa434e Cezary Rojewski 2025-05-30  135  	struct snd_soc_dai_link *dl;
c95e925daa434e Cezary Rojewski 2025-05-30  136  	u32 uid = 0;
c95e925daa434e Cezary Rojewski 2025-05-30  137  	int ret;
c95e925daa434e Cezary Rojewski 2025-05-30  138  
c95e925daa434e Cezary Rojewski 2025-05-30  139  	if (mach->uid) {
c95e925daa434e Cezary Rojewski 2025-05-30  140  		ret = kstrtou32(mach->uid, 0, &uid);
c95e925daa434e Cezary Rojewski 2025-05-30  141  		if (ret)
c95e925daa434e Cezary Rojewski 2025-05-30  142  			return ret;
c95e925daa434e Cezary Rojewski 2025-05-30  143  		uid--; /* 0-based indexing. */
c95e925daa434e Cezary Rojewski 2025-05-30  144  	}
c95e925daa434e Cezary Rojewski 2025-05-30  145  
c95e925daa434e Cezary Rojewski 2025-05-30  146  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  147  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  148  	if (!dl || !platform)
c95e925daa434e Cezary Rojewski 2025-05-30  149  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  150  
c95e925daa434e Cezary Rojewski 2025-05-30 @151  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
c95e925daa434e Cezary Rojewski 2025-05-30  152  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
c95e925daa434e Cezary Rojewski 2025-05-30  153  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  154  	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  155  	if (!dl->name || !dl->cpus || !dl->codecs)
c95e925daa434e Cezary Rojewski 2025-05-30  156  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  157  
c95e925daa434e Cezary Rojewski 2025-05-30  158  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
c95e925daa434e Cezary Rojewski 2025-05-30  159  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
c95e925daa434e Cezary Rojewski 2025-05-30  160  	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5640:0%d", uid);
c95e925daa434e Cezary Rojewski 2025-05-30  161  	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT5640_CODEC_DAI);
c95e925daa434e Cezary Rojewski 2025-05-30  162  	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
c95e925daa434e Cezary Rojewski 2025-05-30  163  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  164  
c95e925daa434e Cezary Rojewski 2025-05-30  165  	platform->name = dev_name(dev);
c95e925daa434e Cezary Rojewski 2025-05-30  166  	dl->num_cpus = 1;
c95e925daa434e Cezary Rojewski 2025-05-30  167  	dl->num_codecs = 1;
c95e925daa434e Cezary Rojewski 2025-05-30  168  	dl->platforms = platform;
c95e925daa434e Cezary Rojewski 2025-05-30  169  	dl->num_platforms = 1;
c95e925daa434e Cezary Rojewski 2025-05-30  170  	dl->id = 0;
c95e925daa434e Cezary Rojewski 2025-05-30  171  	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
c95e925daa434e Cezary Rojewski 2025-05-30  172  	dl->init = avs_rt5640_codec_init;
c95e925daa434e Cezary Rojewski 2025-05-30  173  	dl->exit = avs_rt5640_codec_exit;
c95e925daa434e Cezary Rojewski 2025-05-30  174  	dl->be_hw_params_fixup = avs_rt5640_be_fixup;
c95e925daa434e Cezary Rojewski 2025-05-30  175  	dl->ops = &avs_rt5640_ops;
c95e925daa434e Cezary Rojewski 2025-05-30  176  	dl->nonatomic = 1;
c95e925daa434e Cezary Rojewski 2025-05-30  177  	dl->no_pcm = 1;
c95e925daa434e Cezary Rojewski 2025-05-30  178  
c95e925daa434e Cezary Rojewski 2025-05-30  179  	*dai_link = dl;
c95e925daa434e Cezary Rojewski 2025-05-30  180  
c95e925daa434e Cezary Rojewski 2025-05-30  181  	return 0;
c95e925daa434e Cezary Rojewski 2025-05-30  182  }
c95e925daa434e Cezary Rojewski 2025-05-30  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
