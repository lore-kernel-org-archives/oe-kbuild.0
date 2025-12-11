Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249022128B
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765441792; cv=none; b=AjGcjOniddqQscJz0CKPL7bxBK2yGJLNYEUt74wHUt58S4fL0JUKMJYsTwA+fPAACo0xA1RdFrYUuMtjA42ziFHUV/AFS1wXnqoJ7VXivo3Ob2AghLTiRLzJgYmhETsBynCCRKGLjuDrwvUs+u/olfe5b6IFPFpC6U4MKoi8/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765441792; c=relaxed/simple;
	bh=/OxTThAEaqG7xMjqrhjpwcCmp+M5gVj+zsE6nW7zP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ngkd3vwAHH6Chl8jH/QI7DBxXJNwv3obJu3rM3d9j3MCw/lo1BQUvB7SQrQwWX79pUjygMZeyKY6QMra4kLkKhPb6Tsn/IyEC+Q8znxeLT0b5faUbPM2qPCIlZAEgFbxE3bzrj/9s2pjWWWsPU9jmYod+8POQHkT77vAHFVRbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fodr+pGl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fodr+pGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765441791; x=1796977791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/OxTThAEaqG7xMjqrhjpwcCmp+M5gVj+zsE6nW7zP+8=;
  b=fodr+pGl7opicLcV88AjUSqzZLT02/+RvgEJ4aItaUJ+rSZpZAg+A37V
   qTKbk01HIxFRwpFqOume7Y2BRO1IxdW3rJjVhc/urOUBDwYmHjFJgDH0F
   3GpybIvzkbsxMbvaT5Dh0WOCwQiuWo3jAo0zPwhJU82Q+UwKgwBp6E8Sa
   4pEKzUDPlJz9DbRPHFKUOpG+hC1hOv7v3e1p7Cc/wf1iUZxkGvF3YqHuq
   fZt8VpjPHeDwI6uYX9EJqHnaqio3CLhtZsNQ1VNbsvS4muDCqswu+Q7Hm
   QE8LYazgV7xk1pkCAC6CV179oNVEq4BfLOhok6ywyP/QGL+LiNSiWk2c5
   w==;
X-CSE-ConnectionGUID: 04eNCBluTJaJnKcXtabm2Q==
X-CSE-MsgGUID: DdsoXIFGTxKcEtD2+RiMRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67305590"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67305590"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:29:50 -0800
X-CSE-ConnectionGUID: HzRhlphaSTK4kkhi0DgIpg==
X-CSE-MsgGUID: 9XCxQwzLTOaBs4Ay+f7ODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201220543"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 00:29:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTc3W-000000004PR-2uXd;
	Thu, 11 Dec 2025 08:29:46 +0000
Date: Thu, 11 Dec 2025 16:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ethtool/netlink.c:698 ethnl_perphy_start() warn: potential
 spectre issue 'ethnl_default_requests' [r]
Message-ID: <202512111620.rUULrrIK-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 172265b44cd3c90b76f2153a15abf64520d70e4a net: ethtool: Introduce per-PHY DUMP operations
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111620.rUULrrIK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111620.rUULrrIK-lkp@intel.com/

New smatch warnings:
net/ethtool/netlink.c:698 ethnl_perphy_start() warn: potential spectre issue 'ethnl_default_requests' [r]
net/ethtool/netlink.c:699 ethnl_perphy_start() warn: possible spectre second half.  'ops'

Old smatch warnings:
net/ethtool/netlink.c:644 ethnl_default_start() warn: potential spectre issue 'ethnl_default_requests' [r]
net/ethtool/netlink.c:645 ethnl_default_start() warn: possible spectre second half.  'ops'

vim +/ethnl_default_requests +698 net/ethtool/netlink.c

