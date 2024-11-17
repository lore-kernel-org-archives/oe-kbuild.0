Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB51161
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731826990; cv=none; b=WLwueJ+qHIUHJOozXm09Oj54meJvFlwgSFTw96IjxzIcOJhJzp6V8gGgH6pVUa36RsEGBQOhKVJdKLFqujKpMSigWSZpS1EICtmgrRJn6uxOuZ246qXB18j7VK7GHGMZGpa6CyU8X30bvCnggWacw1TlI3UJ8hq0qQMlXQEa0N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731826990; c=relaxed/simple;
	bh=MfXPOBF0IOqdik+zO1dTRm/DGNXj+gtEibKwJrz3dRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h86N2GbqxVm2eCNevgdpQvCRTZO0sAF28cstI7PfN1tSyM+j9rZ3lIHL/21nSfAkn6FwP5Pep/5q6EwSWwuqI8OoezSmKtnQi46Zfi1lU1zBrzKnsqTngrrCV7bL6bkCsT63WT5RoeM4zaf9QiQF7bn8cHofNdPR83N/VX93VnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqlI5gVN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqlI5gVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731826988; x=1763362988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfXPOBF0IOqdik+zO1dTRm/DGNXj+gtEibKwJrz3dRw=;
  b=fqlI5gVNBl/bySVrH3wmCgdfCbtJJORzdPYZPv75u6KEuzytSmm7OAsE
   dmThTX75Lh1/fN0mIAcrYlLPP+hZMz9/nT6JF6KLvfL8QHLBD1lSi7CLx
   om/0OTxPa5hfyPoQT3mTEK5MGUCfuUuik06PzVIvto89vWKmjbdJpM7Y/
   4T316si/jRqY9+YVuCnJlUOmOyBjKvPsw7ldTiFRolY4YofVuD15+ba4z
   KJ9yF5RjcjTjrU5ASyfLrP7eUjwV/RdRMLseDAu8P1SqRaDFUw6zDg0DA
   cbO8gxZ25P06Q8Rca6wF5ow+5SQzgnHFVvAoiG0k6G5MkjgqowWtXdKiD
   A==;
X-CSE-ConnectionGUID: qJ5mxJhWRDaHJAfz7+rTqA==
X-CSE-MsgGUID: nDLhQfkCTdOfdENZaULDYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31637973"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31637973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 23:03:07 -0800
X-CSE-ConnectionGUID: wghQDCR5QkaKBNj5RsWL1Q==
X-CSE-MsgGUID: RtMDsOClSwyYwFQ+ifW8jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="112220359"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2024 23:03:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCZJH-0001cE-1L;
	Sun, 17 Nov 2024 07:03:03 +0000
Date: Sun, 17 Nov 2024 15:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we
 previously assumed 'stream' could be null (see line 218)
Message-ID: <202411171413.RwH20B3k-lkp@intel.com>
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
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: d3534684ada99ef8c0899eb28c62b4462483ee19 ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
date:   1 year ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241117/202411171413.RwH20B3k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411171413.RwH20B3k-lkp@intel.com/

smatch warnings:
sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we previously assumed 'stream' could be null (see line 218)

vim +/stream +217 sound/soc/amd/acp/acp70.c

e84db124cb2158 Syed Saba Kareem 2023-10-21  207  
e84db124cb2158 Syed Saba Kareem 2023-10-21  208  static int __maybe_unused acp70_pcm_resume(struct device *dev)
e84db124cb2158 Syed Saba Kareem 2023-10-21  209  {
e84db124cb2158 Syed Saba Kareem 2023-10-21  210  	struct acp_dev_data *adata = dev_get_drvdata(dev);
e84db124cb2158 Syed Saba Kareem 2023-10-21  211  	struct acp_stream *stream;
e84db124cb2158 Syed Saba Kareem 2023-10-21  212  	struct snd_pcm_substream *substream;
e84db124cb2158 Syed Saba Kareem 2023-10-21  213  	snd_pcm_uframes_t buf_in_frames;
e84db124cb2158 Syed Saba Kareem 2023-10-21  214  	u64 buf_size;
e84db124cb2158 Syed Saba Kareem 2023-10-21  215  
e84db124cb2158 Syed Saba Kareem 2023-10-21  216  	spin_lock(&adata->acp_lock);
e84db124cb2158 Syed Saba Kareem 2023-10-21 @217  	list_for_each_entry(stream, &adata->stream_list, list) {
e84db124cb2158 Syed Saba Kareem 2023-10-21 @218  		if (stream) {
e84db124cb2158 Syed Saba Kareem 2023-10-21  219  			substream = stream->substream;
e84db124cb2158 Syed Saba Kareem 2023-10-21  220  			if (substream && substream->runtime) {
e84db124cb2158 Syed Saba Kareem 2023-10-21  221  				buf_in_frames = (substream->runtime->buffer_size);
e84db124cb2158 Syed Saba Kareem 2023-10-21  222  				buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
e84db124cb2158 Syed Saba Kareem 2023-10-21  223  				config_pte_for_stream(adata, stream);
e84db124cb2158 Syed Saba Kareem 2023-10-21  224  				config_acp_dma(adata, stream, buf_size);
e84db124cb2158 Syed Saba Kareem 2023-10-21  225  				if (stream->dai_id)
e84db124cb2158 Syed Saba Kareem 2023-10-21  226  					restore_acp_i2s_params(substream, adata, stream);
e84db124cb2158 Syed Saba Kareem 2023-10-21  227  				else
e84db124cb2158 Syed Saba Kareem 2023-10-21  228  					restore_acp_pdm_params(substream, adata);
e84db124cb2158 Syed Saba Kareem 2023-10-21  229  			}
e84db124cb2158 Syed Saba Kareem 2023-10-21  230  		}
e84db124cb2158 Syed Saba Kareem 2023-10-21  231  	}
e84db124cb2158 Syed Saba Kareem 2023-10-21  232  	spin_unlock(&adata->acp_lock);
e84db124cb2158 Syed Saba Kareem 2023-10-21  233  	return 0;
e84db124cb2158 Syed Saba Kareem 2023-10-21  234  }
e84db124cb2158 Syed Saba Kareem 2023-10-21  235  

:::::: The code at line 217 was first introduced by commit
:::::: e84db124cb2158b538820f31f641c28b86fb3ca3 ASoC: amd: acp: Add pci legacy driver support for acp7.0 platform

:::::: TO: Syed Saba Kareem <Syed.SabaKareem@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
