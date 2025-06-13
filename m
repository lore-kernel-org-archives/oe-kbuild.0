Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18812C327C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800156; cv=none; b=G3TCct5dhPso60543CA5fFT8uoxAT2dhOPo8T3MQ3bCgadgW+XFlgix9XayVlz4ddPdbHH0/why/hffQMmGtSU8YB8CyjFiVHw1KZVu/ppLZko29b6PRoIqCQWfyEKsctoOeOqEgZCTBh3NjGd+Wn1g83SWh2eYFu7DRPFiVKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800156; c=relaxed/simple;
	bh=bmSUYZYhX30eSxMQR4w8s2emErkkpuHVDFnudiqy5Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPgiQRd4hDcHfKuFwtMFTlQdjVEWhtFgFJW2ug6nPL7CqyScmqPG7PKS1BoVFY25Yf0LExeExzOYMTpNUipB29NSoE8aejc43ZK4O4185H66JKvgcfWVZa+XRVYvPl1svZm3PhG1gx0L4wQ8NRUKDpQm3f8KbY+ykZvXYAEwCxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axMTRPSy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axMTRPSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749800155; x=1781336155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmSUYZYhX30eSxMQR4w8s2emErkkpuHVDFnudiqy5Oo=;
  b=axMTRPSyklxxA/iFu5BU4HHRXlS70kyBxHpULJdQkm0hslY132CMBmZ9
   OchqHAFxrkImvzUu9JEJr9qp5RZEuXDR7RINlAbZADefYvPQRRkz3K6qU
   VcAuAgbjGBo9/7JuwlOv33iA9NnlzLbcF7kinGKhRJdBtVNO0zUHVwB9A
   RM9pjSLOLQfo3EYnJn1auCpWVkLDqMSU+F1H1BTDmYfoE5Cn7Cx5pRa9w
   8uolXgjtvlBAY012nEbFIdnb2DdFAnTXPZpjzbmTr3oTryHg5C3j1x+sx
   i41yqiHg6fCd4MCfp40cAlg0UI2kSM6j/G2Ztt8aZ6wE5ek03AYmaYQpH
   A==;
X-CSE-ConnectionGUID: 6HmXklPLTr2aAjdBozeBgw==
X-CSE-MsgGUID: G95qnYhdQkejgH7gK4WVFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51121824"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51121824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 00:35:54 -0700
X-CSE-ConnectionGUID: tQEBvyoiTPqHdE/13TqvCg==
X-CSE-MsgGUID: jyGB1roRQi+Dy3WOagCEvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148309242"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 00:35:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPyx4-000CKM-1e;
	Fri, 13 Jun 2025 07:35:50 +0000
Date: Fri, 13 Jun 2025 15:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 12/13] net: mctp: add gateway routing support
Message-ID: <202506131515.a5tCsTj0-lkp@intel.com>
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
In-Reply-To: <20250611-dev-forwarding-v1-12-6b69b1feb37f@codeconstruct.com.au>
References: <20250611-dev-forwarding-v1-12-6b69b1feb37f@codeconstruct.com.au>
TO: Jeremy Kerr <jk@codeconstruct.com.au>
TO: Matt Johnston <matt@codeconstruct.com.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Simon Horman <horms@kernel.org>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0097c4195b1d0ca57d15979626c769c74747b5a0]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-mctp-don-t-use-source-cb-data-when-forwarding-ensure-pkt_type-is-set/20250611-143319
base:   0097c4195b1d0ca57d15979626c769c74747b5a0
patch link:    https://lore.kernel.org/r/20250611-dev-forwarding-v1-12-6b69b1feb37f%40codeconstruct.com.au
patch subject: [PATCH net-next 12/13] net: mctp: add gateway routing support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131515.a5tCsTj0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506131515.a5tCsTj0-lkp@intel.com/

New smatch warnings:
net/mctp/route.c:1381 mctp_route_nlparse_common() error: uninitialized symbol 'gateway'.

Old smatch warnings:
net/mctp/route.c:1397 mctp_route_nlparse_common() error: uninitialized symbol 'gateway'.

vim +/gateway +1381 net/mctp/route.c

