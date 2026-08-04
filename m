Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF23B5303
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881263; cv=none; b=PlE02ffFI4R/cNHvLnTISrLPp1Q782MG+D9wJ961Ns68/+U96f7tZkodyQfowFhgDBmB81VAfJiEpxFqWcf02f7X+vCJBNxIb7rrj5tXiDqv691VQ2b6zn0ARRtmQY4kmpHd8hwPdOrppfGuqUcELcX7sE8//RkYSMM0uQ+kTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881263; c=relaxed/simple;
	bh=J2DrRoFPSae7vCBl2xaGskczpAKx70Z8KM/7cNuA42c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jDuaXLXayV1PMDUYH5MPlwWvp7DSkCQUea30Ml7OsjO9ONIMBOvIptdGXN8wF2GdFosezJ/DLOou8SGFoU1aHHHblzcZ/NSy3ef67/I2lpw4ZIfGqA/CQCmMjwwGWXYOPe+dJQcAeOHKYfgKWsDf26azRVwTZywgCfv6oOfBtmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1veG17t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1veG17t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785881262; x=1817417262;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J2DrRoFPSae7vCBl2xaGskczpAKx70Z8KM/7cNuA42c=;
  b=b1veG17tvu1Gel5ltJNsWKDcOV1mR/bHtWbjR1yAPjvhFsp3dVPng5ll
   QqHAsI2n+IgfuWVK8n7sV35WqkWrSDNDbP19oKZpAqX6sE7uzE0ajx3qi
   jskQ1aKjefe3KEMVMkTx5K3LrcMFC0cC8UchZDjU3FSZGuVmDtsaJ+o9j
   ODMmQpUZfQRGzFGpV9VRRf6Zwy5h8r/y3RxPj+RNTGIyKoHPQVyhI2/qV
   Rl7n6tlVSYKSp0YvBMFJb3I1Chu88dKXOEWuNOLYpGM7P+5U8cdT9IkBp
   NmTfSBmw/omYK2cGCBREaaUrCKmfL1vFV43WLz/2MBu27NHg0RNbjuOxG
   A==;
X-CSE-ConnectionGUID: pnrfbjBkSD+asCDhMtuuYw==
X-CSE-MsgGUID: 8ZqVBlTtTceVGUOpD5kQWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86215006"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86215006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:07:39 -0700
X-CSE-ConnectionGUID: 1dvVVr/xRIiXU1c97Si/jA==
X-CSE-MsgGUID: FOXZ1GEBReyFRblH/i9Rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="262206622"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Aug 2026 15:07:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrNIN-00000000ArH-3iqI;
	Tue, 04 Aug 2026 22:07:35 +0000
Date: Wed, 05 Aug 2026 06:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: scripts/syscallhdr.sh: 77: [[: not found
Message-ID: <202608050554.JZ7dS878-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/Andr-Almeida/syscalls-Create-unified=
-partial-table-for-all-archs/20260725-040333, commit: ee3a650b2d887e916d8d6=
44af5416769b7f63f16"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Andr=C3=A9 Almeida" <andrealmeid@igalia.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/syscall=
s-Create-unified-partial-table-for-all-archs/20260725-040333
head:   8c63d3ddb37ca9ef5da08071f85493dd0b281816
commit: ee3a650b2d887e916d8d644af5416769b7f63f16 syscalls: Add support for =
x86_x32 for the common syscall table
date:   11 days ago
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805=
/202608050554.JZ7dS878-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260805/202608050554.JZ7dS878-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608050554.JZ7dS878-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/syscallhdr.sh: 77: [[: not found
>> scripts/syscallhdr.sh: 77: [[: not found
   scripts/syscallhdr.sh: 120: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:29: arch/x86/include/gene=
rated/uapi/asm/unistd_32.h] Error 2
>> scripts/syscallhdr.sh: 77: [[: not found
   scripts/syscallhdr.sh: 120: Syntax error: redirection unexpected
   scripts/syscallhdr.sh: 120: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:43: arch/x86/include/gene=
rated/uapi/asm/unistd_64.h] Error 2
   make[3]: *** [arch/x86/entry/syscalls/Makefile:39: arch/x86/include/gene=
rated/uapi/asm/unistd_x32.h] Error 2
   scripts/syscalltbl.sh: 100: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:52: arch/x86/include/gene=
rated/asm/syscalls_32.h] Error 2
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [arch/x86/Makefile:256: archheaders] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
