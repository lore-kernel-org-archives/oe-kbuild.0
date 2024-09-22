Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34217711B
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 23:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727047518; cv=none; b=WwTk4rvS8300UHhnEPyzV1mLdf+kBPhKZPimgOsWWzQyN5Hui2/PC7fdGyKLTgun8tnb1w8OtWXZqBwWV2/etXh4ZRRBshwp1Ji7WVHhwYVdXWM966KuVGJsjgkh255TxDExYVJPtDyev5IYNKbzFxIQIX6TisPPBpi/0WOFUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727047518; c=relaxed/simple;
	bh=bNILnqj6oxYWrlaNMMmxGMpLiQ0uh46Za9EnnWRI6lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sLuSPww52HLZFRPx+/U7sPq1gsjz12fVxhC1REa9MG3OtYkl1dY/s4pUdWWcP+0rmBagxI7S5EKqxv+GyFoBdK+ucIUw5nUhJGoun4MB12/XhS1ZzMRB2i+k7mgnSZtJQKrTHvSWVevfRXDEw6D8ncBf7g5e/CT80jd+QtPRxIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUXe9BVi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUXe9BVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727047517; x=1758583517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNILnqj6oxYWrlaNMMmxGMpLiQ0uh46Za9EnnWRI6lc=;
  b=PUXe9BViV1I2Lfv+sFWOMdL8fjkJfTxUHD3f5O50ydpcfalwdSNDzhc0
   oVThqXRPqVCGG81gbyZmyuVRO/vLC3Lrmt0dtSZtSOWrw5pMGpS95jr4J
   cHPFCc9Q46D6Wsk2wuFWhaRJBge2MXDJJR9TMGz6MHzk5BA+FUFt7QHec
   y0JhbuhqwZ4+sxy/OLd1GMfaCE+htzhkPc6tpLLCX8Q6Y5X6cRekpr5gP
   rLUtgrwfrN2Dk34ZieGXaQoSWIIps2YgsP4IhGL3D0ZGgFbghYzESZCR5
   VDIKBslFt/BS5PDp6FN6DGhr9LQJkpQdG5tzRSmq8Ekc5TDABeOUnGOzz
   w==;
X-CSE-ConnectionGUID: z7SLudMuShKkI6XS+E4ygA==
X-CSE-MsgGUID: Lsy/O37WQziKG4w/cTCR7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36554355"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="36554355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 16:25:16 -0700
X-CSE-ConnectionGUID: UHwZ4N7PRL24JeZALa6+Kw==
X-CSE-MsgGUID: Cn3KUa3aT+WkIlmtUvAAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="101735253"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2024 16:25:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssVx2-000Gjc-1D;
	Sun, 22 Sep 2024 23:25:12 +0000
Date: Mon, 23 Sep 2024 07:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/catpt/pcm.c:366 catpt_dai_apply_usettings() warn:
 iterator used outside loop: 'pos'
Message-ID: <202409230718.rgcrtQuU-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: 2932fb0a927d30690b8cb70c71d511fd9054bb61 list: leverage list_is_head() for list_entry_is_head()
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20240923 (https://download.01.org/0day-ci/archive/20240923/202409230718.rgcrtQuU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230718.rgcrtQuU-lkp@intel.com/

New smatch warnings:
sound/soc/intel/catpt/pcm.c:366 catpt_dai_apply_usettings() warn: iterator used outside loop: 'pos'

Old smatch warnings:
sound/soc/intel/catpt/pcm.c:367 catpt_dai_apply_usettings() warn: iterator used outside loop: 'pos'

vim +/pos +366 sound/soc/intel/catpt/pcm.c

768a3a3b327da8 Cezary Rojewski 2020-11-16  328  
768a3a3b327da8 Cezary Rojewski 2020-11-16  329  static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
768a3a3b327da8 Cezary Rojewski 2020-11-16  330  				     struct catpt_stream_runtime *stream)
768a3a3b327da8 Cezary Rojewski 2020-11-16  331  {
768a3a3b327da8 Cezary Rojewski 2020-11-16  332  	struct snd_soc_component *component = dai->component;
a9830fc388817c Andy Shevchenko 2020-12-14  333  	struct snd_kcontrol *pos;
a62a02986d3990 Cezary Rojewski 2021-12-16  334  	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
768a3a3b327da8 Cezary Rojewski 2020-11-16  335  	const char *name;
768a3a3b327da8 Cezary Rojewski 2020-11-16  336  	int ret;
768a3a3b327da8 Cezary Rojewski 2020-11-16  337  	u32 id = stream->info.stream_hw_id;
768a3a3b327da8 Cezary Rojewski 2020-11-16  338  
768a3a3b327da8 Cezary Rojewski 2020-11-16  339  	/* only selected streams have individual controls */
768a3a3b327da8 Cezary Rojewski 2020-11-16  340  	switch (id) {
768a3a3b327da8 Cezary Rojewski 2020-11-16  341  	case CATPT_PIN_ID_OFFLOAD1:
768a3a3b327da8 Cezary Rojewski 2020-11-16  342  		name = "Media0 Playback Volume";
768a3a3b327da8 Cezary Rojewski 2020-11-16  343  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  344  	case CATPT_PIN_ID_OFFLOAD2:
768a3a3b327da8 Cezary Rojewski 2020-11-16  345  		name = "Media1 Playback Volume";
768a3a3b327da8 Cezary Rojewski 2020-11-16  346  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  347  	case CATPT_PIN_ID_CAPTURE1:
768a3a3b327da8 Cezary Rojewski 2020-11-16  348  		name = "Mic Capture Volume";
768a3a3b327da8 Cezary Rojewski 2020-11-16  349  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  350  	case CATPT_PIN_ID_REFERENCE:
768a3a3b327da8 Cezary Rojewski 2020-11-16  351  		name = "Loopback Mute";
768a3a3b327da8 Cezary Rojewski 2020-11-16  352  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  353  	default:
768a3a3b327da8 Cezary Rojewski 2020-11-16  354  		return 0;
e01a03db74a880 Yang Li         2021-02-01  355  	}
768a3a3b327da8 Cezary Rojewski 2020-11-16  356  
768a3a3b327da8 Cezary Rojewski 2020-11-16  357  	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
768a3a3b327da8 Cezary Rojewski 2020-11-16  358  		if (pos->private_data == component &&
a9830fc388817c Andy Shevchenko 2020-12-14  359  		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
768a3a3b327da8 Cezary Rojewski 2020-11-16  360  			break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  361  	}
a9830fc388817c Andy Shevchenko 2020-12-14  362  	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
768a3a3b327da8 Cezary Rojewski 2020-11-16  363  		return -ENOENT;
768a3a3b327da8 Cezary Rojewski 2020-11-16  364  
768a3a3b327da8 Cezary Rojewski 2020-11-16  365  	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
a9830fc388817c Andy Shevchenko 2020-12-14 @366  		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
a9830fc388817c Andy Shevchenko 2020-12-14  367  	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
768a3a3b327da8 Cezary Rojewski 2020-11-16  368  	if (ret)
768a3a3b327da8 Cezary Rojewski 2020-11-16  369  		return CATPT_IPC_ERROR(ret);
768a3a3b327da8 Cezary Rojewski 2020-11-16  370  	return 0;
768a3a3b327da8 Cezary Rojewski 2020-11-16  371  }
768a3a3b327da8 Cezary Rojewski 2020-11-16  372  

:::::: The code at line 366 was first introduced by commit
:::::: a9830fc388817c90282925694474fae005fec990 catpt: Switch to use list_entry_is_head() helper

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
