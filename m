Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE2D7CF2B
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Mar 2024 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709593829; cv=none; b=c/fcQ9/wPnrgX4tgxtHhVELaU8hMHKbbYjGsbdaQUmef7lHrYASeL6yysD8/4rzVCxZe9Uk9CQBVkua1eZBB2NVwDMj0ei0lDNkVxpXvOddhuNXhlgtLjr4VuRuhj8/5rfe/KBCHuxn6WLSDxj1VgXQ9i+s9xTUhd1YUHbRD1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709593829; c=relaxed/simple;
	bh=4ipTJ5FNwq4cfCJXIrYF2s42TTntN3fnkcIPNwvb5XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osppA7BlOsjLkjm+5iw1/Fkf4gzb5r1Ry+/BnptLccz8VQRyDFFm9SWiuTpJ/TNG2G1SwOpe4ovuNbOAM4hcdbyKYD3wjkWHDjvOYw5g+6Hc8hSwD3tvgYgEDBxXxj8UcIHMNI6vB1JSFLwsM3fvDMiX46zLHzgU+BTiFTuPEi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RznDTnhb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RznDTnhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709593828; x=1741129828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ipTJ5FNwq4cfCJXIrYF2s42TTntN3fnkcIPNwvb5XM=;
  b=RznDTnhboIcNuRRr8JO4sX+jFu1umx1L3cywQsjeWbb40NjtNf+0zTkp
   tc8/CWjlU34yF45L2GLykS5svqy7q/I3zYDehVX9m39otCy0eD838yneM
   i5uh0YZjXB3pPH5OkpJ/m9voTZfg+KS6xDHxMUgLtVuPb4zyTecFlu2Wm
   EAMkbiA+geoIiC5BurnN0KJUzu2cf5nmt3f25/fETky8Ofkb3xUNfLPud
   3++l4vreraZCwRQahCuR9DrG4LjpR2i9klVbsZObqf+w8+DpgsjoBJCkz
   a/uRVRRcSPrctjhSi/VieqOtOTJQcHntjIvqTb+7UO4WLFOeUqSFvIVMJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3973222"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3973222"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 15:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9003138"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2024 15:10:25 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhHRu-0002pF-13;
	Mon, 04 Mar 2024 23:10:22 +0000
Date: Tue, 5 Mar 2024 07:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/flow_dissector.c:798 __skb_flow_bpf_to_target() error:
 __memcpy() '&flow_keys->ipv6_src' too small (16 vs 32)
Message-ID: <202403050715.uYOcIaac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   3 years ago
:::::: branch date: 5 months ago
:::::: commit date: 3 years ago
config: x86_64-randconfig-161-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050715.uYOcIaac-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403050715.uYOcIaac-lkp@intel.com/

New smatch warnings:
net/core/flow_dissector.c:798 __skb_flow_bpf_to_target() error: __memcpy() '&flow_keys->ipv6_src' too small (16 vs 32)
drivers/ntb/test/ntb_msi_test.c:376 ntb_msit_probe() warn: missing error code 'ret'
drivers/scsi/mpt3sas/mpt3sas_base.c:889 mpt3sas_base_start_watchdog() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:951 mpt3sas_base_start_hba_unplug_watchdog() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:1011 mpt3sas_base_start_smart_polling() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:2781 base_mod64() warn: KERN_* level not at start of string
drivers/scsi/mpt3sas/mpt3sas_base.c:3449 _base_build_sg_scmd_ieee() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:4732 _base_diag_reset() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:2815 _scsih_enable_tlr() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:2953 _scsih_slave_configure() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:5722 _scsih_check_pcie_topo_remove_events() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:6182 _scsih_setup_eedp() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:8360 _scsih_expander_add() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:11431 _scsih_sas_broadcast_primitive_event() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:11580 _scsih_sas_discovery_event() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:11654 _scsih_pcie_enumeration_event() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:13423 _scsih_scan_for_devices_after_reset() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:14337 _scsih_probe_boot_devices() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_transport.c:645 mpt3sas_transport_add_phy_to_an_existing_port() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_ctl.c:1598 _ctl_diag_get_bufftype() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_ctl.c:3649 mpt3sas_ctl_tm_sysfs() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_ctl.c:3680 mpt3sas_ctl_tm_sysfs() warn: variable dereferenced before check 'pcie_device' (see line 3668)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:4851 mpt3sas_ctl_init() warn: inconsistent indenting
drivers/scsi/smartpqi/smartpqi_init.c:1249 pqi_get_raid_map() warn: missing error code 'rc'

