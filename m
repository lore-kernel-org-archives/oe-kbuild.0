Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BBB1799F
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Sep 2026 04:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789879091; cv=none; b=lrkAVqkjpj7+G2ouefQBcUnknBtnQSA+vP3C5e+3D5njNY16XlX2TR/TjcngxosEMMnkoGPbCSBuy9H2HuYSMGaIoJzJ+J0EkNF/h/q1laJNcZ5UW8nhRz6dK05wn2davWB8PXAtAhfNyjovnXupZVx5bTB4tK0GJpBb84NdLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789879091; c=relaxed/simple;
	bh=KfvaZiScBwDihDOHgMaIpTCAcVOvrR54A2KBGJZKAE8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UgoRXa6lMbPZsT9/A5RnnmRMoVoZMAa8e58QXsqSXpupsDwXEjSAyA8O20/wuGofvGfxwOjT396h19NXCYP1aRdpdaJ4tRUCT79guQyoGFMSP5u/RH1AN8A48QlB2arnWe8xWniGdydP41KiOFOewdPh32xyvbMh7qi6FFMqzq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTY7ksdA; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTY7ksdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789879088; x=1821415088;
  h=date:from:to:cc:subject:message-id;
  bh=KfvaZiScBwDihDOHgMaIpTCAcVOvrR54A2KBGJZKAE8=;
  b=gTY7ksdAQRY7HT34IGittLSL37LCGiXbQtKdw1zYNEZ/y8c1JvUMSND2
   eSXMpIapWFemxsM0/Km8lRCJHBsYSJY316qGhHL16Mdu7cLopmM0jzj7u
   qS/UJNDoNUjxmQYven4SO372aliwREVquSzxtTvq+LKGSCgLQDllnQCBA
   YmBwja9WykeZHryj5rB8ljPsJ5N72ctXbOrf7kAIWea2yAFOdzLIIFuXR
   1TboYSZzPeffspx8mqYeXoYvpjji7jBsy/8mhLELCNI/OIe7H3wR3B8oc
   47OfTfApS8WH6ZCw14oHStw9wtob/m4JBBEkUvOSfIrhfmudXtC7YTzwX
   w==;
X-CSE-ConnectionGUID: Wjw3VqpjQj6y6F9zN88pYA==
X-CSE-MsgGUID: gzGivIJyTc+JvsI+85Zn6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="897536"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="897536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 21:38:07 -0700
X-CSE-ConnectionGUID: VPOGpSjHTE6tFpD5bkASrg==
X-CSE-MsgGUID: 3ExYnF/0QIqG/2tHfjuPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271655414"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2026 21:38:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x89JU-00000000Br9-0C5V;
	Sun, 20 Sep 2026 04:38:04 +0000
Date: Sun, 20 Sep 2026 12:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/raid6/arm/recov_neon_inner.c:50:9: sparse: sparse:
 Trying to use reserved word 'while' as identifier
Message-ID: <202609201223.5TF643uc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/raid6/arm/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 3626738bc7147d52cb49f3994a9846aa2d34810a raid6: move to lib/raid/
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r1301-20260920 (https://download.01.org/0day-ci/archive/20260920/202609201223.5TF643uc-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201223.5TF643uc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3626738bc714 ("raid6: move to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609201223.5TF643uc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/raid6/arm/recov_neon_inner.c: note: in included file:
   /opt/cross/clang-2078da43e2/lib/clang/21/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/raid6/arm/recov_neon_inner.c: note: in included file:
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: got *
   lib/raid/raid6/arm/recov_neon_inner.c:28:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/recov_neon_inner.c:28:50: sparse: sparse: got *
   lib/raid/raid6/arm/recov_neon_inner.c:33:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:33:20: sparse: sparse: got pm1
   lib/raid/raid6/arm/recov_neon_inner.c:34:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:34:20: sparse: sparse: got qm0
   lib/raid/raid6/arm/recov_neon_inner.c:35:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:35:20: sparse: sparse: got qm1
   lib/raid/raid6/arm/recov_neon_inner.c:36:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:36:20: sparse: sparse: got x0f
>> lib/raid/raid6/arm/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier
>> lib/raid/raid6/arm/recov_neon_inner.c:50:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid/raid6/arm/recov_neon_inner.c:51:28: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/arm/recov_neon_inner.c:51:28: sparse: sparse: got vx
   lib/raid/raid6/arm/recov_neon_inner.c:76:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/recov_neon_inner.c:76:1: sparse: sparse: got }
   lib/raid/raid6/arm/recov_neon_inner.c:82:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:82:20: sparse: sparse: got qm1
   lib/raid/raid6/arm/recov_neon_inner.c:83:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:83:20: sparse: sparse: got x0f
   lib/raid/raid6/arm/recov_neon_inner.c:92:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/raid6/arm/recov_neon_inner.c:92:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid/raid6/arm/recov_neon_inner.c:93:28: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/arm/recov_neon_inner.c:93:28: sparse: sparse: got vx
   lib/raid/raid6/arm/recov_neon_inner.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/recov_neon_inner.c:111:1: sparse: sparse: got }
   lib/raid/raid6/arm/recov_neon_inner.c:53:17: sparse: sparse: undefined identifier 'px'
   lib/raid/raid6/arm/recov_neon_inner.c:53:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:54:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:54:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:56:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:56:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:57:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:57:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:58:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:58:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:59:17: sparse: sparse: undefined identifier 'qx'
   lib/raid/raid6/arm/recov_neon_inner.c:59:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:61:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:61:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:62:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:62:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:63:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:63:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:64:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:64:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:65:17: sparse: sparse: undefined identifier 'db'
   lib/raid/raid6/arm/recov_neon_inner.c:65:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:67:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:68:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:71:17: sparse: sparse: undefined identifier 'p'
   lib/raid/raid6/arm/recov_neon_inner.c:72:17: sparse: sparse: undefined identifier 'q'
   lib/raid/raid6/arm/recov_neon_inner.c:73:17: sparse: sparse: undefined identifier 'dp'
   lib/raid/raid6/arm/recov_neon_inner.c:74:17: sparse: sparse: undefined identifier 'dq'
   lib/raid/raid6/arm/recov_neon_inner.c:95:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:95:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:97:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:97:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:98:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:98:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:99:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:99:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:100:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:100:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:101:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:101:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:103:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:104:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:107:17: sparse: sparse: undefined identifier 'p'
   lib/raid/raid6/arm/recov_neon_inner.c:108:17: sparse: sparse: undefined identifier 'q'
   lib/raid/raid6/arm/recov_neon_inner.c:109:17: sparse: sparse: undefined identifier 'dq'

vim +/while +50 lib/raid/raid6/arm/recov_neon_inner.c

6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  27  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  28  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  29  			      uint8_t *dq, const uint8_t *pbmul,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  30  			      const uint8_t *qmul)
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  31  {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  32  	uint8x16_t pm0 = vld1q_u8(pbmul);
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
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @50  	while (bytes) {
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

:::::: The code at line 50 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
