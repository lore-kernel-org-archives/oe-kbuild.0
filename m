Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5C313271
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069361; cv=none; b=U4/PaQK/89eLOd5AS2VgZBOHdd6QGCQO61/h7PFR7Y+Vhp3fLE0Q36vI9tbzWB2CtXDys+lIRf3rta9BlGOneFJq62TJPauZCTSKbZ7YCabYn9wgDQLFkiQJ71HhDjBOCXx1ZTvMkXtXbn3oWlNtdknYGgnaAjRNJnD5+wMlRZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069361; c=relaxed/simple;
	bh=9NHnG4St5feJjKony7Bzo+2ZIE7djaMZ1npw8wAgAt4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uz3zgesK5m45laYEPaQkpNn/cVFxugcdHdRd6mNe45npJsG3N0YZSTa2UKK+ciw4FGcFk1qOwcD6vbfPcvHQQxiTprtMrGgkiX4S2/Hy1univ5VRF5F4PC1ARAWiGxIOLufDzdZIOWxodnx9+HKdfC5wUCl06AuUtDs+NBQVdCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQVGM/MJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQVGM/MJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069360; x=1794605360;
  h=date:from:to:subject:message-id:mime-version;
  bh=9NHnG4St5feJjKony7Bzo+2ZIE7djaMZ1npw8wAgAt4=;
  b=JQVGM/MJdKBYDkm+bOikm3qFcZWgN73pMahBLMmu2Fid3eb3QwCqVYKx
   Vk3e1VaGWEH9tRMmB6BwRf3ermpd0169GvltanFUUyZCN8+zcFDiekzkR
   rfoiG2uByJhcIFgM2FwVDXdXTF9DCJkPH8zyusX//QwZZ1fJmp7htQ4cC
   UKuDsdwIouDe8K5wSJKWEYAm2tBBwaYGFuAYN7woJIcmn28OYWZaRixIO
   fBGVCicf0KBVaG1w7yujTe352njgaDIvbDNezskFZbE2LMz9eR+t3j7tj
   UsfR6qsWYZyb0tGLLYiDF716VjYSSbNggSCCP09bxpSL2QhJGj3f3XUDs
   Q==;
X-CSE-ConnectionGUID: qcZF3HYfScu3Fx7hkQsWwA==
X-CSE-MsgGUID: M2GCTbAlQYKvCLMVq/E23Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637563"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:29:17 -0800
X-CSE-ConnectionGUID: McCpmuydQp6mRK+XdHKpTA==
X-CSE-MsgGUID: dIG4TPLRQW+JYg4W/B9LDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189244556"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2025 13:29:17 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJesV-000000001Ag-02q3
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:29:15 +0000
Date: Thu, 13 Nov 2025 22:28:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 851/867] checkpatch:
 WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a
 quoted newline
Message-ID: <202511132048.tfdVMC8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 08209c1a245fe1ca0b78b31747565a552670f76e [851/867] bcachefs: bch_extent_rebalance_bp
:::::: branch date: 3 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511132048.tfdVMC8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511132048.tfdVMC8q-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#527: FILE: fs/bcachefs/data/reconcile.c:2025:
+			"btree ptr with no reconcile \n%s",

WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#540: FILE: fs/bcachefs/data/reconcile.c:2038:
+			"btree ptr with bad reconcile \n%s",

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#683: FILE: fs/bcachefs/data/reconcile_format.h:140:
+#elif defined (__BIG_ENDIAN_BITFIELD)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
