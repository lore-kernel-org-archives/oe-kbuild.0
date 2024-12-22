Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3147346D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734892452; cv=none; b=rrucZYbYMgl8e8VxuHrLNgizzZZCL3iouXnlxAMQ8gyVPnjyN33eyj1XqJnPAY/Ll2yfjvHOgc9fsyYFeuBS7zGwfvE6ZmAQ+cdh6BDLWT/mIjLvCjsqOAnnvz6L4dT7ArLEZsAYSuCh7Dl25LALKdZKgS/gbR2DYr5KsTqHccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734892452; c=relaxed/simple;
	bh=Kv+2WXPUVq9vBYqVMfw/KpjtzHyB7u5wozt8EmePKyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQGU/u6bCPJvmHn+SzLJN2U9lmxT6VleSdE94LBEhuWxsrmJq+y9sjavjT8zEn2IIz9IPNJ5b9+ocNxYcWmFu0g95yPikJD4DM/bvBqAT/D9Re+DX5Hn5VRjAbVQFtn0v0chTeaUQ1z1QwkRoOZwpx1uwHGDdnxvGhWxZ+GWaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kT0s3VP0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kT0s3VP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734892450; x=1766428450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kv+2WXPUVq9vBYqVMfw/KpjtzHyB7u5wozt8EmePKyk=;
  b=kT0s3VP0Ygl64NiG/igSDVYIwdx4jhi75jb7I7kAVBPOs9H1B/0JBGRo
   zDykUVzWM1VruRzJ8YCENhytj3jisncHNXERvv/mBLXtouV64qnrNaHcJ
   jfyDlWIv22tuMCDgUHvpjzfqkYNnMVxmOzUb7PNBM4ZhHZxREt0gGhVka
   isd/1BtInJMV1CdSTx5KgxzGqqXYyuAl9C2mBZiN2RcztHxhw/YOnFzQ/
   +0DAUUvoKfSFAAOEpC+ut/6XUvpPPNK9lVbN4fLvW0ZINmfVyhEPfm2rp
   /B+z9L+VKmkEyHMuNXVni5UiJ6dtPCuML6wfwkHTQnUtyMCxiw8MFJIud
   g==;
X-CSE-ConnectionGUID: krywqWE5TvGE7JgQlqCLKw==
X-CSE-MsgGUID: 98v7M3piRTGvZp2eebRFug==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35251370"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35251370"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 10:34:09 -0800
X-CSE-ConnectionGUID: 5shMCMlwQIKQfi2WlJ1zWg==
X-CSE-MsgGUID: FEPoxkhqSMC6upCneWPk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98816560"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2024 10:34:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPQmE-00036L-0T;
	Sun, 22 Dec 2024 18:34:06 +0000
Date: Mon, 23 Dec 2024 02:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/catpt/pcm.c:366 catpt_dai_apply_usettings() warn:
 iterator used outside loop: 'pos'
Message-ID: <202412230210.gupEEG8G-lkp@intel.com>
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
head:   bcde95ce32b666478d6737219caa4f8005a8f201
commit: 2932fb0a927d30690b8cb70c71d511fd9054bb61 list: leverage list_is_head() for list_entry_is_head()
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241223/202412230210.gupEEG8G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412230210.gupEEG8G-lkp@intel.com/

New smatch warnings:
sound/soc/intel/catpt/pcm.c:366 catpt_dai_apply_usettings() warn: iterator used outside loop: 'pos'

Old smatch warnings:
sound/soc/intel/catpt/pcm.c:367 catpt_dai_apply_usettings() warn: iterator used outside loop: 'pos'

vim +/pos +366 sound/soc/intel/catpt/pcm.c

