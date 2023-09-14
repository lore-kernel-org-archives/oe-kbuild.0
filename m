Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1B20F8
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 06:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694671475; x=1726207475;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sgoaQOwxs5Ai0I0cVA2wik14gStpeZ8KENqNssg3low=;
  b=lsPdkgfqz6oJrDfgN5mkxUZjtqXjxG4XgSiIGrQpfvsTPHgNA/U4iLU8
   nC9SsRBNP2xrcSrJwjjTxhGClQrBn70GZUnnKma1YRY4qxt+YbXhq20eS
   kGlyFMmb6BHPFA9Pt0lSs3cP1rmnC8Vt+Z9dn/Op50Uq05famuEtSsHvE
   0Nx1Fhm7wluTPvijZJH95mtnZjpCmZN4QgRfWV5aJ6Goy85Qqom11ZnJg
   829o0bQw7AtM9iJlB65WC0ZIM2jAWQh5IRoPx5EM2/VVhG4gZMzMh2pG9
   BpNK2vTOqeCMaRFMKh41A6T0Ly5WEVNxhbTohOI+CU7B+xe/EcpBmzOfb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369134978"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="369134978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 23:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814534854"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="814534854"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 23:04:13 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgfSV-0001Dx-13;
	Thu, 14 Sep 2023 06:04:11 +0000
Date: Thu, 14 Sep 2023 14:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 25/54] ASoC: generic: convert not to use asoc_xxx()
Message-ID: <202309141310.ziolPEP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <87h6o0qnho.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0qnho.wl-kuninori.morimoto.gx@renesas.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6-rc1 next-20230914]
[cannot apply to broonie-sound/for-next shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-simple_card_utils-h-convert-not-to-use-asoc_xxx/20230912-084751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/87h6o0qnho.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 25/54] ASoC: generic: convert not to use asoc_xxx()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141310.ziolPEP5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141310.ziolPEP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309141310.ziolPEP5-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card.c:773 simple_probe() warn: missing unwind goto?

vim +773 sound/soc/generic/simple-card.c

