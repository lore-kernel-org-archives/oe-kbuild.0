Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD45D515
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705747723; cv=none; b=anBV7omDpXRVriJbQgaOSCzS1v8Eg8hKbge0AP80L4Z2ACvS4A1OkomTN8IRtrOlXdLN4SlGQgVEaApGdqz5nXvbC0swga3SyaeR7Rjy5lHFVX+SzykNYVrRqNKKFSLtl1sb8bTzyzMYdAxUKVDZTGnc8QCU7D+5MWN2WPuHCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705747723; c=relaxed/simple;
	bh=C7tSpg56mCRaE2tu1LgzOTpI5mTHuz6lwr6T8fw9U4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3CE7dMSze06nxy6up8ic3YvU5FfKbx0jY9oNEdk0Q9grIexO/hnLpK0RttDmDP5qYWfk+7CCs26AeB7ojM3ORDRwBuI+onAwd8TNLwCPt91RlULUn6hNIaSKQGGwvTUQE1dZMgA0tSCvKcm1xHyoPJgvMNIgK8k/bIWYuIXgcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDaG5YBz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDaG5YBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705747721; x=1737283721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7tSpg56mCRaE2tu1LgzOTpI5mTHuz6lwr6T8fw9U4A=;
  b=oDaG5YBzyN98PNDsIF449w87JXCsUK59ysPug8KmBUKlq1jD901HI3ZI
   Zz5gSalOh9PkMw169oWsDZe6VWGBcnNIfPJduIRssMoUi/SINW1IIYJB8
   5flAznVfLC2Znl6nZlxvGaoU2uZPKj36L0XL4PxrIe+FudY/Jtj4YIE86
   VXX2VFhPYC/UomFjtf+sWHIjQXKoh+S6KPkyFhhdXue6MCcroFqoAGTW0
   S3wkb2bA7aijrX6TYJeCHdOrAh/+9lop7OD9VTQrz6P2gPTJxK9LGUZ6l
   7iLs7mcXLIcfw9RVD4NnLBgpoQ6repjc+OiKmlfEP/QP1M2rGKDkYZjCf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="823698"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="823698"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 02:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928596433"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="928596433"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2024 02:48:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR8tu-00051E-19;
	Sat, 20 Jan 2024 10:48:34 +0000
Date: Sat, 20 Jan 2024 18:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kees:devel/overflow/sanitizers 1/84] lib/overflow_kunit.c:366:1:
 sparse: sparse: invalid type for argument 1:
Message-ID: <202401201836.BxETHtRJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/overflow_kunit.c:366:1: sparse: sparse: invalid type for argument 1:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/sanitizers
head:   87079890a6277ce39553c391b994c4f5c10e70e0
commit: 69781cb9dde8f92cf632fb6b423bc91aa2afa59b [1/84] overflow: Expand check_add_overflow() for pointer addition
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-r133-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201836.BxETHtRJ-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce: (https://download.01.org/0day-ci/archive/20240120/202401201836.BxETHtRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401201836.BxETHtRJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:314:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:321:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:327:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:334:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:341:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
>> lib/overflow_kunit.c:366:1: sparse: sparse: invalid type for argument 1:
   lib/overflow_kunit.c:366:1: sparse:         void *const a
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:366:1: sparse: sparse: undefined identifier '__builtin_classify_type'
>> lib/overflow_kunit.c:366:1: sparse: sparse: invalid type for argument 1:
   lib/overflow_kunit.c:366:1: sparse:         void *
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: invalid type for argument 1:
   lib/overflow_kunit.c:382:1: sparse:         struct _sized *const a
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:382:1: sparse: sparse: invalid type for argument 1:
   lib/overflow_kunit.c:382:1: sparse:         struct _sized *
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:809:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:810:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:811:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:812:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:813:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:814:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:815:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:816:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:817:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:817:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:817:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:817:9: sparse: sparse: undefined identifier '__builtin_classify_type'
   lib/overflow_kunit.c:817:9: sparse: sparse: undefined identifier '__builtin_classify_type'

vim +366 lib/overflow_kunit.c

69781cb9dde8f9 Kees Cook 2024-01-17  358  
69781cb9dde8f9 Kees Cook 2024-01-17  359  DEFINE_TEST_ARRAY_NAMED_TYPED(void, int, void, void *, int, void *) = {
69781cb9dde8f9 Kees Cook 2024-01-17  360  	{NULL, 0, NULL, NULL, NULL, false, false, false},
69781cb9dde8f9 Kees Cook 2024-01-17  361  	{(void *)0x30, 0x10, (void *)0x40, NULL, NULL, false, false, false},
69781cb9dde8f9 Kees Cook 2024-01-17  362  	{(void *)ULONG_MAX, 0, (void *)ULONG_MAX, NULL, NULL, false, false, false},
69781cb9dde8f9 Kees Cook 2024-01-17  363  	{(void *)ULONG_MAX, 1, NULL, NULL, NULL, true, false, false},
69781cb9dde8f9 Kees Cook 2024-01-17  364  	{(void *)ULONG_MAX, INT_MAX, (void *)(INT_MAX - 1), NULL, NULL, true, false, false},
69781cb9dde8f9 Kees Cook 2024-01-17  365  };
69781cb9dde8f9 Kees Cook 2024-01-17 @366  DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
69781cb9dde8f9 Kees Cook 2024-01-17  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
