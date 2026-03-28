Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA221E7C2E
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774672565; cv=none; b=OlvZmCOmS8kJU2WLdgyw2OoILJFvotviyroP1VgcUcbAomSe0YUxCR7lGrF3rMFzBv10X/ZZP8LHdnCAv0pkEcDT2faitPtubeD0yN8S/8uAoguU609pUbEkN9h2EfWt0NUrd8xFoE6mFslw2YKxIsgM09lZhG958jTM2OPntEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774672565; c=relaxed/simple;
	bh=1mt3VqSYZg54V6v4swGnyVcywYMhhd7+5hj8A76YTYw=;
	h=Date:From:To:Subject:Message-ID; b=WasuapQ5p0EFjcNaRFg3gq/hMtfhbboehR6W3j09GXLR1YmwdmXf7Y9IBl4ilVt2En/5W7XjJLvgSNyEEK+B9H3n5mCstSY3AEJ+dwGmoOL/ZSDPEEKtQa4Y5L56vAcaitoRw35UtaqOzguEcS4jV5JBSEyj8DMyLxKug23t+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCsAMqMx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCsAMqMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774672562; x=1806208562;
  h=date:from:to:subject:message-id;
  bh=1mt3VqSYZg54V6v4swGnyVcywYMhhd7+5hj8A76YTYw=;
  b=bCsAMqMx0UldTaYRdMnlyNpq5Ziz06jcy2ku9//eRdH6dqPMmCx864KF
   Zg+K1ETtkeacp03R2MmPL+H0ml/5OmNQc439sr+UD5LfcC8NZNodUNzut
   8yaQLwzcamSs3yYchNjkQ1oOBMEp4Nk3eBRgaYpiUkC6gyq9Lt2eg12yf
   tzcVYjF1/YNrgatXcs7iAvEZVl94hXjK796qANOj/0WAvr7Opv8Gi9FFp
   B9/LTB3Y15D1TTlhUpz++WSLG5v5uKAMd0RqlBCs6AJ5DI1FU1ZMSUP8H
   n735nA4xkWVHjZWkvWLbgpTLK8iDdoCU6XCSBbJao/0QYHJC3yTKDYnnu
   w==;
X-CSE-ConnectionGUID: SRxaZzo+TSCxs6LDiF2ZzQ==
X-CSE-MsgGUID: tBHzxz4LS22J4BVVHafCJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87218125"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="87218125"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:36:01 -0700
X-CSE-ConnectionGUID: BLx/UcGHQJ2ZC2/r9I0edA==
X-CSE-MsgGUID: Y995wDEVR1q2crcL33obDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="227104166"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2026 21:36:00 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LOw-000000007cb-0Qa9
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:35:58 +0000
Date: Sat, 28 Mar 2026 05:35:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 11/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280547.0TDQqxse-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: 6c616d8190ce5d351ec4f710c8726c7c654d7ac7 [11/33] alpha: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280547.0TDQqxse-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#911: FILE: lib/raid/xor/alpha/xor.c:9:
+xor_alpha_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#912: FILE: lib/raid/xor/alpha/xor.c:10:
+	    const unsigned long * __restrict p2);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#914: FILE: lib/raid/xor/alpha/xor.c:12:
+xor_alpha_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#915: FILE: lib/raid/xor/alpha/xor.c:13:
+	    const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#916: FILE: lib/raid/xor/alpha/xor.c:14:
+	    const unsigned long * __restrict p3);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#918: FILE: lib/raid/xor/alpha/xor.c:16:
+xor_alpha_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#919: FILE: lib/raid/xor/alpha/xor.c:17:
+	    const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#920: FILE: lib/raid/xor/alpha/xor.c:18:
+	    const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#921: FILE: lib/raid/xor/alpha/xor.c:19:
+	    const unsigned long * __restrict p4);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#923: FILE: lib/raid/xor/alpha/xor.c:21:
+xor_alpha_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#924: FILE: lib/raid/xor/alpha/xor.c:22:
+	    const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#925: FILE: lib/raid/xor/alpha/xor.c:23:
+	    const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#926: FILE: lib/raid/xor/alpha/xor.c:24:
+	    const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#927: FILE: lib/raid/xor/alpha/xor.c:25:
+	    const unsigned long * __restrict p5);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#930: FILE: lib/raid/xor/alpha/xor.c:28:
+xor_alpha_prefetch_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#931: FILE: lib/raid/xor/alpha/xor.c:29:
+		     const unsigned long * __restrict p2);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#933: FILE: lib/raid/xor/alpha/xor.c:31:
+xor_alpha_prefetch_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#934: FILE: lib/raid/xor/alpha/xor.c:32:
+		     const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#935: FILE: lib/raid/xor/alpha/xor.c:33:
+		     const unsigned long * __restrict p3);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#937: FILE: lib/raid/xor/alpha/xor.c:35:
+xor_alpha_prefetch_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#938: FILE: lib/raid/xor/alpha/xor.c:36:
+		     const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#939: FILE: lib/raid/xor/alpha/xor.c:37:
+		     const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#940: FILE: lib/raid/xor/alpha/xor.c:38:
+		     const unsigned long * __restrict p4);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#942: FILE: lib/raid/xor/alpha/xor.c:40:
+xor_alpha_prefetch_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#943: FILE: lib/raid/xor/alpha/xor.c:41:
+		     const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#944: FILE: lib/raid/xor/alpha/xor.c:42:
+		     const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#945: FILE: lib/raid/xor/alpha/xor.c:43:
+		     const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#946: FILE: lib/raid/xor/alpha/xor.c:44:
+		     const unsigned long * __restrict p5);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
