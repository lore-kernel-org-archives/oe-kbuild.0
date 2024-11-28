Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84A52F88
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785246; cv=none; b=sDN/tvrq6nMzPjCW4QMdjsXQn+y+StD0e/nQCu3lCQAIPVS1nsHjSOeo8VQHhrdUkzR100GNcbDcdAtsaM7yvOrCySuBpdp8+oNF1iFu7nc+G0rIgcOoFYdZXWuQaQT7pw/KorrXC0Xy1BB1L3GSpcGYcJ4jX3TJsxFHmM93u4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785246; c=relaxed/simple;
	bh=njTrsBaIY/qxDTFQ5c32yGajvuNt3W93LA/dah4BxKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIY6zR16pQr732ARI3GvTxn6z3ddvIyQWL4LSajxkWMkvIbsIiYZV60F9J+usO41reJ0K8Zxi0Whc3uG8OQqxK2jeMhrE+pCCP6h7zzEoJp1KA8umuy4UQFk38glEqLHXwAREOPIQEmHm8i7e6MYBcwXnXJRWngCUuD2J2cqC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xl/4j8+O; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xl/4j8+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732785245; x=1764321245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=njTrsBaIY/qxDTFQ5c32yGajvuNt3W93LA/dah4BxKE=;
  b=Xl/4j8+OL1oYdpkOG3nEsgp1FgQXrGUgAAz07o3ahB1qOKaCIYN11Au+
   2eKzJXgVQUKWnLvXY9A8o5zlnWHuReBXCtDNLMH4UFHSDO6kXgaqlfb12
   LuoVBHb6XG8vYSNvBXHv7NNxvuyQw/kLAO1tlEGVk2TmpsPs+0He3L134
   LTYlZwROdm8vkrh8SAeVGygL1+lHopaftbeLqTUApCpglbT32T0vGME30
   knSTK2ZpjPstC52iWelwrH7sV7tJRFFyUEKsUsyBgI7KX6X+LEzs9MGXQ
   MiuHZICiCcQxsYtpLfxHhe2LdTf954AbIQ2Bz7UVHh/N8NcL1f21jCYjS
   w==;
X-CSE-ConnectionGUID: sum2S/DiS9qpSbVOXp+WWA==
X-CSE-MsgGUID: QHNgvjrlRL2525WkQZxuDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33138382"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33138382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 01:14:05 -0800
X-CSE-ConnectionGUID: GvAWSVs6SAuyh7yNZ2n0Gw==
X-CSE-MsgGUID: 1PhPOynsQFC7YTxET7vLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92640750"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2024 01:14:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGab3-0009O2-0H;
	Thu, 28 Nov 2024 09:14:01 +0000
Date: Thu, 28 Nov 2024 17:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2466/2466] drivers/net/bonding/bond_sysctl.c:11
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 bond_broadcast_arp_or_nd_table[1]->procname
Message-ID: <202411281714.maceKRlx-lkp@intel.com>
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
TO: "openeuler-sync-bot" <openeuler.syncbot@gmail.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   48ec47c01c3800fd4419afd91af83e95ba9584d5
commit: 337eb92cdbafcc9ec159404e382d6254672948c2 [2466/2466] anolis: bond: broadcast ARP or ND messages to all slaves
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241128/202411281714.maceKRlx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411281714.maceKRlx-lkp@intel.com/

smatch warnings:
drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : bond_broadcast_arp_or_nd_table[1]->procname
drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : bond_broadcast_arp_or_nd_table[1]->proc_handler

vim +11 drivers/net/bonding/bond_sysctl.c

337eb92cdbafcc9 Tony Lu 2023-01-10  10  
337eb92cdbafcc9 Tony Lu 2023-01-10 @11  static struct ctl_table bond_broadcast_arp_or_nd_table[] = {
337eb92cdbafcc9 Tony Lu 2023-01-10  12  	{
337eb92cdbafcc9 Tony Lu 2023-01-10  13  		.procname	= "broadcast_arp_or_nd",
337eb92cdbafcc9 Tony Lu 2023-01-10  14  		.data		= &sysctl_bond_broadcast_arp_or_nd,
337eb92cdbafcc9 Tony Lu 2023-01-10  15  		.maxlen		= sizeof(int),
337eb92cdbafcc9 Tony Lu 2023-01-10  16  		.mode		= 0644,
337eb92cdbafcc9 Tony Lu 2023-01-10  17  		.proc_handler	= proc_dointvec,
337eb92cdbafcc9 Tony Lu 2023-01-10  18  	},
337eb92cdbafcc9 Tony Lu 2023-01-10  19  	{}
337eb92cdbafcc9 Tony Lu 2023-01-10  20  };
337eb92cdbafcc9 Tony Lu 2023-01-10  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
