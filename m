Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219510;
	b=u1em7W91RoAoI5o+v2UAt5pmvHIMPJZYFmr9n9o2sukYC1+8xTtT66GIIV1qX7kOABIf
	 i4nPyMTx9X0V3eb2Tzk8ujxI/1uPuD2EHaowJjGQfZuw0vjio8Rr7kUfosgvlIekCGxGK
	 0OaKZ50iDfQbqQsITMdFpe0DuiQhS8JuAQGEnmXRJpNxx8a1+CGkfQEquk9E2yKVpw1Cw
	 T/O6zd7+COO190zfzI5cpINyRWipQ1X4IbGmvFjw9X75rbnqc7ikiO9NRaJ7oInf6U7mc
	 w2PVZ9rxJfWPuhGgrZv/NM4PJea1YZ4gMZH0rF9Kwsr8JCqLiV1Fj/TGQ7GWfbwpzUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219510;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=51lhobxyeRz1ggF0Rt/1xuZBqcV6ZZIR/gHd/M4g6PU=;
	b=ok30+F4x9i8gNuxQZfIcbvOXVDiY+0tVxM0LFW3LuGoZJI5hr/Mfx0e5GrMdSxAjwJ+I
	 e8Cuy6ykiem0TciDEMd+UnyrJrurL0rKZtnJRTp3mXYCCsC1yEn8QchjANTlyemMuk2eh
	 pkq2VgGkPjS6JAqyVPQt16Jc7wXb4FPSmv/y4UxkGwJCpq3QEoApWENZqxiAjgyDVAY4S
	 Bg//DEEv01k/usaQj8xmwszjJrP4McrMuDVo4RorFLZG8L39dzk11XaZD33SMptEIkPwJ
	 1Yt6k4JOzubqLpzQXygq4x8xsSBN0RQdSotzQN+0UXod1mS54dyk13EXwcu/oKO6GXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aZMMhg2O;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA668606A338
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 00:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA668606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aZMMhg2O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795219499; x=1826755499;
  h=date:from:to:cc:subject:message-id;
  bh=lm/NsABCxqfG4fUDziaLgrryPfFYARiaOvtPZiV0sDI=;
  b=aZMMhg2ObGd/9qKD4R4C8czgu86TxVnK0NWSMzvIvZXGuZKH2PYN5f0X
   lAWe9aEWuMgbMaMAwMledrdrTYV5Rf8u+vPZtxqGtGapil37W0OHsCO2F
   JQKlAgEnj8rV+SlI6Cvu3eL42gwjQOt3kYb67Np664KyQY9aTF3iiCacy
   pn+/eZtoawb6yble5wfvwGvbzHZil2JtF8Ri4XBY4n6XegdEPs7lwORPk
   JxF6BK0PuB27vvB4L6OkhOj0S1IYNK41XrgG0M/dOmc0WXktouN6swtbQ
   F+iaMamqu52RmJbVd+NxeFeKtw9xoCskejWiJJKLbbADEYJ37mNJEeP+X
   w==;
X-CSE-ConnectionGUID: nXx3TLRVRSKU1K2mxTVLQg==
X-CSE-MsgGUID: FbMwwVK9SGGMi0P3z+ojpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4112250"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4112250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 16:04:59 -0800
X-CSE-ConnectionGUID: TlJBMdwrThGJAuBXUxgJSg==
X-CSE-MsgGUID: BzOqxu3dRCGjeVGPyr2LLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11163612"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2026 16:04:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUYbA-000000004BR-1CAE;
	Sat, 21 Nov 2026 00:04:56 +0000
Date: Sat, 21 Nov 2026 01:04:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 include/linux/acpi.h:71:10: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <20261121005445.XTnGDF7r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261121/20261121005445.XTnGDF7r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121005445.XTnGDF7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121005445.XTnGDF7r-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/acpi/tables.c:19:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/acpi/property.c:16:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c: At top level:
>> drivers/acpi/property.c:1791:12: error: static declaration of 'acpi_static_fwnode_irq_get' follows non-static declaration
    1791 | static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:92:5: note: previous declaration of 'acpi_static_fwnode_irq_get' with type 'int(const struct fwnode_handle *, unsigned int)'
      92 | int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c: In function 'acpi_static_fwnode_irq_get':
>> include/linux/acpi.h:75:9: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      75 |         FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
         |         ^~~~~~~~~
   drivers/acpi/property.c:1802:50: note: in expansion of macro 'ACPI_STATIC_IRQ_TRIGGER'
    1802 |         return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from sound/hda/controllers/intel.c:38:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from arch/x86/include/asm/div64.h:100,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from sound/hda/controllers/intel.c:23:
   sound/hda/controllers/intel.c: At top level:
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:544:20: note: in expansion of macro 'ARRAY_SIZE'
     544 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:528:9: note: in expansion of macro 'module_param_array_named'
     528 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/hda/controllers/intel.c:127:1: note: in expansion of macro 'module_param_array'
     127 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/hda/controllers/intel.c:106:12: warning: 'index' defined but not used [-Wunused-variable]
     106 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from intel.c:38:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from arch/x86/include/asm/div64.h:100,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from intel.c:23:
   intel.c: At top level:
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:544:20: note: in expansion of macro 'ARRAY_SIZE'
     544 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:528:9: note: in expansion of macro 'module_param_array_named'
     528 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   intel.c:127:1: note: in expansion of macro 'module_param_array'
     127 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   intel.c:106:12: warning: 'index' defined but not used [-Wunused-variable]
     106 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/FIELD_PREP +71 include/linux/acpi.h

5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  69  
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  70  #define ACPI_STATIC_IRQ_FLAGS(trigger, polarity) \
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04 @71  	(FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))	| \
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  72  	 FIELD_PREP(ACPI_STATIC_IRQ_POLARITY_MASK, (polarity)))
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  73  
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  74  #define ACPI_STATIC_IRQ_TRIGGER(flags)		\
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04 @75  	FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  76  #define ACPI_STATIC_IRQ_POLARITY(flags)	\
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  77  	FIELD_GET(ACPI_STATIC_IRQ_POLARITY_MASK, (flags))
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
