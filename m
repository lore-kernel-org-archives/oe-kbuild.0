Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B126C39F
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587989; cv=none; b=WwGJ+UXrDgvEuUuj9y020w9nU7jLp07T+VFAl1Ezx1Mr959UoEO/+r+Pk9wFluTkFBD6sVYGVQUgEcq0v8bHzu35ZE+vZHKtS+N3I0bXlCcg1uAmTtqS3GGulNcsegTpC0gPFUcMGWA9aAt2+E7tcOcs6Qml3j5zuYdJagEltUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587989; c=relaxed/simple;
	bh=DBcJW1MbUdp7Kbylk9hhE5deAA2TPSXRJWAvK8B5QPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qb9KlMJBINP8AeSToAlBRsvWW5qfjyM0Me25n6Jpt3GZ3qGF+X5AJUlJzjvwr+UDFOY83H3NHisIrl8SG5YB7+sx7K16iG7Fusj7ydtvkBFoAHrtCtji1+h8nduKjNPCgGFw3bGS+0yTcyeHh/xkO/HcwvfmTes+jQW3D0pnXQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIzKHsZB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIzKHsZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754587986; x=1786123986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBcJW1MbUdp7Kbylk9hhE5deAA2TPSXRJWAvK8B5QPk=;
  b=nIzKHsZB2d+P7OOZW31RaXXfEj8Dpt9K9ZtgCQ5C7MAKTOhjmNP9tBAh
   FpF8ptc5xFYxnwCXPF4dZd/Ssk4aWq/Tk6JwiMvH8623gB8n6VsT+evjW
   uQTYlAn2ahNYRxt7Y6pIUOTaujjyk8DC1pcvEO936f/nvx1adzqS9RVCb
   FJx/b0yGQz4WTO7hE6nwG22p8Yn4iDvkhakQIkLklHPOta2K/XEY8V+vb
   tfXirMRGCDZgpflmqqtZkQ4q0gY53CJliH0EH/iiPxN67JozNec3gqTr+
   prTgamlcqjIPMiY+TSQMiuJfANarxLyiIUsMEHjZMCnf4AXeI3QwWxulR
   A==;
X-CSE-ConnectionGUID: n3/QhH5MRyq8abh5aDF08Q==
X-CSE-MsgGUID: orgxRNMNSleD96RkykGZNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67524284"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67524284"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:33:05 -0700
X-CSE-ConnectionGUID: EK+q/TkOSeOpKsRwRA8TWQ==
X-CSE-MsgGUID: MlHMNFnVS76ANCzoqlIrUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164367139"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2025 10:33:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4U8-00033A-03;
	Thu, 07 Aug 2025 17:33:00 +0000
Date: Fri, 8 Aug 2025 01:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [axboe-block:for-next 8/8] ERROR: modpost: __ex_table+0x1530
 references non-executable section '.data.rel.ro.local.mt6397_pinctrl_data'
