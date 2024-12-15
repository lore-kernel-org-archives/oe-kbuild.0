Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DFA653
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 01:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734225407; cv=none; b=EQAywsElZlaOMUsvoqIJlbPSvAeSy7tYTcmEvLIeW2d1G/I8DRNJ80Dqs2TDpYHkrgNtHbdfJvYxrmUDo1H+uTaLy5s8xFi6c3cUuH+myi+j8TQ6738EeqhtabZsfCHsD8tnzx56wBl65MIHvxHGfYjUYCui5qM1duvPBk2nbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734225407; c=relaxed/simple;
	bh=6LIJo8awgTxEv1rr6NCWpvwY7Qs8C+xM/yBb2kZmZfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XeYnaf+AiHmh/flrumEsSYhxQlxO3zYSlxyljnYXbGbfkjBOm13nLAJSj6MUJWOJM4KNH9zRKh+zDRVjliZWpjfnoU1AlgHs+UFKOV/LkXpUYWhTwPAfYAM/NkEPpf9dQSUI/A3pXLBOI+q+0xMTjG4EhE5g2Wt/e3wCZJdtY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfW5gYSV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfW5gYSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734225405; x=1765761405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LIJo8awgTxEv1rr6NCWpvwY7Qs8C+xM/yBb2kZmZfo=;
  b=ZfW5gYSVwOIGxJST0LxW+Vkcwe+Rb0z0szVeFZqT07ENvNbOiIKDh4fC
   OF8eXJtv646IhkRdfzFAcSUU3WyWyrgCfbw6OV/J+yappsGnDyQjyNLR0
   Ck4hp8pXzJIfV8rbj0PuTKkY0Vd63Hsaydp2LfcPL1j+T0zc66JjEbfGN
   Y0f4rG2bOEFiFz/aansEa0CBWH2iXjrUh9GhUN69GSeeW3N3SiUI3RF7t
   yQEX+qXsvPMCqHTg7zhdvtZMmz1pHd+G4CnZyFbBex/W+h5wLqpRaMbdf
   0QCBThbKt95pg47x3Dx9yoN8nXQLq5CASwd55GPqwFiWbbmudBGcRiQxa
   w==;
X-CSE-ConnectionGUID: B8MD5u/YQkCSyTcc+8/8QA==
X-CSE-MsgGUID: qkBzvQvZS8mg4w4aqxDenw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34782512"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34782512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 17:16:44 -0800
X-CSE-ConnectionGUID: rzA/iwm/SDOwMLFxVc88lw==
X-CSE-MsgGUID: RlWoAxszTHW7WyJ+CLTVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127864849"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2024 17:16:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMdFR-000DMM-03;
	Sun, 15 Dec 2024 01:16:41 +0000
Date: Sun, 15 Dec 2024 09:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we
 previously assumed 'stream' could be null (see line 218)
Message-ID: <202412150955.tg0Byjyq-lkp@intel.com>
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
TO: Syed Saba Kareem <Syed.SabaKareem@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0e3919a2df29b373b19a8fbd6e4c4c38fc10d87
commit: d3534684ada99ef8c0899eb28c62b4462483ee19 ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
date:   1 year, 1 month ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241215/202412150955.tg0Byjyq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150955.tg0Byjyq-lkp@intel.com/

smatch warnings:
sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we previously assumed 'stream' could be null (see line 218)

vim +/stream +217 sound/soc/amd/acp/acp70.c

e84db124cb2158b Syed Saba Kareem 2023-10-21  207  
e84db124cb2158b Syed Saba Kareem 2023-10-21  208  static int __maybe_unused acp70_pcm_resume(struct device *dev)
e84db124cb2158b Syed Saba Kareem 2023-10-21  209  {
e84db124cb2158b Syed Saba Kareem 2023-10-21  210  	struct acp_dev_data *adata = dev_get_drvdata(dev);
e84db124cb2158b Syed Saba Kareem 2023-10-21  211  	struct acp_stream *stream;
e84db124cb2158b Syed Saba Kareem 2023-10-21  212  	struct snd_pcm_substream *substream;
e84db124cb2158b Syed Saba Kareem 2023-10-21  213  	snd_pcm_uframes_t buf_in_frames;
e84db124cb2158b Syed Saba Kareem 2023-10-21  214  	u64 buf_size;
e84db124cb2158b Syed Saba Kareem 2023-10-21  215  
e84db124cb2158b Syed Saba Kareem 2023-10-21  216  	spin_lock(&adata->acp_lock);
e84db124cb2158b Syed Saba Kareem 2023-10-21 @217  	list_for_each_entry(stream, &adata->stream_list, list) {
e84db124cb2158b Syed Saba Kareem 2023-10-21 @218  		if (stream) {
e84db124cb2158b Syed Saba Kareem 2023-10-21  219  			substream = stream->substream;
e84db124cb2158b Syed Saba Kareem 2023-10-21  220  			if (substream && substream->runtime) {
e84db124cb2158b Syed Saba Kareem 2023-10-21  221  				buf_in_frames = (substream->runtime->buffer_size);
e84db124cb2158b Syed Saba Kareem 2023-10-21  222  				buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
e84db124cb2158b Syed Saba Kareem 2023-10-21  223  				config_pte_for_stream(adata, stream);
e84db124cb2158b Syed Saba Kareem 2023-10-21  224  				config_acp_dma(adata, stream, buf_size);
e84db124cb2158b Syed Saba Kareem 2023-10-21  225  				if (stream->dai_id)
e84db124cb2158b Syed Saba Kareem 2023-10-21  226  					restore_acp_i2s_params(substream, adata, stream);
e84db124cb2158b Syed Saba Kareem 2023-10-21  227  				else
e84db124cb2158b Syed Saba Kareem 2023-10-21  228  					restore_acp_pdm_params(substream, adata);
e84db124cb2158b Syed Saba Kareem 2023-10-21  229  			}
e84db124cb2158b Syed Saba Kareem 2023-10-21  230  		}
e84db124cb2158b Syed Saba Kareem 2023-10-21  231  	}
e84db124cb2158b Syed Saba Kareem 2023-10-21  232  	spin_unlock(&adata->acp_lock);
e84db124cb2158b Syed Saba Kareem 2023-10-21  233  	return 0;
e84db124cb2158b Syed Saba Kareem 2023-10-21  234  }
e84db124cb2158b Syed Saba Kareem 2023-10-21  235  

:::::: The code at line 217 was first introduced by commit
:::::: e84db124cb2158b538820f31f641c28b86fb3ca3 ASoC: amd: acp: Add pci legacy driver support for acp7.0 platform

:::::: TO: Syed Saba Kareem <Syed.SabaKareem@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
