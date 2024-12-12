Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6390E25949C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988958; cv=none; b=LI2kmnogaTcYAL9EcgCAMVD1PqOUDTPSkiBiu8OgfnRzoqvj3QoUTIKyL4rxMxv2j0O5kbXQlmXLmA23Iz75H9IYnTWhOJwOTfcmgpEs5uBLyD/IhPOgR+lbfvMuV4Ob6lPfgke69KfWZGutB68s0Pc4uHIsqIWAu0JGymZqgNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988958; c=relaxed/simple;
	bh=WmJ9UtztFSZsIQN1EPN0/FcYZ2lgC7Dft8nsvwcNZWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJ8nYLfFWx/U6ewn3wTidv951dnWGsVkrdaH88bkrr7VQjJD/nlrfuXKcX2vgppnLHN/ZSo1NzDuDLoCP+WDBVPmwNyTa2rAJEyw3Cuk01WVMnhwenvqhbGkee8qInycPEHU63gaLm+Q28HL2IIRwzAecD+cBDUvTgKVH4Yhla8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMTlfAjl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMTlfAjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733988956; x=1765524956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmJ9UtztFSZsIQN1EPN0/FcYZ2lgC7Dft8nsvwcNZWE=;
  b=TMTlfAjl7AaRqvGSGIV789YIW+xcyhVlu2hUhM+lCqrJ1W/GCjHzc/al
   V/XAPZc1pafLA9bi3QDwNtQ9wKwFtDsYK6Hrma14VTAlkcKQOyWqlD+Qt
   qQ+myerbyPF55ECec3vzLwHExMmKDgmhwa8CdrNdCsmQPBxa5puHhHfqK
   d8seH1dCIs/CbneI9T/X3irlP1cIyoK0QtRvEutl+gloyGWXqa3ZSxkTy
   atMAcL7FLRIfz0NVNp9ng+O+BS7ij1Fx+CsbFtcYH4AepLSiw9REeX//V
   kg7tQDUbODsO1zWSPYzNioChzXP0Nm3UVHBO6iwZPe5Mu2b5LM2+Nid9H
   g==;
X-CSE-ConnectionGUID: ZnL3xJugR+ywRAxEtaVB0Q==
X-CSE-MsgGUID: wK9e8B8VS3qwGErYJ6WgQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45067760"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="45067760"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:35:56 -0800
X-CSE-ConnectionGUID: HGR5JkdFSdGgN0qRKS9fJQ==
X-CSE-MsgGUID: Gi7R7XKyTEWhT66qYQRWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127138714"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 23:35:54 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLdjj-0007aA-0J;
	Thu, 12 Dec 2024 07:35:51 +0000
Date: Thu, 12 Dec 2024 15:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we
 previously assumed 'stream' could be null (see line 218)
Message-ID: <202412121543.kK53XEct-lkp@intel.com>
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
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: d3534684ada99ef8c0899eb28c62b4462483ee19 ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
date:   1 year, 1 month ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241212/202412121543.kK53XEct-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121543.kK53XEct-lkp@intel.com/

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
