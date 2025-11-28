Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122C2F25F0
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764351871; cv=none; b=XePSeCi6xZWBzcvKiA3a2ydL/z73Y3gXgFPpZRjIMTeklIDPQ2G5L3URgNIF4+66CsMvdIuqiZi+Chkazc9Ha8DE70deIo/kVSc8Og24rH3ogpxcrO5UV6Xq3qPtbFnJy4E+aUNRvCW55O4y0w/ICmjOIAaO8RTUItMPP6two1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764351871; c=relaxed/simple;
	bh=M+0pkmm0xNM+nW2D+PkDsbc3fKPPnO2yh0H2KLH6fQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jc7yn/y6niLPLdH9nHVY/4N1yIQ/EWcwXz+PgIVuHsHGG6yUIRM3Q/yg9njZAZVRxd+w4ZOd/ac4mSy5FAHPPnmOBzyka/Q6FmZza5K+CNDt0P42m5/K70W4wXOA5rlmX1EUmqQHs9Ao51ZZyyYRwUOdgepjduvCj2eitAzFHFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwSr/de7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwSr/de7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764351869; x=1795887869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+0pkmm0xNM+nW2D+PkDsbc3fKPPnO2yh0H2KLH6fQk=;
  b=iwSr/de7zz9wmQ4Uh+Momlo8/RbHOiAfWl6S1+NIj+d7PGWib7NjdrSN
   xustq7HY4k2FNeB6mE08Pdk64w1BRoLBli2Qojd95aPyMlXH6BmcTzyNQ
   6ByIfiNVuk4RhF8vHX15BRzvAHJvBq8ATDsK8j3ESDZbUTl0BzRs6g84T
   6IR2nE+2DxDSkBgRtz5o6RwF+txPX+R+oWasdtD4m1+YexFmuFT7qv0+t
   po994/O+iBfnu8DgAwwdSOAgFigxH58MTdVZMjNxBt6S2TOSjM1iNXHDH
   vG4XLAGBwUTA3LTNnVHTcEVuB1S+WaaYee9Jbx9+TrevH3Yk29K3iAApP
   g==;
X-CSE-ConnectionGUID: yx7olAnDRqGHjV4i2C6Dtg==
X-CSE-MsgGUID: Kt+KwWbKQCSmEzMqjgRIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70242710"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="70242710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 09:44:28 -0800
X-CSE-ConnectionGUID: 3T/KkIRwSy+WwnmQbIat5w==
X-CSE-MsgGUID: W61Ul8EgSHWvl2r94qWOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="192768889"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 09:44:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP2W8-000000006cD-3kGI;
	Fri, 28 Nov 2025 17:44:24 +0000
Date: Sat, 29 Nov 2025 01:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:objtool/core 25/45] /bin/bash: line 1: 2050036 Segmentation
 fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr
 --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk
 --sls --static-call --uaccess --no-unreachable --noinstr --unret --link v...
Message-ID: <202511290115.aXrqsgEe-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Alexandre Chartre <alexandre.chartre@oracle.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   59bfa6408214b6533d8691715cf5459e89b45b89
commit: fcb268b47a2f4a497fdb40ef24bb9e06488b7213 [25/45] objtool: Trace instruction state changes during function validation
:::::: branch date: 33 hours ago
:::::: commit date: 7 days ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251129/202511290115.aXrqsgEe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290115.aXrqsgEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511290115.aXrqsgEe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 2050036 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --noinstr --unret --link vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
