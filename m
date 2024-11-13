Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39991DFD9F
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501676; cv=none; b=T9jlE4p8D0/ZbhQublJOVBTu9tM47I381YO+WJG8uEWUmR2Bxl3kocU3gXBTvajTo9KuOHYCOBsP+xUPHv25gNY4y8bcGuN/DrTvvtFOG6UVngSAqBe9YdHNteCqkYacsBe7SnUydhfwSlnvkTc/mhpW+wUwZwcVdO9BstgcwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501676; c=relaxed/simple;
	bh=HZAuFzxxk8wNed0mr14GmmfPP9VBHYwdgGRgUgEmArM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9FMZ9n84JooOvlwztjoTT0bZPk4JMe61GQ6UIp64eH8ussUqAxoQJbPaB33oxVPI/ks7J3YF5cxrC1nyfmyB1cpq0aVpPZO46XrtbGVYAiJqENy4cHe7lgs2q2LK4XPu9AgO3Eo4QjhEjGf1ylvcOy8lQ2WNDFrX/MBFAZlUdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GncHR8+5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GncHR8+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731501675; x=1763037675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZAuFzxxk8wNed0mr14GmmfPP9VBHYwdgGRgUgEmArM=;
  b=GncHR8+5nN9CD0G0SJnl+Dpd6Zy8zfxY9HLQRyMwNcXrLt4IsPmynpt8
   o/kUY5b8mfcxQx2aghmiNeOAbvYCAHlARkqem4eVZ0nHkBT1Cxc+va31Y
   RuUYWNBsxMQa8Cv0hy9ovSqAv1zkwpz4451FZxgpAGc3AeYEBsaNL8kYO
   V1qi+/ZvJZfiksM5SP2v3bNWjZt/C120AOpJMeW6+4jRJ3byJS67nBUSX
   PpZgzXY4l4cqUaYltJe+1Ua+f6to635A+0zHrY/jAv/SX5eWRLqbJoZHs
   +2RNFzKEsTXWAbCXXg1zjuxXEa13IgcXb4VbOHwtzIzoSP7kOjeVC7XID
   g==;
X-CSE-ConnectionGUID: gcG5jLqoRyGYaqXD/Ezo1g==
X-CSE-MsgGUID: febUzSZyTwmZXSQ7B3x9wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30784412"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30784412"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 04:41:12 -0800
X-CSE-ConnectionGUID: wCfCn18NQ2eO5gaQlhqppQ==
X-CSE-MsgGUID: rREFYd1oR0u2/xRt3sWj1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87431176"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2024 04:41:11 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBCgG-0000Nr-35;
	Wed, 13 Nov 2024 12:41:08 +0000
Date: Wed, 13 Nov 2024 20:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 11/13]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202411132026.abNXeRjz-lkp@intel.com>
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
head:   ee2e0e624b3958f48d3bdeabeda5396444f9e5ec
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [11/13] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
:::::: branch date: 16 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132026.abNXeRjz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411132026.abNXeRjz-lkp@intel.com/

smatch warnings:
sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +504 sound/soc/codecs/hdmi-codec.c

09184118a8abae Jyri Sarha        2016-03-31  483  
09184118a8abae Jyri Sarha        2016-03-31  484  static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
09184118a8abae Jyri Sarha        2016-03-31  485  				struct snd_pcm_hw_params *params,
09184118a8abae Jyri Sarha        2016-03-31  486  				struct snd_soc_dai *dai)
09184118a8abae Jyri Sarha        2016-03-31  487  {
09184118a8abae Jyri Sarha        2016-03-31  488  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
0cf4610b9f297e Jerome Brunet     2019-05-06  489  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
09184118a8abae Jyri Sarha        2016-03-31  490  	struct hdmi_codec_params hp = {
09184118a8abae Jyri Sarha        2016-03-31  491  		.iec = {
09184118a8abae Jyri Sarha        2016-03-31  492  			.status = { 0 },
09184118a8abae Jyri Sarha        2016-03-31  493  			.subcode = { 0 },
09184118a8abae Jyri Sarha        2016-03-31  494  			.pad = 0,
09184118a8abae Jyri Sarha        2016-03-31  495  			.dig_subframe = { 0 },
09184118a8abae Jyri Sarha        2016-03-31  496  		}
09184118a8abae Jyri Sarha        2016-03-31  497  	};
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  498  	int ret, idx;
09184118a8abae Jyri Sarha        2016-03-31  499  
09184118a8abae Jyri Sarha        2016-03-31  500  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
09184118a8abae Jyri Sarha        2016-03-31  501  		params_width(params), params_rate(params),
09184118a8abae Jyri Sarha        2016-03-31  502  		params_channels(params));
09184118a8abae Jyri Sarha        2016-03-31  503  
4ad97b395f94bc Maxime Ripard     2021-05-25 @504  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
4ad97b395f94bc Maxime Ripard     2021-05-25  505  	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
09184118a8abae Jyri Sarha        2016-03-31  506  						     sizeof(hp.iec.status));
09184118a8abae Jyri Sarha        2016-03-31  507  	if (ret < 0) {
09184118a8abae Jyri Sarha        2016-03-31  508  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
09184118a8abae Jyri Sarha        2016-03-31  509  			ret);
09184118a8abae Jyri Sarha        2016-03-31  510  		return ret;
09184118a8abae Jyri Sarha        2016-03-31  511  	}
09184118a8abae Jyri Sarha        2016-03-31  512  
09184118a8abae Jyri Sarha        2016-03-31  513  	hdmi_audio_infoframe_init(&hp.cea);
09184118a8abae Jyri Sarha        2016-03-31  514  	hp.cea.channels = params_channels(params);
09184118a8abae Jyri Sarha        2016-03-31  515  	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
09184118a8abae Jyri Sarha        2016-03-31  516  	hp.cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
09184118a8abae Jyri Sarha        2016-03-31  517  	hp.cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
09184118a8abae Jyri Sarha        2016-03-31  518  
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  519  	/* Select a channel allocation that matches with ELD and pcm channels */
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  520  	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, hp.cea.channels);
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  521  	if (idx < 0) {
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  522  		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  523  			idx);
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  524  		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  525  		return idx;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  526  	}
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  527  	hp.cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  528  	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  529  
09184118a8abae Jyri Sarha        2016-03-31  530  	hp.sample_width = params_width(params);
09184118a8abae Jyri Sarha        2016-03-31  531  	hp.sample_rate = params_rate(params);
09184118a8abae Jyri Sarha        2016-03-31  532  	hp.channels = params_channels(params);
09184118a8abae Jyri Sarha        2016-03-31  533  
49e502f0c0483e Sia Jee Heng      2021-02-04  534  	cf->bit_fmt = params_format(params);
efc9194bcff846 Kuninori Morimoto 2016-06-24  535  	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e Jerome Brunet     2019-05-06  536  				       cf, &hp);
09184118a8abae Jyri Sarha        2016-03-31  537  }
09184118a8abae Jyri Sarha        2016-03-31  538  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
