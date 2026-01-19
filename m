Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98587312801
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822351; cv=none; b=SmSykZijWMu2h1nx9xVXU1ecuUkuRWj4aM9kzgiV2d4mSPns7h4JNC7Co/er1DW35bIMiFLImIAVxyBDqRPfUuGVPyFprkF9C+7qBXPUoGSNQZ4IyucxpeXZRP4mFaIo4oFd7mjsSpapCmZOKRiankhJSkPkwL1+oBUdxfZReuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822351; c=relaxed/simple;
	bh=21oCjq8p8CZntMqTjDJf93Mhj1ngzBaig4VOJ6kIESQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHHoaQwizzOOx9Si2soPdr1dNvcPwf1JUGLdiKaSAcBZWeBWG0u/WxSAFhfinBTmz5/yH84jYYhVqY4KYuRjTzS146BTiIWfIu6JSs1BTSpJ2dqPqcnpXpsB7oG8/ok+YpH+olzJfKdecn0jL1i5hT2SeIWnepC1kc/ujcMnqOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mafI6J6C; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mafI6J6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768822347; x=1800358347;
  h=date:from:to:cc:subject:message-id;
  bh=21oCjq8p8CZntMqTjDJf93Mhj1ngzBaig4VOJ6kIESQ=;
  b=mafI6J6C0M1rGosS3ps7I9Qcb6LCr4PwIvh8WxuteqjMckADCNWRcNrM
   jqzcIkDWRriS7Zfv7vXoG+iHwHaGOgdGN2D2L8LfgIjcR1FR8u4PTILMb
   f4RexwvsarPnH5kvTsao6OWPA+1iE+DzUBg3jj8GZ7QwOvZST6BlfZtf2
   ZkQpBYRChDTk3U5+ilg987beCNoNn9jmDaNWMEne31Ek37b51lLXIMYLM
   QWFLgt1xrperCCtNAjd4g0SI79SdEk7VSKcbmLYNF3j1Z2APuQXONDD6N
   PEGEMWz5q83KzPjxGfh84hCvrV/C91lhxwKc/QGLzsq/U9ixuAM2YX2EP
   Q==;
X-CSE-ConnectionGUID: ql7nZBLqTCOAGlgihPXH2g==
X-CSE-MsgGUID: E5jP1jJLTH+SJFqZszhacg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70083602"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70083602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 03:32:27 -0800
X-CSE-ConnectionGUID: NgvtPf2xTmKgjqTa3zywhA==
X-CSE-MsgGUID: xWW+ZLuVTw6SkJSWnD71nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="243430695"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2026 03:32:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhnUd-00000000NjF-07di;
	Mon, 19 Jan 2026 11:32:23 +0000
Date: Mon, 19 Jan 2026 19:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 196/196]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202601191920.XWUTbCPx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [196/196] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
:::::: branch date: 5 days ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260119/202601191920.XWUTbCPx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601191920.XWUTbCPx-lkp@intel.com/

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
