Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28971C549F
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735893999; cv=none; b=rqg0EFMkVECG0sA1yVIvpKhH3+9e+EA2EDx8ObrrCudIodVSXUlhDheKTLsV05sZxQTmHHJUs2Na8Qbg3P1IZlzF810t3cs3UfFodm47vCcxaGBxlSEl+iXdM+ti+pg1GIxF8Zpu/BEVd5uiCBOt7YwqodnJEiJtEznY6uNKpqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735893999; c=relaxed/simple;
	bh=ETNqNpeCpfQRuGbU/AjRngbsPXIFONxD/OmCUIzZBp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFfSYFuu6WhOYaRBPJeuals8tSsGSLlbi6jijBI4cG2DodWcyCrNTrnh/3q/XS+OZfdPRwr1hwR38ZbDGQludS5XBySdixmOf6Nx2TPcrbFt7+UN1EDVRfMNLb/ab5GNhERE6VsECRQZ7jI9BwJ4CzJ0kiWVcnsiCLDGasTIwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGblVEPj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGblVEPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735893996; x=1767429996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETNqNpeCpfQRuGbU/AjRngbsPXIFONxD/OmCUIzZBp4=;
  b=cGblVEPjyTURufTreM5gZU0OvNNWYh39mYmthMSzxjRbG0OHdsgnk4Zf
   nzm939MsMiDU502KddhBKDNRqq++/ddn8pPc/E5KjBVbLzaO8GyaG76yr
   J9lLmKNi+AecAAq+2NCb/4RMqc8YVksobgOpg6prNnfXK5APGOh0TMd5T
   DJsj72uDUz6+1H2Pk/Wv2ge64WmuSSy3RGgcgLfkaq9Qe/1j+GjAEb7q3
   eRnsUC5DloDz1A4UyUgNx9p09j7OQBZHBVK/vQv5Msd0gMIsfrvfVPQmw
   zfINRwNM5csXP5VIU95xo+sDi3f597Zf6qfnKQEhdX8OuEChBwvQHaM3u
   Q==;
X-CSE-ConnectionGUID: c15ZhbU6Sva2c9IATELM8g==
X-CSE-MsgGUID: iw1q9CjQRE28dFnWDMgBxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53686263"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53686263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 00:46:35 -0800
X-CSE-ConnectionGUID: KhxCLV2lQlKjheQ+Gfdlig==
X-CSE-MsgGUID: YzbGO3RUSICUGJi5Lkn73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101535745"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jan 2025 00:46:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTdKC-0009TD-1i;
	Fri, 03 Jan 2025 08:46:32 +0000
Date: Fri, 3 Jan 2025 16:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn:
 missing error code? 'ret'
