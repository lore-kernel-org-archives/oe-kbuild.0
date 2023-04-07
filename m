Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B33EBC
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Apr 2023 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680857147; x=1712393147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YrJ+rrkuSlWujRL4JmjIFhtLilk0nCa1oBe8J11Gqw=;
  b=Zrx2ZLVSnYXHf321WHEJDT04iOaqAFo3JklBWlARYo+XodSGQjrXzx99
   gXFPQokToqdnOh3nURqpclMbogu//m9xagRT3YPdhDcCUz99zfrRSwcHJ
   7CjR0pjDA68y1MWDzNV1vpuYkLVbPKJoybc46iTLGPOw//cQRHSkSvR8y
   /K8m7sR5Zm5dod0BmRaTXEQDX/ElcooltIvH0ThS4VbydxDPjNESHUzYb
   gSTpl2pijVL82gGplB/8emZPvnetDiNP/uWe+i56pDsafStf1DMzsg0S5
   HGq0Wg3+heiSbUfBQYD+EIQ1xFiGUYvU38tVm2/GgFaLzCL3bLi3JcPkU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429238612"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="429238612"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 01:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637642369"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="637642369"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 01:45:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkhix-000SHe-2s;
	Fri, 07 Apr 2023 08:45:35 +0000
Date: Fri, 7 Apr 2023 16:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [herbert-cryptodev-2.6:master 100/105]
 drivers/crypto/intel/qat/qat_common/qat_compression.c:238:24-25: WARNING
 opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)
Message-ID: <202304071641.sPgxWaXT-lkp@intel.com>
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
CC: linux-crypto@vger.kernel.org
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   a2216e1874715a8b4a6f4da2ddbe9277e5613c49
commit: a4b16dad46576ce08ecb660fc923d0857dcae107 [100/105] crypto: qat - Move driver to drivers/crypto/intel/qat
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: csky-randconfig-c004-20230405 (https://download.01.org/0day-ci/archive/20230407/202304071641.sPgxWaXT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304071641.sPgxWaXT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/qat/qat_common/qat_compression.c:238:24-25: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)
--
>> drivers/crypto/intel/qat/qat_common/qat_uclo.c:1989:16-17: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
