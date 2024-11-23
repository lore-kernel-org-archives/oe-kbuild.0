Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5E817
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732334045; cv=none; b=r8nPV0G7rJIjHEfaw2BTWEWH9Ir7bl3r06fqbtPLngo2TMSR2QMoWCgpU0fosHVTIiWX37AaGuN3ff/kv8R7Aj9anK2N2tfN9PoRkuhPjygileIpvccsW921PPwzPl0H69ffpgqZmKydi4UIti/VS6PO98cg/bbN1Pv/GNhHOYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732334045; c=relaxed/simple;
	bh=7Vkug0dNvLuAMSoOAk3BH+QUAQC1GXnUnrq76gC8YvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFjkVIPZ6dtiKrY7AkNj13iC+vOM6chWDnTwR6W0Ls0//4oKmSQNjmGRs5VY1pp3pogkNjSmd9+HpMuN0CEkH6qhmlai+f+SIAd24L/D/45k9WaDBg+4/C4IxEqsBniXwXvMwcIl0W0EvjyykWfJAOcUlq9oBvkpfnswwfYM/DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZeLZEPA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZeLZEPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732334043; x=1763870043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Vkug0dNvLuAMSoOAk3BH+QUAQC1GXnUnrq76gC8YvQ=;
  b=nZeLZEPA8JoiWgoOZNFmw3L1zPVI9AAJp2bNNx61CDwHq2v6k8u55Ks1
   DSfmGutC0vdP1mTle6VziAumHLtfGjxoxzevdw7nX9jjxlcBWlW5H0gaM
   9b4blfCi7q8pcYNv0mKMenA6jmOfXd1UDTwCyZc/EGgEWPBVyjGJVYyQB
   R2pStZQ3QAqR6ne9S87bGYiFKLbTij+NAjHFzxuRcQDb65/B5E5cCz9Xr
   cMUUeCh/b8P56baEBDZ+hXIpPL2pWhEX2i12NeCXXLYQ0l0DOnWQEFvTj
   wj8j5er/0iLvy3E8cBvPd2cu4/kxHDRIo8vuUd7fiSvydkTvzuPHpYmrd
   Q==;
X-CSE-ConnectionGUID: msdxT0cGTvSGiyQJDgfqEg==
X-CSE-MsgGUID: bHVt0BgBSmSNKAQZTwPfGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43115661"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="43115661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 19:54:02 -0800
X-CSE-ConnectionGUID: DSJ5pzMkRAeZ0yhm0ZK5YA==
X-CSE-MsgGUID: osq5RccZShyh5RSy5iJUSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="128251245"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2024 19:54:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhDb-0004P1-0N;
	Sat, 23 Nov 2024 03:53:59 +0000
Date: Sat, 23 Nov 2024 11:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2466/2466] drivers/net/ipvlan/ipvlan_main.c:14
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 ipvlan_table[2]->procname
Message-ID: <202411231144.WIYIO1tv-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   812485619c8bb60a69ba8b132dca7b435e9c74ed
commit: bf16c102ee819442bb1a2248da1c0d9d7cec34d6 [2466/2466] ipvlan: Introduce local xmit queue for l2e mode
:::::: branch date: 25 hours ago
:::::: commit date: 2 years, 11 months ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231144.WIYIO1tv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411231144.WIYIO1tv-lkp@intel.com/

smatch warnings:
drivers/net/ipvlan/ipvlan_main.c:14 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : ipvlan_table[2]->procname
drivers/net/ipvlan/ipvlan_main.c:14 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ipvlan_table[2]->proc_handler

vim +14 drivers/net/ipvlan/ipvlan_main.c

bd73acb1ae5abc Keefe LIU 2021-12-27  12  
bf16c102ee8194 Keefe LIU 2021-12-27  13  static struct ctl_table_header *ipvlan_table_hrd;
bf16c102ee8194 Keefe LIU 2021-12-27 @14  static struct ctl_table ipvlan_table[] = {
bf16c102ee8194 Keefe LIU 2021-12-27  15  	{
bf16c102ee8194 Keefe LIU 2021-12-27  16  		.procname       = "loop_delay",
bf16c102ee8194 Keefe LIU 2021-12-27  17  		.data           = &sysctl_ipvlan_loop_delay,
bf16c102ee8194 Keefe LIU 2021-12-27  18  		.maxlen         = sizeof(int),
bf16c102ee8194 Keefe LIU 2021-12-27  19  		.mode           = 0644,
bf16c102ee8194 Keefe LIU 2021-12-27  20  		.proc_handler   = proc_dointvec,
bf16c102ee8194 Keefe LIU 2021-12-27  21  	},
bf16c102ee8194 Keefe LIU 2021-12-27  22  	{
bf16c102ee8194 Keefe LIU 2021-12-27  23  		.procname       = "loop_qlen",
bf16c102ee8194 Keefe LIU 2021-12-27  24  		.data           = &sysctl_ipvlan_loop_qlen,
bf16c102ee8194 Keefe LIU 2021-12-27  25  		.maxlen         = sizeof(int),
bf16c102ee8194 Keefe LIU 2021-12-27  26  		.mode           = 0644,
bf16c102ee8194 Keefe LIU 2021-12-27  27  		.proc_handler   = proc_dointvec,
bf16c102ee8194 Keefe LIU 2021-12-27  28  	},
bf16c102ee8194 Keefe LIU 2021-12-27  29  	{ }
bf16c102ee8194 Keefe LIU 2021-12-27  30  };
bf16c102ee8194 Keefe LIU 2021-12-27  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
