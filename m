Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635D10E9
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 00:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707008239; cv=none; b=sZAX18fT2Ja/glsJK9j2Ecy4kqvBSue7VjX4gQHB/nrkBm1WfpZInz/8F7T7DTdRy8qOsrFwuc7W6T2AgBD9Yuq49bxrovvlo+MYT7gDtyr4gh5SEXQkduSkEfUabEENP2WJhWG3cL1jrEQfxF7Blp4fGSsoOhLAsLVpHTKIhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707008239; c=relaxed/simple;
	bh=3NGCVVcAL9Zz1LbgpXYKMrsXmXnLaRBAq1/wFNkZXho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7YsW5YRHDtwnAaSnN1Lt4vwSNA94tWQcNDewljDYoYgHBkqV1ihPCL378kgzyEPiBtDmi90h2Mtk9tAc5r8YMB1yqiUwKAN8r/fz1BO81Lyu7iQpE6NWrynfm452dKQJQYejeOy7b1ncbrVbPGyE3G11AoXLdacD+hWMD7dgIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjlWh+g/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjlWh+g/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707008236; x=1738544236;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3NGCVVcAL9Zz1LbgpXYKMrsXmXnLaRBAq1/wFNkZXho=;
  b=bjlWh+g/ShjKGsGYRSx+ZbcUNGs0WvVpIQ3/vO8oWEVYz1KtwY5JYksc
   wv6lFx3OWth0bU6uwosL5RRodFSsO7zEgqVhA+xXBNiHiY1ysaAISiUoe
   vqRjemo2mYxjmPOotx2a1GFRiQTASD9SOUBYWJWO4fEOZfWWLClRGslm+
   pJcTBWWHVK4233QSuE7JbbKRqxq5t8mgwOAwEqlsBhUj7V5jW+osELmbe
   h1dq2ZJUFKiCRCP0AN/znTR7TFsHbmQd6VnM80Z1f1nKIz3Y1rVNCg/WG
   YxbCkI4MHGaSFnsuKcNStpQyBqU2MhdDTB8vpgNZYE27M/5mnMbBnaDOc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="4245023"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="4245023"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 16:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823540503"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="823540503"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2024 16:57:14 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWQop-0005ny-2N;
	Sun, 04 Feb 2024 00:57:11 +0000
Date: Sun, 4 Feb 2024 08:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH vhost v1 19/19] virtio_net: sq support premapped mode
Message-ID: <202402040825.QvtV1KLW-lkp@intel.com>
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
In-Reply-To: <20240202093951.120283-20-xuanzhuo@linux.alibaba.com>
References: <20240202093951.120283-20-xuanzhuo@linux.alibaba.com>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
TO: virtualization@lists.linux.dev
CC: Richard Weinberger <richard@nod.at>
CC: Anton Ivanov <anton.ivanov@cambridgegreys.com>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Vadim Pasternak <vadimp@nvidia.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>
CC: Eric Farman <farman@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Jesper Dangaard Brouer <hawk@kernel.org>
CC: John Fastabend <john.fastabend@gmail.com>
CC: Benjamin Berg <benjamin.berg@intel.com>
CC: linux-um@lists.infradead.org
CC: netdev@vger.kernel.org

Hi Xuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7]
[cannot apply to uml/next remoteproc/rproc-next s390/features linus/master uml/fixes v6.8-rc2 v6.8-rc1 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-introduce-vring_need_unmap_buffer/20240202-174906
base:   v6.7
patch link:    https://lore.kernel.org/r/20240202093951.120283-20-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH vhost v1 19/19] virtio_net: sq support premapped mode
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240204 (https://download.01.org/0day-ci/archive/20240204/202402040825.QvtV1KLW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402040825.QvtV1KLW-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net.c:482 virtnet_sq_init_dma_mate() error: potentially dereferencing uninitialized 'd'.

Old smatch warnings:
drivers/net/virtio_net.c:1497 build_skb_from_xdp_buff() error: uninitialized symbol 'nr_frags'.
drivers/net/virtio_net.c:1579 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.
drivers/net/virtio_net.c:3638 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:4060 virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:4064 virtnet_config_changed_work() error: uninitialized symbol 'v'.

vim +/d +482 drivers/net/virtio_net.c

0d02beb81c70b9 Xuan Zhuo 2024-02-02  462  
0d02beb81c70b9 Xuan Zhuo 2024-02-02  463  static int virtnet_sq_init_dma_mate(struct send_queue *sq)
0d02beb81c70b9 Xuan Zhuo 2024-02-02  464  {
0d02beb81c70b9 Xuan Zhuo 2024-02-02  465  	struct virtnet_sq_dma *d;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  466  	int num, i;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  467  
0d02beb81c70b9 Xuan Zhuo 2024-02-02  468  	num = (virtqueue_get_vring_size(sq->vq) + 1) * ARRAY_SIZE(sq->sg);
0d02beb81c70b9 Xuan Zhuo 2024-02-02  469  
0d02beb81c70b9 Xuan Zhuo 2024-02-02  470  	sq->dmainfo.free = kcalloc(num, sizeof(*sq->dmainfo.free), GFP_KERNEL);
0d02beb81c70b9 Xuan Zhuo 2024-02-02  471  	if (!sq->dmainfo.free)
0d02beb81c70b9 Xuan Zhuo 2024-02-02  472  		return -ENOMEM;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  473  
0d02beb81c70b9 Xuan Zhuo 2024-02-02  474  	sq->dmainfo.p = sq->dmainfo.free;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  475  
0d02beb81c70b9 Xuan Zhuo 2024-02-02  476  	for (i = 0; i < num; ++i) {
0d02beb81c70b9 Xuan Zhuo 2024-02-02  477  		d = &sq->dmainfo.free[i];
0d02beb81c70b9 Xuan Zhuo 2024-02-02  478  		d->is_tail = false;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  479  		d->next = d + 1;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  480  	}
0d02beb81c70b9 Xuan Zhuo 2024-02-02  481  
0d02beb81c70b9 Xuan Zhuo 2024-02-02 @482  	d->next = NULL;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  483  
0d02beb81c70b9 Xuan Zhuo 2024-02-02  484  	return 0;
0d02beb81c70b9 Xuan Zhuo 2024-02-02  485  }
0d02beb81c70b9 Xuan Zhuo 2024-02-02  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
