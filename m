Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265E258EC3
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Nov 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890800; cv=none; b=JBe9Sj0HeKTg1UVgfEUgCjVKWiDCQt/OD1QNnKlaTTS1WS4jYbli5obL2jocvkbI4OMaPV2Ohqc2HubEmD4+PZWdcOUZsy7TNngICO1BhXipOYMWwpNyA8Y/qV/g052VhdnT2hIQsFFbyq9xuuSlSILUwR7dMGXX4JcllXb0YgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890800; c=relaxed/simple;
	bh=I3atPHL1W3J4SJWV1MWE/ElpM1euCjCWqNxXZJHFRaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVbRDYKvi6PJZva/QZLmKUw2rd2ZELC/iqt+auTakHKivMjheOXcIHvn+tbafSZQPj4Rtb7BX7TmdSs2JALMjMwKZb3+NUVTx04+GqqJ52U4bNR5u+MtXTOIscccTEJ0Vp+z5rxJyF1NvLwZw7swzaRx5J3MBEwm/8Uki3U2SE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IS2S8vmj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IS2S8vmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762890798; x=1794426798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3atPHL1W3J4SJWV1MWE/ElpM1euCjCWqNxXZJHFRaY=;
  b=IS2S8vmjEuNDxhB4/Z49XryGprynaw0SwsQf5yYyUUu/5SD6J5xx9a7G
   hOeTFiqL91TBIKXxn48xF+PMIDaxZOXDDIRGhf1BCq3Jy/NmMM6xAW0nd
   lOBZKIteFYp3IaY3V+98KkH6P5r2kfgWLwXjWcCfNRcmo9DSI1kHHOIgo
   svgNfgM/u+a3khZ4sLQdhPMR8KsvIeCZPEk19vmKabFV+eoYbS0dequVp
   nN+SqZ0gdJDj/PnJYMdvmr27uxKY8ewvbgf/a+kl1tpPBvXkLXbI0AJmg
   e4/DN9iQdYOqQ+ENEF3ggShA4UE/lF7/AL6WzwnyfCsFpI8JbQM8YAzST
   w==;
X-CSE-ConnectionGUID: qVep49I9Q5qcwC4QYlIOpg==
X-CSE-MsgGUID: THa+guoyQ7Ciqg5+CNL3jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76414165"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="76414165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:53:18 -0800
X-CSE-ConnectionGUID: vhBOVe1cT0O2t+EUUk8NBQ==
X-CSE-MsgGUID: pNm2v4LLRlen13qb8PJqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="226294796"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2025 11:53:16 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIuQT-0003XX-1O;
	Tue, 11 Nov 2025 19:53:13 +0000
Date: Wed, 12 Nov 2025 03:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thesofproject:topic/sof-dev 3/4]
 drivers/soundwire/intel_ace2x.c:185 intel_ace2x_bpt_open_stream() error:
 uninitialized symbol 'data_per_frame'.
