Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E54398F5
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929420; cv=none; b=nnP1M2mVHzdfmEvORZ66d6LcfYS42EE4/gVQc/wLZnvKTJXwFfr8xXtu/Ny7oUwKtpCGHYe6o88F8Yc5X62JbkZ4zP1lR5o+guYe2mScka7x+Vmn1eyvKfILOIbB24ZkIuVYm5BpmgXYZtiEXWtLMGlOek5p572cHmpaOGBz/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929420; c=relaxed/simple;
	bh=ZU1HE0iWarZHWS6qyydEWTg/EgUfF2w2fIrgyeQpVr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kcIimz/R/wGK2agdt1mTfMHpTQWdNLjkfk7RYvMPgZzE2Q5XgrfxmqGhioqsi5L7bF4ygKo/IfWwcBnvypyOLI+QaZy3+/ADrSnrYkFyAJekr1kKr3Q7ptKJ/mGzOom/8ORn/rAVKtc3J6ArunW44sacWqkcl0CezEP6SqJj4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cU13OKVW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cU13OKVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790929420; x=1822465420;
  h=date:from:to:cc:subject:message-id;
  bh=ZU1HE0iWarZHWS6qyydEWTg/EgUfF2w2fIrgyeQpVr0=;
  b=cU13OKVWaSUebtO0XrspUhX2tk1+U2YmWtun+VegyVdzcb7ebhI8OPCs
   ep2PsH7jgapX0E15jBGgdHDZ5CjvgCATqumMWxTaVF13aGE0jXfuQ2oQj
   SvOry+vPuwc+ShO1HT1LjzVUaVX4l93xIjIBUtPYlqdHvWBRWuhLDJWXo
   pbJk4sItv81omxzMCB9A+yVFONdM3me+Krw7Kpr/hPgz/3j55unOoPWQS
   pZ/Kr0UHVSx0dLFmzgJSNlBQvL9Gic1iBX/hjB7kgBVPBMPH/qCgmNk0D
   +tGRHdHgHxlJJmAh26quVE4Mq81Pd7hvlqDAF/VQIkDCcdz62dQtogB33
   w==;
X-CSE-ConnectionGUID: pLra1nTbTjyq3cbGVmjlPw==
X-CSE-MsgGUID: yvw+hBSEQGiCEu5t+dAF7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90554128"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90554128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:23:39 -0700
X-CSE-ConnectionGUID: rZXfAWv3RCyhi9/Bm+D3Mg==
X-CSE-MsgGUID: /RU322nzQNCRJeQVQnJikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="276260122"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Oct 2026 01:23:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCYYJ-00000000Sn7-3mXx;
	Fri, 02 Oct 2026 08:23:35 +0000
Date: Fri, 02 Oct 2026 16:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/firmware/qcom/qcom_tee_uefisecapp.c:377:26: warning:
 argument to variable-length array is too large
Message-ID: <202610021602.UwZY1OqZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233, commit: b59502937f7cb9085e9c5daf5541dc8f0e1286dc"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Harshal Dev <harshal.dev@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233
head:   b59502937f7cb9085e9c5daf5541dc8f0e1286dc
commit: b59502937f7cb9085e9c5daf5541dc8f0e1286dc firmware: qcom: Add support for TEE based EFI-var client driver
date:   21 hours ago
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021602.UwZY1OqZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021602.UwZY1OqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021602.UwZY1OqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'qcuefi_query_variable_info',
       inlined from 'qcomtee_uefi_query_variable_info' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:421:8:
>> drivers/firmware/qcom/qcom_tee_uefisecapp.c:377:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     377 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:377:26: note: limit is 1 bytes, but argument is 64
   drivers/firmware/qcom/qcom_tee_uefisecapp.c: In function 'qcuefi_get_next_variable':
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:284:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     284 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:284:26: note: limit is 1 bytes, but argument is 128
   In function 'qcuefi_set_variable',
       inlined from 'qcomtee_uefi_set_variable' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:269:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:223:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     223 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:223:26: note: limit is 1 bytes, but argument is 128
   In function 'qcuefi_get_variable',
       inlined from 'qcomtee_uefi_get_variable' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:198:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:134:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     134 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:134:26: note: limit is 1 bytes, but argument is 160
   In function 'qcomtee_get_client_env_obj',
       inlined from 'qcomtee_uefisecapp_probe' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:571:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:521:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     521 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:521:26: note: limit is 1 bytes, but argument is 64
   In function 'qcomtee_get_uefisec_svc_obj',
       inlined from 'qcomtee_uefisecapp_probe' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:580:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:482:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     482 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:482:26: note: limit is 1 bytes, but argument is 64


