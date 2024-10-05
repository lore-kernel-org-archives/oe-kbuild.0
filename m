Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DC514F9D7
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 22:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728169113; cv=none; b=t36TCve/AT5hgY2yCXHXOd3qS9K5lcNonMSTxnrrF6ACwgM9NzIv7SjB7HQnpxWDZrOHD6qEKKxbgyz53Gm9/Y8LTqRfYUXpcY02ye9rGeVrcEsksG028EYErZj9CFlCPzNEjVDSmVmYps3qWdQneZalW1/VNTt8HNEMZlw51LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728169113; c=relaxed/simple;
	bh=rhsTnJ+Ttc9PKupDCaEjUj/P4e5clIsMSpPoIR0Z0vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ig7RyFO8Bu7AOYC4QEX9+bHCXMu8CaMAf4ZY5t26YT83CqVXbA6kwnDb6gArN5koL11bu9fbLD1PhYzyD8wJxr/sHIZwMKSVLei/OemO+dU4Cx9l5RRDqHKZ4hUjTP22uAixHCzOjWubeKsWq8DMprlbT5db3tT/AI1fuMWe8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyRA3oze; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyRA3oze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728169112; x=1759705112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rhsTnJ+Ttc9PKupDCaEjUj/P4e5clIsMSpPoIR0Z0vw=;
  b=JyRA3ozepAuQLsyR6d0+BWx1ayBz4BznTs6yB1IlI/PhguXceWGhkxRR
   JrUU5AAWHuIjOxNnt7Z5578zpA90i58nEfzBWkgKqUg9lAW6xMttRjR3w
   WXDFSxRCW6a+Ui//FVyT0UM0pXbA9hAfLSuA9/BIVUnpmTzTAiPYD0vlm
   RG12UjXBGLSPt0GhHHJ1ULoWNyBoxKpofSoTejqGeOW0tavMQoM3YygF8
   UPKxZ9OttJGC6fvWK/EQaFVfWLAmbVLHyuljeA4M9mze/XtAuJCjk1bXK
   yZ3dZY3SMR7BLIv2ISyspZRbL/3/FaGpg0BTlxGh8q4bYPqL7ISJYRSqG
   w==;
X-CSE-ConnectionGUID: wmhe074ZRquHjS5RMUr2ig==
X-CSE-MsgGUID: egz9wmoVQbasEO14kxHigQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27301390"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27301390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 15:58:31 -0700
X-CSE-ConnectionGUID: 8zNI2yPVQBaDpHSY1Wb4mw==
X-CSE-MsgGUID: Cdo5i3PvQ4uKQA3qkGaSNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="75895339"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Oct 2024 15:58:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxDjH-0003Qg-1y;
	Sat, 05 Oct 2024 22:58:27 +0000
Date: Sun, 6 Oct 2024 06:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/4] KVM: selftests: Add bus lock exit test
Message-ID: <202410060638.ZXRqIbIj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241004053341.5726-5-manali.shukla@amd.com>
References: <20241004053341.5726-5-manali.shukla@amd.com>
TO: Manali Shukla <manali.shukla@amd.com>
TO: kvm@vger.kernel.org
TO: linux-kselftest@vger.kernel.org
CC: pbonzini@redhat.com
CC: seanjc@google.com
CC: shuah@kernel.org
CC: nikunj@amd.com
CC: thomas.lendacky@amd.com
CC: vkuznets@redhat.com
CC: manali.shukla@amd.com
CC: bp@alien8.de
CC: babu.moger@amd.com

Hi Manali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efbc6bd090f48ccf64f7a8dd5daea775821d57ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Manali-Shukla/x86-cpufeatures-Add-CPUID-feature-bit-for-the-Bus-Lock-Threshold/20241004-133639
base:   efbc6bd090f48ccf64f7a8dd5daea775821d57ec
patch link:    https://lore.kernel.org/r/20241004053341.5726-5-manali.shukla%40amd.com
patch subject: [PATCH v3 4/4] KVM: selftests: Add bus lock exit test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060638.ZXRqIbIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410060638.ZXRqIbIj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   x86_64/kvm_buslock_test.c: In function 'buslock_add':
>> x86_64/kvm_buslock_test.c:36:39: warning: taking address of packed member of 'struct buslock_test' may result in an unaligned pointer value [-Waddress-of-packed-member]
      36 |                 buslock_atomic_add(2, &test.val);
         |                                       ^~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
