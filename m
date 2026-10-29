Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314045;
	b=CURdi0r6y00GV+o+o78Fw2pbJYxdsf6pjASwkunETTaaoRMuVANkbmye5Lamp2Rumh5W
	 krtY/5Odo1gJGekxV9NFEIOy4tw9RfFZA/wxzIwNczimcoohcIpHQbgWYJJDW0StuSA1o
	 nPJ6C67XL+zH/fukXQ91tJ0o5kkpxTZOvIPlPcjy3R8tMB0oB1SgME5ndkFZEfyM0kZBO
	 QCmqtHQzbNTVeBYpbaGmrL5Kn+zFys8E4u1UtA9tem5pfrjkfPHzj4EB9GqyWvzvM84LI
	 jNIRC4xGWqkXpIdO1L+ypXXOOk3mpwWsDSVcr3U/7M7cFiG7MoAbYyeRo3KqYPfRQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314045;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tZSv0YjsB2TzKE0R+MQMux5yRCeTAMx1PR59TUCOuvE=;
	b=TxFEJonc3ORUhftVTDV4KB3vYBqmq325vS1AjE54YZ1d8v3U8EHdBZrq+8QA7K3NDWqT
	 Sv9fsbASL8/fOV2OHZXB+YgX1m3ILNqohMeVIQb/8SrALykzKxOk6iGif3ER/plGEncn7
	 nd/BfXlskQ5WinHpyNUmpzdnG9d0lE3gpOv7G5dboq1TEnb5jTZPQ9DGrFQae7uq5PKXq
	 cPxF7O+ij8WQezFquhpFQ2B9QuigtuOfEAa8HU61s3ZCD/y+YP8BkKQpiMsfWRCdsVyFm
	 MUbfTfrPfN9wB2k4pu1EvKHvYiuSaS195GZoR0bGYOlOQPP4KYe9w9RN+4pR5NvTV1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JifX5558;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9802606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 22:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9802606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JifX5558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793314043; x=1824850043;
  h=date:from:to:cc:subject:message-id;
  bh=q0QRgjHeg+7dZUt9u3KN2Mmk7I3l1YcIRTD5YTYdkPU=;
  b=JifX5558IuEoN1I8HXvKN/6UPHzO83zUtbtNNjAabLz4buz1y3Naf42u
   5UVCCuO9r4BvpClAD6U2fjag3SAGndnnSiaBcwcrM5Snm90du3SuGYoLI
   ckfdzGforqKYwajKhGqYqHAwkarBsVAfLLNvvorEHM+2ZaH8OVrgmX3L8
   KgeUBIHKil9AEPepfd+afRcIgz8KpSiCVMQfKrSn6CrbtVvZeVK+ZzOoa
   pEJ+ScmnA9ROdswM5D3qOczGE6dmDpKSPAIplOGviWmxh6Sn0SMePWLkU
   Kg7lAMSaf/33HbrO4yzCHbU/7jb89Y4D2fTPP5bbcsT1vMU1mDPpvRexc
   A==;
X-CSE-ConnectionGUID: /XsxMpoDSwKKYk3kQLGMtg==
X-CSE-MsgGUID: Abf7VQsQTneLE/Nsd+tzNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1957528"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1957528"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 15:47:22 -0700
X-CSE-ConnectionGUID: BkQzBLW0QVO9PCF3YK4orw==
X-CSE-MsgGUID: VIKAnzkqQwSafd9Hq+bLSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5171870"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Oct 2026 15:47:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMYty-000000005Mj-3LzL;
	Thu, 29 Oct 2026 22:47:18 +0000
Date: Thu, 29 Oct 2026 23:47:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thesofproject:topic/sof-dev 9658/9676] ERROR: modpost:
 __ex_table+0x1bc0 references non-executable section '__dyndbg'
