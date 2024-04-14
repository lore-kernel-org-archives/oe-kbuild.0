Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4DE179BD
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 05:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713074328; cv=none; b=b2GWkvbw7k9hV+EcdxLZ7ZgiL3PAVYsNCsgWLIJEOm3l7NUnFozERl2jwNZ+FfuDzfx1hdhUfO6FY2Mr1I/UxPJ2oHFOnoLLggSMEEYkmByhKg83hwtRJzwGSNkOZ7Vc9uKjE8BA0YPhkmgiUMLYYmbQWFrNeAeI0zyCJYklTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713074328; c=relaxed/simple;
	bh=jxBefXar/UhGaepslllHapAM4rB1AZ854qOKzm+xYbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uI4m6ODlq7GWLfCwzMXxHPUvHywygUj1yycJCtp8W2M3+t85dTjqI7a8LT5CMNicpEdoDEYtQ0/Cjh0yRl30Y33duV3nnL1dF+/q4NRv3uw/IclrVmLp3m9BFSJoS+jWqOXNpEywKfFAnFm2px8qib/6fTk6AiGjrQ56RqcH+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkYQNYDd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkYQNYDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713074324; x=1744610324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxBefXar/UhGaepslllHapAM4rB1AZ854qOKzm+xYbc=;
  b=bkYQNYDdgyYg9vmiCRzMSJcWqdbFzqjHLKgkXY6F3kUoGD0A3waWQe80
   HTiPrfWGHCePiXibsGiLzS2Du7oZjRLvwfhgEeT1/7kp5l8ZVc/WNst3y
   9lBNG1U4I094LuNcui/myBi46xBcjktBNoComY/AXiuERvjstrOzcOXzq
   tGYpMePlzYIqO/rtOuEFLeyb8GG2FkdEVtvN/sgghbzXF1V6fDWb79B1x
   OynvUAIylnAwB4DMJKKLrEl9/oQNwROXx05wdGC072j6yo8sdbR0Ab62J
   T3dTzlqSyGJ56qeROBwM/CgZsSOaTlxaU+JqL7lOK1GvfzSah3x3c2etr
   w==;
X-CSE-ConnectionGUID: 1K45t7cMSxyUuTsmJNwUTQ==
X-CSE-MsgGUID: 0TdA0rmbTZCA39UCGOAbQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8341712"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="8341712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 22:58:41 -0700
X-CSE-ConnectionGUID: rX4EY6teSbuPl3pwDwwHmw==
X-CSE-MsgGUID: BUvkBlzdScaL59aQGWWXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21631637"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2024 22:58:40 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvssw-0003PI-04;
	Sun, 14 Apr 2024 05:58:38 +0000
Date: Sun, 14 Apr 2024 13:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH vhost 4/6] virtio_net: big mode support premapped
Message-ID: <202404141343.iPhKo7zd-lkp@intel.com>
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
In-Reply-To: <20240411025127.51945-5-xuanzhuo@linux.alibaba.com>
References: <20240411025127.51945-5-xuanzhuo@linux.alibaba.com>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
TO: virtualization@lists.linux.dev
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: netdev@vger.kernel.org

Hi Xuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.9-rc3 next-20240412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-introduce-dma-map-api-for-page/20240411-105318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20240411025127.51945-5-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH vhost 4/6] virtio_net: big mode support premapped
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240414 (https://download.01.org/0day-ci/archive/20240414/202404141343.iPhKo7zd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404141343.iPhKo7zd-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net.c:485 give_pages() warn: impossible condition '((page->dma_addr) == (~0)) => (0-u32max == u64max)'

Old smatch warnings:
drivers/net/virtio_net.c:1491 build_skb_from_xdp_buff() error: uninitialized symbol 'nr_frags'.
drivers/net/virtio_net.c:1573 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.
drivers/net/virtio_net.c:3833 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:4261 virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:4265 virtnet_config_changed_work() error: uninitialized symbol 'v'.

vim +485 drivers/net/virtio_net.c

59e4bcf761eeba Xuan Zhuo       2024-04-11  477  
9ab86bbcf8be75 Shirley Ma      2010-01-29  478  /*
590f79cf558cb4 Xuan Zhuo       2024-04-11  479   * put the whole most recent used list in the beginning for reuse
9ab86bbcf8be75 Shirley Ma      2010-01-29  480   */
e9d7417b97f420 Jason Wang      2012-12-07  481  static void give_pages(struct receive_queue *rq, struct page *page)
0a888fd1f6320d Mark McLoughlin 2008-11-16  482  {
9ab86bbcf8be75 Shirley Ma      2010-01-29  483  	struct page *end;
0a888fd1f6320d Mark McLoughlin 2008-11-16  484  
59e4bcf761eeba Xuan Zhuo       2024-04-11 @485  	if (page_dma_addr(page) == DMA_MAPPING_ERROR) {
59e4bcf761eeba Xuan Zhuo       2024-04-11  486  		if (page_chain_map(rq, page)) {
59e4bcf761eeba Xuan Zhuo       2024-04-11  487  			__free_pages(page, 0);
59e4bcf761eeba Xuan Zhuo       2024-04-11  488  			return;
59e4bcf761eeba Xuan Zhuo       2024-04-11  489  		}
59e4bcf761eeba Xuan Zhuo       2024-04-11  490  	}
59e4bcf761eeba Xuan Zhuo       2024-04-11  491  
e9d7417b97f420 Jason Wang      2012-12-07  492  	/* Find end of list, sew whole thing into vi->rq.pages. */
590f79cf558cb4 Xuan Zhuo       2024-04-11  493  	for (end = page; page_chain_next(end); end = page_chain_next(end));
590f79cf558cb4 Xuan Zhuo       2024-04-11  494  
590f79cf558cb4 Xuan Zhuo       2024-04-11  495  	page_chain_add(end, rq->pages);
e9d7417b97f420 Jason Wang      2012-12-07  496  	rq->pages = page;
0a888fd1f6320d Mark McLoughlin 2008-11-16  497  }
0a888fd1f6320d Mark McLoughlin 2008-11-16  498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
