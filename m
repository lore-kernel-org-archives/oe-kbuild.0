Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF639196
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742169890; cv=none; b=IQNjwlvSThGZp9cQDnnrOnqeBsLdw4YSYCIRRMH4wVWwYOhPZFjdwxKKLCvldkbHOt1z8m6R8pC+k3TB+hnhS02kn5SDRAPT1QMt4G/HGPoYPTi4prQzRxAtYAeos1jrx58wipmktwE04idEbPyNDEaPOzybl49d0XGyRsxGTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742169890; c=relaxed/simple;
	bh=RlyLyi3R3kUy679fZ7tCo2pGZFZnYJLQrcqMhnffVjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ok4t0w6HZPUDI8cafsDjDybZz2PACNB0uiiHANbGLRHCbx2WM2nhpLwxWlpf8Lsd4OPptOmxJqFaTH58dT0JGdS8U4Ei7bNKPmtKmV7grcH6vafN+UsWPlfpcpP09YdrywVltNIxCPx//NYJdejqeWL5dF3LTSFe/bIfVZE1tDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPIyg2v7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPIyg2v7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742169888; x=1773705888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlyLyi3R3kUy679fZ7tCo2pGZFZnYJLQrcqMhnffVjo=;
  b=dPIyg2v71o/Yd7OkDGFTO3dUTSFY1Aii+lXlCCa2CjsTmWMjo/rAa5Wl
   XbKcyQqAuZWyf9VeKPR3J+T1TB6I/0h+m1zl5R8wlMhiqW7UeQ3wv6JY3
   ClKc/l/4XycRShRYKW7dfWeyPrZbUwMFiOGKuOX4ilY3Vw31MuE7tMdCd
   9slki+MNRaVUzpVpibzcBw1fl8LU0s4/b2oQnT4d8bQBxhkvf7pjS+rjo
   1Afco/yldPNjKx5tV+S8ysvM2crjSPEVq/JYjQkjWO4ZL5LoaeN75BvRc
   EgPT3pCUt4AjWAu/AZFwjbjK7ZdcuMvYMKoW1w2ibcDIpuXyIchH8xNhv
   Q==;
X-CSE-ConnectionGUID: PiY35LJ5QV2R4ujcbnxfxg==
X-CSE-MsgGUID: ONccSqKEQEaZsOna2FT9yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43428375"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43428375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 17:04:47 -0700
X-CSE-ConnectionGUID: rZGn7NFmRpeWvS1oRiCxNA==
X-CSE-MsgGUID: vATXQvlZT1aqFN5zA3npHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="152710672"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Mar 2025 17:04:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttxyF-000CJX-1U;
	Mon, 17 Mar 2025 00:04:43 +0000
