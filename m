Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DA38DEF
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoNScznV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272539; x=1732808539;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RA0dAAtOvW6GwqvD30a0HJyITEy6c13b8Pi6Yk7Rj28=;
  b=AoNScznVU0343CHJ5MM82p3yts6363kDKzgMfukftgfW/3WnTtJ+PQ9d
   GPIkmE3kMkeBbLPiOdreZHFvTrQqmMvccV58s8gubk+WcpeMxj7hIUzxe
   /BzYK0FZYiXnuwiZlr6AWVFwbstmqEqeVlxtQ6hIoyP28Jwa9kAN+ioJX
   9TUIZt4vCwiENYgUDV78T3PDC+ebNm+P7H7TS/z8kK7eBqjvYz/4zHdFg
   ulhfSX4JbnXbdDT53Gt0evQ2Kxpx65eg2zbXint2yB7t8S7rt+HtZc2Ti
   dCCLO2AqYBoepr61q5Y9eAaqvB0zM0vRhk8xptr8MCo9VAV0GBnZxOFTr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392925300"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392925300"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772724224"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772724224"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 07:42:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8MhV-0000OW-2w;
	Wed, 29 Nov 2023 15:42:11 +0000
Date: Wed, 29 Nov 2023 23:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/max98357a.c:62 avs_create_dai_link()
 warn: excess argument passed to 'devm_kasprintf'
Message-ID: <202311292154.qAkLhs3f-lkp@intel.com>
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
commit: 863e3f18d08bae9ffc70306e251f75bdee5e0674 ASoC: Intel: avs: max98357a: Validate machine board configuration
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-r071-20231129 (https://download.01.org/0day-ci/archive/20231129/202311292154.qAkLhs3f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311292154.qAkLhs3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311292154.qAkLhs3f-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/max98357a.c:62 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/max98357a.c:69 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +62 sound/soc/intel/avs/boards/max98357a.c

d16c893425d07a Amadeusz Sławiński 2023-03-03  48  
282c8f8de72f95 Cezary Rojewski    2022-05-11  49  static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
863e3f18d08bae Amadeusz Sławiński 2023-10-12  50  			       int tdm_slot, struct snd_soc_dai_link **dai_link)
282c8f8de72f95 Cezary Rojewski    2022-05-11  51  {
282c8f8de72f95 Cezary Rojewski    2022-05-11  52  	struct snd_soc_dai_link_component *platform;
282c8f8de72f95 Cezary Rojewski    2022-05-11  53  	struct snd_soc_dai_link *dl;
282c8f8de72f95 Cezary Rojewski    2022-05-11  54  
282c8f8de72f95 Cezary Rojewski    2022-05-11  55  	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
282c8f8de72f95 Cezary Rojewski    2022-05-11  56  	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
282c8f8de72f95 Cezary Rojewski    2022-05-11  57  	if (!dl || !platform)
282c8f8de72f95 Cezary Rojewski    2022-05-11  58  		return -ENOMEM;
282c8f8de72f95 Cezary Rojewski    2022-05-11  59  
282c8f8de72f95 Cezary Rojewski    2022-05-11  60  	platform->name = platform_name;
282c8f8de72f95 Cezary Rojewski    2022-05-11  61  
863e3f18d08bae Amadeusz Sławiński 2023-10-12 @62  	dl->name = devm_kasprintf(dev, GFP_KERNEL,
863e3f18d08bae Amadeusz Sławiński 2023-10-12  63  				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
282c8f8de72f95 Cezary Rojewski    2022-05-11  64  	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
282c8f8de72f95 Cezary Rojewski    2022-05-11  65  	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
282c8f8de72f95 Cezary Rojewski    2022-05-11  66  	if (!dl->name || !dl->cpus || !dl->codecs)
282c8f8de72f95 Cezary Rojewski    2022-05-11  67  		return -ENOMEM;
282c8f8de72f95 Cezary Rojewski    2022-05-11  68  
863e3f18d08bae Amadeusz Sławiński 2023-10-12  69  	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
863e3f18d08bae Amadeusz Sławiński 2023-10-12  70  					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
282c8f8de72f95 Cezary Rojewski    2022-05-11  71  	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "MX98357A:00");
282c8f8de72f95 Cezary Rojewski    2022-05-11  72  	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "HiFi");
282c8f8de72f95 Cezary Rojewski    2022-05-11  73  	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
282c8f8de72f95 Cezary Rojewski    2022-05-11  74  		return -ENOMEM;
282c8f8de72f95 Cezary Rojewski    2022-05-11  75  
282c8f8de72f95 Cezary Rojewski    2022-05-11  76  	dl->num_cpus = 1;
282c8f8de72f95 Cezary Rojewski    2022-05-11  77  	dl->num_codecs = 1;
282c8f8de72f95 Cezary Rojewski    2022-05-11  78  	dl->platforms = platform;
282c8f8de72f95 Cezary Rojewski    2022-05-11  79  	dl->num_platforms = 1;
282c8f8de72f95 Cezary Rojewski    2022-05-11  80  	dl->id = 0;
282c8f8de72f95 Cezary Rojewski    2022-05-11  81  	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
d16c893425d07a Amadeusz Sławiński 2023-03-03  82  	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
282c8f8de72f95 Cezary Rojewski    2022-05-11  83  	dl->nonatomic = 1;
282c8f8de72f95 Cezary Rojewski    2022-05-11  84  	dl->no_pcm = 1;
282c8f8de72f95 Cezary Rojewski    2022-05-11  85  	dl->dpcm_playback = 1;
282c8f8de72f95 Cezary Rojewski    2022-05-11  86  
282c8f8de72f95 Cezary Rojewski    2022-05-11  87  	*dai_link = dl;
282c8f8de72f95 Cezary Rojewski    2022-05-11  88  
282c8f8de72f95 Cezary Rojewski    2022-05-11  89  	return 0;
282c8f8de72f95 Cezary Rojewski    2022-05-11  90  }
282c8f8de72f95 Cezary Rojewski    2022-05-11  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
