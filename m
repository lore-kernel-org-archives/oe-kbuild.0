Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECD323416
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069239; cv=none; b=aZ0F7mS0wvE7r1ye2/jROEfUTyuBQeiw28cZKCtE5WK7TX9AOnLm4qUim0FRzfLTCJntnknSvSjmp8P88gNmpb7zEOgbuc/9uFBBXOQ5+oESg+8/thM+473ps3huioxN6J2oU1QP17UUrFEdsoPmuhjHEKXSy6vr7Yi/ksa9/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069239; c=relaxed/simple;
	bh=iykGaYfDmIvjJObETu1IVi1QMXiUaZc6X56UwLrLSgs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQp59HMsicezpHCgvrs2qTKcBiMhzPxGkrDvyEtbF5dNlDl4L5/l3/FuNtAGtzLXwk1JZPSKFOPuS383UAM/cO2EfFrkIj1sbU8Bwjy8QcxIND4Rga+H56YP5Z8xqZTq5ml3w/T/ckXlKxRYCunhHkJ//JHI5Jw93zwlOp59RhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKP2+zag; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKP2+zag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069237; x=1794605237;
  h=date:from:to:subject:message-id:mime-version;
  bh=iykGaYfDmIvjJObETu1IVi1QMXiUaZc6X56UwLrLSgs=;
  b=HKP2+zagzI6WWvGyygnRGsvW6fmVPLzo+AGIMx2oLC8t/KjVYSEw+D7J
   dDgYlpZoek9/bdO2Pz6GFISSnsmfgMgVNR/DrdyTOiA0En8vz0NfNNMdc
   Ya6+tjv9OCllS/aQeO+Nz52Uc8x5sifH8SEj9gsixvG7D5k1WlOemSOn6
   YIz/kpjmC+13LRzRH0dX+2T+IV9ZISSFN8oj7Lo7L2KCUO7B5bBJHBsup
   53w6HJ/nbRC7A2U1AdB0X0uO1cyo/bkgHBcsoly3dNjpWy1t7ln4Gd0mc
   8SocpihS1xZp0uBFaVVJo5w/V3VdX3jVVfup8NTYvdq88pGlgr9lBigvK
   Q==;
X-CSE-ConnectionGUID: sM2yw1SnSxmV73HHuYn8Bg==
X-CSE-MsgGUID: tzx0nF0ATya/9uPeJUXShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637453"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: N3wZdb/fQ8GO1hhZTB/NBA==
X-CSE-MsgGUID: NmPXGUAwQoWQqWYkjScXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189244186"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqY-0000000019F-0Pij
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:14 +0000
Date: Thu, 13 Nov 2025 22:26:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 459/867] checkpatch: ERROR:SPACING:
 spaces required around that '?:' (ctx:VxW)
Message-ID: <202511131913.WHw7kOvz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/867] bcachefs: move alloc files to subdir
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131913.WHw7kOvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131913.WHw7kOvz-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#1578: FILE: fs/bcachefs/alloc/check.c:26:
+		return k;
+	} else {

ERROR:SPACING: spaces required around that '?:' (ctx:VxW)
#2299: FILE: fs/bcachefs/alloc/check.c:747:
+	}))?: bch2_check_stripe_to_lru_refs(trans);
 	   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
