Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02615271476
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756855371; cv=none; b=XRckgfl+476SenakPSFlUWIT7tlI7vLhZY3o8NI5bzBfe0RXsQD6dPk6OR5Cu3Ww886IwstdUpMCp1m7GoPNwjYNSuBNesUIGo2IXR28hxezf5ln7sLMOrR85Xkef+M2eDepjT6QofqxcNydSrF9XnZP2MMMq+sEs8qVUfYV9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756855371; c=relaxed/simple;
	bh=jsz7Yieg6nZiTsS3V5SAmSMXI3VhWo5NdJKEWseNJgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKJvHrNxZGy2B4V8CO+6+SMHtWnY2+Hl56kLiYQgZTkPEghuVRuDl/N1KdMDrJbSboA+0sudF9SR6ue/tiP66vxgAa1ADjAGIZSyq8zcSizgKuMGRuCh9erYFVEUHmAWNM7kLo03k+qKKlJI3pJ02UFm8V7RtbckbBGew5gd6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJDNQqUy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJDNQqUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756855368; x=1788391368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jsz7Yieg6nZiTsS3V5SAmSMXI3VhWo5NdJKEWseNJgA=;
  b=FJDNQqUyyfY7d0RArBBdtM+7FR2ABCcpyrLQxm3Ao2jb+tunuRDeSF0K
   dW2EZ5oynvMrAvyKoQJmB4sKJkF5T1Drs++ORrmjdiwy7/1JPNxAzF3T5
   1IgRNJt8GdiqdcM/RhfG48v6qpiaOTN4K49jM8rDEyEkZnIMJjQ7egl/7
   Odshsamesd7P3eY648q8TthqaAcTMuGL/kEyMPZH5veSMsqTa+qS51NMr
   haB8Sn2Ufm6B/HSHaBsU/KVtNS4wogILL8h3kpMldPm8B7C4X0nVgJtBl
   DL1ndzC9IsVvABiB7aUTjOx0/k8I6ORJIHhOXHqKST+HF0IzHj6q//YEp
   Q==;
X-CSE-ConnectionGUID: QAAq4UpUTpeUsGrwRdMIuQ==
X-CSE-MsgGUID: Fu0GXLfPTPeFfeLSvxgOGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58187994"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58187994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 16:22:47 -0700
X-CSE-ConnectionGUID: IzJByz/4R/6oSqKlcFK7FA==
X-CSE-MsgGUID: yzJUfP1SSRa1UFQx96PPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175573125"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Sep 2025 16:22:45 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utaKD-00037P-0Q;
	Tue, 02 Sep 2025 23:22:22 +0000
Date: Wed, 3 Sep 2025 07:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3515/5641] ERROR: modpost: __ex_table+0x29b8
 references non-executable section '__bpf_raw_tp_map'
Message-ID: <202509030729.81OzDqfB-lkp@intel.com>
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
TO: Daniel Golle <daniel@makrotopia.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: 29c10aeb316072aacb9ef4d0ebd6e0c9b0461ed3 [3515/5641] net: phy: mxl-86110: add basic support for led_brightness_set op
:::::: branch date: 18 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030729.81OzDqfB-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030729.81OzDqfB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509030729.81OzDqfB-lkp@intel.com/

