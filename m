Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892751A38F9
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485641; cv=none; b=UQt9J7W8flfzPVzV+uL8onT5Hrrm7eN13pVr1FO92HIH0xMDqCmstGSpNkk8h2Kf84E4HqBgrTL6xMtytDkcsCGFkUweF3aOIfGLnBmVjEgjsKvIoc1AdwPV4iwSmFwTmwQ1UOUEruZEY0J+esp8nILZOqF9zrXN2u6axYZfWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485641; c=relaxed/simple;
	bh=NsThu1ch3GPrUvErtk5jM6JAYKIV5i6qLQTFBax0kxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1yA74cY7Jdj0IOT6jyrTG5baLkF6NpCO6r2vlHf3bUg5M2u0Thrlmn5Xzc8JLGs4ZfrY2kL/SI2B7wnimaIDC19KRW/yHWOgcIgISqjQd3lJcQVdXxIq02SafGd4gd3w6ZMfaS1GBC0SGnrVeXq34LZizbmeLuBXXEbtR7dyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFeg++lR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFeg++lR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728485639; x=1760021639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NsThu1ch3GPrUvErtk5jM6JAYKIV5i6qLQTFBax0kxU=;
  b=mFeg++lRMbkofPHbqdsuZo/OijPo/iN+aP2f/Dw+mSUFuoUNNqgwe4E+
   2SOf/E42Wa9pjJ2gSuUXQbsjkn8fOBlt6Z7absRcxlQpHY8iM13pF26gd
   WNgc5WU+JkgJ4tII5mTkX49pmqoK7fNDDPBFRN2hmEoVtHbQkiJau1FjD
   vIFvRXQ3rRvydGUJCIKfD4ST9g547P760P0qZoAI8/2c7B1KdQ8rDcfv8
   0u5qGMp53TkP4EAa2JUIsRzVrOmlsMy9z94SDxTyoVNcPVadOV0ambqym
   bTAOAlwZbGeSdjVYpqC9oBJSh1lcg6UPGskhY3puO2id40zfMCcuNK+4m
   Q==;
X-CSE-ConnectionGUID: gYGPNHOcRoaje1eo8LjTyg==
X-CSE-MsgGUID: MsxwJya1ThuzgQcfqGMQMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38919210"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="38919210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 07:53:59 -0700
X-CSE-ConnectionGUID: 1xf+BpuURtyx0msw4cpcig==
X-CSE-MsgGUID: 4AqKRwiZRiqdNEHbk+PLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76290950"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2024 07:53:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syY4Z-0009LM-2X;
	Wed, 09 Oct 2024 14:53:55 +0000
Date: Wed, 9 Oct 2024 22:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2534/3432] sound/soc/codecs/rt-sdw-common.c:172
 rt_sdca_headset_detect() error: uninitialized symbol 'jack_type'.
Message-ID: <202410092225.mjrTmSXJ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jack Yu <jack.yu@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: 86ce355c1f9ab943bbe099ea7d0b8a3af2247f65 [2534/3432] ASoC: rt721-sdca: Add RT721 SDCA driver
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092225.mjrTmSXJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410092225.mjrTmSXJ-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/rt-sdw-common.c:172 rt_sdca_headset_detect() error: uninitialized symbol 'jack_type'.

Old smatch warnings:
sound/soc/codecs/rt-sdw-common.c:127 rt_sdca_btn_type() error: uninitialized symbol 'ret'.

vim +/jack_type +172 sound/soc/codecs/rt-sdw-common.c