Date: Mon, 17 Mar 2025 08:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 2/5] firmware: thead: Add AON firmware protocol driver
Message-ID: <202503170718.p0RnkGc7-lkp@intel.com>
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
In-Reply-To: <20250311171900.1549916-3-m.wilczynski@samsung.com>
References: <20250311171900.1549916-3-m.wilczynski@samsung.com>
TO: Michal Wilczynski <m.wilczynski@samsung.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc6]
[cannot apply to next-20250314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/dt-bindings-firmware-thead-th1520-Add-support-for-firmware-node/20250312-012349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250311171900.1549916-3-m.wilczynski%40samsung.com
patch subject: [PATCH v8 2/5] firmware: thead: Add AON firmware protocol driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r073-20250316 (https://download.01.org/0day-ci/archive/20250317/202503170718.p0RnkGc7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503170718.p0RnkGc7-lkp@intel.com/

New smatch warnings:
drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 3
drivers/firmware/thead,th1520-aon.c:221 th1520_aon_init() error: dereferencing freed memory 'aon_chan' (line 220)

Old smatch warnings:
drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 2

vim +/data +174 drivers/firmware/thead,th1520-aon.c

19057a09c5121ea Michal Wilczynski 2025-03-11  143  
19057a09c5121ea Michal Wilczynski 2025-03-11  144  /**
19057a09c5121ea Michal Wilczynski 2025-03-11  145   * th1520_aon_power_update() - Change power state of a resource via TH1520 AON
19057a09c5121ea Michal Wilczynski 2025-03-11  146   * @aon_chan: Pointer to the AON channel structure
19057a09c5121ea Michal Wilczynski 2025-03-11  147   * @rsrc: Resource ID whose power state needs to be updated
19057a09c5121ea Michal Wilczynski 2025-03-11  148   * @power_on: Boolean indicating whether the resource should be powered on (true)
19057a09c5121ea Michal Wilczynski 2025-03-11  149   *            or powered off (false)
19057a09c5121ea Michal Wilczynski 2025-03-11  150   *
19057a09c5121ea Michal Wilczynski 2025-03-11  151   * This function requests the TH1520 AON subsystem to set the power mode of the
19057a09c5121ea Michal Wilczynski 2025-03-11  152   * given resource (@rsrc) to either on or off. It constructs the message in
19057a09c5121ea Michal Wilczynski 2025-03-11  153   * `struct th1520_aon_msg_req_set_resource_power_mode` and then invokes
19057a09c5121ea Michal Wilczynski 2025-03-11  154   * th1520_aon_call_rpc() to make the request. If the AON call fails, an error
19057a09c5121ea Michal Wilczynski 2025-03-11  155   * message is logged along with the specific return code.
19057a09c5121ea Michal Wilczynski 2025-03-11  156   *
19057a09c5121ea Michal Wilczynski 2025-03-11  157   * Return:
19057a09c5121ea Michal Wilczynski 2025-03-11  158   * * 0 on success
19057a09c5121ea Michal Wilczynski 2025-03-11  159   * * A negative error code in case of failures (propagated from
19057a09c5121ea Michal Wilczynski 2025-03-11  160   *   th1520_aon_call_rpc()).
19057a09c5121ea Michal Wilczynski 2025-03-11  161   */
19057a09c5121ea Michal Wilczynski 2025-03-11  162  int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
19057a09c5121ea Michal Wilczynski 2025-03-11  163  			    bool power_on)
19057a09c5121ea Michal Wilczynski 2025-03-11  164  {
19057a09c5121ea Michal Wilczynski 2025-03-11  165  	struct th1520_aon_msg_req_set_resource_power_mode msg = {};
19057a09c5121ea Michal Wilczynski 2025-03-11  166  	struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
19057a09c5121ea Michal Wilczynski 2025-03-11  167  	int ret;
19057a09c5121ea Michal Wilczynski 2025-03-11  168  
19057a09c5121ea Michal Wilczynski 2025-03-11  169  	hdr->svc = TH1520_AON_RPC_SVC_PM;
19057a09c5121ea Michal Wilczynski 2025-03-11  170  	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
19057a09c5121ea Michal Wilczynski 2025-03-11  171  	hdr->size = TH1520_AON_RPC_MSG_NUM;
19057a09c5121ea Michal Wilczynski 2025-03-11  172  
19057a09c5121ea Michal Wilczynski 2025-03-11  173  	RPC_SET_BE16(&msg.resource, 0, rsrc);
19057a09c5121ea Michal Wilczynski 2025-03-11 @174  	RPC_SET_BE16(&msg.resource, 2,
19057a09c5121ea Michal Wilczynski 2025-03-11  175  		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
19057a09c5121ea Michal Wilczynski 2025-03-11  176  				 TH1520_AON_PM_PW_MODE_OFF));
19057a09c5121ea Michal Wilczynski 2025-03-11  177  
19057a09c5121ea Michal Wilczynski 2025-03-11  178  	ret = th1520_aon_call_rpc(aon_chan, &msg);
19057a09c5121ea Michal Wilczynski 2025-03-11  179  	if (ret)
19057a09c5121ea Michal Wilczynski 2025-03-11  180  		dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
19057a09c5121ea Michal Wilczynski 2025-03-11  181  			power_on ? "up" : "off", rsrc, ret);
19057a09c5121ea Michal Wilczynski 2025-03-11  182  
19057a09c5121ea Michal Wilczynski 2025-03-11  183  	return ret;
19057a09c5121ea Michal Wilczynski 2025-03-11  184  }
19057a09c5121ea Michal Wilczynski 2025-03-11  185  EXPORT_SYMBOL_GPL(th1520_aon_power_update);
19057a09c5121ea Michal Wilczynski 2025-03-11  186  
19057a09c5121ea Michal Wilczynski 2025-03-11  187  /**
19057a09c5121ea Michal Wilczynski 2025-03-11  188   * th1520_aon_init() - Initialize TH1520 AON firmware protocol interface
19057a09c5121ea Michal Wilczynski 2025-03-11  189   * @dev: Device pointer for the AON subsystem
19057a09c5121ea Michal Wilczynski 2025-03-11  190   *
19057a09c5121ea Michal Wilczynski 2025-03-11  191   * This function initializes the TH1520 AON firmware protocol interface by:
19057a09c5121ea Michal Wilczynski 2025-03-11  192   * - Allocating and initializing the AON channel structure
19057a09c5121ea Michal Wilczynski 2025-03-11  193   * - Setting up the mailbox client
19057a09c5121ea Michal Wilczynski 2025-03-11  194   * - Requesting the AON mailbox channel
19057a09c5121ea Michal Wilczynski 2025-03-11  195   * - Initializing synchronization primitives
19057a09c5121ea Michal Wilczynski 2025-03-11  196   *
19057a09c5121ea Michal Wilczynski 2025-03-11  197   * Return:
19057a09c5121ea Michal Wilczynski 2025-03-11  198   * * Valid pointer to th1520_aon_chan structure on success
19057a09c5121ea Michal Wilczynski 2025-03-11  199   * * ERR_PTR(-ENOMEM) if memory allocation fails
19057a09c5121ea Michal Wilczynski 2025-03-11  200   * * ERR_PTR() with other negative error codes from mailbox operations
19057a09c5121ea Michal Wilczynski 2025-03-11  201   */
19057a09c5121ea Michal Wilczynski 2025-03-11  202  struct th1520_aon_chan *th1520_aon_init(struct device *dev)
19057a09c5121ea Michal Wilczynski 2025-03-11  203  {
19057a09c5121ea Michal Wilczynski 2025-03-11  204  	struct th1520_aon_chan *aon_chan;
19057a09c5121ea Michal Wilczynski 2025-03-11  205  	struct mbox_client *cl;
19057a09c5121ea Michal Wilczynski 2025-03-11  206  
19057a09c5121ea Michal Wilczynski 2025-03-11  207  	aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
19057a09c5121ea Michal Wilczynski 2025-03-11  208  	if (!aon_chan)
19057a09c5121ea Michal Wilczynski 2025-03-11  209  		return ERR_PTR(-ENOMEM);
19057a09c5121ea Michal Wilczynski 2025-03-11  210  
19057a09c5121ea Michal Wilczynski 2025-03-11  211  	cl = &aon_chan->cl;
19057a09c5121ea Michal Wilczynski 2025-03-11  212  	cl->dev = dev;
19057a09c5121ea Michal Wilczynski 2025-03-11  213  	cl->tx_block = true;
19057a09c5121ea Michal Wilczynski 2025-03-11  214  	cl->tx_tout = MAX_TX_TIMEOUT;
19057a09c5121ea Michal Wilczynski 2025-03-11  215  	cl->rx_callback = th1520_aon_rx_callback;
19057a09c5121ea Michal Wilczynski 2025-03-11  216  
19057a09c5121ea Michal Wilczynski 2025-03-11  217  	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
19057a09c5121ea Michal Wilczynski 2025-03-11  218  	if (IS_ERR(aon_chan->ch)) {
19057a09c5121ea Michal Wilczynski 2025-03-11  219  		dev_err(dev, "Failed to request aon mbox chan\n");
19057a09c5121ea Michal Wilczynski 2025-03-11 @220  		kfree(aon_chan);
19057a09c5121ea Michal Wilczynski 2025-03-11 @221  		return ERR_CAST(aon_chan->ch);
19057a09c5121ea Michal Wilczynski 2025-03-11  222  	}
19057a09c5121ea Michal Wilczynski 2025-03-11  223  
19057a09c5121ea Michal Wilczynski 2025-03-11  224  	mutex_init(&aon_chan->transaction_lock);
19057a09c5121ea Michal Wilczynski 2025-03-11  225  	init_completion(&aon_chan->done);
19057a09c5121ea Michal Wilczynski 2025-03-11  226  
19057a09c5121ea Michal Wilczynski 2025-03-11  227  	return aon_chan;
19057a09c5121ea Michal Wilczynski 2025-03-11  228  }
19057a09c5121ea Michal Wilczynski 2025-03-11  229  EXPORT_SYMBOL_GPL(th1520_aon_init);
19057a09c5121ea Michal Wilczynski 2025-03-11  230  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
