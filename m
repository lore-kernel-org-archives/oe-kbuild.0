Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD911C69D
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771193658; cv=none; b=kIbq7emCBWuVBrKV7CzdET70M8HSvJORJGcjDJMSpqOKake3w+sypyQiaHhxJjlay604VKB0M2xy/iYdQh5i/AutSGLIPbQwgWGuoEiX7mMjcuP+v0QINSrVCBdb4fjHFtSjcfu8aCR4c3gl27OnxlUHrmf2k3NdDBLz/Ns/Ays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771193658; c=relaxed/simple;
	bh=Bz7hPd7eB90QTDgYfTWY6TJDBFwlgMTuwuwDz0QOOBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I6nWJAN17W5PRZ6HqbagVZQjjAeSW5qOFxX9xHAkt7VQAnDXz7k10T5hRZpjPDVKMdK5sUtEdqkFGrBnrRtGIFX+4hbTt1Q8j00+FPC94bTdVcWWj0pDuqrsVuDEgD7DugWYPAxjjL93ixuwgkdW2qxnOauZjZL3K/GkUnjyZr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEA9cE6h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEA9cE6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771193656; x=1802729656;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Bz7hPd7eB90QTDgYfTWY6TJDBFwlgMTuwuwDz0QOOBA=;
  b=aEA9cE6hboZwogOtT+MEjiN4liG2dDiu8fxX6uhBwEtPtPafw6cSfeui
   JUaRbPdBLEO7TB0vDVSoVsJzMxc9kNubGy23Mb3Y1qpJUxU1Yh+4l2/iZ
   CGuXTJq1o8t3F1LEr2MtZTep2Lho5RouCFTlCAxY2Ka+KtlQxk4m7CZnR
   d2vxBUBdYYbpwScZDf2vJu7596/IWMiExzmKiWeAPAHMKPnHwSrF5TajU
   D2roXGRyCrq0UwFgapPZHs4gtSSDTVGRqB/g0Y4R66qraviP2/g3D0ql/
   MBcAFbD2qvjzvvz/ArA3X0/dAoE5VNQxOhNKCGCvQK0pE/B3vz3iLPk9H
   Q==;
X-CSE-ConnectionGUID: Ah7kUgyeRXS38j7/IFbZOg==
X-CSE-MsgGUID: lDkdNn1/RSGzVb4M3ksPBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83010287"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="83010287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 14:14:15 -0800
X-CSE-ConnectionGUID: Dl57f3F4QEWbhsgNa+GKuw==
X-CSE-MsgGUID: g7EBKXDVSoWBhk7kAlP5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="236449062"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2026 14:14:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrkNZ-000000002Fh-3dhQ;
	Sun, 15 Feb 2026 22:14:13 +0000
Date: Sun, 15 Feb 2026 23:13:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 tools/testing/selftests/../../../usr/include/asm/bitsperlong.h:10:9: warning:
 '__BITS_PER_LONG' macro redefined
Message-ID: <202602152353.UkHZ2pmb-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Bj=C3=B6rn T=C3=B6pel" <bjorn@rivosinc.com>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: 710fbca820c721cdd60fa8c5bbe9deb4c0788aae libbpf: Add missing per-ar=
ch include path
date:   1 year, 4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 4 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0215/202602152353.UkHZ2pmb-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260215/202602152353.UkHZ2pmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602152353.UkHZ2pmb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from nat6to4.bpf.c:27:
   In file included from tools/testing/selftests/../../../usr/include/linux=
/bpf.h:11:
   In file included from tools/testing/selftests/../../../usr/include/linux=
/types.h:5:
   In file included from tools/testing/selftests/../../../usr/include/asm/t=
ypes.h:1:
   In file included from tools/testing/selftests/../../../usr/include/asm-g=
eneric/types.h:7:
   In file included from tools/testing/selftests/../../../usr/include/asm-g=
eneric/int-ll64.h:12:
>> tools/testing/selftests/../../../usr/include/asm/bitsperlong.h:10:9: war=
ning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
      10 | #define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
         |         ^
   <command line>:2:9: note: previous definition is here
       2 | #define __BITS_PER_LONG 64
         |         ^
   1 warning generated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