768a3a3b327da88 Cezary Rojewski 2020-11-16  328  
768a3a3b327da88 Cezary Rojewski 2020-11-16  329  static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
768a3a3b327da88 Cezary Rojewski 2020-11-16  330  				     struct catpt_stream_runtime *stream)
768a3a3b327da88 Cezary Rojewski 2020-11-16  331  {
768a3a3b327da88 Cezary Rojewski 2020-11-16  332  	struct snd_soc_component *component = dai->component;
a9830fc388817c9 Andy Shevchenko 2020-12-14  333  	struct snd_kcontrol *pos;
a62a02986d3990f Cezary Rojewski 2021-12-16  334  	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
768a3a3b327da88 Cezary Rojewski 2020-11-16  335  	const char *name;
768a3a3b327da88 Cezary Rojewski 2020-11-16  336  	int ret;
768a3a3b327da88 Cezary Rojewski 2020-11-16  337  	u32 id = stream->info.stream_hw_id;
768a3a3b327da88 Cezary Rojewski 2020-11-16  338  
768a3a3b327da88 Cezary Rojewski 2020-11-16  339  	/* only selected streams have individual controls */
768a3a3b327da88 Cezary Rojewski 2020-11-16  340  	switch (id) {
768a3a3b327da88 Cezary Rojewski 2020-11-16  341  	case CATPT_PIN_ID_OFFLOAD1:
768a3a3b327da88 Cezary Rojewski 2020-11-16  342  		name = "Media0 Playback Volume";
768a3a3b327da88 Cezary Rojewski 2020-11-16  343  		break;
768a3a3b327da88 Cezary Rojewski 2020-11-16  344  	case CATPT_PIN_ID_OFFLOAD2:
768a3a3b327da88 Cezary Rojewski 2020-11-16  345  		name = "Media1 Playback Volume";
768a3a3b327da88 Cezary Rojewski 2020-11-16  346  		break;
768a3a3b327da88 Cezary Rojewski 2020-11-16  347  	case CATPT_PIN_ID_CAPTURE1:
768a3a3b327da88 Cezary Rojewski 2020-11-16  348  		name = "Mic Capture Volume";
768a3a3b327da88 Cezary Rojewski 2020-11-16  349  		break;
768a3a3b327da88 Cezary Rojewski 2020-11-16  350  	case CATPT_PIN_ID_REFERENCE:
768a3a3b327da88 Cezary Rojewski 2020-11-16  351  		name = "Loopback Mute";
768a3a3b327da88 Cezary Rojewski 2020-11-16  352  		break;
768a3a3b327da88 Cezary Rojewski 2020-11-16  353  	default:
768a3a3b327da88 Cezary Rojewski 2020-11-16  354  		return 0;
e01a03db74a8808 Yang Li         2021-02-01  355  	}
768a3a3b327da88 Cezary Rojewski 2020-11-16  356  
768a3a3b327da88 Cezary Rojewski 2020-11-16  357  	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
768a3a3b327da88 Cezary Rojewski 2020-11-16  358  		if (pos->private_data == component &&
a9830fc388817c9 Andy Shevchenko 2020-12-14  359  		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
768a3a3b327da88 Cezary Rojewski 2020-11-16  360  			break;
768a3a3b327da88 Cezary Rojewski 2020-11-16  361  	}
a9830fc388817c9 Andy Shevchenko 2020-12-14  362  	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
768a3a3b327da88 Cezary Rojewski 2020-11-16  363  		return -ENOENT;
768a3a3b327da88 Cezary Rojewski 2020-11-16  364  
768a3a3b327da88 Cezary Rojewski 2020-11-16  365  	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
a9830fc388817c9 Andy Shevchenko 2020-12-14 @366  		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
a9830fc388817c9 Andy Shevchenko 2020-12-14  367  	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
768a3a3b327da88 Cezary Rojewski 2020-11-16  368  	if (ret)
768a3a3b327da88 Cezary Rojewski 2020-11-16  369  		return CATPT_IPC_ERROR(ret);
768a3a3b327da88 Cezary Rojewski 2020-11-16  370  	return 0;
768a3a3b327da88 Cezary Rojewski 2020-11-16  371  }
768a3a3b327da88 Cezary Rojewski 2020-11-16  372  

:::::: The code at line 366 was first introduced by commit
:::::: a9830fc388817c90282925694474fae005fec990 catpt: Switch to use list_entry_is_head() helper

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
