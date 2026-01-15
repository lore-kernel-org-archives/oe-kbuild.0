Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E681119E96D
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 03:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447853; cv=none; b=a1ypifge9LxEN9gDblidNkcVABiqtUOs9JhvCbKV5YnBX0+pAwEIxNO0a7P8GR36os02UjBMqd4Epceq4V6AOYRSg+unQG76y2Ilg9Z+GaudYPLg2T5gZFgG8AZkpX59SmnUgSL2Jj5coVNUfEXu0pTbGSt/9y4X2DFalFBadFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447853; c=relaxed/simple;
	bh=jf1HusUhB7jQb+/3lWiXZ/7AM2FoJRBjNz5PDP4NB04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5MsCfdkr3G3KpEKwNXDyLAWJ8AoCy0aIJjMqVHAc20gnw9sMJEc2QajNn8HD9pVdYb47Ft6xhwkP5BH/xlxrbPTtUxWnCJkefskMdmfVKW2NgkWt4t7kUsS25BbIp+xHxlFTZTJju6Na//fHOlVaZhdcF/f741w7yh6ihVf7dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjfvTTBz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjfvTTBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768447852; x=1799983852;
  h=date:from:to:cc:subject:message-id;
  bh=jf1HusUhB7jQb+/3lWiXZ/7AM2FoJRBjNz5PDP4NB04=;
  b=JjfvTTBzhsXJsOfvhKzYyg+Y1dkFbUkw3uB57/bn1cojmDJxsjLAXQK+
   opobnx3ehg1F/FzcVIsjuk+GsJ/QrMAxq9PxWNKJUldnd5IHJk0f81EIF
   Bifk3Bxm4miZlg8/UeEWTOThClP8GYbUyI3Ex1PAfm5Dnn9AL9aPAVcKp
   duqU1XoJBWAWPNmfh9IcLpDkooDXHaVG8QYpEe3hCyARMH9JkQ/OH5D6Z
   a7LtSGstQMFPqd5TacJ/IzyrtdSS5eXdaUGb7x1EKi1uahquEjnDkxoFZ
   eOY18kKt6UzG5XiTKnoH6FTjr0uqxHbixiinlAdo3keMVrwrXelH+Em7r
   A==;
X-CSE-ConnectionGUID: zt5V5ZZIS9SJ5A4MkyLKlQ==
X-CSE-MsgGUID: mYmbQtStQTq7yjTZxPEh0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69731740"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69731740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 19:30:45 -0800
X-CSE-ConnectionGUID: L3yNWuEQTHKE17GZjZYLnA==
X-CSE-MsgGUID: 365gpHd5S5mqEk0ADmqvCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204905259"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jan 2026 19:30:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgE4G-00000000HUG-3p5I;
	Thu, 15 Jan 2026 03:30:40 +0000
Date: Thu, 15 Jan 2026 11:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 [qcom:20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com 8/13]
 drivers/firmware/qcom/qcom_scm.c:809 qcom_scm_pas_prepare_and_auth_reset()
 error: uninitialized symbol 'handle'.
Message-ID: <202601151145.cPVrwVvT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux 20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com
head:   5c720260e840b508053dd5338577e0175ef31739
commit: 4a7d6a78fbc6527fb1b61944aab00d9cdd1d4f01 [8/13] firmware: qcom_scm: Add a prep version of auth_and_reset function
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-r073-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151145.cPVrwVvT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601151145.cPVrwVvT-lkp@intel.com/

smatch warnings:
drivers/firmware/qcom/qcom_scm.c:809 qcom_scm_pas_prepare_and_auth_reset() error: uninitialized symbol 'handle'.

vim +/handle +809 drivers/firmware/qcom/qcom_scm.c

f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson 2015-09-23  767  
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  768  /**
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  769   * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  770   *					   remote processor
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  771   *
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  772   * @ctx:	Context saved during call to qcom_scm_pas_context_init()
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  773   *
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  774   * This function performs the necessary steps to prepare a PAS subsystem,
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  775   * authenticate it using the provided metadata, and initiate a reset sequence.
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  776   *
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  777   * It should be used when Linux is in control setting up the IOMMU hardware
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  778   * for remote subsystem during secure firmware loading processes. The preparation
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  779   * step sets up a shmbridge over the firmware memory before TrustZone accesses the
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  780   * firmware memory region for authentication. The authentication step verifies
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  781   * the integrity and authenticity of the firmware or configuration using secure
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  782   * metadata. Finally, the reset step ensures the subsystem starts in a clean and
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  783   * sane state.
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  784   *
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  785   * Return: 0 on success, negative errno on failure.
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  786   */
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  787  int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  788  {
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  789  	u64 handle;
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  790  	int ret;
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  791  
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  792  	/*
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  793  	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  794  	 * auth_and_reset call and create an shmbridge on the remote subsystem
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  795  	 * memory region and then invokes a call to TrustZone to authenticate.
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  796  	 */
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  797  	if (!ctx->use_tzmem)
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  798  		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  799  
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  800  	/*
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  801  	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  802  	 * subsequently call TrustZone for authenticate and reset.
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  803  	 */
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  804  	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  805  	if (ret)
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  806  		return ret;
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  807  
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  808  	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05 @809  	qcom_tzmem_shm_bridge_delete(handle);
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  810  
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  811  	return ret;
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  812  }
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  813  EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
4a7d6a78fbc652 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha     2026-01-05  814  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
