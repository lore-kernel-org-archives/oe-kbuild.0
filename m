Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF37253E0A
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706572823; cv=none; b=QwGWo9HCuqQJgimMnSuym6ofKH9tRWNLpLLOh5fEMhy0dipzBf/mUPUnXrnaeUkW4nEjBuLRTotgoyjVz+CWJqtHCUliud5ZZP17EluwgdaAfzyAXWfobzGkH8v/6SDfbEPrEFvQJO7RMWG6BULppXHs9gDT3mh2Q2AFFHkZMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706572823; c=relaxed/simple;
	bh=KXzv4EzqJbgEJ+LccbaFhD3LOuj5AT+500YE5pmxzDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2E8oi/T4deyHhaKxUw93v2UWqIFwJHPHyuV7wRXzIsr7gkzifEggmvDtUDxgZYuV+I8UzzzUXxpRdZYfjFr8KORpj8ZfeSO0esseBWlyErOiKlrmCdYxzxX7BtEKU+aqJ/CDdtr63Kc7EOTnmEo2PMju8yApn3k74NpyglRl7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baq6Df06; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baq6Df06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706572822; x=1738108822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXzv4EzqJbgEJ+LccbaFhD3LOuj5AT+500YE5pmxzDY=;
  b=baq6Df06nmucNtY3M7QXNL89tjYfqXntlIY++2SXB2WmNYXoKTNcESWI
   q9TB/lpXVkqdOej6EP4W+44VQaeZP3F7N8KXer7Aqk7HMRcdG2YwCBtfI
   DBKHMJHAzY6EpKJmzBjTKa14yTgQYxCyFjYDyBZctBgcyRvnAa8B6Uy5V
   Er8cojSZh46rckSe+V4nvlwko2xAGwZaNr2OEzQkPWSULhjnsSr+5R/Wy
   ogM8KV5Qjvuw2mjDmjela21z2hoOa4f21XZ2W67JNtGXlwcJbvVbIuG4Y
   k55EJ8us5i1ff7KirZ/8DGcsBJIw7Tczw80Y2RlP4e9d18HHhWYBgZoCI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21640427"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="21640427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 16:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3625393"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jan 2024 16:00:18 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUbY0-0004jK-1T;
	Tue, 30 Jan 2024 00:00:16 +0000
Date: Tue, 30 Jan 2024 07:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-for-sev-v2 10/15] WARNING: modpost: vmlinux: section
 mismatch in reference: __startup_64+0x3b4 (section: .pi.text) ->
 __ubsan_handle_out_of_bounds (section: .text)
Message-ID: <202401300704.MRTBKBOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v2
head:   b8b16573b6d0090db2f530fb9c5f049650806e61
commit: f28f64d657caaee5b5a87e69c0772c47e34a380c [10/15] modpost: Warn about calls from __pitext into other text sections
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240130/202401300704.MRTBKBOg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300704.MRTBKBOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401300704.MRTBKBOg-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: primary_startup_64+0x33 (section: .pi.text) -> sme_enable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vc_no_ghcb+0x46 (section: .pi.text) -> do_vc_no_ghcb (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x16 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1e (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x79 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x84 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0xa8 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x12b (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x13f (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x195 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1eb (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x20c (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x28d (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x2ea (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x318 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x355 (section: .pi.text) -> sme_get_me_mask (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x3b4 (section: .pi.text) -> __ubsan_handle_out_of_bounds (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x3ce (section: .pi.text) -> __ubsan_handle_out_of_bounds (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x3e2 (section: .pi.text) -> __ubsan_handle_out_of_bounds (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x8 (section: .pi.text) -> sme_encrypt_kernel (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0xd (section: .pi.text) -> sme_get_me_mask (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x34 (section: .pi.text) -> __phys_addr (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x3f (section: .pi.text) -> __phys_addr (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x4f (section: .pi.text) -> early_snp_set_memory_shared (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x57 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x5f (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x83 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x33 (section: .pi.text) -> init_idt_data (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x43 (section: .pi.text) -> idt_init_desc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x4b (section: .pi.text) -> native_write_idt_entry (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: startup_64_setup_env+0x21 (section: .pi.text) -> native_load_gdt (section: .text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-shadow-fix1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-shadow-fix2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-demo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-busymod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/fprobe/fprobe_example.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
