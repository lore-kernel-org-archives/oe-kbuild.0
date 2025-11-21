Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C2030217E
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753853; cv=none; b=Xh+x0Weg0ewTKmyXXqLocVUsdUCJuTfM8U8csuf1GBaps5yIZSmQTLK6hERq5ASiyob4YO4yTFch4OXzO++7fCE3R9pKbo4gB8UdD41Fgt5U8BHUTooh2L/hcH772pOOpfDS4xxVovLEhf/6QMXAsxZSqrMZwMMWOgC/4CMOiLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753853; c=relaxed/simple;
	bh=3XjLkB2nJRrpugTvsPKIFwxw+CmOmWmjGdx/OJOJJbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Odw5jUxgIItlf6rrZaVtw6Tp0rpasIf8ZylzqgnJOPuUzYi8qjitIgUG+HGjpdt9kE3gepsmAP2SeWMzaJU33WoWCTWyL2ODSWEP6bHFrkSITcLYxSaDC0OMxHYzMSB+S5UGZViKZzteEK6aH1oboGyT6Mhw+naJetMbSkU1bOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUU0RsJz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUU0RsJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763753852; x=1795289852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XjLkB2nJRrpugTvsPKIFwxw+CmOmWmjGdx/OJOJJbg=;
  b=fUU0RsJz0YyeAC4BKHn0jnVfaUPfTVGCVY7pCoj7ra4WCV6AjZI/Vo90
   r+dbzZn46pdZAz00Ff4/HTvaid2aFH0VqKm1nXhBv6XCXu51ZZXrbaMKB
   3NRURHlbJyeojtlBiHt8aHlQ8uYbO7uKVfVZZDWG5vMsp9LCWDeR/RFxx
   xqk1F8kUsZQ3YnYu9CHOiUmuiZFW2aqsvnQIMGuDmzMwsYYJGIa1IH3k+
   6WG6FLIKSw2s/MOvQqBXyw10F2S4loOibtcqu4IXk6onXvxlDxHCvwo59
   mNygqFhWevZFNfargg5PH/ze9oyvcx/gbcv8Wzo+yewanoy5T3qai3mgB
   w==;
X-CSE-ConnectionGUID: QNs+zXqqTr2+XxXsNwT0OQ==
X-CSE-MsgGUID: Bcd1G7u2QqmsNghVnjanjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77326876"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="77326876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 11:37:31 -0800
X-CSE-ConnectionGUID: fjt/Mce4Qt6aJzwdeksIWA==
X-CSE-MsgGUID: +9OKfO5GSG+7LZ+nMJL69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191072712"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 11:37:30 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMWwi-0006nZ-04;
	Fri, 21 Nov 2025 19:37:28 +0000
Date: Sat, 22 Nov 2025 03:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `data_source` on type `bindings::iov_iter`
Message-ID: <202511220308.teWgN9bt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alice Ryhl <aliceryhl@google.com>
CC: Andreas Hindborg <a.hindborg@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 06cb58b310ea38a8135827f726157df59a95376e rust: iov: add iov_iter abstractions for ITER_SOURCE
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220308.teWgN9bt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220308.teWgN9bt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220308.teWgN9bt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `data_source` on type `bindings::iov_iter`
   --> rust/kernel/iov.rs:56:43
   |
   56 |         let data_source = unsafe { (*ptr).data_source };
   |                                           ^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::iov_iter`
   --> rust/kernel/iov.rs:79:18
   |
   79 |                 .__bindgen_anon_1
   |                  ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
