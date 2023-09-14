Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDB1873
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694666404; x=1726202404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZ1+Ngy+38PtmZUGDhbpMKN2T1RnNKEnmMhCoZLpG+E=;
  b=B1VCb0Uy9T8cEAdMLtPcJYf01I3MaUTBIKymnOLTxZF8NIMZn8mauwds
   bb6CE6usfD7c+rslP+6rMagJkA5OPtxaWR/ld03caOXwTEAQwg7zmRgEF
   eRQHTDsLWhyH9TU7S0yoL+jN3ILqj39VjwOutWKqhe9kdElqOewJzI8HC
   C3m8I07nHI0olrh4LiTEU8Uc2B8XlKrvQeVpuUR2NGZy0atIyheoSlyeb
   UnipSbqhs01cRHitbyKuIBJWbfClVpIbp3DqZBA/5a1UdsnUInKLu62sE
   pb+Tv44vFGFivxEHcz5XXUgqXJ6zPptsSCg/RwOaZi43tNj8S2mGSV3E/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369123207"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="369123207"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 21:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="868097141"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="868097141"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2023 21:39:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qge8w-0001AH-3C;
	Thu, 14 Sep 2023 04:39:54 +0000
Date: Thu, 14 Sep 2023 12:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 02/54] ASoC: simple_card_utils.h: convert not to use
 asoc_xxx()
Message-ID: <202309141205.ITZeDJxV-lkp@intel.com>
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
In-Reply-To: <87edj4s26a.wl-kuninori.morimoto.gx@renesas.com>
References: <87edj4s26a.wl-kuninori.morimoto.gx@renesas.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6-rc1 next-20230913]
[cannot apply to broonie-sound/for-next shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-simple_card_utils-h-convert-not-to-use-asoc_xxx/20230912-084751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/87edj4s26a.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 02/54] ASoC: simple_card_utils.h: convert not to use asoc_xxx()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141205.ITZeDJxV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141205.ITZeDJxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309141205.ITZeDJxV-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card-utils.c:313 simple_util_startup() warn: missing unwind goto?

vim +313 sound/soc/generic/simple-card-utils.c

5ca2ab4598179a Robert Hancock    2022-01-20  278  
674d245538be0d Kuninori Morimoto 2023-09-11  279  int simple_util_startup(struct snd_pcm_substream *substream)
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
5ca2ab4598179a Robert Hancock    2022-01-20 @313  			return -EINVAL;
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
674d245538be0d Kuninori Morimoto 2023-09-11  337  EXPORT_SYMBOL_GPL(simple_util_startup);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
