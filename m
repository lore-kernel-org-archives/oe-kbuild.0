Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641C330B0B
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 02:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504055; cv=none; b=N1l+WzPXgXqV4nO13EXwinXsxQoKMvNyWwzSsc1E4R9H1qGeiF9btDXbDVeRMBKyNlBnH06Dj5mNNGc4Q+WPufKw6y1t2XyJErJcE8dPYDbrlb0UXqv+QwEQwqo/ug8tVj7OLLYks+JOac4BHiHPdKVW3nUW3Bpu/nx2W1Nofnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504055; c=relaxed/simple;
	bh=BL+yod6MDirLV75WkxQ5ib37uR6ANV2yI3nCQBKeQkM=;
	h=Date:From:To:Subject:Message-ID; b=hN8K56GUl6dfGr75WlcmmkqNYyV0aupW2P/dD5oGycdJFSBbG996XCCOGLcLOpeNBkXOpJjH+bRkpesAafvrHF74y04o6PWyKEvYUKGkOUPotGyRI782Givav00KFczV/h4mTdgKi/c8BEs/eGsE7w0zgKnP7HSR7yP7Kk7oZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mguyLQ3X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mguyLQ3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772504053; x=1804040053;
  h=date:from:to:subject:message-id;
  bh=BL+yod6MDirLV75WkxQ5ib37uR6ANV2yI3nCQBKeQkM=;
  b=mguyLQ3X4iYnzWqNWgI7w50eeqJzbhzdGVibOiibbmuz4byWKY44TGsY
   ecYorGQjDWrMF68NKj5rmYIl9eKviqIWQkX0fzFDaX4TLWTzwIuMW9GWN
   Ej8oCQ4FdEx9a/mLSNQCl0gM3+1HBOd3oLQnFBdCJLwGcZSXGuB5Ub2y3
   VXhlgMhMlZLqKXjF1MDIWkj97GkR5QNe0AENMWuLqPHOHURYatPD/o3eh
   r8IrFQa9tWkm3110qYhcPJooV/R3lC4Curw9hq4nDFD1QFkRuXiVVydpX
   PVrjpYLlM+edANCyLqjbsMpVwnV0X+I7+kutrKcld0IQgIwqc4swGBYDI
   w==;
X-CSE-ConnectionGUID: eDv+BUHEQkW9DwvxtVgs6g==
X-CSE-MsgGUID: h6K1lVi1TQWn5A/ugVO8EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72726943"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="72726943"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:14:12 -0800
X-CSE-ConnectionGUID: si1RZp30R5m8Y2HwtzfbYQ==
X-CSE-MsgGUID: MlcnNDhmRZGQN8NT8Icy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="216259958"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2026 18:14:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFGz-000000001Li-2Aax
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 02:14:09 +0000
Date: Tue, 03 Mar 2026 03:13:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 78/103] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603030327.PwK95qi2-lkp@intel.com>
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
commit: 7a491a4a49d0ead8b1430f50957b90e7273c0d6f [78/103] x86: move the XOR code to lib/raid/
:::::: branch date: 40 minutes ago
:::::: commit date: 40 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030327.PwK95qi2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#845: FILE: lib/raid/xor/x86/xor-sse.c:49:
+xor_sse_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#846: FILE: lib/raid/xor/x86/xor-sse.c:50:
+	  const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#897: FILE: lib/raid/xor/x86/xor-sse.c:101:
+xor_sse_2_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#898: FILE: lib/raid/xor/x86/xor-sse.c:102:
+	       const unsigned long * __restrict p2)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#932: FILE: lib/raid/xor/x86/xor-sse.c:136:
+xor_sse_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#933: FILE: lib/raid/xor/x86/xor-sse.c:137:
+	  const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#934: FILE: lib/raid/xor/x86/xor-sse.c:138:
+	  const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#992: FILE: lib/raid/xor/x86/xor-sse.c:196:
+xor_sse_3_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#993: FILE: lib/raid/xor/x86/xor-sse.c:197:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#994: FILE: lib/raid/xor/x86/xor-sse.c:198:
+	       const unsigned long * __restrict p3)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1030: FILE: lib/raid/xor/x86/xor-sse.c:234:
+xor_sse_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1031: FILE: lib/raid/xor/x86/xor-sse.c:235:
+	  const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1032: FILE: lib/raid/xor/x86/xor-sse.c:236:
+	  const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1033: FILE: lib/raid/xor/x86/xor-sse.c:237:
+	  const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1098: FILE: lib/raid/xor/x86/xor-sse.c:302:
+xor_sse_4_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1099: FILE: lib/raid/xor/x86/xor-sse.c:303:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1100: FILE: lib/raid/xor/x86/xor-sse.c:304:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1101: FILE: lib/raid/xor/x86/xor-sse.c:305:
+	       const unsigned long * __restrict p4)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1139: FILE: lib/raid/xor/x86/xor-sse.c:343:
+xor_sse_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1140: FILE: lib/raid/xor/x86/xor-sse.c:344:
+	  const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1141: FILE: lib/raid/xor/x86/xor-sse.c:345:
+	  const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1142: FILE: lib/raid/xor/x86/xor-sse.c:346:
+	  const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1143: FILE: lib/raid/xor/x86/xor-sse.c:347:
+	  const unsigned long * __restrict p5)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1215: FILE: lib/raid/xor/x86/xor-sse.c:419:
+xor_sse_5_pf64(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1216: FILE: lib/raid/xor/x86/xor-sse.c:420:
+	       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1217: FILE: lib/raid/xor/x86/xor-sse.c:421:
+	       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1218: FILE: lib/raid/xor/x86/xor-sse.c:422:
+	       const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1219: FILE: lib/raid/xor/x86/xor-sse.c:423:
+	       const unsigned long * __restrict p5)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
