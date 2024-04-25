Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C302421A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 04:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714019206; cv=none; b=swLnF5rzRD/UFhlub3KZCVnv6gRlj6KIjMx6imPQp+pp1IuwSg4kV6M58EZeSNNJvjTDuuUiEtWsAIL/VMZ8ePqHkjZaTKxAe7TtzBQNK0Qxom8frlXH+gLv04Yyc7oQ9jJ70wYIkOOw12zaioS+vryALb9dmW4RS6hxdd+jzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714019206; c=relaxed/simple;
	bh=p6r5zhW04tCHlhNOen1xRRlQ9N2Y/6tC3vFLHYMmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b94ozdFcY3QzaPzifA/ofUyCfSoGlmNFSd0J/MuAfyLdtnhY0brJoGpSuN0RE91kttUf/ze9ILJwmgUxZ20wIDZOMq8jBrTYCTSyrHHpEkluyCdEimFbGAq/vmZKGPiqqEiP4yeNx9Whg0MoCdYTiRcJbp0h6RaKOHfZz+vwBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2EAvTpr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2EAvTpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714019204; x=1745555204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6r5zhW04tCHlhNOen1xRRlQ9N2Y/6tC3vFLHYMmcV4=;
  b=F2EAvTprnkcXSjZvRbQBd3Ljo0NMO2XBHsuGdbD+wQEaW9AjbO9027k/
   r+Nt0Qxz2IlF3/t2cj8uDAopvyK4TNseFlLZoaVuRfrgH8E7xy1maC3yP
   itkWeMtsPMZZ3fIRF7aoqvuzks6mZcHHuJasB9hY8yYGvBqQf1+OJVVr4
   bfMmZCwS7KrCXfuWtnm6K6vYa8CiaMKfJuyeAJWu1PNUMqwB4h6nrNjXb
   PxdsaGyXIWi3umaCHHP49+dL8NKegBUr92a8ckKSe7BJolOV8pAOUNGr6
   L3+87fo4K08y22C4DoW1OqG0yvHgec7Ai1ZTnZPVgpBWP8ROSx+rmRoUL
   g==;
X-CSE-ConnectionGUID: RT2jocAcQLy3etAIiWbJfA==
X-CSE-MsgGUID: GI3dbdx4Ty2g3f8kXJV+qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35079428"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="35079428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 21:26:43 -0700
X-CSE-ConnectionGUID: jHPj3Q/pR4CEierOVYMwIg==
X-CSE-MsgGUID: 1l/h3AI8RZ2hRxCU/XB5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="24992512"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Apr 2024 21:26:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzqgx-0001wK-2K;
	Thu, 25 Apr 2024 04:26:39 +0000
Date: Thu, 25 Apr 2024 12:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 net-next 5/6] arp: Get dev after calling
 arp_req_(delete|set|get)().
Message-ID: <202404251215.QHgck00A-lkp@intel.com>
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
In-Reply-To: <20240422194755.4221-6-kuniyu@amazon.com>
References: <20240422194755.4221-6-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: David Ahern <dsahern@kernel.org>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/arp-Move-ATF_COM-setting-in-arp_req_set/20240423-035458
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240422194755.4221-6-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 5/6] arp: Get dev after calling arp_req_(delete|set|get)().
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240424 (https://download.01.org/0day-ci/archive/20240425/202404251215.QHgck00A-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404251215.QHgck00A-lkp@intel.com/

smatch warnings:
net/ipv4/arp.c:1242 arp_req_delete() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1242 net/ipv4/arp.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1234  
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1235  static int arp_req_delete(struct net *net, struct arpreq *r)
46479b432989d6 Pavel Emelyanov   2007-12-05  1236  {
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1237  	struct net_device *dev;
46479b432989d6 Pavel Emelyanov   2007-12-05  1238  	__be32 ip;
46479b432989d6 Pavel Emelyanov   2007-12-05  1239  
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1240  	dev = arp_req_dev(net, r);
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1241  	if (!IS_ERR(dev))
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22 @1242  		return PTR_ERR(dev);
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1243  
46479b432989d6 Pavel Emelyanov   2007-12-05  1244  	if (r->arp_flags & ATF_PUBL)
32e569b7277f13 Pavel Emelyanov   2007-12-16  1245  		return arp_req_delete_public(net, r, dev);
46479b432989d6 Pavel Emelyanov   2007-12-05  1246  
46479b432989d6 Pavel Emelyanov   2007-12-05  1247  	ip = ((struct sockaddr_in *)&r->arp_pa)->sin_addr.s_addr;
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1248  
0c51e12e218f20 Ido Schimmel      2022-02-19  1249  	return arp_invalidate(dev, ip, true);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1250  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