33d33bef994e518 Jeremy Kerr   2025-06-11  1344  
75626016e50cb9a Jeremy Kerr   2025-06-11  1345  /* base parsing; common to both _lookup and _populate variants.
75626016e50cb9a Jeremy Kerr   2025-06-11  1346   *
75626016e50cb9a Jeremy Kerr   2025-06-11  1347   * For gateway routes (which have a RTA_GATEWAY, and no RTA_OIF), we populate
75626016e50cb9a Jeremy Kerr   2025-06-11  1348   * *gatweayp. for direct routes (RTA_OIF, no RTA_GATEWAY), we populate *mdev.
75626016e50cb9a Jeremy Kerr   2025-06-11  1349   */
33d33bef994e518 Jeremy Kerr   2025-06-11  1350  static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1351  				     struct netlink_ext_ack *extack,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1352  				     struct nlattr **tb, struct rtmsg **rtm,
33d33bef994e518 Jeremy Kerr   2025-06-11  1353  				     struct mctp_dev **mdev,
75626016e50cb9a Jeremy Kerr   2025-06-11  1354  				     struct mctp_fq_addr *gatewayp,
33d33bef994e518 Jeremy Kerr   2025-06-11  1355  				     mctp_eid_t *daddr_start)
06d2f4c583a7d89 Matt Johnston 2021-07-29  1356  {
75626016e50cb9a Jeremy Kerr   2025-06-11  1357  	struct mctp_fq_addr *gateway;
75626016e50cb9a Jeremy Kerr   2025-06-11  1358  	unsigned int ifindex = 0;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1359  	struct net_device *dev;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1360  	int rc;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1361  
06d2f4c583a7d89 Matt Johnston 2021-07-29  1362  	rc = nlmsg_parse(nlh, sizeof(struct rtmsg), tb, RTA_MAX,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1363  			 rta_mctp_policy, extack);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1364  	if (rc < 0) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1365  		NL_SET_ERR_MSG(extack, "incorrect format");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1366  		return rc;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1367  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1368  
06d2f4c583a7d89 Matt Johnston 2021-07-29  1369  	if (!tb[RTA_DST]) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1370  		NL_SET_ERR_MSG(extack, "dst EID missing");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1371  		return -EINVAL;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1372  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1373  	*daddr_start = nla_get_u8(tb[RTA_DST]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1374  
75626016e50cb9a Jeremy Kerr   2025-06-11  1375  	if (tb[RTA_OIF])
06d2f4c583a7d89 Matt Johnston 2021-07-29  1376  		ifindex = nla_get_u32(tb[RTA_OIF]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1377  
75626016e50cb9a Jeremy Kerr   2025-06-11  1378  	if (tb[RTA_GATEWAY])
75626016e50cb9a Jeremy Kerr   2025-06-11  1379  		gateway = nla_data(tb[RTA_GATEWAY]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1380  
75626016e50cb9a Jeremy Kerr   2025-06-11 @1381  	if (ifindex && gateway) {
75626016e50cb9a Jeremy Kerr   2025-06-11  1382  		NL_SET_ERR_MSG(extack,
75626016e50cb9a Jeremy Kerr   2025-06-11  1383  			       "cannot specify both ifindex and gateway");
33d33bef994e518 Jeremy Kerr   2025-06-11  1384  		return -EINVAL;
33d33bef994e518 Jeremy Kerr   2025-06-11  1385  
75626016e50cb9a Jeremy Kerr   2025-06-11  1386  	} else if (ifindex) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1387  		dev = __dev_get_by_index(net, ifindex);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1388  		if (!dev) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1389  			NL_SET_ERR_MSG(extack, "bad ifindex");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1390  			return -ENODEV;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1391  		}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1392  		*mdev = mctp_dev_get_rtnl(dev);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1393  		if (!*mdev)
06d2f4c583a7d89 Matt Johnston 2021-07-29  1394  			return -ENODEV;
75626016e50cb9a Jeremy Kerr   2025-06-11  1395  		gatewayp->eid = 0;
75626016e50cb9a Jeremy Kerr   2025-06-11  1396  
75626016e50cb9a Jeremy Kerr   2025-06-11  1397  	} else if (gateway) {
75626016e50cb9a Jeremy Kerr   2025-06-11  1398  		if (!mctp_address_unicast(gateway->eid)) {
75626016e50cb9a Jeremy Kerr   2025-06-11  1399  			NL_SET_ERR_MSG(extack, "bad gateway");
75626016e50cb9a Jeremy Kerr   2025-06-11  1400  			return -EINVAL;
75626016e50cb9a Jeremy Kerr   2025-06-11  1401  		}
75626016e50cb9a Jeremy Kerr   2025-06-11  1402  
75626016e50cb9a Jeremy Kerr   2025-06-11  1403  		gatewayp->eid = gateway->eid;
75626016e50cb9a Jeremy Kerr   2025-06-11  1404  		gatewayp->net = gateway->net != MCTP_NET_ANY ?
75626016e50cb9a Jeremy Kerr   2025-06-11  1405  			gateway->net :
75626016e50cb9a Jeremy Kerr   2025-06-11  1406  			READ_ONCE(net->mctp.default_net);
75626016e50cb9a Jeremy Kerr   2025-06-11  1407  		*mdev = NULL;
75626016e50cb9a Jeremy Kerr   2025-06-11  1408  
75626016e50cb9a Jeremy Kerr   2025-06-11  1409  	} else {
75626016e50cb9a Jeremy Kerr   2025-06-11  1410  		NL_SET_ERR_MSG(extack, "no route output provided");
75626016e50cb9a Jeremy Kerr   2025-06-11  1411  		return -EINVAL;
75626016e50cb9a Jeremy Kerr   2025-06-11  1412  	}
75626016e50cb9a Jeremy Kerr   2025-06-11  1413  
75626016e50cb9a Jeremy Kerr   2025-06-11  1414  	*rtm = nlmsg_data(nlh);
75626016e50cb9a Jeremy Kerr   2025-06-11  1415  	if ((*rtm)->rtm_family != AF_MCTP) {
75626016e50cb9a Jeremy Kerr   2025-06-11  1416  		NL_SET_ERR_MSG(extack, "route family must be AF_MCTP");
75626016e50cb9a Jeremy Kerr   2025-06-11  1417  		return -EINVAL;
75626016e50cb9a Jeremy Kerr   2025-06-11  1418  	}
75626016e50cb9a Jeremy Kerr   2025-06-11  1419  
75626016e50cb9a Jeremy Kerr   2025-06-11  1420  	if ((*rtm)->rtm_type != RTN_UNICAST) {
75626016e50cb9a Jeremy Kerr   2025-06-11  1421  		NL_SET_ERR_MSG(extack, "rtm_type must be RTN_UNICAST");
75626016e50cb9a Jeremy Kerr   2025-06-11  1422  		return -EINVAL;
75626016e50cb9a Jeremy Kerr   2025-06-11  1423  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1424  
33d33bef994e518 Jeremy Kerr   2025-06-11  1425  	return 0;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1426  }
06d2f4c583a7d89 Matt Johnston 2021-07-29  1427  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
