Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7138E
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 00:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706487117; cv=none; b=oKvBphd3rcQ/Zgiw4rZiGu+1OlG+h+mNbpsqdhzPYLbbJ87v5BeLas+1HIvcMBzwB+16eV7cqJD1X/WewCwSlgS3o+9qwUyKQ6Atea+fT/zL2t4n6q/HDfodFf5RERO6BFBwkcNll0/wUup5w7wO84f70LAg3c0uSjudNPu7A+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706487117; c=relaxed/simple;
	bh=MyEfg+rdN6fCzIbqMFkGm7UzCHBeIJM/JoMcvtbm9PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6CcqEjE/xdmUpgEUtpIl0YEsyGoRAZN+BlP2MgY8+bW1fqD012EdERU73B/sZiw29x/8MX1gr12j2a3oyKYhMGLd3hKVt4Rhs6RkMIq58PjCOsZeKJZa0sjGj0U8ea95i5ougRjP1Qrl54DHoHCztT/urcIrTwMb/4t64MBNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/HCggEl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/HCggEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706487115; x=1738023115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyEfg+rdN6fCzIbqMFkGm7UzCHBeIJM/JoMcvtbm9PM=;
  b=V/HCggElmGyeZ3N2KpjMvcT1dNRCZ0nCwIwB3T0HOPoyR57wf2lzyLlq
   S3pCWC1254IW+v7nK6XBOxHPzTwNZYUEBYSuoiAfrqNb401A1l8/yEOTJ
   /8m4IHkxTWcgziskwyh56dQNCvQWTJuF27PN7+ubs5wV+eM9ghDXw9cRn
   S4cY8fBKGcXFwqCw1or7jqM27FLNdXsSO3Ymq/2bw0epUlqBDtvessGiG
   6BaEhvAJcnYI40fqN+LXrcD+zw5kvt/gKAQFkCFrB70YmOAmbZkOCo0IN
   1+U7oyQHdPJEYaZyLAVaViwJJUEKaLSJ8r/h+UsQqqKJXBB8+S5rlD5T2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16342951"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="16342951"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 16:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118772003"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="1118772003"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2024 16:11:52 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUFFd-0003sG-1N;
	Mon, 29 Jan 2024 00:11:49 +0000
Date: Mon, 29 Jan 2024 08:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-for-sev-v2 10/15] WARNING: modpost: vmlinux: section
 mismatch in reference: __startup_64+0x12 (section: .pi.text) ->
 native_read_cr4 (section: .text)
Message-ID: <202401290809.OLhXsbgo-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240129/202401290809.OLhXsbgo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290809.OLhXsbgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401290809.OLhXsbgo-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: primary_startup_64+0x33 (section: .pi.text) -> sme_enable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vc_no_ghcb+0x42 (section: .pi.text) -> do_vc_no_ghcb (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x12 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1a (section: .pi.text) -> native_read_cr4 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x74 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x7f (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0xa4 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x11b (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x130 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x18b (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1cf (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1ec (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x26d (section: .pi.text) -> sme_get_me_mask (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x2c8 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x300 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x33d (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x8 (section: .pi.text) -> sme_encrypt_kernel (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0xd (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x6e (section: .pi.text) -> early_snp_set_memory_shared (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x76 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x7e (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0xa4 (section: .pi.text) -> sme_get_me_mask (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x3d (section: .pi.text) -> init_idt_data (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x4d (section: .pi.text) -> idt_init_desc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x55 (section: .pi.text) -> native_write_idt_entry (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: startup_64_setup_env+0x1d (section: .pi.text) -> native_load_gdt (section: .text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-uncore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-cstate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/rapl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kernel/cpu/mce/mce-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/crypto/crc32-pclmul.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-intel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-amd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/hwpoison-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in block/t10-pi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libpoly1305.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_kmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_bm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_fsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-pf-stub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/acpi_tad.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/platform_profile.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/nfit/nfit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/dmatest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/ioat/ioatdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-evtchn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-privcmd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/n_hdlc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/n_gsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-gtt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/tlclk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/i915/kvmgt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/brd.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
