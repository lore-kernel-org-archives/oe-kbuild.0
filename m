Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14743175
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776820; cv=none; b=m2cx+GxUxqzqxpwQhgVxIdzTuq3bgDym1dNdaIbkJ7Y4bUP8InIdM21FkKax1naJ2+mGIVXB+oR+Z8vymeD3QVzBkK+3l6TIs/vx+40enBM6X9tyL6EKjWSI9I9V5/wLJEpEElJrx4DRCK/6xk9iFApTT4R5bKqSotjJYNPYfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776820; c=relaxed/simple;
	bh=kY5mrQeCH472X2h30OW6UTsv7o4v1v8JNOOdMTzUpUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rFUQHH8+W6aLuyOa7RhjXRylRKZxEtDXHwUZXx5epwehaGPukkjL72yyCZZSuYO8B465DLCR82MjwcENebL9Mmi4Vvtt72DKVAKFtXV7LCU8usA3j0Pf4buQFmMyj/QfZXo29gfYq/KViU6VuLqWljnHbCILgqB0xVsCJG7B5Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdoA0uuT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdoA0uuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791776819; x=1823312819;
  h=date:from:to:cc:subject:message-id;
  bh=kY5mrQeCH472X2h30OW6UTsv7o4v1v8JNOOdMTzUpUI=;
  b=kdoA0uuTDEaBJ2H8KAaWCetvjPjbwjxDw+spYNgbI6AJgW6EZH4rw4ek
   T/Cn72aTM7sSOdJvVQh4NnPRx+xh5RRPbutLrM8hfs5rglBZ3RnWcGV//
   +y1DlRmqaM1k8BEGNgZTk8GDohO0+hon23Gh3T1n39QRsKfdKVpG7dMET
   eczaeGPN0pdz4eBSsUnoEYQtVCGJrZvnCo4J27Ua1ifaR/NcZrdjpOVvU
   Kbo4UlrddUCQ+Qha3SHwd/5uM47uWn+5u8Jmy2NFBqIMhBRUL2x/BOrxR
   eQYB6M3OH8iqxfKTqWMf3UHgbIWWCs83Ry16WrqX7d7CICQKoy5N6bSor
   A==;
X-CSE-ConnectionGUID: KFZNAP9pTU+51JUi1wS5bg==
X-CSE-MsgGUID: WKSqe3guT1KhURQfrX59Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="588141"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="588141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 20:46:58 -0700
X-CSE-ConnectionGUID: yjDogL8CRpqrDu3QJS768A==
X-CSE-MsgGUID: 3/d70NhtSjC2C68VwHtOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1153459"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Oct 2026 20:46:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG703-000000009sV-1X68;
	Mon, 12 Oct 2026 03:46:55 +0000
Date: Mon, 12 Oct 2026 05:46:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 [snitzer:kernel-7.3/nfs-testing-canary-reduce-ff-layout-contention 5821/7381]
 arch/arm64/kernel/setup.c:220:5-11: WARNING: Unsigned expression compared
 with zero: chosen < 0
Message-ID: <202610120559.eTG3Ow6h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Salter <msalter@redhat.com>
CC: "Justin M. Forbes" <jforbes@fedoraproject.org>
CC: Jeremy Cline <jeremycline@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/nfs-testing-canary-reduce-ff-layout-contention
head:   d889639e439fd6441ed5737e9091862837e322f9
commit: 10f592edc6b4ce30ca4b2edd412198afdd2b6cd6 [5821/7381] arm64: add early lockdown for secure boot
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r2108-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120559.eTG3Ow6h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610120559.eTG3Ow6h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/setup.c:220:5-11: WARNING: Unsigned expression compared with zero: chosen < 0

vim +220 arch/arm64/kernel/setup.c

9703d9d7f77ce1 Catalin Marinas 2012-03-05  211  
10f592edc6b4ce Mark Salter     2025-03-31  212  static void __init init_secureboot_mode(void)
10f592edc6b4ce Mark Salter     2025-03-31  213  {
10f592edc6b4ce Mark Salter     2025-03-31  214  	void *fdt = initial_boot_params;
10f592edc6b4ce Mark Salter     2025-03-31  215  	u64 chosen;
10f592edc6b4ce Mark Salter     2025-03-31  216  	const __be32 *prop;
10f592edc6b4ce Mark Salter     2025-03-31  217  	int len;
10f592edc6b4ce Mark Salter     2025-03-31  218  
10f592edc6b4ce Mark Salter     2025-03-31  219  	chosen = fdt_path_offset(fdt, "/chosen");
10f592edc6b4ce Mark Salter     2025-03-31 @220  	if (chosen < 0)
10f592edc6b4ce Mark Salter     2025-03-31  221  		return;
10f592edc6b4ce Mark Salter     2025-03-31  222  
10f592edc6b4ce Mark Salter     2025-03-31  223  	prop = fdt_getprop(fdt, chosen, "secure-boot-mode", &len);
10f592edc6b4ce Mark Salter     2025-03-31  224  	if (!prop || len != sizeof(u32))
10f592edc6b4ce Mark Salter     2025-03-31  225  		return;
10f592edc6b4ce Mark Salter     2025-03-31  226  
10f592edc6b4ce Mark Salter     2025-03-31  227  	efi_set_secure_boot((enum efi_secureboot_mode)fdt32_to_cpu(*prop));
10f592edc6b4ce Mark Salter     2025-03-31  228  }
10f592edc6b4ce Mark Salter     2025-03-31  229  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
