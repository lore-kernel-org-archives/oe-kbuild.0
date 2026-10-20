Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517064;
	b=m83ZuFSnmbPGBEfkDsPzWbtwoHtryTnh4jekzu2iEXVEN4MutYtaCTmWT8ee/YBDOOm/
	 MaFKaAZ1L2BARtSJ3hFc/q0DljYaxGTkhAiQ325Q6xN0HhNTPdnJgtUYt6FMimBS8qL3A
	 bEQwKH4KLvY6fI0wnnMk8YkVj3oZJPBc6fB9Tcj7r8jUy6A3tSEf+p8R9zXjV5IMgVFwS
	 pjMACkadY2ScIFj4Zl4Ma+KIDFNBjU+Ox4VXWDFDezeLwC1IDgPENh+xAaWZHNhFCKXZ2
	 wvvCCqKqiWTNTk0C7BgBhBYp/69JS2BquoW5YftqqXUmCDCDzd+PV9niGR4dSjxr2HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517064;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YBC4KLJ+QeOjD+A6W8tqVrzuzhuJdEImHlOFtArVhHw=;
	b=jnGoq4yfs1K2eiTL/YdsRz2uv8Uy1qIBATnF1Mwx68IT6RTzrTqkOatsqewdeXe2D8t2
	 R45ri6fY0ZBVCSmsPYa9SKO0GeyA34y5p6/UNxB4Tm7P9fRKtRgVL3TC7GM8H6Zc3RqIF
	 Si5gozj1s0PcOd2O/1x1uMzhFPmXZziIjwQ9OSi3PYU9M2BlG4GpFIBit6bCnQn3dvAYi
	 SX811eRWg9TWrrrG3uZ7ImkKurt/51yX4V+v/3h/pa0MquFWITOlYci9kW814kD+uVRp+
	 gSTDfOtrHItaIyODY6UiDfzxA4MttmaToMqoiNDxKqBJ7G2rIOJtNVniK2j4aSijL1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gyarjnhw;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5AD606A323
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 17:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gyarjnhw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792517064; x=1824053064;
  h=date:from:to:cc:subject:message-id;
  bh=B7ULheSQkYINnO1nEAJBYHvFNh0XezMQrgY0OF2vYTs=;
  b=gyarjnhwGfgE3SV4+xQ9sTq9hqixcqCuAeA3xGO+E1z1ffzl3ZdFGyb3
   TI0KuGx9s5QitOJw8Zf1mx+9bfWZawYncvRUMNNkkptwPStTLmodCrfGd
   8fiIFzgrIaU9xiZGiAd//OsKViF3Ql/ilTSskhJXxuiGRcdFHWyHJXU7+
   Wxv3smXdHlzXKj4SNVb5YMy03XtneMfVp4JprCcG6N9sTfGcX52CjRyh9
   dLMiSTx2CNry0ZfTUHjRR/polO1spZ96AZJGs5b0Kwhoifv0o891JIMd6
   ygXwJzzDocUa4ENaW8bzlC7ge2mr1CrBppG6Ass0GDucpIfqgUYNUUbC9
   g==;
X-CSE-ConnectionGUID: t8/iXeuNRoqmpcrJf2xS7A==
X-CSE-MsgGUID: vT6a7q0eSC+D2x+r6+SlGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1238120"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1238120"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 10:24:23 -0700
X-CSE-ConnectionGUID: gUFFcfDPRl+wCTGfiGQqKw==
X-CSE-MsgGUID: znU+047pTLmq/Pp3tX/djw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2872114"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2026 10:24:21 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJDZT-000000006Ol-0K5r;
	Tue, 20 Oct 2026 17:24:19 +0000
Date: Tue, 20 Oct 2026 19:23:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [lindholm-alpha:for-linus 57/57]
 arch/alpha/kernel/err_tsunami.c:653:22-23: WARNING opportunity for min()
Message-ID: <202610201902.6BG70hxk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Magnus Lindholm <linmag7@gmail.com>
CC: Matt Turner <mattst88@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-linus
head:   71cf9644bcb35e686c3e12a703325335a0925946
commit: 71cf9644bcb35e686c3e12a703325335a0925946 [57/57] alpha: add bounded Clipper console-log scanning
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r2105-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201902.6BG70hxk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610201902.6BG70hxk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/alpha/kernel/err_tsunami.c:653:22-23: WARNING opportunity for min()

vim +653 arch/alpha/kernel/err_tsunami.c

71cf9644bcb35e6 Magnus Lindholm 2026-10-14  647  
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  648  static void __init
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  649  tsunami_console_data_log(int cpu, struct percpu_struct *pcpu)
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  650  {
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  651  	unsigned char *data = (void *)(IDENT_ADDR | pcpu->console_data_log_pa);
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  652  	size_t length = pcpu->console_data_log_length;
71cf9644bcb35e6 Magnus Lindholm 2026-10-14 @653  	size_t dump = length < 1024 ? length : 1024;
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  654  
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  655  	printk("%sConsole data log for CPU %d (%zu bytes):\n",
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  656  	       err_print_prefix, cpu, length);
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  657  	if (!(pcpu->console_data_log_pa & 7) &&
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  658  	    length <= ~0UL - (unsigned long)data &&
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  659  	    tsunami_console_log(data, length)) {
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  660  		/* Acknowledge only after reaching a valid termination packet. */
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  661  		pcpu->console_data_log_pa = 0;
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  662  		return;
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  663  	}
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  664  	printk("%s  Incomplete console log; retaining firmware pointer\n",
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  665  	       err_print_prefix);
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  666  	/* Byte reads preserve partial headers without rounding beyond length. */
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  667  	if (dump > ~0UL - (unsigned long)data)
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  668  		return;
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  669  	print_hex_dump(err_print_prefix, "  ", DUMP_PREFIX_OFFSET, 16, 1,
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  670  		       data, dump, false);
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  671  	if (dump < length)
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  672  		printk("%s  Raw console log truncated to %zu bytes\n",
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  673  		       err_print_prefix, dump);
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  674  }
71cf9644bcb35e6 Magnus Lindholm 2026-10-14  675  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
