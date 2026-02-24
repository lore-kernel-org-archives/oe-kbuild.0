Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB57374183
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936906; cv=none; b=k0MA9DYA4+EsaAu+BzYd3uGvJnerSo9zktYLmz+AyAHvnEE+R7wWdYro19WnxLYlOyYDHjYqyW5nv6bfB+kgHRXERuvsQSPjiOKsa+bUHlOBY4mMSB2fSVQfD9v8p+00kFZOvGBr4nnX46APoF2yJ/xEeph5AwG+quRWBa6wEPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936906; c=relaxed/simple;
	bh=ZxR1fw4yeuWPSF4q9misD/TCzcG5GTGT2PK/MKctBHA=;
	h=Date:From:To:Subject:Message-ID; b=Q2yYCsSQtMUbsFKHMO4b9CKF33iYfmJgNdpPI445otxuGiVg87N+KZ5nBuzh5HbJ1JFzu7smz95jLGEacHSUeHW1rxz4V+XIX1pFX36cq3YtS2kGsqJWq9aWnsD1w92JcY1Dx9UWMFLN9q0LdKIXAZn7b7uzl17/+56er4nYxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2qRgb2c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2qRgb2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936905; x=1803472905;
  h=date:from:to:subject:message-id;
  bh=ZxR1fw4yeuWPSF4q9misD/TCzcG5GTGT2PK/MKctBHA=;
  b=k2qRgb2cA6nnX4cu5+ghzEmRxO+a72ryrjtz6RVbbZ2MaernMpgiOF/i
   C7Kr7Tg+bUapTHusfJJYpfNmfo2wjDQeJz73/KCU61Nx3Me4QjYu03opl
   ll+mONsp6bpC+msdmKSB41v27//k2f2zJ+XjjXO05HhCNgv8Y9AYGxFle
   E6+6d2sZkG0n6/Ai98CbnZ7Q266bcpeJjJLbpWLOu4iCS+Z38h43ewXBn
   dzBplP1j2CgAbccIVUXWVoQIEj3XolkqjZbD+S2Md/AWNotgEJkdd2p4t
   d2RmAjqVgF7g0MINuFBu/J+nrzLF/Qu24RXjRaTmfVdC/jacYaF+zivei
   Q==;
X-CSE-ConnectionGUID: 8XhtN3lETnKssBUM9/FMcw==
X-CSE-MsgGUID: 1NHj/VQvSG+wkZURTiBVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76811076"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76811076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:41:44 -0800
X-CSE-ConnectionGUID: sPnCGxqAQiCX2e8xwN1L2w==
X-CSE-MsgGUID: /CDZkIHRQpyJas7Mx79e6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215910724"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 24 Feb 2026 04:41:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurjR-000000005Hx-1L7y
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:41:41 +0000
Date: Tue, 24 Feb 2026 13:40:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 692/733] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602241316.zOkXY1BX-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: debfc1a43245e448d73157c5522f6296bd987eb4 [692/733] no abit change
:::::: branch date: 3 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241316.zOkXY1BX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#3941: FILE: include/uapi/linux/coda.h:122:
+typedef void * caddr_t;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#4145: FILE: include/uapi/linux/comedi.h:646:
+} __uapi_arch_align;;

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6512: FILE: include/uapi/linux/mptcp.h:139:
+	__u16 :16;				 /* sizeof(mptcp_full_info) needs to be padded to
+						 * 64 bits, but the mptcp_info member on m68k is

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#8090: FILE: include/uapi/linux/netfilter_ipv6/ip6_tables.h:265:
+} __uapi_arch_align;;

WARNING:SPACING: space prohibited before semicolon
#8981: FILE: include/uapi/linux/rkisp1-config.h:932:
+} ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
