Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E20613632B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 01:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755421; cv=none; b=HYfViiwz+sjpsaZ9aQ1BBsQ40138S92rZLL4Ke8kZ8elm7YUVPOJMZpVuL4Gd1UDErDaBP+09vDUTAI+XxsUZvdS853jq4cGVXMKxK7ayv6Pxw/LqwlFDLWSsRtixPGLrLpkXaPBttRo9a9SI+8ni55214D8IivmBIxpvRymAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755421; c=relaxed/simple;
	bh=D3EvVnwBmi4rCP08ahdU08m418gGpkcCO9PcvRuLsOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPjhiYvU5en+8049Ui95fgTnuXqnMGT8ysIYO3yRAbEblbZDvdbUHT3Lo1KfrGnYcoo+LtJb96hJnD9wUCsAbbmXl95bPY8yWrcSwX615P1p1lLwBvKBHym6MOsPetyhb8x40li0If0mooW+TztuorslDkPpV4n7KhR9Eoe9la8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+B2GB3r; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+B2GB3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746755419; x=1778291419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3EvVnwBmi4rCP08ahdU08m418gGpkcCO9PcvRuLsOc=;
  b=R+B2GB3rGjCHv0zAL5jEyVnsmfVA6t1CiBuIUKjh05vMzsFgEjjx+ogc
   Ie5gUkz3ll3/lBnPpsIXk/faSHwV2JWURdVaNg9gJuKN1kOR/9zR3PWCY
   37Qsgc5HOQvBmstHq3uukD9x8eB25Gzps9c/TKm8VLS2nMSBxOud5JLPN
   LfocC87yKsrZf7EKR2kFrBURIQfHh/7+gazZSujtdQC/1rYq+DAFJMLPy
   DvyFB1t7/meQz1f0XCOzRmDpIcoMFqxh+JzLWfF9wcq35WrT7oie480nJ
   A+t6RygTRzcQtm7GSyQxTlXdp4YemEtdt2NC2fC4Kx1ODzyCtsEnezBhO
   A==;
X-CSE-ConnectionGUID: 3X5NqwDuQwaXFYlUnZeuwQ==
X-CSE-MsgGUID: x5ccCsr8RCqU+1DqmseXyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48724141"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48724141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:50:08 -0700
X-CSE-ConnectionGUID: JiqpQcZPQL+i03u8/LC/6A==
X-CSE-MsgGUID: zv3vtJ2rTeW/mUv2dd5F5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136406353"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 18:49:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDCrL-000BXz-0W;
	Fri, 09 May 2025 01:49:07 +0000
Date: Fri, 9 May 2025 09:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8112/9729] net/ethtool/netlink.c:698
 ethnl_perphy_start() warn: potential spectre issue 'ethnl_default_requests'
 [r]
Message-ID: <202505090940.M2T3pmPS-lkp@intel.com>
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
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 172265b44cd3c90b76f2153a15abf64520d70e4a [8112/9729] net: ethtool: Introduce per-PHY DUMP operations
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090940.M2T3pmPS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505090940.M2T3pmPS-lkp@intel.com/

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
