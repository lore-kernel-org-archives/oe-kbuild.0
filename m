Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28880374E9
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwPI73sE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701105648; x=1732641648;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZLZqQzsgwYw+m1aBtxSa2PzKLokbobaP+uyi5Kb1rxo=;
  b=EwPI73sEKQikfsKYCo6tBQEBcZ7t+iuPa0bezwGaKrfEKPe1woSspPS6
   SVq7dUwWDNZCRGy3UnPPz5/U7LbMZlnHW9CqzOQKiMF8wNJtbc/8wYp5X
   neezjVBl9mQpR8rQ4UXVl+wceA+DA4KVVFe5pKO+zadO2vDsnoaLdAgHh
   U0vil2BeyCvwMYdwi0DRdripObQFSN/OSbrWQ0sZa8Bfh6rABz3CYM8sV
   mHB0hT+fSzoS4ByNyiPDr5duAEE8jLy/AXvHz9+pHmjtVNt5CKGFnqic8
   hHxcUeE4xpjRKpn85eMw9AS/sTPvHNjFsP9vdUySUHHXaL5LYao6Bs0oQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459248640"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="459248640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 09:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="16654936"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2023 09:20:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7fHm-0006V4-0r;
	Mon, 27 Nov 2023 17:20:42 +0000
Date: Tue, 28 Nov 2023 01:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/i2s_test.c:30 avs_create_dai_link() warn:
 excess argument passed to 'devm_kasprintf'
Message-ID: <202311280018.sqodKmLA-lkp@intel.com>
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
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: d3decc196afdce9456442e2bdc9033fd5d2d00b3 ASoC: Intel: avs: i2s_test: Validate machine board configuration
date:   7 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231128/202311280018.sqodKmLA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280018.sqodKmLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311280018.sqodKmLA-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/i2s_test.c:30 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:67 avs_create_dapm_routes() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:99 avs_create_dapm_widgets() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:148 avs_i2s_test_probe() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/i2s_test.c:36 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:69 avs_create_dapm_routes() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:74 avs_create_dapm_routes() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:76 avs_create_dapm_routes() warn: excess argument passed to 'devm_kasprintf'
sound/soc/intel/avs/boards/i2s_test.c:106 avs_create_dapm_widgets() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +30 sound/soc/intel/avs/boards/i2s_test.c

