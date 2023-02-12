Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AEEDE
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 03:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676173296; x=1707709296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VOJ2Ay88ivARs8CHxC2CcrNqeL7krr06lMh4GNLpas=;
  b=PLTH0SDzKjmzvZj6V5pRIzEhEve1oyuCw8uvg0jggE4aVY/Yu3yGIPcy
   7R5adgEaRD1j+xl3zHjuapg1tjsL493Y2RxE/IOLd2rVdDDeVuzM69Xag
   sYvbWla15IdLreCSgKBG4I14hNFh6V3H81xal5VEDwZv++HIW58Q4h5In
   ITCJ4qVHQxxFuvUllcJW1dZnx5dVRUla6Uy2J6JivHN+W33FHlTvmkCw9
   UOpVAFTf9udA++iFbU+FrDqcVuicbV9QiHzC26x9tpUrQPqFpuL3i6hiy
   vsrB0MiDDYcd1hbaF51W+NPr0B0zqSR2UIqal/ykz47PIzKYdqWO1DZ3U
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="331993311"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="331993311"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 19:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="792370014"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="792370014"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Feb 2023 19:41:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR3F8-00070v-1k;
	Sun, 12 Feb 2023 03:41:34 +0000
Date: Sun, 12 Feb 2023 11:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/qat/qat_common/qat_compression.c:238:24-25: WARNING
 opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)
Message-ID: <202302121127.u0a27G8S-lkp@intel.com>
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
TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Wojciech Ziemba <wojciech.ziemba@intel.com>
CC: Adam Guerin <adam.guerin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f339c2597ebb00e738f2b6328c14804ed19f5d57
commit: 1198ae56c9a520384dcf53f01cd9adecd73751d0 crypto: qat - expose deflate through acomp api for QAT GEN2
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230212/202302121127.u0a27G8S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302121127.u0a27G8S-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/qat/qat_common/qat_compression.c:238:24-25: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
