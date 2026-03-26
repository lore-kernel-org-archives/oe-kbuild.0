Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8033BBBD
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535676; cv=none; b=hgVfk1wPhvRAUnJKSseM2fXlrWL4A2HnBK3JuuhOb7bEivmZNkMcq2Ba7Njl8K0pCW2w7vQVXKCFmCOK/dqWsY/U9ZlCUHGO7AGKLS1EtsvPg/UCSWAmm8h6ZtQ2pmcC2duRNP3jmBSKMve2UewLa+Za3k+JClFMu4B5j+tkPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535676; c=relaxed/simple;
	bh=aYW5EXUt1q1BFq4O4EeNn8CeQHjqDOfcV6Lk++YTlmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZPbh3PBMAYsTwmSTEGLp5HJZr83lg7fHe89FcyMrUZInw8BBcEHDYEM6LY/N+5fKrUpHvPEuiG6PClRzhZHdKqGB8iS9eoyPnAsMEvGuPWxQ+Kiu1P3LtOsBhH7CwvoR3qy7bRrcGEDokEfvF2ctwwV0C0WR9fDMCWaLc1INpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtHi3wsA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtHi3wsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774535673; x=1806071673;
  h=date:from:to:cc:subject:message-id;
  bh=aYW5EXUt1q1BFq4O4EeNn8CeQHjqDOfcV6Lk++YTlmY=;
  b=CtHi3wsAmEMbQwbxyw5GMOEX8hyvJysrQzKl4xdCv6jVm9B8Pq2ziXi5
   ascx++AYWkbwudrBxRZ98Hj7AKVhECXVYD0cLmsf3J/oXM1k52/Ivk8LA
   ZzW/hXxQY9EEuvrsatn2DKpjfqHg9GDciWTeZYnF7kGpDMQBxU02DQr5G
   BrvIJ9Y1y/GqiHBsi371fIucVKHKCN1UkmCKU7M6OT7Gj2Bx+q9DB8L9O
   7xeSpZQCLEAIDnDd050ltLZtm6ezl9M8ztrbWpbGGmWfatOGx2nq6wgru
   ZckX9qitQ9wasnDHxPphGTXv88dJkumn68bplK++q7U4yptQ6305k3oHO
   g==;
X-CSE-ConnectionGUID: XBLmpFoRSUKz4OaArEZVog==
X-CSE-MsgGUID: 1aEkIbX/R56j1nY+FC9t5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="92978658"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="92978658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 07:34:32 -0700
X-CSE-ConnectionGUID: JEFTxAzgR+y0MNdK4Mqdbg==
X-CSE-MsgGUID: yk5QMZhvRlS54WfGpfbOUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="226654382"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 07:34:30 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ln1-000000008vh-3osH;
	Thu, 26 Mar 2026 14:34:27 +0000
Date: Thu, 26 Mar 2026 22:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6519/9273]
 drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn:
 subtract is higher precedence than shift
Message-ID: <202603262225.ctC5Z0rj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66ba480978ce390e631e870b740a3406e3eb6b01
commit: f44218cd5e6a3d98b137344b808ee154117ce765 [6519/9273] net: airoha: Reset PPE cpu port configuration in airoha_ppe_hw_init()
:::::: branch date: 20 hours ago
:::::: commit date: 6 days ago
config: sparc-randconfig-r071-20260326 (https://download.01.org/0day-ci/archive/20260326/202603262225.ctC5Z0rj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603262225.ctC5Z0rj-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift

vim +97 drivers/net/ethernet/airoha/airoha_ppe.c

00a7678310fe3d Lorenzo Bianconi 2025-02-28   87  
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   88  void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id)
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   89  {
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   90  	struct airoha_qdma *qdma = port->qdma;
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   91  	u8 fport = airoha_get_fe_port(port);
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   92  	struct airoha_eth *eth = qdma->eth;
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   93  	u8 qdma_id = qdma - &eth->qdma[0];
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   94  	u32 fe_cpu_port;
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   95  
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   96  	fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17  @97  	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT(ppe_id, fport),
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   98  		      DFT_CPORT_MASK(fport),
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17   99  		      __field_prep(DFT_CPORT_MASK(fport), fe_cpu_port));
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17  100  }
f44218cd5e6a3d Lorenzo Bianconi 2026-03-17  101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
