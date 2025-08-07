Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353E26D4C0
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586633; cv=none; b=giVOh1AUDip3lLNatxt5TF7IKQz7Zm61rlhyQXX71v5DhCbAKT/VJzPXa4K2YHW3H0slRXuwNMM02/OEqkrkN4hJbI+3MnjrvDxP2STZjBc+gCE+JMYMeTJ+jpBEUZhJTmvsJqsD+/vaiRsdCqip/+MvhtsU6Qc/bEj50nL1IfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586633; c=relaxed/simple;
	bh=BfImkdO2TAXYNvmX479aWJ+m36i/L62ve7Fhi4ArQbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXyykWPw56HweIudMEMoNi9JjW/zvhxTQ2VEnt1OKTsZYHrjuGBxe5yIG07DJmktBT58Rv1J3w9Rg8Vfme+xDFYKQdFt2p0DriF6TZynx/CQadat8bdWJ4QiSJpN61McJdJr2dXNsOOiBTiTSwU/3BSia3qodPjqNvthT5VwjVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPcdrjjn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPcdrjjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754586631; x=1786122631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BfImkdO2TAXYNvmX479aWJ+m36i/L62ve7Fhi4ArQbg=;
  b=DPcdrjjnuBbx5x4BjWAhhG+6KOLX0N8SkplOZctYdvvQAqoRHfJxEn0x
   zExep3CmFccrK1fnML8/P4QnVIEWbRU6BN2usikPNarO9dqc5SFC/4UAI
   R5bG/9RWdGpe1Y3GKyLqb+6uZz16QUiYk5g8Wc+aWocPvWZ6diUye5kl2
   LiQBYoASry5lCmnnZsepdJQShToitQ4wXw1ImwAzISVghW9TuIuXuw8eT
   WpBDirMOoapzH9/TRncs1Fr4k80wKs4oLD734I8h7QkI8w7BXcoWDPM+x
   ND/WuiuP0iMKXkRRxUrbVV2YLuPgmTGg3dNxozMLPADtkmszsusgYCeK3
   g==;
X-CSE-ConnectionGUID: Gidrbl6UQQGY27brAchmhw==
X-CSE-MsgGUID: fgl34lwbSZK9Uo3fMaQJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74509005"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74509005"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:10:30 -0700
X-CSE-ConnectionGUID: VTfRMF1dTFCPmMbgLoHBlg==
X-CSE-MsgGUID: oljh5faYTlembrrEnHj6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169248492"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2025 10:10:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk482-00032A-2W;
	Thu, 07 Aug 2025 17:10:18 +0000
Date: Fri, 8 Aug 2025 01:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brgl:gpio/for-next 5/5] ERROR: modpost: __ex_table+0x1590
 references non-executable section '.rodata.mlxfw_firmware_flash.str1.4'