728480f1244200 Michal Kubecek    2019-12-27  682  
172265b44cd3c9 Maxime Chevallier 2025-05-02  683  /* per-PHY ->start() handler for GET requests */
172265b44cd3c9 Maxime Chevallier 2025-05-02  684  static int ethnl_perphy_start(struct netlink_callback *cb)
172265b44cd3c9 Maxime Chevallier 2025-05-02  685  {
172265b44cd3c9 Maxime Chevallier 2025-05-02  686  	struct ethnl_perphy_dump_ctx *phy_ctx = ethnl_perphy_dump_context(cb);
172265b44cd3c9 Maxime Chevallier 2025-05-02  687  	const struct genl_dumpit_info *info = genl_dumpit_info(cb);
172265b44cd3c9 Maxime Chevallier 2025-05-02  688  	struct ethnl_dump_ctx *ctx = &phy_ctx->ethnl_ctx;
172265b44cd3c9 Maxime Chevallier 2025-05-02  689  	struct ethnl_reply_data *reply_data;
172265b44cd3c9 Maxime Chevallier 2025-05-02  690  	const struct ethnl_request_ops *ops;
172265b44cd3c9 Maxime Chevallier 2025-05-02  691  	struct ethnl_req_info *req_info;
172265b44cd3c9 Maxime Chevallier 2025-05-02  692  	struct genlmsghdr *ghdr;
172265b44cd3c9 Maxime Chevallier 2025-05-02  693  	int ret;
172265b44cd3c9 Maxime Chevallier 2025-05-02  694  
172265b44cd3c9 Maxime Chevallier 2025-05-02  695  	BUILD_BUG_ON(sizeof(*ctx) > sizeof(cb->ctx));
172265b44cd3c9 Maxime Chevallier 2025-05-02  696  
172265b44cd3c9 Maxime Chevallier 2025-05-02  697  	ghdr = nlmsg_data(cb->nlh);
172265b44cd3c9 Maxime Chevallier 2025-05-02 @698  	ops = ethnl_default_requests[ghdr->cmd];
172265b44cd3c9 Maxime Chevallier 2025-05-02 @699  	if (WARN_ONCE(!ops, "cmd %u has no ethnl_request_ops\n", ghdr->cmd))
172265b44cd3c9 Maxime Chevallier 2025-05-02  700  		return -EOPNOTSUPP;
172265b44cd3c9 Maxime Chevallier 2025-05-02  701  	req_info = kzalloc(ops->req_info_size, GFP_KERNEL);
172265b44cd3c9 Maxime Chevallier 2025-05-02  702  	if (!req_info)
172265b44cd3c9 Maxime Chevallier 2025-05-02  703  		return -ENOMEM;
172265b44cd3c9 Maxime Chevallier 2025-05-02  704  	reply_data = kmalloc(ops->reply_data_size, GFP_KERNEL);
172265b44cd3c9 Maxime Chevallier 2025-05-02  705  	if (!reply_data) {
172265b44cd3c9 Maxime Chevallier 2025-05-02  706  		ret = -ENOMEM;
172265b44cd3c9 Maxime Chevallier 2025-05-02  707  		goto free_req_info;
172265b44cd3c9 Maxime Chevallier 2025-05-02  708  	}
172265b44cd3c9 Maxime Chevallier 2025-05-02  709  
172265b44cd3c9 Maxime Chevallier 2025-05-02  710  	/* Unlike per-dev dump, don't ignore dev. The dump handler
172265b44cd3c9 Maxime Chevallier 2025-05-02  711  	 * will notice it and dump PHYs from given dev. We only keep track of
172265b44cd3c9 Maxime Chevallier 2025-05-02  712  	 * the dev's ifindex, .dumpit() will grab and release the netdev itself.
172265b44cd3c9 Maxime Chevallier 2025-05-02  713  	 */
172265b44cd3c9 Maxime Chevallier 2025-05-02  714  	ret = ethnl_default_parse(req_info, &info->info, ops, false);
172265b44cd3c9 Maxime Chevallier 2025-05-02  715  	if (req_info->dev) {
172265b44cd3c9 Maxime Chevallier 2025-05-02  716  		phy_ctx->ifindex = req_info->dev->ifindex;
172265b44cd3c9 Maxime Chevallier 2025-05-02  717  		netdev_put(req_info->dev, &req_info->dev_tracker);
172265b44cd3c9 Maxime Chevallier 2025-05-02  718  		req_info->dev = NULL;
172265b44cd3c9 Maxime Chevallier 2025-05-02  719  	}
172265b44cd3c9 Maxime Chevallier 2025-05-02  720  	if (ret < 0)
172265b44cd3c9 Maxime Chevallier 2025-05-02  721  		goto free_reply_data;
172265b44cd3c9 Maxime Chevallier 2025-05-02  722  
172265b44cd3c9 Maxime Chevallier 2025-05-02  723  	ctx->ops = ops;
172265b44cd3c9 Maxime Chevallier 2025-05-02  724  	ctx->req_info = req_info;
172265b44cd3c9 Maxime Chevallier 2025-05-02  725  	ctx->reply_data = reply_data;
172265b44cd3c9 Maxime Chevallier 2025-05-02  726  	ctx->pos_ifindex = 0;
172265b44cd3c9 Maxime Chevallier 2025-05-02  727  
172265b44cd3c9 Maxime Chevallier 2025-05-02  728  	return 0;
172265b44cd3c9 Maxime Chevallier 2025-05-02  729  
172265b44cd3c9 Maxime Chevallier 2025-05-02  730  free_reply_data:
172265b44cd3c9 Maxime Chevallier 2025-05-02  731  	kfree(reply_data);
172265b44cd3c9 Maxime Chevallier 2025-05-02  732  free_req_info:
172265b44cd3c9 Maxime Chevallier 2025-05-02  733  	kfree(req_info);
172265b44cd3c9 Maxime Chevallier 2025-05-02  734  
172265b44cd3c9 Maxime Chevallier 2025-05-02  735  	return ret;
172265b44cd3c9 Maxime Chevallier 2025-05-02  736  }
172265b44cd3c9 Maxime Chevallier 2025-05-02  737  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
