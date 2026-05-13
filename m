Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801D5477E
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642140; cv=none; b=Lf4tTTUsmC6RrfSxcCiThDj8VdU2hclfRuROnRIzJNz+3oD2WKR/nwIPsfPabgknavn3vpUOIhqDX92tCyOryZFf5SeJShCm96HY2QwwBVn4AZCjxAck2i3MIW3ihsRzMAb0J0nFj3h1S4OIx6bTiPXTYwauGvJi+jMe5OUg424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642140; c=relaxed/simple;
	bh=EJmLW1h+JNm1rpcxbHciE2AYsmDq5rxQmEWM5H/rvuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cd4FbNNDpSmBtZ903vMM1ZAPv+RbuJ4bzM1g8gmVzpomWE6IrS4HB43/lx4vPiaVhWz8/AA+w/Cg4+idGVJY+R2Px98Px/PBCSjEjW4RBJP88yuS0vKm3lKQRXDdrDUiqgZkUb3rKhEaxjc5ZbZEGvZvTFRTz7t01mqXIoJfg+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFnOKk8Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFnOKk8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778642139; x=1810178139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJmLW1h+JNm1rpcxbHciE2AYsmDq5rxQmEWM5H/rvuE=;
  b=gFnOKk8Zz24VD7MamYUDHG5vCtcwX8j/0bZU8IpNbCAGgiSUlwcTez4G
   2oK8G+zql2SVKzaKI948YT66E2F6Mcej3yixgQw5v0wnC8cMIDG03T6wV
   +ayrCOYgoz8pmTg3Ew6YQzsnygtk2JY0vbWVGD66vP7EnED08i5g14THR
   BdyJYJNFkvs36SUOScsnZQx1JnNULDr+B/ACIS6iP0M16IQz0ZKAI0mu0
   HoP/TL/fCEAI5Y96s6eksyM995su4eNjk7mImGLnGvwC8QjxN34DIZB6p
   mV/JUOIquGRW96LjxHh+0LQv9xoeSZWkMGxi5IK1J+W4oi/tnDZIe5e1W
   A==;
X-CSE-ConnectionGUID: FcpAbUMqTpW2GKKATFYMyQ==
X-CSE-MsgGUID: 1mLZp5uCRNaB1UQk+QxUTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78705634"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="78705634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 20:15:38 -0700
X-CSE-ConnectionGUID: jfeh4iJqQAex5q8gWiaaUg==
X-CSE-MsgGUID: LDaFpLM7Q5muA9nVQ8ahGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231568405"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2026 20:15:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN04M-000000003Ij-1TnR;
	Wed, 13 May 2026 03:15:34 +0000
Date: Wed, 13 May 2026 11:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool:
 =?us-ascii?Q?=5FRINvXs5=5FNtNtCshc5sK6KjdJJ=5F6kernel5alloc4kboxINtB6=5F?=
 =?us-ascii?Q?3BoxINtNtNtCsbsbRiabPlh9=5F4core3mem12maybe=5Funinit11MaybeU?=
 =?us-ascii?Q?ninitINtNtBa=5F7debugfs5ScopeNtCscKcGI1asYQG=5F19rust=5Fde?=
 =?us-ascii?Q?bugfs=5Fscoped10DeviceDataEENtNtB8=5F9allocator7KmallocEINtC?=
 =?us-ascii?Q?s57PXBekmiam=5F...?=
Message-ID: <202605131123.XNjFovyZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: 2058f6d1660edc4a9bda9bee627792b352121b10 objtool: Refactor prefix symbol creation code
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260513/202605131123.XNjFovyZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131123.XNjFovyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2058f6d1660e ("objtool: Refactor prefix symbol creation code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605131123.XNjFovyZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: .altinstr_replacement+0x162a: redundant UACCESS disable
   vmlinux.o: error: objtool: _RINvMs3_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs57PXBekmiam_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6OpaqueNtNtCsfd3uB5I4hpp_8bindings12bindings_raw5mutexE8ffi_initNCNCNvMs0_B8_INtB8_4LockB15_B3Z_E3new0s_0E0B6b_B4x_EEB2G_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: error: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: error: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10ModuleDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_0B27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