Message-ID: <202501031613.wYttNcqY-lkp@intel.com>
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
TO: Ronak Jain <ronak.jain@amd.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 92fb71333d5737d0296fb968a653dfda4b225175 firmware: xilinx: add support for new SMC call format
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r073-20250102 (https://download.01.org/0day-ci/archive/20250103/202501031613.wYttNcqY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501031613.wYttNcqY-lkp@intel.com/

smatch warnings:
drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn: missing error code? 'ret'

vim +/ret +677 drivers/firmware/xilinx/zynqmp.c

76582671eb5d00 Rajan Vaja 2018-09-12  645  
59ecdd778879f1 Rajan Vaja 2018-09-12  646  /**
59ecdd778879f1 Rajan Vaja 2018-09-12  647   * zynqmp_pm_query_data() - Get query data from firmware
59ecdd778879f1 Rajan Vaja 2018-09-12  648   * @qdata:	Variable to the zynqmp_pm_query_data structure
59ecdd778879f1 Rajan Vaja 2018-09-12  649   * @out:	Returned output value
59ecdd778879f1 Rajan Vaja 2018-09-12  650   *
59ecdd778879f1 Rajan Vaja 2018-09-12  651   * Return: Returns status, either success or error+reason
59ecdd778879f1 Rajan Vaja 2018-09-12  652   */
6366c1bac3149c Rajan Vaja 2020-04-24  653  int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out)
59ecdd778879f1 Rajan Vaja 2018-09-12  654  {
92fb71333d5737 Ronak Jain 2024-09-19  655  	int ret, i = 0;
92fb71333d5737 Ronak Jain 2024-09-19  656  	u32 ret_payload[PAYLOAD_ARG_CNT] = {0};
92fb71333d5737 Ronak Jain 2024-09-19  657  
92fb71333d5737 Ronak Jain 2024-09-19  658  	if (sip_svc_version >= SIP_SVC_PASSTHROUGH_VERSION) {
92fb71333d5737 Ronak Jain 2024-09-19  659  		ret = zynqmp_pm_invoke_fw_fn(PM_QUERY_DATA, ret_payload, 4,
92fb71333d5737 Ronak Jain 2024-09-19  660  					     qdata.qid, qdata.arg1,
92fb71333d5737 Ronak Jain 2024-09-19  661  					     qdata.arg2, qdata.arg3);
92fb71333d5737 Ronak Jain 2024-09-19  662  		/* To support backward compatibility */
92fb71333d5737 Ronak Jain 2024-09-19  663  		if (!ret && !ret_payload[0]) {
92fb71333d5737 Ronak Jain 2024-09-19  664  			/*
92fb71333d5737 Ronak Jain 2024-09-19  665  			 * TF-A passes return status on 0th index but
92fb71333d5737 Ronak Jain 2024-09-19  666  			 * api to get clock name reads data from 0th
92fb71333d5737 Ronak Jain 2024-09-19  667  			 * index so pass data at 0th index instead of
92fb71333d5737 Ronak Jain 2024-09-19  668  			 * return status
92fb71333d5737 Ronak Jain 2024-09-19  669  			 */
92fb71333d5737 Ronak Jain 2024-09-19  670  			if (qdata.qid == PM_QID_CLOCK_GET_NAME ||
92fb71333d5737 Ronak Jain 2024-09-19  671  			    qdata.qid == PM_QID_PINCTRL_GET_FUNCTION_NAME)
92fb71333d5737 Ronak Jain 2024-09-19  672  				i = 1;
92fb71333d5737 Ronak Jain 2024-09-19  673  
92fb71333d5737 Ronak Jain 2024-09-19  674  			for (; i < PAYLOAD_ARG_CNT; i++, out++)
92fb71333d5737 Ronak Jain 2024-09-19  675  				*out = ret_payload[i];
92fb71333d5737 Ronak Jain 2024-09-19  676  
92fb71333d5737 Ronak Jain 2024-09-19 @677  			return ret;
92fb71333d5737 Ronak Jain 2024-09-19  678  		}
92fb71333d5737 Ronak Jain 2024-09-19  679  	}
f9627312e20721 Rajan Vaja 2018-09-12  680  
92fb71333d5737 Ronak Jain 2024-09-19  681  	ret = zynqmp_pm_invoke_fn(PM_QUERY_DATA, out, 4, qdata.qid,
92fb71333d5737 Ronak Jain 2024-09-19  682  				  qdata.arg1, qdata.arg2, qdata.arg3);
f9627312e20721 Rajan Vaja 2018-09-12  683  
f9627312e20721 Rajan Vaja 2018-09-12  684  	/*
f9627312e20721 Rajan Vaja 2018-09-12  685  	 * For clock name query, all bytes in SMC response are clock name
f9627312e20721 Rajan Vaja 2018-09-12  686  	 * characters and return code is always success. For invalid clocks,
f9627312e20721 Rajan Vaja 2018-09-12  687  	 * clock name bytes would be zeros.
f9627312e20721 Rajan Vaja 2018-09-12  688  	 */
f9627312e20721 Rajan Vaja 2018-09-12  689  	return qdata.qid == PM_QID_CLOCK_GET_NAME ? 0 : ret;
f9627312e20721 Rajan Vaja 2018-09-12  690  }
6366c1bac3149c Rajan Vaja 2020-04-24  691  EXPORT_SYMBOL_GPL(zynqmp_pm_query_data);
f9627312e20721 Rajan Vaja 2018-09-12  692  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
