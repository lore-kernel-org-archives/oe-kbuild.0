Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595464D
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfjUcb+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703725377; x=1735261377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRT02HF770rBiZ+MQkzlIMiUYQFppC9jZiPAGMbkKw0=;
  b=nfjUcb+lVUVhPIRoBL3R6z8mkIaZ9OSGnrEfqtq4+N8EeB16pPX9OX8v
   Ec/jYp7oQ7dvvpQ8SpJB/uWZsUSTG7aYtxfFNojUgT4HO/M/kRVzWR8f/
   uBQkLOAuPDm006Kl+Wyih4Ws7Vqs8gkP4MNe94yP0H3tjDTArDipRiB4k
   +S021FA0dpH0vTGtImCIHNsmm1vqBRzlwKtF+X8vQxWcf00hGEYgaAqzT
   KiYbqxo4ZCtBZ7qtq3GdYmwIIKCnYfnakiDQqTHdFD7CgzxkE7QexcuR7
   WHUJfDAO5ivQ4tFKKaNmHfxFzKtMJT0lK6rbxxYwzidh1ERvbPJCG74bc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="396223121"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="396223121"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 17:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="1025528432"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="1025528432"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2023 17:02:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIenV-000Fun-20;
	Thu, 28 Dec 2023 01:02:53 +0000
Date: Thu, 28 Dec 2023 09:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add Himax HX83102J touchscreen
Message-ID: <202312280837.b2PFmd9W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/input/himax,hx83102j.yaml:1:58: [error] wrong new line character: expected \n (new-lines)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <SEZPR06MB56080820EE51CBAE9C6B6B3E9E9FA@SEZPR06MB5608.apcprd06.prod.outlook.com>
References: <SEZPR06MB56080820EE51CBAE9C6B6B3E9E9FA@SEZPR06MB5608.apcprd06.prod.outlook.com>
TO: "Allen_Lin" <allencl_lin@hotmail.com>
TO: dmitry.torokhov@gmail.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: jikos@kernel.org
TO: benjamin.tissoires@redhat.com
TO: linux-input@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: "Allen_Lin" <allencl_lin@hotmail.com>

Hi Allen_Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen_Lin/Input-Add-Himax-HX83102J-touchscreen-driver/20231227-133817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/SEZPR06MB56080820EE51CBAE9C6B6B3E9E9FA%40SEZPR06MB5608.apcprd06.prod.outlook.com
patch subject: [PATCH v3 1/2] dt-bindings: input: Add Himax HX83102J touchscreen
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231228/202312280837.b2PFmd9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312280837.b2PFmd9W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/himax,hx83102j.yaml:1:58: [error] wrong new line character: expected \n (new-lines)

vim +1 Documentation/devicetree/bindings/input/himax,hx83102j.yaml

b6f7a8833439cc Allen_Lin 2023-12-27 @1  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
