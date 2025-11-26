Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778B314D0C
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187109; cv=none; b=vGeLk7gxlx4bAX1h59NPJ5P/ZXVQBVZ748qVzp6wAc3wBTEh1A2Tks+St9J+GkGULsjZb3djrsEZ/qc528trpIY8sj4nqUoUkv9MkZfwkS9MtRbILpmORepDWm65Stc5tuxHjRTf1vz3I84WbjLL2hFbjZsssD9sXGqcvMRFOrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187109; c=relaxed/simple;
	bh=s+ZknJWKUh4xxxEOxvpM7NL5PFXuP/g0+hDFjELXw4w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGFo7ctmKG69Cqevnu7+yRV9m7U7GpRJwLnQ32nE/9DRbQ2BWmHlMn2DlAFTa6YLj6HR48Jbw+8fN4ybLpBiRRlEkvbdReAem/m7TCOA8l2++LT2bXIJUNkXkcP1KQAgTR4MH/wghXhvtxvCONL0X3u4WVDMunzZ5NXjVrnuWVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQXdsC+R; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQXdsC+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187108; x=1795723108;
  h=date:from:to:subject:message-id:mime-version;
  bh=s+ZknJWKUh4xxxEOxvpM7NL5PFXuP/g0+hDFjELXw4w=;
  b=eQXdsC+RgBFX9VIddHnrZ06vy48jRaZTr54GwdNRSU8WMrVRCiyJZS33
   jwgx21oPr4vklXe8xrANymQAweRcXVEvu3I6qbUp+aQidWolGu5zSgeUf
   S8ErwLABPCGfQhrrLmkaaL6KEpJwIAO6TuHp49jRqusxYsJmrjp7en0Vg
   fbH7XiNPc8VCXDP78GubOQXiGiPzuPBIz6pz8DWdTJfkrPVpkQ89ua4Cu
   N+vu/N4gM/3A97iwpbplFWaGKLpwwsy8YNnq0IciOICeSE+NDYNIbFdwf
   7NQP1NE13j6Sl8cVtQ7zsJ582/JVMFpVbYO8VNm9E6a0Z1CepNaxBSNqr
   w==;
X-CSE-ConnectionGUID: a5xVBDP9Tm+AHjMVQe2x3Q==
X-CSE-MsgGUID: w9ecEoSQQoaS5UUeIt16NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76920817"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76920817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:58:27 -0800
X-CSE-ConnectionGUID: ub3Qs4RXQjmuzrxqE75/Mw==
X-CSE-MsgGUID: r75g9EAQRWiIn1aBJQJoNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192165389"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 11:58:27 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLei-000000001RX-2qUP
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:58:24 +0000
Date: Wed, 26 Nov 2025 20:57:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 836/999] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'an'
Message-ID: <202511262029.7BMlVQwt-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 76abd7ed021be25494b61aec4db5897d9c8cd286 [836/999] bcachefs: bcachefs_metadata_version_reconcile
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262029.7BMlVQwt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'an'
#1090: FILE: fs/bcachefs/data/reconcile_format.h:36:
+ *    a set bit indicates that an an extent in BTREE_ID_extents or

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1124: FILE: fs/bcachefs/data/reconcile_format.h:70:
+#elif defined (__BIG_ENDIAN_BITFIELD)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1166: FILE: fs/bcachefs/data/reconcile_format.h:112:
+#elif defined (__BIG_ENDIAN_BITFIELD)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
