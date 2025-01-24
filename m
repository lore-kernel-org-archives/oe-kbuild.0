Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA51BFE10
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jan 2025 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737752554; cv=none; b=kSpYEEM2xEokjXZ4qP1+Ps0R/f4942U5vVgXdf0iPPGjTPRpVTrW+1HA9q3GeipT5cuYAaVaHd+9qyTAReZmXdRiTZbFLMut34W8rHT39gmuDcYJ3ezMNVeH89krwrGp/SeSofx64fdZn8blxMRDQGt6ChfN7+ZXGbeiTeMhPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737752554; c=relaxed/simple;
	bh=vpISCG2oo/eHDT2QHEmmF/lqH1izecJnwXVZIKdIQPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DALdiLQCdAe80rtXLIwwym7S8xCNmJ0MZisFbO04Nugu5reWqu2pgykn3tSMKTREUB2aS7KXslRe0d8G6KscafRRPZ+EDXFAi8GZwKQP3K/hWZQA2NxueAkzijFDKM3QlDhcn+87XI0z0q5UVtCe47XDFnxyTnho/E0S3obUJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsHkPaAi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsHkPaAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737752553; x=1769288553;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vpISCG2oo/eHDT2QHEmmF/lqH1izecJnwXVZIKdIQPc=;
  b=EsHkPaAijNnqoUeQZWPX6mbgCfxR1pp+cY27VateJMA1Q+f6diVbyA0o
   1u4XgA6mhreBgJ6LJwOFd1yYhtjvr/axiz0uc81nNU9hI4DrXU9Dlv8kr
   g2Rwkuf1v1c4Ojx3Bwr2ZmLOgOwxVcG26QxUBTwX3+swrdh/V516iVosE
   A7sXS6aOOvCRHF0M7m+ThBd9xIcBIYF8q21LvZKwYjm3KDrPJM4VJEVQ2
   SCVINFVCsQpbKbe+0ZKBnaz+mkB0edYSJtkY8AjMa/l547ZhJD+PQg3F6
   KT1b9odz7HpI2tBpD0t9Bb4rbcBa/JQTHqPbb/jcbglQ50LdjabIZbJg9
   w==;
X-CSE-ConnectionGUID: ZWakzY2mQu+NjsAiz7VRsg==
X-CSE-MsgGUID: X8jy72UsQ2u8kA1YXC0Q/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38188374"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="38188374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 13:02:32 -0800
X-CSE-ConnectionGUID: Sv7MnFw4T0+ht/gMPqB/FQ==
X-CSE-MsgGUID: bXobwTQTQZW/NzrlQovs8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131179319"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2025 13:02:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbQou-000d8Z-1b;
	Fri, 24 Jan 2025 21:02:28 +0000
Date: Sat, 25 Jan 2025 05:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev-rebase 34/85]
 drivers/soundwire/intel_ace2x.c:186:12-19: opportunity for
 str_read_write(command)
