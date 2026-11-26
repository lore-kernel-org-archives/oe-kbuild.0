Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733611;
	b=UGw2FKt/Zx6TyPGScKdryjmoQRFXbwb/r86ES/5iRrbDFGv9UZ5OedBBl0cqaoRfiO3A
	 suZ185I1leoYN3jiXK4vrhkSyHCjQxXwcACpU2t35128kdkgYSemN3O3gafUy+UuGXSnH
	 J1beLeQI7RLzoQSYS2vus8oCy1IxaQMDVOCbDuonRAsPYS892vXx4xQ+mrHcbxMBBqYQl
	 4If4U6bloVW2hgKXLuI0SNVyLnwt5W1k+cVT6TqE76w+kR6FUY/J53U5S6dcNpcPp5HTN
	 ew1qFrZ6S7IZzXRv6vB+qOsy3hO9m2W1HqfDbxH9LqTGX2KRxNa+sDGghQz2dEkGfbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733611;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LJITCeCG4EPReCbi7cRNqYgsyeAzg6xAom/TbZQkcAY=;
	b=hTF1/E5IbO0r/mLCWRrqr+t0TLMzEJzDHmzKBArlrGPsJLXQwwMJM93FVIW3LqIvBF51
	 vDLnxdhiFkr0W7eKINwWVX+/NHSvjYlikGixXeWKXNX2DGwHe/St6iCruI6V8HCaUt8sl
	 G9Bm8L4jIe6OmlJlHaNr9fMfD+Kc9t0vxni/3eg/lv2O/18hDrGWdrdcthbeYKtM+dTHZ
	 5iHPcXrSaTyCzENc31y0jkoeq66E5MiuB7a/s0mYafqJfgt84ZipaPpTfnDkXNEfhfOMG
	 1tCSrKQ55niE0qtreqRmBIbAU7BeYD2iml02w0YoS6L3cBWRlfi3k+zc4NfArODL65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FGFnuUF2;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023F2606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FGFnuUF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795733610; x=1827269610;
  h=date:from:to:cc:subject:message-id;
  bh=c/FvorkE4ZW6Ts7avAOSXuTA49cmzGC75K1ATilEeuA=;
  b=FGFnuUF204UqqR2sVpPUgWTPKnu4q89TFKtqIzzkyRHJnz9QaGmzZFRp
   +91RA9PJ1y6gxiMCK6CZ171L68mF6KR9yChj+ssGpUcdcEkMTCYlfIiGv
   Q641n54Y2F5KTrJc6Nmf8ZvkpnXBdqGKugsUkOjmd/k/fBwT5t1pvih51
   ZcIhcKxmoowoHgzAuMMX2NeXCYdO88XxqATbZE69yZhUtR+9dnffsyPbV
   LFm5eS0vJBwi56W1poR6o1ZQ5Fv4b1aKvUjNWDEZntgf4IlktUBarchSK
   H231SmNF2EgEAVGho1R56PTeN1UtgXY78ShDj2O0+HeTH6Z0HIRSuxRED
   Q==;
X-CSE-ConnectionGUID: bEA/dAxhRNK4m31DBIoS2g==
X-CSE-MsgGUID: j/IYewafR5O45/vWr/q7Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4529180"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4529180"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 14:53:29 -0800
X-CSE-ConnectionGUID: WJEhrQ1gQF2Cuz06R06d/Q==
X-CSE-MsgGUID: zk5pqFFVSqy0aN2O2LL/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12415988"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2026 14:53:28 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWiLA-000000000D8-07Ke;
	Thu, 26 Nov 2026 22:53:20 +0000
Date: Thu, 26 Nov 2026 23:52:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:clang-ssp-hack-fix 1/2]
 arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: Syntax error in unary
 expression
Message-ID: <20261126235028.cHE8SuRR-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: Syntax error in unary expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git clang-ssp-hack-fix
head:   adbdb2a86a097c720f2dfc9f6565706edb6c26e7
commit: 67555248664d44c037a386ec53fd8b4247cfd68d [1/2] compiler.h: Use the symbol's own pointer type in __ADDRESSABLE()
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
config: parisc-randconfig-r2303-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126235028.cHE8SuRR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126235028.cHE8SuRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126235028.cHE8SuRR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:78:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:78:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:79:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:79:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:80:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:80:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:81:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:81:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:82:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:82:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:83:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:83:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:84:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:84:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:85:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:85:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:86:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:86:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:87:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:87:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:88:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:88:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:89:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:89:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:90:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:90:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:91:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:91:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:92:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:92:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:93:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:93:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:118:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:118:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:41:12: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:41:12: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: got $
>> arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:42:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:47:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:47:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:48:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:48:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:49:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:49:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:50:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:50:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:51:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:51:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:52:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:52:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:53:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:53:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:54:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:54:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:55:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:55:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:56:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:56:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:57:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:57:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:58:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:58:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:59:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:59:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:60:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:60:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:61:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:61:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:62:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:62:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:63:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:63:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:64:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:64:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:65:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:65:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:66:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:66:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:67:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:67:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:68:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:68:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:69:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:69:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: Syntax error in unary expression
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:78:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:78:1: sparse: sparse: Expected ) after typeof

vim +42 arch/parisc/kernel/parisc_ksyms.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  38  
a8f44e3889b686 Helge Deller   2007-01-28  39  #ifndef CONFIG_64BIT
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  /* Needed so insmod can set dp value */
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  extern int $global$;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @42  EXPORT_SYMBOL($global$);
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  

:::::: The code at line 42 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
