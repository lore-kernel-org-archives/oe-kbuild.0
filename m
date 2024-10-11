Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08D20B1F3
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Oct 2024 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638410; cv=none; b=jiteoz5tQh4TjFJnZ+9ZOiiaKHtRZjUCCwXIM/U3zyF0E31rQ/yifFaDm+VfJ6wXK79Cebr2pV3UBVMwmw1hlnoGgBEyB6WeYofmZoatbTG8W2CgU5Ng1A6WdSf32bteT0yCHGUw+Sir4MhNmmVRGANTboHl3BpLkzcEt+UPeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638410; c=relaxed/simple;
	bh=ZlPiTs6hL8EC99/FOIukAzAS0ZWMUn1BNU3vOxz+Jik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Azi8HaUlWCVLpGBoftop61O91ZEgZmwnwXHb0xTEJAavikTMWO820CURxSaD8AhKBzaxy0G+Wb8EAoa8HoaENuyRThRHRGvc8Z9DigYFpSKlU+kepceDlNqDnqHZPtTVeHk4b+mjY1gd32Nau+ra34aIF0nwqZAtf/Vr5ESOSY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWmGBUAP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWmGBUAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728638408; x=1760174408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlPiTs6hL8EC99/FOIukAzAS0ZWMUn1BNU3vOxz+Jik=;
  b=NWmGBUAPzTUOBTWQ3hKd8sGDvYNLr4kZtll3nsK0yoaFGEBxwdgprMsR
   FBF4XgbJZV5bong0O+vNtvQedZXJg6VNTPjk32EZhfiYyN/FTEEVI3Ng2
   cDaJ7Q2pKTXlz9FYHqwzwjv2R+Vf3yGnjAe7pQNAbseoe3KQtZckivwEv
   OObge8TUxbm+tf0jIY0O7xy0Kyap3atsek+/eHMieBKPcNUWX54v7rlAJ
   OcityziON7dNr5fvNb7KOIx+LKgW3V76ITDF0ib6qwc6qgAbnx+AdrbUv
   hhMLAmIODzEYfq62vITwZtR1H3NJ8w9B2yr2+D0FDNuJlX/SUCzczBnOI
   w==;
X-CSE-ConnectionGUID: ledqPdqvSoWrlTYm7WCuFQ==
X-CSE-MsgGUID: SvDau4PuQJmiudoz7jjaAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28161419"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="28161419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 02:20:08 -0700
X-CSE-ConnectionGUID: oS4FO7xwTF61nvIa+/brdQ==
X-CSE-MsgGUID: J01q2Iv0Reelm/pIweYePA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76771414"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Oct 2024 02:20:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szBoa-000C6r-2H;
	Fri, 11 Oct 2024 09:20:04 +0000
Date: Fri, 11 Oct 2024 17:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 net-next 12/13] rtnetlink: Call
 rtnl_link_get_net_capable() in do_setlink().
Message-ID: <202410111738.8ypqnr3c-lkp@intel.com>
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
In-Reply-To: <20241009231656.57830-13-kuniyu@amazon.com>
References: <20241009231656.57830-13-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/rtnetlink-Allocate-linkinfo-as-struct-rtnl_newlink_tbs/20241010-072158
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241009231656.57830-13-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 12/13] rtnetlink: Call rtnl_link_get_net_capable() in do_setlink().
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111738.8ypqnr3c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410111738.8ypqnr3c-lkp@intel.com/

smatch warnings:
net/core/rtnetlink.c:3301 rtnl_setlink() error: uninitialized symbol 'tgt_net'.

vim +/tgt_net +3301 net/core/rtnetlink.c

cc6090e985d7d6 Jiri Pirko        2019-09-30  3264  
c21ef3e343ae91 David Ahern       2017-04-16  3265  static int rtnl_setlink(struct sk_buff *skb, struct nlmsghdr *nlh,
c21ef3e343ae91 David Ahern       2017-04-16  3266  			struct netlink_ext_ack *extack)
0157f60c0caea2 Patrick McHardy   2007-06-13  3267  {
3a6cb17da69fbf Kuniyuki Iwashima 2024-10-09  3268  	struct ifinfomsg *ifm = nlmsg_data(nlh);
3b1e0a655f8eba YOSHIFUJI Hideaki 2008-03-26  3269  	struct net *net = sock_net(skb->sk);
0157f60c0caea2 Patrick McHardy   2007-06-13  3270  	struct nlattr *tb[IFLA_MAX+1];
3a6cb17da69fbf Kuniyuki Iwashima 2024-10-09  3271  	struct net_device *dev = NULL;
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3272  	struct net *tgt_net;
3a6cb17da69fbf Kuniyuki Iwashima 2024-10-09  3273  	int err;
0157f60c0caea2 Patrick McHardy   2007-06-13  3274  
8cb081746c031f Johannes Berg     2019-04-26  3275  	err = nlmsg_parse_deprecated(nlh, sizeof(*ifm), tb, IFLA_MAX,
8cb081746c031f Johannes Berg     2019-04-26  3276  				     ifla_policy, extack);
0157f60c0caea2 Patrick McHardy   2007-06-13  3277  	if (err < 0)
0157f60c0caea2 Patrick McHardy   2007-06-13  3278  		goto errout;
0157f60c0caea2 Patrick McHardy   2007-06-13  3279  
4ff66cae7f10b6 Christian Brauner 2018-02-07  3280  	err = rtnl_ensure_unique_netns(tb, extack, false);
4ff66cae7f10b6 Christian Brauner 2018-02-07  3281  	if (err < 0)
4ff66cae7f10b6 Christian Brauner 2018-02-07  3282  		goto errout;
4ff66cae7f10b6 Christian Brauner 2018-02-07  3283  
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3284  	tgt_net = rtnl_link_get_net_capable(skb, net, tb, CAP_NET_ADMIN);
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3285  	if (IS_ERR(tgt_net))
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3286  		return PTR_ERR(tgt_net);
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3287  
0157f60c0caea2 Patrick McHardy   2007-06-13  3288  	if (ifm->ifi_index > 0)
a3d1289126e7b1 Eric Dumazet      2009-10-21  3289  		dev = __dev_get_by_index(net, ifm->ifi_index);
76c9ac0ee878f6 Jiri Pirko        2019-09-30  3290  	else if (tb[IFLA_IFNAME] || tb[IFLA_ALT_IFNAME])
5ea08b5286f66e Florent Fourcot   2022-04-15  3291  		dev = rtnl_dev_get(net, tb);
0157f60c0caea2 Patrick McHardy   2007-06-13  3292  	else
3a6cb17da69fbf Kuniyuki Iwashima 2024-10-09  3293  		err = -EINVAL;
0157f60c0caea2 Patrick McHardy   2007-06-13  3294  
3a6cb17da69fbf Kuniyuki Iwashima 2024-10-09  3295  	if (dev)
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3296  		err = do_setlink(skb, dev, tgt_net, ifm, extack, tb, 0);
3a6cb17da69fbf Kuniyuki Iwashima 2024-10-09  3297  	else if (!err)
0157f60c0caea2 Patrick McHardy   2007-06-13  3298  		err = -ENODEV;
0157f60c0caea2 Patrick McHardy   2007-06-13  3299  
da5e0494c542dd Thomas Graf       2006-08-10  3300  errout:
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09 @3301  	put_net(tgt_net);
b27f78e2575aa2 Kuniyuki Iwashima 2024-10-09  3302  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3303  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3304  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3305  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
