Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39047F9C0
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763823280; cv=none; b=eUSh0p25zhM2R9Hs8++XBel/zU0YLM4aSfkJSogEGRHj+tapsl3Tc7NjV2l/lRpoiaDM2EMFyytyMEhuYQ2g8GzN3ERI4J2g8yrwjg/lZabAuSVpBF5V5yuWj+32ub6RIMJFE/w3Rbmnu/MCjs24ADB4yUb3jFxDAnkBgh+OFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763823280; c=relaxed/simple;
	bh=0Ncbaj6Y839OUzveImafauyFcKT4hBhkTa+PdsU6EMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrmlBu1hnXIqCKeg7TMy7HxbqVeimOlEu1OzbRXn/cFj6auZoLc795+ZVmWC/szZaU9Jo9iiXmXpeTFntgYL+hZPPZlQrxtsr5s7RHpCCBma1F206UKJCFV47DNJcNQoqRYkINBnFJUyjRjrQVqed5/rQOmMlCju0+/fhChNoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7jGrlF9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7jGrlF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763823278; x=1795359278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Ncbaj6Y839OUzveImafauyFcKT4hBhkTa+PdsU6EMI=;
  b=A7jGrlF9+3a5PAgZS3L6aetKTWmt9QyxhoYiFmyO9amTpaypj0xBpSnz
   zg5oSYVxMemZTA5oKrgkt2QTP9VoHre8dOVia+Z5zUzUATrReKqb5xaOo
   lGmgjB98TW4pTwi1xA9AJ1RpgSyfdI/jVfvvvL5x69Wfgi7nuOsNrdKTu
   Mx97uEUCLMt3xTzvPhR2qhldzrnQo05/z8XPvChG3wxo1xT9c4kUyAAsX
   QGbNRD5Y3r4ohgBazFOPWNB7T0iTjYz73B1Imu4VZStO3qf2bvXcz/lfj
   daD3g6tuU1MDz+x2O5Ow256bzAYb77gLuhQ7Wrvo3qdguYyOtLz9J+8lH
   w==;
X-CSE-ConnectionGUID: BwfrME5mTlKKBKFO3rz+tQ==
X-CSE-MsgGUID: TYPqoWdYQse+hUVWEBk0Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77253601"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="77253601"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:54:37 -0800
X-CSE-ConnectionGUID: Ip7WATZKSB2t87Sg5wCglQ==
X-CSE-MsgGUID: 0+dphcMaTXKq8jSpGtPrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192051115"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2025 06:54:37 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMp0U-000000002BP-0O9N;
	Sat, 22 Nov 2025 14:54:34 +0000
Date: Sat, 22 Nov 2025 15:53:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:uprobe_mov 6/7] arch/x86/kernel/uprobes.c:1496:36:
 warning: unused variable 'opt_xol_ops'
Message-ID: <202511221532.SZLHW3DG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_mov
head:   a54768cce1f5e7bc78f6e0278b90acdb53f896fc
commit: 9f17ca62d1b3abb147d790291196f02fe3723367 [6/7] opt
:::::: branch date: 2 weeks ago
:::::: commit date: 3 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221532.SZLHW3DG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221532.SZLHW3DG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221532.SZLHW3DG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/uprobes.c:1488:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1488 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1492:36: warning: unused variable 'sub_xol_ops' [-Wunused-const-variable]
    1492 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
>> arch/x86/kernel/uprobes.c:1496:36: warning: unused variable 'opt_xol_ops' [-Wunused-const-variable]
    1496 | static const struct uprobe_xol_ops opt_xol_ops = {
         |                                    ^~~~~~~~~~~
   3 warnings generated.


vim +/opt_xol_ops +1496 arch/x86/kernel/uprobes.c

8161bb24402c28 Jiri Olsa 2025-11-01  1495  
9f17ca62d1b3ab Jiri Olsa 2025-11-01 @1496  static const struct uprobe_xol_ops opt_xol_ops = {
9f17ca62d1b3ab Jiri Olsa 2025-11-01  1497  	.emulate  = optimized_emulate,
9f17ca62d1b3ab Jiri Olsa 2025-11-01  1498  };
9f17ca62d1b3ab Jiri Olsa 2025-11-01  1499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
