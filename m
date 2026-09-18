Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6833A3B531A
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 01:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696408; cv=none; b=qFZh9yBYNTA9A957HtXey6l22qj4DrWDYwGn1Ie1GTvyqIQhxS96Otjlo4qdiEImNFgoY3kX6sFDpY3hY++HUu2Q1AYUeA5/rF9fJrrdcpbODD8wQtioZi5jskQAvt5qLgy2BiF+t0jiN79uAH0iftrnMBlyjB0AkpiBTjB3uqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696408; c=relaxed/simple;
	bh=VNmI/ntxn+CDhd7VvurTDjZdA6u5cYxslhNvDvarcPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NoRBePvbSGGGAq7FyMgyUdWiDwHZMHhZgzZX3YsHU1g8fzinJ52+poIlWxamVN9KFyt1dMOCPj2gSMxWPu8EVUTL5t7UPU8VBSD9PKnxaj0uWpk08reir9wCiBHDr83gzwLHYUKigdJDA/0cBD1P3nFYtk7c3mw1axhJCWxu534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFp4YsZ1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFp4YsZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789696403; x=1821232403;
  h=date:from:to:cc:subject:message-id;
  bh=VNmI/ntxn+CDhd7VvurTDjZdA6u5cYxslhNvDvarcPM=;
  b=fFp4YsZ1yLJtLajZ54W31ynGbLXzqev1xryW+gRQ11TeW9nq4gxiP3e4
   JlHUtSaEL8HMqWmdO96lVicM1Z6wK8hUBMcwUgfGBBqlW3akPQXG0XZbT
   U8zTdJe/Oy9Yp+dpaLKuCiOcH/TaOOzl6ebbXQW/9FKirA24mXfOn/1dZ
   fpy7SAlJHEHSfrbHuKYprp+w0cgW0PKr7NUGCto9KLOEc/zlXjWQ0Q0mP
   K0fuoo8Wt5Tru8dw4EoP6b45RJdsZoPl3CUCO7Tq2KIFK8Rs1JRi2qnC/
   ET6H9WZl/IhgqoIp+brCU7wvPxSqCtFU502whlzwOEBD5J9X3bV/GVVGZ
   g==;
X-CSE-ConnectionGUID: yvHy367/TS2LHAlnLgFUpA==
X-CSE-MsgGUID: Q/08363oQum3qRnSYaYzcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100771236"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100771236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 18:53:21 -0700
X-CSE-ConnectionGUID: GKB43cdKQBmi0kFVncdumg==
X-CSE-MsgGUID: YQrLXnc9QFejs9DnUKeHxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297602349"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 18:53:19 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Nmv-000000000uu-2snZ;
	Fri, 18 Sep 2026 01:53:17 +0000
Date: Fri, 18 Sep 2026 03:53:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 drivers/gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.c:609:35-36:
 hubp_program_3dlut_fl_config: first occurrence line 640, second occurrence
 line 646
Message-ID: <202609180310.9Hdni6sY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Roman Li <Roman.Li@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Alex Hung <alex.hung@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5dd1818b15d98d4a20806cd00b1b40320b06004f
commit: e56e3cff2a1bb29545ddbec562e76c0419363a40 drm/amd/display: Sync dcn42 with DC 3.2.373
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260918/202609180310.9Hdni6sY-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e56e3cff2a1b ("drm/amd/display: Sync dcn42 with DC 3.2.373")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609180310.9Hdni6sY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.c:609:35-36: hubp_program_3dlut_fl_config: first occurrence line 640, second occurrence line 646

vim +609 drivers/gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.c

