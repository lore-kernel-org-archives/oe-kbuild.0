Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040493;
	b=e7szkzGldP2h3Q7g42DeZISYu9qYp9hq+kiEmMwRaG9AWhcj2YkRkCFGPQYPttGfCZnR
	 OLrKDegKuL/mJaH6S8AFDfQ03Qat6CAeZSgmjSetShCMnzreAWriL+nreyGlqpPwxvzn+
	 CpBMFAGOl4nRn5x2lc0nLa3odmGC6OBLZIl1u8vRCe38Y/gWNiGOR41/nEsLqnYsUUzzD
	 GJ3xBBOpUEjR/ioI7fffpcMB+/yTJ7SQ0An9I1MmQo7EnaJuN5H+0ZPFX3nV5e7wXrmnM
	 LQuni5dhRF1IBmjM/C+Ed4SsoVz9OkxiAeRwSoMvmy1Hj0M03s9KFgselnmByDVrNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040493;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Vt6dRcC2+yJnMbdJqb6B5oofYGBZ2zL3dkPWo2luQdI=;
	b=Ls/vuhy29NwSpWHct0MtF1q+FVryNjM8Pr/pPu2MjweiNFiRP6GMaxZ9Pyq7opQcB+gf
	 gQxuzgSA4iMWlQBTwUbklcP6txw73EoH2LZGn16pFWS0TGKho4+saYQX4eBSATnZ+aRQ9
	 gykEq02b1HorZdyd0OzR0wcTs6ksDgcIZwy9aaQUM8U9gDyQgR4gqd4B3WjwHLxFBPRnx
	 f3hEnLiEi81HmhVdUGoBBGxYToGhcmSAsDBAXKBEAERTv0aNmwMqfhrCF+I99R8+/2bU8
	 GuoC43FPUP7JB8sOjy/Q7ro5eAm5NHKpad3XhveNQ6WQtnHK3V0yCTmgZDWedt2tk9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g8VYa3gq;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B9606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 22:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g8VYa3gq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795040492; x=1826576492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LU6BAAHmWcQt9x5lS93o5vTBH5t7R/K4CzZuws/LWdk=;
  b=g8VYa3gqzdlwJ616AsGbsGft751RJH/wpZL5CSQYSSgYCOulwHLGAnjd
   oKIP6/lLxc2YOB7M8yFVO4Pfnzt1mKuZS4hBCAEqUkb7u3Oif1re4RwFr
   din/Bga3Wf+d5URljKOvUiVwNTz6E4ag8cQKtKREuT5N0aTEIDfEJPAfJ
   2Z8yvg7TGYAQ6uKLVOdkO41ehhkBYxKRdEu+SbLxfNNnRaLOE51eyqWSd
   siHmjs5tfrWPdHdl0FU9VlMJUmKVd2epiitdDEKbRJ4rtykslsMEO3Sbg
   EaML2eQF033KCj1JQdsCcfzDnQES4hfpGCAGaRy7NfTG2F5lYN4VcL9zn
   w==;
X-CSE-ConnectionGUID: GOGTJl5xRcuB0oTxG5/7rg==
X-CSE-MsgGUID: 24YddkstR2yyS+R7uDUjnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3795600"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3795600"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:21:32 -0800
X-CSE-ConnectionGUID: B9nDyawtQLSBzWBlfdA3yQ==
X-CSE-MsgGUID: ydI8LGrWRtin0nM3SwHX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10529653"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 14:21:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTo1w-00000001EUg-2AyX;
	Wed, 18 Nov 2026 22:21:28 +0000
Date: Thu, 19 Nov 2026 06:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/6] tee: optee: Register TEE devices on the platform
 bus
Message-ID: <202611190518.7hwZ5tER-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab@oss.qualcomm.com>
TO: Harshal Dev <harshal.dev@oss.qualcomm.com>
TO: Eric Biggers <ebiggers@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abel Vesa <abelvesa@kernel.org>
TO: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
TO: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
TO: Sumit Garg <sumit.garg@oss.qualcomm.com>
TO: Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
CC: Basant Kumar <basantk@qti.qualcomm.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-crypto@vger.kernel.org
CC: Harshal Dev <harshal.dev@oss.qualcomm.com>

Hi Harshal,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f7df005a7564bd7ffa75da9c3085d5b996f1e16]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshal-Dev/soc-qcom-ice-Add-TZ-agnostic-re-direction-functions/20261111-194701
base:   8f7df005a7564bd7ffa75da9c3085d5b996f1e16
patch link:    https://lore.kernel.org/r/20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab%40oss.qualcomm.com
patch subject: [PATCH v2 4/6] tee: optee: Register TEE devices on the platform bus
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261119/202611190518.7hwZ5tER-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 67ab6538dff0ed2593b90166214d93e992c74905)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190518.7hwZ5tER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611190518.7hwZ5tER-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/qcom/ice.c:141:10: warning: use of bitwise '&' with boolean operands [-Wbitwise-instead-of-logical]
     141 |         return (qcom_scm_is_available() & qcom_ice_tee_is_available());
         |                ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         &&
   drivers/soc/qcom/ice.c:141:10: note: cast one or both operands to int to silence this warning
   drivers/soc/qcom/ice.c:232:5: error: redefinition of 'qcom_ice_tz_ops_register'
     232 | int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *ops)
         |     ^
   include/soc/qcom/ice.h:79:19: note: previous definition is here
      79 | static inline int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *__unused)
         |                   ^
   drivers/soc/qcom/ice.c:244:6: error: redefinition of 'qcom_ice_tz_ops_unregister'
     244 | void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *ops)
         |      ^
   include/soc/qcom/ice.h:85:6: note: previous definition is here
      85 | void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *__unused)
         |      ^
   1 warning and 2 errors generated.
