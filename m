Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F0CD29E
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726453730; cv=none; b=PKir6MTG+T7Upeop35m327XCwpQRCTe1YTa/W06Yl5RzvGrR+GIOcdJNhjcL8eLJAFXiIYdulRmrMC+Gtu8LYphsBw4E4PWJRj/I8QufenSrscDb9Q4Wpfu90LVfDWuly/MqhGqrSFqf2/qHeEXoVz0H0UmY9vbbogao/i44XaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726453730; c=relaxed/simple;
	bh=qBMdGLqwIK++ceibzU20A8oGnNiEGzS1X52MZ8RFBEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/60SPYfV82+2KlJI0xs97IXVE+A6SEYcKtJ0kIP4RshB8HRqi/QxhoUcy7r1kV3SAIEKH3Pn7XILPNiHVH3rlmTJgfzS4iv4hmJC3sFW5B8ri6E9dX11CU6V5soAeFLgXTRl90OWY2ZJJV47F7By+W4oZqA54nqGavLVE3beos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHEgKFhc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHEgKFhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726453729; x=1757989729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBMdGLqwIK++ceibzU20A8oGnNiEGzS1X52MZ8RFBEA=;
  b=GHEgKFhc2d6RJujHia30Tl5gU6EXUSoHcuG5/9t7x3t471I3S5Mj7XPm
   2klpYLlveLCqmygYP+uef4svEgR3bl4BzbqlX8ah9eifnj8sfDgkNg6+q
   umQ+8RpN6wWVjK0Su9c2ExfYQTmTGc/T5zZMIWQw7IjFjZUhghXhS3FK7
   aRaVtr+y20I4QD70+rQxdNvsRBqAx1u+0aspO5nBkknCmfpvRFhnbPh6M
   AYmExHivZZ1bCb67DNQX62HnDWCYCJmdMXkOJ9jSfGm4wBV0deLnqNeo0
   JKQlDVskmzV3Eh/+ZhCaVpHlavmUV7eqj0ewMOBedSRbe4VzbPUxjkapL
   Q==;
X-CSE-ConnectionGUID: y1mdQkBpQj+Ue4xVAbLoHQ==
X-CSE-MsgGUID: KlyPBhAKTeabUEhQ8edS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25479128"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25479128"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 19:28:46 -0700
X-CSE-ConnectionGUID: WvkCw8d0TIuyolAGvPTMGw==
X-CSE-MsgGUID: f2RVu+gOTKC0PG+VqaLK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73335024"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2024 19:28:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq1Tm-0009FG-0n;
	Mon, 16 Sep 2024 02:28:42 +0000
Date: Mon, 16 Sep 2024 10:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next] net: ethtool: phy: Distinguish whether dev is
 got by phy start or doit
Message-ID: <202409161017.tjjHpXGT-lkp@intel.com>
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
In-Reply-To: <20240913080714.1809254-1-lizhi.xu@windriver.com>
References: <20240913080714.1809254-1-lizhi.xu@windriver.com>
TO: Lizhi Xu <lizhi.xu@windriver.com>
TO: syzbot+e9ed4e4368d450c8f9db@syzkaller.appspotmail.com
CC: christophe.leroy@csgroup.eu
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: linux-kernel@vger.kernel.org
CC: maxime.chevallier@bootlin.com
CC: netdev@vger.kernel.org
CC: pabeni@redhat.com
CC: syzkaller-bugs@googlegroups.com

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Xu/net-ethtool-phy-Distinguish-whether-dev-is-got-by-phy-start-or-doit/20240913-160835
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240913080714.1809254-1-lizhi.xu%40windriver.com
patch subject: [PATCH net-next] net: ethtool: phy: Distinguish whether dev is got by phy start or doit
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240916/202409161017.tjjHpXGT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409161017.tjjHpXGT-lkp@intel.com/

smatch warnings:
net/ethtool/phy.c:235 ethnl_phy_start() error: dereferencing freed memory 'ctx->phy_req_info'

vim +235 net/ethtool/phy.c

17194be4c8e1e8 Maxime Chevallier 2024-08-21  211  
17194be4c8e1e8 Maxime Chevallier 2024-08-21  212  int ethnl_phy_start(struct netlink_callback *cb)
17194be4c8e1e8 Maxime Chevallier 2024-08-21  213  {
17194be4c8e1e8 Maxime Chevallier 2024-08-21  214  	const struct genl_info *info = genl_info_dump(cb);
17194be4c8e1e8 Maxime Chevallier 2024-08-21  215  	struct ethnl_phy_dump_ctx *ctx = (void *)cb->ctx;
17194be4c8e1e8 Maxime Chevallier 2024-08-21  216  	int ret;
17194be4c8e1e8 Maxime Chevallier 2024-08-21  217  
17194be4c8e1e8 Maxime Chevallier 2024-08-21  218  	BUILD_BUG_ON(sizeof(*ctx) > sizeof(cb->ctx));
17194be4c8e1e8 Maxime Chevallier 2024-08-21  219  
17194be4c8e1e8 Maxime Chevallier 2024-08-21  220  	ctx->phy_req_info = kzalloc(sizeof(*ctx->phy_req_info), GFP_KERNEL);
17194be4c8e1e8 Maxime Chevallier 2024-08-21  221  	if (!ctx->phy_req_info)
17194be4c8e1e8 Maxime Chevallier 2024-08-21  222  		return -ENOMEM;
17194be4c8e1e8 Maxime Chevallier 2024-08-21  223  
17194be4c8e1e8 Maxime Chevallier 2024-08-21  224  	ret = ethnl_parse_header_dev_get(&ctx->phy_req_info->base,
17194be4c8e1e8 Maxime Chevallier 2024-08-21  225  					 info->attrs[ETHTOOL_A_PHY_HEADER],
17194be4c8e1e8 Maxime Chevallier 2024-08-21  226  					 sock_net(cb->skb->sk), cb->extack,
17194be4c8e1e8 Maxime Chevallier 2024-08-21  227  					 false);
17194be4c8e1e8 Maxime Chevallier 2024-08-21  228  	ctx->ifindex = 0;
17194be4c8e1e8 Maxime Chevallier 2024-08-21  229  	ctx->phy_index = 0;
355b18bd0d5516 Lizhi Xu          2024-09-13  230  	ctx->phy_req_info->dev_start_doit = 0;
17194be4c8e1e8 Maxime Chevallier 2024-08-21  231  
17194be4c8e1e8 Maxime Chevallier 2024-08-21  232  	if (ret)
17194be4c8e1e8 Maxime Chevallier 2024-08-21  233  		kfree(ctx->phy_req_info);
17194be4c8e1e8 Maxime Chevallier 2024-08-21  234  
355b18bd0d5516 Lizhi Xu          2024-09-13 @235  	if (ctx->phy_req_info->base.dev)
355b18bd0d5516 Lizhi Xu          2024-09-13  236  		ctx->phy_req_info->dev_start_doit = 1;
355b18bd0d5516 Lizhi Xu          2024-09-13  237  
17194be4c8e1e8 Maxime Chevallier 2024-08-21  238  	return ret;
17194be4c8e1e8 Maxime Chevallier 2024-08-21  239  }
17194be4c8e1e8 Maxime Chevallier 2024-08-21  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
