Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668E184
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773276030; cv=none; b=BbMCO9DIwibPqzR7+RtxqLLySX9CZMUpQMLrNbyinomdA2yPY2WC7Pn0+j/IS1MvDyq2jQQSwa3kDd8da5BiB+nyffoSYb/8BZXneZ1GUtVRPJV8KiNkDnWac7zCtB17Xcnkzpg5g0y7QyIk0DR7s0Pa63kByQBhIcNI/R+X6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773276030; c=relaxed/simple;
	bh=1L2SUm+QV/qiibqQCCwVWolpyd81MN8yV2OFwnKIr2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQBufSE1yJB3VFrjjriG5PULRdz5wfr6Rfp4QEISouVXgGtEVm0deiQw5bn3putJidhrezVls2W123c1H35sPfIWETWgxKNiJZD2GamBpHK6ovcdM8aQTYAlgi1kgg57COXJ8lP3p5HdlBbnLpiMeBdkJIVBda82OB8mO93HXds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eao1KmQ7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eao1KmQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773276029; x=1804812029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1L2SUm+QV/qiibqQCCwVWolpyd81MN8yV2OFwnKIr2o=;
  b=Eao1KmQ7iTFEYadhoF0AypPOHm22E4wiqkCEmh4RLn3cPgIHKdJ86djz
   COzxOXt8nT0arpoQTpEW35NKR9NLbCsAXvwRHhMl+ERi6b8fJ5IsLvj0W
   3o06mM7qlrs0uNGTQsRsKL886WBOlCEDG6jd4bl5pWV8QU9eshYJsceVf
   WcqvGlYfMJBgquCdgMDdrXVHOlEJ7ApBGFOHr8iYfq7oPoMODip9TqV8M
   UqO2tArpl2ZXNm9Ijcr/7WyoeVE07gG18pBsSKVfb+6UXi40aW+c3GAP5
   YWGMLkUpclM5Vc92Qqc/BODK6T/hQsWXdUrywS9rL5KlOGuJlpw7zSQyA
   Q==;
X-CSE-ConnectionGUID: CKX4+YkYSGqTNuF+jX0SQg==
X-CSE-MsgGUID: y6anDJUfRsyQGRUpbgMBnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91932605"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="91932605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 17:40:29 -0700
X-CSE-ConnectionGUID: YWaF6fhmQTa/TU2VH69m4Q==
X-CSE-MsgGUID: GjD8C11uQPqF5fXmzY6aSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="217250390"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2026 17:40:27 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0U6D-000000001rj-1VRH;
	Thu, 12 Mar 2026 00:40:25 +0000
Date: Thu, 12 Mar 2026 08:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 -next 2/2] dpaa2: compile dpaa2 even
 CONFIG_FSL_DPAA2_ETH=n
Message-ID: <202603120839.pmu8Zt2l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260309125018.420275-3-caixinchen1@huawei.com>
References: <20260309125018.420275-3-caixinchen1@huawei.com>
TO: Cai Xinchen <caixinchen1@huawei.com>
TO: ioana.ciornei@nxp.com
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: caixinchen1@huawei.com

Hi Cai,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260305]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Xinchen/dpaa2-add-select-config-for-FSL_DPAA2_SWITCH/20260309-213339
base:   next-20260305
patch link:    https://lore.kernel.org/r/20260309125018.420275-3-caixinchen1%40huawei.com
patch subject: [PATCH v2 -next 2/2] dpaa2: compile dpaa2 even CONFIG_FSL_DPAA2_ETH=n
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603120839.pmu8Zt2l-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120839.pmu8Zt2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603120839.pmu8Zt2l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__end_rodata" [lib/fonts/font.ko] undefined!
>> ERROR: modpost: "fsl_mc_allocate_irqs" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "fsl_mc_portal_allocate" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "dpaa2_io_service_enqueue_qd" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "fsl_mc_driver_unregister" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "fsl_mc_object_free" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "dpaa2_io_service_pull_fq" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "dpbp_enable" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "dpbp_reset" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
>> ERROR: modpost: "dpaa2_io_store_next" [drivers/net/ethernet/freescale/dpaa2/fsl-dpaa2-switch.ko] undefined!
WARNING: modpost: suppressed 18 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
