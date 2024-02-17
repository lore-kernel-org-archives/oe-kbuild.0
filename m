Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F361E4AE
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708195323; cv=none; b=mlaO8FesllWx/8D8Qq8zm5GrJN/mqcdDb+Z5/s07hUZDhZOoJtdxNpPoZTdQInUbkZh2pitPMzEkEHC3eHT4pjfGV3YkWPuH5EmvCHLAqio/fpI1iwa19hA+sozFaMWdm4t2hf9N8VF6sOznsDWOzDy4QGCBesFZ54exQMg1un0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708195323; c=relaxed/simple;
	bh=fyGTzYUQ8DgTnvG0nsrN1tWEToqv4ZPT7LNV5+vUxfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GC5wkmQ2FycH/HnSjK+a8o2W5cW9gvcqSW4w4aLyCKA/XhxM3NagZApkAiXxs99ApvwffdWAE7Sas2fR2CNDc/scPYqxPhrEWK3xTsfGrKMV9a9f10XLqRJ1CfWIZrvKhGNjafTYz1MrtfHY9Z+AIeA3+46hJ4OQOu2nTQffev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdxtLVct; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdxtLVct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708195321; x=1739731321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fyGTzYUQ8DgTnvG0nsrN1tWEToqv4ZPT7LNV5+vUxfs=;
  b=YdxtLVct7OZ+/LYonTHOi12drs6q2ovquIpWQABo223nzydGpD8ZjG92
   EQG9fNoRYmUFk3n3zCkX4k9ea9Y1VHtAK8zwCcC4d3w3UDTilY/z7lXb+
   j5BHkce6dwubgVTTBHnLDeEKP8Cuh9RWmlkvZogfOe13LWgaUc+cwhZmL
   hbwA/kKFpTX4yERR4BzSYU4sgvBDMIzfv1z21R0pscTSK/sa3Rlu+Gf7Q
   cnakyYgsTgcEctblrbddH9hrGDsIXpPpIX850Uu4BNzsZERw0mb/V6WWs
   Y5W+qXxJFM0909thX+HICGXN8hIh9QOAI6dt9KkGl4EhCkuJYIhYEi+uK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2439604"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2439604"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 10:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4475785"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2024 10:41:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbPdM-0002Ou-1Y;
	Sat, 17 Feb 2024 18:41:56 +0000
Date: Sun, 18 Feb 2024 02:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 11/13]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error:
 __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202402180247.OJ2TZSS7-lkp@intel.com>
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
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [11/13] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 6 months ago
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240218/202402180247.OJ2TZSS7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402180247.OJ2TZSS7-lkp@intel.com/

smatch warnings:
sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)

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
