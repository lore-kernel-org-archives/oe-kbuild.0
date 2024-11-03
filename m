Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989124A1D
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Nov 2024 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730648794; cv=none; b=GYDrXwadTnLSMSsNdYoJ6YTIoGdApSP0iUiCVObyFGk6iMdpVLtRcTeagVmkVIDcsRrLZYqXxphtJf+h2U8IxpxOIZGnFpKOen2xB/65u0FrX1tsiiFsVver2dMRYbcDMI79zJmJQdwWV4PNuhIgUZC56fiHgTZ7rNQgJXt7JPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730648794; c=relaxed/simple;
	bh=7GjqZn5h6W5QS9XUjyRNZ35C0nMYx9xE7jwHdApzFbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V12Ph4OhSoFyvJtjKgspzygnIVHxbrbztxZlgIKDlyzNO9Ua3B6JnBTa8DFEOELCZDOrdvdvuTFWlT73rZpXUaxbmjjSG/9qftNlt8rkQKVrxew/R1Q2NZW+65Vu/wRuF5/MRZl3k0w3gDiRkQ48CzHtfSoemswXT6rkiQDroTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+BmrE+c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+BmrE+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730648793; x=1762184793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GjqZn5h6W5QS9XUjyRNZ35C0nMYx9xE7jwHdApzFbc=;
  b=O+BmrE+cIQVCGsaXrT4XJP33ohCDallusX+3HBoiPGLySDclM9qx0mWN
   vIGMCIvL36FAQTol3hm+0NSfDSYJhmAjZSdFdRIjqqJ2kufMWFelCefnw
   3kkHcb7dF/ybjw2TF8kT8D3cw1hpcp6Q3gyfIGtgsv9mv2c1F+97MOkt8
   d0+lZe7Vk9+p/1W79mHIkRtfpyWMheVzcMFSqWOoO9ioo29Yll+N+lwNb
   g35MZTMZ014brb0/nJQ8QLNnVsou1anpSEzJOP/GRdqyOl/DO2UcOlC9j
   7hA8XtWco1BFT2WJFz9mA3sgcFvt37mEUefwCB+u5KpFfWnN6NS3XfiBt
   A==;
X-CSE-ConnectionGUID: l2zYb1zzTl2TGeqCw6MpMw==
X-CSE-MsgGUID: fCitpvB9RD2yohKKr7Vabw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41742939"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="41742939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 07:46:33 -0800
X-CSE-ConnectionGUID: piUk6Q8IQcatMiUCxOhMmg==
X-CSE-MsgGUID: GwoUlwCdSWabGyVQYKn7aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="83103516"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2024 07:46:31 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7co8-000k2H-2B;
	Sun, 03 Nov 2024 15:46:28 +0000
Date: Sun, 3 Nov 2024 23:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jolsa-perf:bpf/optimized_usdt_3 21/24]
 arch/x86/kernel/uprobes.c:1359 __arch_uprobe_optimize() error: uninitialized
 symbol 'ret'.
Message-ID: <202411032313.O65IxwCH-lkp@intel.com>
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
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: 0200936b03cfee067eb7db4b44079104b561b726 [21/24] uprobes/x86: Add support to optimize uprobes
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241103/202411032313.O65IxwCH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411032313.O65IxwCH-lkp@intel.com/

smatch warnings:
arch/x86/kernel/uprobes.c:1359 __arch_uprobe_optimize() error: uninitialized symbol 'ret'.

vim +/ret +1359 arch/x86/kernel/uprobes.c

0200936b03cfee Jiri Olsa 2024-10-23  1331  
0200936b03cfee Jiri Olsa 2024-10-23  1332  static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct *mm,
0200936b03cfee Jiri Olsa 2024-10-23  1333  				  unsigned long vaddr)
0200936b03cfee Jiri Olsa 2024-10-23  1334  {
0200936b03cfee Jiri Olsa 2024-10-23  1335  	struct tramp_area *area = NULL;
0200936b03cfee Jiri Olsa 2024-10-23  1336  	char call[5];
0200936b03cfee Jiri Olsa 2024-10-23  1337  	int ret;
0200936b03cfee Jiri Olsa 2024-10-23  1338  
0200936b03cfee Jiri Olsa 2024-10-23  1339  	/* We can't do cross page atomic writes yet. */
0200936b03cfee Jiri Olsa 2024-10-23  1340  	if (PAGE_SIZE - (vaddr & ~PAGE_MASK) < 5)
0200936b03cfee Jiri Olsa 2024-10-23  1341  		goto fail;
0200936b03cfee Jiri Olsa 2024-10-23  1342  
0200936b03cfee Jiri Olsa 2024-10-23  1343  	area = get_tramp_area(vaddr);
0200936b03cfee Jiri Olsa 2024-10-23  1344  	if (!area)
0200936b03cfee Jiri Olsa 2024-10-23  1345  		goto fail;
0200936b03cfee Jiri Olsa 2024-10-23  1346  
0200936b03cfee Jiri Olsa 2024-10-23  1347  	relative_call(call, (void *) vaddr, (void *) area->vaddr);
0200936b03cfee Jiri Olsa 2024-10-23  1348  	ret = uprobe_write_opcode(auprobe, mm, vaddr, call, 5, (void *) 1);
0200936b03cfee Jiri Olsa 2024-10-23  1349  	if (ret)
0200936b03cfee Jiri Olsa 2024-10-23  1350  		goto fail;
0200936b03cfee Jiri Olsa 2024-10-23  1351  
0200936b03cfee Jiri Olsa 2024-10-23  1352  	set_bit(ARCH_UPROBE_FLAG_OPTIMIZED, &auprobe->flags);
0200936b03cfee Jiri Olsa 2024-10-23  1353  	return 0;
0200936b03cfee Jiri Olsa 2024-10-23  1354  
0200936b03cfee Jiri Olsa 2024-10-23  1355  fail:
0200936b03cfee Jiri Olsa 2024-10-23  1356  	/* Once we fail we never try again. */
0200936b03cfee Jiri Olsa 2024-10-23  1357  	put_tramp_area(area);
0200936b03cfee Jiri Olsa 2024-10-23  1358  	clear_bit(ARCH_UPROBE_FLAG_CAN_OPTIMIZE, &auprobe->flags);
0200936b03cfee Jiri Olsa 2024-10-23 @1359  	return ret;
0200936b03cfee Jiri Olsa 2024-10-23  1360  }
0200936b03cfee Jiri Olsa 2024-10-23  1361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
