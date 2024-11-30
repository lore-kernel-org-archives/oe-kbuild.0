Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A7156CA
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732953630; cv=none; b=FFRck6v05pBhQISeKeiVf7OtEg4Uz9RI/LPL1UUUu1FI+HeYcF9VDSLaKJCZPcVL7cmXQwnrfGLYsFdwX6kwLbA+Wm0MUOH/krmAjsajzGkgYO+hUdDbatb6fsTUE3FBsvfsW9qHS5UcvsiEZF47BxxoNLuov6zzGMKR+BJCMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732953630; c=relaxed/simple;
	bh=t1zcxCW+EdwQYmpDcU741jxhQKq3RBK6OUh4rFyrik4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP4fkCNY/eiLJ1oTqTl8ma52G5Pfdop/OR7n5gv6BE/xElUNa342dpO4iw4DJ5rYOHr/aEbVejHoOpAd8PKYl6plQ8i0wmOg5CVNlSF1a027TM8KGIYgKPWdDzuv0bFeczzrTcsPjmVtqzkYRPquY3NrZ6N3L8cYBUwK8SBQSkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bC2jZ/Yl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bC2jZ/Yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732953629; x=1764489629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t1zcxCW+EdwQYmpDcU741jxhQKq3RBK6OUh4rFyrik4=;
  b=bC2jZ/YlmEyGdtUaf8QdX/XxiLH5Eya7o4056cxqfeqQn2quPCCksaxg
   /cdOIRfkL2hW+wDpo163enZdoCk9Anpkz9oCqQ0wcah2pcWzSNIZCQRFO
   iZwcLoP6qmu7B02wlzHT6BYaNWnKqxe9f+E5ePi2GkHjkdaVrod/TpCcC
   3Agq9pl73VRhi2hWYyPj4oBKin3ePMumkT5P2q5yoFAamTbq258TKhP/V
   X7Z0+dxLurV6jCUatPsWmLvos1cCJ+M8Cj93H38NtzC3mBnub/iuDQP9O
   VB8bYa/h30TCEwdEq32v0D6r/J5TTdWF7TpR5Onb9qeFw0Gv1TzWUhLBu
   Q==;
X-CSE-ConnectionGUID: UkYE6uO7RDiNN3MErNm2dQ==
X-CSE-MsgGUID: 1AgN+GAVTfyBz47icFQ2wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33226921"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33226921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 00:00:28 -0800
X-CSE-ConnectionGUID: kz1OmdEUThyfT5TBalO/eQ==
X-CSE-MsgGUID: dyzxGvnZQp2ZLPgNCORaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="93477384"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Nov 2024 00:00:26 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHIOu-0000Ee-1j;
	Sat, 30 Nov 2024 08:00:24 +0000
Date: Sat, 30 Nov 2024 16:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <202411301549.xGJ9RFOn-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yingbao Jia <yingbao.jia@intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   920d5152bcddad113f48d45da764b9e604607cd3
commit: 4dc4d762dd6ed4cb851209a87e79d7d936b3fb4c [2483/2483] platform/x86: ISST: Enumerate TPMI SST and create framework
:::::: branch date: 88 minutes ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241130/202411301549.xGJ9RFOn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411301549.xGJ9RFOn-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:104 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +100 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   87  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   88  static int isst_if_get_tpmi_instance_count(void __user *argp)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   89  {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   90  	struct isst_tpmi_instance_count tpmi_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   91  	struct tpmi_sst_struct *sst_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   92  	int i;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   93  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   94  	if (copy_from_user(&tpmi_inst, argp, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   95  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   96  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   97  	if (tpmi_inst.socket_id >= topology_max_packages())
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   98  		return -EINVAL;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   99  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @100  	tpmi_inst.count = isst_common.sst_inst[tpmi_inst.socket_id]->number_of_power_domains;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  101  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  102  	sst_inst = isst_common.sst_inst[tpmi_inst.socket_id];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  103  	tpmi_inst.valid_mask = 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @104  	for (i = 0; i < sst_inst->number_of_power_domains; ++i) {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  105  		struct tpmi_per_power_domain_info *power_domain_info;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  106  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  107  		power_domain_info = &sst_inst->power_domain_info[i];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  108  		if (power_domain_info->sst_base)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  109  			tpmi_inst.valid_mask |= BIT(i);
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  110  	}
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  111  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  112  	if (copy_to_user(argp, &tpmi_inst, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  113  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  114  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  115  	return 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  116  }
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
