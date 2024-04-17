Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064E1487D6
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713369653; cv=none; b=GSyrYPz45bXzmpJXdX5n7RQjXX/d0ydg7duB20zWQdFPFCyTvi2jSCw7PDcT0RbCu1FhKnNRoZHstTz8upLAOEXP29q186LZx2mX+wussQyh9HewgfMoDXxDEK4WsDwvoajLVMxrAmkUDl1/tKQ/zwsY+eNsUMrOunyQc6yiJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713369653; c=relaxed/simple;
	bh=Gw6Ka9wyga7Q0jkpdEvffRjjOdiLxGJD+vEL7lJEQDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3qPKLt2g3GOssQIT57lz0sSOSKm+9AG5kP2/R8H8fxA/oEKA5WEwgb7z8KLLri2b9KrCB/Zh7sEvKy/qECLXjnkNhVwxR4FziLRwiE1UMpwYrJxNzmx+WBj00aHBQ83+z8bBugFkBRlqw+e9rhVb/Fzh+EClUer2ab7IQMw90c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgeK5Th3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgeK5Th3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713369648; x=1744905648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gw6Ka9wyga7Q0jkpdEvffRjjOdiLxGJD+vEL7lJEQDg=;
  b=HgeK5Th3RP/zNZqbmLrR04Gj6/r2zKUItZQ8DZjYDZYTgScmj4tihR9p
   kZ3Rq/3yjuDNRp4H+CsCYXEVrVnRGiyFSDNO0q7pgxlyyXQ1uy7J1zuMY
   PaPV6i4EsQGf/4iYsXPoc0ILPO+GKTnbHPcgEpetNTx0Wei+Wd/t6mh6L
   pNY8vUvp/2Gdm6SivQChoMkN887Jz6MugT1JfWExbsNZik+6gx+xYteqP
   MRo6N+h8UcOA+qiPSGY5JpQWmBoE4it+eY5Orikg98aWRbtsdiS80mDl2
   suAFPoYWY2z3F1pB+ZU6I1vcOkS1a55rMvpB0QXAiKPrt/1U4867n/i9q
   w==;
X-CSE-ConnectionGUID: YZBYyuRXTMacAzJI2KkKuw==
X-CSE-MsgGUID: JVnfaGrZSRKssqjvYxue4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12652694"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="12652694"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 09:00:48 -0700
X-CSE-ConnectionGUID: QQuwfppKQkmlM61ivcy3cg==
X-CSE-MsgGUID: hXNo/BVGRHOtSR7CBDVhkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="23261668"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 09:00:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx7iG-0006kc-25;
	Wed, 17 Apr 2024 16:00:44 +0000
Date: Thu, 18 Apr 2024 00:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next PATCH 5/9] octeontx2-af: Add packet path between
 representor and VF
Message-ID: <202404172319.ys4PQfP0-lkp@intel.com>
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
In-Reply-To: <20240416050616.6056-6-gakula@marvell.com>
References: <20240416050616.6056-6-gakula@marvell.com>
TO: Geetha sowjanya <gakula@marvell.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: kuba@kernel.org
CC: davem@davemloft.net
CC: pabeni@redhat.com
CC: edumazet@google.com
CC: sgoutham@marvell.com
CC: gakula@marvell.com
CC: sbhatta@marvell.com
CC: hkelam@marvell.com

Hi Geetha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Geetha-sowjanya/octeontx2-pf-Refactoring-RVU-driver/20240416-131052
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240416050616.6056-6-gakula%40marvell.com
patch subject: [net-next PATCH 5/9] octeontx2-af: Add packet path between representor and VF
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: alpha-randconfig-r081-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172319.ys4PQfP0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404172319.ys4PQfP0-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c:23 rvu_rep_get_vlan_id() warn: signedness bug returning '(-19)'

vim +23 drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c

1e15129a77b419 Geetha sowjanya 2024-04-16  15  
5c25d7a685d906 Geetha sowjanya 2024-04-16  16  static u16 rvu_rep_get_vlan_id(struct rvu *rvu, u16 pcifunc)
5c25d7a685d906 Geetha sowjanya 2024-04-16  17  {
5c25d7a685d906 Geetha sowjanya 2024-04-16  18  	int id;
5c25d7a685d906 Geetha sowjanya 2024-04-16  19  
5c25d7a685d906 Geetha sowjanya 2024-04-16  20  	for (id = 0; id < rvu->rep_cnt; id++)
5c25d7a685d906 Geetha sowjanya 2024-04-16  21  		if (rvu->rep2pfvf_map[id] == pcifunc)
5c25d7a685d906 Geetha sowjanya 2024-04-16  22  			return id;
5c25d7a685d906 Geetha sowjanya 2024-04-16 @23  	return -ENODEV;
5c25d7a685d906 Geetha sowjanya 2024-04-16  24  }
5c25d7a685d906 Geetha sowjanya 2024-04-16  25  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
