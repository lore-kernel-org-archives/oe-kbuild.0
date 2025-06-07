Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2133FBB3
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Jun 2025 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749300955; cv=none; b=INTvk0aj/XOg35+0ZT5OiTU4GuwAC9hHhCq9b+TM6LILy/uJW16ukACUTFJF9VZ8gdoOeVbjCcbfe6UoS8z4OOw7zFDWzc3IQ1SDaCQrsjFwhHG5TuDA9KXnoegsV3pvTYRA4kf7b6pVcN0A6Je+TnOLnsa626shUIe6sbaHhE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749300955; c=relaxed/simple;
	bh=oI05QMUyG9JF8xhzyGJGeIERbkRGHS0CsmdLo6L3dck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hnQWRB/2tfHNRf7xlqgkkd0jMRiRBLRZQS3woKgYhwchwcX+cvXFC2BNp3+8sbnbFunASbZwx9jrKXqSQDj+Kxz+WewPCApJZQtOoUoRVttzno5OGxyCsGrzgoCG3J3+3fQa/jWFXD9VjrHZucQT+P8UjKftXEZ0vkg2TkO/eGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSmh+vq9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSmh+vq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749300952; x=1780836952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oI05QMUyG9JF8xhzyGJGeIERbkRGHS0CsmdLo6L3dck=;
  b=LSmh+vq9Rx7msOKr7vIqkyQ8jPNhFqNoUr5CaLXFGY1JXbleDVY69v1E
   hbuU2ZE7OdtD8ra6P3M52Ywt+uGY/bGLIaF+bVI6gTvKGdXCBQBPcGmm6
   X2/AeOv9kU0Qgg1DQyPml7TFtLKpI12xOVVLHWsotR3mhg/kbCXDbDRny
   Q+BEJL1pLvXY6oO+thOyh5I+gKKfC4NYcs2onlLjre56+K3190IQ+mrKj
   TsNJskTpbyap2SqWl2sjhykXlmTfZlk0xjuhLtitzJlnA2A9CouRAR0pJ
   4lz1NcWmiCunzB3CEcL/Vu3HivCNaWpdW1w47ERjueuwdXvr5/cNHRtgb
   A==;
X-CSE-ConnectionGUID: 6LuZuepDRlCL0jnLW0PiWQ==
X-CSE-MsgGUID: W/TwsOXVRFKISfpN0hqjTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="62837702"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="62837702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 05:55:51 -0700
X-CSE-ConnectionGUID: e0X2Sk5cRsynDK64fGju9A==
X-CSE-MsgGUID: Z+v1PUXNSRikFVkn47zwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="183254198"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Jun 2025 05:55:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNt5O-0005n3-2e;
	Sat, 07 Jun 2025 12:55:46 +0000
Date: Sat, 7 Jun 2025 20:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] compiler_types: Remove unnecessary indirection in
 compiletime_assert()
Message-ID: <202506072023.tGPGIsGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250607-compiletime_assert-v1-1-a8991a9be729@columbia.edu>
References: <20250607-compiletime_assert-v1-1-a8991a9be729@columbia.edu>
TO: Tal Zussman <tz2294@columbia.edu>
TO: Kees Cook <kees@kernel.org>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: linux-kernel@vger.kernel.org
CC: Tal Zussman <tz2294@columbia.edu>

Hi Tal,

kernel test robot noticed the following build errors:

[auto build test ERROR on bdc7f8c5adad50dad2ec762e317f8b212f5782ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Tal-Zussman/compiler_types-Remove-unnecessary-indirection-in-compiletime_assert/20250607-152454
base:   bdc7f8c5adad50dad2ec762e317f8b212f5782ac
patch link:    https://lore.kernel.org/r/20250607-compiletime_assert-v1-1-a8991a9be729%40columbia.edu
patch subject: [PATCH] compiler_types: Remove unnecessary indirection in compiletime_assert()
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-buildonly-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506072023.tGPGIsGR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506072023.tGPGIsGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506072023.tGPGIsGR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
--
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
--
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>> clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
   clang diag: include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
..


vim +/error +37 include/linux/list.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  24  
^1da177e4c3f415 Linus Torvalds    2005-04-16  25  #define LIST_HEAD(name) \
^1da177e4c3f415 Linus Torvalds    2005-04-16  26  	struct list_head name = LIST_HEAD_INIT(name)
^1da177e4c3f415 Linus Torvalds    2005-04-16  27  
46deb7449d99f37 Paul E. McKenney  2019-11-09  28  /**
46deb7449d99f37 Paul E. McKenney  2019-11-09  29   * INIT_LIST_HEAD - Initialize a list_head structure
46deb7449d99f37 Paul E. McKenney  2019-11-09  30   * @list: list_head structure to be initialized.
46deb7449d99f37 Paul E. McKenney  2019-11-09  31   *
46deb7449d99f37 Paul E. McKenney  2019-11-09  32   * Initializes the list_head to point to itself.  If it is a list header,
46deb7449d99f37 Paul E. McKenney  2019-11-09  33   * the result is an empty list.
46deb7449d99f37 Paul E. McKenney  2019-11-09  34   */
490d6ab170c94a7 Zach Brown        2006-02-03  35  static inline void INIT_LIST_HEAD(struct list_head *list)
490d6ab170c94a7 Zach Brown        2006-02-03  36  {
2f073848c3cc8af Paul E. McKenney  2015-10-12 @37  	WRITE_ONCE(list->next, list);
d679ae94fdd5d3a Kuniyuki Iwashima 2022-04-29  38  	WRITE_ONCE(list->prev, list);
490d6ab170c94a7 Zach Brown        2006-02-03  39  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
