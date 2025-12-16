Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1201946DF
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765911684; cv=none; b=MRCgQvBYpl1msZ5n5XgifOpIIzH8gWp6NmIw5vFY4fY5gklwFfGiDSL6iq9aixubWpnRKsphQHWxeNp8+6GeEG0JUiJxByEdTlmnH49r0GP72gKJrJ16qRO96zNHGUQwdGiMOa6DAuFxEU1oHDCkLetzceZ5nq4F7O6DMJ8S5eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765911684; c=relaxed/simple;
	bh=HHE8xg8UyASVjcJo3h1MB9F4KpwSA1pIGp30RpjHb8A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+9P7+3BVlr7B/hSvogn+q3nfzjYXV0WqxvJaou1aNLscmkZW0osAmct6lJT2MeeSSrDYyyS9bcdCVZmYhzdwGTgdu1f4JArsVcTKm9QHawGcWgb6js8YCMS1xUn+I5FJkZrnfpdG9lFQciXpoeQn2uwx82+7IpbFoH6hxKUVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7wKuFhB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7wKuFhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765911683; x=1797447683;
  h=date:from:to:subject:message-id:mime-version;
  bh=HHE8xg8UyASVjcJo3h1MB9F4KpwSA1pIGp30RpjHb8A=;
  b=O7wKuFhBJf2/CSYwTaY1j00Y78zQ8mKUDSMrz6fvfr08l/qz6FPYAqVk
   ruLUYJXvUH3IAermu8v6b8osCnYGmvXRTcRtDhMc4L7F6J9r0SHMVgOCw
   4H+ZuWaMlx3Xiq/OA+lR/RzcXIzP4d/cSsztKXaRjXWIWj+Xey7E4bsNb
   lt6h0y0+sPMvIOTWenE5Ubd11ddXpiN5j0rYPojj0Z4Uy/tWblBfex5TF
   FEv+swpV/6ke/ue+kPV0RM3OOYUHL1U9COnTAKoNA1AB4esY/XM19I8PT
   ou4yMZiV/8lgT3S6FaMEn4xico1yTReym/a0msZQdrYp++LkWiNhzAV0y
   g==;
X-CSE-ConnectionGUID: L/xa2gR9QL+WBVFpxdkwXQ==
X-CSE-MsgGUID: xI9L1//CQXusg7IKjCf2Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="55413905"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="55413905"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 11:01:22 -0800
X-CSE-ConnectionGUID: xuAqUpd3Tti5sNo0SUkvsQ==
X-CSE-MsgGUID: wY5jeITXSvuGzlN870lBYQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2025 11:01:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVaIR-000000003Ec-3iMw
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 19:01:19 +0000
Date: Tue, 16 Dec 2025 20:01:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [melver:ctx-analysis/dev 11/35] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202512162041.ozbv5Aun-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   6f3ab5bf905fd39deead834b14bd046dbe168533
commit: 0f9066d0f8a687f90d27a8ccea80843117a86b62 [11/35] locking/seqlock: Support Clang's context analysis
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512162041.ozbv5Aun-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#251: FILE: include/linux/seqlock.h:1327:
+ * the alias analysis of the compiler will recognize that the pointer @s is is

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
