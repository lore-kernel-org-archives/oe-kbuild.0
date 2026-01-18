Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA043191F98
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731093; cv=none; b=G7kE/gx6wJRne6sD6PhA401igqyCW0l87HCH5pk26oDyI9KAE+PR4mdRMKACKAWnhH13VbWmiqH/2fN86lZztChEkVeM7r9k/k/GuG3YAnfDqxathxpbXMjxYlqtJYVIOBc/DRELVwqVmfe8xVx3qqCRhZYn4BNLxX8xAWOz8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731093; c=relaxed/simple;
	bh=6VDBHXxXEEPLbe5pcTN4oAlWYRfgVXKcujwHUmkjJUY=;
	h=Date:From:To:Subject:Message-ID; b=QQiJiCBHFn8y8swUv60KMD6J0DEhW2BoEFUdcxM5bycJQy9v0F9DgctMj6Gg+KKRAbJp6lxYmp46vXReQRMoB4QNo8yFJcfJ0lLAKLSvdfRTwltVpIJSpDGCilM+uWtfLlPZ/32yV/rPsT9Sjj+DD0Jt4hRFyl8eEX9OuXqxZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGOiL5rc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGOiL5rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768731092; x=1800267092;
  h=date:from:to:subject:message-id;
  bh=6VDBHXxXEEPLbe5pcTN4oAlWYRfgVXKcujwHUmkjJUY=;
  b=QGOiL5rcx8uhocDr5xLKye11kuDTUIV/xZ7IZqLLF1AzP6gfYeccTTFi
   37KTSjqgdC+4rbyeZ7U1w60TioGTHDrzM7Q8SXHIXddd6fNQvOgSw90Ti
   U7FoIu09OaHJbmqDsj/S0KgsUflq8RYOKpSsjK10q8CFhFX1tYkWH6zR6
   7AncbBMhrjXEwEtAde0RH5gicPPNHjlbYMrUKgZncZJgHiW7tXIjKg/Ck
   +UtJIzjGjXLTWoVD8c5Qx2GTBBbC3+PQXFvAk4ndLCJaAfTinkEm+Z98u
   WIIbMZZ8iGR/RxdhB8DgtqC/ZNZRloW1RlK8iJgZsSXZ+sW7VGaSWdDFi
   A==;
X-CSE-ConnectionGUID: /KcKfk8lSe6FQUPJKTqX1g==
X-CSE-MsgGUID: 5Bo/C83dRYuy7YoLXPqwSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73603882"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73603882"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 02:11:31 -0800
X-CSE-ConnectionGUID: PprBF5vRRrmHCasavWmmUg==
X-CSE-MsgGUID: 6zaMapjWQey8ZM5oe1aH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205890039"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jan 2026 02:11:30 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhPkm-0000000029J-1rjc
	for oe-kbuild@lists.linux.dev;
	Sun, 18 Jan 2026 10:11:28 +0000
Date: Sun, 18 Jan 2026 11:10:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 1/20] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Atish Patra
 <atish.patra@linux.dev>,', should be: 'Atish Patra <atish.patra@linux.dev>'
Message-ID: <202601181104.5Kr6l9E7-lkp@intel.com>
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
TO: Drew Fustini <fustini@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   b34c2f7cb87d02f5b712e9e35ac9b66d21ce07e9
commit: f7864630e49c56fc226f26961c1f49007118469a [1/20] RISC-V: QoS: add CBQRI resctrl interface
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260118/202601181104.5Kr6l9E7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Atish Patra <atish.patra@linux.dev>,', should be: 'Atish Patra <atish.patra@linux.dev>'
#203: 
To: Atish Patra <atish.patra@linux.dev>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
