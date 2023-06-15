Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851174431
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jun 2023 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686816631; x=1718352631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Ol7srSXUuED1Ss7Cg2By0C9C9wWKCBvsMRrFZLu0Xs=;
  b=NqUTBbh6C6Pdt4uxagIcFSeiRe7yGO8TWjG83HONE95t6M9EnXFSPLkT
   cpcif1Q5Q107QrfNT9+KA3erS9HxozhT0uNMg6P2xUZIE1ivivzLIITik
   g8fFQ8HvKkLPLTE4BOOcA7+G1aFPLDH+CxcHEvs6qtUrWzgi829pdGVW8
   fFyLQWHWJYBwScOqeiXSLWDraJhYFfq/Lb6bPkqLRmjEkbBPtrZih0EwF
   SbKNYcFQ34TecYfP6IZaXJ/e2Ckc1H/d3F3QrpobNmaM8hzgwctte/mTI
   XsLBr4XbbQH3j/dHCDXozi4ygH/CuugTh179KiilayW0/zfdq/VsMq5Io
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339192914"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="339192914"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 01:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="856836621"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="856836621"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2023 01:10:09 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9i3P-0001dn-2S;
	Thu, 15 Jun 2023 08:10:09 +0000
Date: Thu, 15 Jun 2023 16:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/fam01-next20230613 4/5]
 drivers/gpu/drm/i915/i915_utils.h:149:28: error: array subscript 16 is above
 array bounds of 'struct intel_uncore_forcewake_domain *[16]'
Message-ID: <202306151649.iVRCpvz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/i915/i915_utils.h:149:28: error: array subscript 16 is above array bounds of 'struct intel_uncore_forcewake_domain *[16]' [-Werror=array-bounds]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fam01-next20230613
head:   aa6560431480d8a66646dee2f0a2185073a11282
commit: b41b9f343ecdc793e09bea7ead9e0eed1e9b97fe [4/5] Makefile: Enable -Warray-bounds
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-s023-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151649.iVRCpvz3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=b41b9f343ecdc793e09bea7ead9e0eed1e9b97fe
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fam01-next20230613
        git checkout b41b9f343ecdc793e09bea7ead9e0eed1e9b97fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306151649.iVRCpvz3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/intel_context_types.h:17,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_drv.h:42,
                    from drivers/gpu/drm/i915/intel_uncore.c:30:
   drivers/gpu/drm/i915/intel_uncore.c: In function 'fw_domain_fini':
>> drivers/gpu/drm/i915/i915_utils.h:149:28: error: array subscript 16 is above array bounds of 'struct intel_uncore_forcewake_domain *[16]' [-Werror=array-bounds]
     149 |         typeof(*ptr) __T = *(ptr);                                      \
         |                            ^~~~~~
   drivers/gpu/drm/i915/intel_uncore.c:2258:13: note: in expansion of macro 'fetch_and_zero'
    2258 |         d = fetch_and_zero(&uncore->fw_domain[domain_id]);
         |             ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:26,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18:
   drivers/gpu/drm/i915/intel_uncore.h:188:12: note: while referencing 'fw_domain'
     188 |         } *fw_domain[FW_DOMAIN_ID_COUNT];
         |            ^~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:150:9: error: array subscript 16 is above array bounds of 'struct intel_uncore_forcewake_domain *[16]' [-Werror=array-bounds]
     150 |         *(ptr) = (typeof(*ptr))0;                                       \
         |         ^~~~~~
   drivers/gpu/drm/i915/intel_uncore.c:2258:13: note: in expansion of macro 'fetch_and_zero'
    2258 |         d = fetch_and_zero(&uncore->fw_domain[domain_id]);
         |             ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_uncore.h:188:12: note: while referencing 'fw_domain'
     188 |         } *fw_domain[FW_DOMAIN_ID_COUNT];
         |            ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +149 drivers/gpu/drm/i915/i915_utils.h

0ce81788080570 Chris Wilson 2017-05-17  147  
b7163936bd99da Chris Wilson 2017-01-05  148  #define fetch_and_zero(ptr) ({						\
b7163936bd99da Chris Wilson 2017-01-05 @149  	typeof(*ptr) __T = *(ptr);					\
b7163936bd99da Chris Wilson 2017-01-05  150  	*(ptr) = (typeof(*ptr))0;					\
b7163936bd99da Chris Wilson 2017-01-05  151  	__T;								\
b7163936bd99da Chris Wilson 2017-01-05  152  })
b7163936bd99da Chris Wilson 2017-01-05  153  

:::::: The code at line 149 was first introduced by commit
:::::: b7163936bd99dab90a71c2496295f62f2b4874ab drm/i915: Move a few more utility macros to i915_utils.h

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
