Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050613C8F4
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Aug 2024 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724739180; cv=none; b=TP4SwQGRc2V3TTIaEO31kZrs4TrbUmeWtFKZQLK/V4eIsM6m4tGpFSYm0oge9qvbiXnGMwuauwLQJasWpRroblQD02RD8G+T5ZPF6JIcknakzMGCEJvCZj/njUYvZUQTKbPt9EPI/kuG/bi/cB29DCWdNp6bCkEekHzDprNTvd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724739180; c=relaxed/simple;
	bh=m81a9Xzy+8PzOPED9tR7PeNFkJBPoXsPZ/xnCq8/iUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpJsJ/cqhjv0Ig4dnt5Ny0/vClSZQ2rfiL3zGfmUzBkXgtpXe2LhhkbXcfWhFiYAXJwkEk+Fznc3+VhwfklghKLi0PXgj3Xt0/svxWxYa3L5i16XXAn1KFu2CkAV2Iqa0tmjonEI0wBdcux8mW9Os0uLRJl/Tu1F0gcz95CFRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gegqNK6f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gegqNK6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724739178; x=1756275178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m81a9Xzy+8PzOPED9tR7PeNFkJBPoXsPZ/xnCq8/iUU=;
  b=gegqNK6fpiRux+Ar3YxYTnLNrpFygG44/HsTrxkcdFJVInAKVsIEgiJz
   ppws2AhRODlj/RsWy6pxS/AWkFMiFlHBG3t8k7EEvcb1nuob5GjoEXASB
   Ej8iz7UCZbDiOZ2UxQAHfo/XMPFOhDZV4r+Whw4RmAKsvEw2VQQOo2WxS
   oocSy4fVMDKqDgeSxYI55R7VXvuqqmDZzE/Mq+SavkVDOUE9HFRza395F
   l2kunc74UN3O81S1ppwoKcqtFBrit1zWABWjfpK8jLb9zjEoiqxA1Y+b7
   oYxFfvbVbYNquWcoTHXPeJErbK3tbh5WdMkFNfy/tx3He7xUP0l8pAnG8
   g==;
X-CSE-ConnectionGUID: LYbLpVIrTJiuNsjztT49IQ==
X-CSE-MsgGUID: e5mp0ckOSsyBgBakmfz4Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23078726"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="23078726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 23:12:57 -0700
X-CSE-ConnectionGUID: 414br7VOTseQuFcWmGLsVw==
X-CSE-MsgGUID: 3T5mTF7AR22FxOGa/FhLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="85936194"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2024 23:12:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sipRm-000I6M-1H;
	Tue, 27 Aug 2024 06:12:54 +0000
Date: Tue, 27 Aug 2024 14:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] selftests:tdx:Use min macro
Message-ID: <202408271330.HMq39DWo-lkp@intel.com>
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
In-Reply-To: <20240822044630.1267500-1-yanzhen@vivo.com>
References: <20240822044630.1267500-1-yanzhen@vivo.com>
TO: Yan Zhen <yanzhen@vivo.com>
TO: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: opensource.kernel@vivo.com
CC: Yan Zhen <yanzhen@vivo.com>

Hi Yan,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhen/selftests-tdx-Use-min-macro/20240822-125041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240822044630.1267500-1-yanzhen%40vivo.com
patch subject: [PATCH v1] selftests:tdx:Use min macro
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271330.HMq39DWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408271330.HMq39DWo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tdx_guest_test.c:121:14: error: call to undeclared function 'min'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |                 line_len = min((len - j), rowsize);
         |                            ^
   1 error generated.


vim +/min +121 tools/testing/selftests/tdx/tdx_guest_test.c

00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  111  
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  112  static void print_array_hex(const char *title, const char *prefix_str,
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  113  			    const void *buf, int len)
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  114  {
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  115  	int i, j, line_len, rowsize = HEX_DUMP_SIZE;
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  116  	const __u8 *ptr = buf;
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  117  
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  118  	printf("\t\t%s", title);
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  119  
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  120  	for (j = 0; j < len; j += rowsize) {
712bf3fd186eaf Yan Zhen                   2024-08-22 @121  		line_len = min((len - j), rowsize);
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  122  		printf("%s%.8x:", prefix_str, j);
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  123  		for (i = 0; i < line_len; i++)
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  124  			printf(" %.2x", ptr[j + i]);
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  125  		printf("\n");
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  126  	}
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  127  
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  128  	printf("\n");
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  129  }
00e07cfbdf0b23 Kuppuswamy Sathyanarayanan 2022-11-16  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
