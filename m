Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591820B22
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766404879; cv=none; b=GcMVu42NG3aIK66EJzQttqlBIWVkNXouh2ZPVOBrUNwgYnZ//J97SwchBAh24AAGjqeR8j4x3NhOBH+NqfxCb3roqTnhUkYLj84F5S2QIVsayjYM7ag/QOoptvK8f+kkAi6K5rz+sJxIehC+zo/GSMkNG0iL8iscTgISa8x5cnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766404879; c=relaxed/simple;
	bh=NM5GZghnMwzFrlyFP3pJcNS76jpu0f0kAxehoSZ2QEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JpMRAWK9ieXD7gkWaE6cNezMxV1hij6b9cUzeO/cEy451lo1HR+pYAhf0xkSP1ZUNdk0C5XdLWQ8RMFEseazzG6mxGVWk1AjsiUEiAVdlDfgHTfeVRCFd8hCrqPsRH5hW6FQvOaJ5wqwtQ4uogDRh2jbp46ZD1f1vaj6lyzG5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y30bPzNQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y30bPzNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766404877; x=1797940877;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NM5GZghnMwzFrlyFP3pJcNS76jpu0f0kAxehoSZ2QEY=;
  b=Y30bPzNQD4jIOfR9hq3wpMiUg4L0f4YcFBg90YL9Ul1zaLfiknEHmGSf
   glcECbNtASxQIQ7AFw9lx+/SLypiz0MNDgFJEIe7HIiaiLIj9PGIc4s+w
   X+PdnGVsrbYgRvmPfM64r8RF8XHMqiO3ATIJkA8WwiOKYrzokvwynlLzV
   +h6e3JYhCJtEzeQxm3k/oRRIOpe68YHCaw06vFZQNOi6Q4mrgLFj5+GZN
   rYMV5EyQfMwyFUNDEO2iOxcqeb4wbarI/qtf16nPkkjyZiDs5sGh/I/m0
   mEEhDRn42SoZbVR9NiEdJm5HEmk7kS8mFIZh/wAFYTWVcbvLHWKSRkz7s
   g==;
X-CSE-ConnectionGUID: gGTFOtyQQKuCTJtHXP0vBQ==
X-CSE-MsgGUID: qEDv6VlpTd6+/sX+UPJrbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68147964"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68147964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:01:16 -0800
X-CSE-ConnectionGUID: 8+NvrVnSRfupsnjljDVvzw==
X-CSE-MsgGUID: 5ZQWwukwQ7CcaEBRvK962A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 04:01:14 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXebA-000000000U5-3E8m;
	Mon, 22 Dec 2025 12:01:12 +0000
Date: Mon, 22 Dec 2025 20:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/9] platform/wmi: Add kunit test for the string
 conversion code
Message-ID: <202512221916.N8b0dVxv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/platform/wmi/tests/string_kunit.c:275:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251220204622.3541-5-W_Armin@gmx.de>
References: <20251220204622.3541-5-W_Armin@gmx.de>
TO: Armin Wolf <W_Armin@gmx.de>
TO: hansg@kernel.org
TO: ilpo.jarvinen@linux.intel.com
CC: platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux@weissschuh.net
CC: Dell.Client.Kernel@dell.com
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org

Hi Armin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platform-wmi-Introduce-marshalling-support/20251221-045132
base:   linus/master
patch link:    https://lore.kernel.org/r/20251220204622.3541-5-W_Armin%40gmx.de
patch subject: [PATCH v2 4/9] platform/wmi: Add kunit test for the string conversion code
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r132-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221916.N8b0dVxv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221916.N8b0dVxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512221916.N8b0dVxv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/platform/wmi/tests/string_kunit.c:35:17: sparse: sparse: Expected ) in expression
   drivers/platform/wmi/tests/string_kunit.c:35:17: sparse: sparse: got 'T'
   drivers/platform/wmi/tests/string_kunit.c:50:17: sparse: sparse: Expected ) in expression
   drivers/platform/wmi/tests/string_kunit.c:50:17: sparse: sparse: got 'Ä'
   drivers/platform/wmi/tests/string_kunit.c:66:17: sparse: sparse: Expected ) in expression
   drivers/platform/wmi/tests/string_kunit.c:66:17: sparse: sparse: got 'K'
   drivers/platform/wmi/tests/string_kunit.c:82:17: sparse: sparse: Expected ) in expression
   drivers/platform/wmi/tests/string_kunit.c:82:17: sparse: sparse: got 'T'
   drivers/platform/wmi/tests/string_kunit.c:98:17: sparse: sparse: Expected ) in expression
   drivers/platform/wmi/tests/string_kunit.c:98:17: sparse: sparse: got 'T'
   drivers/platform/wmi/tests/string_kunit.c:114:17: sparse: sparse: Expected ) in expression
   drivers/platform/wmi/tests/string_kunit.c:114:17: sparse: sparse: got 'T'
>> drivers/platform/wmi/tests/string_kunit.c:275:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/string_kunit.c:275:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/string_kunit.c:276:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/string_kunit.c:276:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/string_kunit.c:277:1: sparse: sparse: bad integer constant expression
   drivers/platform/wmi/tests/string_kunit.c:277:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/string_kunit.c:35:17: sparse: sparse: undefined identifier 'u'
   drivers/platform/wmi/tests/string_kunit.c:35:17: sparse: sparse: cast from unknown type
   drivers/platform/wmi/tests/string_kunit.c:50:17: sparse: sparse: undefined identifier 'u'
   drivers/platform/wmi/tests/string_kunit.c:50:17: sparse: sparse: cast from unknown type
   drivers/platform/wmi/tests/string_kunit.c:66:17: sparse: sparse: undefined identifier 'u'
   drivers/platform/wmi/tests/string_kunit.c:66:17: sparse: sparse: cast from unknown type
   drivers/platform/wmi/tests/string_kunit.c:82:17: sparse: sparse: undefined identifier 'u'
   drivers/platform/wmi/tests/string_kunit.c:82:17: sparse: sparse: cast from unknown type
   drivers/platform/wmi/tests/string_kunit.c:98:17: sparse: sparse: undefined identifier 'u'
   drivers/platform/wmi/tests/string_kunit.c:98:17: sparse: sparse: cast from unknown type
   drivers/platform/wmi/tests/string_kunit.c:114:17: sparse: sparse: undefined identifier 'u'
   drivers/platform/wmi/tests/string_kunit.c:114:17: sparse: sparse: cast from unknown type

vim +275 drivers/platform/wmi/tests/string_kunit.c

2d1d41298c36eb Armin Wolf 2025-12-20  274  
2d1d41298c36eb Armin Wolf 2025-12-20 @275  MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
