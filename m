Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BFE352C54
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117040; cv=none; b=Pfl09O9ybX1nmTxPZtq+ZGclWscv2nWu0/nQGpAbKwoTVGrEOg1C7LooTqOKMizafiZ6DffupyCTJ6c/H9rFNmdYNjGW3JKSoVf/5WFQ+elAmaLbTN5JIWX3DBnnNMLf19tkpelrIKTycrHyw35bu3aK7UKnOZYxFm9ExyduHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117040; c=relaxed/simple;
	bh=XR+8zwJv5VD+DP4853pzqPARMQIcQukjbxWiqWrIUjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wy6S2+EbILR0Yl28v7qC9vz4WGYb5tzOwpojEaFmbYXjACZ7pHCWMmI4gO3NEmQDssHDggu8rG5h3EM01D0F/jV0wXT6gDBRbM50dJeAjR2bu4ZTTFAT//M2UlrMHZh4VS0uICiHyq7/7bB85mXDKX6BMy53k9mSeeat5DvnoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSfc7n9i; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSfc7n9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776117040; x=1807653040;
  h=date:from:to:cc:subject:message-id;
  bh=XR+8zwJv5VD+DP4853pzqPARMQIcQukjbxWiqWrIUjg=;
  b=ZSfc7n9igMLi4iQBnxapFEjNZ2vgy/aoLVSUuuywmirkyEnmpMvSBRJX
   fmFNTBdPl2nRmoVIcE+B8sL382Vl+uW3gvV1VQ6TAsy/kj/xlr5duaVKl
   cfmWqXArwdpdtSSKQM6CkxJ8a3waoPkQtsvGrQqh1QR8IEuHngKrgrQ/T
   /bl9/rw+pH0m6cBHGSLn5BzQ9Fojl30MJn8wwvFAB0rjz7i9dDUAZopwr
   52BFW97tsiqqrB+kTqSwkSeag+XiwyRrRcZvabSeNGo5ItEXiFb5y6Yn8
   Y9QxsdBzzjzlkcWejFA38GZ9g+ebc4hsnteI1qg4FxMaOuSSaRW6EnZQX
   g==;
X-CSE-ConnectionGUID: WJFNQZzLTXWVduxheL97PQ==
X-CSE-MsgGUID: r2C0D8fbRuuMy1b3e76gxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80926418"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="80926418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 14:50:39 -0700
X-CSE-ConnectionGUID: 0xIVwNjuT+6ePcw/ZYfKfA==
X-CSE-MsgGUID: /jigCN0iRBenTathZjCoYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="230145371"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Apr 2026 14:50:38 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCPAx-000000000t3-10HX;
	Mon, 13 Apr 2026 21:50:35 +0000
Date: Tue, 14 Apr 2026 05:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6143/13679] Warning:
 drivers/ps3/ps3-sys-manager.c:43 cannot understand function prototype: ' 
 struct ps3_sys_manager_header'
Message-ID: <202604140545.GxgkrpT6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c7cc4904160c6fc6377564140062d68a3dc93a0
commit: 79d881beb721d27f679f0dc1cba2d5fe2d7f6d8d [6143/13679] docs: kdoc_parser: avoid tokenizing structs everytime
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604140545.GxgkrpT6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140545.GxgkrpT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140545.GxgkrpT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/ps3/ps3-sys-manager.c:35 Incorrect use of kernel-doc format:  * struct ps3_sys_manager_header - System manager message header.
>> Warning: drivers/ps3/ps3-sys-manager.c:43 cannot understand function prototype: '  struct ps3_sys_manager_header'
   Warning: drivers/ps3/ps3-sys-manager.c:66 Cannot find identifier on line:
    * @PS3_SM_RX_MSG_LEN_MIN - Shortest received message length.
   Warning: drivers/ps3/ps3-sys-manager.c:67 Cannot find identifier on line:
    * @PS3_SM_RX_MSG_LEN_MAX - Longest received message length.
   Warning: drivers/ps3/ps3-sys-manager.c:68 Cannot find identifier on line:
    *
   Warning: drivers/ps3/ps3-sys-manager.c:69 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Currently all messages received from the system manager are either
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_SHUTDOWN' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_LPAR_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:198 cannot understand function prototype: 'u32 user_wake_sources = PS3_SM_WAKE_DEFAULT;'
   Warning: drivers/ps3/ps3-sys-manager.c:212 Enum value 'PS3_SM_CMD_SHUTDOWN' not described in enum 'ps3_sys_manager_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:222 cannot understand function prototype: 'unsigned int ps3_sm_force_power_off;'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'dev' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'header' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'payload' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'dev' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'attr' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'dev' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'op' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'wake_source' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:333 function parameter 'dev' not described in 'ps3_sys_manager_send_request_shutdown'
   Warning: drivers/ps3/ps3-sys-manager.c:370 function parameter 'dev' not described in 'ps3_sys_manager_send_response'
   Warning: drivers/ps3/ps3-sys-manager.c:403 function parameter 'dev' not described in 'ps3_sys_manager_handle_event'
   Warning: drivers/ps3/ps3-sys-manager.c:485 function parameter 'dev' not described in 'ps3_sys_manager_handle_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:526 function parameter 'dev' not described in 'ps3_sys_manager_handle_msg'
   Warning: drivers/ps3/ps3-sys-manager.c:607 function parameter 'dev' not described in 'ps3_sys_manager_final_power_off'
   Warning: drivers/ps3/ps3-sys-manager.c:631 function parameter 'dev' not described in 'ps3_sys_manager_final_restart'
   Warning: drivers/ps3/ps3-sys-manager.c:670 function parameter 'state' not described in 'ps3_sys_manager_set_wol'
   Warning: drivers/ps3/ps3-sys-manager.c:692 function parameter 'dev' not described in 'ps3_sys_manager_work'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_SHUTDOWN' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_LPAR_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:212 Enum value 'PS3_SM_CMD_SHUTDOWN' not described in enum 'ps3_sys_manager_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'dev' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'header' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'payload' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'dev' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'attr' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'dev' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'op' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'wake_source' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:333 function parameter 'dev' not described in 'ps3_sys_manager_send_request_shutdown'
   Warning: drivers/ps3/ps3-sys-manager.c:370 function parameter 'dev' not described in 'ps3_sys_manager_send_response'
   Warning: drivers/ps3/ps3-sys-manager.c:403 function parameter 'dev' not described in 'ps3_sys_manager_handle_event'
   Warning: drivers/ps3/ps3-sys-manager.c:485 function parameter 'dev' not described in 'ps3_sys_manager_handle_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:526 function parameter 'dev' not described in 'ps3_sys_manager_handle_msg'
   Warning: drivers/ps3/ps3-sys-manager.c:607 function parameter 'dev' not described in 'ps3_sys_manager_final_power_off'
   Warning: drivers/ps3/ps3-sys-manager.c:631 function parameter 'dev' not described in 'ps3_sys_manager_final_restart'
   Warning: drivers/ps3/ps3-sys-manager.c:670 function parameter 'state' not described in 'ps3_sys_manager_set_wol'
   Warning: drivers/ps3/ps3-sys-manager.c:692 function parameter 'dev' not described in 'ps3_sys_manager_work'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
