Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9A2564
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727936181; cv=none; b=acJCne4i7jR3sxhExEkK7ycxjjliiNfNiDPRDHf0GjpwUUCp2Ks8FnjSbsON6r3Vu0Qtf/AyC4T6+2niJhy3YS6QjlYKkdNt2nlslMhm4wA26+a/S5j5VrSkXtvJeP2BU8Vm01RI63F7yCGyRfGEbQcYggjq56iYNQsRfjzQLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727936181; c=relaxed/simple;
	bh=1Lzo1Bw+pciCxchklQAKllymew8fOZcqVWdJW4bFFhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jlCTyE9dNsrOkAR5xwJr0a/B0Jj8gTIGfcL1T8Bde55yP2/4rwotbJBq1uVoYqFYeCHTgUHMpN0WTubXMfacD4eaE7o7UCQIVSEh291hvBoNWax1jwipD+l3ZsYqPOJrH5dyStGEVXY+tAs8/DCskA8k/EpQsapwBOgCbn8Tn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6tcjwtu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6tcjwtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727936180; x=1759472180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Lzo1Bw+pciCxchklQAKllymew8fOZcqVWdJW4bFFhI=;
  b=V6tcjwtuxptuJD2XH0qp367OqdmH1IeyVVavflex3ZNT4TGnNx/QZoie
   FCnVqmMVb70jNgWroG78byUZBm1m0r/tCSlHGQyafUL7PSJWCPUw7hBHw
   xO/MO1AmAEOBQFBubKOmZSjlkri73ndkG53LHvsZo8tXSjOAHoqR5ezw1
   wPIjlhqLeOirXJStResb4fzf9vGltHS5xW0IJYLeXY+cUPNimQW+5LeF6
   anoPAqfunyHoY6/NqtziX34l8sUJbFioqa71b4ZYev3csChuHc02fCx6Y
   D738Qf2b8xNBk6T3dg9YR6MGglxIrq1g03In92T76M6iRS8DvDHZfCnGS
   g==;
X-CSE-ConnectionGUID: jhRxTWzpRkeycyjFsbJmRQ==
X-CSE-MsgGUID: UoZvn8pPTLq9hxcGwovOYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44588317"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="44588317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:16:19 -0700
X-CSE-ConnectionGUID: WNnk12NaRLKg8mstU6X9FA==
X-CSE-MsgGUID: uwkjiChpRVO6s2htsVSBpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74491190"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 23:16:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swF8J-00007S-2x;
	Thu, 03 Oct 2024 06:16:15 +0000
Date: Thu, 3 Oct 2024 14:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-error-cleanup-2024-09-30 62/71]
 sound/soc/soc-card.c:215 snd_soc_card_set_bias_level() error: we previously
 assumed 'card' could be null (see line 212)
Message-ID: <202410031405.418T7N8I-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-30
head:   b31c07e66a585a36ee2d6795e3dbbb4cbabab338
commit: d6485ea092fa6dd4f36bfbb4c2eecef748734bf1 [62/71] ASoC: add common snd_soc_ret() and use it
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031405.418T7N8I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410031405.418T7N8I-lkp@intel.com/

smatch warnings:
sound/soc/soc-card.c:215 snd_soc_card_set_bias_level() error: we previously assumed 'card' could be null (see line 212)
sound/soc/soc-card.c:227 snd_soc_card_set_bias_level_post() error: we previously assumed 'card' could be null (see line 224)

vim +/card +215 sound/soc/soc-card.c

39caefda0a30ca Kuninori Morimoto 2020-05-28  205  
39caefda0a30ca Kuninori Morimoto 2020-05-28  206  int snd_soc_card_set_bias_level(struct snd_soc_card *card,
39caefda0a30ca Kuninori Morimoto 2020-05-28  207  				struct snd_soc_dapm_context *dapm,
39caefda0a30ca Kuninori Morimoto 2020-05-28  208  				enum snd_soc_bias_level level)
39caefda0a30ca Kuninori Morimoto 2020-05-28  209  {
39caefda0a30ca Kuninori Morimoto 2020-05-28  210  	int ret = 0;
39caefda0a30ca Kuninori Morimoto 2020-05-28  211  
39caefda0a30ca Kuninori Morimoto 2020-05-28 @212  	if (card && card->set_bias_level)
39caefda0a30ca Kuninori Morimoto 2020-05-28  213  		ret = card->set_bias_level(card, dapm, level);
39caefda0a30ca Kuninori Morimoto 2020-05-28  214  
39caefda0a30ca Kuninori Morimoto 2020-05-28 @215  	return soc_card_ret(card, ret);
39caefda0a30ca Kuninori Morimoto 2020-05-28  216  }
d41278ea0579a8 Kuninori Morimoto 2020-05-28  217  
d41278ea0579a8 Kuninori Morimoto 2020-05-28  218  int snd_soc_card_set_bias_level_post(struct snd_soc_card *card,
d41278ea0579a8 Kuninori Morimoto 2020-05-28  219  				     struct snd_soc_dapm_context *dapm,
d41278ea0579a8 Kuninori Morimoto 2020-05-28  220  				     enum snd_soc_bias_level level)
d41278ea0579a8 Kuninori Morimoto 2020-05-28  221  {
d41278ea0579a8 Kuninori Morimoto 2020-05-28  222  	int ret = 0;
d41278ea0579a8 Kuninori Morimoto 2020-05-28  223  
d41278ea0579a8 Kuninori Morimoto 2020-05-28 @224  	if (card && card->set_bias_level_post)
d41278ea0579a8 Kuninori Morimoto 2020-05-28  225  		ret = card->set_bias_level_post(card, dapm, level);
d41278ea0579a8 Kuninori Morimoto 2020-05-28  226  
d41278ea0579a8 Kuninori Morimoto 2020-05-28 @227  	return soc_card_ret(card, ret);
d41278ea0579a8 Kuninori Morimoto 2020-05-28  228  }
cbc7a6b5a87a12 Kuninori Morimoto 2020-05-28  229  

:::::: The code at line 215 was first introduced by commit
:::::: 39caefda0a30cac8284264e5031a0dd478510ced ASoC: soc-card: add snd_soc_card_set_bias_level()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
