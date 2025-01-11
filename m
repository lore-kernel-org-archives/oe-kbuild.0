Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8451A4F1F
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736599626; cv=none; b=jTeKZhh0duJO6w1fKT39haEDcpGVUPRkte/G6JveM11MIf7t4morgwntxKIeEGgUys9QibuwkRe48mWRncHGc37fKJAPjQfFHLC2jmTfyFdTrP/XLoKEcWjMtP7vFedrynS0Bb3R59gipcKRh+VCdLuwuFAIaryLkm6avhKa8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736599626; c=relaxed/simple;
	bh=mOJOmZE2cVzCEg4Slo1n8iuF/gZj7NRldUeH8/sjjqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYM1Maff91Uqie/6jy3i0CPTIi3ZY41nc57oCqD6pg1f2m4R4y/CY5aeaMO5+c86tj7IuxqJATgZoJPQmq5UYGf8+PoUBTdM5S1dyk2wQ5qgfhQVl9RndLzgcP2YiVm69XTw24GzZyurJ3TsoU2JFuf+vltcsDSfcwFpKAoad+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3oAyfpW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3oAyfpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736599624; x=1768135624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOJOmZE2cVzCEg4Slo1n8iuF/gZj7NRldUeH8/sjjqo=;
  b=g3oAyfpWRK0E+bEVx2PFboNWp/d//6mam7DLfEgDCViGEbtS+lF2TgHN
   Vy4TmB1PvqXZuL5/oh05dMOJ74PeVvLAWteihLO4850lGMu8Ungho8XkM
   2W1YHiPJ1w3U5koRufjh3eQ5HRGFjER71YnXMo2K19Kihi84JE3dkjRf+
   UfRMITI5u6o6ugfUi6coEarkUjPzJTSMJYkkds9YN/EAK8QuyHFunFdZ3
   lsAQrZdSfkQSlmEad8pB2WEvSrSckcxIwl1y66eBm5FPdRPAnYiZtZ0eC
   RfLjXSPPEqLZ0HHlyonPGrij445KS+ANTMmW79L3ZSHFFL/S/aAHuTihs
   g==;
X-CSE-ConnectionGUID: 3hQj2y5FRrKsVDPBAXcd/Q==
X-CSE-MsgGUID: goo0fQFDSj6Rr2oKbEM4ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47460250"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47460250"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 04:47:01 -0800
X-CSE-ConnectionGUID: QxqEZAr+SVSpA8rnDQUlnQ==
X-CSE-MsgGUID: pBi//kNXTMGJnLyo9bD0sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104501268"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 04:46:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWatE-000KeR-1t;
	Sat, 11 Jan 2025 12:46:56 +0000
Date: Sat, 11 Jan 2025 20:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 151/504]
 drivers/dma/xilinx/xilinx_frmbuf.c:705:8-16: ERROR: invalid reference to the
 index variable of the iterator on line 691
Message-ID: <202501112046.Fut4HUxk-lkp@intel.com>
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
CC: git@amd.com
TO: Jeffrey Mouroux <jeff.mouroux@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Pandey <radheys@xilinx.com>
CC: John Nichols <jnichol@xilinx.com>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 7e04381bba1916a6d45fe5ce54cd322853190ce6 [151/504] dmaengine: xilinx_frmbuf: New driver for Video Framebuffer IP
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: microblaze-randconfig-r054-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112046.Fut4HUxk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501112046.Fut4HUxk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/xilinx/xilinx_frmbuf.c:705:8-16: ERROR: invalid reference to the index variable of the iterator on line 691

vim +705 drivers/dma/xilinx/xilinx_frmbuf.c

7e04381bba1916 Jeffrey Mouroux 2017-07-13  684  
7e04381bba1916 Jeffrey Mouroux 2017-07-13  685  static struct xilinx_frmbuf_chan *frmbuf_find_chan(struct dma_chan *chan)
7e04381bba1916 Jeffrey Mouroux 2017-07-13  686  {
7e04381bba1916 Jeffrey Mouroux 2017-07-13  687  	struct xilinx_frmbuf_chan *xil_chan;
7e04381bba1916 Jeffrey Mouroux 2017-07-13  688  	bool found_xchan = false;
7e04381bba1916 Jeffrey Mouroux 2017-07-13  689  
7e04381bba1916 Jeffrey Mouroux 2017-07-13  690  	mutex_lock(&frmbuf_chan_list_lock);
7e04381bba1916 Jeffrey Mouroux 2017-07-13 @691  	list_for_each_entry(xil_chan, &frmbuf_chan_list, chan_node) {
7e04381bba1916 Jeffrey Mouroux 2017-07-13  692  		if (chan == &xil_chan->common) {
7e04381bba1916 Jeffrey Mouroux 2017-07-13  693  			found_xchan = true;
7e04381bba1916 Jeffrey Mouroux 2017-07-13  694  			break;
7e04381bba1916 Jeffrey Mouroux 2017-07-13  695  		}
7e04381bba1916 Jeffrey Mouroux 2017-07-13  696  	}
7e04381bba1916 Jeffrey Mouroux 2017-07-13  697  	mutex_unlock(&frmbuf_chan_list_lock);
7e04381bba1916 Jeffrey Mouroux 2017-07-13  698  
7e04381bba1916 Jeffrey Mouroux 2017-07-13  699  	if (!found_xchan) {
7e04381bba1916 Jeffrey Mouroux 2017-07-13  700  		dev_dbg(chan->device->dev,
7e04381bba1916 Jeffrey Mouroux 2017-07-13  701  			"dma chan not a Video Framebuffer channel instance\n");
7e04381bba1916 Jeffrey Mouroux 2017-07-13  702  		return ERR_PTR(-EINVAL);
7e04381bba1916 Jeffrey Mouroux 2017-07-13  703  	}
7e04381bba1916 Jeffrey Mouroux 2017-07-13  704  
7e04381bba1916 Jeffrey Mouroux 2017-07-13 @705  	return xil_chan;
7e04381bba1916 Jeffrey Mouroux 2017-07-13  706  }
7e04381bba1916 Jeffrey Mouroux 2017-07-13  707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