vim +377 drivers/firmware/qcom/qcom_tee_uefisecapp.c

b59502937f7cb90 Harshal Dev 2026-10-01  367  
b59502937f7cb90 Harshal Dev 2026-10-01  368  static int qcuefi_query_variable_info(u32 attributes,
b59502937f7cb90 Harshal Dev 2026-10-01  369  				      u64 *maximum_variable_storage_size,
b59502937f7cb90 Harshal Dev 2026-10-01  370  				      u64 *remaining_variable_storage_size,
b59502937f7cb90 Harshal Dev 2026-10-01  371  				      u64 *maximum_variable_size, u32 *out_errno)
b59502937f7cb90 Harshal Dev 2026-10-01  372  {
b59502937f7cb90 Harshal Dev 2026-10-01  373  	int ret;
b59502937f7cb90 Harshal Dev 2026-10-01  374  	struct tee_ioctl_object_invoke_arg inv_arg;
b59502937f7cb90 Harshal Dev 2026-10-01  375  	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
b59502937f7cb90 Harshal Dev 2026-10-01  376  	u32 nparams = 2;
b59502937f7cb90 Harshal Dev 2026-10-01 @377  	struct tee_param param[nparams];
b59502937f7cb90 Harshal Dev 2026-10-01  378  
b59502937f7cb90 Harshal Dev 2026-10-01  379  	struct {
b59502937f7cb90 Harshal Dev 2026-10-01  380  		u64 max_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  381  		u64 remaining_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  382  		u64 maximum_var_size;
b59502937f7cb90 Harshal Dev 2026-10-01  383  		u32 errno;
b59502937f7cb90 Harshal Dev 2026-10-01  384  	} out_cong = { 0 };
b59502937f7cb90 Harshal Dev 2026-10-01  385  
b59502937f7cb90 Harshal Dev 2026-10-01  386  	memset(&inv_arg, 0, sizeof(inv_arg));
b59502937f7cb90 Harshal Dev 2026-10-01  387  	memset(&param, 0, sizeof(param));
b59502937f7cb90 Harshal Dev 2026-10-01  388  
b59502937f7cb90 Harshal Dev 2026-10-01  389  	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO, nparams);
b59502937f7cb90 Harshal Dev 2026-10-01  390  	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(attributes));
b59502937f7cb90 Harshal Dev 2026-10-01  391  	SET_TEE_PARAM_UBUF(param[1], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
b59502937f7cb90 Harshal Dev 2026-10-01  392  
b59502937f7cb90 Harshal Dev 2026-10-01  393  	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
b59502937f7cb90 Harshal Dev 2026-10-01  394  	if (ret < 0 || inv_arg.ret != 0) {
b59502937f7cb90 Harshal Dev 2026-10-01  395  		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO invoke ret: %d, err: 0x%x\n",
b59502937f7cb90 Harshal Dev 2026-10-01  396  			ret, inv_arg.ret);
b59502937f7cb90 Harshal Dev 2026-10-01  397  		return ret ?: inv_arg.ret;
b59502937f7cb90 Harshal Dev 2026-10-01  398  	}
b59502937f7cb90 Harshal Dev 2026-10-01  399  
b59502937f7cb90 Harshal Dev 2026-10-01  400  	*maximum_variable_storage_size = out_cong.max_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  401  	*remaining_variable_storage_size = out_cong.remaining_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  402  	*maximum_variable_size = out_cong.maximum_var_size;
b59502937f7cb90 Harshal Dev 2026-10-01  403  	*out_errno = out_cong.errno;
b59502937f7cb90 Harshal Dev 2026-10-01  404  
b59502937f7cb90 Harshal Dev 2026-10-01  405  	return ret;
b59502937f7cb90 Harshal Dev 2026-10-01  406  }
b59502937f7cb90 Harshal Dev 2026-10-01  407  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
