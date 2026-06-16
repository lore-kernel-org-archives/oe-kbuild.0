Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE13C0A16
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781576963; cv=none; b=p+RY3cry1jMmI6SrePq1ARfRanyBKedbnUZLCvZn9qGpCBp0sThIepUy2VYa1YgeWV8fN2FwdJhb6CwAJjE+qU7utq0BrU5YoPJS3NZD2kQ/eh0YWtALzl1lKwhwA/Fti/ggmahYVOL+BdQJVCrTFpSQgCNXutrztAQP6T0rHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781576963; c=relaxed/simple;
	bh=Fi++9mEa+4Jq3qbgSb7/7vnAe0MCfmxISB+l+fjvWAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nK3CA4jr6J2PAOFWBbnn98K7bBdtDTS+hYV9srNL9jPfI5hS0+LRaqSXJ/sAcLt4pGjSv0ZfxIxwmpdUQkxwf48oUkWOag+IrRlfTTGuH9ezx1hUlKkrmwdAdBpsg3wYkFLsK1BXwOS+0qHG74PYqfXAqYfhmH362fVjSQjj0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSG1hH08; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSG1hH08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781576961; x=1813112961;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fi++9mEa+4Jq3qbgSb7/7vnAe0MCfmxISB+l+fjvWAU=;
  b=aSG1hH08a19vYzU8aWAw+JRy/3XBOTVhrfNZbfsnw9L1+U/7nL+/3xaM
   p+5cgnYgAK2+rqRv7jwiZnBQ7/DuUnUCGvUcxEbzzPAzrAS5vJfn5+top
   BU/dnNCHTHSh0aE+YtRb0vFiEzx1BXuELE4VpmHJBYWcOeELpDMKkhlbd
   O9la9lbihRMwM/7Zp7YoKrMHMfEmcEQpj28qTOuzcVIhVnTJp04CxNuyo
   QT3W8IRzAzd3HZX4UV2C5UGwMkvdy53PYi1qhkbX3+hYsY3eQwrVNQFuf
   RIcKhA677E3zIrtrxoF1QiMcX5CIwmcMdTZPE/UJ11BavRueab3JdIib4
   w==;
X-CSE-ConnectionGUID: hNRqrslUR822rOFsNYhyOg==
X-CSE-MsgGUID: BR7Y6JeaQReF4Mi+lkEOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82395711"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82395711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 19:29:21 -0700
X-CSE-ConnectionGUID: HcxUBgbYQQidMekLYKX6EA==
X-CSE-MsgGUID: kUA6faMJTTuCNvXdvW+pxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="243270803"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jun 2026 19:29:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZJYD-00000000SdW-15H2;
	Tue, 16 Jun 2026 02:29:17 +0000
Date: Tue, 16 Jun 2026 10:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: __ex_table+0x1950 references non-executable
 section '.debug_str'
Message-ID: <202606161033.udWkrGoI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "riscv arch toolchain issue"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Daniel Gomez <da.gomez@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 818783c804bc051f7faf0ac226b5597f8259c6f8 module: make structure def=
initions always visible
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-002-20260616 (https://download.01.org/0day-ci/arch=
ive/20260616/202606161033.udWkrGoI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19=
d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260616/202606161033.udWkrGoI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 818783c804bc ("module: make structure definitions always visible")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606161033.udWkrGoI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: kobject_rename+0x=
9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_rename+0x=
aa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x348 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x350 (section: .text) -> $xrv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zab=
ha1p0_zacas1p0_zalrsc1p0_zca1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x366 (section: .text) -> $xrv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zab=
ha1p0_zacas1p0_zalrsc1p0_zca1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x388 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x38c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x3a8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_en=
v+0x3c8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_uevent_var+0x=
44 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_uevent_var+0x=
50 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_uevent_var+0x=
54 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_uevent_var+0x=
62 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_uevent_var+0x=
88 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uevent_net_rcv_sk=
b+0x62 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uevent_net_rcv_sk=
b+0x66 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_type=
+0xfc (section: .text) -> kernel_panic_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_type=
+0x112 (section: .text) -> kernel_panic_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_type=
+0x122 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_type=
+0x126 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0x9f8 (section: .text) -> register_warn_debugfs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xa5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xa8c (section: .text) -> panic_on_taint_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xaa6 (section: .text) -> panic_on_taint_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xabc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xaec (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xaf8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entr=
y+0xb66 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x3e (section: .text) -> boot_cpu_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x42 (section: .text) -> boot_cpu_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x56 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x82 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x86 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
xa4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
xba (section: .text) -> boot_cpu_hotplug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
xd2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
xd4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
xd8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x1a4 (section: .text) -> mitigations_parse_cmdline (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x1d2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x1de (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x1e8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x222 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x234 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x262 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x2ce (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x2e4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_alloc_nodes+0=
x386 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_insert_rang=
e+0x212 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x254 =
(section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x27c =
(section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x290 =
(section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x2b4 =
(section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x2c6 =
(section: .text) -> $xrv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zabha1p0_za=
cas1p0_zalrsc1p0_zca1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x2e0 =
(section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x2ea =
(section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x3e4 =
(section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x436 =
(section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x456 =
(section: .text) -> $xrv32i2p1_m2p0_a2p1_zmmul1p0_zaamo1p0_zabha1p0_zacas1p=
0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x476 =
(section: .text) -> .Ltmp13 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x29=
8 (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x2b=
6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x2b=
a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x2c=
6 (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x2d=
0 (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x31=
c (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x46 (s=
ection: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x50 (s=
ection: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x5a (s=
ection: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x60 (s=
ection: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x64 (s=
ection: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x68 (s=
ection: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x8c (s=
ection: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x98 (s=
ection: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0xc0 (s=
ection: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0xcc (s=
ection: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x112 (=
section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x126 (=
section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x130 (=
section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_del+0x152 (=
section: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: plist_requeue+0x2=
4 (section: .text) -> __setup_str_reserve_setup (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: idr_get_free+0x3f=
c (section: .text) -> file_caps_disable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string+0=
x7ec (section: .text) -> __setup_str_setup_print_fatal_signals (section: .i=
nit.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string+0=
x7ee (section: .text) -> __setup_setup_print_fatal_signals (section: .init.=
setup)
WARNING: modpost: vmlinux: section mismatch in reference: autofs_fs_type+0x=
8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: autofs_fs_type+0x=
c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: autofs_fs_type+0x=
14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fuse_miscdevice+0=
x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fuse_mutex+0x14 (=
section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fuse_mutex+0x18 (=
section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fuse_mutex+0x1c (=
section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_request_=
mutex+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_request_=
mutex+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_request_=
mutex+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_request_=
list_waitq+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_request_=
list_waitq+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_fs_type+=
0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_fs_type+=
0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: orangefs_fs_type+=
0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: =
__ex_table) -> .L0  (section: .debug_str)
>> ERROR: modpost: __ex_table+0x1950 references non-executable section '.de=
bug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x195c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x195c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.debug=
_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