Message-ID: <202501250510.tFc9eokx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: Liam Girdwood <liam.r.girdwood@intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   2e09d56be08c62cbb867b31dde1c229826048e22
commit: 913ef5fb4b82165eeefbe4f923a5fef1e2f89b93 [34/85] soundwire: intel_ace2x: add BPT send_async/wait callbacks
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r062-20250125 (https://download.01.org/0day-ci/archive/20250125/202501250510.tFc9eokx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501250510.tFc9eokx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/intel_ace2x.c:186:12-19: opportunity for str_read_write(command)

vim +186 drivers/soundwire/intel_ace2x.c

913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   45  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   46  static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *slave,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   47  				       struct sdw_bpt_msg *msg)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   48  {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   49  	struct sdw_cdns *cdns = &sdw->cdns;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   50  	struct sdw_bus *bus = &cdns->bus;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   51  	struct sdw_master_prop *prop = &bus->prop;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   52  	struct sdw_stream_runtime *stream;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   53  	struct sdw_stream_config sconfig;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   54  	struct sdw_port_config *pconfig;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   55  	unsigned int pdi0_buffer_size;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   56  	unsigned int tx_dma_bandwidth;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   57  	unsigned int pdi1_buffer_size;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   58  	unsigned int rx_dma_bandwidth;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   59  	unsigned int data_per_frame;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   60  	unsigned int tx_total_bytes;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   61  	struct sdw_cdns_pdi *pdi0;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   62  	struct sdw_cdns_pdi *pdi1;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   63  	unsigned int num_frames;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   64  	int command;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   65  	int ret1;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   66  	int ret;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   67  	int dir;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   68  	int i;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   69  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   70  	stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   71  	if (!stream)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   72  		return -ENOMEM;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   73  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   74  	cdns->bus.bpt_stream = stream;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   75  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   76  	ret = sdw_slave_bpt_stream_add(slave, stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   77  	if (ret < 0)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   78  		goto release_stream;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   79  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   80  	/* handle PDI0 first */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   81  	dir = SDW_DATA_DIR_TX;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   82  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   83  	pdi0 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, 1,  dir, 0);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   84  	if (!pdi0) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   85  		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   86  		ret = -EINVAL;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   87  		goto remove_slave;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   88  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   89  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   90  	sdw_cdns_config_stream(cdns, 1, dir, pdi0);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   91  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   92  	/* handle PDI1  */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   93  	dir = SDW_DATA_DIR_RX;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   94  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   95  	pdi1 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, 1,  dir, 1);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   96  	if (!pdi1) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   97  		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   98  		ret = -EINVAL;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01   99  		goto remove_slave;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  100  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  101  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  102  	sdw_cdns_config_stream(cdns, 1, dir, pdi1);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  103  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  104  	/*
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  105  	 * the port config direction, number of channels and frame
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  106  	 * rate is totally arbitrary
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  107  	 */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  108  	sconfig.direction = dir;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  109  	sconfig.ch_count = 1;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  110  	sconfig.frame_rate = 16000;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  111  	sconfig.type = SDW_STREAM_BPT;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  112  	sconfig.bps = 32; /* this is required for BPT/BRA */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  113  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  114  	/* Port configuration */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  115  	pconfig = kcalloc(2, sizeof(*pconfig), GFP_KERNEL);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  116  	if (!pconfig) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  117  		ret =  -ENOMEM;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  118  		goto remove_slave;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  119  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  120  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  121  	for (i = 0; i < 2 /* num_pdi */; i++) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  122  		pconfig[i].num = i;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  123  		pconfig[i].ch_mask = 1;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  124  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  125  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  126  	ret = sdw_stream_add_master(&cdns->bus, &sconfig, pconfig, 2, stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  127  	kfree(pconfig);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  128  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  129  	if (ret < 0) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  130  		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  131  		goto remove_slave;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  132  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  133  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  134  	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  135  	if (ret < 0)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  136  		goto remove_master;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  137  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  138  	command = (msg->flags & SDW_MSG_FLAG_WRITE) ? 0 : 1;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  139  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  140  	ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row, cdns->bus.params.col,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  141  					     msg->len, SDW_BPT_MSG_MAX_BYTES, &data_per_frame,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  142  					     &pdi0_buffer_size, &pdi1_buffer_size, &num_frames);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  143  	if (ret < 0)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  144  		goto deprepare_stream;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  145  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  146  	sdw->bpt_ctx.pdi0_buffer_size = pdi0_buffer_size;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  147  	sdw->bpt_ctx.pdi1_buffer_size = pdi1_buffer_size;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  148  	sdw->bpt_ctx.num_frames = num_frames;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  149  	sdw->bpt_ctx.data_per_frame = data_per_frame;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  150  	tx_dma_bandwidth = div_u64((u64)pdi0_buffer_size * 8 * (u64)prop->default_frame_rate,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  151  				   num_frames);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  152  	rx_dma_bandwidth = div_u64((u64)pdi1_buffer_size * 8 * (u64)prop->default_frame_rate,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  153  				   num_frames);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  154  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  155  	dev_dbg(cdns->dev, "Message len %d transferred in %d frames (%d per frame)\n",
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  156  		msg->len, num_frames, data_per_frame);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  157  	dev_dbg(cdns->dev, "sizes pdi0 %d pdi1 %d tx_bandwidth %d rx_bandwidth %d\n",
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  158  		pdi0_buffer_size, pdi1_buffer_size, tx_dma_bandwidth, rx_dma_bandwidth);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  159  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  160  	ret = hda_sdw_bpt_open(cdns->dev->parent, /* PCI device */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  161  			       sdw->instance, &sdw->bpt_ctx.bpt_tx_stream,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  162  			       &sdw->bpt_ctx.dmab_tx_bdl, pdi0_buffer_size, tx_dma_bandwidth,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  163  			       &sdw->bpt_ctx.bpt_rx_stream, &sdw->bpt_ctx.dmab_rx_bdl,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  164  			       pdi1_buffer_size, rx_dma_bandwidth);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  165  	if (ret < 0) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  166  		dev_err(cdns->dev, "%s: hda_sdw_bpt_open failed %d\n", __func__, ret);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  167  		goto deprepare_stream;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  168  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  169  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  170  	if (!command) {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  171  		ret = sdw_cdns_prepare_write_dma_buffer(msg->dev_num, msg->addr, msg->buf,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  172  							msg->len, data_per_frame,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  173  							sdw->bpt_ctx.dmab_tx_bdl.area,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  174  							pdi0_buffer_size, &tx_total_bytes);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  175  	} else {
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  176  		ret = sdw_cdns_prepare_read_dma_buffer(msg->dev_num, msg->addr,	msg->len,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  177  						       data_per_frame,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  178  						       sdw->bpt_ctx.dmab_tx_bdl.area,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  179  						       pdi0_buffer_size, &tx_total_bytes);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  180  	}
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  181  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  182  	if (!ret)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  183  		return 0;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  184  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  185  	dev_err(cdns->dev, "%s: sdw_prepare_%s_dma_buffer failed %d\n",
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01 @186  		__func__, command ? "read" : "write", ret);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  187  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  188  	ret1 = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  189  				 sdw->bpt_ctx.bpt_tx_stream, &sdw->bpt_ctx.dmab_tx_bdl,
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  190  				 sdw->bpt_ctx.bpt_rx_stream, &sdw->bpt_ctx.dmab_rx_bdl);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  191  	if (ret1 < 0)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  192  		dev_err(cdns->dev, "%s:  hda_sdw_bpt_close failed: ret %d\n",
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  193  			__func__, ret1);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  194  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  195  deprepare_stream:
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  196  	sdw_deprepare_stream(cdns->bus.bpt_stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  197  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  198  remove_master:
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  199  	ret1 = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  200  	if (ret1 < 0)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  201  		dev_err(cdns->dev, "%s: remove master failed: %d\n",
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  202  			__func__, ret1);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  203  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  204  remove_slave:
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  205  	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  206  	if (ret1 < 0)
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  207  		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  208  			__func__, ret1);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  209  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  210  release_stream:
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  211  	sdw_release_stream(cdns->bus.bpt_stream);
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  212  	cdns->bus.bpt_stream = NULL;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  213  
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  214  	return ret;
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  215  }
913ef5fb4b8216 Pierre-Louis Bossart 2023-11-01  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