8d1bd113a19440 Katsuhiro Suzuki    2018-06-11  709  
88c819af51a9cc Kuninori Morimoto   2023-09-11  710  static int simple_probe(struct platform_device *pdev)
f2390880ec0264 Kuninori Morimoto   2012-04-08  711  {
88c819af51a9cc Kuninori Morimoto   2023-09-11  712  	struct simple_util_priv *priv;
f89983ef61677a Kuninori Morimoto   2012-12-25  713  	struct device *dev = &pdev->dev;
dcee9bfe890451 Kuninori Morimoto   2017-03-15  714  	struct device_node *np = dev->of_node;
5be509576cf634 Kuninori Morimoto   2017-03-15  715  	struct snd_soc_card *card;
ec1af6c64db94e Thierry Reding      2021-04-19  716  	struct link_info *li;
65a5056b21202e Kuninori Morimoto   2019-03-20  717  	int ret;
f2390880ec0264 Kuninori Morimoto   2012-04-08  718  
0dd4fc3c2f663b Xiubo Li            2014-09-10  719  	/* Allocate the private data and the DAI link array */
b0133d9c4d7600 Kuninori Morimoto   2016-08-26  720  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
ca65b492c7a265 Jean-Francois Moine 2014-01-15  721  	if (!priv)
ca919fe4b972b9 Xiubo Li            2014-01-14  722  		return -ENOMEM;
ca919fe4b972b9 Xiubo Li            2014-01-14  723  
d947cdfd4be29c Kuninori Morimoto   2018-12-20  724  	card = simple_priv_to_card(priv);
d947cdfd4be29c Kuninori Morimoto   2018-12-20  725  	card->owner		= THIS_MODULE;
d947cdfd4be29c Kuninori Morimoto   2018-12-20  726  	card->dev		= dev;
2d01a84605a55c Kuninori Morimoto   2018-12-20  727  	card->probe		= simple_soc_probe;
907f0a3051869a Guido Günther       2021-06-22  728  	card->driver_name       = "simple-card";
d947cdfd4be29c Kuninori Morimoto   2018-12-20  729  
ec1af6c64db94e Thierry Reding      2021-04-19  730  	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
ec1af6c64db94e Thierry Reding      2021-04-19  731  	if (!li)
ec1af6c64db94e Thierry Reding      2021-04-19  732  		return -ENOMEM;
ec1af6c64db94e Thierry Reding      2021-04-19  733  
ec1af6c64db94e Thierry Reding      2021-04-19  734  	ret = simple_get_dais_count(priv, li);
0f687d826736a5 Thierry Reding      2021-04-16  735  	if (ret < 0)
0f687d826736a5 Thierry Reding      2021-04-16  736  		return ret;
0f687d826736a5 Thierry Reding      2021-04-16  737  
ec1af6c64db94e Thierry Reding      2021-04-19  738  	if (!li->link)
da215354eb55c3 Kuninori Morimoto   2018-12-14  739  		return -EINVAL;
da215354eb55c3 Kuninori Morimoto   2018-12-14  740  
88c819af51a9cc Kuninori Morimoto   2023-09-11  741  	ret = simple_util_init_priv(priv, li);
65a5056b21202e Kuninori Morimoto   2019-03-20  742  	if (ret < 0)
65a5056b21202e Kuninori Morimoto   2019-03-20  743  		return ret;
201a0eac7fe5e7 Jean-Francois Moine 2014-01-15  744  
201a0eac7fe5e7 Jean-Francois Moine 2014-01-15  745  	if (np && of_device_is_available(np)) {
ca919fe4b972b9 Xiubo Li            2014-01-14  746  
ec1af6c64db94e Thierry Reding      2021-04-19  747  		ret = simple_parse_of(priv, li);
fa558c2801fc17 Kuninori Morimoto   2013-11-20  748  		if (ret < 0) {
7a0299e13bc740 Kuninori Morimoto   2021-12-14  749  			dev_err_probe(dev, ret, "parse error\n");
e512e001dafa54 Jean-Francois Moine 2014-03-11  750  			goto err;
fa558c2801fc17 Kuninori Morimoto   2013-11-20  751  		}
6a91a17bd7b92b Jean-Francois Moine 2014-03-20  752  
fa558c2801fc17 Kuninori Morimoto   2013-11-20  753  	} else {
88c819af51a9cc Kuninori Morimoto   2023-09-11  754  		struct simple_util_info *cinfo;
f107294c6422e7 Kuninori Morimoto   2019-06-06  755  		struct snd_soc_dai_link_component *cpus;
710af9196ce614 Kuninori Morimoto   2018-08-31  756  		struct snd_soc_dai_link_component *codecs;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  757  		struct snd_soc_dai_link_component *platform;
65a5056b21202e Kuninori Morimoto   2019-03-20  758  		struct snd_soc_dai_link *dai_link = priv->dai_link;
65a5056b21202e Kuninori Morimoto   2019-03-20  759  		struct simple_dai_props *dai_props = priv->dai_props;
65a5056b21202e Kuninori Morimoto   2019-03-20  760  
ca65b492c7a265 Jean-Francois Moine 2014-01-15  761  		cinfo = dev->platform_data;
ca65b492c7a265 Jean-Francois Moine 2014-01-15  762  		if (!cinfo) {
f89983ef61677a Kuninori Morimoto   2012-12-25  763  			dev_err(dev, "no info for asoc-simple-card\n");
f2390880ec0264 Kuninori Morimoto   2012-04-08  764  			return -EINVAL;
f2390880ec0264 Kuninori Morimoto   2012-04-08  765  		}
f2390880ec0264 Kuninori Morimoto   2012-04-08  766  
f2390880ec0264 Kuninori Morimoto   2012-04-08  767  		if (!cinfo->name ||
fa558c2801fc17 Kuninori Morimoto   2013-11-20  768  		    !cinfo->codec_dai.name ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  769  		    !cinfo->codec ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  770  		    !cinfo->platform ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  771  		    !cinfo->cpu_dai.name) {
88c819af51a9cc Kuninori Morimoto   2023-09-11  772  			dev_err(dev, "insufficient simple_util_info settings\n");
f2390880ec0264 Kuninori Morimoto   2012-04-08 @773  			return -EINVAL;
f2390880ec0264 Kuninori Morimoto   2012-04-08  774  		}
2bee991460a838 Jean-Francois Moine 2014-01-15  775  
f107294c6422e7 Kuninori Morimoto   2019-06-06  776  		cpus			= dai_link->cpus;
f107294c6422e7 Kuninori Morimoto   2019-06-06  777  		cpus->dai_name		= cinfo->cpu_dai.name;
f107294c6422e7 Kuninori Morimoto   2019-06-06  778  
710af9196ce614 Kuninori Morimoto   2018-08-31  779  		codecs			= dai_link->codecs;
710af9196ce614 Kuninori Morimoto   2018-08-31  780  		codecs->name		= cinfo->codec;
710af9196ce614 Kuninori Morimoto   2018-08-31  781  		codecs->dai_name	= cinfo->codec_dai.name;
710af9196ce614 Kuninori Morimoto   2018-08-31  782  
910fdcabedd235 Kuninori Morimoto   2019-01-21  783  		platform		= dai_link->platforms;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  784  		platform->name		= cinfo->platform;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  785  
5be509576cf634 Kuninori Morimoto   2017-03-15  786  		card->name		= (cinfo->card) ? cinfo->card : cinfo->name;
5ca8ba4180a6f6 Jean-Francois Moine 2014-01-15  787  		dai_link->name		= cinfo->name;
5ca8ba4180a6f6 Jean-Francois Moine 2014-01-15  788  		dai_link->stream_name	= cinfo->name;
1efb53a220b78f Lars-Peter Clausen  2015-03-24  789  		dai_link->dai_fmt	= cinfo->daifmt;
88c819af51a9cc Kuninori Morimoto   2023-09-11  790  		dai_link->init		= simple_util_dai_init;
65a5056b21202e Kuninori Morimoto   2019-03-20  791  		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
65a5056b21202e Kuninori Morimoto   2019-03-20  792  					sizeof(*dai_props->cpu_dai));
65a5056b21202e Kuninori Morimoto   2019-03-20  793  		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
65a5056b21202e Kuninori Morimoto   2019-03-20  794  					sizeof(*dai_props->codec_dai));
7722f830a45f7f Jean-Francois Moine 2014-01-15  795  	}
f2390880ec0264 Kuninori Morimoto   2012-04-08  796  
5be509576cf634 Kuninori Morimoto   2017-03-15  797  	snd_soc_card_set_drvdata(card, priv);
f2390880ec0264 Kuninori Morimoto   2012-04-08  798  
88c819af51a9cc Kuninori Morimoto   2023-09-11  799  	simple_util_debug_info(priv);
0580dde5943868 Kuninori Morimoto   2019-03-20  800  
5be509576cf634 Kuninori Morimoto   2017-03-15  801  	ret = devm_snd_soc_register_card(dev, card);
c6d112e442fed7 Kuninori Morimoto   2017-05-19  802  	if (ret < 0)
c6d112e442fed7 Kuninori Morimoto   2017-05-19  803  		goto err;
c6d112e442fed7 Kuninori Morimoto   2017-05-19  804  
ec1af6c64db94e Thierry Reding      2021-04-19  805  	devm_kfree(dev, li);
c6d112e442fed7 Kuninori Morimoto   2017-05-19  806  	return 0;
e512e001dafa54 Jean-Francois Moine 2014-03-11  807  err:
88c819af51a9cc Kuninori Morimoto   2023-09-11  808  	simple_util_clean_reference(card);
387f5823f40044 Kuninori Morimoto   2016-08-26  809  
e512e001dafa54 Jean-Francois Moine 2014-03-11  810  	return ret;
f2390880ec0264 Kuninori Morimoto   2012-04-08  811  }
f2390880ec0264 Kuninori Morimoto   2012-04-08  812  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
