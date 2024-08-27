Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178C1D551
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Aug 2024 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767886; cv=none; b=LxMdJuzcPCNyVPLP84OQpVRaQOlLCHaT+eXONs1VAtW2BS87imsNPqLviJ9ASy/UBmozOZoPhvq0/XLXQylGDtVceb53cv46C62fcPopJ4nksykcONgwvxGs0xqosZfUZBF8gYXvwUAzNaAfnKU0ylpanTiD/k017OATtgrw9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767886; c=relaxed/simple;
	bh=4NUOP2zZOj+K7UTvamMSS48aUyQt9ktDE97D3edMlC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=quNprUJeLUQQXl6BE4kvwiaeayC6LFj7l4hUKmyhQ97mB8iSIid/dGnXcdp3xszILK3bAUQ6bHxMqpgNsPQAE3Y71Fat3edeGqVTyzppX8k34YQDZrFd0fs8pgm8fXlU5uMTFcUgaOUYNLkTOcAahznHmCIVjfGLU+9GI1kHrks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcPNDbld; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcPNDbld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724767885; x=1756303885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NUOP2zZOj+K7UTvamMSS48aUyQt9ktDE97D3edMlC4=;
  b=LcPNDbld1KtK47HoeE1+62YnY8LnYtIIh8wkkdiV3/F6cbSqGvlFY+HJ
   FRSXIvBFhp2mJ1t3Zfg42XRHyj7xmW2ujhvjOEqpznQ9x6ax4RED4+Yjf
   SecDSlrxBahYsqXZwP9K/Jrl2WG6qyJV6f663dHCngW8v2RlRVzAZbCB9
   jX0H2jUHf6CF1Pej1oOG41ecfo3DGy4YvaWYUaqDHVVpzzfyIpumkLUE3
   c8HzT7HlMxmH7s/anNaMs5unatzLmJXOypZmoE8SEmm6gTc5JhwbFiy12
   2ON+u4uzgHdkahgwCPFjzuXzIde36DduSTTgqkm17qukYJkSkshqRlk15
   Q==;
X-CSE-ConnectionGUID: 5Nq2alSmQjOtJol+HqiE9g==
X-CSE-MsgGUID: nnMwvEUHRQmRIh87wB/vOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27132572"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="27132572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 07:11:24 -0700
X-CSE-ConnectionGUID: 8rH8SwRUQHGWatwHS/1OFw==
X-CSE-MsgGUID: glANb/1fSDK0iJstItTBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="100382984"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Aug 2024 07:11:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siwun-000IjL-1G;
	Tue, 27 Aug 2024 14:11:21 +0000
Date: Tue, 27 Aug 2024 22:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] selftests:tdx:Use min macro
Message-ID: <202408272101.5KcD2Go4-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.11-rc5 next-20240827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhen/selftests-tdx-Use-min-macro/20240822-125041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240822044630.1267500-1-yanzhen%40vivo.com
patch subject: [PATCH v1] selftests:tdx:Use min macro
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408272101.5KcD2Go4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408272101.5KcD2Go4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tdx_guest_test.c: In function 'print_array_hex':
>> tdx_guest_test.c:121:28: warning: implicit declaration of function 'min' [-Wimplicit-function-declaration]
     121 |                 line_len = min((len - j), rowsize);
         |                            ^~~


vim +/min +121 tools/testing/selftests/tdx/tdx_guest_test.c

00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  111  
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  112  static void print_array_hex(const char *title, const char *prefix_str,
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  113  			    const void *buf, int len)
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  114  {
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  115  	int i, j, line_len, rowsize = HEX_DUMP_SIZE;
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  116  	const __u8 *ptr = buf;
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  117  
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  118  	printf("\t\t%s", title);
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  119  
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  120  	for (j = 0; j < len; j += rowsize) {
712bf3fd186eafb Yan Zhen                   2024-08-22 @121  		line_len = min((len - j), rowsize);
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  122  		printf("%s%.8x:", prefix_str, j);
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  123  		for (i = 0; i < line_len; i++)
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  124  			printf(" %.2x", ptr[j + i]);
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  125  		printf("\n");
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  126  	}
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  127  
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  128  	printf("\n");
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  129  }
00e07cfbdf0b232 Kuppuswamy Sathyanarayanan 2022-11-16  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
