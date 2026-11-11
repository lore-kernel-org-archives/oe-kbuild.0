Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376931;
	b=IzPw2cU9ldBVCdbvx+eDoXQKJikrHkL/kWDF5NNIv9NVogZFD+3Ae71LWnBXyGoe1TRT
	 X9uqk3T0je9FK6M4rwKpHzQb1I48yERfR81nDhkkPwcJ5Piq7bg8hEcdNIkY+DJAgpkrE
	 mKR8IY8CH7KFGA7bgP5jONc+JnZ3roUDU+ErIS2D/CdtyL5itvXIYg+ywL45YKKBseIj3
	 3Kq5OQB4A+Sh2KJi0xN4Oyza56NiWDS9//twleiHlUbRq1zkRl5PZwqJxZn/UcL6SXTUj
	 aL52qCDrbDjbDlQ2gt3aWsqj/sadCSIiPZ1rLX/pgeh82FLw32IH83Rlv3ut6SuJhjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=e+0qcV7Lg4O9w0AUn1/30H8WUfIhfR9gYFxQoZbalwg=;
	b=RyxTL15Ol+2qNTO7BD32+i8n/3EW4ltj35hVqWLQQg46fr2ia4ddZKd+X6oJi/apvjTu
	 WNhu27+uGzdZm6/g27RXyuImMXYezIp+0BO1ti59dvT08gfbMEhxzww1vcZuRSvaCEXNb
	 Yl4K3M6V64XxPsUdUCxVwSGZ/BBrU4kixnq0ZiMjcxxSTXqZkSoGCpX95sg2HD9qlJ2rN
	 91KiQfhbsZX0wkveihvHgHPCBFsuNRSeeQqiyZOYf8hdpcIILvQps4dN5iXgSVMZ2QVFq
	 NTHNtvsL/4OFbWEjnt4FW/cXgSJHuo+oJeOoTgjif776ZS7a10i58IcM1G1oA2GSO6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RGutaREF;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56437606A327
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 06:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56437606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RGutaREF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794376931; x=1825912931;
  h=date:from:to:cc:subject:message-id;
  bh=v86fTHpWkbHbxO7cnApaJMFeRvRsN0O2LH829Zgi5fo=;
  b=RGutaREFEN6A6uWhoMltyVzjPc6/1iJg/R4wzDJy7GTZCM/ed3uacpFe
   p+hZu20ee/iaBbXiw4diNzaOuGPG4ZKeQwP912nJx3HoDgkAI8ubZGKs8
   DtLGCz2nMHc7sbIuC1XHU6DRn95+En4I//e8MFEu5GmURb2e25LoO/GIj
   7wCAx/mZAI59NSeM/3G7hpFrKnextOgxc9Kk+Eeg1L1V3oYEYiPPFfail
   dhUmD7fgJccxZwMCz7wxaUaEzFiTdLb4o+2p9V0YSa9SYLjrqgTGFwcQU
   gljEm4MCMQsJJf6jeLXaCi3Vi/rE7hLfT6rV1IUz1lKMT9iDcMVZI9IGQ
   g==;
X-CSE-ConnectionGUID: GJZ+T1KkTziA+2Kq1V/BNg==
X-CSE-MsgGUID: LFXrfxV6SW2+j2PtBxuyBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3175445"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3175445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 22:02:10 -0800
X-CSE-ConnectionGUID: NltopdEDS7qQZDb5bOHvjw==
X-CSE-MsgGUID: TQvhvnSvTUyagrMi8YdnXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8669979"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2026 22:02:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR1PK-000000000Wj-0egP;
	Wed, 11 Nov 2026 06:02:06 +0000
Date: Wed, 11 Nov 2026 07:01:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/fsl-ifc-nand-irq 10/19] ERROR: modpost:
 __ex_table+0x20d0 references non-executable section
 '.rodata.__llvm_fs_discriminator__'
Message-ID: <202611110614.PxkLj7Us-lkp@intel.com>
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
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/fsl-ifc-nand-irq
head:   9ff095bd38481480f435e5ac1faa189d872cd476
commit: de5388d88fcb8cf020381941465882d6886d0f1b [10/19] firmware: qcom: pas-tee: Fix purely theoretical out-of-bounds read of resource table
:::::: branch date: 16 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-2005-20261111 (https://download.01.org/0day-ci/archive/20261111/202611110614.PxkLj7Us-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 053b4a894ceaebc2eed76a7fa09f58cf7e313a69)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110614.PxkLj7Us-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110614.PxkLj7Us-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb4 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fbc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fcc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe4 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ffc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2004 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2004 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2008 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2008 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2010 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2010 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2014 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x201c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x201c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2020 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2020 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2028 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2028 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x202c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x202c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2040 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2040 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2044 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x204c (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x204c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2050 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2050 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2058 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2058 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x205c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x205c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2064 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2064 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2068 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2068 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2088 (section: __ex_table) -> __UNIQUE_ID_modinfo_353 (section: .modinfo)
ERROR: modpost: __ex_table+0x2088 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x208c (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x208c references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2094 (section: __ex_table) -> qcom_trng_match_data (section: .data)
ERROR: modpost: __ex_table+0x2094 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2098 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2098 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a0 (section: __ex_table) -> .L.str.3 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x20a0 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a4 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20a4 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ac (section: __ex_table) -> qcom_rng_probe._entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x20ac references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b0 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20b0 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b8 (section: __ex_table) -> .L.str.11 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x20b8 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20bc (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20bc references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c4 (section: __ex_table) -> .L.str.13 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x20c4 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c8 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20c8 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d0 (section: __ex_table) -> $d (section: .rodata.__llvm_fs_discriminator__)
>> ERROR: modpost: __ex_table+0x20d0 references non-executable section '.rodata.__llvm_fs_discriminator__'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d4 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20d4 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: __ex_table) -> $d (section: .debug_loclists)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e0 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20e0 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e8 (section: __ex_table) -> $d (section: .debug_info)
ERROR: modpost: __ex_table+0x20e8 references non-executable section '.debug_info'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ec (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20ec references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: __ex_table) -> .L0  (section: .debug_addr)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug_addr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f8 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x20f8 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: __ex_table) -> $d (section: .debug_str_offsets)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_str_offsets'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2110 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x211c references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2128 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2130 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2130 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2134 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2134 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x214c (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x214c references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x217c references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> qcom_prng_ee_match_data (section: .bss)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: ubifs_exit+0x74 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_pcmcia_cs+0x1a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mchp_corei2c_driver_exit+0x0 (section: .exit.text) -> init_nls_cp863 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: meson_mmc_driver_exit+0x0 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: meson_mmc_driver_exit+0x4 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scmi_sensors_unregister+0x0 (section: .exit.text) -> imx8mq_usb_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scmi_sensors_unregister+0x4 (section: .exit.text) -> imx8mq_usb_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adis16460_driver_exit+0x4 (section: .exit.text) -> uniphier_pcie_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sl28vpd_layout_exit+0x0 (section: .exit.text) -> si5351_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rave_sp_eeprom_driver_exit+0x0 (section: .exit.text) -> .Lpcrel_hi44 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rave_sp_eeprom_driver_exit+0x4 (section: .exit.text) -> da850_cfgchip_register_async3 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qnoc_driver_exit+0x0 (section: .exit.text) -> clk_mt7988_xfipll_drv_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_ns_rtnl_msg_handlers+0x28 (section: .init.rodata) -> clk_mt8195_infra_ao_drv_exit (section: .exit.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