bbca8e7050e076 Jack Yu 2024-10-01  130  
bbca8e7050e076 Jack Yu 2024-10-01  131  /**
bbca8e7050e076 Jack Yu 2024-10-01  132   * rt_sdca_headset_detect - Headset jack type detection.
bbca8e7050e076 Jack Yu 2024-10-01  133   *
bbca8e7050e076 Jack Yu 2024-10-01  134   * @map: map for setting.
bbca8e7050e076 Jack Yu 2024-10-01  135   * @entity_id: SDCA entity ID.
bbca8e7050e076 Jack Yu 2024-10-01  136   *
bbca8e7050e076 Jack Yu 2024-10-01  137   * A headset jack type will be returned, a negative errno will
bbca8e7050e076 Jack Yu 2024-10-01  138   * be returned in error cases.
bbca8e7050e076 Jack Yu 2024-10-01  139   */
bbca8e7050e076 Jack Yu 2024-10-01  140  int rt_sdca_headset_detect(struct regmap *map, unsigned int entity_id)
bbca8e7050e076 Jack Yu 2024-10-01  141  {
bbca8e7050e076 Jack Yu 2024-10-01  142  	unsigned int det_mode, jack_type;
bbca8e7050e076 Jack Yu 2024-10-01  143  	int ret;
bbca8e7050e076 Jack Yu 2024-10-01  144  
bbca8e7050e076 Jack Yu 2024-10-01  145  	/* get detected_mode */
bbca8e7050e076 Jack Yu 2024-10-01  146  	ret = regmap_read(map, SDW_SDCA_CTL(SDCA_NUM_JACK_CODEC, entity_id,
bbca8e7050e076 Jack Yu 2024-10-01  147  			RT_SDCA_CTL_DETECTED_MODE, 0), &det_mode);
bbca8e7050e076 Jack Yu 2024-10-01  148  
bbca8e7050e076 Jack Yu 2024-10-01  149  	if (ret < 0)
bbca8e7050e076 Jack Yu 2024-10-01  150  		goto io_error;
bbca8e7050e076 Jack Yu 2024-10-01  151  
bbca8e7050e076 Jack Yu 2024-10-01  152  	switch (det_mode) {
bbca8e7050e076 Jack Yu 2024-10-01  153  	case 0x00:
bbca8e7050e076 Jack Yu 2024-10-01  154  		jack_type = 0;
bbca8e7050e076 Jack Yu 2024-10-01  155  		break;
bbca8e7050e076 Jack Yu 2024-10-01  156  	case 0x03:
bbca8e7050e076 Jack Yu 2024-10-01  157  		jack_type = SND_JACK_HEADPHONE;
bbca8e7050e076 Jack Yu 2024-10-01  158  		break;
bbca8e7050e076 Jack Yu 2024-10-01  159  	case 0x05:
bbca8e7050e076 Jack Yu 2024-10-01  160  		jack_type = SND_JACK_HEADSET;
bbca8e7050e076 Jack Yu 2024-10-01  161  		break;
bbca8e7050e076 Jack Yu 2024-10-01  162  	}
bbca8e7050e076 Jack Yu 2024-10-01  163  
bbca8e7050e076 Jack Yu 2024-10-01  164  	/* write selected_mode */
bbca8e7050e076 Jack Yu 2024-10-01  165  	if (det_mode) {
bbca8e7050e076 Jack Yu 2024-10-01  166  		ret = regmap_write(map, SDW_SDCA_CTL(SDCA_NUM_JACK_CODEC, entity_id,
bbca8e7050e076 Jack Yu 2024-10-01  167  				RT_SDCA_CTL_SELECTED_MODE, 0), det_mode);
bbca8e7050e076 Jack Yu 2024-10-01  168  		if (ret < 0)
bbca8e7050e076 Jack Yu 2024-10-01  169  			goto io_error;
bbca8e7050e076 Jack Yu 2024-10-01  170  	}
bbca8e7050e076 Jack Yu 2024-10-01  171  
bbca8e7050e076 Jack Yu 2024-10-01 @172  	return jack_type;
bbca8e7050e076 Jack Yu 2024-10-01  173  
bbca8e7050e076 Jack Yu 2024-10-01  174  io_error:
bbca8e7050e076 Jack Yu 2024-10-01  175  	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
bbca8e7050e076 Jack Yu 2024-10-01  176  	return ret;
bbca8e7050e076 Jack Yu 2024-10-01  177  }
bbca8e7050e076 Jack Yu 2024-10-01  178  EXPORT_SYMBOL_GPL(rt_sdca_headset_detect);
bbca8e7050e076 Jack Yu 2024-10-01  179  

:::::: The code at line 172 was first introduced by commit
:::::: bbca8e7050e0769d46eb775082d1926db05e7dac ASoC: rt-sdw-common: Common functions for Realtek soundwire driver

:::::: TO: Jack Yu <jack.yu@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
