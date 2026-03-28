Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C812B94
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673225; cv=none; b=FV7mBFsM1lPXynXtjv+fdVjX0NVeRVYOFrFADxWL24zXjBi64ODVQgffDdhp/kaC1HCwMfgE/Au109w6vaQgugIKrk8/J04bDh83Pjy4Acz+n7jrU/8JbaW3rv7rGQimtEplAjVhnenYcOZ5UpDgwIWheu9MH8aJAUsQbDVbqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673225; c=relaxed/simple;
	bh=0tzT+iOQUS4Xsy0PZzGzjiXjpIqManRr97sjLRRX8Gs=;
	h=Date:From:To:Subject:Message-ID; b=DT7BOa4OUeE4qT7et1yBwSWsNmg1OgDeWnC9piKEH4nmQLs0d2KjYUBAcQ6Jofv0LWfblSNWZOoQTWJDwM0Dbfn5QTi1j0FjMaqVOBYJQDThi0wpkj9U8loxYN1OuyOnuVq0aj6YwkOdNOqC1qnAzdTwhFbFo5IQmk8dE6Hx6xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXaIROao; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXaIROao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673224; x=1806209224;
  h=date:from:to:subject:message-id;
  bh=0tzT+iOQUS4Xsy0PZzGzjiXjpIqManRr97sjLRRX8Gs=;
  b=nXaIROaoVcrpe4/crQ6vBFwB1NPZCpwaZucUdE1L/BHbrcYUl/ODyePM
   76vbKKVq+zWlsLlVUkljmMjNiEBzbpLODZF7rRsa3j60MPA7WkztU/J2S
   s4xE7BbGDIcK4dxvpHQ+BlHgb7atHQgvtjN38fpyRmJ6uVP5c+NWGFJsr
   Xc9YR968rXUJl46+50i2HIEFfFPOJIb+NGaPeMgPHrIAO1QZTqEPOlwgB
   iEXh8wKiMzu6LvHSJckAjxGF0he49GMWilysuknRYJWC8ocklLmi3+WUT
   Za2CnNWbiwKEKuu+6Z/Ri5f5cSrYh+QrrcF/dhTIgq1Df3+xTBVJ3i6qB
   w==;
X-CSE-ConnectionGUID: 3IW88Cq2R1itBtRWsaUDQg==
X-CSE-MsgGUID: S+pFvD8SRfmia+S6knPLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296698"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: SvEK1vydSNqyT+E6hOviAw==
X-CSE-MsgGUID: fs4HWxzWTxO2TxYeCB7NaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983381"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZa-000000007dX-3tty
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:58 +0000
Date: Sat, 28 Mar 2026 05:46:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 16/33] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'it'
Message-ID: <202603280501.xqcCe2r7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: 460fbe992a1625e68c87e79b10668cb89e0dd0e0 [16/33] riscv: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280501.xqcCe2r7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#6: 
Move the optimized XOR into lib/raid and include it it in xor.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
