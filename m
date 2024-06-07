Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8763152164
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Jun 2024 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742137; cv=none; b=KCbwRmviUaPsjwiF2URNDNi4Z5jcQi13hlbXXabM22GUhLPnkR4ehE5qZLvrdfp/KjDTWm4Uv5+CS3KpO0A2zfDfHsh7yBWEQlTsl2dPNYJ7SSSrRkSQ0tO1ZXzBJ4BVXsuNhSr/k48TbA403UClkHwRo21JBqxbU62AEBZtCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742137; c=relaxed/simple;
	bh=CxvRRlElHHlZ5JRLatBY3lPyHJovTtutg8/J3U/AxuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEkJKuNgEoYu/cZM4kb/V/RRp5amJiutNiV5McyGzlcBEiT7X5SqHZw/1EkLbdOvKSoAcFVGPBGJjT6S45WB8H5jEtTaN2gbKVUaCGzsHBeSMQVLt82IolpPhZX0ar5FZW1cRziAjqg8z9G35cEov4iU+RYMitrf5dM58uxv4Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX1GSbcp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX1GSbcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717742136; x=1749278136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxvRRlElHHlZ5JRLatBY3lPyHJovTtutg8/J3U/AxuE=;
  b=nX1GSbcp0fuzRffQSYhqu55uA5WtCjErCAMRr/SmdP0jkGIsJ7ZrPnlE
   Acu5YxMPYPptZuAkd68nAG5xcgDuuOviHkyD67JskVFsOZg+6Y8G4pGKi
   Zp2Jg/mSoIu6/TXryQ8n1ncZt5XxZFCY/QE6y2WRFCQEbtbGdNw/0nMRZ
   fp0Tr6DEyvMk/JZDWVL+yjmqiyMIPLAs4Y/oBlPAAePsSbmBpWsIKz1zg
   NUIpyoiaOAQ/Pow5D66eOuMDAMyWkzF+CatBofcCsGhkz/osCOuGq4DhW
   ICaNkzU/8jxaY7b7BTDi5Tl/5YqEsiYtfj+nDSR5K1UR68z81JKKinILM
   w==;
X-CSE-ConnectionGUID: gGbHfx66RBalU4s6qt1jaQ==
X-CSE-MsgGUID: hL4LuhcCQXaWG13lMUeA/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14289726"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14289726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 23:35:35 -0700
X-CSE-ConnectionGUID: cBcnwtSsTNSLddt4bGUTHw==
X-CSE-MsgGUID: iysSGraEQTWejuq/PduY6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="69389931"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jun 2024 23:35:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFTCG-0004Ao-0m;
	Fri, 07 Jun 2024 06:35:32 +0000
Date: Fri, 7 Jun 2024 14:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 111/126]
 drivers/mailbox/mtk-cmdq-sec-tee.c:172:2-8: preceding lock on line 158
Message-ID: <202406071437.bg3BwASr-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   bb84077a7f2f0e6433f0c71d35738db6fcfca976
commit: a0f3bf1449bdfbea99babee760c8886ee574e42a [111/126] BACKPORT: FROMLIST: mailbox: mediatek: Add CMDQ secure mailbox driver
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-r062-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071437.bg3BwASr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406071437.bg3BwASr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mailbox/mtk-cmdq-sec-tee.c:172:2-8: preceding lock on line 158
--
>> drivers/mailbox/mtk-cmdq-sec-mailbox.c:219:58-62: ERROR: invalid reference to the index variable of the iterator on line 201

vim +172 drivers/mailbox/mtk-cmdq-sec-tee.c

a0f3bf1449bdfb Jason-jh Lin 2024-05-27  149  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  150  int cmdq_sec_execute_session(struct cmdq_sec_tee_context *tee, u32 cmd, s32 timeout_ms)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  151  {
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  152  #if IS_ENABLED(CONFIG_TEE)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  153  	struct tee_ioctl_invoke_arg invoke_arg = {0};
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  154  	struct tee_param params = {0};
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  155  	u64 ts = sched_clock();
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  156  	int ret = 0;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  157  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27 @158  	mutex_lock(&cmdq_sec_exec_lock);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  159  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  160  	params.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  161  	params.u.memref.shm = tee->shared_mem;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  162  	params.u.memref.shm_offs = 0;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  163  	params.u.memref.size = tee->shared_mem->size;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  164  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  165  	invoke_arg.num_params = 1;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  166  	invoke_arg.session = tee->session;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  167  	invoke_arg.func = cmd;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  168  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  169  	ret = tee_client_invoke_func(tee->tee_context, &invoke_arg, &params);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  170  	if (ret) {
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  171  		pr_err("tee_client_invoke_func failed, ret=%d\n", ret);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27 @172  		return -EFAULT;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  173  	}
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  174  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  175  	ret = invoke_arg.ret;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  176  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  177  	mutex_unlock(&cmdq_sec_exec_lock);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  178  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  179  	ts = div_u64(sched_clock() - ts, 1000000);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  180  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  181  	if (ret != 0)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  182  		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  183  	else if (ts > timeout_ms)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  184  		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  185  	else
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  186  		pr_debug("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  187  
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  188  	return ret;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  189  #else
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  190  	return -EFAULT;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  191  #endif
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  192  }
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  193  EXPORT_SYMBOL_GPL(cmdq_sec_execute_session);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  194  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
