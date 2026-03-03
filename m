Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0A54774
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504056; cv=none; b=U5wToVVSKniozZNZqyd6szcmyCKt2qxcPIH69FgV4kJambGNrqdezKrjD7UvNb+6GEmjpQXF4mUtY8/ml0RBvp5IrNAZVUxhpsKJ8MTvmsUkl2lolIYr5E3jarqay4zvkDC3fmmSyEay9wcH978JQ3WfwaJr0+FymOe7Z6DZlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504056; c=relaxed/simple;
	bh=mu8azvQ8m4/HKL7k5oejvcXUiLtOiYeJuDKQaVzQ3oA=;
	h=Date:From:To:Subject:Message-ID; b=m8CEo6/S5uOJagdgm51pvxr5+UHfBFQIaVE88xdY/iB61dMov6OTpnbhtRih+YHE/lzBlb6qZnM1M6SOtyRj2Wx+Zq9aRgMXP0W9M106tduqwGilQG58g2HgABZ6Pp4UHH3182LuZHoIMqxz7IPH53D6ejs+AvqQtkf+CADTWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d52exoqG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d52exoqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772504054; x=1804040054;
  h=date:from:to:subject:message-id;
  bh=mu8azvQ8m4/HKL7k5oejvcXUiLtOiYeJuDKQaVzQ3oA=;
  b=d52exoqGUGHh/PczMy839L1rVwDW3uCI02HNXReNSVxLvWMPyJLnEM3o
   j/7TKG1R+bvwFeopCZLX9SYtKP+hN5Qj6bBjzUdd3qBy9Sg5c3NkXc+4T
   TrpwWXABwmlOmqo9blMwb3UuXw5GGI9sOqQrOhRJ3BREKI+cWuiRHFznC
   JyYhB4mJX3yXPD0exVa+nXfVC5i7Ui7n8IdhtclNYwNS4WiRcPg8D7pmB
   b2c8tna6vMdJsrRuDKzL1gin19/EUZmdlsPaXc/Fnr0M9EFx3aPPYLJaH
   DNw4C4lmupywMrIpDO5L+Qp+6elP5NTWqT2siZAiKo/BNjRlILw78DEpx
   g==;
