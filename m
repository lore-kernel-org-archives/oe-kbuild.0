Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512768;
	b=44Hj3WCPl/+7GV71pCmoBgNNmFN6cBA8B2x9LLkkvFPpYV8vF2WUZPCHftUTGPWQpVLh
	 f0WtFEuFUipTnaqmmrcgyaDSyjoFPC1hnCYv9ABUpaYVHsMzSwNBmpo4cgxWS+1xww+sq
	 ujoyKNWG9p7PiP3UwsrEKhPBIOTD7e0fbx+U7tve+UhO4lwrCwOpH3qFCYTfpPXSSgwrU
	 mpMBtjIaqsL9sTujJuHiST3QIoOVDj1VTlZXqeByk6XZu5vFSObO/ONhgQnhmUCMPzAAe
	 1RQ/b/h+i41WV5d27rTfN7z3TUnu5tvT6x0WF+wNyGpzX8Go0iQktmyJc3eVPj7+UYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/KROd5tQzN1CQ5f0ye7ndneC8hkWpWOvVtwupaWP8RU=;
	b=nZcXTltez16JM3nPAMiCb53nQZShiAqIOTQciZpa71hFigLHEEWEqDLB6IeRw9hmd/1j
	 BiMpoamYejzejWboXFJxiJSRt1jPvHfFRW2TljyTXYnx/jKvPtIc6n2bD74m4vq692O8M
	 0I7HFlqgG8I+UsW9WwVo5mPLTfVeUR9JP8nSmwem5JdYTcTzN7m/zW7rRpYDT0oA7aK7a
	 hSwmRCDonSG6Y0UR+BVNBuZFkkPcJTWlw6NULBqy8w2fHBN1Yghx2JNajcsUn1yeKQ7sC
	 jBaGxdHwCfx2aZKtIRwo00uImzVpCGf6yEBBGn9G6SbeFpan6EGV+n/ihXLuuuBDaMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnhNsakz;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD0606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 16:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDD0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnhNsakz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792512768; x=1824048768;
  h=date:from:to:cc:subject:message-id;
  bh=afjJh8YYx5QmUuPkvUueANxDUPDj98uUMsKCHZWuJA8=;
  b=QnhNsakzU5t/DEaKjpRlCTJYCLSEV+QgiZsH7bVZ8WK/5JXRVH9NDdlL
   lmJNqhO2oz0CEQMuciaYVb88Rdh+h7Rd4QSBeIi9GTAw+/WmGV2Id2D0l
   53WiwM/VFuCZqcuvLD8NgkcUcU8esczjJqXmGzzak2kSz1robk/HcYywi
   zJtymNAtxkzLrOFe7CwhX9OCNnT9IQa19fpCDtAagpKec+2xuqL9yVrez
   hLaT71jJPYSvDVWYeByfFPlowYBYBxoPAo6LXRBRtXHnNCU4XRp5pv3sJ
   PxJixhI6C7TiZr28hRz8eWQzMnMhH4TM2BL70WoU6UQ+rduNrvwelSTd+
   w==;
X-CSE-ConnectionGUID: ppM7rJasTaK22THxk4KG0g==
X-CSE-MsgGUID: gaHNj+PBQSSZQ+QtgFl8lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1248146"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1248146"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 09:12:48 -0700
X-CSE-ConnectionGUID: OMIraAjhQoGxTDLKcgybLg==
X-CSE-MsgGUID: hHFIl8vlRhKnTjb/0ArNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3253346"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Oct 2026 09:12:45 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJCSB-000000006Mb-2Wuc;
	Tue, 20 Oct 2026 16:12:43 +0000
Date: Tue, 20 Oct 2026 18:11:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/raid/raid6/arm/recov_neon_inner.c:32
 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
Message-ID: <202610201810.9dlLCRlJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f47d223627f80cb7a1eb14c585fe6cb35de5e984
commit: 3626738bc7147d52cb49f3994a9846aa2d34810a raid6: move to lib/raid/
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r2202-20261019 (https://download.01.org/0day-ci/archive/20261020/202610201810.9dlLCRlJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3626738bc714 ("raid6: move to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610201810.9dlLCRlJ-lkp@intel.com/

New smatch warnings:
lib/raid/raid6/arm/recov_neon_inner.c:32 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:81 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'

Old smatch warnings:
lib/raid/raid6/arm/recov_neon_inner.c:33 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:34 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:35 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:36 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:51 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:82 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:83 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:93 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'

vim +/uint8x16_t +32 lib/raid/raid6/arm/recov_neon_inner.c

6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  27  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  28  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  29  			      uint8_t *dq, const uint8_t *pbmul,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  30  			      const uint8_t *qmul)
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  31  {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @32  	uint8x16_t pm0 = vld1q_u8(pbmul);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  33  	uint8x16_t pm1 = vld1q_u8(pbmul + 16);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  34  	uint8x16_t qm0 = vld1q_u8(qmul);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  35  	uint8x16_t qm1 = vld1q_u8(qmul + 16);
1ad3935b39da78 lib/raid6/recov_neon_inner.c Nick Desaulniers 2019-02-25  36  	uint8x16_t x0f = vdupq_n_u8(0x0f);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  37  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  38  	/*
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  39  	 * while ( bytes-- ) {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  40  	 *	uint8_t px, qx, db;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  41  	 *
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  42  	 *	px    = *p ^ *dp;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  43  	 *	qx    = qmul[*q ^ *dq];
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  44  	 *	*dq++ = db = pbmul[px] ^ qx;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  45  	 *	*dp++ = db ^ px;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  46  	 *	p++; q++;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  47  	 * }
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  48  	 */
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  49  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  50  	while (bytes) {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  51  		uint8x16_t vx, vy, px, qx, db;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  52  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  53  		px = veorq_u8(vld1q_u8(p), vld1q_u8(dp));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  54  		vx = veorq_u8(vld1q_u8(q), vld1q_u8(dq));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  55  
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  56  		vy = vshrq_n_u8(vx, 4);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  57  		vx = vqtbl1q_u8(qm0, vandq_u8(vx, x0f));
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  58  		vy = vqtbl1q_u8(qm1, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  59  		qx = veorq_u8(vx, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  60  
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  61  		vy = vshrq_n_u8(px, 4);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  62  		vx = vqtbl1q_u8(pm0, vandq_u8(px, x0f));
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  63  		vy = vqtbl1q_u8(pm1, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  64  		vx = veorq_u8(vx, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  65  		db = veorq_u8(vx, qx);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  66  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  67  		vst1q_u8(dq, db);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  68  		vst1q_u8(dp, veorq_u8(db, px));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  69  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  70  		bytes -= 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  71  		p += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  72  		q += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  73  		dp += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  74  		dq += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  75  	}
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  76  }
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  77  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  78  void __raid6_datap_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dq,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  79  			      const uint8_t *qmul)
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  80  {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @81  	uint8x16_t qm0 = vld1q_u8(qmul);

:::::: The code at line 32 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
