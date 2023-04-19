Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB9320C
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 23:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681947129; x=1713483129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UI5tc+rQMspgVmIUxvXnrw48obb5xLudv13emeypTTQ=;
  b=ZgWNlCRdQ4u1gqeaLXzGO7T6E5SdN2PsKdSdIYNkNVxtpT3qEVjXKeqK
   Fwvep1hipainD2fUxpr3lj5VAww6du5ZDwCnTfHFg5l+OioHjQbxtI/Ap
   LBReURh/q4vwP9Po43PMlA00fN4wE9CMthjuWi6JsBmJ1O8ypyNImAQP5
   ciVnNPur64kFnHiJ+WVnOWq9JzKuR7Vzz9AZP4FfPeif4mf/5i3tomlPj
   ql7lJ5MNncuFuGW3D5znftm84k3/VD9eznlL+h6qt2OGA8u+3xx/sr2lS
   Beaet9EESWO8XtCelbnd83uswtf9zRWUXK3NwRR+gFEzGxT8NHbp/JcT4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410821355"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="410821355"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 16:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760919262"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="760919262"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 16:32:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppHHS-000fH0-1J;
	Wed, 19 Apr 2023 23:32:06 +0000
Date: Thu, 20 Apr 2023 07:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6897/13075] drivers/tee/optee/smc_abi.c:1021
 irq_handler() error: uninitialized symbol 'value_valid'.
Message-ID: <202304200755.OoiuclDZ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Etienne Carriere <etienne.carriere@linaro.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Sumit Garg <sumit.garg@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: b3b4ced12c1bc829888803ce07fff317e590ec1c [6897/13075] optee: add per cpu asynchronous notification
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304200755.OoiuclDZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304200755.OoiuclDZ-lkp@intel.com/

smatch warnings:
drivers/tee/optee/smc_abi.c:1021 irq_handler() error: uninitialized symbol 'value_valid'.
drivers/tee/optee/smc_abi.c:1028 irq_handler() error: uninitialized symbol 'value_pending'.

vim +/value_valid +1021 drivers/tee/optee/smc_abi.c

6749e69c4dadd3 Jens Wiklander   2021-06-15  1010  
b3b4ced12c1bc8 Etienne Carriere 2023-03-22  1011  static irqreturn_t irq_handler(struct optee *optee)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1012  {
6749e69c4dadd3 Jens Wiklander   2021-06-15  1013  	bool do_bottom_half = false;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1014  	bool value_valid;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1015  	bool value_pending;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1016  	u32 value;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1017  
6749e69c4dadd3 Jens Wiklander   2021-06-15  1018  	do {
6749e69c4dadd3 Jens Wiklander   2021-06-15  1019  		value = get_async_notif_value(optee->smc.invoke_fn,
6749e69c4dadd3 Jens Wiklander   2021-06-15  1020  					      &value_valid, &value_pending);
6749e69c4dadd3 Jens Wiklander   2021-06-15 @1021  		if (!value_valid)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1022  			break;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1023  
6749e69c4dadd3 Jens Wiklander   2021-06-15  1024  		if (value == OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1025  			do_bottom_half = true;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1026  		else
6749e69c4dadd3 Jens Wiklander   2021-06-15  1027  			optee_notif_send(optee, value);
6749e69c4dadd3 Jens Wiklander   2021-06-15 @1028  	} while (value_pending);
6749e69c4dadd3 Jens Wiklander   2021-06-15  1029  
6749e69c4dadd3 Jens Wiklander   2021-06-15  1030  	if (do_bottom_half)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1031  		return IRQ_WAKE_THREAD;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1032  	return IRQ_HANDLED;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1033  }
6749e69c4dadd3 Jens Wiklander   2021-06-15  1034  

:::::: The code at line 1021 was first introduced by commit
:::::: 6749e69c4dadd352bdfdb306513aa48cc15fbdd6 optee: add asynchronous notifications

:::::: TO: Jens Wiklander <jens.wiklander@linaro.org>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
