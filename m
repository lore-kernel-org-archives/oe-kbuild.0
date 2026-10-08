Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10B29E116
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 04:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433159; cv=none; b=I6y0nZdd0egT+MBbQ5i7CWAcOtYGS01vL1GXB1UamqPq/fvn0YGlsBRu/GoXR0jx8EIBENl/UKbEoFa/Mb2xJFEcenPIpnRjSABpHh3/5X/E2RoXTG0i7KmSt3ndAuCmMyxR6T3gj6XfV4MGGiFHFtlu7GWjJ9AykDSqTxY2O+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433159; c=relaxed/simple;
	bh=/sg6zsrNV/18oLsjIHMb6IV/98ZLb4cWBJ5eVvEdy5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnh1Vb44ZxzOcptJWCg6SL/NWrOte17H2lbVuYvmOeuGWWhNNg7TfT1YaGgL2fY4HV1XfViTu8MqyjuKG4DFU1SKD1NXoqUKOWTqlaN5i6oB9ufHGIhhRd206+75BsUWjrE/DYYvGIyz0cvPjwj3JQrcmYjMpaW7GV6fwcVXiYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHP60GKP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHP60GKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791433158; x=1822969158;
  h=date:from:to:cc:subject:message-id;
  bh=/sg6zsrNV/18oLsjIHMb6IV/98ZLb4cWBJ5eVvEdy5c=;
  b=MHP60GKPg+f4xbivwoFoMjqaKwCnMdTfB7c9vQ3UpwYccKuzPPpqv9Vs
   IMfBgSmpIVSBGOTxOIQJQdW9fdqpmSzq/Pk880DHv5ncPrC/ITNTCVrr5
   rAjOg01S/K87NuNXXZR4G0m8riVXCFmkb/0VBK2ufQtQMhC/LsSmzqOGo
   4InlQ29rtCVqo90zUvqSl3Obw5RS0ROh2hwS0b1zcnTlBrkacUzsxBHEl
   w5KaJtb46UrX2cx0KPmvzBNtp95KyaHeI7h2CgcQ8yXmkDnXTT7M6TwJc
   ooTl3fZUvGndg6TnkBkIWw0m9kCSN8w02BStgrsPX29xLlMM0Kz90rFQm
   w==;
X-CSE-ConnectionGUID: DgrgnW6ES/+TerojFRyKTQ==
X-CSE-MsgGUID: s9wEut53QaO4SdExh46xhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="89057"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="89057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 21:19:18 -0700
X-CSE-ConnectionGUID: WFQ3wp/6Ss2SiRnWo9nnfQ==
X-CSE-MsgGUID: orZ9RhRIS5yiINjhn/MV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="228885"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2026 21:19:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEfb8-000000004lB-1aTB;
	Thu, 08 Oct 2026 04:19:14 +0000
Date: Thu, 08 Oct 2026 06:18:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11195/15025]
 drivers/gpu/drm/msm/dp/dp_display.c:1141 msm_dp_ioremap_optional() error: we
 previously assumed 'len' could be null (see line 1132)
Message-ID: <202610080603.9zx0Gqal-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: 90bc95ebb04d58015f07b52f46680ab2ef664ccd [11195/15025] drm/msm/dp: add support for programming p1/p2/p3 register blocks
:::::: branch date: 15 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-r2200-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080603.9zx0Gqal-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080603.9zx0Gqal-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/dp/dp_display.c:1141 msm_dp_ioremap_optional() error: we previously assumed 'len' could be null (see line 1132)

vim +/len +1141 drivers/gpu/drm/msm/dp/dp_display.c

603fc0fc30bf69 Dmitry Baryshkov 2025-05-18  1125  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1126  static void __iomem *msm_dp_ioremap_optional(struct platform_device *pdev,
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1127  					     int idx, size_t *len)
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1128  {
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1129  	struct resource *res;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1130  	void __iomem *base;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1131  
90bc95ebb04d58 Abhinav Kumar    2026-09-29 @1132  	if (len)
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1133  		*len = 0;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1134  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1135  	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1136  	if (!res)
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1137  		return NULL;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1138  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1139  	base = devm_ioremap_resource(&pdev->dev, res);
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1140  	if (!IS_ERR(base))
90bc95ebb04d58 Abhinav Kumar    2026-09-29 @1141  		*len = resource_size(res);
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1142  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1143  	return base;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1144  }
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1145  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
