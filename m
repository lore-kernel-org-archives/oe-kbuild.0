Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01D13AD8
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jul 2023 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689021750; x=1720557750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRXpM8rijYi1sDoALDz7dIOILLmCzNB7ftVI4S6fJ3s=;
  b=j6HmYDSjwynZAtZc8wnb3cGSQM4WuZlC5nVBdg5k2oBUmwSuBPUJcIFN
   1MTJGw7k5WnOtaFrZ0QF1Wogj7Tq9vYiCKxKk6+ouPMY2CtWVdyMCVB0A
   OtMHbVp39e34n6HhhvjDuH7FgXI355mDsa8LlHK1huBumXmaElQ+A/RHT
   2VcvM/kLEXYTZmxcBLGLL5DdoNpaT6InANaBgLGCJoWWyOe7UiV6gDuUg
   /hqAGrSZmRwcbIYi8m1bigHWJoig6Cekb0xNXCLPar5feG5FZQ1Z28JIV
   HJKCrKqHXQucbjyrqwb8U0ctS6lpfG5TGF0RnTzqFtfypfDu7JYAFbDxJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430535480"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="430535480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 13:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786339407"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="786339407"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2023 13:42:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIxiF-0003zM-0z;
	Mon, 10 Jul 2023 20:42:27 +0000
Date: Tue, 11 Jul 2023 04:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/intel/qat/qat_common/qat_uclo.c:1989:16-17: WARNING
 opportunity for min()
Message-ID: <202307110411.3aNWs409-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f01e9fed8454dcd89727016c3e5b2fbb8f8e50c
commit: a4b16dad46576ce08ecb660fc923d0857dcae107 crypto: qat - Move driver to drivers/crypto/intel/qat
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-x053-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110411.3aNWs409-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110411.3aNWs409-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307110411.3aNWs409-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/qat/qat_common/qat_uclo.c:1989:16-17: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
