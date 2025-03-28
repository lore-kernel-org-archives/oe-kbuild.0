Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056F3C0C
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171505; cv=none; b=rWzaHsr/GVj7M6eNPFE/lryTgNVs5tDcquznyUCfOzGu48JWnbczHT7lEJKcaYlgM3M5gbJq6HTFmj3xc/lWlyEpwG3EqM9vbQy1/0Yr/a4av6wK2jSmIqrbuaxyOVpX1qd06lER3FdrtOHRnDeuEFL+MjOJHnUR1LGgy3FaAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171505; c=relaxed/simple;
	bh=WE9cH6XLOXe7/v5/2j4vAYQk7tTAoUjjU89ggHoyEt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9C79WQoMjuwGYQG5ssZxY3gb1VKJZSSMIHGzYFWJNY/hmzzG9PrJBZfUGAmAY3fRuZsOmV3R61H9/BXlZI/s3EaKPOAgKfhm4ss+e74RfHuTUr02a6HZxBOmyupDawyKD+FTMkxdwv6pz5iXPOK1bk8KPgHYG42PwCT2HDUmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtTDmDTT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtTDmDTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743171504; x=1774707504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WE9cH6XLOXe7/v5/2j4vAYQk7tTAoUjjU89ggHoyEt8=;
  b=PtTDmDTTbDIWOiwA1wvJOF7tkaakAK2UzQlc+A1tIsHf+cTWBMVQ9RFp
   X7OF2bKc0mw5YuFzSWP8ihUKHNCBSupVHLMhUuU7dLbobbAP8zx9d1F2R
   2EEve62Zmg403eydIB75TvZlqwlQa5DBbN2DAof0pYjwD551IPIAbfoCm
   Y1JOZ9VuyEANIwowAr2Ony+98xRfe3OpHkirjmLCGV5Xy66CpV4RPKgX2
   nXc3IVw857lvE01Gs3EXEpPO2EkVnZv2/Xyj6TOZ3Eb7+WiByBl55eivh
   Y7vmD5kImT5ChdFFmIkuFkUUgOR8trZ4fUHKlPnXh5C7+kOe3ea05xKaj
   A==;
X-CSE-ConnectionGUID: YnXNvwhwR/ylfeHtplLXmA==
X-CSE-MsgGUID: glZAUycLR5CuQGXUpj/S1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55908069"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55908069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:18:23 -0700
X-CSE-ConnectionGUID: 8KI/hWCsR9uN4WBlfQXk/g==
X-CSE-MsgGUID: MTHCAGqCRn6LjUPlvVLvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126270771"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Mar 2025 07:18:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyAXE-0007UI-0V;
	Fri, 28 Mar 2025 14:18:12 +0000
Date: Fri, 28 Mar 2025 22:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 net-next 10/13] ipv6: Factorise
 ip6_route_multipath_add().
Message-ID: <202503282150.4vc017y0-lkp@intel.com>
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
In-Reply-To: <20250321040131.21057-11-kuniyu@amazon.com>
References: <20250321040131.21057-11-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: David Ahern <dsahern@kernel.org>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/ipv6-Validate-RTA_GATEWAY-of-RTA_MULTIPATH-in-rtm_to_fib6_config/20250321-120836
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250321040131.21057-11-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 10/13] ipv6: Factorise ip6_route_multipath_add().
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20250328 (https://download.01.org/0day-ci/archive/20250328/202503282150.4vc017y0-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503282150.4vc017y0-lkp@intel.com/

New smatch warnings:
net/ipv6/route.c:5405 ip6_route_mpath_info_create_nh() error: uninitialized symbol 'err'.

Old smatch warnings:
net/ipv6/route.c:3427 ip6_route_check_nh() error: we previously assumed '_dev' could be null (see line 3387)
net/ipv6/route.c:5873 rt6_fill_node() error: we previously assumed 'dst' could be null (see line 5858)

vim +/err +5405 net/ipv6/route.c

f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5374  
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5375  static int ip6_route_mpath_info_create_nh(struct list_head *rt6_nh_list,
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5376  					  struct netlink_ext_ack *extack)
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5377  {
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5378  	struct rt6_nh *nh, *nh_next, *nh_tmp;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5379  	LIST_HEAD(tmp);
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5380  	int err;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5381  
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5382  	list_for_each_entry_safe(nh, nh_next, rt6_nh_list, next) {
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5383  		struct fib6_info *rt = nh->fib6_info;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5384  
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5385  		err = ip6_route_info_create_nh(rt, &nh->r_cfg, extack);
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5386  		if (err) {
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5387  			nh->fib6_info = NULL;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5388  			goto err;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5389  		}
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5390  
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5391  		rt->fib6_nh->fib_nh_weight = nh->weight;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5392  
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5393  		list_move_tail(&nh->next, &tmp);
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5394  
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5395  		list_for_each_entry(nh_tmp, rt6_nh_list, next) {
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5396  			/* check if fib6_info already exists */
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5397  			if (rt6_duplicate_nexthop(nh_tmp->fib6_info, rt)) {
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5398  				err = -EEXIST;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5399  				goto err;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5400  			}
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5401  		}
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5402  	}
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5403  out:
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5404  	list_splice(&tmp, rt6_nh_list);
f7d850c5de621f Kuniyuki Iwashima 2025-03-20 @5405  	return err;
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5406  err:
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5407  	ip6_route_mpath_info_cleanup(rt6_nh_list);
f7d850c5de621f Kuniyuki Iwashima 2025-03-20  5408  	goto out;
6b9ea5a64ed5ee Roopa Prabhu      2015-09-08  5409  }
6b9ea5a64ed5ee Roopa Prabhu      2015-09-08  5410  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