Message-ID: <202511120351.oeGkrOKx-lkp@intel.com>
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
TO: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   45e07ee769a712799e2f92b1597747329fc01a99
commit: 26aa2dd9e71a6866940a3674c2ec0a650c0bf1f1 [3/4] soundwire: intel_ace2x: handle multi BPT sections
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20251111 (https://download.01.org/0day-ci/archive/20251112/202511120351.oeGkrOKx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511120351.oeGkrOKx-lkp@intel.com/

smatch warnings:
drivers/soundwire/intel_ace2x.c:185 intel_ace2x_bpt_open_stream() error: uninitialized symbol 'data_per_frame'.

vim +/data_per_frame +185 drivers/soundwire/intel_ace2x.c

57782be7d2cc37 Bard Liao            2025-08-13   48  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   49  static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *slave,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   50  				       struct sdw_bpt_msg *msg)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   51  {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   52  	struct sdw_cdns *cdns = &sdw->cdns;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   53  	struct sdw_bus *bus = &cdns->bus;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   54  	struct sdw_master_prop *prop = &bus->prop;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   55  	struct sdw_stream_runtime *stream;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   56  	struct sdw_stream_config sconfig;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   57  	struct sdw_port_config *pconfig;
57782be7d2cc37 Bard Liao            2025-08-13   58  	unsigned int pdi0_buf_size_pre_frame;
57782be7d2cc37 Bard Liao            2025-08-13   59  	unsigned int pdi1_buf_size_pre_frame;
26aa2dd9e71a68 Bard Liao            2025-10-07   60  	unsigned int pdi0_buffer_size_;
26aa2dd9e71a68 Bard Liao            2025-10-07   61  	unsigned int pdi1_buffer_size_;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   62  	unsigned int pdi0_buffer_size;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   63  	unsigned int tx_dma_bandwidth;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   64  	unsigned int pdi1_buffer_size;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   65  	unsigned int rx_dma_bandwidth;
57782be7d2cc37 Bard Liao            2025-08-13   66  	unsigned int fake_num_frames;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   67  	unsigned int data_per_frame;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   68  	unsigned int tx_total_bytes;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   69  	struct sdw_cdns_pdi *pdi0;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   70  	struct sdw_cdns_pdi *pdi1;
57782be7d2cc37 Bard Liao            2025-08-13   71  	unsigned int rx_alignment;
57782be7d2cc37 Bard Liao            2025-08-13   72  	unsigned int tx_alignment;
26aa2dd9e71a68 Bard Liao            2025-10-07   73  	unsigned int num_frames_;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   74  	unsigned int num_frames;
57782be7d2cc37 Bard Liao            2025-08-13   75  	unsigned int fake_size;
57782be7d2cc37 Bard Liao            2025-08-13   76  	unsigned int tx_pad;
57782be7d2cc37 Bard Liao            2025-08-13   77  	unsigned int rx_pad;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   78  	int command;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   79  	int ret1;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   80  	int ret;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   81  	int dir;
26aa2dd9e71a68 Bard Liao            2025-10-07   82  	int len;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   83  	int i;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   84  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   85  	stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   86  	if (!stream)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   87  		return -ENOMEM;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   88  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   89  	cdns->bus.bpt_stream = stream;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   90  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   91  	ret = sdw_slave_bpt_stream_add(slave, stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   92  	if (ret < 0)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   93  		goto release_stream;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   94  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   95  	/* handle PDI0 first */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   96  	dir = SDW_DATA_DIR_TX;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   97  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   98  	pdi0 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, 1,  dir, 0);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27   99  	if (!pdi0) {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  100  		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  101  		ret = -EINVAL;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  102  		goto remove_slave;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  103  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  104  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  105  	sdw_cdns_config_stream(cdns, 1, dir, pdi0);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  106  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  107  	/* handle PDI1  */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  108  	dir = SDW_DATA_DIR_RX;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  109  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  110  	pdi1 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, 1,  dir, 1);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  111  	if (!pdi1) {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  112  		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  113  		ret = -EINVAL;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  114  		goto remove_slave;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  115  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  116  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  117  	sdw_cdns_config_stream(cdns, 1, dir, pdi1);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  118  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  119  	/*
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  120  	 * the port config direction, number of channels and frame
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  121  	 * rate is totally arbitrary
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  122  	 */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  123  	sconfig.direction = dir;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  124  	sconfig.ch_count = 1;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  125  	sconfig.frame_rate = 16000;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  126  	sconfig.type = SDW_STREAM_BPT;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  127  	sconfig.bps = 32; /* this is required for BPT/BRA */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  128  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  129  	/* Port configuration */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  130  	pconfig = kcalloc(2, sizeof(*pconfig), GFP_KERNEL);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  131  	if (!pconfig) {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  132  		ret =  -ENOMEM;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  133  		goto remove_slave;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  134  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  135  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  136  	for (i = 0; i < 2 /* num_pdi */; i++) {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  137  		pconfig[i].num = i;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  138  		pconfig[i].ch_mask = 1;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  139  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  140  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  141  	ret = sdw_stream_add_master(&cdns->bus, &sconfig, pconfig, 2, stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  142  	kfree(pconfig);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  143  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  144  	if (ret < 0) {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  145  		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  146  		goto remove_slave;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  147  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  148  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  149  	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  150  	if (ret < 0)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  151  		goto remove_master;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  152  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  153  	command = (msg->flags & SDW_MSG_FLAG_WRITE) ? 0 : 1;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  154  
57782be7d2cc37 Bard Liao            2025-08-13  155  	ret = sdw_cdns_bpt_find_bandwidth(command, cdns->bus.params.row,
57782be7d2cc37 Bard Liao            2025-08-13  156  					  cdns->bus.params.col,
57782be7d2cc37 Bard Liao            2025-08-13  157  					  prop->default_frame_rate,
57782be7d2cc37 Bard Liao            2025-08-13  158  					  &tx_dma_bandwidth, &rx_dma_bandwidth);
57782be7d2cc37 Bard Liao            2025-08-13  159  	if (ret < 0)
57782be7d2cc37 Bard Liao            2025-08-13  160  		goto deprepare_stream;
57782be7d2cc37 Bard Liao            2025-08-13  161  
26aa2dd9e71a68 Bard Liao            2025-10-07  162  	len = 0;
26aa2dd9e71a68 Bard Liao            2025-10-07  163  	pdi0_buffer_size = 0;
26aa2dd9e71a68 Bard Liao            2025-10-07  164  	pdi1_buffer_size = 0;
26aa2dd9e71a68 Bard Liao            2025-10-07  165  	num_frames = 0;
26aa2dd9e71a68 Bard Liao            2025-10-07  166  	/* Add up pdi buffer size and frame numbers of each BPT sections */
26aa2dd9e71a68 Bard Liao            2025-10-07  167  	for (i = 0; i < msg->sections; i++) {
26aa2dd9e71a68 Bard Liao            2025-10-07  168  		ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row,
26aa2dd9e71a68 Bard Liao            2025-10-07  169  						     cdns->bus.params.col,
26aa2dd9e71a68 Bard Liao            2025-10-07  170  						     msg->sec[i].len, SDW_BPT_MSG_MAX_BYTES,
26aa2dd9e71a68 Bard Liao            2025-10-07  171  						     &data_per_frame, &pdi0_buffer_size_,
26aa2dd9e71a68 Bard Liao            2025-10-07  172  						     &pdi1_buffer_size_, &num_frames_);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  173  		if (ret < 0)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  174  			goto deprepare_stream;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  175  
26aa2dd9e71a68 Bard Liao            2025-10-07  176  		len += msg->sec[i].len;
26aa2dd9e71a68 Bard Liao            2025-10-07  177  		pdi0_buffer_size += pdi0_buffer_size_;
26aa2dd9e71a68 Bard Liao            2025-10-07  178  		pdi1_buffer_size += pdi1_buffer_size_;
26aa2dd9e71a68 Bard Liao            2025-10-07  179  		num_frames += num_frames_;
26aa2dd9e71a68 Bard Liao            2025-10-07  180  	}
26aa2dd9e71a68 Bard Liao            2025-10-07  181  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  182  	sdw->bpt_ctx.pdi0_buffer_size = pdi0_buffer_size;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  183  	sdw->bpt_ctx.pdi1_buffer_size = pdi1_buffer_size;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  184  	sdw->bpt_ctx.num_frames = num_frames;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27 @185  	sdw->bpt_ctx.data_per_frame = data_per_frame;
57782be7d2cc37 Bard Liao            2025-08-13  186  
57782be7d2cc37 Bard Liao            2025-08-13  187  	rx_alignment = hda_sdw_bpt_get_buf_size_alignment(rx_dma_bandwidth);
57782be7d2cc37 Bard Liao            2025-08-13  188  	tx_alignment = hda_sdw_bpt_get_buf_size_alignment(tx_dma_bandwidth);
57782be7d2cc37 Bard Liao            2025-08-13  189  
57782be7d2cc37 Bard Liao            2025-08-13  190  	if (command) { /* read */
57782be7d2cc37 Bard Liao            2025-08-13  191  		/* Get buffer size of a full frame */
57782be7d2cc37 Bard Liao            2025-08-13  192  		ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row,
57782be7d2cc37 Bard Liao            2025-08-13  193  						     cdns->bus.params.col,
57782be7d2cc37 Bard Liao            2025-08-13  194  						     data_per_frame, SDW_BPT_MSG_MAX_BYTES,
57782be7d2cc37 Bard Liao            2025-08-13  195  						     &data_per_frame, &pdi0_buf_size_pre_frame,
57782be7d2cc37 Bard Liao            2025-08-13  196  						     &pdi1_buf_size_pre_frame, &fake_num_frames);
57782be7d2cc37 Bard Liao            2025-08-13  197  		if (ret < 0)
57782be7d2cc37 Bard Liao            2025-08-13  198  			goto deprepare_stream;
57782be7d2cc37 Bard Liao            2025-08-13  199  
57782be7d2cc37 Bard Liao            2025-08-13  200  		/* find fake pdi1 buffer size */
57782be7d2cc37 Bard Liao            2025-08-13  201  		rx_pad = rx_alignment - (pdi1_buffer_size % rx_alignment);
30fdccc9f26e31 Bard Liao            2025-10-13  202  		while (rx_pad <= READ_PDI1_MIN_SIZE)
57782be7d2cc37 Bard Liao            2025-08-13  203  			rx_pad += rx_alignment;
30fdccc9f26e31 Bard Liao            2025-10-13  204  
57782be7d2cc37 Bard Liao            2025-08-13  205  		pdi1_buffer_size += rx_pad;
57782be7d2cc37 Bard Liao            2025-08-13  206  		/* It is fine if we request more than enough byte to read */
57782be7d2cc37 Bard Liao            2025-08-13  207  		fake_num_frames = DIV_ROUND_UP(rx_pad, pdi1_buf_size_pre_frame);
57782be7d2cc37 Bard Liao            2025-08-13  208  		fake_size = fake_num_frames * data_per_frame;
57782be7d2cc37 Bard Liao            2025-08-13  209  
57782be7d2cc37 Bard Liao            2025-08-13  210  		/* find fake pdi0 buffer size */
57782be7d2cc37 Bard Liao            2025-08-13  211  		pdi0_buffer_size += (fake_num_frames * pdi0_buf_size_pre_frame);
57782be7d2cc37 Bard Liao            2025-08-13  212  		tx_pad = tx_alignment - (pdi0_buffer_size % tx_alignment);
57782be7d2cc37 Bard Liao            2025-08-13  213  		pdi0_buffer_size += tx_pad;
57782be7d2cc37 Bard Liao            2025-08-13  214  	} else { /* write */
57782be7d2cc37 Bard Liao            2025-08-13  215  		/*
57782be7d2cc37 Bard Liao            2025-08-13  216  		 * For the write command, the rx data block is 4, and the rx buffer size of a frame
30fdccc9f26e31 Bard Liao            2025-10-13  217  		 * is 8. So the rx buffer size (pdi0_buffer_size) is always a multiple of rx
57782be7d2cc37 Bard Liao            2025-08-13  218  		 * alignment.
57782be7d2cc37 Bard Liao            2025-08-13  219  		 */
57782be7d2cc37 Bard Liao            2025-08-13  220  		tx_pad = tx_alignment - (pdi0_buffer_size % tx_alignment);
57782be7d2cc37 Bard Liao            2025-08-13  221  		pdi0_buffer_size += tx_pad;
57782be7d2cc37 Bard Liao            2025-08-13  222  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  223  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  224  	dev_dbg(cdns->dev, "Message len %d transferred in %d frames (%d per frame)\n",
26aa2dd9e71a68 Bard Liao            2025-10-07  225  		len, num_frames, data_per_frame);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  226  	dev_dbg(cdns->dev, "sizes pdi0 %d pdi1 %d tx_bandwidth %d rx_bandwidth %d\n",
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  227  		pdi0_buffer_size, pdi1_buffer_size, tx_dma_bandwidth, rx_dma_bandwidth);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  228  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  229  	ret = hda_sdw_bpt_open(cdns->dev->parent, /* PCI device */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  230  			       sdw->instance, &sdw->bpt_ctx.bpt_tx_stream,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  231  			       &sdw->bpt_ctx.dmab_tx_bdl, pdi0_buffer_size, tx_dma_bandwidth,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  232  			       &sdw->bpt_ctx.bpt_rx_stream, &sdw->bpt_ctx.dmab_rx_bdl,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  233  			       pdi1_buffer_size, rx_dma_bandwidth);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  234  	if (ret < 0) {
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  235  		dev_err(cdns->dev, "%s: hda_sdw_bpt_open failed %d\n", __func__, ret);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  236  		goto deprepare_stream;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  237  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  238  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  239  	if (!command) {
26aa2dd9e71a68 Bard Liao            2025-10-07  240  		ret = sdw_cdns_prepare_write_dma_buffer(msg->dev_num, msg->sec, msg->sections,
f0989c9ef22d98 Bard Liao            2025-10-07  241  							data_per_frame,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  242  							sdw->bpt_ctx.dmab_tx_bdl.area,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  243  							pdi0_buffer_size, &tx_total_bytes);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  244  	} else {
26aa2dd9e71a68 Bard Liao            2025-10-07  245  		ret = sdw_cdns_prepare_read_dma_buffer(msg->dev_num, msg->sec, msg->sections,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  246  						       data_per_frame,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  247  						       sdw->bpt_ctx.dmab_tx_bdl.area,
30fdccc9f26e31 Bard Liao            2025-10-13  248  						       pdi0_buffer_size, &tx_total_bytes,
30fdccc9f26e31 Bard Liao            2025-10-13  249  						       fake_size);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  250  	}
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  251  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  252  	if (!ret)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  253  		return 0;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  254  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  255  	dev_err(cdns->dev, "%s: sdw_prepare_%s_dma_buffer failed %d\n",
fdf5596103455c Yumeng Fang          2025-05-23  256  		__func__, str_read_write(command), ret);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  257  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  258  	ret1 = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  259  				 sdw->bpt_ctx.bpt_tx_stream, &sdw->bpt_ctx.dmab_tx_bdl,
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  260  				 sdw->bpt_ctx.bpt_rx_stream, &sdw->bpt_ctx.dmab_rx_bdl);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  261  	if (ret1 < 0)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  262  		dev_err(cdns->dev, "%s:  hda_sdw_bpt_close failed: ret %d\n",
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  263  			__func__, ret1);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  264  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  265  deprepare_stream:
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  266  	sdw_deprepare_stream(cdns->bus.bpt_stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  267  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  268  remove_master:
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  269  	ret1 = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  270  	if (ret1 < 0)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  271  		dev_err(cdns->dev, "%s: remove master failed: %d\n",
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  272  			__func__, ret1);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  273  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  274  remove_slave:
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  275  	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  276  	if (ret1 < 0)
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  277  		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  278  			__func__, ret1);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  279  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  280  release_stream:
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  281  	sdw_release_stream(cdns->bus.bpt_stream);
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  282  	cdns->bus.bpt_stream = NULL;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  283  
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  284  	return ret;
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  285  }
4c1ce9f37d8a80 Pierre-Louis Bossart 2025-02-27  286  

:::::: The code at line 185 was first introduced by commit
:::::: 4c1ce9f37d8a809dcdfba082cc9003880efa0a63 soundwire: intel_ace2x: add BPT send_async/wait callbacks

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
