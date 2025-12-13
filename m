Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D55299948
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598942; cv=none; b=fnFXEloL/deKohmc+DUGU/tCQRp4xoHChrKD9MXVKVVM1CrUj6EIeJqJlrGMkihY/IF4TWkVr0fccfVsVSLhNpRg0ZzhWTP30Iqn5YCPD7mtn8htlb1+tWBPemrsaR90nq6vwAKuBuX1ep5C2m1ZO+i+DwdbmzC6N3wS89xROvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598942; c=relaxed/simple;
	bh=bugDCrkVrHTo4ck4ctYw6cRmP+Vc/auM7c+zdcXLhek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mhNJU2zhnObKDBJWCiUcLKld+gWJNz9zre2FolHozS1vhlnxFpZJOhGr7ThZEtK79CUElcpyWmTW2Cinf/gXOkneMb7b5K8uh97vYw0x90y05id+qcAo/PUZzUY/57h22p5fZMXtANxK2/B4lTLom7qZgUdsjdNP17hhx6leA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frDxTKkA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frDxTKkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765598940; x=1797134940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bugDCrkVrHTo4ck4ctYw6cRmP+Vc/auM7c+zdcXLhek=;
  b=frDxTKkASs/8YdCs0qzjrhvqiXJHb/fzWkRDWEpka9HBxpjRXUW7e2Pt
   EbQJ1HRPNByVnfMGWKofoqA6VcJ4avCpUJHA1+VYlyT/6bM+RD0xDsBQs
   JWj1NgQZhNVxagv9RuHSFXhYNSWKSqu/Jl9s4t3UhWnPHU2/RedlB8rMH
   mzMIwb72C8CPZJrSlLPR+24+Vj9AIaVB+JH780uxJQwE+riY8qiHDHaEq
   LmAPqqcFP1wplOpI+idV7OxxCcbNL/E+oX3F8+YbtA+16ovX602hmWL6j
   wNym1MsGGSku4JHA/G4Ms9OsLlx4oi4RxU45ktCwrk9VptF+FwYMdYcO+
   g==;
X-CSE-ConnectionGUID: A77A4gF4TPCEZJ7maGtLHA==
X-CSE-MsgGUID: hgOyZbXGSjmTtPhpu13hPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="93072636"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="93072636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:09:00 -0800
X-CSE-ConnectionGUID: eFpMyVnoTIa+RPo4d62urg==
X-CSE-MsgGUID: eDDuvyZHS+O3fz4O6JSuag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197311978"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 20:08:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGwB-0000000071y-2ssk;
	Sat, 13 Dec 2025 04:08:55 +0000
Date: Sat, 13 Dec 2025 12:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn:
 missing error code? 'ret'
Message-ID: <202512131243.914A9iGX-lkp@intel.com>
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
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 92fb71333d5737d0296fb968a653dfda4b225175 firmware: xilinx: add support for new SMC call format
date:   1 year, 2 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131243.914A9iGX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131243.914A9iGX-lkp@intel.com/

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
