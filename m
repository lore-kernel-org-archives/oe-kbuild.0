Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115445000
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786769133; cv=none; b=W/tic9KD1hAvQe6WZIui93xOT6CFWYbehZlpm4E61rTULVol3Sf39DsKvrYesfogWrTgoLVwl3v83/UasrsNxYUWAOxDO/lo4lwHt7BG41Qh+x6mRrxQQZPtP2BfUsIg8ltWpg1ap5LTEJxTpsIfVjcdEmoB5uUF22YtVj9TW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786769133; c=relaxed/simple;
	bh=SKqyWk5o/8B2UHnL3sOBnjzRSNyBGByRKDQywHrTcGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UyuVU55PLVYHup0pnJpUnWTricXqZPmjQEwp0INu4ikYi+BlIZG8Z/yKjiXJFK7p1NZkVqCrp2wMN8IzuthAylQ4a5FmBFY2G6bEwsTlhbtboFennnKmoBNZSawm/skgjP/Gkzc6aiXKBCr8GpmHPaD2TjHiRF879rADM4ckxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jj9AzUlW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jj9AzUlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786769131; x=1818305131;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SKqyWk5o/8B2UHnL3sOBnjzRSNyBGByRKDQywHrTcGQ=;
  b=jj9AzUlW7PKZ3oyY/0y8KSZi9W++Pg5kZREIuj7yjrCENGX5f+N0JGY+
   0kBC5EfkSZteRt9J3EI8fz2tS0z9JDQcsoBvtA3ma4YInRWrZXv3xi5Yj
   c907eI76Z3Ml+s+4fs5PXHFNNq0tVwvL0RXYm9W7CU5Y+jZJYqf9wmI39
   4bJ77ZaDTcijNYi/NkVPjT9JjlPiaNGcwKQ+LcQ8J/j/IBUfRTUgGmGSR
   KtTjVg7GcoR3gvHzY0CepUig/nSIRFte/I5pbnvA8AkQARZu22ZHYV7fw
   mAr6JMF0z9rf4AnS7xPieKTDfy8N1ns/RxnWjItzAOLS9NzDMBGrZzvOW
   A==;
X-CSE-ConnectionGUID: rFbm2jRFT+K9IvqDo23ZAw==
X-CSE-MsgGUID: aQw5dZ+9RSWqS2UAz6s+pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87262507"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87262507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 21:45:31 -0700
X-CSE-ConnectionGUID: EGD9fw0TTwStwZaabtoB+Q==
X-CSE-MsgGUID: r5etZi1+RueVQIZRRc7kUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="267891368"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2026 21:45:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv6Gt-00000000b97-3YHM;
	Sat, 15 Aug 2026 04:45:27 +0000
Date: Sat, 15 Aug 2026 12:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5640.c:151
 avs_create_dai_link() warn: excess argument passed to 'devm_kasprintf'
