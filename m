Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB927AC4D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406142; cv=none; b=RMr50A0V6wk5ElH2jSlPKPDOyDaOesXnZ3rp8TuR9OQlcSau2b6HXuaPiL0Lpz476TaJPS1pzGJtwqv2RgRW3OOQLdh2g+ebBcvF2NVDVDuuQPzpJEjOhvAJRkfSw82pd0GlkZvxEeldjhyTTaL0LdErt9x1dYqFW5tQMYvvLkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406142; c=relaxed/simple;
	bh=YVQicF4ePeyPfnas3Hf766w0/SSJxw3RvJ27h8OioPY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QpWpORMX5pcx4S87eA/Z9tLJH6qtgtVhClDyYQCdDuQMlmLchKqNAcsJL+BOznaQcZONaNqpdQ7TL21azu5oieOMzNVO9AhRxQgF7CAEfIR7qe26reaqytQE1onYjg5Gurklsqh0RcA8Yy0tFvFQ9j3ql4+ifCHDK5FerQfeDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RawrhrB0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RawrhrB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766406141; x=1797942141;
  h=date:from:to:subject:message-id:mime-version;
  bh=YVQicF4ePeyPfnas3Hf766w0/SSJxw3RvJ27h8OioPY=;
  b=RawrhrB0sk9p4y2O2bS2nX7/V3ECZYkHEwJWUhzlpzqr6MhFCbEaf1qO
   LGtAZMKbCD7Tk1zrsFKr4KYMaFkA59T3inCg+7t8ScyloYc+tbnAU7dma
   a2LemwsNqzIoLOjAJnJNuycMmuZm0z/SXhY89U8n/cEY1DwEJ9XsOKOKe
   3jZ/6/WJDliJqfBwolvEtlbobjiJGQXvN3agoGFjhCopJ+ywY8Lpt5IJ0
   01hELbhpi0I9L1u6/l2rmZkHArC38JWw3f6hxpisJ9btPtAvgFbB/kzPI
   2pgkCwBL0cwhqPvu70H6XCs1y1i0ZLCHrcTp3RMyqN2sgiidVwoZPdWVN
   g==;
X-CSE-ConnectionGUID: feIg8NEbTnqFwXbwWAhH7Q==
X-CSE-MsgGUID: L/zYNiueREuCSCQC+NFEfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68141377"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68141377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:22:19 -0800
X-CSE-ConnectionGUID: TbKBz89ESxmY+rPwlhkm+g==
X-CSE-MsgGUID: QDn6JT3CTf2I8qQ/6fYFMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200404859"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 04:22:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXevX-000000005S0-2e0q
	for oe-kbuild@lists.linux.dev;
	Mon, 22 Dec 2025 12:22:15 +0000
Date: Mon, 22 Dec 2025 13:21:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 19/20] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512221356.oXAjdVH6-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   f0fb4e6e782faa08d5a5768dafe2db689b167f07
commit: b6b6edf0bcbd915b3322cf446a10be8f362a5ae6 [19/20] objtool: fix build failure due to missing libopcodes check
:::::: branch date: 80 minutes ago
:::::: commit date: 81 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221356.oXAjdVH6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#35: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
