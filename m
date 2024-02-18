Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2DD294
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708241477; cv=none; b=qX9flgrtnlaIj+4/We5ntkHtuWb1gtWXuj/1XDQD2QIWf8GzhupWauK9XkmZ7VCswi5NiIcAagFib5Tq/OgtLVy2vf6NbZZJO96tLRvXMPi8RxZuGVNFiXon8oxbUIHpWNdU4hxoEDjzHVw4gGYm49BClHDS+84QoG3pSbVTXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708241477; c=relaxed/simple;
	bh=Pq5LcAVmsr1WqV80ovJDHJNgm8t03D9NX0elbheVTFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQHhw/GMWtZaXMA3uPYWO4L9o6BlN6oBEJt+s6LTmWPfN+PMAAV07qyNRKxaULFrPJ7gjUc1egPlxm4aJRJNWpH+BZrVXiCythCzAhfPoJO69MxiP0+AOLePFJEERHmQ/tBeQnYeTVJZ7lq+EwQUCVyViJOFI+YgKADaAQbfMug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQpk/Om6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQpk/Om6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708241475; x=1739777475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pq5LcAVmsr1WqV80ovJDHJNgm8t03D9NX0elbheVTFg=;
  b=QQpk/Om6av8DGkyMBkWqk27Y5yqKoRP5SJAFMf08aKYqzIHGTVcFJZvb
   EYaCGY2wu5mQjShuNCg7gN8RpLH5jxTkhoT3dIWFnbp6Xw6ypQjn3mw3m
   07COJB6/IMOjU83y+VePxaujmfkbljdzSRwHEanzT32evWqATWnxz5SJO
   uthfSQX8gFVmwhzxye5Ur/3p9P8lkwGjI6qMpM3GlaRx/AQiXWFTJ4ISc
   6zsxP10iF29EH8SKPo0hslGrmsgfOKQ176sAbL0AcdFZZbHVmbi9SDEw+
   JzGPsIQjo6Qd2zhekONUrYs8fE7EJ7ktFFPdL17e525OAqmRSdwY/XXpy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2200078"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2200078"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 23:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4575961"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2024 23:31:13 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbbda-0002rq-1q;
	Sun, 18 Feb 2024 07:31:09 +0000
Date: Sun, 18 Feb 2024 15:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 12/13]
 sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error:
 __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202402181541.SXeou8Rg-lkp@intel.com>
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
head:   44817294cfe4afa710fc37d3fe6953877a4232e0
commit: 9eda09e511f648adf90efdb805e2429bf5bc25cb [12/13] UPSTREAM: ASoC: hdmi-codec: Add a prepare hook
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 6 months ago
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240218/202402181541.SXeou8Rg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402181541.SXeou8Rg-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)

Old smatch warnings:
sound/soc/codecs/hdmi-codec.c:551 hdmi_codec_hw_params() error: __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)

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