Old smatch warnings:
drivers/scsi/mpt3sas/mpt3sas_base.c:4746 _base_diag_reset() warn: curly braces intended?
drivers/scsi/mpt3sas/mpt3sas_base.c:5215 mpt3sas_base_map_resources() warn: 'ioc->chip' from ioremap() not released on lines: 5215.
drivers/scsi/mpt3sas/mpt3sas_base.c:8814 _base_make_ioc_operational() warn: missing error code? 'r'
drivers/scsi/mpt3sas/mpt3sas_base.c:9053 mpt3sas_base_attach() warn: missing error code 'r'
drivers/scsi/mpt3sas/mpt3sas_scsih.c:8286 _scsih_expander_add() warn: returning -1 instead of -ENOMEM is sloppy
drivers/scsi/mpt3sas/mpt3sas_scsih.c:8307 _scsih_expander_add() warn: missing error code 'rc'
drivers/scsi/mpt3sas/mpt3sas_ctl.c:760 _ctl_do_mpt_command() error: copy_from_user() 'mpi_request' too small (65535 vs 4294967292)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:785 _ctl_do_mpt_command() error: __memcpy() 'mpi_request' too small (65535 vs 4294967292)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2031 _ctl_diag_register() warn: potential spectre issue 'ioc->diag_buffer_status' [w] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2177 _ctl_diag_query() warn: potential spectre issue 'ioc->diag_buffer' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2178 _ctl_diag_query() warn: possible spectre second half.  'request_data'
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2201 _ctl_diag_query() warn: potential spectre issue 'ioc->product_specific' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2203 _ctl_diag_query() warn: potential spectre issue 'ioc->diag_buffer_sz' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2205 _ctl_diag_query() warn: potential spectre issue 'ioc->unique_id' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2206 _ctl_diag_query() warn: potential spectre issue 'ioc->diagnostic_flags' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:3705 mpt3sas_ctl_tm_sysfs() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_ctl.c:3756 mpt3sas_ctl_tm_sysfs() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_ctl.c:3826 mpt3sas_ctl_tm_sysfs() warn: inconsistent indenting
drivers/scsi/smartpqi/smartpqi_init.c:2175 pqi_update_scsi_devices() warn: inconsistent indenting
drivers/scsi/smartpqi/smartpqi_init.c:6035 pqi_passthru_ioctl() error: __memcpy() 'iocommand.Request.CDB' too small (16 vs 32)

vim +798 net/core/flow_dissector.c

