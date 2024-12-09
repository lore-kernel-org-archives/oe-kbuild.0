Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03318CC15
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719483; cv=none; b=UgRLlPSDyTH7WJd/E2SIFPMS38uw89x7jTzCHnAfU/NkWlAkOND8jb1HWM+0FgxPM0PseunKivSorFshnsmV8S96AKTPf8qPaXz52VRbQETLHS1IOTDmDq7DlpkKluNJ1Gm4AqcFSXeNeY9bD0y4FYiyxRQXFyWO8puTW1U7RBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719483; c=relaxed/simple;
	bh=BnEfKSgP98biGOij89DMHCsKKo7uDehtiUP9Zd7PbrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/aJxCuIXxkZwkpL1Kq1GjIzcaOdX1OjAh8Rur2+Zp15pdtR4h8zoXJJaljQc/8Y4f7l6wRrC4P1YAGivkDbN2/e+GjLxnpYkVO0parNxWLIA4Dn3bHc/HrU/chOmBPYCl6xmSnZldt+YG3pyPkuXjEvc+CgnOxuKBuhf/X06Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1byXhpS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1byXhpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719483; x=1765255483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BnEfKSgP98biGOij89DMHCsKKo7uDehtiUP9Zd7PbrE=;
  b=g1byXhpSToXQr6RMBJqrK8mAczRMV5HcdlK8RUog2WVF1C8xGZOKhvTo
   To5hBnJCgPWGwEuEApGUHOXm1eL4Z6fpzRPR64/JicPr3ECHAKOZHNBws
   KnNFozoZPaCPf+hvRwafq5B0d/7ouIwKbSBS2xhJBCX+TqJ6WmlkWW5Te
   PrZwA68cot6VUALfu0Rq5aZz027LvqGHwUG7nenbFXZIf4qmRwEQuKGFb
   /PS5ZmKeK5xhlrARy5xWEHqW12JzsGFn1nIpLzsgGoZy0wCMUxYmZLJvs
   /quIYW4QQ6csatfImZ6xS8rDRL0SKfeKwMI4T8RC7qyQuwJRRGYDS4YSX
   A==;
X-CSE-ConnectionGUID: GgGpDWEuTwiOIuM4BIAV8Q==
X-CSE-MsgGUID: KdY9MdLcRse4O/pK5xlmbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45015206"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45015206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:44:41 -0800
X-CSE-ConnectionGUID: oxdcZuphRjKLgyAkN9IEkA==
X-CSE-MsgGUID: SW7aP2CtQV6WwooYVLSchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94760109"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 20:44:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVdM-0003uP-1l;
	Mon, 09 Dec 2024 04:44:36 +0000
Date: Mon, 9 Dec 2024 12:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp70.c:217 acp70_pcm_resume() error: we
 previously assumed 'stream' could be null (see line 218)
Message-ID: <202412081508.YbgfomqS-lkp@intel.com>
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
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: d3534684ada99ef8c0899eb28c62b4462483ee19 ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241208/202412081508.YbgfomqS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412081508.YbgfomqS-lkp@intel.com/

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
