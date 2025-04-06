Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DDE17A30B
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Apr 2025 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970915; cv=none; b=YeXFu3zSGT1OEHAFkQOfDdmafwVObxC26TD/4kfVNxWm7/DAQwgV+/IRp1lyVj4g1ZEdzM6Nue0F8jad49Nd36dsIdu6hZBdbTgm3tmTZaK3o45P5EV3gCHDLs/oUvH8liKOKSangaTtb1cY6PDCwrfJlrOEVGnGNcYwJaYw0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970915; c=relaxed/simple;
	bh=paDZ0fgT5b5/YRt2DldvGSprhhDiJ/h4nQobz2SusOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uq3pt/R4OK1LbhHZFwjzVZy40c8AGUIPWuotUwUJXviryeZGCP+cNOksQIIITVJA6k4SdVsE9l3vCGYyQw4wLlhjZ9U/nKnG9a95zdMpExksBf5rTV6XpA38+li2kp5XtO5ARbAlnTqvEDhcDOk3larIlQ2v1v6kx5KdvadeOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fueqSpge; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fueqSpge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743970913; x=1775506913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=paDZ0fgT5b5/YRt2DldvGSprhhDiJ/h4nQobz2SusOY=;
  b=fueqSpgez98OYAib5okUO6NaDMWO02/khLTRDVyOlRZwarOsPu51eycA
   Vggs4bxQyyiKiTshzVS5Xn5XxYGf6VVUYK9Er8kl69056ZmnM3sIgIHL9
   tiOOklvWkongQBbP9qt0Q1TZvdj/YzP0gKOTrqtb89o1Y6wh/FhOfHKXY
   Ldq1ZNOtzk99udp3h84M29TeWOG10iA7WXFYPJF9qEz2z5eL0g7hqYw2P
   5v+ENf7oeUvSbfcgu0gP3UEWAR9B22Dh915fS6ZXWSt2MogD17tSh4AJg
   /Hul2k9PgKRTRwJkLTT4Uly8MuvPp3O/CS/2xTfW2G6fHdyh3acxR0Nsq
   w==;
X-CSE-ConnectionGUID: mfv7x8HuREG8BtBXhUrHbg==
X-CSE-MsgGUID: DjJIAGKRQZWQdIboc5XZmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="44488552"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="44488552"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 13:21:52 -0700
X-CSE-ConnectionGUID: sye+1mEsTPyC7LP9qvq+Zg==
X-CSE-MsgGUID: /l1+2QczTJOMUuUwuAlZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127519554"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2025 13:21:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1WV2-0002lJ-25;
	Sun, 06 Apr 2025 20:21:48 +0000
Date: Mon, 7 Apr 2025 04:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-msiof-2025-03-26 21/24]
 sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to
 'PTR_ERR'
Message-ID: <202504070441.9TXJ68nR-lkp@intel.com>
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

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26
head:   ba9316799e85a9ef14dd8a3e5580be4c97149576
commit: adf5f819442084ec2b0ea13a5834b05d10750e24 [21/24] ASoC: renesas: add MSIOF sound support
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: openrisc-randconfig-r071-20250407 (https://download.01.org/0day-ci/archive/20250407/202504070441.9TXJ68nR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504070441.9TXJ68nR-lkp@intel.com/

smatch warnings:
sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +367 sound/soc/renesas/rcar/msiof.c

adf5f819442084e Kuninori Morimoto 2025-03-24  355  
adf5f819442084e Kuninori Morimoto 2025-03-24  356  static int msiof_open(struct snd_soc_component *component,
adf5f819442084e Kuninori Morimoto 2025-03-24  357  		      struct snd_pcm_substream *substream)
adf5f819442084e Kuninori Morimoto 2025-03-24  358  {
adf5f819442084e Kuninori Morimoto 2025-03-24  359  	struct device *dev = component->dev;
adf5f819442084e Kuninori Morimoto 2025-03-24  360  	struct dma_chan *chan;
adf5f819442084e Kuninori Morimoto 2025-03-24  361  	static const char *dma_names[] = {"rx", "tx"};
adf5f819442084e Kuninori Morimoto 2025-03-24  362  	int is_play = msiof_is_play(substream);
adf5f819442084e Kuninori Morimoto 2025-03-24  363  	int ret;
adf5f819442084e Kuninori Morimoto 2025-03-24  364  
adf5f819442084e Kuninori Morimoto 2025-03-24  365  	chan = of_dma_request_slave_channel(dev->of_node, dma_names[is_play]);
adf5f819442084e Kuninori Morimoto 2025-03-24  366  	if (IS_ERR_OR_NULL(chan))
adf5f819442084e Kuninori Morimoto 2025-03-24 @367  		return PTR_ERR(chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  368  
adf5f819442084e Kuninori Morimoto 2025-03-24  369  	ret = snd_dmaengine_pcm_open(substream, chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  370  	if (ret < 0)
adf5f819442084e Kuninori Morimoto 2025-03-24  371  		goto open_err_dma;
adf5f819442084e Kuninori Morimoto 2025-03-24  372  
adf5f819442084e Kuninori Morimoto 2025-03-24  373  	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
adf5f819442084e Kuninori Morimoto 2025-03-24  374  
adf5f819442084e Kuninori Morimoto 2025-03-24  375  	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
adf5f819442084e Kuninori Morimoto 2025-03-24  376  
adf5f819442084e Kuninori Morimoto 2025-03-24  377  open_err_dma:
adf5f819442084e Kuninori Morimoto 2025-03-24  378  	if (ret < 0)
adf5f819442084e Kuninori Morimoto 2025-03-24  379  		dma_release_channel(chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  380  
adf5f819442084e Kuninori Morimoto 2025-03-24  381  	return ret;
adf5f819442084e Kuninori Morimoto 2025-03-24  382  }
adf5f819442084e Kuninori Morimoto 2025-03-24  383  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
