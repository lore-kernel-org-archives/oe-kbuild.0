Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E393D196
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Apr 2024 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712535069; cv=none; b=fHefBwLMPihhIu+RReOvRkt6y5X+cTe+dUTymrhP9g3i/a1NffBmjrcV0H2EJFtpAl4W8LHEWa9gbtfGjCPC6IDBns95v5pLiHPr2JEtZgUjHcip2N+d2ccQ8uA0TqjxcbXHi47H8cL4+aPuUY7YxYItPC4on7L9Px2OuadrJCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712535069; c=relaxed/simple;
	bh=yrA/wWIUfeOiyZNNe6E+p/idXxO7/iUdiBMGsy5TTWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1dCrmKhh8kWW6zkSzqZneQXGvmt5ISwZm1blx4SMvMciyJFKv557VZegNNlhpzWEtJaARjb8cv+0Cq6kQT40+OfZbtpatz3BlNIGUw55qNSRDjGyQiPk0tKdVL7p3epq6LePHs5vktLc/NTp09QAN5fUuuerF69rlQldnZfSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzNfxkEr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzNfxkEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712535065; x=1744071065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrA/wWIUfeOiyZNNe6E+p/idXxO7/iUdiBMGsy5TTWY=;
  b=ZzNfxkErpu03z5x8ADniqFkfQppR3+z0gdvrjXSJZP/98XbUMxHeqVby
   x2cJjkgBbQq5QcdgdxeLs7L1m8Ep06GLnutl0UG+Rw2JsvGsc9+MUqOvO
   jY++EV8dCnYwyX/7QbZWG6mdoD0depBaH9JRYYkAZK1aIbDULkl393l1C
   hfE851TrNd0Lc/FakaM9NzMsWar39/Gyurr869uahPKhAmpeWV4vDmAOn
   Ffwgchv+LIBIYGMXAtGIwWDRovv/Df139bmQs/fogBEXN8NdNqUP1M9rr
   FhwTNH11TjUHiyDNu6oelwuOmbZ2aBCaddOkLzJG1vtLJlbn0kYp2QsZ4
   A==;
X-CSE-ConnectionGUID: kUL5tZNtRcicv6NX/ycS4A==
X-CSE-MsgGUID: rB/R/AZdQtSGCbdUyuyF4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18518671"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="18518671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 17:10:38 -0700
X-CSE-ConnectionGUID: UVNVi2eQS9aXEEfV76Pc/Q==
X-CSE-MsgGUID: BS5jWVPsTW2T1VZgxwsrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="19797804"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2024 17:10:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtcap-0004gM-0Q;
	Mon, 08 Apr 2024 00:10:35 +0000
Date: Mon, 8 Apr 2024 08:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vkoul-dmaengine:next 17/24] drivers/dma/fsl-edma-main.c:122:5-11:
 preceding lock on line 108
Message-ID: <202404080713.hGqTANyg-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   4665be0e952f68306cc6fba2cce68b940a7ec78c
commit: 6aa60f79e6794bbbc571ea4e0501b9fcc26026e2 [17/24] dmaengine: fsl-edma: add safety check for 'srcid'
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-104-20240408 (https://download.01.org/0day-ci/archive/20240408/202404080713.hGqTANyg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404080713.hGqTANyg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-main.c:122:5-11: preceding lock on line 108

vim +122 drivers/dma/fsl-edma-main.c

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
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18 @108  	mutex_lock(&fsl_edma->fsl_edma_mutex);
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
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23 @122  					return NULL;
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
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  133  	return NULL;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  134  }
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