--
>> drivers/firmware/qcom/qcom_ice_tee.c:440:1: error: redefinition of '__inittest'
     440 | module_platform_driver(qcom_ice_plat_driver);
         | ^
   include/linux/platform_device.h:335:2: note: expanded from macro 'module_platform_driver'
     335 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:270:3: note: expanded from macro 'module_driver'
     270 | } \
         |   ^
   include/linux/module.h:132:42: note: expanded from macro '\
   module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   drivers/firmware/qcom/qcom_ice_tee.c:415:1: note: previous definition is here
     415 | module_tee_client_driver(qcom_ice_tee_driver);
         | ^
   include/linux/tee_drv.h:334:2: note: expanded from macro 'module_tee_client_driver'
     334 |         module_driver(__tee_client_driver, tee_client_driver_register, \
         |         ^
   include/linux/device/driver.h:270:3: note: expanded from macro 'module_driver'
     270 | } \
         |   ^
   include/linux/module.h:132:42: note: expanded from macro '\
   module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/firmware/qcom/qcom_ice_tee.c:440:1: error: redefinition of 'init_module'
     440 | module_platform_driver(qcom_ice_plat_driver);
         | ^
   include/linux/platform_device.h:335:2: note: expanded from macro 'module_platform_driver'
     335 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:270:3: note: expanded from macro 'module_driver'
     270 | } \
         |   ^
   include/linux/module.h:134:6: note: expanded from macro '\
   module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   drivers/firmware/qcom/qcom_ice_tee.c:415:1: note: previous definition is here
     415 | module_tee_client_driver(qcom_ice_tee_driver);
         | ^
   include/linux/tee_drv.h:334:2: note: expanded from macro 'module_tee_client_driver'
     334 |         module_driver(__tee_client_driver, tee_client_driver_register, \
         |         ^
   include/linux/device/driver.h:270:3: note: expanded from macro 'module_driver'
     270 | } \
         |   ^
   include/linux/module.h:134:6: note: expanded from macro '\
   module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
>> drivers/firmware/qcom/qcom_ice_tee.c:440:1: error: redefinition of '__exittest'
     440 | module_platform_driver(qcom_ice_plat_driver);
         | ^
   include/linux/platform_device.h:335:2: note: expanded from macro 'module_platform_driver'
     335 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:275:3: note: expanded from macro 'module_driver'
     275 | } \
         |   ^
   include/linux/module.h:140:42: note: expanded from macro '\
   module_exit'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
   drivers/firmware/qcom/qcom_ice_tee.c:415:1: note: previous definition is here
     415 | module_tee_client_driver(qcom_ice_tee_driver);
         | ^
   include/linux/tee_drv.h:334:2: note: expanded from macro 'module_tee_client_driver'
     334 |         module_driver(__tee_client_driver, tee_client_driver_register, \
         |         ^
   include/linux/device/driver.h:275:3: note: expanded from macro 'module_driver'
     275 | } \
         |   ^
   include/linux/module.h:140:42: note: expanded from macro '\
   module_exit'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
>> drivers/firmware/qcom/qcom_ice_tee.c:440:1: error: redefinition of 'cleanup_module'
     440 | module_platform_driver(qcom_ice_plat_driver);
         | ^
   include/linux/platform_device.h:335:2: note: expanded from macro 'module_platform_driver'
     335 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:275:3: note: expanded from macro 'module_driver'
     275 | } \
         |   ^
   include/linux/module.h:142:7: note: expanded from macro '\
   module_exit'
     142 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   drivers/firmware/qcom/qcom_ice_tee.c:415:1: note: previous definition is here
     415 | module_tee_client_driver(qcom_ice_tee_driver);
         | ^
   include/linux/tee_drv.h:334:2: note: expanded from macro 'module_tee_client_driver'
     334 |         module_driver(__tee_client_driver, tee_client_driver_register, \
         |         ^
   include/linux/device/driver.h:275:3: note: expanded from macro 'module_driver'
     275 | } \
         |   ^
   include/linux/module.h:142:7: note: expanded from macro '\
   module_exit'
     142 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_ICE_TEE
   Depends on [n]: TEE [=m] && !CPU_BIG_ENDIAN [=y]
   Selected by [m]:
   - QCOM_INLINE_CRYPTO_ENGINE [=m]


vim +/__inittest +440 drivers/firmware/qcom/qcom_ice_tee.c

b7366a54413d33f Harshal Dev 2026-11-11  439  
b7366a54413d33f Harshal Dev 2026-11-11 @440  module_platform_driver(qcom_ice_plat_driver);
b7366a54413d33f Harshal Dev 2026-11-11  441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
