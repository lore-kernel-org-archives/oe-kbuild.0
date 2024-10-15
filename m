Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDA19F132
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987228; cv=none; b=sTWit0M14n5ozehwQOA5CKqdzisFWd3D/0yxk1YjmNVUKCyE1Muu20vLdvf69LlQuwxfi6EGQQrewZOJUNdbw2nvCKqVwaMhJY528Uv9QK/hyo2ZeA/XvQhIT2bTaQjbFvOkECl6NBw1KONaD0Fo+vn/WeelmRyOJaKIHz/NU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987228; c=relaxed/simple;
	bh=agMqWwyb2lm/ccI6SLlc1bAUBmdzgBQB5GlgXz2Fk14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGaSVRlkuqQS471ADzG06/DwSNGr930/2C7bH77xPysDNqlhb+IXxA0mcWmJX3nXrXU7LVie0UKiqXOWv6v0xGmkupH6HVuY+Voh1r/Am5Ld0sYBdrrmybCD1pp0KXZFB5pdItsBbVVFa9erin+x965wrp7Kqo9whf8xVQOtfms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3VZowb5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3VZowb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728987226; x=1760523226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agMqWwyb2lm/ccI6SLlc1bAUBmdzgBQB5GlgXz2Fk14=;
  b=L3VZowb5Om0bjBrJnuW9Zi3S8PvKTwPxO85bdcPvy5WQdTdhF61tPfFy
   mq4HLC6oa6eSGMTygAywTFM6AgDANHhjk/z2lkndAehehSH7F3cOoxb7K
   BuSjho1ZIuCQ+kQgWXSlyFKJ0VRRjb+urDrgG/idOD5Q2APXhO5XG8VY8
   TF/txWI4SCX1MK1ALyq5Xj6FdBk07pb8WNJfrg5b2O0GrIgd954gxACgq
   eW5aVTXWZXQjl2YjseGWjduLjmOOVKjQow02hV1rYbjwXuFKNbpvUAR7z
   1sXdiRuPhWpll2Jx6zNrA2vos7qRmLrBUGqLiZm9iS5pMQO1o7f82F8bq
   Q==;
X-CSE-ConnectionGUID: W63V6opQS36d0teaUOjneQ==
X-CSE-MsgGUID: p6WZ7JdZQr64siI3wcMTWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39493247"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39493247"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 03:13:46 -0700
X-CSE-ConnectionGUID: cFpQTeSqTq2KLuWt7W3JJg==
X-CSE-MsgGUID: xmP50e8mRaGPRpslJFSqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77469239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2024 03:13:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0eYg-000Hx1-04;
	Tue, 15 Oct 2024 10:13:42 +0000
Date: Tue, 15 Oct 2024 18:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3253/4439] sound/soc/fsl/imx-card.c:373
 imx_aif_hw_params() error: uninitialized symbol 'codec_dai'.
Message-ID: <202410151840.i9myCaRQ-lkp@intel.com>
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
TO: Chancel Liu <chancel.liu@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Iuliana Prodan <iuliana.prodan@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
commit: 892373e4de626c61e91816e3d3970d82beb50c4b [3253/4439] ASoC: imx-card: Set mclk for codec
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151840.i9myCaRQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410151840.i9myCaRQ-lkp@intel.com/

smatch warnings:
sound/soc/fsl/imx-card.c:373 imx_aif_hw_params() error: uninitialized symbol 'codec_dai'.

vim +/codec_dai +373 sound/soc/fsl/imx-card.c

