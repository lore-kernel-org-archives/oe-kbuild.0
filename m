Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922922;
	b=pI5JBgVd5dgM5ccbGARC8X3ts12635c54NjPX+4nuj1wJqrmWK6hc6TXoMDsMv9ymAJQ
	 MkUGu7kgmKOvKgYM/9Q9zFyec7DvbEtzBH/EIIxj7s44OmESYnClQ6JlOKNWclYXr4wNW
	 dYyw6uHhpGgHSGboQUZ2UKzuH9yojvW6IalYDIJnrgck1/FKBp/Ah8k1q9+HXcRkn3J7D
	 mB1D7V4h2yY1yV2xstygUm74dTap4ctF0FBw0d/yxDHQ38MzrOBNikR84e8Gob6y6NHEC
	 pL2lxByUUItpKG1xbbUf6fMWg8q7cbTQw6RkIMT5o45DqucrO1QLz81fluzFcc2OOeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922922;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=F/QD/EkqsX5EIr5eY1T5TW7rTIC7sD5pcQKW0F6GJhQ=;
	b=S2f885wbxiABFq8na6oi7gGJEftZ2DFozh4jdJy+CvLw1ZENlYkDI9eK6/fmJaKoqKzP
	 bN6OjIEYGHQotBelKHoGLj5yyiYqvQ/4b77dHqyH9siU03OEuRXVP5HJgrm8NVFMZGv5B
	 6SAP+lpl0wKPYW7Bi4F4sgu++NfRTrHUuCzeWN6Nqbmy6Ol2iJRP/q9nx0NpmkAOPt6Eg
	 RjqCZO2/+VTLrTZ7IOdGU/fzVwNRp0KTb3BzIp24OQMgmQU6me4MP4AyyZe1jyPnlmnBD
	 E9kwV2bWbIlqxx4R2kxhKlbTrgg51YkrGN/1wWi0aXbB+0EM6rpgdv/L6M5hkOK0HKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N0r9cEfh;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B0606A326
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 23:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N0r9cEfh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793922921; x=1825458921;
  h=date:from:to:cc:subject:message-id;
  bh=NZHeHvy9DIZpTDRkKZ6/V/lPy+2ke7woKjKjWCPoU0g=;
  b=N0r9cEfhOZ16BG3OrCgjROiA7laMjCX3nTBSL6lp0JcQ/f7Qnl8Zrqsg
   4Q2OrAepGLp1KwWfXeRCIqZaD20QRIYUj7C01AO7LdpRaGS3BL+AIQkX9
   V5CcNcd0mnPAfaw317yISkq65/qsW00kFSUkP1rBi7b0C2yHFAPMcPxsp
   UTArEfxWIm9EusiKaou4/zlm/cR2sqNN2mFHPtu6Fo4y4Jzg/dE2DwxD9
   j+pNrnCS3tFyRxokZoj0K4RyRUfKqCeAD3nspcyw1begf5i92Creilf6B
   tRp+Uz8dXGC9dF13ut9jGAmAkS5kj1J00UApeBUPhgxvjVWT6XbTxD5s8
   A==;
X-CSE-ConnectionGUID: 9YSdwsfCR3WQkWW/CXOLNQ==
X-CSE-MsgGUID: Y3S6ljT6TkKwj7DxFSA97Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2636599"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2636599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:55:21 -0800
X-CSE-ConnectionGUID: IHCTT9q/R7Owpg50w3pqZw==
X-CSE-MsgGUID: HmqCBIbnShSuzZADih4fqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7017564"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 Nov 2026 15:55:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP7Ia-000000009tf-2PHW;
	Thu, 05 Nov 2026 23:55:16 +0000
Date: Fri, 06 Nov 2026 00:54:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:asdn-7.2 1131/1311] ERROR: modpost: __ex_table+0x1fbc
 references non-executable section '.data..ro_after_init'
