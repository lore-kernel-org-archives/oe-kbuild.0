Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70777221FB6
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025930; cv=none; b=J0zx9QZZcDDM56ubShDqTIxf+V2QGv7s8+efPX0nlMjSUfvIgxOUdDG8kIWi7sXMb6jMIgWhcnaDpoNwqAQMYp/L13c4iOF5f1tNWg0Bdij48FB//ksqlOgkB5AXSMBYRtBLlpa1pu3rknuar8x74DLE4lEw8pYBunMZaC5pFvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025930; c=relaxed/simple;
	bh=P3tkaKplReR4ffU/WvWpAKfa2zus1FT9kB3bBsm83hA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJsE+5E5pNVYaAPQ7O6oBS/M7KMih87IOcegP08o4Ukb8pGC8Ca6VVFyemQ1uyHOOGzbchpPqNYFSKRt2hsO1QBvEY1vcuBxWQ/cOgpvnC+IT6rop4eEt+T8uZmqhKwGTKQat+EgM0cDnQFG3QbM9fT1hbsaQuMBTTpm1uIgEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOqHIbXX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOqHIbXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766025927; x=1797561927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3tkaKplReR4ffU/WvWpAKfa2zus1FT9kB3bBsm83hA=;
  b=JOqHIbXX8ciSVVs62uToe9x5/NqXMvoYpXxO/qiFSxMk/f/e6KdHX2JD
   wF6NAS/b0m0ivRQ/2axirY++M2pm6UBVf0ZTbj1zQL2IKRYmrsDLpdrMC
   eIs3fqlGiVzpbFo/E39fdhRulwWHXWgLiPzGMB+qgF7X+I8TunWScWoM1
   hhxGE5Zlv4eZbxwgZzXTiTmZ1Lm232UcEtt/nYS+bG6hW21X+vMp1AKUv
   DXL8ejL/Ou2ZhNU7CWgAxlMTifMNzcRVKqCGSMZyisIeeStQGR0yxuCig
   D3iivrGhPFMSXExDen0luuQum1+zSjgktdFtbevQZWy5jDXL3TUOmeVNq
   Q==;
X-CSE-ConnectionGUID: VQqDo0z3S8+PT18tP7QasA==
X-CSE-MsgGUID: 9CrPaI69QQGovjui/clmCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67854821"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67854821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 18:45:26 -0800
X-CSE-ConnectionGUID: klIOmVmJRjiKPtUFI1/y2Q==
X-CSE-MsgGUID: rLvWbitoSa6YvT62eJIm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="221870564"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2025 18:45:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW415-000000001Tt-0pWz;
	Thu, 18 Dec 2025 02:45:23 +0000
Date: Thu, 18 Dec 2025 10:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized
 symbol 'bytes_written'.