aa736700f42fa0 Shengjiu Wang       2021-05-17  288  
aa736700f42fa0 Shengjiu Wang       2021-05-17  289  static int imx_aif_hw_params(struct snd_pcm_substream *substream,
aa736700f42fa0 Shengjiu Wang       2021-05-17  290  			     struct snd_pcm_hw_params *params)
aa736700f42fa0 Shengjiu Wang       2021-05-17  291  {
b695d8be5bba98 Krzysztof Kozlowski 2024-04-30  292  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
14ec63f678e8be Kuninori Morimoto   2023-09-11  293  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
aa736700f42fa0 Shengjiu Wang       2021-05-17  294  	struct snd_soc_card *card = rtd->card;
aa736700f42fa0 Shengjiu Wang       2021-05-17  295  	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
aa736700f42fa0 Shengjiu Wang       2021-05-17  296  	struct dai_link_data *link_data = &data->link_data[rtd->num];
aa736700f42fa0 Shengjiu Wang       2021-05-17  297  	struct imx_card_plat_data *plat_data = data->plat_data;
aa736700f42fa0 Shengjiu Wang       2021-05-17  298  	struct device *dev = card->dev;
aa736700f42fa0 Shengjiu Wang       2021-05-17  299  	struct snd_soc_dai *codec_dai;
aa736700f42fa0 Shengjiu Wang       2021-05-17  300  	unsigned long mclk_freq;
aa736700f42fa0 Shengjiu Wang       2021-05-17  301  	unsigned int fmt = rtd->dai_link->dai_fmt;
aa736700f42fa0 Shengjiu Wang       2021-05-17  302  	unsigned int slots, slot_width;
aa736700f42fa0 Shengjiu Wang       2021-05-17  303  	int ret, i;
aa736700f42fa0 Shengjiu Wang       2021-05-17  304  
aa736700f42fa0 Shengjiu Wang       2021-05-17  305  	slots = link_data->slots;
aa736700f42fa0 Shengjiu Wang       2021-05-17  306  	slot_width = link_data->slot_width;
aa736700f42fa0 Shengjiu Wang       2021-05-17  307  
aa736700f42fa0 Shengjiu Wang       2021-05-17  308  	if (!format_is_tdm(link_data)) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  309  		if (format_is_dsd(params)) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  310  			slots = 1;
aa736700f42fa0 Shengjiu Wang       2021-05-17  311  			slot_width = params_width(params);
aa736700f42fa0 Shengjiu Wang       2021-05-17  312  			fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
aa736700f42fa0 Shengjiu Wang       2021-05-17  313  			      SND_SOC_DAIFMT_PDM;
aa736700f42fa0 Shengjiu Wang       2021-05-17  314  		} else {
aa736700f42fa0 Shengjiu Wang       2021-05-17  315  			slots = 2;
aa736700f42fa0 Shengjiu Wang       2021-05-17  316  			slot_width = params_physical_width(params);
aa736700f42fa0 Shengjiu Wang       2021-05-17  317  			fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
aa736700f42fa0 Shengjiu Wang       2021-05-17  318  			      SND_SOC_DAIFMT_I2S;
aa736700f42fa0 Shengjiu Wang       2021-05-17  319  		}
aa736700f42fa0 Shengjiu Wang       2021-05-17  320  	}
aa736700f42fa0 Shengjiu Wang       2021-05-17  321  
3b14c15a333b82 Charles Keepax      2022-05-19  322  	ret = snd_soc_dai_set_fmt(cpu_dai, snd_soc_daifmt_clock_provider_flipped(fmt));
aa736700f42fa0 Shengjiu Wang       2021-05-17  323  	if (ret && ret != -ENOTSUPP) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  324  		dev_err(dev, "failed to set cpu dai fmt: %d\n", ret);
aa736700f42fa0 Shengjiu Wang       2021-05-17  325  		return ret;
aa736700f42fa0 Shengjiu Wang       2021-05-17  326  	}
aa736700f42fa0 Shengjiu Wang       2021-05-17  327  	ret = snd_soc_dai_set_tdm_slot(cpu_dai,
aa736700f42fa0 Shengjiu Wang       2021-05-17  328  				       BIT(slots) - 1,
aa736700f42fa0 Shengjiu Wang       2021-05-17  329  				       BIT(slots) - 1,
aa736700f42fa0 Shengjiu Wang       2021-05-17  330  				       slots, slot_width);
aa736700f42fa0 Shengjiu Wang       2021-05-17  331  	if (ret && ret != -ENOTSUPP) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  332  		dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret);
aa736700f42fa0 Shengjiu Wang       2021-05-17  333  		return ret;
aa736700f42fa0 Shengjiu Wang       2021-05-17  334  	}
aa736700f42fa0 Shengjiu Wang       2021-05-17  335  
aa736700f42fa0 Shengjiu Wang       2021-05-17  336  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  337  		ret = snd_soc_dai_set_fmt(codec_dai, fmt);
aa736700f42fa0 Shengjiu Wang       2021-05-17  338  		if (ret && ret != -ENOTSUPP) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  339  			dev_err(dev, "failed to set codec dai[%d] fmt: %d\n", i, ret);
aa736700f42fa0 Shengjiu Wang       2021-05-17  340  			return ret;
aa736700f42fa0 Shengjiu Wang       2021-05-17  341  		}
aa736700f42fa0 Shengjiu Wang       2021-05-17  342  
aa736700f42fa0 Shengjiu Wang       2021-05-17  343  		ret = snd_soc_dai_set_tdm_slot(codec_dai,
aa736700f42fa0 Shengjiu Wang       2021-05-17  344  					       BIT(slots) - 1,
aa736700f42fa0 Shengjiu Wang       2021-05-17  345  					       BIT(slots) - 1,
aa736700f42fa0 Shengjiu Wang       2021-05-17  346  					       slots, slot_width);
aa736700f42fa0 Shengjiu Wang       2021-05-17  347  		if (ret && ret != -ENOTSUPP) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  348  			dev_err(dev, "failed to set codec dai[%d] tdm slot: %d\n", i, ret);
aa736700f42fa0 Shengjiu Wang       2021-05-17  349  			return ret;
aa736700f42fa0 Shengjiu Wang       2021-05-17  350  		}
aa736700f42fa0 Shengjiu Wang       2021-05-17  351  	}
aa736700f42fa0 Shengjiu Wang       2021-05-17  352  
aa736700f42fa0 Shengjiu Wang       2021-05-17  353  	/* Set MCLK freq */
aa736700f42fa0 Shengjiu Wang       2021-05-17  354  	if (codec_is_akcodec(plat_data->type))
f331ae5fa59fbf Shengjiu Wang       2022-01-04  355  		mclk_freq = akcodec_get_mclk_rate(substream, params, slots, slot_width);
aa736700f42fa0 Shengjiu Wang       2021-05-17  356  	else
aa736700f42fa0 Shengjiu Wang       2021-05-17  357  		mclk_freq = params_rate(params) * slots * slot_width;
c0fabd12a8570c Shengjiu Wang       2022-07-06  358  
c0fabd12a8570c Shengjiu Wang       2022-07-06  359  	if (format_is_dsd(params)) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  360  		/* Use the maximum freq from DSD512 (512*44100 = 22579200) */
c0fabd12a8570c Shengjiu Wang       2022-07-06  361  		if (!(params_rate(params) % 11025))
c0fabd12a8570c Shengjiu Wang       2022-07-06  362  			mclk_freq = IMX_CARD_MCLK_22P5792MHZ;
c0fabd12a8570c Shengjiu Wang       2022-07-06  363  		else
c0fabd12a8570c Shengjiu Wang       2022-07-06  364  			mclk_freq = IMX_CARD_MCLK_24P576MHZ;
c0fabd12a8570c Shengjiu Wang       2022-07-06  365  	}
aa736700f42fa0 Shengjiu Wang       2021-05-17  366  
aa736700f42fa0 Shengjiu Wang       2021-05-17  367  	ret = snd_soc_dai_set_sysclk(cpu_dai, link_data->cpu_sysclk_id, mclk_freq,
aa736700f42fa0 Shengjiu Wang       2021-05-17  368  				     SND_SOC_CLOCK_OUT);
aa736700f42fa0 Shengjiu Wang       2021-05-17  369  	if (ret && ret != -ENOTSUPP) {
aa736700f42fa0 Shengjiu Wang       2021-05-17  370  		dev_err(dev, "failed to set cpui dai mclk1 rate (%lu): %d\n", mclk_freq, ret);
aa736700f42fa0 Shengjiu Wang       2021-05-17  371  		return ret;
aa736700f42fa0 Shengjiu Wang       2021-05-17  372  	}
892373e4de626c Chancel Liu         2024-10-09 @373  	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_freq, SND_SOC_CLOCK_IN);
892373e4de626c Chancel Liu         2024-10-09  374  	if (ret && ret != -ENOTSUPP) {
892373e4de626c Chancel Liu         2024-10-09  375  		dev_err(dev, "failed to set codec dai mclk rate (%lu): %d\n", mclk_freq, ret);
892373e4de626c Chancel Liu         2024-10-09  376  		return ret;
892373e4de626c Chancel Liu         2024-10-09  377  	}
aa736700f42fa0 Shengjiu Wang       2021-05-17  378  
aa736700f42fa0 Shengjiu Wang       2021-05-17  379  	return 0;
aa736700f42fa0 Shengjiu Wang       2021-05-17  380  }
aa736700f42fa0 Shengjiu Wang       2021-05-17  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
