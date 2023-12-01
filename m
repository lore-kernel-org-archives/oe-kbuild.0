Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5691F619
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLp3Mm4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701424714; x=1732960714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4u7jb1b77q7f3rv0Pajne/No85tZ+NpeJR+2m4i58Y=;
  b=DLp3Mm4kwdN1XAtmcjOvEg5caMI/VvuYz1sjP4WrjOAdnAx60++EjcEp
   Y7gedr8XwruCqesl0cf/kpg/aJrhwsdDzQK9xZVFHypjVfGaSselk0YaY
   ozXbia/WSp2/DikgZEB8v7TrS0qWbu72/Rj5AIMxqfyMwUvs+jOVP+z94
   jT2yr/9tCzTJolX8YmDl68ItwQ+hvGqWRG/sbfzbFSsoh0D+KjZyRVuhf
   P3ZsR0e00d2g2ZhQ0+aMfCWzjABw975qm1IzWUtSpUJseTWs5qf0l8Z1L
   O+cCCAjCleSgHDcNFMz5ElGuqEEscr90UA04TIHQvty7hEQkuARZZ9QTZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393212832"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="393212832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 01:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860511971"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="860511971"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2023 01:58:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r90I1-0003Sk-2j;
	Fri, 01 Dec 2023 09:58:29 +0000
Date: Fri, 1 Dec 2023 17:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 845/4419] sound/soc/amd/acp/acp70.c:217
 acp70_pcm_resume() error: we previously assumed 'stream' could be null (see
 line 218)
Message-ID: <202312011742.1Grdg1Pl-lkp@intel.com>
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
TO: Syed Saba Kareem <Syed.SabaKareem@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5eda217cee887e595ba2265435862d585d399769
commit: d3534684ada99ef8c0899eb28c62b4462483ee19 [845/4419] ASoC: amd: acp: add Kconfig options for acp7.0 based platform driver
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20231130 (https://download.01.org/0day-ci/archive/20231201/202312011742.1Grdg1Pl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011742.1Grdg1Pl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312011742.1Grdg1Pl-lkp@intel.com/

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