Message-ID: <202611060019.OMo9soYy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Huang <Alex.Huang2@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Mario Limonciello (AMD)" <superm1@kernel.org>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git asdn-7.2
head:   daebab22691416366c30db2ad13ef2d18adf912b
commit: ac10a874fc8aecc5d91a29bdcf4927169757714d [1131/1311] drm/edid: Parse AMD VSDB for FreeSync refresh range
:::::: branch date: 3 weeks ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-2004-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060019.OMo9soYy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060019.OMo9soYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611060019.OMo9soYy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: event_handshake_cancel+0xc (section: .data) -> serdev_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_handshake_cancel_busy+0xc (section: .data) -> serdev_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x0 (section: .data) -> 0x6478c (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x4 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x1c (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x20 (section: .data) -> 0x647a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x38 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x3c (section: .data) -> 0x647a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x54 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x58 (section: .data) -> 0x647a8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x70 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x74 (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x8c (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_op+0x90 (section: .data) -> 0x647b0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_op+0x8 (section: .data) -> 0x647b4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_op+0x1c (section: .data) -> 0x647b8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_op+0x20 (section: .data) -> earlycon_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x0 (section: .data) -> 0x6478c (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x4 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x1c (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x20 (section: .data) -> 0x647a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x38 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x3c (section: .data) -> 0x647a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x54 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x58 (section: .data) -> 0x647a8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x70 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x74 (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x8c (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_read+0x90 (section: .data) -> 0x647b0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_read+0x8 (section: .data) -> 0x647d0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_read+0x1c (section: .data) -> 0x647ec (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_read+0x20 (section: .data) -> 0x647e8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x0 (section: .data) -> 0x6478c (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x4 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x1c (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x20 (section: .data) -> 0x647a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x38 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x3c (section: .data) -> 0x647a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x54 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x58 (section: .data) -> 0x647a8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x70 (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x74 (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x8c (section: .data) -> 0x64790 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0x90 (section: .data) -> 0x647f0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0xa8 (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0xac (section: .data) -> .LBB1_11 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0xc4 (section: .data) -> 0x647ac (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_fields_ma_write+0xc8 (section: .data) -> 0x647b0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_write+0x8 (section: .data) -> 0x647f0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_write+0x1c (section: .data) -> 0x647f4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_ma_write+0x20 (section: .data) -> 0x647f8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> 0x517604 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee8 (section: __ex_table) -> 0x46c58d (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> 0x46c659 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> 0x11d589 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> 0x58873a (section: .debug_str)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> 0x6a54a0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f20 (section: __ex_table) -> 0x433796 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f24 (section: __ex_table) -> 0xaa5c9 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f2c (section: __ex_table) -> 0x46bf75 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f30 (section: __ex_table) -> 0x46bf84 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> 0x2df8a0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f3c (section: __ex_table) -> 0x6dd805 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> 0x4dedb3 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f48 (section: __ex_table) -> 0x51781a (section: .debug_str)
ERROR: modpost: __ex_table+0x1f48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f50 (section: __ex_table) -> 0x46c17e (section: .debug_str)
ERROR: modpost: __ex_table+0x1f50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f54 (section: __ex_table) -> 0x632019 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> 0x1ff4d6 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> 0x1c74b2 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> 0x319026 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> 0x5c175d (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> 0x4df1b5 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> 0xe4efc (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> 0x1c7a8a (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> 0xab06a (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fbc (section: __ex_table) -> shmem_inode_cachep (section: .data..ro_after_init)
>> ERROR: modpost: __ex_table+0x1fbc references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc8 (section: __ex_table) -> 0x236da3 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fcc (section: __ex_table) -> 0x51735a (section: .debug_str)
ERROR: modpost: __ex_table+0x1fcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd4 (section: __ex_table) -> 0x18e610 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> 0x46c109 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff8 (section: __ex_table) -> 0x6a5548 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ffc (section: __ex_table) -> 0x54f84a (section: .debug_str)
ERROR: modpost: __ex_table+0x1ffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2004 (section: __ex_table) -> 0x5589f4 (section: .debug_str)
ERROR: modpost: __ex_table+0x2004 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2008 (section: __ex_table) -> 0x2e89f7 (section: .debug_str)
ERROR: modpost: __ex_table+0x2008 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2010 (section: __ex_table) -> 0x5175c2 (section: .debug_str)
ERROR: modpost: __ex_table+0x2010 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2014 (section: __ex_table) -> 0x7241c (section: .debug_str)
ERROR: modpost: __ex_table+0x2014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x201c (section: __ex_table) -> 0x1ff4ac (section: .debug_str)
ERROR: modpost: __ex_table+0x201c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2020 (section: __ex_table) -> 0x6322d1 (section: .debug_str)
ERROR: modpost: __ex_table+0x2020 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2028 (section: __ex_table) -> 0x4a65a7 (section: .debug_str)
ERROR: modpost: __ex_table+0x2028 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x202c (section: __ex_table) -> 0x3c37ce (section: .debug_str)
ERROR: modpost: __ex_table+0x202c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2034 (section: __ex_table) -> 0x40e (section: .debug_str)
ERROR: modpost: __ex_table+0x2034 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2038 (section: __ex_table) -> 0x2a7a2f (section: .debug_str)
ERROR: modpost: __ex_table+0x2038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2040 (section: __ex_table) -> 0x6a57c5 (section: .debug_str)
ERROR: modpost: __ex_table+0x2040 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2044 (section: __ex_table) -> 0x5f95fb (section: .debug_str)
ERROR: modpost: __ex_table+0x2044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x205c (section: __ex_table) -> afs_break_one_callback.__warned (section: .data..unlikely)
ERROR: modpost: __ex_table+0x205c references non-executable section '.data..unlikely'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2064 (section: __ex_table) -> 0x26e981 (section: .debug_str)
ERROR: modpost: __ex_table+0x2064 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2068 (section: __ex_table) -> 0xaa6e9 (section: .debug_str)
ERROR: modpost: __ex_table+0x2068 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2070 (section: __ex_table) -> 0x79654 (section: .debug_str)
ERROR: modpost: __ex_table+0x2070 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2074 (section: __ex_table) -> 0x15d71c (section: .debug_str)
ERROR: modpost: __ex_table+0x2074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x207c (section: __ex_table) -> 0x578 (section: .debug_str)
ERROR: modpost: __ex_table+0x207c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2080 (section: __ex_table) -> 0x5177c9 (section: .debug_str)
ERROR: modpost: __ex_table+0x2080 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2088 (section: __ex_table) -> 0x6e41c9 (section: .debug_str)
ERROR: modpost: __ex_table+0x2088 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x208c (section: __ex_table) -> 0xb7b53 (section: .debug_str)
ERROR: modpost: __ex_table+0x208c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2094 (section: __ex_table) -> 0x2a7baf (section: .debug_str)
ERROR: modpost: __ex_table+0x2094 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2098 (section: __ex_table) -> 0x3191d1 (section: .debug_str)
ERROR: modpost: __ex_table+0x2098 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a0 (section: __ex_table) -> 0xede22 (section: .debug_str)
ERROR: modpost: __ex_table+0x20a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a4 (section: __ex_table) -> 0x1d13fa (section: .debug_str)
ERROR: modpost: __ex_table+0x20a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ac (section: __ex_table) -> 0x7b85a (section: .debug_str)
ERROR: modpost: __ex_table+0x20ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b0 (section: __ex_table) -> 0x4e8462 (section: .debug_str)
ERROR: modpost: __ex_table+0x20b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b8 (section: __ex_table) -> 0x127161 (section: .debug_str)
ERROR: modpost: __ex_table+0x20b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20bc (section: __ex_table) -> 0x38b555 (section: .debug_str)
ERROR: modpost: __ex_table+0x20bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c4 (section: __ex_table) -> 0x47a88e (section: .debug_str)
ERROR: modpost: __ex_table+0x20c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c8 (section: __ex_table) -> 0x46c57a (section: .debug_str)
ERROR: modpost: __ex_table+0x20c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d0 (section: __ex_table) -> 0x319582 (section: .debug_str)
ERROR: modpost: __ex_table+0x20d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d4 (section: __ex_table) -> 0x433d6a (section: .debug_str)
ERROR: modpost: __ex_table+0x20d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: __ex_table) -> 0x5c1ba1 (section: .debug_str)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e0 (section: __ex_table) -> 0x31960c (section: .debug_str)
ERROR: modpost: __ex_table+0x20e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e8 (section: __ex_table) -> 0x5171e7 (section: .debug_str)
ERROR: modpost: __ex_table+0x20e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ec (section: __ex_table) -> 0x38af34 (section: .debug_str)
ERROR: modpost: __ex_table+0x20ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: __ex_table) -> 0x3513d0 (section: .debug_str)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f8 (section: __ex_table) -> 0x5886b4 (section: .debug_str)
ERROR: modpost: __ex_table+0x20f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: __ex_table) -> 0x631ebd (section: .debug_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2110 (section: __ex_table) -> 0x140af2 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: __ex_table) -> 0x517304 (section: .debug_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: __ex_table) -> 0xf (section: .debug_str)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: __ex_table) -> 0x189 (section: .debug_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
