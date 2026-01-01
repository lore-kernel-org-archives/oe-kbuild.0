Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54CD42AA9
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767276883; cv=none; b=uvrC0X5W0n9Fctd/8ZivWDxrAP+TGh/lK33X+YIOfYO6BF/mNMJ6fNXa2FuXE1RBbbXZ2zN+zW3Dh3sxBoHjyUCMsg5b8EfavDiWIgBLkfBI2eI2p153pRnmSlNztMlJem5abo2xVbCXl/qhUaleTyaWAr4o1jdRtRkI/w3N+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767276883; c=relaxed/simple;
	bh=N5UznQsujhA44It+820uqgUf8KcmW+TlUm+qZz8NXCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eFNU+s98tcWaG0nWntI3ZFIcpAcUO9rT0y8OT0pI8rG7RQLtRW0XsZoYewSqupRyP2N2ffnxCohgNfT0ic5/uIiZiQ1Lg3DXLjHt436jk/SosK61kn2uqK9O4Mcv/BQb7K6Qjr1G9NEF8lVb/vOx02x4xA35JV+eDzo7xKH11kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjWnZO59; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjWnZO59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767276881; x=1798812881;
  h=date:from:to:cc:subject:message-id;
  bh=N5UznQsujhA44It+820uqgUf8KcmW+TlUm+qZz8NXCM=;
  b=CjWnZO592wy53U+iR/ikrgvc70K3zjS3K8aaQV8XvIMTU8mMUrBegtlv
   q8YgGgUTmVo12Mp4yKFKDf1evyJUdu2i+k9OJ+oUDq+nUt7g9c1KzBhf8
   tDwbQi8O4FnEGXEKoldghG4rVpRct0eXLMQWUSfajIb/A1quOZZx7Qu1y
   /KDUUIvNwVC1lYyM3Sa2hGAYMzoRSkramNilrIfH9Htbc32gMELGVja/b
   DbKPG6yfuI9KR0hsyEmwhiOtTqxRDAdvnpKDwFjKiqcZmH9o7sFgqwUCe
   sCPkzcmyDIQCW7qywLKVZSxVJSCvE9wrvlSp/z0qQQjDmZSq88tb1GHKP
   Q==;
X-CSE-ConnectionGUID: KXpbBpUgQQacEGW/gYLw5w==
X-CSE-MsgGUID: +HJNjGErQ/GXOO71oGFgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67819791"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67819791"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 06:14:40 -0800
X-CSE-ConnectionGUID: k5QjwQ/qTaCz9QcnEhE0iA==
X-CSE-MsgGUID: NOx6cWOxRru/Mt1llt8hIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="200858884"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2026 06:14:40 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbJRl-000000001sz-1TND;
	Thu, 01 Jan 2026 14:14:37 +0000
Date: Thu, 01 Jan 2026 22:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: shrink_lruvec+0x735: sibling
 call from callable instruction with modified stack frame
Message-ID: <202601012248.tm16OHmh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 3724062ca2b1364f02cf44dbea1a552227844ad1 objtool: Ignore dangling jump table entries
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: x86_64-buildonly-randconfig-001-20260101 (https://download.01.org/0day-ci/archive/20260101/202601012248.tm16OHmh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601012248.tm16OHmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601012248.tm16OHmh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp1+0xd: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp2+0x10: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp4+0x10: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp8+0xf: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp1+0x10: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp2+0x10: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp4+0x10: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp8+0xf: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_switch+0x51: call to write_comp_data.llvm.11598902363920220389() with UACCESS enabled
>> vmlinux.o: warning: objtool: shrink_lruvec+0x735: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: .text.pci_epf_test_print_rate: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
