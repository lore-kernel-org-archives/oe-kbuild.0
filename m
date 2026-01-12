Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165CB672
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 01:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182566; cv=none; b=i89xB+hHmbFkQZPEiJK4JYrRYGTZpTb9/S2Rdudo3C2Ujido74Ds1/BFS+jan6vnHaaOdtqevZRVVIaMYu6nb4nxmLDfsPRfvIWDA+0CTFuZvKMgjodcaKitLNeNwNq0X74JpwgnaEHcbhiAUD+0Gx787DKhcCmqggUjAhDEMiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182566; c=relaxed/simple;
	bh=9+pJGtYCfx44jtlbZ6OeaTV89DghTIxmbzRc/4WcWYQ=;
	h=Date:From:To:Subject:Message-ID; b=ctGg/vtps4stwfdkZIRzmvr4me8qhvnOgBKT0XzMJrutf3P4rOPGY0E/+53jkCCx8vEpzMdOe4zf3IGeIrv4juYlJh4LrBjIp1+Ll57Sl9ODQ41U91UwFpjCZH57pbirJTukSl5SWSwNKGPsCp6WZcajN+FOTZ/JeUytDZ5qcqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYD6apaf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYD6apaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768182564; x=1799718564;
  h=date:from:to:subject:message-id;
  bh=9+pJGtYCfx44jtlbZ6OeaTV89DghTIxmbzRc/4WcWYQ=;
  b=iYD6apafWgL0X3yBeV4VO+fnGTDO3nwL4N75e++EsPtsHl48vkPLvlV8
   WxwLGi2WSM667eiWcWvwmyHwGfHRlvBXFdFd4ERlsqhq+BVVY5KIPDSFm
   HlnxhEdz2PgmRX3BCwJ58uwioNnQEUjAh/2bHh04Kf/tEj745ru8VCad+
   Cwu3GiOxUwxSpPbXxVxE8A1iQ5tb25RRy288etoiI8hd6WNDFpDvXNvdj
   5ncydPS5U5xfwgor2eLTNKEisZGjXl1yHbhZY9DknqYGsOyG2gduWD/mh
   qcnIGIzngXo0MyO1Ntv9rAo/HhOAx8ieANekXfOpFTSPsfvcKPaAq+R+w
   Q==;
X-CSE-ConnectionGUID: qsLAzykTQcme1BUARbRfeQ==
X-CSE-MsgGUID: +oLto5e3SFeQdu2YXzdqbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69356854"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69356854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:49:24 -0800
X-CSE-ConnectionGUID: mm6BnYbIQ5238OPhogYiQg==
X-CSE-MsgGUID: SAXpZXdaSsGFo5G+LDZDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241499330"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2026 17:49:24 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf73a-000000000c5-00sQ
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 01:49:22 +0000
Date: Mon, 12 Jan 2026 02:48:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:max/vxlan-bigtcp 20/21] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
Message-ID: <202601120201.8YbsxUm2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: 84c940b63b7d32d92b518dc40401f8576dcd05bb [20/21] geneve: Enable BIG TCP packets
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120201.8YbsxUm2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#21: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#32: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#45: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#56: 
    Socket Socket  Message  Elapsed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
