Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2992FE071
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331726; cv=none; b=eUzxVTsdjIyVZcZYGYPhpLyzDn27D+OgH8xaxEQxrpVrjX+iLPhw2PpgBZ4Y/6Fp9jgJik6EvWy6C4cYBsBnwDXg4sm11eVzY4up9x6mn7Fe+hGbmiorXyfZHprOg3qjw7zbNCInQsTsKeHUmSK2jnBnysU+tjia6I0eWYpHz40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331726; c=relaxed/simple;
	bh=LuWJzrYvQqg1GhgU6UOL52ETUJudiCie8uf0iUzcEHg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHmdVcnxmHlMPldx1qCU8FtC3iX01IMl1BmLNGgOAu7FDsBEDHFAI5COLJGcO5t7Twr1kFo/nG3LMkLsdo10/y5QiA86H0HjU6kwPHwsMk9gLzkLQaKC+EwEawp+nymRfbisP99zru0GHaauj9tcX0JHlfkjTPS7f4mfnao5vnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ao3u9IK0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ao3u9IK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331724; x=1797867724;
  h=date:from:to:subject:message-id:mime-version;
  bh=LuWJzrYvQqg1GhgU6UOL52ETUJudiCie8uf0iUzcEHg=;
  b=Ao3u9IK0Zs4qugE912dve1HXE2udcMU0HWrbGT5C1uUifBlACqmuf5OL
   cQQMoD+L9so37GV5ZeBkGZeLYg5Y8vwuNbzqQ/BPKGV9bqun+1kL2TdPc
   THU7VLlUJGiuNuct78lsWWq+Vuop1qfmuAx2e9ycgyyC9qra/JIws7UFw
   UJv/qzSDEdUJ/tIGSdEENN+IL55NZfM65BBgekD8YOAvTJ5HbaGvtpm+A
   kAwuRxTxkUFxZId9z0TRijkjdxDWGWGEK0azo0wrFjPXbUFWJVNgCNwWY
   T6OzlEpN9Q1f+GfHm5CHJBr4iLMN3iG0+DE8P+VUe1/NGGyTmZCy0VDqg
   A==;
X-CSE-ConnectionGUID: BArLGDccRIugvOT1ZyeckA==
X-CSE-MsgGUID: Oazf5CYVQbiHw98y1H+MdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78847642"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78847642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:42:04 -0800
X-CSE-ConnectionGUID: WTHdOPt9QGKqD4Ezj9F4bw==
X-CSE-MsgGUID: uHBeyiyCQf6C9xct2YzO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199618619"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 07:42:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLZJ-0000000059M-33we
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:42:01 +0000
Date: Sun, 21 Dec 2025 16:41:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 246/246] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512211656.VERI65ON-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: a505a983517df0d2df38e87cb1898c518fdf9740 [246/246] fixup! drm: apple: set timestamps for 120hz
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211656.VERI65ON-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#71: FILE: drivers/gpu/drm/apple/parser.c:503:
+	/*
+	* HACK:

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#74: FILE: drivers/gpu/drm/apple/parser.c:506:
+	* in the the swap_surface message to non-zero values drives the display

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
