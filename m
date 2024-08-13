Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23419047C
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723545803; cv=none; b=okBwyXSXZNvdamtgYsKzZPGNjeov0emZGoqctcv1BQlLv9IGFOcXM7vlfsrRvAe90UjB5vpOp6VKmCxn5M5CSsthC2HlE9FeolYVf2tVD30kUOrgIiQN+49Q+b0q6duDnzuftpkqvp/ynFAOM8yJsslaHR0dWqS65oC3xAp5sTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723545803; c=relaxed/simple;
	bh=HQgTTMKsJtUqA6BHG+eFo3HkBlVfxjFG6Btxz9G2IRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fm+j2QCQ2Pa56JitvOMb8qoKw7rgtq6DnQTsBPunw9nwxFlQOStVLdteQIRCjvBVUzjaCfeQsoyyAFV32iqAA2Z7wjFhIRB8jpm9hoM3wEEpEy0gu1q5FbDJx3jA0DvAq9JaNKUszF+dGPkGjzkcx0m/mh9cPRKK+CGtoyErPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ1shrRu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ1shrRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723545801; x=1755081801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQgTTMKsJtUqA6BHG+eFo3HkBlVfxjFG6Btxz9G2IRA=;
  b=bZ1shrRushYFQ5g8A7GwCt2Y2nCZ8AfttJNZlp07Y8CUm4D55DPyU9v0
   1CvKEoXx6pYUOwWDvsNVsprg4u9ga7aWxxTzcjMbCAaD/UsUEpys8mp6G
   4wicqBJsZuNzt6mUcb6Qs1rIoCNpHvDsUdmQFcrBJjElsAN+bPETfYx+3
   HGtaTDlh21+Fsb2OzQqgitNDMUGk2WA3rxqPSYEqVweXrrM16uvRm79eX
   yth2g+j2TOsDkuNvWq3V7j1TKzgyL0YVgaS/8m8TdxWq15i1swTstR1B8
   GBekU783DMRuYyuBbdV6cvBCZu5tBhzqIVSPMJ8d7+/AUOiWOT8T9y8Jl
   Q==;
X-CSE-ConnectionGUID: 95tFjoL5SWei0kXJ36EU1w==
X-CSE-MsgGUID: Jh2j/dKvSPGjq4uur9aqKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32274143"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="32274143"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 03:43:20 -0700
X-CSE-ConnectionGUID: 5VcSQlMqTGOopAdKEphEFw==
X-CSE-MsgGUID: WkyrGgKRRueLr0gLrAsovQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63582957"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2024 03:43:19 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdozk-0000Ln-1c;
	Tue, 13 Aug 2024 10:43:16 +0000
Date: Tue, 13 Aug 2024 18:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:rdma-next 26/38] drivers/infiniband/core/nldev.c:2822
 rdma_nl_notify_event() warn: missing error code 'ret'
Message-ID: <202408131838.dAj6f4Cl-lkp@intel.com>
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
TO: Chiara Meiohas <cmeiohas@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   2419f9d40091e6e94334b3c8df16d266133ddaea
commit: a4499d4d93fbda92878d7d2aba9e209e110f7756 [26/38] RDMA/nldev: Add support for RDMA monitoring
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240813 (https://download.01.org/0day-ci/archive/20240813/202408131838.dAj6f4Cl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408131838.dAj6f4Cl-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/nldev.c:2822 rdma_nl_notify_event() warn: missing error code 'ret'

vim +/ret +2822 drivers/infiniband/core/nldev.c

a4499d4d93fbda Chiara Meiohas 2024-07-25  2787  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2788  int rdma_nl_notify_event(struct ib_device *device, u32 port_num,
a4499d4d93fbda Chiara Meiohas 2024-07-25  2789  			  enum rdma_nl_notify_event_type type)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2790  {
a4499d4d93fbda Chiara Meiohas 2024-07-25  2791  	struct sk_buff *skb;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2792  	struct net *net;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2793  	int ret = 0;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2794  	void *nlh;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2795  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2796  	net = read_pnet(&device->coredev.rdma_net);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2797  	if (!net)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2798  		return -EINVAL;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2799  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2800  	skb = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2801  	if (!skb)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2802  		return -ENOMEM;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2803  	nlh = nlmsg_put(skb, 0, 0,
a4499d4d93fbda Chiara Meiohas 2024-07-25  2804  			RDMA_NL_GET_TYPE(RDMA_NL_NLDEV, RDMA_NLDEV_CMD_MONITOR),
a4499d4d93fbda Chiara Meiohas 2024-07-25  2805  			0, 0);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2806  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2807  	switch (type) {
a4499d4d93fbda Chiara Meiohas 2024-07-25  2808  	case RDMA_REGISTER_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2809  	case RDMA_UNREGISTER_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2810  		ret = fill_mon_register(skb, device, net);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2811  		if (ret)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2812  			goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2813  		break;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2814  	case RDMA_NETDEV_ATTACH_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2815  	case RDMA_NETDEV_DETACH_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2816  		ret = fill_mon_netdev_association(skb, device,
a4499d4d93fbda Chiara Meiohas 2024-07-25  2817  						  port_num, net);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2818  		if (ret)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2819  			goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2820  		break;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2821  	default:
a4499d4d93fbda Chiara Meiohas 2024-07-25 @2822  		goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2823  	}
a4499d4d93fbda Chiara Meiohas 2024-07-25  2824  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2825  	ret = nla_put_u8(skb, RDMA_NLDEV_ATTR_EVENT_TYPE, type);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2826  	if (ret)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2827  		goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2828  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2829  	nlmsg_end(skb, nlh);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2830  	ret = rdma_nl_multicast(net, skb, RDMA_NL_GROUP_NOTIFY, GFP_KERNEL);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2831  	if (ret && ret != -ESRCH) {
a4499d4d93fbda Chiara Meiohas 2024-07-25  2832  		skb = NULL; /* skb is freed in the netlink send-op handling */
a4499d4d93fbda Chiara Meiohas 2024-07-25  2833  		goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2834  	}
a4499d4d93fbda Chiara Meiohas 2024-07-25  2835  	return 0;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2836  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2837  err_free:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2838  	rdma_nl_notify_err_msg(device, port_num, type);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2839  	nlmsg_free(skb);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2840  	return ret;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2841  }
a4499d4d93fbda Chiara Meiohas 2024-07-25  2842  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
