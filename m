Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDB1BDCF
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Aug 2024 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078870; cv=none; b=e5C2uA5aykc1FFUeyMsavWDCahe8hkym9SO1d0N7TM876UknYgcOA+7Uoa1SMybBhVKXv6zys1LDZxLTF+DhoEAXcq+tvEB7qzg+siuOUzo+YrLg1qx2iN/B/qIzW9eODySgTcihn0baciPJXH3OlfO1OziJhnpUgzhcc976xA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078870; c=relaxed/simple;
	bh=bkoLWN2A/59FjqGMN6uo5PJCOEmHRJ1xdP05wAaiUO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GeFKOIT+ki2Tciq84pP7nVhtiad/7iVcEQintaFoMtw6lpCOowICFmGkoizNQic9mrJgMJnkJH8y/L1WKBd1nDNeqQk2Z7F/m4YbrdokSkKpuPRVDv9a3jWb7MBf7n638TJXX0XbGCxxAS1xyovnTLkNaLlbWqNO6qZgcbcSq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnneGicD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnneGicD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724078868; x=1755614868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkoLWN2A/59FjqGMN6uo5PJCOEmHRJ1xdP05wAaiUO8=;
  b=TnneGicDAYIZewVR3xoiQ/hsZyCSOHhYVqfqQgNUoPDqMwiaB13ypFtV
   W4fzLTXuJiSAWL1Uxj6lWtROvbpq97pQR0KQJurJV80vUamlSUIMfEoQm
   8EeKPMAkUJ5fd8kPqxTVi58WyKITU57EiiPceBG0b1rGDrPzIlE2vrPVg
   Uw6JMqdyWo4li47nWdd+0gfOTLQ4Swa7B/kRnXXgJx/xKAJn0a0g/4wIw
   rQM1ANC6TGgEPM+lgVjgcwINLcduoxIL0y+havtIAjHt2mYosgoaNlK5U
   dI0tTy1q7k1T2Gmz8sbC8uOZkZFXDkfoTaMCMwya+zGPn9DT7D3X3kw8j
   w==;
X-CSE-ConnectionGUID: vH5/qds4SVutYMjLbcYPiQ==
X-CSE-MsgGUID: IoAE30NqQzm4k382mX0twA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="32902442"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="32902442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 07:47:48 -0700
X-CSE-ConnectionGUID: 3uWMXg00RUCLF2uOha1JbA==
X-CSE-MsgGUID: ZFkXM4jKS6qd+7S8lrP7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60445615"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Aug 2024 07:47:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg3fc-00095O-2w;
	Mon, 19 Aug 2024 14:47:44 +0000
Date: Mon, 19 Aug 2024 22:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] lib/math: Add int_pow test suite
Message-ID: <202408192201.0d5F9l1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/math/tests/int_pow_kunit.c:22:18: sparse: sparse: decimal constant 9223372036854775808 is too big for long long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240819014115.221135-1-luis.hernandez093@gmail.com>
References: <20240819014115.221135-1-luis.hernandez093@gmail.com>
TO: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
TO: brendan.higgins@linux.dev
TO: davidgow@google.com
TO: rmoar@google.com
CC: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
CC: linux-kselftest@vger.kernel.org
CC: kunit-dev@googlegroups.com
CC: skhan@linuxfoundation.org
CC: linux-kernel-mentees@lists.linuxfoundation.org

Hi Luis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11-rc4]
[also build test WARNING on linus/master next-20240819]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Felipe-Hernandez/lib-math-Add-int_pow-test-suite/20240819-094252
base:   v6.11-rc4
patch link:    https://lore.kernel.org/r/20240819014115.221135-1-luis.hernandez093%40gmail.com
patch subject: [PATCH v2] lib/math: Add int_pow test suite
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-122-20240819 (https://download.01.org/0day-ci/archive/20240819/202408192201.0d5F9l1Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192201.0d5F9l1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408192201.0d5F9l1Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/math/tests/int_pow_kunit.c:22:18: sparse: sparse: decimal constant 9223372036854775808 is too big for long long
   lib/math/tests/int_pow_kunit.c:22:18: sparse: sparse: decimal constant 9223372036854775808 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +22 lib/math/tests/int_pow_kunit.c

8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  12  
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  13  static const struct test_case_params params[] = {
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  14  	{ 64, 0, 1, "Power of zero" },
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  15  	{ 64, 1, 64, "Power of one"},
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  16  	{ 0, 5, 0, "Base zero" },
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  17  	{ 1, 64, 1, "Base one" },
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  18  	{ 2, 2, 4, "Two squared"},
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  19  	{ 2, 3, 8, "Two cubed"},
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  20  	{ 5, 5, 3125, "Five raised to the fith power" },
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  21  	{ U64_MAX, 1, U64_MAX, "Max base" },
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18 @22  	{ 2, 63, 9223372036854775808, "Large result"},
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  23  };
8e9c35f8cad072 Luis Felipe Hernandez 2024-08-18  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
