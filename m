Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757413D60E
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Aug 2024 04:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724991594; cv=none; b=EaeA5T5V+R96vB4JdY/N/GT20ocpkhMllCjpvrOdHRGs3fV3EUxcXUZm5JccG/NaYjbXd2Z1HFHkehaJSpWR1WyE5lJZoG2ZuKqnU2fWUuCV2i/Ca2vMPu/YtUslJVtZIKPo8lMmBqkvlGBvGygiVn4sxsvwgZPA8qB6BAkZra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724991594; c=relaxed/simple;
	bh=wymSKxFzAPe0O8CPUIb12HnNiFaDBJeSNfDVwkxBDVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcGrSRPPtOt7Zm2yLFL3lgoKlFBfzDaRCr3GHPyQNW8ATxpuAdzttYIFyNH0Jnu132aFLh6eXppTBSGk7xDhd763l45LI0JQnOGsIOy3zCmGEqU1GSe4cwyZe1edgfJ2vLMXmC4kEadzLpL6FAe/SEZYPR8Q4Rhc7w9IDZWhp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvCnD5VZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvCnD5VZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724991592; x=1756527592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wymSKxFzAPe0O8CPUIb12HnNiFaDBJeSNfDVwkxBDVU=;
  b=EvCnD5VZnQsklvXhev75Cg58AjRYjyzmRy+vgXtmRnIhyzdBupUf2VMK
   mIy97VG8ZGvdKcZJJBE3aq+tZ2msIh4Gm5BDp00XZcGWA10iDthZ3gzKb
   qlQQNHZDP34hiTXJTofSTwN+BpbaEJVpTD2AB13h6UUCmHrl2c5q5l+wL
   qaSCOPcDEWEISrvr9MwmvQgCYlmKuPjtSGV4JGvbjThmmQbmtJOLpRpNU
   aSCewnKH4QPLe3pVAdyxenNDLsi2py2w3CM8g5+cwqG5cng5EpIn7WtA7
   DUZv9+tljiEiQFqXkB+mRTHgV9fOQOX8ynRRL5ZlVkJ+hAqTjlNBzGjwJ
   A==;
X-CSE-ConnectionGUID: /tE5fFx9R9mqYs7OJBOR+g==
X-CSE-MsgGUID: c3QLVO9SRwC61YiYXPSgbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34236780"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="34236780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 21:19:52 -0700
X-CSE-ConnectionGUID: xXZxWkeSRBeIfCKD25SlLg==
X-CSE-MsgGUID: dn4RfimfTPaQKPwzPRVBMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="64289144"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Aug 2024 21:19:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjt6y-000122-1L;
	Fri, 30 Aug 2024 04:19:48 +0000
Date: Fri, 30 Aug 2024 12:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 5051/30000] arch/x86/lib/copy_highpages.c:41
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 copy_highpages_table[1]->procname
Message-ID: <202408301209.L0mF1vFY-lkp@intel.com>
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
head:   25aa773a110df8d11de2dd52de7a7a3609a0051d
commit: 50d5bf1b6da9f74bf93f9dec601c09d45d6d8406 [5051/30000] x86: hugepage: use nt copy hugepage to AEP in x86
:::::: branch date: 3 hours ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-161-20240829 (https://download.01.org/0day-ci/archive/20240830/202408301209.L0mF1vFY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408301209.L0mF1vFY-lkp@intel.com/

New smatch warnings:
arch/x86/lib/copy_highpages.c:41 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : copy_highpages_table[1]->procname
arch/x86/lib/copy_highpages.c:41 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : copy_highpages_table[1]->proc_handler
arch/x86/lib/copy_highpages.c:54 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : copy_highpages_root_table[0]->proc_handler
arch/x86/lib/copy_highpages.c:54 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : copy_highpages_root_table[1]->procname

Old smatch warnings:
arch/x86/lib/copy_highpages.c:54 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : copy_highpages_root_table[1]->proc_handler

vim +41 arch/x86/lib/copy_highpages.c

50d5bf1b6da9f7 Kemeng Shi 2022-01-15  40  
50d5bf1b6da9f7 Kemeng Shi 2022-01-15 @41  static struct ctl_table copy_highpages_table[] = {
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  42          {
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  43                  .procname       = "hugepage_nocache_copy",
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  44                  .data           = NULL,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  45                  .maxlen         = sizeof(unsigned int),
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  46                  .mode           = 0600,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  47                  .proc_handler   = sysctl_hugepage_nocache_copy,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  48                  .extra1         = SYSCTL_ZERO,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  49                  .extra2         = SYSCTL_ONE,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  50          },
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  51          {}
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  52  };
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  53  
50d5bf1b6da9f7 Kemeng Shi 2022-01-15 @54  static struct ctl_table copy_highpages_root_table[] = {
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  55  	{
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  56  		.procname       = "vm",
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  57  		.mode           = 0555,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  58  		.child          = copy_highpages_table,
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  59  	},
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  60  	{}
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  61  };
50d5bf1b6da9f7 Kemeng Shi 2022-01-15  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
