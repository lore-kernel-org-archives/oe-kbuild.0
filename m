Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D72C11FE
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771266572; cv=none; b=mwKh8SIg3kCViXIDV8vTJTYaHIrmgyYPw8m8/qJDPNFNM034cfPGNgfQITDu/4jrCIzvFPdMlOq+tuPwcbPCUmQsAvL/UP0SlhZsbLSPL3902d0K9YByPtxBr2NjLkIr/o+bYvQaX6vJHy7PNBompo9dVZ8okxs248oe2b33imI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771266572; c=relaxed/simple;
	bh=jWq5n4uu9fg9wcEqdqhlgsWBimqmyfmK2OFsO1jF+Lg=;
	h=Date:From:To:Subject:Message-ID; b=HPSwS8iUP2/pj+hCvFaSFwiVhMC+uc8/2TJ805rvyE7E6XjqLLshzH4prwLfQfxTz6kdBQxKSY1ckoj6ZoTwkTIj3DNhprDlF4e04GJKO3gRsU+2Uh5e6xoUwkziL8MVqK4duOgLDRU4onDgOaWZcOinOSLIf0Pj3GndhBQV0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZJkvDW+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZJkvDW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771266571; x=1802802571;
  h=date:from:to:subject:message-id;
  bh=jWq5n4uu9fg9wcEqdqhlgsWBimqmyfmK2OFsO1jF+Lg=;
  b=mZJkvDW+GG14CzodxkIg9vs83F9YWUa196YA5RadD31c1snuxv16gDEq
   mGiEI5w8Wl53vx8/HFRYbkrYDO5T/ktWfWhFVXgUqCPY5OT+KQmuKTAHp
   SsoIkii67BscrGxJj4iQLzr99ceqBjbQnOWqWcnUDE59/UJTq0SFJBvBd
   e3oo3n0ohG28lFgzQjEFFrSFYqIpQBGsa2ZwQlv+H7ryaIT+lnu5jA9Zs
   qPnR0dHQN7oPYYm4p8NR4W5Mf86TBB8+ewKJQ9oacje6/cpqvxRPueLjg
   GUGH0lgbNcqViv62Eteuz4boCiAi5RW/EntR1TNiD4mFacwzLWdzuDnjf
   A==;
X-CSE-ConnectionGUID: 0DuTJ9kbQ1qP4eMQ2RH+4Q==
X-CSE-MsgGUID: 1wpzvNGPSE2LMw/WTDGSaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72256350"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72256350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 10:29:31 -0800
X-CSE-ConnectionGUID: 8yAN8sogRCWGGpO7XfL9ng==
X-CSE-MsgGUID: jPNDgHZiTK2PvvmHytIqhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="218661897"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2026 10:29:30 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs3Lc-000000002Wd-14yz
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 18:29:28 +0000
Date: Mon, 16 Feb 2026 19:29:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 26/26] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602161952.BfQ8KEac-lkp@intel.com>
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
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   10d7c95af043b45a85dc738c3271bf760ff3577e
commit: 10d7c95af043b45a85dc738c3271bf760ff3577e [26/26] fs/ntfs3: add delayed-allocation (delalloc) support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602161952.BfQ8KEac-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1685: FILE: fs/ntfs3/inode.c:815:
+	 * Normal file allocates clusters in attr_set_size.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
