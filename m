Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5073393DC8
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 05:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302153; cv=none; b=ozMtLSS4W0cS8loco72xYBIktTUATUMRccpU7aGpiL3tvPdSZrsskvxWvCxYOQR8bCl9QhQqsDKem5ELTaS924i7MReqel9BLoi8qvK2bgEnddNhsiGAIq3ICBcxnxHrvpb2Dh/jK0l0SbxaP1nPlnmgeyCIJbQh1yUn9AHQp7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302153; c=relaxed/simple;
	bh=4MP9+ekWghxJw5V6yF6wgE6GhhIFShPYoGHJ9BOwScQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W2E4JMlgAgbGzKBv1iIXvu7KPTahfjQX6nicbgu5SLn7Ezf92w8gI/DpfrCJE6GY6F3KbRXuQr/GDOC9V4KJL+7M09xSSM1ZJgSpZpqQL4kCvFRpIrKt3NwCGbCchQSd27Uk75w5MgSwVPR63CHPI0Uj1i43Hm9PbxpHsujzuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuTmNSmt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuTmNSmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785302152; x=1816838152;
  h=date:from:to:cc:subject:message-id;
  bh=4MP9+ekWghxJw5V6yF6wgE6GhhIFShPYoGHJ9BOwScQ=;
  b=TuTmNSmtQ+VQ29vLSzuhdN9ZWCyOPD+rTm5snk8MEBTkqPKzkodjAeyx
   vCoZ/n4IiMyPk4offUCkxr39e4LdeEhyTYu44JoJrvJWZgGS5ailh3jwy
   fpBkEGXZlJOS0ZdoLSuQkkdYLvr6V0iNoef3+1l+oPbw9cmBW+A3j25e5
   n0VbVegFPPaoI/DnCA9EGWkMC1BndSKPRvBubeMaFbJmmbT3U3ZzF7W3o
   WL4VlymB7s2zoePAO4neOZoP74f6Wp0PK+aC6Q0sADs9mCyVUxdpcG9hY
   n+p3mwqPfGtyQrVW3WGfEtEh868n0cxtCVYuD04RhKitG1a6uG+kJKUaq
   w==;
X-CSE-ConnectionGUID: BnFjU14PRzONm+D96IgFMw==
X-CSE-MsgGUID: XrY+IFgzRfWLopAh3DwYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85939455"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85939455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 22:15:51 -0700
X-CSE-ConnectionGUID: F0WFCuadQZGMuFsQ+ouR0Q==
X-CSE-MsgGUID: HOTzZAlhQ9+hqPuRuZrcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="283241259"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 22:15:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wowdv-00000000f3l-3wzB;
	Wed, 29 Jul 2026 05:15:47 +0000
Date: Wed, 29 Jul 2026 13:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn:
 missing error code 'ret'
Message-ID: <202607291308.8OeeiyIv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Niranjan H Y <niranjan.hy@ti.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
commit: 38c89fededd5a9472e8222a20aa066058585f7b2 ASoC: tac5xx2-sdw: add soundwire based codec driver
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-r073-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291308.8OeeiyIv-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 38c89fededd5 ("ASoC: tac5xx2-sdw: add soundwire based codec driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607291308.8OeeiyIv-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing error code 'ret'

vim +/ret +984 sound/soc/codecs/tac5xx2-sdw.c

38c89fededd5a9 Niranjan H Y 2026-05-05   978  
38c89fededd5a9 Niranjan H Y 2026-05-05   979  static int tac5xx2_jack_init(struct tac5xx2_prv *tac_dev)
38c89fededd5a9 Niranjan H Y 2026-05-05   980  {
38c89fededd5a9 Niranjan H Y 2026-05-05   981  	int ret = 0;
38c89fededd5a9 Niranjan H Y 2026-05-05   982  
38c89fededd5a9 Niranjan H Y 2026-05-05   983  	if (!tac_dev->hs_jack)
38c89fededd5a9 Niranjan H Y 2026-05-05  @984  		goto disable_interrupts;
38c89fededd5a9 Niranjan H Y 2026-05-05   985  
38c89fededd5a9 Niranjan H Y 2026-05-05   986  	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
38c89fededd5a9 Niranjan H Y 2026-05-05   987  			   SDW_SCP_SDCA_INTMASK_SDCA_11);
38c89fededd5a9 Niranjan H Y 2026-05-05   988  	if (ret) {
38c89fededd5a9 Niranjan H Y 2026-05-05   989  		dev_err(tac_dev->dev,
38c89fededd5a9 Niranjan H Y 2026-05-05   990  			"Failed to register jack detection interrupt: %d\n", ret);
38c89fededd5a9 Niranjan H Y 2026-05-05   991  		goto disable_interrupts;
38c89fededd5a9 Niranjan H Y 2026-05-05   992  	}
38c89fededd5a9 Niranjan H Y 2026-05-05   993  
38c89fededd5a9 Niranjan H Y 2026-05-05   994  	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
38c89fededd5a9 Niranjan H Y 2026-05-05   995  			   SDW_SCP_SDCA_INTMASK_SDCA_16);
38c89fededd5a9 Niranjan H Y 2026-05-05   996  	if (ret) {
38c89fededd5a9 Niranjan H Y 2026-05-05   997  		dev_err(tac_dev->dev,
38c89fededd5a9 Niranjan H Y 2026-05-05   998  			"Failed to register for button detect interrupt: %d\n", ret);
38c89fededd5a9 Niranjan H Y 2026-05-05   999  		goto disable_interrupts;
38c89fededd5a9 Niranjan H Y 2026-05-05  1000  	}
38c89fededd5a9 Niranjan H Y 2026-05-05  1001  
38c89fededd5a9 Niranjan H Y 2026-05-05  1002  	return 0;
38c89fededd5a9 Niranjan H Y 2026-05-05  1003  
38c89fededd5a9 Niranjan H Y 2026-05-05  1004  disable_interrupts:
38c89fededd5a9 Niranjan H Y 2026-05-05  1005  	/* ignore errors while disabling interrupts */
38c89fededd5a9 Niranjan H Y 2026-05-05  1006  	regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2, 0);
38c89fededd5a9 Niranjan H Y 2026-05-05  1007  	regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3, 0);
38c89fededd5a9 Niranjan H Y 2026-05-05  1008  
38c89fededd5a9 Niranjan H Y 2026-05-05  1009  	return ret;
38c89fededd5a9 Niranjan H Y 2026-05-05  1010  }
38c89fededd5a9 Niranjan H Y 2026-05-05  1011  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