e39acc4cfd9250 Cezary Rojewski    2022-05-11   16  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   17  static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
d3decc196afdce Amadeusz Sławiński 2023-10-12   18  			       int tdm_slot, struct snd_soc_dai_link **dai_link)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   19  {
e39acc4cfd9250 Cezary Rojewski    2022-05-11   20  	struct snd_soc_dai_link_component *platform;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   21  	struct snd_soc_dai_link *dl;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   22  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   23  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
e39acc4cfd9250 Cezary Rojewski    2022-05-11   24  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
e39acc4cfd9250 Cezary Rojewski    2022-05-11   25  	if (!dl || !platform)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   26  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   27  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   28  	platform->name = platform_name;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   29  
d3decc196afdce Amadeusz Sławiński 2023-10-12  @30  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12   31  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
e39acc4cfd9250 Cezary Rojewski    2022-05-11   32  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
82528f31e6633a Kuninori Morimoto  2023-04-24   33  	if (!dl->name || !dl->cpus)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   34  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   35  
d3decc196afdce Amadeusz Sławiński 2023-10-12   36  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12   37  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
5d2d1a48a2f773 Kuninori Morimoto  2023-09-11   38  	dl->codecs = &snd_soc_dummy_dlc;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   39  	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   40  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   41  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   42  	dl->num_cpus = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   43  	dl->num_codecs = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   44  	dl->platforms = platform;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   45  	dl->num_platforms = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   46  	dl->id = 0;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   47  	dl->nonatomic = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   48  	dl->no_pcm = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   49  	dl->dpcm_capture = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   50  	dl->dpcm_playback = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   51  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   52  	*dai_link = dl;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   53  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   54  	return 0;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   55  }
e39acc4cfd9250 Cezary Rojewski    2022-05-11   56  
d3decc196afdce Amadeusz Sławiński 2023-10-12   57  static int avs_create_dapm_routes(struct device *dev, int ssp_port, int tdm_slot,
e39acc4cfd9250 Cezary Rojewski    2022-05-11   58  				  struct snd_soc_dapm_route **routes, int *num_routes)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   59  {
e39acc4cfd9250 Cezary Rojewski    2022-05-11   60  	struct snd_soc_dapm_route *dr;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   61  	const int num_dr = 2;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   62  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   63  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
e39acc4cfd9250 Cezary Rojewski    2022-05-11   64  	if (!dr)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   65  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   66  
d3decc196afdce Amadeusz Sławiński 2023-10-12  @67  	dr[0].sink = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12   68  				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
d3decc196afdce Amadeusz Sławiński 2023-10-12   69  	dr[0].source = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12   70  				      AVS_STRING_FMT("ssp", " Tx", ssp_port, tdm_slot));
e39acc4cfd9250 Cezary Rojewski    2022-05-11   71  	if (!dr[0].sink || !dr[0].source)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   72  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   73  
d3decc196afdce Amadeusz Sławiński 2023-10-12   74  	dr[1].sink = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12   75  				    AVS_STRING_FMT("ssp", " Rx", ssp_port, tdm_slot));
d3decc196afdce Amadeusz Sławiński 2023-10-12   76  	dr[1].source = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12   77  				      AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
e39acc4cfd9250 Cezary Rojewski    2022-05-11   78  	if (!dr[1].sink || !dr[1].source)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   79  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   80  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   81  	*routes = dr;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   82  	*num_routes = num_dr;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   83  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   84  	return 0;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   85  }
e39acc4cfd9250 Cezary Rojewski    2022-05-11   86  
d3decc196afdce Amadeusz Sławiński 2023-10-12   87  static int avs_create_dapm_widgets(struct device *dev, int ssp_port, int tdm_slot,
e39acc4cfd9250 Cezary Rojewski    2022-05-11   88  				   struct snd_soc_dapm_widget **widgets, int *num_widgets)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   89  {
e39acc4cfd9250 Cezary Rojewski    2022-05-11   90  	struct snd_soc_dapm_widget *dw;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   91  	const int num_dw = 2;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   92  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   93  	dw = devm_kcalloc(dev, num_dw, sizeof(*dw), GFP_KERNEL);
e39acc4cfd9250 Cezary Rojewski    2022-05-11   94  	if (!dw)
e39acc4cfd9250 Cezary Rojewski    2022-05-11   95  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   96  
e39acc4cfd9250 Cezary Rojewski    2022-05-11   97  	dw[0].id = snd_soc_dapm_hp;
e39acc4cfd9250 Cezary Rojewski    2022-05-11   98  	dw[0].reg = SND_SOC_NOPM;
d3decc196afdce Amadeusz Sławiński 2023-10-12  @99  	dw[0].name = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12  100  				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
e39acc4cfd9250 Cezary Rojewski    2022-05-11  101  	if (!dw[0].name)
e39acc4cfd9250 Cezary Rojewski    2022-05-11  102  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  103  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  104  	dw[1].id = snd_soc_dapm_mic;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  105  	dw[1].reg = SND_SOC_NOPM;
d3decc196afdce Amadeusz Sławiński 2023-10-12  106  	dw[1].name = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12  107  				    AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
e39acc4cfd9250 Cezary Rojewski    2022-05-11  108  	if (!dw[1].name)
e39acc4cfd9250 Cezary Rojewski    2022-05-11  109  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  110  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  111  	*widgets = dw;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  112  	*num_widgets = num_dw;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  113  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  114  	return 0;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  115  }
e39acc4cfd9250 Cezary Rojewski    2022-05-11  116  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  117  static int avs_i2s_test_probe(struct platform_device *pdev)
e39acc4cfd9250 Cezary Rojewski    2022-05-11  118  {
e39acc4cfd9250 Cezary Rojewski    2022-05-11  119  	struct snd_soc_dapm_widget *widgets;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  120  	struct snd_soc_dapm_route *routes;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  121  	struct snd_soc_dai_link *dai_link;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  122  	struct snd_soc_acpi_mach *mach;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  123  	struct snd_soc_card *card;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  124  	struct device *dev = &pdev->dev;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  125  	const char *pname;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  126  	int num_routes, num_widgets;
d3decc196afdce Amadeusz Sławiński 2023-10-12  127  	int ssp_port, tdm_slot, ret;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  128  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  129  	mach = dev_get_platdata(dev);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  130  	pname = mach->mach_params.platform;
d3decc196afdce Amadeusz Sławiński 2023-10-12  131  
d3decc196afdce Amadeusz Sławiński 2023-10-12  132  	if (!avs_mach_singular_ssp(mach)) {
d3decc196afdce Amadeusz Sławiński 2023-10-12  133  		dev_err(dev, "Invalid SSP configuration\n");
d3decc196afdce Amadeusz Sławiński 2023-10-12  134  		return -EINVAL;
d3decc196afdce Amadeusz Sławiński 2023-10-12  135  	}
d3decc196afdce Amadeusz Sławiński 2023-10-12  136  	ssp_port = avs_mach_ssp_port(mach);
d3decc196afdce Amadeusz Sławiński 2023-10-12  137  
d3decc196afdce Amadeusz Sławiński 2023-10-12  138  	if (!avs_mach_singular_tdm(mach, ssp_port)) {
d3decc196afdce Amadeusz Sławiński 2023-10-12  139  		dev_err(dev, "Invalid TDM configuration\n");
d3decc196afdce Amadeusz Sławiński 2023-10-12  140  		return -EINVAL;
d3decc196afdce Amadeusz Sławiński 2023-10-12  141  	}
d3decc196afdce Amadeusz Sławiński 2023-10-12  142  	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  143  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  144  	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  145  	if (!card)
e39acc4cfd9250 Cezary Rojewski    2022-05-11  146  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  147  
d3decc196afdce Amadeusz Sławiński 2023-10-12 @148  	card->name = devm_kasprintf(dev, GFP_KERNEL,
d3decc196afdce Amadeusz Sławiński 2023-10-12  149  				    AVS_STRING_FMT("ssp", "-loopback", ssp_port, tdm_slot));
e39acc4cfd9250 Cezary Rojewski    2022-05-11  150  	if (!card->name)
e39acc4cfd9250 Cezary Rojewski    2022-05-11  151  		return -ENOMEM;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  152  
d3decc196afdce Amadeusz Sławiński 2023-10-12  153  	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  154  	if (ret) {
e39acc4cfd9250 Cezary Rojewski    2022-05-11  155  		dev_err(dev, "Failed to create dai link: %d\n", ret);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  156  		return ret;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  157  	}
e39acc4cfd9250 Cezary Rojewski    2022-05-11  158  
d3decc196afdce Amadeusz Sławiński 2023-10-12  159  	ret = avs_create_dapm_routes(dev, ssp_port, tdm_slot, &routes, &num_routes);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  160  	if (ret) {
e39acc4cfd9250 Cezary Rojewski    2022-05-11  161  		dev_err(dev, "Failed to create dapm routes: %d\n", ret);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  162  		return ret;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  163  	}
e39acc4cfd9250 Cezary Rojewski    2022-05-11  164  
d3decc196afdce Amadeusz Sławiński 2023-10-12  165  	ret = avs_create_dapm_widgets(dev, ssp_port, tdm_slot, &widgets, &num_widgets);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  166  	if (ret) {
e39acc4cfd9250 Cezary Rojewski    2022-05-11  167  		dev_err(dev, "Failed to create dapm widgets: %d\n", ret);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  168  		return ret;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  169  	}
e39acc4cfd9250 Cezary Rojewski    2022-05-11  170  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  171  	card->dev = dev;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  172  	card->owner = THIS_MODULE;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  173  	card->dai_link = dai_link;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  174  	card->num_links = 1;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  175  	card->dapm_routes = routes;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  176  	card->num_dapm_routes = num_routes;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  177  	card->dapm_widgets = widgets;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  178  	card->num_dapm_widgets = num_widgets;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  179  	card->fully_routed = true;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  180  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  181  	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  182  	if (ret)
e39acc4cfd9250 Cezary Rojewski    2022-05-11  183  		return ret;
e39acc4cfd9250 Cezary Rojewski    2022-05-11  184  
e39acc4cfd9250 Cezary Rojewski    2022-05-11  185  	return devm_snd_soc_register_card(dev, card);
e39acc4cfd9250 Cezary Rojewski    2022-05-11  186  }
e39acc4cfd9250 Cezary Rojewski    2022-05-11  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