Message-ID: <202512181017.7iRykewd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Roman Kisel <romank@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: f41ceff1748612b9e1538becc13dc2f1617d9d14 Drivers: hv: Enable VTL mode for arm64
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r072-20251216 (https://download.01.org/0day-ci/archive/20251218/202512181017.7iRykewd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181017.7iRykewd-lkp@intel.com/

smatch warnings:
drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized symbol 'bytes_written'.

vim +/bytes_written +242 drivers/hv/hv_common.c

9c318a1d9b5000 Long Li         2023-04-20  220  
9c318a1d9b5000 Long Li         2023-04-20  221  /*
9c318a1d9b5000 Long Li         2023-04-20  222   * Callback from kmsg_dump. Grab as much as possible from the end of the kmsg
9c318a1d9b5000 Long Li         2023-04-20  223   * buffer and call into Hyper-V to transfer the data.
9c318a1d9b5000 Long Li         2023-04-20  224   */
9c318a1d9b5000 Long Li         2023-04-20  225  static void hv_kmsg_dump(struct kmsg_dumper *dumper,
e1a261ba599eec Jocelyn Falempe 2024-07-02  226  			 struct kmsg_dump_detail *detail)
9c318a1d9b5000 Long Li         2023-04-20  227  {
9c318a1d9b5000 Long Li         2023-04-20  228  	struct kmsg_dump_iter iter;
9c318a1d9b5000 Long Li         2023-04-20  229  	size_t bytes_written;
9c318a1d9b5000 Long Li         2023-04-20  230  
9c318a1d9b5000 Long Li         2023-04-20  231  	/* We are only interested in panics. */
e1a261ba599eec Jocelyn Falempe 2024-07-02  232  	if (detail->reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
9c318a1d9b5000 Long Li         2023-04-20  233  		return;
9c318a1d9b5000 Long Li         2023-04-20  234  
9c318a1d9b5000 Long Li         2023-04-20  235  	/*
9c318a1d9b5000 Long Li         2023-04-20  236  	 * Write dump contents to the page. No need to synchronize; panic should
9c318a1d9b5000 Long Li         2023-04-20  237  	 * be single-threaded.
9c318a1d9b5000 Long Li         2023-04-20  238  	 */
9c318a1d9b5000 Long Li         2023-04-20  239  	kmsg_dump_rewind(&iter);
9c318a1d9b5000 Long Li         2023-04-20  240  	kmsg_dump_get_buffer(&iter, false, hv_panic_page, HV_HYP_PAGE_SIZE,
9c318a1d9b5000 Long Li         2023-04-20  241  			     &bytes_written);
9c318a1d9b5000 Long Li         2023-04-20 @242  	if (!bytes_written)
9c318a1d9b5000 Long Li         2023-04-20  243  		return;
9c318a1d9b5000 Long Li         2023-04-20  244  	/*
9c318a1d9b5000 Long Li         2023-04-20  245  	 * P3 to contain the physical address of the panic page & P4 to
9c318a1d9b5000 Long Li         2023-04-20  246  	 * contain the size of the panic data in that page. Rest of the
9c318a1d9b5000 Long Li         2023-04-20  247  	 * registers are no-op when the NOTIFY_MSG flag is set.
9c318a1d9b5000 Long Li         2023-04-20  248  	 */
0e3f7d120086c8 Nuno Das Neves  2024-02-20  249  	hv_set_msr(HV_MSR_CRASH_P0, 0);
0e3f7d120086c8 Nuno Das Neves  2024-02-20  250  	hv_set_msr(HV_MSR_CRASH_P1, 0);
0e3f7d120086c8 Nuno Das Neves  2024-02-20  251  	hv_set_msr(HV_MSR_CRASH_P2, 0);
0e3f7d120086c8 Nuno Das Neves  2024-02-20  252  	hv_set_msr(HV_MSR_CRASH_P3, virt_to_phys(hv_panic_page));
0e3f7d120086c8 Nuno Das Neves  2024-02-20  253  	hv_set_msr(HV_MSR_CRASH_P4, bytes_written);
9c318a1d9b5000 Long Li         2023-04-20  254  
9c318a1d9b5000 Long Li         2023-04-20  255  	/*
9c318a1d9b5000 Long Li         2023-04-20  256  	 * Let Hyper-V know there is crash data available along with
9c318a1d9b5000 Long Li         2023-04-20  257  	 * the panic message.
9c318a1d9b5000 Long Li         2023-04-20  258  	 */
0e3f7d120086c8 Nuno Das Neves  2024-02-20  259  	hv_set_msr(HV_MSR_CRASH_CTL,
9c318a1d9b5000 Long Li         2023-04-20  260  		   (HV_CRASH_CTL_CRASH_NOTIFY |
9c318a1d9b5000 Long Li         2023-04-20  261  		    HV_CRASH_CTL_CRASH_NOTIFY_MSG));
9c318a1d9b5000 Long Li         2023-04-20  262  }
9c318a1d9b5000 Long Li         2023-04-20  263  

:::::: The code at line 242 was first introduced by commit
:::::: 9c318a1d9b5000c77527011f158a75c5483510f5 Drivers: hv: move panic report code from vmbus to hv early init code

:::::: TO: Long Li <longli@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
