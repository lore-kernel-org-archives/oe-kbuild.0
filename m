Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7E2B9B4
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 02:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733278777; cv=none; b=Uk8ILOOgmAQxB7Poo5vah+Dj7qA7VSX1S65U5KJCNC9hAnjE1R+nzUUJTdkCLYzSa2wzn0/3u6PU90JuNECFDd+U/DulLHt2fZcKm60QhaQqd1G0rT+EmhYJm+exGD7BBJMQMVEZIeEtlq2xJLus1BTs2HSgxekGqEq7+d3vGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733278777; c=relaxed/simple;
	bh=SOmDGxjR51OxYUgNuN7HPx6TfkEExzbKFFDp9qH1r4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VENP6tPDwLCqIZIP/3kS4tw/Hod0zjxpRB9OtUyisvNEcCrQFDzI+5f5aixlI+JH5dRAAHiMlgWP56YIY3zlfOzdt21Y6MZKqE2o6WeXTEb4FyxZqGuJDzrKXMqRzq9YjWc5ahH4MhRtsZeLMaZqLka/YMSBVKZ9mkV6+Vw8SDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgHYiq4E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgHYiq4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733278775; x=1764814775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOmDGxjR51OxYUgNuN7HPx6TfkEExzbKFFDp9qH1r4E=;
  b=DgHYiq4EWL7VPqS3YClr9i+OwRu3kPL9mbazassGJSsQnA8D9FgzlkBc
   sWpaGuLh4fEGfG8Q6YINTh5O0GltxS8eZt7/AMZI/qotzjNCOWKdbWJNm
   qopJie6g5coS/vkwCNdDMKFwwl0rCVaxE5i2KaFUE+5v+HEeYLEH1+ld3
   AqJN1i/8vW8/PBdcG2ykWwRGpn4GQJf7awVrbspRJkg+PQbZsmAXveXLS
   UwDcDzWuDernRBfPSmf5ApdkFXJv1F20vdleAi8HcC3WUCHxlsRcqa0go
   xFbIkDfPPqf+UIto+tX5haGO/njFMbBNQ4boyYU0jR9jeUwBlsdFbfeJp
   Q==;
X-CSE-ConnectionGUID: NEjNHtt+SVa7IHyIw5z2bw==
X-CSE-MsgGUID: lVMfUrepRuiMA3jL5i65pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44555499"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44555499"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 18:19:35 -0800
X-CSE-ConnectionGUID: dpOBhob5QD+DmtXE4EWp5w==
X-CSE-MsgGUID: 9OL8dcmqQSi7Wsv1kSgvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="98705734"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Dec 2024 18:19:34 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIezA-0000T1-0f;
	Wed, 04 Dec 2024 02:19:29 +0000
Date: Wed, 4 Dec 2024 10:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 11/13]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202412041032.a7oROgnh-lkp@intel.com>
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
head:   7c627b9bc8f94d32c29992d4da3aef0f04f0bb3a
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [11/13] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
:::::: branch date: 31 hours ago
:::::: commit date: 2 years, 4 months ago
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241204/202412041032.a7oROgnh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412041032.a7oROgnh-lkp@intel.com/

smatch warnings:
sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +504 sound/soc/codecs/hdmi-codec.c

09184118a8abae0 Jyri Sarha        2016-03-31  483  
09184118a8abae0 Jyri Sarha        2016-03-31  484  static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
09184118a8abae0 Jyri Sarha        2016-03-31  485  				struct snd_pcm_hw_params *params,
09184118a8abae0 Jyri Sarha        2016-03-31  486  				struct snd_soc_dai *dai)
09184118a8abae0 Jyri Sarha        2016-03-31  487  {
09184118a8abae0 Jyri Sarha        2016-03-31  488  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
0cf4610b9f297e5 Jerome Brunet     2019-05-06  489  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
09184118a8abae0 Jyri Sarha        2016-03-31  490  	struct hdmi_codec_params hp = {
09184118a8abae0 Jyri Sarha        2016-03-31  491  		.iec = {
09184118a8abae0 Jyri Sarha        2016-03-31  492  			.status = { 0 },
09184118a8abae0 Jyri Sarha        2016-03-31  493  			.subcode = { 0 },
09184118a8abae0 Jyri Sarha        2016-03-31  494  			.pad = 0,
09184118a8abae0 Jyri Sarha        2016-03-31  495  			.dig_subframe = { 0 },
09184118a8abae0 Jyri Sarha        2016-03-31  496  		}
09184118a8abae0 Jyri Sarha        2016-03-31  497  	};
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  498  	int ret, idx;
09184118a8abae0 Jyri Sarha        2016-03-31  499  
09184118a8abae0 Jyri Sarha        2016-03-31  500  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
09184118a8abae0 Jyri Sarha        2016-03-31  501  		params_width(params), params_rate(params),
09184118a8abae0 Jyri Sarha        2016-03-31  502  		params_channels(params));
09184118a8abae0 Jyri Sarha        2016-03-31  503  
4ad97b395f94bc0 Maxime Ripard     2021-05-25 @504  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
4ad97b395f94bc0 Maxime Ripard     2021-05-25  505  	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
09184118a8abae0 Jyri Sarha        2016-03-31  506  						     sizeof(hp.iec.status));
09184118a8abae0 Jyri Sarha        2016-03-31  507  	if (ret < 0) {
09184118a8abae0 Jyri Sarha        2016-03-31  508  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
09184118a8abae0 Jyri Sarha        2016-03-31  509  			ret);
09184118a8abae0 Jyri Sarha        2016-03-31  510  		return ret;
09184118a8abae0 Jyri Sarha        2016-03-31  511  	}
09184118a8abae0 Jyri Sarha        2016-03-31  512  
09184118a8abae0 Jyri Sarha        2016-03-31  513  	hdmi_audio_infoframe_init(&hp.cea);
09184118a8abae0 Jyri Sarha        2016-03-31  514  	hp.cea.channels = params_channels(params);
09184118a8abae0 Jyri Sarha        2016-03-31  515  	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
09184118a8abae0 Jyri Sarha        2016-03-31  516  	hp.cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
09184118a8abae0 Jyri Sarha        2016-03-31  517  	hp.cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
09184118a8abae0 Jyri Sarha        2016-03-31  518  
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  519  	/* Select a channel allocation that matches with ELD and pcm channels */
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  520  	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, hp.cea.channels);
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  521  	if (idx < 0) {
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  522  		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  523  			idx);
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  524  		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  525  		return idx;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  526  	}
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  527  	hp.cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  528  	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  529  
09184118a8abae0 Jyri Sarha        2016-03-31  530  	hp.sample_width = params_width(params);
09184118a8abae0 Jyri Sarha        2016-03-31  531  	hp.sample_rate = params_rate(params);
09184118a8abae0 Jyri Sarha        2016-03-31  532  	hp.channels = params_channels(params);
09184118a8abae0 Jyri Sarha        2016-03-31  533  
49e502f0c0483e3 Sia Jee Heng      2021-02-04  534  	cf->bit_fmt = params_format(params);
efc9194bcff8466 Kuninori Morimoto 2016-06-24  535  	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e5 Jerome Brunet     2019-05-06  536  				       cf, &hp);
09184118a8abae0 Jyri Sarha        2016-03-31  537  }
09184118a8abae0 Jyri Sarha        2016-03-31  538  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
