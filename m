Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9261F5433
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jan 2025 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500020; cv=none; b=I/MaDVk01JTon4hUiXY8wCyzpVV0PW5oWFw2yT+bkomn2P9CwZ6hhTUdvs+iu17jEUfK4xP8d12g6mSOWWOAuGoUGYJ8KWVBsbBKpBv781qxlq4QCzspa1sICP6mF8wXycR3Sg5usDlu0Q9R3itLuhLBwPBY3pbkk+dDmFE3/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500020; c=relaxed/simple;
	bh=YjTbfkcqddfk/LvQOCzoos63RPBiLCvZ/9XIsLq6udU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsssxymO5WewIZIihHPZ1cI0Z9gFt5q5yzYTlHUS0lJuN2QAiufZKT3X7rBfzs0LipiIvilNx6q2USGvHMBaz6Mv0SFcexIiGGbd//3YV49px0MFHRt2YmToHfpZUfkomY2QJHGkltB+iop7c/64LsR6xObHHMhB4Pvi/RohMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktyoCEZQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktyoCEZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737500019; x=1769036019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjTbfkcqddfk/LvQOCzoos63RPBiLCvZ/9XIsLq6udU=;
  b=ktyoCEZQ910gfbCoFCl+l/d8YDXnqRa8QlmwQTtyCu/GFt/fBogfuD5e
   GoxtHOelPIzyoriv0XG8lVevywaUeoS/xiw9sZj/cf9KjFed/UtlpzGgo
   xudovzdemehvRk59d3kt86Cav2H/w1ayY7j7SlUnYJEazunQ9fSBMbjUL
   UShIerhMsiv0ueemfR+0akWIgnk/8BAkVAIb6B6C5oHbzDLBF3UqagVk3
   dSvvayPawzrY77jHbHY2pEYXROwHaSda0KZq+M+1xQz1gpQiV/xoWfGCf
   LLyzWcLxp51jJIEtE1PARv/PXppNNa5DhV00X8gXWCX34Bn2bpmqGlPwE
   A==;
X-CSE-ConnectionGUID: 3uYGhSErQpGwlJ2ZH4tbdQ==
X-CSE-MsgGUID: fvzyigAmRCWP3gkp3RJS+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48929370"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="48929370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 14:53:37 -0800
X-CSE-ConnectionGUID: Sg5tNlp7SKeZMybjNpS2Mw==
X-CSE-MsgGUID: IRO+HJ1oSp2NwqvrWWuWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112032651"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 14:53:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taN7m-000Z5H-20;
	Tue, 21 Jan 2025 22:53:34 +0000
Date: Wed, 22 Jan 2025 06:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2710/2710] mm/clear_freelist_page.c:149 (null)()
 warn: (struct ctl_table)->procname cannot be NULL. Expression :
 clear_freelist_table[1]->procname
Message-ID: <202501220848.sgE7KtDV-lkp@intel.com>
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
TO: Wang Wensheng <wangwensheng4@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2095f425a2f9fc280284b026ca81a957bda446ef
commit: 426b9efea56f9b065151d165caab2ebd32906505 [2710/2710] mm: Add sysctl to clear free list pages
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 2 months ago
config: x86_64-randconfig-161-20250121 (https://download.01.org/0day-ci/archive/20250122/202501220848.sgE7KtDV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501220848.sgE7KtDV-lkp@intel.com/

smatch warnings:
mm/clear_freelist_page.c:149 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : clear_freelist_table[1]->procname
mm/clear_freelist_page.c:149 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : clear_freelist_table[1]->proc_handler
mm/clear_freelist_page.c:162 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : sys_ctl_table[0]->proc_handler
mm/clear_freelist_page.c:162 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : sys_ctl_table[1]->procname

vim +149 mm/clear_freelist_page.c

426b9efea56f9b Yu Liao 2022-11-11  148  
426b9efea56f9b Yu Liao 2022-11-11 @149  static struct ctl_table clear_freelist_table[] = {
426b9efea56f9b Yu Liao 2022-11-11  150  	{
426b9efea56f9b Yu Liao 2022-11-11  151  		.procname   = "clear_freelist_pages",
426b9efea56f9b Yu Liao 2022-11-11  152  		.data       = NULL,
426b9efea56f9b Yu Liao 2022-11-11  153  		.maxlen     = sizeof(int),
426b9efea56f9b Yu Liao 2022-11-11  154  		.mode       = 0200,
426b9efea56f9b Yu Liao 2022-11-11  155  		.proc_handler   = &sysctl_clear_freelist_handler,
426b9efea56f9b Yu Liao 2022-11-11  156  		.extra1     = SYSCTL_ONE,
426b9efea56f9b Yu Liao 2022-11-11  157  		.extra2     = SYSCTL_ONE,
426b9efea56f9b Yu Liao 2022-11-11  158  	},
426b9efea56f9b Yu Liao 2022-11-11  159  	{ }
426b9efea56f9b Yu Liao 2022-11-11  160  };
426b9efea56f9b Yu Liao 2022-11-11  161  
426b9efea56f9b Yu Liao 2022-11-11 @162  static struct ctl_table sys_ctl_table[] = {
426b9efea56f9b Yu Liao 2022-11-11  163  	{
426b9efea56f9b Yu Liao 2022-11-11  164  		.procname   = "vm",
426b9efea56f9b Yu Liao 2022-11-11  165  		.mode       = 0555,
426b9efea56f9b Yu Liao 2022-11-11  166  		.child      = clear_freelist_table,
426b9efea56f9b Yu Liao 2022-11-11  167  	},
426b9efea56f9b Yu Liao 2022-11-11  168  	{ }
426b9efea56f9b Yu Liao 2022-11-11  169  };
426b9efea56f9b Yu Liao 2022-11-11  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
