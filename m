Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED94C2CB
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Apr 2023 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680860200; x=1712396200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqb3NTfl7abU2XfPGyQBp6bpmUvAHDcHfvckH9PVzdg=;
  b=g7zhtW/hbAB129F+29GIuLY8wyJHirQ+rN/z5JMfIb0Tm0WeLZdRy7ul
   /6uvgJrBqFdMlq0Eq6OHqOpH4GmHCxoOp/Bo0osbe45kzMhYRPeR1tGri
   BUKnkTgEul4XTk8Znml3XCY/TpQWDVFaUvN3Mw2LAmpYGpX8ZeoiZFmcZ
   1odKjhoSh0t/PsHDWbefeKrv5Gam98eTvrAb9WhgoYRblkwZ7cwQ6VayK
   bzsGTQyQIZEIJV/qjuFovQwHNxi1XQpbbGAOAGTP75JixWrUc+It9MWkC
   Bz7ByZ7jq7i47FM8kftmEe+TW/BCe8VADwIoFOGnmMEUITTWSAy130whE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344728694"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="344728694"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 02:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798652172"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="798652172"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2023 02:36:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkiWL-000SJy-13;
	Fri, 07 Apr 2023 09:36:37 +0000
Date: Fri, 7 Apr 2023 17:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [herbert-cryptodev-2.6:master 98/105]
 drivers/crypto/intel/keembay/ocs-aes.c:1476:49-50: WARNING opportunity for
 min()
Message-ID: <202304071759.kwnt6X5h-lkp@intel.com>
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
commit: fbf31dd599875cb132d764cf4d05d7985e332c05 [98/105] crypto: keembay - Move driver to drivers/crypto/intel/keembay
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: mips-randconfig-c042-20230403 (https://download.01.org/0day-ci/archive/20230407/202304071759.kwnt6X5h-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304071759.kwnt6X5h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/keembay/ocs-aes.c:1476:49-50: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
