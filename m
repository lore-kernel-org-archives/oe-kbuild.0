Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD563A5
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694773086; x=1726309086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJA6Ve0Mi4nQtC3QMlx6PCTxupIJaYODNO+9mfY7LXs=;
  b=QE2lpsAiPrgYTavtLGkK4oVnwA3NNrKSBgtaELFy4ue0yBjiYs31h+LU
   HxlCEd1LIXH/lyEok3GJPvogmxXb8xNxr7BuOnzHBxZPgkIfFumZ4QCvC
   NGX4pxiwLT2eyr1pDREzwTL/BFq4GYBbUou1wTuvveSZ3ebKAm9AeWsPy
   d+35UTssHURPZpiR2ZAhagKyNeeJ4mY2Iw9Itk+cFoYihTEcBsRZ8omuB
   1BxC3QlZ4YnAIgaGfV75+BrHYy5pNMHpJUmbfoNW+DfmYDgag1d6hsWRw
   6tZW7BbXegVBmbbfBM2Z5Yc31hc/RvG6xtnotcrQNgmpS3WGnK0WHh/9V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379134078"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="379134078"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 03:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="774256938"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="774256938"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Sep 2023 03:17:49 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh5tT-0002qL-0y;
	Fri, 15 Sep 2023 10:17:47 +0000
Date: Fri, 15 Sep 2023 18:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup()
 error handling
Message-ID: <202309151840.au9Aa2W4-lkp@intel.com>
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
In-Reply-To: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Mark Brown <broonie@kernel.org>
CC: "Linux-ALSA" <alsa-devel@alsa-project.org>
CC: Dan Carpenter <error27@gmail.com>
CC: Robert Hancock <robert.hancock@calian.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-simple-card-utils-fixup-simple_util_startup-error-handling/20230915-071518
base:   linus/master
patch link:    https://lore.kernel.org/r/87zg1opcwt.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup() error handling
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151840.au9Aa2W4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309151840.au9Aa2W4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309151840.au9Aa2W4-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card-utils.c:313 asoc_simple_startup() warn: missing error code 'ret'

vim +/ret +313 sound/soc/generic/simple-card-utils.c

5ca2ab4598179a Robert Hancock    2022-01-20  278  
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  279  int asoc_simple_startup(struct snd_pcm_substream *substream)
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  280  {
9ae035e289379b Kuninori Morimoto 2020-07-20  281  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  282  	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  283  	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  284  	struct asoc_simple_dai *dai;
5ca2ab4598179a Robert Hancock    2022-01-20  285  	unsigned int fixed_sysclk = 0;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  286  	int i1, i2, i;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  287  	int ret;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  288  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  289  	for_each_prop_dai_cpu(props, i1, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  290  		ret = asoc_simple_clk_enable(dai);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  291  		if (ret)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  292  			goto cpu_err;
5ca2ab4598179a Robert Hancock    2022-01-20  293  		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
5ca2ab4598179a Robert Hancock    2022-01-20  294  		if (ret)
5ca2ab4598179a Robert Hancock    2022-01-20  295  			goto cpu_err;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  296  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  297  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  298  	for_each_prop_dai_codec(props, i2, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  299  		ret = asoc_simple_clk_enable(dai);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  300  		if (ret)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  301  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  302  		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
5ca2ab4598179a Robert Hancock    2022-01-20  303  		if (ret)
5ca2ab4598179a Robert Hancock    2022-01-20  304  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  305  	}
5ca2ab4598179a Robert Hancock    2022-01-20  306  
5ca2ab4598179a Robert Hancock    2022-01-20  307  	if (fixed_sysclk && props->mclk_fs) {
5ca2ab4598179a Robert Hancock    2022-01-20  308  		unsigned int fixed_rate = fixed_sysclk / props->mclk_fs;
5ca2ab4598179a Robert Hancock    2022-01-20  309  
5ca2ab4598179a Robert Hancock    2022-01-20  310  		if (fixed_sysclk % props->mclk_fs) {
5ca2ab4598179a Robert Hancock    2022-01-20  311  			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
5ca2ab4598179a Robert Hancock    2022-01-20  312  				fixed_sysclk, props->mclk_fs);
2f7ac863515034 Kuninori Morimoto 2023-09-14 @313  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  314  		}
5ca2ab4598179a Robert Hancock    2022-01-20  315  		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
5ca2ab4598179a Robert Hancock    2022-01-20  316  			fixed_rate, fixed_rate);
635071f5fee315 Robert Hancock    2023-06-01  317  		if (ret < 0)
5ca2ab4598179a Robert Hancock    2022-01-20  318  			goto codec_err;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  319  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  320  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  321  	return 0;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  322  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  323  codec_err:
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  324  	for_each_prop_dai_codec(props, i, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  325  		if (i >= i2)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  326  			break;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  327  		asoc_simple_clk_disable(dai);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  328  	}
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  329  cpu_err:
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  330  	for_each_prop_dai_cpu(props, i, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  331  		if (i >= i1)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  332  			break;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  333  		asoc_simple_clk_disable(dai);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  334  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  335  	return ret;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  336  }
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  337  EXPORT_SYMBOL_GPL(asoc_simple_startup);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
