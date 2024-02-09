Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B80846D
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707470062; cv=none; b=syLYIWfl7BYsBm/qjbe1xy4ffMW7aRiSMBlMYL2LkKWIQHSoyuQrag12lRgX5qom9q7b2/9bcunrBGuWNp12vUw6sWWSuerzlzpKVisAuQIlWbsEGyMuqTq8wAVeEhgbVJNcVlkhAjTIP4zLWb5VAtw5Sum+FMyefEAYXLrwp94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707470062; c=relaxed/simple;
	bh=w9wdhwTZ09elsDd1ZOUtUp48m9bJSgADdD2/TPgySS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSGzbbyP6+s7E5sMoB6aunJmL7RBJGDTk692sJpQNN3t/m2EANsZ1B5dtVdDgt8deZQHxKr03T2Q1gVh0p0kxM/bQXXUQvwDSvCLz0v2iWoxDqeQFnvjpDJOc0bVQVA8Owv6O0jx1UwfghHiyKB0YZbvAq1sFUfVZgi+HDdO+4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvlSXz63; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvlSXz63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707470061; x=1739006061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9wdhwTZ09elsDd1ZOUtUp48m9bJSgADdD2/TPgySS4=;
  b=WvlSXz63dtFpFPJ8IMwKl1baWwwVBNpoU3Z9kh6LhUAoWrMDWiUr55zC
   9rNdStj0Di1wqLEC7avwbI9zpb3Wb4CnB/mO4s4fkcnDjjPkB3+QX1fA8
   feCYShuu2XtlWGTw530l8M6IGHzDoYyvj+bcE43BGJ3JnywBdPwnK7A/J
   0Pefnf8PPVU5o/E1MX2X38VuuQOXKdJthJmPHarwJWOT2zJdiy2UyHHmP
   /Tawpn2Cmum9RtLeA2P8HBrr57kI+0xE9lYcV9AStPA76/Jq8117Wa/RP
   Oa5EwbEiRDxkDXg1rQUlWO1x67If4AVMflfZudX7+aiJWMcbLZPuWDrnY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1290608"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1290608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 01:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1894994"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2024 01:14:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYMxc-0004Yo-20;
	Fri, 09 Feb 2024 09:14:16 +0000
Date: Fri, 9 Feb 2024 17:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ipvlan/ipvlan_main.c:155:3-10: WARNING: NULL check
 before dev_{put, hold} functions is not needed.
Message-ID: <202402091724.P9nqC44y-lkp@intel.com>
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
TO: Matteo Croce <mcroce@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f719a2f3fa67665578c759ac34fd3d3690c1a20
commit: 94333fac44d1da19ebdf41704780c1af3cabea61 ipvlan: drop ipv6 dependency
date:   6 years ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-102-20240208 (https://download.01.org/0day-ci/archive/20240209/202402091724.P9nqC44y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402091724.P9nqC44y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ipvlan/ipvlan_main.c:155:3-10: WARNING: NULL check before dev_{put, hold} functions is not needed.
--
>> drivers/net/tap.c:428:15-16: WARNING opportunity for min()

vim +155 drivers/net/ipvlan/ipvlan_main.c

2ad7bf3638411c Mahesh Bandewar  2014-11-23  139  
2ad7bf3638411c Mahesh Bandewar  2014-11-23  140  static void ipvlan_port_destroy(struct net_device *dev)
2ad7bf3638411c Mahesh Bandewar  2014-11-23  141  {
2ad7bf3638411c Mahesh Bandewar  2014-11-23  142  	struct ipvl_port *port = ipvlan_port_get_rtnl(dev);
b1227d019fa98c Eric Dumazet     2016-12-21  143  	struct sk_buff *skb;
2ad7bf3638411c Mahesh Bandewar  2014-11-23  144  
2ad7bf3638411c Mahesh Bandewar  2014-11-23  145  	dev->priv_flags &= ~IFF_IPVLAN_MASTER;
4fbae7d83c98c3 Mahesh Bandewar  2016-09-16  146  	if (port->mode == IPVLAN_MODE_L3S) {
4fbae7d83c98c3 Mahesh Bandewar  2016-09-16  147  		dev->priv_flags &= ~IFF_L3MDEV_MASTER;
3133822f5ac13b Florian Westphal 2017-04-20  148  		ipvlan_unregister_nf_hook(dev_net(dev));
4fbae7d83c98c3 Mahesh Bandewar  2016-09-16  149  		dev->l3mdev_ops = NULL;
4fbae7d83c98c3 Mahesh Bandewar  2016-09-16  150  	}
2ad7bf3638411c Mahesh Bandewar  2014-11-23  151  	netdev_rx_handler_unregister(dev);
ba35f8588f474d Mahesh Bandewar  2015-05-04  152  	cancel_work_sync(&port->wq);
b1227d019fa98c Eric Dumazet     2016-12-21  153  	while ((skb = __skb_dequeue(&port->backlog)) != NULL) {
b1227d019fa98c Eric Dumazet     2016-12-21  154  		if (skb->dev)
b1227d019fa98c Eric Dumazet     2016-12-21 @155  			dev_put(skb->dev);
b1227d019fa98c Eric Dumazet     2016-12-21  156  		kfree_skb(skb);
b1227d019fa98c Eric Dumazet     2016-12-21  157  	}
009146d117b9b8 Mahesh Bandewar  2017-01-03  158  	ida_destroy(&port->ida);
48140a210b450d Gao Feng         2016-12-07  159  	kfree(port);
2ad7bf3638411c Mahesh Bandewar  2014-11-23  160  }
2ad7bf3638411c Mahesh Bandewar  2014-11-23  161  

:::::: The code at line 155 was first introduced by commit
:::::: b1227d019fa98c43381ad8827baf7efbe2923ed1 ipvlan: fix various issues in ipvlan_process_multicast()

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
