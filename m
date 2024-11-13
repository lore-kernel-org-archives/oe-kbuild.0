Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65401C695
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731509687; cv=none; b=haeoc81dgE2+Y8RMueE6jQgf2GIDB5F8+oaoszUl3CWXdTH/bLBmDk18YhKIWVuN1QTlhHSf/feoPCna/hL431Fpn/VmghES/Wz3MXzvL42lF+RmBsNf4+dNI3bCs6tRGjUEgX8f74x+IMGBhleacuLm/DjdjWiKUkV+ufIyyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731509687; c=relaxed/simple;
	bh=6nNZFwRaHdG0EAX927amx+fZ+N3Hw0AAMzEPpM1MNDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxFaF/rlLQoGejElKtqXtcCm+l8t+HmL/jKsh14GI+LZ28CDhqwZUqQilI4XH7ABHfgUncKUQ8DNUZjql1cuV4LxPFloUo0jBcon2ThWK+Wa07wbwv4BjA5d6j90rQ/gnrFGgrVd4Ntfazc86KFODMy/4cai7U5CtkOcgj2q1cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMtEPj/S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMtEPj/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731509686; x=1763045686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nNZFwRaHdG0EAX927amx+fZ+N3Hw0AAMzEPpM1MNDw=;
  b=dMtEPj/Sfy9KxNgKOJV0toUnl0dftNAFidb2jyCx86E2EOSOoVU/fHNG
   m7JOYWfPKSMgh/oDAnmQxYlmNs+TvP4E9vsvPYsn9BvKTy/n0YN6owzNB
   KQTwyFVSDOKjHiTWc4NlGU+SeMrJTzbRQ6H9h7iKtMNZXhHO5de74Lq5U
   sPilrK8Lt33KO3rJiZj8xrbLUFbyjN5YK6rWPQYpaIO1d+7aHL0Y9YFHM
   GSOH4L77srHaFSoadIig8rV6LaFhjFBt6AEnSnyjHlxQAMSqtPEzHSgl5
   j0rHKsd4y4UZPusVMdXKl+vm6gip8BIuA1Xtip625jk/Btg8r07tKKYbE
   Q==;
X-CSE-ConnectionGUID: FDw1MB8VSCaBJgl+ZoCs4Q==
X-CSE-MsgGUID: BkgG529URLWSru1r60+8Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19012760"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="19012760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:54:45 -0800
X-CSE-ConnectionGUID: ZUfIXIF2QpqCcBcTTBfTog==
X-CSE-MsgGUID: 2vR/hpDaRCe15XIjdvE3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="87886844"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 06:54:43 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBElV-0000TV-0y;
	Wed, 13 Nov 2024 14:54:41 +0000
Date: Wed, 13 Nov 2024 22:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 12/13]
 sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202411132223.yZgcsRlE-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e733b347fbf8a8a5149461d848bf4e726141afaf
commit: 9eda09e511f648adf90efdb805e2429bf5bc25cb [12/13] UPSTREAM: ASoC: hdmi-codec: Add a prepare hook
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132223.yZgcsRlE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411132223.yZgcsRlE-lkp@intel.com/

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