Message-ID: <202610292307.Aqr8nEGT-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   4db5285a097688332007fa2f1261b1f73ebaf20d
commit: cb2e18fa1e93e025f26a7c3c3f678446af5c46e1 [9658/9676] Merge remote-tracking branch 'regmap/for-next' into sound/upstream-20261015
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-r2105-20261029 (https://download.01.org/0day-ci/archive/20261029/202610292307.Aqr8nEGT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292307.Aqr8nEGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610292307.Aqr8nEGT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: event_fsi_master_aspeed_cfam_reset+0x20 (section: .data) -> 0x2b2ec (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_master_aspeed_driver+0x0 (section: .data) -> 0x29b14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_master_aspeed_driver+0x4 (section: .data) -> 0x29fa8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_master_aspeed_driver+0x14 (section: .data) -> 0x2b330 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_master_aspeed_driver+0x2c (section: .data) -> 0x2b308 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_cfam_reset+0x0 (section: .data) -> 0x2b430 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_cfam_reset+0x18 (section: .data) -> 0x2a860 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> 0x4dbf3d (section: .debug_loc)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> 0x4dc081 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> 0x4dc4ff (section: .debug_loc)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> 0x4dc5b4 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> 0x4e31ae (section: .debug_loc)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> 0x4e3292 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> 0x4e34ab (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> 0x4e354a (section: .debug_loc)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> 0x4e74a6 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> 0x4e7571 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> 0x4e7979 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> 0x4e7c88 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> 0x157d4b (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> 0x5f7b72 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> 0x595a63 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> 0x43cde3 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> 0x188b6e (section: .debug_str)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> 0x49d8fc (section: .debug_str)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> 0xf647b (section: .debug_str)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> 0x21d390 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> 0x15813e (section: .debug_str)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> 0x1ba8a9 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> 0x500aa0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b1c (section: __ex_table) -> 0xc4eab (section: .debug_str)
ERROR: modpost: __ex_table+0x1b1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> 0x46cfa8 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b28 (section: __ex_table) -> 0x24ec31 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> 0x31ce4 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> 0x595ff1 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b3c (section: __ex_table) -> 0x21deb4 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> 0x412752 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> 0x59d601 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> 0x3dfeef (section: .debug_str)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> 0x43cd11 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> 0x127367 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> 0x93e46 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> 0x127367 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> 0x56418d (section: .debug_str)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> 0x127367 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> 0x3181a (section: .debug_str)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> 0x767 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> 0x5f7b9a (section: .debug_str)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> 0x1ba4c7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> 0x3132a7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bac (section: __ex_table) -> 0x500cb2 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb4 (section: __ex_table) -> 0x158388 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> 0x940ab (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> warn_unsupported.descriptor (section: __dyndbg)
>> ERROR: modpost: __ex_table+0x1bc0 references non-executable section '__dyndbg'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> 0x344bd3 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> 0x31cca (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c08 (section: __ex_table) -> 0x344d5e (section: .debug_str)
ERROR: modpost: __ex_table+0x1c08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c0c (section: __ex_table) -> 0x313255 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> 0x313184 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c18 (section: __ex_table) -> 0x21d61b (section: .debug_str)
ERROR: modpost: __ex_table+0x1c18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c2c (section: __ex_table) -> 0x5647c6 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c30 (section: __ex_table) -> 0x500cdf (section: .debug_str)
ERROR: modpost: __ex_table+0x1c30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> 0x31e31 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c3c (section: __ex_table) -> 0x532aa2 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> 0x188ffa (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> 0x31f1c (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> 0x53cafc (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> 0x161ecf (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> 0xa37f (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> 0x6004e5 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c68 (section: __ex_table) -> 0x415267 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c6c (section: __ex_table) -> 0x1c4561 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c74 (section: __ex_table) -> 0x49d4ee (section: .debug_str)
ERROR: modpost: __ex_table+0x1c74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c78 (section: __ex_table) -> 0x939b1 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c80 (section: __ex_table) -> 0x46ccde (section: .debug_str)
ERROR: modpost: __ex_table+0x1c80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c84 (section: __ex_table) -> 0x3a6c22 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c8c (section: __ex_table) -> 0x4ceea0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> 0x500a94 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb0 (section: __ex_table) -> 0x46ccfd (section: .debug_str)
ERROR: modpost: __ex_table+0x1cb0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb4 (section: __ex_table) -> 0x27f96f (section: .debug_str)
ERROR: modpost: __ex_table+0x1cb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cbc (section: __ex_table) -> 0x595b28 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cc0 (section: __ex_table) -> 0x18888b (section: .debug_str)
ERROR: modpost: __ex_table+0x1cc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cc8 (section: __ex_table) -> 0xf6254 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ccc (section: __ex_table) -> 0x18887a (section: .debug_str)
ERROR: modpost: __ex_table+0x1ccc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd4 (section: __ex_table) -> 0x5f83e0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd8 (section: __ex_table) -> 0x171 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce0 (section: __ex_table) -> 0x21d04a (section: .debug_str)
ERROR: modpost: __ex_table+0x1ce0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce4 (section: __ex_table) -> 0x3a718e (section: .debug_str)
ERROR: modpost: __ex_table+0x1ce4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cec (section: __ex_table) -> 0x7b1 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf0 (section: __ex_table) -> 0x56483a (section: .debug_str)
ERROR: modpost: __ex_table+0x1cf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf8 (section: __ex_table) -> 0x5961b4 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cf8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cfc (section: __ex_table) -> 0x532367 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d04 (section: __ex_table) -> 0x2b133a (section: .debug_str)
ERROR: modpost: __ex_table+0x1d04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d08 (section: __ex_table) -> 0xf67de (section: .debug_str)
ERROR: modpost: __ex_table+0x1d08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d10 (section: __ex_table) -> 0x188f5e (section: .debug_str)
ERROR: modpost: __ex_table+0x1d10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d14 (section: __ex_table) -> 0x43cd71 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d1c (section: __ex_table) -> 0x1eb4bf (section: .debug_str)
ERROR: modpost: __ex_table+0x1d1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d20 (section: __ex_table) -> 0x1eb4b6 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> 0x700 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> 0x444580 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> 0x2599b9 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> 0x1944bc (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> 0x1bab13 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> 0xc50cd (section: .debug_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