Message-ID: <202508080140.GHJXsIcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   d9d87d90cc0b10cd56ae353f50b11417e7d21712
commit: d9d87d90cc0b10cd56ae353f50b11417e7d21712 [5/5] treewide: rename GPIO set callbacks back to their original names
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080140.GHJXsIcx-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080140.GHJXsIcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080140.GHJXsIcx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0x36 (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0x58 (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0x66 (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0x6c (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0x70 (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0x98 (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev_shared+0xbc (section: .text.xp_assign_dev_shared) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x12 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x1e (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x24 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x28 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x38 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x40 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x72 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x78 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x7c (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x8a (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0xac (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0xc2 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0xde (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0xe0 (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0xea (section: .text.xp_clear_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_release_deferred+0x30 (section: .text.xp_release_deferred) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_release_deferred+0x42 (section: .text.xp_release_deferred) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_release_deferred+0x5e (section: .text.xp_release_deferred) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_pool+0x12 (section: .text.xp_get_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_pool+0x14 (section: .text.xp_get_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_pool+0x1a (section: .text.xp_get_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_pool+0x46 (section: .text.xp_get_pool) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x0 (section: .text.xp_put_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x1c (section: .text.xp_put_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x22 (section: .text.xp_put_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x3c (section: .text.xp_put_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x56 (section: .text.xp_put_pool) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x5a (section: .text.xp_put_pool) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x5e (section: .text.xp_put_pool) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x62 (section: .text.xp_put_pool) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x76 (section: .text.xp_put_pool) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x84 (section: .text.xp_put_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nextprop_.part.3+0x3c (section: .text.nextprop_.part.3) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fdt_get_string+0x104 (section: .text.fdt_get_string) -> ics932s401_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: fdt_getprop_by_offset+0xd4 (section: .text.fdt_getprop_by_offset) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fdt_parent_offset+0x1e (section: .text.fdt_parent_offset) -> ics932s401_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __fprop_add_percpu+0x3a (section: .text.__fprop_add_percpu) -> lkdtm_bugs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __fprop_add_percpu+0x46 (section: .text.__fprop_add_percpu) -> lkdtm_heap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __fprop_add_percpu+0x52 (section: .text.__fprop_add_percpu) -> lkdtm_heap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __fprop_add_percpu+0x5e (section: .text.__fprop_add_percpu) -> lkdtm_heap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x10 (section: .text.mas_find_range) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x14 (section: .text.mas_find_range) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x18 (section: .text.mas_find_range) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x3c (section: .text.mas_find_range) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x42 (section: .text.mas_find_range) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x46 (section: .text.mas_find_range) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0x4c (section: .text.mas_find_range) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_range+0xda (section: .text.mas_find_range) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x1aa (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x24a (section: .text.mas_wr_store_entry) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x3d6 (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x424 (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x430 (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x43e (section: .text.mas_wr_store_entry) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x458 (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x482 (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_rev_setup.constprop.68+0x1a (section: .text.mas_find_rev_setup.constprop.68) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_rev_setup.constprop.68+0x1e (section: .text.mas_find_rev_setup.constprop.68) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_find_rev_setup.constprop.68+0x13e (section: .text.mas_find_rev_setup.constprop.68) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_cyclic+0x8a (section: .text.mtree_alloc_cyclic) -> wm8400_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x90 (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x94 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x9e (section: .text.resource_string.isra.12) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xb2 (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xc4 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xc8 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_find_after+0x158 (section: .text.xa_find_after) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_find_after+0x164 (section: .text.xa_find_after) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_find_after+0x16c (section: .text.xa_find_after) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_find_after+0x1a6 (section: .text.xa_find_after) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_find_after+0x1be (section: .text.xa_find_after) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_find_after+0x1ca (section: .text.xa_find_after) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.LVL202+0x0 (section: .init.text.fdt_set_name) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_set_name) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_set_name) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_set_name) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.LVL219+0x0 (section: .init.text.fdt_setprop_placeholder) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_setprop_placeholder) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x2 (section: .init.text.fdt_setprop_placeholder) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_setprop) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_setprop) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.LVL252+0x0 (section: .init.text.fdt_appendprop) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_appendprop) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_appendprop) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_add_subnode_namelen) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.fdt_add_subnode_namelen) -> bcm590xx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x2 (section: .init.text.fdt_open_into) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.efi_retrieve_tcg2_eventlog.isra.0) -> lp87565_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> __msg (section: .rodata.__msg.71880)
ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.__msg.71880'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> __msg (section: .rodata.__msg.71884)
ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.__msg.71884'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.mlxfw_firmware_flash.str1.4)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.mlxfw_firmware_flash.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> mlxfw_mfa2_comp_magic (section: .rodata.mlxfw_mfa2_comp_magic)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.mlxfw_mfa2_comp_magic'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> __func__ (section: .rodata.__func__.77794)
ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.__func__.77794'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> mlxfw_mfa2_comp_magic (section: .rodata.mlxfw_mfa2_comp_magic)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.mlxfw_mfa2_comp_magic'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> iomem_resource (section: .data.rel.local.iomem_resource)
>> ERROR: modpost: __ex_table+0x15ac references non-executable section '.data.rel.local.iomem_resource'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF213 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF215 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF217 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF219 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF223 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF225 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF219 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF228 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF219 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF231 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF233 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF265 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF267 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF269 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF271 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF2906 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF2908 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF3320 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF3322 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF3324 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF3322 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF3327 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF3322 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF3330 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF3332 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF3334 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF3322 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF1383 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF1385 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF1387 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF1389 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> .LASF2971 (section: .debug_str)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> .LASF2973 (section: .debug_str)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1818 (section: __ex_table) -> .LASF2975 (section: .debug_str)
ERROR: modpost: __ex_table+0x1818 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x181c (section: __ex_table) -> .LASF2977 (section: .debug_str)
ERROR: modpost: __ex_table+0x181c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .LASF2979 (section: .debug_str)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1828 (section: __ex_table) -> .LASF2977 (section: .debug_str)
ERROR: modpost: __ex_table+0x1828 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1830 (section: __ex_table) -> .LASF2982 (section: .debug_str)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> .LASF2977 (section: .debug_str)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x183c (section: __ex_table) -> .LASF2985 (section: .debug_str)
ERROR: modpost: __ex_table+0x183c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .LASF2977 (section: .debug_str)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .LASF2988 (section: .debug_str)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x184c (section: __ex_table) -> .LASF2977 (section: .debug_str)
ERROR: modpost: __ex_table+0x184c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .LASF2991 (section: .debug_str)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .LASF2993 (section: .debug_str)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> pcpu_async_enabled (section: .bss.pcpu_async_enabled)
>> ERROR: modpost: __ex_table+0x1870 references non-executable section '.bss.pcpu_async_enabled'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> pcpu_nr_populated (section: .bss.pcpu_nr_populated)
>> ERROR: modpost: __ex_table+0x1878 references non-executable section '.bss.pcpu_nr_populated'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> __already_done (section: .data..once)
>> ERROR: modpost: __ex_table+0x187c references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> __already_done (section: .data..once)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> __already_done (section: .data..once)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> pcpu_free_slot (section: .data..ro_after_init)
>> ERROR: modpost: __ex_table+0x1890 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> pcpu_low_unit_cpu (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> pcpu_unit_pages (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x189c references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a0 (section: __ex_table) -> pcpu_nr_groups (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18a0 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> pcpu_group_offsets (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> pcpu_group_sizes (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> __warned (section: .data..unlikely)
>> ERROR: modpost: __ex_table+0x18b4 references non-executable section '.data..unlikely'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> pcpu_group_sizes (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c0 (section: __ex_table) -> print_fmt_percpu_create_chunk (section: .data.print_fmt_percpu_create_chunk)
>> ERROR: modpost: __ex_table+0x18c0 references non-executable section '.data.print_fmt_percpu_create_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c4 (section: __ex_table) -> pcpu_group_sizes (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18c4 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> event_percpu_alloc_percpu (section: .data.rel.local.event_percpu_alloc_percpu)
>> ERROR: modpost: __ex_table+0x18cc references non-executable section '.data.rel.local.event_percpu_alloc_percpu'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> pcpu_group_sizes (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> event_percpu_alloc_percpu_fail (section: .data.rel.local.event_percpu_alloc_percpu_fail)
>> ERROR: modpost: __ex_table+0x18d8 references non-executable section '.data.rel.local.event_percpu_alloc_percpu_fail'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> pcpu_group_sizes (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> event_percpu_create_chunk (section: .data.rel.local.event_percpu_create_chunk)
>> ERROR: modpost: __ex_table+0x18e4 references non-executable section '.data.rel.local.event_percpu_create_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> pcpu_group_sizes (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LLST15 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LLST17 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LLST19 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LLST17 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF4020 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF4021 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LLST17 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF1955 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF1957 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF1959 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF1961 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF1963 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF1965 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF1967 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF1969 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF1971 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF1973 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF1975 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF1977 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> scrollback_phys_max (section: .bss.scrollback_phys_max)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '.bss.scrollback_phys_max'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c68 (section: __ex_table) -> .LASF2337 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c6c (section: __ex_table) -> .LASF2339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c74 (section: __ex_table) -> .LASF2341 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c78 (section: __ex_table) -> .LASF2339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c80 (section: __ex_table) -> .LASF2344 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c84 (section: __ex_table) -> .LASF2339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c8c (section: __ex_table) -> .LASF2347 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> .LASF2339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c98 (section: __ex_table) -> .LASF2350 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c9c (section: __ex_table) -> .LASF2339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb0 (section: __ex_table) -> .LLST52 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1cb0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ccc (section: __ex_table) -> .LLST54 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ccc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd4 (section: __ex_table) -> .LLST55 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1cd4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce4 (section: __ex_table) -> .LLST58 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ce4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf0 (section: __ex_table) -> .LLST60 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1cf0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cfc (section: __ex_table) -> .LLST64 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1cfc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d08 (section: __ex_table) -> .LLST66 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d08 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d14 (section: __ex_table) -> .LLST68 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d14 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> .LLST650 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f2c (section: __ex_table) -> .LASF3079 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> .LASF217 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> .LASF219 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> .LASF3054 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> .LASF3056 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> .LASF920 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> .LASF922 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> .LASF575 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> .LASF577 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> .LASF579 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