bd096a56da7cad Roman Li 2026-02-02  608  
bd096a56da7cad Roman Li 2026-02-02 @609  struct hubp_funcs dcn42_hubp_funcs = {
bd096a56da7cad Roman Li 2026-02-02  610  	.hubp_enable_tripleBuffer = hubp2_enable_triplebuffer,
bd096a56da7cad Roman Li 2026-02-02  611  	.hubp_is_triplebuffer_enabled = hubp2_is_triplebuffer_enabled,
bd096a56da7cad Roman Li 2026-02-02  612  	.hubp_program_surface_flip_and_addr = hubp42_program_surface_flip_and_addr,
bd096a56da7cad Roman Li 2026-02-02  613  	.hubp_program_surface_config = hubp42_program_surface_config,
bd096a56da7cad Roman Li 2026-02-02  614  	.hubp_is_flip_pending = hubp2_is_flip_pending,
bd096a56da7cad Roman Li 2026-02-02  615  	.hubp_setup2 = hubp42_setup,
bd096a56da7cad Roman Li 2026-02-02  616  	.hubp_setup_interdependent2 = hubp401_setup_interdependent,
bd096a56da7cad Roman Li 2026-02-02  617  	.hubp_set_vm_system_aperture_settings = hubp3_set_vm_system_aperture_settings,
bd096a56da7cad Roman Li 2026-02-02  618  	.set_blank = hubp2_set_blank,
e56e3cff2a1bb2 Roman Li 2026-03-05  619  	.set_blank_regs = hubp2_set_blank_regs,
bd096a56da7cad Roman Li 2026-02-02  620  	.dcc_control = hubp3_dcc_control,
bd096a56da7cad Roman Li 2026-02-02  621  	.hubp_reset = hubp_reset,
bd096a56da7cad Roman Li 2026-02-02  622  	.mem_program_viewport = min_set_viewport,
bd096a56da7cad Roman Li 2026-02-02  623  	.set_cursor_attributes	= hubp32_cursor_set_attributes,
bd096a56da7cad Roman Li 2026-02-02  624  	.set_cursor_position	= hubp401_cursor_set_position,
bd096a56da7cad Roman Li 2026-02-02  625  	.hubp_clk_cntl = hubp2_clk_cntl,
bd096a56da7cad Roman Li 2026-02-02  626  	.hubp_vtg_sel = hubp2_vtg_sel,
bd096a56da7cad Roman Li 2026-02-02  627  	.dmdata_set_attributes = hubp3_dmdata_set_attributes,
bd096a56da7cad Roman Li 2026-02-02  628  	.dmdata_load = hubp2_dmdata_load,
bd096a56da7cad Roman Li 2026-02-02  629  	.dmdata_status_done = hubp2_dmdata_status_done,
bd096a56da7cad Roman Li 2026-02-02  630  	.hubp_read_state = hubp42_read_state,
bd096a56da7cad Roman Li 2026-02-02  631  	.hubp_clear_underflow = hubp2_clear_underflow,
bd096a56da7cad Roman Li 2026-02-02  632  	.hubp_set_flip_control_surface_gsl = hubp2_set_flip_control_surface_gsl,
bd096a56da7cad Roman Li 2026-02-02  633  	.hubp_init = hubp42_init,
bd096a56da7cad Roman Li 2026-02-02  634  	.set_unbounded_requesting = hubp31_set_unbounded_requesting,
bd096a56da7cad Roman Li 2026-02-02  635  	.hubp_soft_reset = hubp31_soft_reset,
bd096a56da7cad Roman Li 2026-02-02  636  	.hubp_set_flip_int = hubp1_set_flip_int,
bd096a56da7cad Roman Li 2026-02-02  637  	.hubp_in_blank = hubp1_in_blank,
bd096a56da7cad Roman Li 2026-02-02  638  	.program_extended_blank = hubp31_program_extended_blank_value,
bd096a56da7cad Roman Li 2026-02-02  639  	.hubp_program_3dlut_fl_addr = hubp401_program_3dlut_fl_addr,
e56e3cff2a1bb2 Roman Li 2026-03-05 @640  	.hubp_program_3dlut_fl_config = hubp42_program_3dlut_fl_config,
bd096a56da7cad Roman Li 2026-02-02  641  	.hubp_program_3dlut_fl_dlg_param = hubp401_program_3dlut_fl_dlg_param,
bd096a56da7cad Roman Li 2026-02-02  642  	.hubp_enable_3dlut_fl = hubp401_enable_3dlut_fl,
bd096a56da7cad Roman Li 2026-02-02  643  	.hubp_program_3dlut_fl_crossbar = hubp42_program_3dlut_fl_crossbar,
bd096a56da7cad Roman Li 2026-02-02  644  	.hubp_get_3dlut_fl_done = hubp401_get_3dlut_fl_done,
e56e3cff2a1bb2 Roman Li 2026-03-05  645  	.hubp_clear_tiling = hubp3_clear_tiling,
bd096a56da7cad Roman Li 2026-02-02 @646  	.hubp_program_3dlut_fl_config = hubp401_program_3dlut_fl_config,
bd096a56da7cad Roman Li 2026-02-02  647  	.hubp_read_reg_state = hubp3_read_reg_state
bd096a56da7cad Roman Li 2026-02-02  648  };
bd096a56da7cad Roman Li 2026-02-02  649  

:::::: The code at line 609 was first introduced by commit
:::::: bd096a56da7cad1c93c0138a64478b43f5a94736 drm/amd/display: Add dcn42 DC resources

:::::: TO: Roman Li <Roman.Li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