Message-ID: <202508080115.ngpaKil7-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   9c28ff6c60ff3ceb587864b1a5d7b1ba28276e25
commit: 9c28ff6c60ff3ceb587864b1a5d7b1ba28276e25 [8/8] Merge branch 'block-6.17' into for-next
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080115.ngpaKil7-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080115.ngpaKil7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080115.ngpaKil7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: wpan_phy_resume+0x1f2 (section: .text.wpan_phy_resume) -> s6e63j0x03_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: wpan_phy_resume+0x210 (section: .text.wpan_phy_resume) -> s6e3ha8_amb577px01_wqhd_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wpan_phy_sysfs_init+0x8 (section: .text.wpan_phy_sysfs_init) -> s6e63j0x03_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wpan_phy_sysfs_init+0xc (section: .text.wpan_phy_sysfs_init) -> s6e63j0x03_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wpan_phy_sysfs_exit+0x8 (section: .text.wpan_phy_sysfs_exit) -> s6e63j0x03_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_802154_wdev_template+0x24 (section: .text.perf_trace_802154_wdev_template) -> seiko_panel_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_802154_wdev_template+0x7a (section: .text.perf_trace_802154_wdev_template) -> seiko_panel_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_802154_wdev_template+0x80 (section: .text.perf_trace_802154_wdev_template) -> seiko_panel_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_802154_rdev_trigger_scan+0x7e (section: .text.trace_event_raw_event_802154_rdev_trigger_scan) -> seiko_panel_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_802154_rdev_trigger_scan+0x84 (section: .text.trace_event_raw_event_802154_rdev_trigger_scan) -> seiko_panel_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_802154_rdev_trigger_scan+0x8e (section: .text.trace_event_raw_event_802154_rdev_trigger_scan) -> seiko_panel_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_802154_rdev_return_int+0x1c (section: .text.trace_event_raw_event_802154_rdev_return_int) -> sharp_ls060_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_raw_output_802154_le16_template+0x22 (section: .text.trace_raw_output_802154_le16_template) -> sharp_ls060_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_raw_output_802154_le16_template+0x40 (section: .text.trace_raw_output_802154_le16_template) -> seiko_panel_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_raw_output_802154_le16_template+0x44 (section: .text.trace_raw_output_802154_le16_template) -> seiko_panel_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dns_resolver_preparse+0x184 (section: .text.dns_resolver_preparse) -> truly_nt35521_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_frag_skb_buffer+0x34 (section: .text.batadv_frag_skb_buffer) -> tda998x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_frag_skb_buffer+0x98 (section: .text.batadv_frag_skb_buffer) -> tda998x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_frag_skb_buffer+0x10a (section: .text.batadv_frag_skb_buffer) -> it6263_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_node_update+0x2ba (section: .text.batadv_gw_node_update) -> it6263_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_node_update+0x2bc (section: .text.batadv_gw_node_update) -> it6505_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_node_update+0x2c2 (section: .text.batadv_gw_node_update) -> it6505_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dump+0xea (section: .text.batadv_gw_dump) -> it6505_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dump+0xf6 (section: .text.batadv_gw_dump) -> it6263_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dump+0x274 (section: .text.batadv_gw_dump) -> it6505_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dump+0x29e (section: .text.batadv_gw_dump) -> it6263_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dump+0x2fc (section: .text.batadv_gw_dump) -> it6263_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dhcp_recipient_get+0x30 (section: .text.batadv_gw_dhcp_recipient_get) -> it6505_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_dhcp_recipient_get+0x17a (section: .text.batadv_gw_dhcp_recipient_get) -> it6505_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0xa2 (section: .text.batadv_neigh_node_get) -> tc358775_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0xaa (section: .text.batadv_neigh_node_get) -> tc358775_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0xb8 (section: .text.batadv_neigh_node_get) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x132 (section: .text.batadv_neigh_node_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x17c (section: .text.batadv_neigh_node_get) -> tc358775_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x188 (section: .text.batadv_neigh_node_get) -> tc358775_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x1a0 (section: .text.batadv_neigh_node_get) -> tc358775_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x1b0 (section: .text.batadv_neigh_node_get) -> tc358775_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x1b6 (section: .text.batadv_neigh_node_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_node_get+0x1da (section: .text.batadv_neigh_node_get) -> tc358775_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_hash_find+0x11e (section: .text.batadv_orig_hash_find) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_hash_find+0x124 (section: .text.batadv_orig_hash_find) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_hash_find+0x1f2 (section: .text.batadv_orig_hash_find) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_hash_find+0x202 (section: .text.batadv_orig_hash_find) -> tc358775_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_hash_find+0x28c (section: .text.batadv_orig_hash_find) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_hash_find+0x29c (section: .text.batadv_orig_hash_find) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_node_vlan_get+0x1a4 (section: .text.batadv_orig_node_vlan_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_node_vlan_release+0x4 (section: .text.batadv_orig_node_vlan_release) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_originator_init+0x28 (section: .text.batadv_originator_init) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_originator_init+0x44 (section: .text.batadv_originator_init) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_originator_init+0x48 (section: .text.batadv_originator_init) -> dlpc3433_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_hardif_neigh_release+0x4a (section: .text.batadv_hardif_neigh_release) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_hardif_neigh_release+0x5a (section: .text.batadv_hardif_neigh_release) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_hardif_neigh_release+0x8e (section: .text.batadv_hardif_neigh_release) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_hardif_neigh_release+0x9a (section: .text.batadv_hardif_neigh_release) -> adv7511_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_find_best_neighbor.isra.14+0x1f6 (section: .text.batadv_find_best_neighbor.isra.14) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_router_get+0x1fc (section: .text.batadv_orig_router_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_ifinfo_get+0x1a0 (section: .text.batadv_orig_ifinfo_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_neigh_ifinfo_get+0x1a0 (section: .text.batadv_neigh_ifinfo_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_hardif_neigh_get+0x1b6 (section: .text.batadv_hardif_neigh_get) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_hardif_neigh_dump+0x304 (section: .text.batadv_hardif_neigh_dump) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_purge_orig_ref+0x5a2 (section: .text.batadv_purge_orig_ref) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_orig_dump+0x304 (section: .text.batadv_orig_dump) -> adv7511_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_add_pending+0xb8 (section: .text.vsock_add_pending) -> cdns_dsi_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_enqueue_accept+0x20 (section: .text.vsock_enqueue_accept) -> mhdp_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_find_connected_socket+0x4e (section: .text.vsock_find_connected_socket) -> mhdp_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_find_connected_socket+0x8e (section: .text.vsock_find_connected_socket) -> cdns_dsi_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_find_connected_socket+0xae (section: .text.vsock_find_connected_socket) -> mhdp_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __vsock_bind+0xe8 (section: .text.__vsock_bind) -> mhdp_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __vsock_bind+0xfc (section: .text.__vsock_bind) -> cdns_dsi_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_dgram_connect+0x2a (section: .text.vsock_dgram_connect) -> mhdp_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_dgram_connect+0x2e (section: .text.vsock_dgram_connect) -> cdns_dsi_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_connect+0x1e (section: .text.vsock_connect) -> mhdp_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_connect+0x1ae (section: .text.vsock_connect) -> mhdp_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_connect+0x28a (section: .text.vsock_connect) -> mhdp_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_connect+0x326 (section: .text.vsock_connect) -> mhdp_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_connectible_setsockopt+0x7e (section: .text.vsock_connectible_setsockopt) -> mhdp_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_push+0x82 (section: .text.nsh_push) -> ili9163_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_push+0xb2 (section: .text.nsh_push) -> ili9163_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_push+0xd2 (section: .text.nsh_push) -> ili9225_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_push+0xe2 (section: .text.nsh_push) -> ili9163_spi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_push+0x192 (section: .text.nsh_push) -> ili9163_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_push+0x1a0 (section: .text.nsh_push) -> ili9163_spi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_get_max_mtu+0x16 (section: .text.hsr_get_max_mtu) -> mi0283qt_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_get_max_mtu+0x1e (section: .text.hsr_get_max_mtu) -> mi0283qt_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0x48 (section: .text.prp_dup_discard_inside_dropwindow) -> st7586_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0xb4 (section: .text.prp_dup_discard_inside_dropwindow) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0xb8 (section: .text.prp_dup_discard_inside_dropwindow) -> st7586_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0xda (section: .text.prp_dup_discard_inside_dropwindow) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0x102 (section: .text.prp_dup_discard_inside_dropwindow) -> st7586_spi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0x106 (section: .text.prp_dup_discard_inside_dropwindow) -> st7735r_spi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_inside_dropwindow+0x114 (section: .text.prp_dup_discard_inside_dropwindow) -> st7735r_spi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> __compound_literal (section: .data.rel.local.__compound_literal.4)
ERROR: modpost: __ex_table+0x1518 references non-executable section '.data.rel.local.__compound_literal.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> __compound_literal (section: .data.rel.local.__compound_literal.5)
ERROR: modpost: __ex_table+0x151c references non-executable section '.data.rel.local.__compound_literal.5'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> __compound_literal (section: .data.rel.local.__compound_literal.7)
ERROR: modpost: __ex_table+0x1524 references non-executable section '.data.rel.local.__compound_literal.7'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> __compound_literal (section: .data.rel.local.__compound_literal.9)
ERROR: modpost: __ex_table+0x1528 references non-executable section '.data.rel.local.__compound_literal.9'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> mt6397_pinctrl_data (section: .data.rel.ro.local.mt6397_pinctrl_data)
>> ERROR: modpost: __ex_table+0x1530 references non-executable section '.data.rel.ro.local.mt6397_pinctrl_data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> cv1800_pconf_ops (section: .data.rel.ro.cv1800_pconf_ops)
>> ERROR: modpost: __ex_table+0x1534 references non-executable section '.data.rel.ro.cv1800_pconf_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> cv1800_pmx_ops (section: .data.rel.ro.cv1800_pmx_ops)
>> ERROR: modpost: __ex_table+0x153c references non-executable section '.data.rel.ro.cv1800_pmx_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> cv1800_pconf_ops (section: .data.rel.ro.cv1800_pconf_ops)
ERROR: modpost: __ex_table+0x1540 references non-executable section '.data.rel.ro.cv1800_pconf_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> sg2042_cfg_ops (section: .data.rel.ro.local.sg2042_cfg_ops)
>> ERROR: modpost: __ex_table+0x1548 references non-executable section '.data.rel.ro.local.sg2042_cfg_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> cv1800_pconf_ops (section: .data.rel.ro.cv1800_pconf_ops)
ERROR: modpost: __ex_table+0x154c references non-executable section '.data.rel.ro.cv1800_pconf_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> .LASF912 (section: .debug_str)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> .LASF914 (section: .debug_str)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> .LASF916 (section: .debug_str)
ERROR: modpost: __ex_table+0x1560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> .LASF918 (section: .debug_str)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> .LASF920 (section: .debug_str)
ERROR: modpost: __ex_table+0x156c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> .LASF918 (section: .debug_str)
ERROR: modpost: __ex_table+0x1570 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> .LASF923 (section: .debug_str)
ERROR: modpost: __ex_table+0x1578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> .LASF918 (section: .debug_str)
ERROR: modpost: __ex_table+0x157c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> .LASF926 (section: .debug_str)
ERROR: modpost: __ex_table+0x1584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> .LASF928 (section: .debug_str)
ERROR: modpost: __ex_table+0x1588 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> .LASF930 (section: .debug_str)
ERROR: modpost: __ex_table+0x1590 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> .LASF932 (section: .debug_str)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> .LASF934 (section: .debug_str)
ERROR: modpost: __ex_table+0x159c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> .LASF936 (section: .debug_str)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .LASF938 (section: .debug_str)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .LASF940 (section: .debug_str)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .LASF942 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .LASF944 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .LASF946 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .LASF948 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .LASF950 (section: .debug_str)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .LASF952 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF2331 (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF2333 (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF1766 (section: .debug_str)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF1770 (section: .debug_str)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF1773 (section: .debug_str)
ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF1776 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1779 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF1782 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF1785 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF1787 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF1789 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF1791 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF1793 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF1795 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF1797 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF1799 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF1801 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF1803 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF1805 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF1807 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d4 (section: __ex_table) -> .LASF1809 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d4 references non-executable section '.debug_str'
--
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> .LASF2936 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .LASF2023 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .LASF2025 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF2027 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF2029 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .LASF2031 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LASF2033 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF2035 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF2033 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .LASF2038 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LASF2040 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .LASF2042 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .LASF2044 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .LASF2046 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> .LASF2048 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e48 (section: __ex_table) -> .LASF2050 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e4c (section: __ex_table) -> .LASF2048 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .LASF2053 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e58 (section: __ex_table) -> .LASF2055 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e60 (section: __ex_table) -> .LASF2057 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e64 (section: __ex_table) -> .LASF2059 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e84 (section: __ex_table) -> .LASF146 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e88 (section: __ex_table) -> .LASF143 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e90 (section: __ex_table) -> .LASF149 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e94 (section: __ex_table) -> .LASF143 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e9c (section: __ex_table) -> .LASF152 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea0 (section: __ex_table) -> .LASF143 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea8 (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eac (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb4 (section: __ex_table) -> .LASF159 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb8 (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec0 (section: __ex_table) -> .LASF162 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec4 (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> .LASF2355 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ecc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> .LASF2357 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed8 (section: __ex_table) -> .LASF2595 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1edc (section: __ex_table) -> .LASF2597 (section: .debug_str)
ERROR: modpost: __ex_table+0x1edc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> .LASF2599 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee8 (section: __ex_table) -> .LASF2601 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> .LASF3865 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> .LASF3867 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1efc (section: __ex_table) -> .LASF3869 (section: .debug_str)
ERROR: modpost: __ex_table+0x1efc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f00 (section: __ex_table) -> .LASF3871 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f08 (section: __ex_table) -> .LASF3873 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f0c (section: __ex_table) -> .LASF3875 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> .LASF3877 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> .LASF3879 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> .LASF249 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f3c (section: __ex_table) -> .LASF251 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> .LANCHOR124 (section: .data.rel.local..Lubsan_data118)
>> ERROR: modpost: __ex_table+0x1f44 references non-executable section '.data.rel.local..Lubsan_data118'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f48 (section: __ex_table) -> .LANCHOR132 (section: .data.rel.local..Lubsan_data119)
ERROR: modpost: __ex_table+0x1f48 references non-executable section '.data.rel.local..Lubsan_data119'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f50 (section: __ex_table) -> .LANCHOR134 (section: .data.rel.local..Lubsan_data120)
>> ERROR: modpost: __ex_table+0x1f50 references non-executable section '.data.rel.local..Lubsan_data120'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f54 (section: __ex_table) -> .LANCHOR138 (section: .data.rel.local..Lubsan_data121)
>> ERROR: modpost: __ex_table+0x1f54 references non-executable section '.data.rel.local..Lubsan_data121'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> .LANCHOR140 (section: .data.rel.local..Lubsan_data122)
>> ERROR: modpost: __ex_table+0x1f5c references non-executable section '.data.rel.local..Lubsan_data122'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> .LANCHOR142 (section: .data.rel.local..Lubsan_data123)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.data.rel.local..Lubsan_data123'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> .LASF3110 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .LASF3112 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> .LASF415 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> .LASF417 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> .LASF419 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> .LASF421 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> .LASF423 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> .LASF421 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> .LASF426 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> .LASF428 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> .LASF344 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> .LASF346 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2010 (section: __ex_table) -> .LASF1732 (section: .debug_str)
ERROR: modpost: __ex_table+0x2010 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2014 (section: __ex_table) -> .LASF1734 (section: .debug_str)
ERROR: modpost: __ex_table+0x2014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x201c (section: __ex_table) -> .LASF1736 (section: .debug_str)
ERROR: modpost: __ex_table+0x201c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2020 (section: __ex_table) -> .LASF1738 (section: .debug_str)
ERROR: modpost: __ex_table+0x2020 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2028 (section: __ex_table) -> .LASF1740 (section: .debug_str)
ERROR: modpost: __ex_table+0x2028 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x202c (section: __ex_table) -> .LASF1742 (section: .debug_str)
ERROR: modpost: __ex_table+0x202c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2034 (section: __ex_table) -> .LASF1744 (section: .debug_str)
ERROR: modpost: __ex_table+0x2034 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2038 (section: __ex_table) -> .LASF1746 (section: .debug_str)
ERROR: modpost: __ex_table+0x2038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2040 (section: __ex_table) -> .LASF111 (section: .debug_str)
ERROR: modpost: __ex_table+0x2040 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2044 (section: __ex_table) -> .LASF113 (section: .debug_str)
ERROR: modpost: __ex_table+0x2044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x204c (section: __ex_table) -> .LASF115 (section: .debug_str)
ERROR: modpost: __ex_table+0x204c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2050 (section: __ex_table) -> .LASF117 (section: .debug_str)
ERROR: modpost: __ex_table+0x2050 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2094 (section: __ex_table) -> .LASF1535 (section: .debug_str)
ERROR: modpost: __ex_table+0x2094 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2098 (section: __ex_table) -> .LASF1537 (section: .debug_str)
ERROR: modpost: __ex_table+0x2098 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a0 (section: __ex_table) -> .LASF1539 (section: .debug_str)
ERROR: modpost: __ex_table+0x20a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a4 (section: __ex_table) -> .LASF1541 (section: .debug_str)
ERROR: modpost: __ex_table+0x20a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ac (section: __ex_table) -> .LASF1543 (section: .debug_str)
ERROR: modpost: __ex_table+0x20ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b0 (section: __ex_table) -> .LASF1541 (section: .debug_str)
ERROR: modpost: __ex_table+0x20b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: __ex_table) -> .LASF3284 (section: .debug_str)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: __ex_table) -> .LASF3286 (section: .debug_str)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: __ex_table) -> .LASF3288 (section: .debug_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2110 (section: __ex_table) -> .LASF3290 (section: .debug_str)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: __ex_table) -> .LASF3292 (section: .debug_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: __ex_table) -> .LASF3290 (section: .debug_str)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: __ex_table) -> .LASF3295 (section: .debug_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2128 (section: __ex_table) -> .LASF3290 (section: .debug_str)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: __ex_table) -> .LASF2017 (section: .debug_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: __ex_table) -> .LASF2019 (section: .debug_str)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: __ex_table) -> .LASF2021 (section: .debug_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x214c (section: __ex_table) -> .LASF2019 (section: .debug_str)
ERROR: modpost: __ex_table+0x214c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> .LASF2024 (section: .debug_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> .LASF2019 (section: .debug_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: __ex_table) -> .LASF2027 (section: .debug_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> .LASF2019 (section: .debug_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> .LASF2030 (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> .LASF2019 (section: .debug_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .LASF2033 (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
