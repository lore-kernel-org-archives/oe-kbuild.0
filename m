Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326F38BDCC
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837468; cv=none; b=uLa3yONYILWuT6/KBT6i5kyP6JZLj5hFqoGzb9I/bYnyZStJQaaZ/I0Q5asE1hzP+r30CgQTdrg2uxnBJ+8c+eqfspgc+7Wc/eJDhBXXhCr3KQ3jhP3FWe7Nsb65FAYn3D2+1ZEWxSQ4kq0sFzgloSOkrRbMoWdNJAscs43Lptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837468; c=relaxed/simple;
	bh=nZOwPU0c1PQXek6ZWWVEQfr8lc+ie7w3KVemepfNPKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O13ikGTCOcucocBhXM+CQgLXmPCMNbPvVxjd5wdBAFW7qGFXC3PlKtFJqOCUNmH5x56ciVsok6UjLa39hoaej3oRuZv0G3XJNtC+ANTsb0pGPRFevb2nKqwqAokG3WlOgmB/g1RlrcfhgK6yvixkmTGO6xE0k8pRRmGGsI/br/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwOZhHeg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwOZhHeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768837466; x=1800373466;
  h=date:from:to:cc:subject:message-id;
  bh=nZOwPU0c1PQXek6ZWWVEQfr8lc+ie7w3KVemepfNPKE=;
  b=GwOZhHeg3Bkm+MPCTLsz3qWX+iNkRmb/XlytgWAeuG2J40BGj2bfYeJO
   b3SWsM+WJRiRhxQypUYQql/WyuFWYn1N/b1ya7QxcvZEdbJQVKq0clwck
   fjqW1HwhAGfO8jskJvQ4cejn6wuAK4qkhvZ467RDmaTkGVs9n/6ScTaxN
   SK+0d7vLgcaoXkj9QOr9BrnR1Qho9pZGLy+YpmrBvXcr5EsEXmX+Nqm/U
   flE27gavjvLI2r6cJ7WAvsHCSSrXxiQw3oZiLYuzbHr7K9giMtXSvVsp4
   dFkMMXepQnNzbKTJT9MeHn9GgON1tHUvBUup+DXMbhpc/WXdNImRzWjje
   w==;
X-CSE-ConnectionGUID: Ar2uqe6ZSFCq2K/2Wb7OFg==
X-CSE-MsgGUID: Ez2Oa/BgRO2u68iR9agGLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57603714"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57603714"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:44:25 -0800
X-CSE-ConnectionGUID: z/NkNXbRRxCAZl1Nnx/ASQ==
X-CSE-MsgGUID: 6HhCWA/7ROu+5QgmQnaBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210031475"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2026 07:44:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhrQT-00000000Nw5-2K9x;
	Mon, 19 Jan 2026 15:44:21 +0000
Date: Mon, 19 Jan 2026 23:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 196/196]
 sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202601192317.zYZXE5wG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 9eda09e511f648adf90efdb805e2429bf5bc25cb [196/196] UPSTREAM: ASoC: hdmi-codec: Add a prepare hook
:::::: branch date: 6 days ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260119/202601192317.zYZXE5wG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601192317.zYZXE5wG-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

Old smatch warnings:
sound/soc/codecs/hdmi-codec.c:551 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +587 sound/soc/codecs/hdmi-codec.c

cd6111b26280a2 Arnaud Pouliquen 2017-01-03  564  
9eda09e511f648 Maxime Ripard    2021-05-25  565  static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
9eda09e511f648 Maxime Ripard    2021-05-25  566  			      struct snd_soc_dai *dai)
9eda09e511f648 Maxime Ripard    2021-05-25  567  {
9eda09e511f648 Maxime Ripard    2021-05-25  568  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
9eda09e511f648 Maxime Ripard    2021-05-25  569  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
9eda09e511f648 Maxime Ripard    2021-05-25  570  	struct snd_pcm_runtime *runtime = substream->runtime;
9eda09e511f648 Maxime Ripard    2021-05-25  571  	unsigned int channels = runtime->channels;
9eda09e511f648 Maxime Ripard    2021-05-25  572  	unsigned int width = snd_pcm_format_width(runtime->format);
9eda09e511f648 Maxime Ripard    2021-05-25  573  	unsigned int rate = runtime->rate;
9eda09e511f648 Maxime Ripard    2021-05-25  574  	struct hdmi_codec_params hp;
9eda09e511f648 Maxime Ripard    2021-05-25  575  	int ret;
09184118a8abae Jyri Sarha       2016-03-31  576  
9eda09e511f648 Maxime Ripard    2021-05-25  577  	if (!hcp->hcd.ops->prepare)
9eda09e511f648 Maxime Ripard    2021-05-25  578  		return 0;
9eda09e511f648 Maxime Ripard    2021-05-25  579  
9eda09e511f648 Maxime Ripard    2021-05-25  580  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
9eda09e511f648 Maxime Ripard    2021-05-25  581  		width, rate, channels);
9eda09e511f648 Maxime Ripard    2021-05-25  582  
9eda09e511f648 Maxime Ripard    2021-05-25  583  	ret = hdmi_codec_fill_codec_params(dai, width, rate, channels, &hp);
9eda09e511f648 Maxime Ripard    2021-05-25  584  	if (ret < 0)
9eda09e511f648 Maxime Ripard    2021-05-25  585  		return ret;
9eda09e511f648 Maxime Ripard    2021-05-25  586  
9eda09e511f648 Maxime Ripard    2021-05-25 @587  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
9eda09e511f648 Maxime Ripard    2021-05-25  588  	ret = snd_pcm_fill_iec958_consumer(runtime, hp.iec.status,
9eda09e511f648 Maxime Ripard    2021-05-25  589  					   sizeof(hp.iec.status));
9eda09e511f648 Maxime Ripard    2021-05-25  590  	if (ret < 0) {
9eda09e511f648 Maxime Ripard    2021-05-25  591  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
9eda09e511f648 Maxime Ripard    2021-05-25  592  			ret);
9eda09e511f648 Maxime Ripard    2021-05-25  593  		return ret;
9eda09e511f648 Maxime Ripard    2021-05-25  594  	}
9eda09e511f648 Maxime Ripard    2021-05-25  595  
9eda09e511f648 Maxime Ripard    2021-05-25  596  	cf->bit_fmt = runtime->format;
9eda09e511f648 Maxime Ripard    2021-05-25  597  	return hcp->hcd.ops->prepare(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e Jerome Brunet    2019-05-06  598  				     cf, &hp);
09184118a8abae Jyri Sarha       2016-03-31  599  }
09184118a8abae Jyri Sarha       2016-03-31  600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
