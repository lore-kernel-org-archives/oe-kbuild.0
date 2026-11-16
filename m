Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867688;
	b=D1O74m8aZKRzQ10CXY0HWHYXNCLkLSjVe6Ki0oWh9MnD9RpR7/tQ4jOr8gm7JFsXxxnE
	 04I4WcDukrgtSVi4j33z4K50x1dGzdt9069hwZpDSC4eCXKiee3sD9UGkXcXY79Ar+4wC
	 0iJz6GkxyEqmLC4J1jhecnn0tL6YIvr8b+RF51aOsYA2Y6tzTAAfowWuMpF8aOSuy9VyD
	 zLdHwtrKYnAo3EgjvHfZivrJeteiR1aZGlTcxr1COR7v9E5kmI66NZ115une2SGjWgwSD
	 dUwQYX2pnngg7rEbNmo5RDKtjfBg6FOLn4EQV5ci3fu7+Z0qw3mYhlzEuvwObFIK75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867688;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qm3Ll6Ih9ZIoS9xSrGh+rD19Jwty+ds3rIEexdSE0Y4=;
	b=z1fiiohFR/RoiCtwzL/Vq88BXW0xvsY+OWsp8g2vYf9jdPLI6zDmLBcJYuQyycCGNbxI
	 94hMltrALiftRewvzwWT/VD4BXyIr3EJ93E46zHWFrLkBOKH5HzAJMl0d1Vca0v8GYEe5
	 slAB497GEGiZJohLMChrnPRMsJ3LQwhplP2hMDgufK47zhMzcE+7+QfY0xQ/PbdIo2zbk
	 gV7feq2nxVESnkc6ltiwX8WN0hqGyPpI8D1W3vV6E/OEz8Q/DjtQE+8tiQyWmlQzsq1aO
	 JAHcwFxFAlnhmuVjGuFLUy1eq6VN4n0JoQGCzHASZMFK05m94ILy1WWfY7Y2cdrYrEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JcZpo6Kd;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3C7606A329
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 22:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E3C7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JcZpo6Kd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794867689; x=1826403689;
  h=date:from:to:cc:subject:message-id;
  bh=Pis7nZFFXcq+3SARPbjjc2wUhmhOtCzPJquTewEPweE=;
  b=JcZpo6Kd7kbLfNLrD5l6CPk74KUDd24/KhQGwCzL894QPTecCL9PrhSp
   fO8Q1QIiIZt672Pi+2b3mtf7nCCYn0v0Hpfn3g6vtare9FhpnHVSAj8Xp
   CNntu342t4UnnhpP/A5PWYa1l3nSH2cwZ/PaVY0K29MxC4vykZtWLLlUa
   rOQbLcTl70CXD6Uu/Eiw3q0Bk1XPt+T7gasuG2VZISfpH1aa0qlIE6eXd
   sy2uWHrZeILeoKvHmAZDAIp0+OCp7YFJpBOW70OuaUOWZ18fjd0yKC/ww
   00TuTxBA/pYeGUAjXsbonGua/0sDHx7WTFu+pTAk43TzIMAGM6le/impX
   w==;
X-CSE-ConnectionGUID: XuCHwxxiSLuQxIZA7oWpEg==
X-CSE-MsgGUID: NXgfaZhjS4OoHgbBUxdxSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3637906"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3637906"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:21:29 -0800
X-CSE-ConnectionGUID: pdhyL2C5R2SbZIvjuA/ZTg==
X-CSE-MsgGUID: ZkpW3FjgRiWkdWPTNcVOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9863517"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2026 14:21:27 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT54k-000000002ow-2pLA;
	Mon, 16 Nov 2026 22:21:25 +0000
Date: Mon, 16 Nov 2026 23:20:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18-lts 318/318]
 unix_listen.c:26:10: fatal error: kselftest_harness.h: No such file or
 directory
Message-ID: <202611162350.vLBOZfbI-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   c29a11a6da74fe6ffbc7bc4bbcb21f2e579e814d
commit: 814c5b1590037330381a4ae83aaf40c0986ba2bb [318/318] selftests/net/af_unix: test listen() rejects wrong socket states
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261116/202611162350.vLBOZfbI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162350.vLBOZfbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611162350.vLBOZfbI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> unix_listen.c:26:10: fatal error: kselftest_harness.h: No such file or directory
      26 | #include "kselftest_harness.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
