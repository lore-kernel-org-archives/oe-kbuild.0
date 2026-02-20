Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF682F25F4
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604814; cv=none; b=BldHOo3ZHhN/+85KyXtrftd4f+xCKHeaHaPp/aPo5eMaSsJJCm2vALQTLAUelPGmW192CCQ5kpoEv1q7zt5gdqoZBNQUXQ/JzgqXyc9nMp7l+h71NgEUkGBXd8oKRKHkaKbTKJU8AsqZc/A0U8ZIQkIi+jJuQybR6wZcX0NSGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604814; c=relaxed/simple;
	bh=dTXWKQ685eEcd+TXzvolsbNxi+w++lIQvLa0ZuiL5v4=;
	h=Date:From:To:Subject:Message-ID; b=KN1KeGGw/+wtw2cf03OSFw2q+X548HxsBEFUjdtN4cAm2a6gVNVAokipqvi1sVz2VBBIc5qWnN8meTwnO/v9sghXRjzzTr4Dq5HB/ab5A6UIv77XV0kOKGnkp0BG8dHVByjqmuCqqjL5GWmyaEw6N4K5YKqi84y4WQ+AYj1ZZl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9I/UxlN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9I/UxlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771604814; x=1803140814;
  h=date:from:to:subject:message-id;
  bh=dTXWKQ685eEcd+TXzvolsbNxi+w++lIQvLa0ZuiL5v4=;
  b=P9I/UxlNvI6M7K4xEi4Zg6ZcO+DEwG8YeCUIi8RU7R2c0d+aGXIl7Z2U
   z5jKa4XzQ/iHYY+afARE+FAAJjgj6Ku4SAVbvNtyeKPKpbBspCVaVehn9
   55EmwmajoKjlYuZaNkF0sBy0nycvsTZCTaZhSf+YwH4lWhEgh5ykC8i+U
   H3HiZNmaUKbXnEUXAcnJKzFmJa/rHp7lqm6Q8gXqGadYw2Q1s5B9yh4Em
   8NPDTtpecjAI3s5R+dArgijiO9JZXM7b87ja6H74kY/sv6zfxADpWhe+K
   1BxIYu90r6duZa9Rl8RLQekuH2MAm7sZvLX6vGVz+6Ie727+j4+Hv1Ki4
   w==;
X-CSE-ConnectionGUID: Zd77JflZRp+85oG0xjWEGg==
X-CSE-MsgGUID: aZczrlCXRImmFSuASIim1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72744556"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72744556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:26:53 -0800
X-CSE-ConnectionGUID: CT58vD3QSUWQkIXBGLbgNA==
X-CSE-MsgGUID: P6pwojt2Th2iuqF03wa2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213431707"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2026 08:26:51 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtTL7-000000004E9-27Cj
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 16:26:49 +0000
Date: Fri, 20 Feb 2026 17:26:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlayton:kdevops 1/29] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202602201701.FXb4IBVx-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   5aef1b33e04ec98ed6f4a02ce457ecdc39b794dd
commit: 634702ee55bf1c95e7a3e886d048a4a8f539ccf9 [1/29] vfs: widen inode hash/lookup functions to u64
:::::: branch date: 77 minutes ago
:::::: commit date: 77 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602201701.FXb4IBVx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#260: FILE: include/linux/fs.h:2954:
+extern struct inode * iget_locked(struct super_block *, u64);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