Message-ID: <202608151228.CuxdENgA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Amadeusz S=C5=82awi=C5=84ski" <amadeuszx.slawinski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: c95e925daa434ee1a40a86aec6476ce588e4bd77 ASoC: Intel: avs: Add rt56=
40 machine board
date:   1 year, 2 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-r072-20260815 (https://download.01.org/0day-ci/arch=
ive/20260815/202608151228.CuxdENgA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: c95e925daa43 ("ASoC: Intel: avs: Add rt5640 machine board")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608151228.CuxdENgA-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/rt5640.c:151 avs_create_dai_link() warn: excess =
argument passed to 'devm_kasprintf'

Old smatch warnings:
sound/soc/intel/avs/boards/rt5640.c:158 avs_create_dai_link() warn: excess =
argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +151 sound/soc/intel/avs/boards/rt5640.c

c95e925daa434e Cezary Rojewski 2025-05-30  129 =20
c95e925daa434e Cezary Rojewski 2025-05-30  130  static int avs_create_dai_l=
ink(struct device *dev, int ssp_port, int tdm_slot,
c95e925daa434e Cezary Rojewski 2025-05-30  131  			       struct snd_soc_ac=
pi_mach *mach,
c95e925daa434e Cezary Rojewski 2025-05-30  132  			       struct snd_soc_da=
i_link **dai_link)
c95e925daa434e Cezary Rojewski 2025-05-30  133  {
c95e925daa434e Cezary Rojewski 2025-05-30  134  	struct snd_soc_dai_link_co=
mponent *platform;
c95e925daa434e Cezary Rojewski 2025-05-30  135  	struct snd_soc_dai_link *d=
l;
c95e925daa434e Cezary Rojewski 2025-05-30  136  	u32 uid =3D 0;
c95e925daa434e Cezary Rojewski 2025-05-30  137  	int ret;
c95e925daa434e Cezary Rojewski 2025-05-30  138 =20
c95e925daa434e Cezary Rojewski 2025-05-30  139  	if (mach->uid) {
c95e925daa434e Cezary Rojewski 2025-05-30  140  		ret =3D kstrtou32(mach->u=
id, 0, &uid);
c95e925daa434e Cezary Rojewski 2025-05-30  141  		if (ret)
c95e925daa434e Cezary Rojewski 2025-05-30  142  			return ret;
c95e925daa434e Cezary Rojewski 2025-05-30  143  		uid--; /* 0-based indexin=
g. */
c95e925daa434e Cezary Rojewski 2025-05-30  144  	}
c95e925daa434e Cezary Rojewski 2025-05-30  145 =20
c95e925daa434e Cezary Rojewski 2025-05-30  146  	dl =3D devm_kzalloc(dev, s=
izeof(*dl), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  147  	platform =3D devm_kzalloc(=
dev, sizeof(*platform), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  148  	if (!dl || !platform)
c95e925daa434e Cezary Rojewski 2025-05-30  149  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  150 =20
c95e925daa434e Cezary Rojewski 2025-05-30 @151  	dl->name =3D devm_kasprint=
f(dev, GFP_KERNEL,
c95e925daa434e Cezary Rojewski 2025-05-30  152  				  AVS_STRING_FMT("SSP",=
 "-Codec", ssp_port, tdm_slot));
c95e925daa434e Cezary Rojewski 2025-05-30  153  	dl->cpus =3D devm_kzalloc(=
dev, sizeof(*dl->cpus), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  154  	dl->codecs =3D devm_kzallo=
c(dev, sizeof(*dl->codecs), GFP_KERNEL);
c95e925daa434e Cezary Rojewski 2025-05-30  155  	if (!dl->name || !dl->cpus=
 || !dl->codecs)
c95e925daa434e Cezary Rojewski 2025-05-30  156  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  157 =20
c95e925daa434e Cezary Rojewski 2025-05-30  158  	dl->cpus->dai_name =3D dev=
m_kasprintf(dev, GFP_KERNEL,
c95e925daa434e Cezary Rojewski 2025-05-30  159  					    AVS_STRING_FMT("SS=
P", " Pin", ssp_port, tdm_slot));
c95e925daa434e Cezary Rojewski 2025-05-30  160  	dl->codecs->name =3D devm_=
kasprintf(dev, GFP_KERNEL, "i2c-10EC5640:0%d", uid);
c95e925daa434e Cezary Rojewski 2025-05-30  161  	dl->codecs->dai_name =3D d=
evm_kasprintf(dev, GFP_KERNEL, RT5640_CODEC_DAI);
c95e925daa434e Cezary Rojewski 2025-05-30  162  	if (!dl->cpus->dai_name ||=
 !dl->codecs->name || !dl->codecs->dai_name)
c95e925daa434e Cezary Rojewski 2025-05-30  163  		return -ENOMEM;
c95e925daa434e Cezary Rojewski 2025-05-30  164 =20
c95e925daa434e Cezary Rojewski 2025-05-30  165  	platform->name =3D dev_nam=
e(dev);
c95e925daa434e Cezary Rojewski 2025-05-30  166  	dl->num_cpus =3D 1;
c95e925daa434e Cezary Rojewski 2025-05-30  167  	dl->num_codecs =3D 1;
c95e925daa434e Cezary Rojewski 2025-05-30  168  	dl->platforms =3D platform;
c95e925daa434e Cezary Rojewski 2025-05-30  169  	dl->num_platforms =3D 1;
c95e925daa434e Cezary Rojewski 2025-05-30  170  	dl->id =3D 0;
c95e925daa434e Cezary Rojewski 2025-05-30  171  	dl->dai_fmt =3D SND_SOC_DA=
IFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
c95e925daa434e Cezary Rojewski 2025-05-30  172  	dl->init =3D avs_rt5640_co=
dec_init;
c95e925daa434e Cezary Rojewski 2025-05-30  173  	dl->exit =3D avs_rt5640_co=
dec_exit;
c95e925daa434e Cezary Rojewski 2025-05-30  174  	dl->be_hw_params_fixup =3D =
avs_rt5640_be_fixup;
c95e925daa434e Cezary Rojewski 2025-05-30  175  	dl->ops =3D &avs_rt5640_op=
s;
c95e925daa434e Cezary Rojewski 2025-05-30  176  	dl->nonatomic =3D 1;
c95e925daa434e Cezary Rojewski 2025-05-30  177  	dl->no_pcm =3D 1;
c95e925daa434e Cezary Rojewski 2025-05-30  178 =20
c95e925daa434e Cezary Rojewski 2025-05-30  179  	*dai_link =3D dl;
c95e925daa434e Cezary Rojewski 2025-05-30  180 =20
c95e925daa434e Cezary Rojewski 2025-05-30  181  	return 0;
c95e925daa434e Cezary Rojewski 2025-05-30  182  }
c95e925daa434e Cezary Rojewski 2025-05-30  183 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
