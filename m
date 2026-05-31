Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68968248B
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 04:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780202825; cv=none; b=ULkU+j7MYCuxJZSMBR8TSE7xsqGlri3U/R0lArGtg4KTpXjfyDd3B/P69Nd+l27LX1QT3IGbP0c/f5GYz7T+s9cO4HF9rNWj+VPlboDlMhJdgxd64dFFMfwIAmFbzwdBB9ccY7nTyTSBEOq19r61CQzWH6gIapjFQguFIe3ekPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780202825; c=relaxed/simple;
	bh=XvhIQLWC3boYEifvK8Sf2/OEjo0q24io30sgE9T8Mrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d8NawZLZsK8lEKqTUKDc1ZEX7k+EcUYsjKl1gqOPIkqFPk3ICiUp4qwm0cbQXK0FfciftzC3p9HG9yFpsWtUgPpDD2ppfqWUgyICAC0/lQxtb+JHVU52ac8sOxhQGbqnP5W929AAZ3cMWWf5W1YZF8AofFdQXM/o2CvZR6uxy5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAMe1FVQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAMe1FVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780202822; x=1811738822;
  h=date:from:to:cc:subject:message-id;
  bh=XvhIQLWC3boYEifvK8Sf2/OEjo0q24io30sgE9T8Mrk=;
  b=dAMe1FVQFoahnfzSVArZJ7LgQ9qbJLx3x+C7zwHMg9xADpAIU0R8ypkA
   8JJyZlmFAxZuk6ljBZGgPAmk+3PcqXmWDsPFBng56yj1ZVyIotokDu2xq
   5a9KPQfTCDfAm8lSNLZwm0o3BBxgQP4lpGH9Qv5FfT85ou68mJmuoyve2
   6NiCJu9qmNyFE5HnzaTKDm3hQPG8V/q0RJj1fKRU4ZN2iDgqzzPh7LtdS
   77hPp1pAw/ux+CMWw2laGBHzb1Ber8Y5c6uB26073n0hbDc815RVI7SFU
   xn4U91ZDUWEcZA6OfJ7EdnhWPVr99Zv4McJJ2AsNXOqbYGERJTjJB9e2P
   g==;
X-CSE-ConnectionGUID: Mh2d3AVgR6ic1xeFEJ9HHQ==
X-CSE-MsgGUID: GGfLdrGVQKqO+U38UDBxFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="80138552"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="80138552"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 21:47:01 -0700
X-CSE-ConnectionGUID: 5UwrJUwgTha01oCSIDLjOg==
X-CSE-MsgGUID: xbMAZxAnT7C47qbMkx+s+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="273531211"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 May 2026 21:47:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTY4g-000000009AQ-0UEq;
	Sun, 31 May 2026 04:46:58 +0000
Date: Sun, 31 May 2026 12:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mda-next:tmp/24826 174/177] ERROR: modpost:
 __ex_table+0x1894 references non-executable section '.debug_line_str'
Message-ID: <202605311209.T9YmesMK-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git tmp/24826
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 06dbf0dfbd3472001be4626a664d2267c6a1eaab [174/177] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-001-20260531 (https://download.01.org/0day-ci/archive/20260531/202605311209.T9YmesMK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605311209.T9YmesMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605311209.T9YmesMK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: ntb_qp_link_cleanup+0x78 (section: .text.unlikely.) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ntb_qp_link_cleanup+0x8c (section: .text.unlikely.) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_aif_in_event+0x44 (section: .text.unlikely.) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_aif_in_event+0x48 (section: .text.unlikely.) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_aif_in_event+0x4c (section: .text.unlikely.) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_aif_in_event+0x50 (section: .text.unlikely.) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_aif_in_event+0x64 (section: .text.unlikely.) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_state+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_name+0x14 (section: .data) -> soc_early_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_dev_list+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_dev_list+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_dev_list_lock+0x2c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_basic_events_attrs+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_event_clock+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_cache_events_attrs+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_cache_events_attrs+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_events_groups+0x4 (section: .data) -> init_sched_fair_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_events_groups+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_events_groups+0xc (section: .data) -> .Lpcrel_hi122 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fme_perf_events_groups+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_echo_monitor_mixer+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: es8311_i2c_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_driver+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_driver+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x20 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x3c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x4c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x50 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x54 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x6c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x7c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hdmi_codec_controls+0x80 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5645_i2c_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5645_i2c_driver+0x58 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5645_i2c_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_i2c_driver+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_i2c_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_i2c_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_spf_mode+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_spf_mode+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_spf_mode+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_spf_mode+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_deemp+0x0 (section: .data) -> init_mknod (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_deemp+0x4 (section: .data) -> init_mknod (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_deemp+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_deemp+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_deemp+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_sel_ns+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_sel_ns+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_mix_control+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_mix_control+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_mix_control+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_mix_control+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_sdet_setting+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_sdet_setting+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_sdet_setting+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_sdet_setting+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_os_setting+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_os_setting+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_os_setting+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_input_sel+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_input_sel+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_input_sel+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_input_sel+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_output_sel+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_output_sel+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_capture_sel+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_capture_sel+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x34 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x40 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x70 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0xa8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0xdc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x118 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x150 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x184 (section: .data) -> init_symlink (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uda1380_dai+0x190 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsl_micfil_driver+0x0 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1824 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1830 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x183c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x183c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> __export_symbol_devm_free_irq (section: .export_symbol)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.export_symbol'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .L.str.4 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> $d (section: .debug_line_str)
>> ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1900 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1914 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1914 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1918 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> __UNIQUE_ID_addressable___msi_unlock_descs_340 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1938 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1944 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x195c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x195c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
