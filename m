Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6E3E8C50
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130198; cv=none; b=GtM1BuXesIRcA/UYsRXTu8EgeZmUgEhC1bCzFbNzFAK8jcLalKMl5y3JKKhaExr+lloUd6IU/SD6t2I2mQWZtSKGg9NSFL/3MsTCm3io6joOCPg5d79sX3rNGb87TacF3ExxmtqFSc3e8w+FbUSsOhew47AKflLh/YQzNNPtiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130198; c=relaxed/simple;
	bh=TgoWF3f2l+25/I9vfQ65YCcx1NgsasYL3NnP5YjzR3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3Ff+84lhG+vpwlyPqMXKWLJ22ryw1UZzD/mkBFCqjgG8L/5fD8E9YbeI27A+LpIPrVbSWJq9QgD9/42GhBlEX7C+WsMSvIbjsEODp9YmEuBRxf5CgeDCRKypdH/sWFAu1pU0fNvuQBXMVmI46zBKvpZ4APsm8oHVGD3kIYqONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6C4e+g3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6C4e+g3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773130196; x=1804666196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TgoWF3f2l+25/I9vfQ65YCcx1NgsasYL3NnP5YjzR3g=;
  b=O6C4e+g3p06dutKX7MdpzS/o/UdP/Rrje1mxT6ewRyE9QsbkE9CkdvFM
   PoJwU9Dlo0UIh6CJ8iKCBwKMdjq2jTrCudnDX0GxxPBkYVr60SJvDQ6iL
   ehnmBntaG41EEETxuMzbIURp0YQV71Y8HB3bq6Irt99Hioc5LbYUcFuwh
   kHFi2PaGyDRGvZg1qUtyWoNVDDpS9gv2qZMcuGP13gi1vTSDHZc7ER6WE
   J1jK5D4vEeqVif8irP/QBfqD2dma02pRRVogXJAtQuW9vBHwPCP6a2nac
   IZ67jvisMWG3onxZTe5pz6Kxb+OgwzIQ9O2nRWOdFvgRhppoELynseiVw
   A==;
X-CSE-ConnectionGUID: ZOD2cjKuRgSUbKtjAAiv/g==
X-CSE-MsgGUID: O6MxoWCxSVyg1kfieN8CKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78020441"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="78020441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:09:56 -0700
X-CSE-ConnectionGUID: GUfuR/uqQ/yng7WTFKl6Jg==
X-CSE-MsgGUID: e91oOQ7DRHODAPrKln3qoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="250516542"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2026 01:09:55 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzsA4-000000001Z2-1Atj;
	Tue, 10 Mar 2026 08:09:52 +0000
Date: Tue, 10 Mar 2026 16:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/8] docs: kdoc: don't add broken comments inside
 prototypes
Message-ID: <202603101636.5yiLB85l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <18e577dbbd538dcc22945ff139fe3638344e14f0.1773074166.git.mchehab+huawei@kernel.org>
References: <18e577dbbd538dcc22945ff139fe3638344e14f0.1773074166.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Jonathan Corbet <corbet@lwn.net>
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
CC: Randy Dunlap <rdunlap@infradead.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.0-rc3 next-20260309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/docs-python-add-helpers-to-run-unit-tests/20260310-005923
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/18e577dbbd538dcc22945ff139fe3638344e14f0.1773074166.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH 3/8] docs: kdoc: don't add broken comments inside prototypes
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc64-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101636.5yiLB85l-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101636.5yiLB85l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603101636.5yiLB85l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/ps3/ps3-sys-manager.c:35 Incorrect use of kernel-doc format:  * struct ps3_sys_manager_header - System manager message header.
>> Warning: drivers/ps3/ps3-sys-manager.c:43 cannot understand function prototype: '/**
    * struct ps3_sys_manager_header - System manager message header.  * @version: Header version, currently 1.  * @size: Header size in bytes, currently 16.  * @payload_size: Message payload size in bytes.  * @service_id: Message type, one of enum ps3_sys_manager_service_id.  * @request_tag: Unique number to identify reply.  */  struct ps3_sys_manager_header'
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
