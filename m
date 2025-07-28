Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235B1DEFF5
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697027; cv=none; b=qEAXk1dCwk1LIF9buOPYrmDfwu38YnxYjCc7AxVWhJPPqRSok/wcBl9y/bClkXrixtPWuHO58IHIgA+Ivd84OfqmKjKyTGEyJg6Y3bfXgxe6xZWnHz2zHIGvL0ju8C5ojMgFmJtMbG0ozaxJ3utBnvKFmzo+bCDpYtEHpitt5yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697027; c=relaxed/simple;
	bh=dIcmyaep3J+8goFWujivCM5v9KXkW3QeKtNCYw1xUec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZSq2jcvtyXtcDjJaVMGWOGaP79uQsIzp7DEnaWrhn1ZtDVqpEvDdFSUz+niI0e+gePgj7CHOcL3swqp8I0DAGlfdbViDQVdepqZpNmXIfsv+dUopVYGHoKG7wBREmUOzxSGFOcyFg1iJGN044CNZiJ1WGyUGa6WOaKPI/LJBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4iSSmt/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4iSSmt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753697025; x=1785233025;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dIcmyaep3J+8goFWujivCM5v9KXkW3QeKtNCYw1xUec=;
  b=Z4iSSmt/NHloDDH0oOq/vlpjs5Q6INbYrxNYSAyg3x9+Qcb3FwIH6dsx
   4sjkQAyaXTAAqX8fglCyQ440yQiNd9zzYC7YUP15LZwNxU6r9qCjmRXJw
   7YbumjL6WwSI3OXOYwtGhSXxSGSwIKT4XRl7ZrIhLQdA0ZTDFEiEH6AQp
   CKLJdaAD2lxKiJQYzysyytZiLFFqBP9v1lHV4PoomsDVBX++qdLddhvbg
   eSEKo6tZwvX8mCUioLrIOVG7zFXX0aSAWk2M0XKqWDTPNqoSu6r8MDGYw
   On1PbpeY35JSwZSWHR4sYf1WKWjbuFguaumUIrCxkUM2U2epbQ8llM71I
   A==;
X-CSE-ConnectionGUID: 81Eh3sNlTM+fqlOd/ZJWJg==
X-CSE-MsgGUID: XCUKfHHdR3qbZfZcOsme0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55019670"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55019670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:03:44 -0700
X-CSE-ConnectionGUID: XBC0CSOzRwWkCe0QlWFYoA==
X-CSE-MsgGUID: rxjwmUw1QKCF4VtDuEIUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162247052"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 03:03:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugKhp-0000NL-20;
	Mon, 28 Jul 2025 10:03:41 +0000
Date: Mon, 28 Jul 2025 18:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 757/12680]
 sound/soc/intel/avs/boards/rt5640.c:151 avs_create_dai_link() warn: excess
 argument passed to 'devm_kasprintf'
Message-ID: <202507281707.XMC5a55P-lkp@intel.com>
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
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b90c3b6d76ea512dc3dac8fb30215e175b0019a
commit: c95e925daa434ee1a40a86aec6476ce588e4bd77 [757/12680] ASoC: Intel: avs: Add rt5640 machine board
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r073-20250728 (https://download.01.org/0day-ci/archive/20250728/202507281707.XMC5a55P-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507281707.XMC5a55P-lkp@intel.com/

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
