Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F239A22687C
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Apr 2025 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904218; cv=none; b=i4kdf8biJ7oMXE2O4+Cfi8NYn7VKJ+ITC6p01yZxQ0LN8zO0VcSN2ZVZMqyeGPMXODa7KVOPkQ2kwkfFpFeK76MfP7xbruOzGFoh/iM1BvIgRr4c+anxYcXJEePjyjJz8NHwOtuhu8hoJOf8zd+FwvhLguMmBMtDb7b4VTUbPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904218; c=relaxed/simple;
	bh=a+cyKf2J2/Cc4IHR8gzt1szdzORSxP6MubeiXKp+C/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocNoJC9dBaslDT5fW3fSs+ewWKxwVfI3qItfPBrnxemPO4tWc4B25KBVy5SHARMixGTooqUTmw/8duOUpPkc5tCET2lkYgyV2DZ1zhfLT4zHwNVrlX1w2ogk2Np2zAQ6nQ0YYCJ6OAr18S7U+UtEsWOa2FOWUssLk8bG0oUBy4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2ZE8rRO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2ZE8rRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744904216; x=1776440216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+cyKf2J2/Cc4IHR8gzt1szdzORSxP6MubeiXKp+C/E=;
  b=Y2ZE8rROZbYwuu/DOvt7tBlnRWJzbLJi88lJRrcE9cJkKcpx5VbSXBL4
   3RhVizcODhhaOaX6p11USD42U7M3k1y99akfZT4f+3FZxdQzwQEKUrl1f
   Ab2ds0GjWWa+pOeFdsOoiqq9FVc1fjT6+D6KWbLbo/ZLSZBZ/T0X0i9Mq
   E8UL9Vr/sIBA/urlrXU75L4hjQ/hGECAF8DSTvcaW5JgcikRczfab3+ix
   OEhWHl/uEJrPea8DILMc6vjzCUYMVou+H9Fb1neT4qnnHdLVkmSEKUxyV
   EMdZ6Kw6aX4FfDWH4c/kLNZpAmQR2+dt9IGnVDF4O73sgPQ0pgCwsjygd
   Q==;
X-CSE-ConnectionGUID: A5ra3MpXSZyUuFBstkBRzg==
X-CSE-MsgGUID: 7cuAaretS/KrHJg1enahBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57884649"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57884649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:36:55 -0700
X-CSE-ConnectionGUID: UD7SOHovTdGadPhyQcS3cw==
X-CSE-MsgGUID: dk+9Add8TkmyjuAkZkZB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="136011879"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Apr 2025 08:36:54 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5RIJ-0000R9-2G;
	Thu, 17 Apr 2025 15:36:51 +0000
Date: Thu, 17 Apr 2025 23:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v1 2/2] genirq/irqdesc: Balance locking to make sparse
 happy
Message-ID: <202504172346.KbnCGLce-lkp@intel.com>
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
In-Reply-To: <20250416114122.2191820-3-andriy.shevchenko@linux.intel.com>
References: <20250416114122.2191820-3-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/genirq-irqdesc-Decrease-indentation-level-in-__irq_get_desc_lock/20250416-194250
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250416114122.2191820-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 2/2] genirq/irqdesc: Balance locking to make sparse happy
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: powerpc-randconfig-r062-20250417 (https://download.01.org/0day-ci/archive/20250417/202504172346.KbnCGLce-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504172346.KbnCGLce-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/irq/irqdesc.c:931:18-22: ERROR: desc is NULL but dereferenced.

vim +931 kernel/irq/irqdesc.c

a98d24b71b6e22 Thomas Gleixner 2010-09-30  902  
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  903  struct irq_desc *
31d9d9b6d83030 Marc Zyngier    2011-09-23  904  __irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
31d9d9b6d83030 Marc Zyngier    2011-09-23  905  		    unsigned int check)
752346dda9011a Andy Shevchenko 2025-04-16  906  	__acquires(&desc->lock)
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  907  {
cd49c072791316 Andy Shevchenko 2025-04-16  908  	struct irq_desc *desc;
cd49c072791316 Andy Shevchenko 2025-04-16  909  
cd49c072791316 Andy Shevchenko 2025-04-16  910  	desc = irq_to_desc(irq);
cd49c072791316 Andy Shevchenko 2025-04-16  911  	if (!desc)
752346dda9011a Andy Shevchenko 2025-04-16  912  		goto lock;
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  913  
31d9d9b6d83030 Marc Zyngier    2011-09-23  914  	if (check & _IRQ_DESC_CHECK) {
31d9d9b6d83030 Marc Zyngier    2011-09-23  915  		if ((check & _IRQ_DESC_PERCPU) &&
31d9d9b6d83030 Marc Zyngier    2011-09-23  916  		    !irq_settings_is_per_cpu_devid(desc))
752346dda9011a Andy Shevchenko 2025-04-16  917  			goto lock;
31d9d9b6d83030 Marc Zyngier    2011-09-23  918  
31d9d9b6d83030 Marc Zyngier    2011-09-23  919  		if (!(check & _IRQ_DESC_PERCPU) &&
31d9d9b6d83030 Marc Zyngier    2011-09-23  920  		    irq_settings_is_per_cpu_devid(desc))
752346dda9011a Andy Shevchenko 2025-04-16  921  			goto lock;
31d9d9b6d83030 Marc Zyngier    2011-09-23  922  	}
31d9d9b6d83030 Marc Zyngier    2011-09-23  923  
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  924  	if (bus)
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  925  		chip_bus_lock(desc);
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  926  	raw_spin_lock_irqsave(&desc->lock, *flags);
cd49c072791316 Andy Shevchenko 2025-04-16  927  
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  928  	return desc;
752346dda9011a Andy Shevchenko 2025-04-16  929  
752346dda9011a Andy Shevchenko 2025-04-16  930  lock:
752346dda9011a Andy Shevchenko 2025-04-16 @931  	__acquire(&desc->lock);
752346dda9011a Andy Shevchenko 2025-04-16  932  	return NULL;
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  933  }
d5eb4ad2dfb2df Thomas Gleixner 2011-02-12  934  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
