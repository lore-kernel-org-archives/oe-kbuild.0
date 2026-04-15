Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1B33123B
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776278558; cv=none; b=k2tru+reG+DC+hrFtXGtGxPWHKWvOdvmmHEEpk3409JqSFtL9Bb/WhKaK2nJ26c5hx00vu7F9+i5RVu5JL1O4O0xCyOMpJo9X7bHdRTg6V5kxIGZiiZ/qk6SIvs1rwPKrBjr/60vjZYeEetvuikrrqIcnlH1y3SEdZfkSQR82rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776278558; c=relaxed/simple;
	bh=41LxRnL5KrpmeggiSgRaiEZ/Xj6TKgRSMjaIaf40FY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LL066YZE8u72FAgE2R0EdRLmxf3Ra7EFrDlt+wwXMPz57NbGl+R38+7EyJDuP+snUOrV9npPn0ax44903aaTGfME+FB8Lzau0btVZs7hOoXCVwwIK5YCYOd2gwAb+9YS3KLTUzi36KVuDDyePMYiSi2ciULO8NW+w4wpucdO5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcCgpgfQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcCgpgfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776278556; x=1807814556;
  h=date:from:to:cc:subject:message-id;
  bh=41LxRnL5KrpmeggiSgRaiEZ/Xj6TKgRSMjaIaf40FY8=;
  b=TcCgpgfQqcpeFYysS4Tqk1UWyhSAUVAt40BZ0KApHH4eLt7ea8Vur4TG
   WGenGCqnbOlXOACJ319d+qU2ZZMSDVPrU8JSuGG+Pi3ZJfY+MMWIxkq+J
   O7WglC2HuEy+vBKzqS16A05Ab8G7oFpT4MpoYhKxKXf+cH1gzfqFqWCz3
   UPTBCLBAjCMWKo+pMhbTuCleSoYyqOIQpkNyYgxFnqVgSiYei7SraG1p6
   vqjaLGn9lvpAVBf/Ny5tFRAft8s4TNHHEXhMgQV4P3p5xZbKEl0zIZPl5
   vzMBsoAA01WbWog8LdzG6lX/fX1rgrRcLtiR/F0Hi0sremuDIrO4RuNP0
   w==;
X-CSE-ConnectionGUID: iXRJEmMjQ9Owf75Xb8gOKQ==
X-CSE-MsgGUID: /jg0R6KnTu2g6Qvog4xNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99914610"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99914610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:42:36 -0700
X-CSE-ConnectionGUID: GD9La8gTQd+Z8e6exGCgMA==
X-CSE-MsgGUID: U4/sXN+4SMyeMV8uD9MLEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230349880"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Apr 2026 11:42:34 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD5C4-000000000pW-1QSJ;
	Wed, 15 Apr 2026 18:42:32 +0000
Date: Thu, 16 Apr 2026 02:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11942/13789] ERROR: modpost:
 __ex_table+0x297c references non-executable section '.discard.addressable'
Message-ID: <202604160206.fY6F0K9M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6efabc0afca02efa263aba533f35d90117ab283
commit: 764c0e2abf3b7c8611a3695af26febfffe236c68 [11942/13789] Use xe_map_resource_to_region helper instead of direct access
:::::: branch date: 28 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-002-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160206.fY6F0K9M-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160206.fY6F0K9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604160206.fY6F0K9M-lkp@intel.com/

Note: the linux-next/master HEAD e6efabc0afca02efa263aba533f35d90117ab283 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x27d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x27fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2800 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2808 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2808 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x280c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x280c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2814 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2814 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2818 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2818 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2820 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2820 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2824 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2824 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x282c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x282c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2830 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2838 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2838 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x283c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x283c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2844 (section: __ex_table) -> $d (section: __bug_table)
ERROR: modpost: __ex_table+0x2844 references non-executable section '__bug_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2874 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2874 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2878 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2880 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2880 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2884 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x288c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x288c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2890 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2898 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2898 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x289c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x289c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2928 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2928 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x292c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x292c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2934 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2934 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2938 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2940 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2940 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2944 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x294c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x294c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2950 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2958 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2958 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x295c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x295c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x297c (section: __ex_table) -> __UNIQUE_ID_addressable_fscrypt_ioctl_get_nonce_467 (section: .discard.addressable)
>> ERROR: modpost: __ex_table+0x297c references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2980 (section: __ex_table) -> __UNIQUE_ID_addressable_fscrypt_dummy_policies_equal_473 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x2980 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2988 (section: __ex_table) -> set_encryption_policy._entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x2988 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x298c (section: __ex_table) -> set_encryption_policy.__already_done.26 (section: .data..once)
ERROR: modpost: __ex_table+0x298c references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2994 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2994 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2998 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x29f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a04 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a10 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a18 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a1c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a24 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a28 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a34 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a3c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a40 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a48 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a4c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a54 (section: __ex_table) -> $d (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2a54 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a58 (section: __ex_table) -> .L0  (section: .debug_str_offsets)
ERROR: modpost: __ex_table+0x2a58 references non-executable section '.debug_str_offsets'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a60 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a64 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a6c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a70 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a78 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a84 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a9c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2a9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2aa0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2aa8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2aa8 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
