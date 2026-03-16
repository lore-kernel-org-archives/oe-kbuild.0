Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCCE84039
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695075; cv=none; b=CltHZZiibYi2L7aAzXzs05zN4h77QudHGGsv1NlfoHxy1w1UQ30CTzTzdYF4Ts+Xb9IsPFKvmV4CWl332Ap+SoeIwWT68wy8xewgHSEQhvWyIz+hbvsS3cMdlmwz2tkPfsQ8OjfLha216xFHknYSXh9wFaB2ssD4vQ/5Y/oIjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695075; c=relaxed/simple;
	bh=6JDZlU5uVR1552lQGLHC3skY2c+sBpdQ1j76fcQ8RxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gBFccWRrAAuglVa/J3Sn+bVua21j6oEIyq9TUDI7EmG+Vm1PfZ4Fqp9Ey2EecpVevMKlYlv4+wcleErIJFmRpdxt699TD5FRbnnSA8roquGmU40eR9jWrFR6f+17kb/FLZ8lEuKy3dq0raKmyaUrsK1XNasKP1b6orzCMvVShFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7tsDkU7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7tsDkU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773695073; x=1805231073;
  h=date:from:to:cc:subject:message-id;
  bh=6JDZlU5uVR1552lQGLHC3skY2c+sBpdQ1j76fcQ8RxA=;
  b=O7tsDkU7FBflflum9JmC8rZ9o6eCrhh+eW38xgkx0EX+DeAv0XnIj8M/
   2BKWFOUmWRrkbzAf6S0gebPKNv5Dpb3RAi3wjOf0L+5lA27c2E9JASnAd
   /eoZus6HjpYUiffXHX2gT25eGDf5bacdClTSW/bJwR+Dfp7jDN+ciAAwy
   VYQ60Wx/4k8Jc+D8izT43jlRj9+fJbbAUheM06x7P4t7+zF5YTMbx13TO
   asc6VnDZrTUrCLVx3LWnY/UnR2IMgscafHsB8kAqGgHrBxJ3CafNRG7tF
   DOLtnZfAamOEXAdlj3jRPuYc/i/4SOi0lXfl9xrrZM1iUMD4HEepFnvZ0
   Q==;
X-CSE-ConnectionGUID: rbC36xEYQzKgcCRn3wzqxQ==
X-CSE-MsgGUID: WZRwrLOORimNaZd9XTdNzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85419316"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85419316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 14:04:32 -0700
X-CSE-ConnectionGUID: 2uPYYHTYTH+yMWNKOoRUrw==
X-CSE-MsgGUID: vG4S87rVSvyfhEbQvNCPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="227025027"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Mar 2026 14:04:32 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2F6y-000000001I6-45dm;
	Mon, 16 Mar 2026 21:04:28 +0000
Date: Tue, 17 Mar 2026 05:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/ps3/ps3-sys-manager.c:69 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202603170448.SffSrViJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Randy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   4 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 months ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603170448.SffSrViJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170448.SffSrViJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603170448.SffSrViJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/ps3/ps3-sys-manager.c:35 Incorrect use of kernel-doc format:  * struct ps3_sys_manager_header - System manager message header.
   Warning: drivers/ps3/ps3-sys-manager.c:43 cannot understand function prototype: '* @version: Header version, currently 1.  * @size: Header size in bytes, currently 16.  * @payload_size: Message payload size in bytes.  * @service_id: Message type, one of enum ps3_sys_manager_service_id.  * @request_tag: Unique number to identify reply.  */  struct ps3_sys_manager_header'
   Warning: drivers/ps3/ps3-sys-manager.c:66 Cannot find identifier on line:
    * @PS3_SM_RX_MSG_LEN_MIN - Shortest received message length.
   Warning: drivers/ps3/ps3-sys-manager.c:67 Cannot find identifier on line:
    * @PS3_SM_RX_MSG_LEN_MAX - Longest received message length.
   Warning: drivers/ps3/ps3-sys-manager.c:68 Cannot find identifier on line:
    *
>> Warning: drivers/ps3/ps3-sys-manager.c:69 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
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
>> Warning: arch/powerpc/platforms/cell/spu_base.c:222 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Given an array of @nr_slbs SLB entries, @slbs, return non-zero if the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
