Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4A1459FA
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765025282; cv=none; b=g+Jt5vUNy/1wXCRHtMYn+oxJAyealoPmRsHAlUpreYK5XxKZbHhCMGoZ9sVbDsbxN4Gl0qG10TEzY2Xk/tfZ59Pn4bOQsSyu69ZukKirb1PduvuEOrI8l/NaZGjH7uMMJ2aAOZ5ydo/dc87cx7juQHy7kjq8CEMK42LXK+Xt7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765025282; c=relaxed/simple;
	bh=lM62eLE4uBtujPaSXtAhCfWrRBrATVnX8JnMFJzKBU8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a2z4tNE8hPf7a8XHG03cYsIe/Tm+ka7r9pww2h2hYf3vrOoTUfyr3HwnlwIYE7chyElbjUFFlZlJxvpY8zmRQGPTUvbv+9bORsDajmp3WwAj9Z+Dk9d8ve0N1vZvhsH9awViHm98QaGVMhSp8f8AHdRbtVx904CE5g9EqHGR2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnuUez/e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnuUez/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765025281; x=1796561281;
  h=date:from:to:subject:message-id:mime-version;
  bh=lM62eLE4uBtujPaSXtAhCfWrRBrATVnX8JnMFJzKBU8=;
  b=GnuUez/eWFh9FhY23R3y0M3oJMH1wl7ewwoeSeCk69jL8QPTBYGJ/N4I
   GEHABJPQE+WnlQzXsa2IjxoRFpeR4UJ0zoOj4zgAwwcyHhOlilii2TW+U
   g1eUxRYAU5h72LPipZh7GiMcFINTbYsLbYhY4lERg4Jw4ERXFl+fTQ57a
   G1+T3lsVPdNgEUG9NiyRctVzCn9zZnfqfRhEG28XkhX+kOVCe+wnjl0tW
   pMc4ueIrv+rrl8P18L6M+nmiE8xg/6SOl/9s7icx3ZRGubffzecgjPp2+
   jTdlir5GM51iLrgmhCTogm+9/EF0WKb623SldpxU5+T7mxnqYnCKZQIm5
   g==;
X-CSE-ConnectionGUID: mCsv9gEWQT6xzhIdt/bPbg==
X-CSE-MsgGUID: q3jQa1RrQ36h+H44Lr35Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66227123"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66227123"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 04:48:01 -0800
X-CSE-ConnectionGUID: RGM/tY8mSh6UZFcgg4nq9w==
X-CSE-MsgGUID: 2SrkL6pjS2W1ZLlEw9oOYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="226179683"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 04:47:59 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRrhd-00000000161-2AnU
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 12:47:57 +0000
Date: Sat, 6 Dec 2025 13:47:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [device-mapper-dm:dm-6.19 14/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'that'
Message-ID: <202512061350.fAGFuJBe-lkp@intel.com>
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
TO: Mikulas Patocka <mpatocka@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-6.19
head:   58a0cbb4f70a5dfbb7b70b50ad2e13026186b14e
commit: fce0ead1b7542095f042126b0259144f34d9db33 [14/29] dm-verity: disable recursive forward error correction
:::::: branch date: 76 minutes ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512061350.fAGFuJBe-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#12: 
actually created an image that that pushes dm-verity to this limit - and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