^590eaf1fec755 Kaixu Xia 2021-03-16  756  
^590eaf1fec755 Kaixu Xia 2021-03-16  757  static void __skb_flow_bpf_to_target(const struct bpf_flow_keys *flow_keys,
^590eaf1fec755 Kaixu Xia 2021-03-16  758  				     struct flow_dissector *flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  759  				     void *target_container)
^590eaf1fec755 Kaixu Xia 2021-03-16  760  {
^590eaf1fec755 Kaixu Xia 2021-03-16  761  	struct flow_dissector_key_ports *key_ports = NULL;
^590eaf1fec755 Kaixu Xia 2021-03-16  762  	struct flow_dissector_key_control *key_control;
^590eaf1fec755 Kaixu Xia 2021-03-16  763  	struct flow_dissector_key_basic *key_basic;
^590eaf1fec755 Kaixu Xia 2021-03-16  764  	struct flow_dissector_key_addrs *key_addrs;
^590eaf1fec755 Kaixu Xia 2021-03-16  765  	struct flow_dissector_key_tags *key_tags;
^590eaf1fec755 Kaixu Xia 2021-03-16  766  
^590eaf1fec755 Kaixu Xia 2021-03-16  767  	key_control = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  768  						FLOW_DISSECTOR_KEY_CONTROL,
^590eaf1fec755 Kaixu Xia 2021-03-16  769  						target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16  770  	key_control->thoff = flow_keys->thoff;
^590eaf1fec755 Kaixu Xia 2021-03-16  771  	if (flow_keys->is_frag)
^590eaf1fec755 Kaixu Xia 2021-03-16  772  		key_control->flags |= FLOW_DIS_IS_FRAGMENT;
^590eaf1fec755 Kaixu Xia 2021-03-16  773  	if (flow_keys->is_first_frag)
^590eaf1fec755 Kaixu Xia 2021-03-16  774  		key_control->flags |= FLOW_DIS_FIRST_FRAG;
^590eaf1fec755 Kaixu Xia 2021-03-16  775  	if (flow_keys->is_encap)
^590eaf1fec755 Kaixu Xia 2021-03-16  776  		key_control->flags |= FLOW_DIS_ENCAPSULATION;
^590eaf1fec755 Kaixu Xia 2021-03-16  777  
^590eaf1fec755 Kaixu Xia 2021-03-16  778  	key_basic = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  779  					      FLOW_DISSECTOR_KEY_BASIC,
^590eaf1fec755 Kaixu Xia 2021-03-16  780  					      target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16  781  	key_basic->n_proto = flow_keys->n_proto;
^590eaf1fec755 Kaixu Xia 2021-03-16  782  	key_basic->ip_proto = flow_keys->ip_proto;
^590eaf1fec755 Kaixu Xia 2021-03-16  783  
^590eaf1fec755 Kaixu Xia 2021-03-16  784  	if (flow_keys->addr_proto == ETH_P_IP &&
^590eaf1fec755 Kaixu Xia 2021-03-16  785  	    dissector_uses_key(flow_dissector, FLOW_DISSECTOR_KEY_IPV4_ADDRS)) {
^590eaf1fec755 Kaixu Xia 2021-03-16  786  		key_addrs = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  787  						      FLOW_DISSECTOR_KEY_IPV4_ADDRS,
^590eaf1fec755 Kaixu Xia 2021-03-16  788  						      target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16  789  		key_addrs->v4addrs.src = flow_keys->ipv4_src;
^590eaf1fec755 Kaixu Xia 2021-03-16  790  		key_addrs->v4addrs.dst = flow_keys->ipv4_dst;
^590eaf1fec755 Kaixu Xia 2021-03-16  791  		key_control->addr_type = FLOW_DISSECTOR_KEY_IPV4_ADDRS;
^590eaf1fec755 Kaixu Xia 2021-03-16  792  	} else if (flow_keys->addr_proto == ETH_P_IPV6 &&
^590eaf1fec755 Kaixu Xia 2021-03-16  793  		   dissector_uses_key(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  794  				      FLOW_DISSECTOR_KEY_IPV6_ADDRS)) {
^590eaf1fec755 Kaixu Xia 2021-03-16  795  		key_addrs = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  796  						      FLOW_DISSECTOR_KEY_IPV6_ADDRS,
^590eaf1fec755 Kaixu Xia 2021-03-16  797  						      target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16 @798  		memcpy(&key_addrs->v6addrs, &flow_keys->ipv6_src,
^590eaf1fec755 Kaixu Xia 2021-03-16  799  		       sizeof(key_addrs->v6addrs));
^590eaf1fec755 Kaixu Xia 2021-03-16  800  		key_control->addr_type = FLOW_DISSECTOR_KEY_IPV6_ADDRS;
^590eaf1fec755 Kaixu Xia 2021-03-16  801  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  802  
^590eaf1fec755 Kaixu Xia 2021-03-16  803  	if (dissector_uses_key(flow_dissector, FLOW_DISSECTOR_KEY_PORTS))
^590eaf1fec755 Kaixu Xia 2021-03-16  804  		key_ports = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  805  						      FLOW_DISSECTOR_KEY_PORTS,
^590eaf1fec755 Kaixu Xia 2021-03-16  806  						      target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16  807  	else if (dissector_uses_key(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  808  				    FLOW_DISSECTOR_KEY_PORTS_RANGE))
^590eaf1fec755 Kaixu Xia 2021-03-16  809  		key_ports = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  810  						      FLOW_DISSECTOR_KEY_PORTS_RANGE,
^590eaf1fec755 Kaixu Xia 2021-03-16  811  						      target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16  812  
^590eaf1fec755 Kaixu Xia 2021-03-16  813  	if (key_ports) {
^590eaf1fec755 Kaixu Xia 2021-03-16  814  		key_ports->src = flow_keys->sport;
^590eaf1fec755 Kaixu Xia 2021-03-16  815  		key_ports->dst = flow_keys->dport;
^590eaf1fec755 Kaixu Xia 2021-03-16  816  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  817  
^590eaf1fec755 Kaixu Xia 2021-03-16  818  	if (dissector_uses_key(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  819  			       FLOW_DISSECTOR_KEY_FLOW_LABEL)) {
^590eaf1fec755 Kaixu Xia 2021-03-16  820  		key_tags = skb_flow_dissector_target(flow_dissector,
^590eaf1fec755 Kaixu Xia 2021-03-16  821  						     FLOW_DISSECTOR_KEY_FLOW_LABEL,
^590eaf1fec755 Kaixu Xia 2021-03-16  822  						     target_container);
^590eaf1fec755 Kaixu Xia 2021-03-16  823  		key_tags->flow_label = ntohl(flow_keys->flow_label);
^590eaf1fec755 Kaixu Xia 2021-03-16  824  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  825  }
^590eaf1fec755 Kaixu Xia 2021-03-16  826  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
