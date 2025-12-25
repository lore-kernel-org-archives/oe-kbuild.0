Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B059800
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 04:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766637731; cv=none; b=BiVJYhLkfAirs2gxGhGLIBpW8//msPGlpphe0zHYXBI8votkZ345Y+7pGZeANjk7m/DeLIMyqJac20VXqI/aJ7Bb+m2levHb3W6be739Eist2P9QVtOGUjnzV0xtl2HLO1K6sk8TFpsK0EhgkbTlyuRV0PEk/4Cs5qKMwejollQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766637731; c=relaxed/simple;
	bh=Uou0V3nDBq54IwG+44/trrIm3quqr3JGlyL+2TPTMOg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAnVSgkR4oKns6yl5Fy/62i0SYTA9utbTzq0oHNidrxM+I4FHkYq/xrTG025H+tmvdz63YgZKojfzBFzbeOealxAxeurqfXWVFfeqi9ZeWcdpOk903LMvD/ChtejSX2Ux3xZRRsMJW7jK72JrNdIU0KIBEt4MO2/34PPGYJTdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EndlC5gq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EndlC5gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766637730; x=1798173730;
  h=date:from:to:subject:message-id:mime-version;
  bh=Uou0V3nDBq54IwG+44/trrIm3quqr3JGlyL+2TPTMOg=;
  b=EndlC5gqoTLSz9rQkvjn7LENM1OXUucIjS6FU+777K+LfhgD8bAfob5p
   AgxNfwx5EFaHES2Pzx5DkZWCaxOW0bMDS22Q08AGyvx6AtNQv/036+a8o
   2uJL4DJz8STNwjYa3jUu6A/eP1bRZTLdm9ZeF7KqKTrFOfaq+ieytUhSq
   V6MCnqmQ9MEe6sFSU7XOzFyY9CQs1GhAQsR0w+6i++5SfNusouOXVH9hy
   9bYDqekWHRQKGA9OlPZKHcUWD/paTTiMLQMYeItOJFu/HR+65duWH8FiP
   OrQkSKe0e+x4Lt/2XFG6TpHaZaDZVgVydwaoy4PHz5xrDKmltvhnf7/Q1
   Q==;
X-CSE-ConnectionGUID: 7v3xOfYOQTerfv53g8x8JA==
X-CSE-MsgGUID: vY8KGcH0TzGRknhjZbLeWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79176228"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79176228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:42:06 -0800
X-CSE-ConnectionGUID: DUxO8H45SMC47Xe/6FLjKw==
X-CSE-MsgGUID: RCobHFAeQ3eyC7zw4DFwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="231213757"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Dec 2025 20:42:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYdAp-000000006Ts-1WFB
	for oe-kbuild@lists.linux.dev;
	Thu, 25 Dec 2025 04:42:03 +0000
Date: Thu, 25 Dec 2025 05:41:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 52/52] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202512250537.wOGG5ZhA-lkp@intel.com>
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
head:   aabe65390c076ce0aabd5a1f7714f2e13c95bb55
commit: aabe65390c076ce0aabd5a1f7714f2e13c95bb55 [52/52] bcachefs: bch2_extent_ptr_durability() can return transaction restarts
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251225/202512250537.wOGG5ZhA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#122: FILE: fs/bcachefs/data/update.c:367:
+	if (unlikely(u->opts.ptrs_io_error) ){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
