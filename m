Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75637605CD
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712799784; cv=none; b=Ln98NSj190DmStuPWxE7Ax7QVfnPmpOZJ3VMF5lhOCqW2jGnQJIu9E3CkQewiGTXIycmHgOrKv0XXvT9NPKxQCP11cGNvX5aKOUIiGIXHaDWY4FvqFENaRolyHUd8hsH7OCLqXbgxI8qe2PMolVAojVUU9+AriV/iUd9mEzjQqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712799784; c=relaxed/simple;
	bh=5tXSpdnaiqihpQK7nIL3di6Aq/8dcTd3C8WknvSzquM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQSy7Kdm3Ua191aC6zOEBArdgnXoJhfDU877RP4gnYU9nnprhyJVyTWASFuSOkFglV0mZhBHqEzhQNajeEseDld7rP9Zh7ErKbG8K/q6xHHF4chkjJf3C1qb/XNy1Bmw761cKC73lZJETPx82lM3NjslsBajOxTqSQhCVKT7i+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZR5yiA2e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZR5yiA2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712799782; x=1744335782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5tXSpdnaiqihpQK7nIL3di6Aq/8dcTd3C8WknvSzquM=;
  b=ZR5yiA2eEQMdEAe4nfNFhVGe/iiXYwvT/XM5RtLY4sc/rtcwpm/fiwxm
   8z3Dub3T1CgjA55d5KAKcXdGEltilGdsYzBlkbs3WKk7WyfTXxCNugG3G
   JzrjXGtDjl+lCAKU/HBuTYdtDxUa+EbieJOopJJpc4DnwR3MOJHUNkj6d
   pl+s8wWeUG6noVPl7pt6Nqs1A4vW1cz9DLOvCN7MQTC75xp49GsD00zj9
   5i+2KraN8i1+AXLbvim7GoRJ7k6nujqtt92PpHP8ard3MJWzjmKFvDum2
   FX5sx46bEoQAPR3/O1SZzFzqRlTcEs4QA53Rrie2WKwhJE4BRKytfV1DZ
   Q==;
X-CSE-ConnectionGUID: b6IG6mCUTEmQBXneoAOrXw==
X-CSE-MsgGUID: xVVooAp2SH2m/CKb2V2qfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11972393"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="11972393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 18:43:02 -0700
X-CSE-ConnectionGUID: 0fozFlQRRgKZZpaKraoDrQ==
X-CSE-MsgGUID: n0xoM7/oSliYHwhjKmveaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25405141"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2024 18:43:00 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rujSr-00085u-34;
	Thu, 11 Apr 2024 01:42:57 +0000
Date: Thu, 11 Apr 2024 09:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3454/5042] drivers/dma/fsl-edma-main.c:133
 fsl_edma_xlate() warn: inconsistent returns '&fsl_edma->fsl_edma_mutex'.
Message-ID: <202404110915.riwV3ZAC-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
commit: 6aa60f79e6794bbbc571ea4e0501b9fcc26026e2 [3454/5042] dmaengine: fsl-edma: add safety check for 'srcid'
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110915.riwV3ZAC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404110915.riwV3ZAC-lkp@intel.com/

smatch warnings:
drivers/dma/fsl-edma-main.c:133 fsl_edma_xlate() warn: inconsistent returns '&fsl_edma->fsl_edma_mutex'.

vim +133 drivers/dma/fsl-edma-main.c

d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   95  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   96  static struct dma_chan *fsl_edma_xlate(struct of_phandle_args *dma_spec,
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   97  		struct of_dma *ofdma)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   98  {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   99  	struct fsl_edma_engine *fsl_edma = ofdma->of_dma_data;
178c81e58e9155 drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-21  100  	struct dma_chan *chan, *_chan;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao     2015-10-30  101  	struct fsl_edma_chan *fsl_chan;
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong   2019-06-25  102  	u32 dmamux_nr = fsl_edma->drvdata->dmamuxs;
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong   2019-06-25  103  	unsigned long chans_per_mux = fsl_edma->n_chans / dmamux_nr;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  104  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  105  	if (dma_spec->args_count != 2)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  106  		return NULL;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  107  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  108  	mutex_lock(&fsl_edma->fsl_edma_mutex);
178c81e58e9155 drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-21  109  	list_for_each_entry_safe(chan, _chan, &fsl_edma->dma_dev.channels, device_node) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  110  		if (chan->client_count)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  111  			continue;
211bfef7c2bc8c drivers/dma/fsl-edma.c      Jingchang Lu 2014-07-01  112  		if ((chan->chan_id / chans_per_mux) == dma_spec->args[0]) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  113  			chan = dma_get_slave_channel(chan);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  114  			if (chan) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  115  				chan->device->privatecnt++;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao     2015-10-30  116  				fsl_chan = to_fsl_edma_chan(chan);
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  117  				fsl_chan->srcid = dma_spec->args[1];
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  118  
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  119  				if (!fsl_chan->srcid) {
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  120  					dev_err(&fsl_chan->pdev->dev, "Invalidate srcid %d\n",
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  121  						fsl_chan->srcid);
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  122  					return NULL;
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  123  				}
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  124  
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  125  				fsl_edma_chan_mux(fsl_chan, fsl_chan->srcid,
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao     2015-10-30  126  						true);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  127  				mutex_unlock(&fsl_edma->fsl_edma_mutex);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  128  				return chan;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  129  			}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  130  		}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  131  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  132  	mutex_unlock(&fsl_edma->fsl_edma_mutex);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18 @133  	return NULL;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  134  }
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  135  

:::::: The code at line 133 was first introduced by commit
:::::: d6be34fbd39b7d577d25cb4edec538e8990ba07c dma: Add Freescale eDMA engine driver support

:::::: TO: Jingchang Lu <b35083@freescale.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