X-CSE-ConnectionGUID: Q48//PZVTrCjfpJiZ/TQcA==
X-CSE-MsgGUID: Iy16328eTX659UeuA1JFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83866215"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="83866215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:14:12 -0800
X-CSE-ConnectionGUID: /NM5qBqzSwiCxqcGp426uQ==
X-CSE-MsgGUID: 4CIl29I1TlKrenmH4wi4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="215798013"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 18:14:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFGz-000000001Lf-20Ee
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 02:14:09 +0000
Date: Tue, 03 Mar 2026 03:13:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 69/103] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603030329.1gLs4ilN-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   edf9ae1454f27f84c0dd4274c9a0519d2917ff4d
commit: bb81582fb1dc68eac375adccb6505c05a9cded39 [69/103] xor: move generic implementations out of asm-generic/xor.h
:::::: branch date: 39 minutes ago
:::::: commit date: 39 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030329.1gLs4ilN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#838: FILE: lib/raid/xor/xor-32regs-prefetch.c:7:
+xor_32regs_p_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#839: FILE: lib/raid/xor/xor-32regs-prefetch.c:8:
+	       const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#884: FILE: lib/raid/xor/xor-32regs-prefetch.c:53:
+xor_32regs_p_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#885: FILE: lib/raid/xor/xor-32regs-prefetch.c:54:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#886: FILE: lib/raid/xor/xor-32regs-prefetch.c:55:
+	       const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#942: FILE: lib/raid/xor/xor-32regs-prefetch.c:111:
+xor_32regs_p_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#943: FILE: lib/raid/xor/xor-32regs-prefetch.c:112:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#944: FILE: lib/raid/xor/xor-32regs-prefetch.c:113:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#945: FILE: lib/raid/xor/xor-32regs-prefetch.c:114:
+	       const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1012: FILE: lib/raid/xor/xor-32regs-prefetch.c:181:
+xor_32regs_p_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1013: FILE: lib/raid/xor/xor-32regs-prefetch.c:182:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1014: FILE: lib/raid/xor/xor-32regs-prefetch.c:183:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1015: FILE: lib/raid/xor/xor-32regs-prefetch.c:184:
+	       const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1016: FILE: lib/raid/xor/xor-32regs-prefetch.c:185:
+	       const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1111: FILE: lib/raid/xor/xor-32regs.c:6:
+xor_32regs_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1112: FILE: lib/raid/xor/xor-32regs.c:7:
+	     const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1148: FILE: lib/raid/xor/xor-32regs.c:43:
+xor_32regs_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1149: FILE: lib/raid/xor/xor-32regs.c:44:
+	     const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1150: FILE: lib/raid/xor/xor-32regs.c:45:
+	     const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1195: FILE: lib/raid/xor/xor-32regs.c:90:
+xor_32regs_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1196: FILE: lib/raid/xor/xor-32regs.c:91:
+	     const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1197: FILE: lib/raid/xor/xor-32regs.c:92:
+	     const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1198: FILE: lib/raid/xor/xor-32regs.c:93:
+	     const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1252: FILE: lib/raid/xor/xor-32regs.c:147:
+xor_32regs_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1253: FILE: lib/raid/xor/xor-32regs.c:148:
+	     const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1254: FILE: lib/raid/xor/xor-32regs.c:149:
+	     const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1255: FILE: lib/raid/xor/xor-32regs.c:150:
+	     const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1256: FILE: lib/raid/xor/xor-32regs.c:151:
+	     const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1337: FILE: lib/raid/xor/xor-8regs-prefetch.c:7:
+xor_8regs_p_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1338: FILE: lib/raid/xor/xor-8regs-prefetch.c:8:
+	      const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1364: FILE: lib/raid/xor/xor-8regs-prefetch.c:34:
+xor_8regs_p_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1365: FILE: lib/raid/xor/xor-8regs-prefetch.c:35:
+	      const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1366: FILE: lib/raid/xor/xor-8regs-prefetch.c:36:
+	      const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1395: FILE: lib/raid/xor/xor-8regs-prefetch.c:65:
+xor_8regs_p_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1396: FILE: lib/raid/xor/xor-8regs-prefetch.c:66:
+	      const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1397: FILE: lib/raid/xor/xor-8regs-prefetch.c:67:
+	      const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1398: FILE: lib/raid/xor/xor-8regs-prefetch.c:68:
+	      const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1431: FILE: lib/raid/xor/xor-8regs-prefetch.c:101:
+xor_8regs_p_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1432: FILE: lib/raid/xor/xor-8regs-prefetch.c:102:
+	      const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1433: FILE: lib/raid/xor/xor-8regs-prefetch.c:103:
+	      const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1434: FILE: lib/raid/xor/xor-8regs-prefetch.c:104:
+	      const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1435: FILE: lib/raid/xor/xor-8regs-prefetch.c:105:
+	      const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1488: FILE: lib/raid/xor/xor-8regs.c:6:
+xor_8regs_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1489: FILE: lib/raid/xor/xor-8regs.c:7:
+	    const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1508: FILE: lib/raid/xor/xor-8regs.c:26:
+xor_8regs_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1509: FILE: lib/raid/xor/xor-8regs.c:27:
+	    const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1510: FILE: lib/raid/xor/xor-8regs.c:28:
+	    const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1530: FILE: lib/raid/xor/xor-8regs.c:48:
+xor_8regs_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1531: FILE: lib/raid/xor/xor-8regs.c:49:
+	    const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1532: FILE: lib/raid/xor/xor-8regs.c:50:
+	    const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1533: FILE: lib/raid/xor/xor-8regs.c:51:
+	    const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1554: FILE: lib/raid/xor/xor-8regs.c:72:
+xor_8regs_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1555: FILE: lib/raid/xor/xor-8regs.c:73:
+	    const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1556: FILE: lib/raid/xor/xor-8regs.c:74:
+	    const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1557: FILE: lib/raid/xor/xor-8regs.c:75:
+	    const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1558: FILE: lib/raid/xor/xor-8regs.c:76:
+	    const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