Note: the linux-next/master HEAD 3db46a82d467bd23d9ebc473d872a865785299d8 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x2820 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2824 (section: __ex_table) -> .LASF3311 (section: .debug_str)
ERROR: modpost: __ex_table+0x2824 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x282c (section: __ex_table) -> .LASF3313 (section: .debug_str)
ERROR: modpost: __ex_table+0x282c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2830 (section: __ex_table) -> .LASF3315 (section: .debug_str)
ERROR: modpost: __ex_table+0x2830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2838 (section: __ex_table) -> .LASF3317 (section: .debug_str)
ERROR: modpost: __ex_table+0x2838 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x283c (section: __ex_table) -> .LASF3319 (section: .debug_str)
ERROR: modpost: __ex_table+0x283c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2844 (section: __ex_table) -> .LASF3321 (section: .debug_str)
ERROR: modpost: __ex_table+0x2844 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2848 (section: __ex_table) -> .LASF3323 (section: .debug_str)
ERROR: modpost: __ex_table+0x2848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2850 (section: __ex_table) -> .LASF3325 (section: .debug_str)
ERROR: modpost: __ex_table+0x2850 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2854 (section: __ex_table) -> .LASF3327 (section: .debug_str)
ERROR: modpost: __ex_table+0x2854 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x285c (section: __ex_table) -> .LASF3329 (section: .debug_str)
ERROR: modpost: __ex_table+0x285c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2860 (section: __ex_table) -> .LASF3331 (section: .debug_str)
ERROR: modpost: __ex_table+0x2860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2868 (section: __ex_table) -> .LASF3333 (section: .debug_str)
ERROR: modpost: __ex_table+0x2868 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x286c (section: __ex_table) -> .LASF3335 (section: .debug_str)
ERROR: modpost: __ex_table+0x286c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2874 (section: __ex_table) -> .LASF3337 (section: .debug_str)
ERROR: modpost: __ex_table+0x2874 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2878 (section: __ex_table) -> .LASF3339 (section: .debug_str)
ERROR: modpost: __ex_table+0x2878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2880 (section: __ex_table) -> .LASF3341 (section: .debug_str)
ERROR: modpost: __ex_table+0x2880 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2884 (section: __ex_table) -> .LASF3343 (section: .debug_str)
ERROR: modpost: __ex_table+0x2884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x288c (section: __ex_table) -> .LASF1589 (section: .debug_str)
ERROR: modpost: __ex_table+0x288c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2890 (section: __ex_table) -> .LASF1591 (section: .debug_str)
ERROR: modpost: __ex_table+0x2890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2898 (section: __ex_table) -> .LASF1593 (section: .debug_str)
ERROR: modpost: __ex_table+0x2898 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x289c (section: __ex_table) -> .LASF1595 (section: .debug_str)
ERROR: modpost: __ex_table+0x289c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28a4 (section: __ex_table) -> .LASF1597 (section: .debug_str)
ERROR: modpost: __ex_table+0x28a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28a8 (section: __ex_table) -> .LASF1599 (section: .debug_str)
ERROR: modpost: __ex_table+0x28a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28b0 (section: __ex_table) -> .LASF1601 (section: .debug_str)
ERROR: modpost: __ex_table+0x28b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28b4 (section: __ex_table) -> .LASF1603 (section: .debug_str)
ERROR: modpost: __ex_table+0x28b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28bc (section: __ex_table) -> .LASF1605 (section: .debug_str)
ERROR: modpost: __ex_table+0x28bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28c0 (section: __ex_table) -> .LASF1603 (section: .debug_str)
ERROR: modpost: __ex_table+0x28c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28c8 (section: __ex_table) -> .LASF1608 (section: .debug_str)
ERROR: modpost: __ex_table+0x28c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28cc (section: __ex_table) -> .LASF1603 (section: .debug_str)
ERROR: modpost: __ex_table+0x28cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28d4 (section: __ex_table) -> .LASF4674 (section: .debug_str)
ERROR: modpost: __ex_table+0x28d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28d8 (section: __ex_table) -> .LASF4676 (section: .debug_str)
ERROR: modpost: __ex_table+0x28d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28e0 (section: __ex_table) -> .LASF4678 (section: .debug_str)
ERROR: modpost: __ex_table+0x28e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28e4 (section: __ex_table) -> .LASF4680 (section: .debug_str)
ERROR: modpost: __ex_table+0x28e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2928 (section: __ex_table) -> .LASF3390 (section: .debug_str)
ERROR: modpost: __ex_table+0x2928 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x292c (section: __ex_table) -> .LASF3392 (section: .debug_str)
ERROR: modpost: __ex_table+0x292c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2934 (section: __ex_table) -> .LASF597 (section: .debug_str)
ERROR: modpost: __ex_table+0x2934 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2938 (section: __ex_table) -> .LASF599 (section: .debug_str)
ERROR: modpost: __ex_table+0x2938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2940 (section: __ex_table) -> .LASF601 (section: .debug_str)
ERROR: modpost: __ex_table+0x2940 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2944 (section: __ex_table) -> .LASF603 (section: .debug_str)
ERROR: modpost: __ex_table+0x2944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x294c (section: __ex_table) -> .LASF4457 (section: .debug_str)
ERROR: modpost: __ex_table+0x294c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2950 (section: __ex_table) -> .LASF4459 (section: .debug_str)
ERROR: modpost: __ex_table+0x2950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2958 (section: __ex_table) -> .LASF4461 (section: .debug_str)
ERROR: modpost: __ex_table+0x2958 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x295c (section: __ex_table) -> .LASF4463 (section: .debug_str)
ERROR: modpost: __ex_table+0x295c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2964 (section: __ex_table) -> .LASF4465 (section: .debug_str)
ERROR: modpost: __ex_table+0x2964 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2968 (section: __ex_table) -> .LASF4463 (section: .debug_str)
ERROR: modpost: __ex_table+0x2968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2970 (section: __ex_table) -> .LASF4468 (section: .debug_str)
ERROR: modpost: __ex_table+0x2970 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2974 (section: __ex_table) -> .LASF4463 (section: .debug_str)
ERROR: modpost: __ex_table+0x2974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x297c (section: __ex_table) -> .LASF4471 (section: .debug_str)
ERROR: modpost: __ex_table+0x297c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2980 (section: __ex_table) -> .LASF4473 (section: .debug_str)
ERROR: modpost: __ex_table+0x2980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29b8 (section: __ex_table) -> __bpf_trace_tp_map_xfs_blockgc_free_space (section: __bpf_raw_tp_map)
>> ERROR: modpost: __ex_table+0x29b8 references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29bc (section: __ex_table) -> __bpf_trace_tp_map_xfs_quota_expiry_range (section: __bpf_raw_tp_map)
ERROR: modpost: __ex_table+0x29bc references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: event_ext4_es_lookup_extent_enter+0xc (section: .data) -> .LVL234 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_gc_gens_start+0xc (section: .data) -> xfs_inobt_init_cur_cache (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max8660_driver+0x4 (section: .data) -> .LBE2232 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_driver+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_driver+0x64 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_regulator_desc+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_regulator_desc+0x2c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_regulator_desc+0x54 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max77857_regulator_desc+0xe4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt4801_driver+0x4 (section: .data) -> workqueue_unbound_cpus_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tps6594_bucks_irq_types+0x0 (section: .data) -> reboot_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tps6594_bucks_irq_types+0x4 (section: .data) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tps6594_bucks_irq_types+0x8 (section: .data) -> reboot_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tty_ldisc_packet+0x10 (section: .data) -> sched_debug_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_rx_trig_bytes+0x14 (section: .data) -> .LBE846 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: intel_rng+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: intel_rng+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: intel_rng+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: intel_rng+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: intel_rng+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mxc_rnga_driver+0x4 (section: .data) -> .LVL2370 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mxc_rnga_driver+0x2c (section: .data) -> .LBB30517 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: komeda_sysfs_attr_group+0x10 (section: .data) -> .LBE6424 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: komeda_sysfs_entries+0x0 (section: .data) -> .LBB6425 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: komeda_sysfs_entries+0x4 (section: .data) -> .LBE6425 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: komeda_sysfs_entries+0x8 (section: .data) -> .LBE6440 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: amdgpu_pci_err_handler+0x8 (section: .data) -> xfs_exchmaps_intent_init_cache (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ip_hw_attr+0x2c (section: .data) -> init_user_buckets (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ip_hw_attr+0x44 (section: .data) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gfx_v9_4_2_ras+0x40 (section: .data) -> set_proc_pid_nlink (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdma_v4_4_2_ras+0x3c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cxl_base_attributes+0x0 (section: .data) -> .LVL487 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cxl_base_attributes+0x4 (section: .data) -> .LVL488 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_cxl_memory_module+0x20 (section: .data) -> sel_netport_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_cxl_dram+0x20 (section: .data) -> ebitmap_cache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hpsa_pci_driver+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_rescan+0x0 (section: .data) -> ima_template_fmt_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mpt3sas_driver+0x4 (section: .data) -> md5_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mpt3sas_driver+0x18 (section: .data) -> crypto_xcbc_module_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: beiscsi_iscsi_transport+0x48 (section: .data) -> .LBE486 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pm_notifier+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vm_notifier+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dp83865_driver+0x6c (section: .data) -> .LBB4927 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dp83865_driver+0x98 (section: .data) -> .LVL558 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dp83865_driver+0x9c (section: .data) -> .LBE4927 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ncn26000_driver+0x54 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ncn26000_driver+0x6c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ncn26000_driver+0x8c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ncn26000_driver+0x94 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ncn26000_driver+0x98 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ncn26000_driver+0x9c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x54 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x64 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x6c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x70 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x74 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x98 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x9c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xa0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xa4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xcc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xd4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xe4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xe8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xec (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0xfc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x100 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x180 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x190 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x194 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x198 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x19c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x1a0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x1c4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x1c8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x1cc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x1d0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x1f8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x200 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x210 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x214 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x218 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x228 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x22c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2ac (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2bc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2c0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2c4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2c8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2cc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2f0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2f4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2f8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x2fc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nxp_c45_driver+0x308 (section: .data) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
