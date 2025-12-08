Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514962BD597
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765226229; cv=none; b=dzfw27ElaqWB2wpvYEfnOfFWvrVN0F7AuMIvObL/OHk2upEVWQOsSsYVxb60gNSNt9D+bwGp/fETmiEy7lcrIOUD7R12HZRvox6O48WGxhntq+hteQt8uYCjOl3DWh68jMl70EtxpDom11p6kelUFedfdqOHHe6cRAYU8OQzW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765226229; c=relaxed/simple;
	bh=VN5YJQc3r18tqdrd3PW3KmgzV4MuNIpR4z/jvoYPXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTsu+TyQ8T21MsJlGtx0YZeXWCks7HvUOkWsLZv7jUtOycRhQ8q43n8w6dK6CBuLO8qRyzmrV3geF85mGKOEcA/6DwSvMDSgK1t4yaHdqrwadftZB0VkOBwOWY1Qf5HDMp+ufdzVmzY/wXYG6nFKBFt29eezNB9KDe8WTRD7EmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yvf9igIC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yvf9igIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765226227; x=1796762227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VN5YJQc3r18tqdrd3PW3KmgzV4MuNIpR4z/jvoYPXqU=;
  b=Yvf9igICMXGaBz8MuKgV9rUY18hyd+R6E1fnQ7GPM2IgdCV+V3vIhA/P
   NI+58zfVEqyTI7uLGSyRGlXm6A3ADpxBWu9ek0trbeFj8T0jK05E2bq/S
   5/++Az30i2QO28RKAhkHXlthYIuBJoqbCVfXoLGr6lJ9B+3w+6VRR53BO
   VzhbL7LWmn5FOWMqWCT5QonbdXx6UijrcoiSaNHhtQ0jBSuqIXOSD6VLv
   dnqE7kO37o7JPaRyDseQdVXPjP7dcp3aiZ0sdN3OaJ7vkDVTYt7upoRky
   RBX0/aQk8vXZcklEOVipityTOpD3TUgXcKI2i0zXb4CGYH+3G/CbfdvVg
   Q==;
X-CSE-ConnectionGUID: 3sKQp8KdQo6SRTIlmtil+Q==
X-CSE-MsgGUID: O69eicSySKWeHkvj0vwaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54718010"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="54718010"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 12:37:06 -0800
X-CSE-ConnectionGUID: jF2kE7TwTOesmDRlkZuYCg==
X-CSE-MsgGUID: iTzoL95UTjWLp+cVCJSDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="201150567"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2025 12:37:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vShyg-000000000pl-2ZHd;
	Mon, 08 Dec 2025 20:37:02 +0000
Date: Tue, 9 Dec 2025 04:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 07/12] qla2xxx: Delay module unload while fabric scan
 in progress
Message-ID: <202512090414.07Waorz0-lkp@intel.com>
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
In-Reply-To: <20251204151751.2321801-8-njavali@marvell.com>
References: <20251204151751.2321801-8-njavali@marvell.com>
TO: Nilesh Javali <njavali@marvell.com>
TO: martin.petersen@oracle.com
CC: linux-scsi@vger.kernel.org
CC: GR-QLogic-Storage-Upstream@marvell.com
CC: agurumurthy@marvell.com
CC: sdeodhar@marvell.com
CC: emilne@redhat.com
CC: jmeneghi@redhat.com

Hi Nilesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e6965188f84a7883e6a0d3448e86b0cf29b24dfc]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/qla2xxx-Add-Speed-in-SFP-print-information/20251204-233117
base:   e6965188f84a7883e6a0d3448e86b0cf29b24dfc
patch link:    https://lore.kernel.org/r/20251204151751.2321801-8-njavali%40marvell.com
patch subject: [PATCH v2 07/12] qla2xxx: Delay module unload while fabric scan in progress
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090414.07Waorz0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512090414.07Waorz0-lkp@intel.com/

New smatch warnings:
drivers/scsi/qla2xxx/qla_os.c:1187 qla2x00_wait_for_hba_ready() warn: if statement not indented
drivers/scsi/qla2xxx/qla_os.c:1189 qla2x00_wait_for_hba_ready() warn: inconsistent indenting

Old smatch warnings:
drivers/scsi/qla2xxx/qla_os.c:4249 qla2x00_mem_alloc() warn: missing unwind goto?

vim +1187 drivers/scsi/qla2xxx/qla_os.c

726b85487067d7 Quinn Tran       2017-01-19  1163  
86fbee86e94c7e Lalit Chandivade 2010-05-04  1164  /*
638a1a01d36a14 Sawan Chandak    2014-04-11  1165   * qla2x00_wait_for_hba_ready
638a1a01d36a14 Sawan Chandak    2014-04-11  1166   * Wait till the HBA is ready before doing driver unload
86fbee86e94c7e Lalit Chandivade 2010-05-04  1167   *
86fbee86e94c7e Lalit Chandivade 2010-05-04  1168   * Input:
86fbee86e94c7e Lalit Chandivade 2010-05-04  1169   *     ha - pointer to host adapter structure
86fbee86e94c7e Lalit Chandivade 2010-05-04  1170   *
86fbee86e94c7e Lalit Chandivade 2010-05-04  1171   * Note:
86fbee86e94c7e Lalit Chandivade 2010-05-04  1172   *    Does context switching-Release SPIN_LOCK
86fbee86e94c7e Lalit Chandivade 2010-05-04  1173   *    (if any) before calling this routine.
86fbee86e94c7e Lalit Chandivade 2010-05-04  1174   *
86fbee86e94c7e Lalit Chandivade 2010-05-04  1175   */
638a1a01d36a14 Sawan Chandak    2014-04-11  1176  static void
638a1a01d36a14 Sawan Chandak    2014-04-11  1177  qla2x00_wait_for_hba_ready(scsi_qla_host_t *vha)
86fbee86e94c7e Lalit Chandivade 2010-05-04  1178  {
86fbee86e94c7e Lalit Chandivade 2010-05-04  1179  	struct qla_hw_data *ha = vha->hw;
783e0dc4f66ade Sawan Chandak    2016-07-06  1180  	scsi_qla_host_t *base_vha = pci_get_drvdata(ha->pdev);
86fbee86e94c7e Lalit Chandivade 2010-05-04  1181  
1d48390117c7df Dan Carpenter    2016-08-03  1182  	while ((qla2x00_reset_active(vha) || ha->dpc_active ||
9d35894d338abc Sawan Chandak    2014-09-25  1183  		ha->flags.mbox_busy) ||
9d35894d338abc Sawan Chandak    2014-09-25  1184  	       test_bit(FX00_RESET_RECOVERY, &vha->dpc_flags) ||
cedcf9d7bcbe3a Anil Gurumurthy  2025-12-04  1185  	       test_bit(FX00_TARGET_SCAN, &vha->dpc_flags) ||
cedcf9d7bcbe3a Anil Gurumurthy  2025-12-04  1186  		(vha->scan.scan_flags & SF_SCANNING)) {
783e0dc4f66ade Sawan Chandak    2016-07-06 @1187  			if (test_bit(UNLOADING, &base_vha->dpc_flags))
783e0dc4f66ade Sawan Chandak    2016-07-06  1188  			break;
86fbee86e94c7e Lalit Chandivade 2010-05-04 @1189  		msleep(1000);
86fbee86e94c7e Lalit Chandivade 2010-05-04  1190  	}
783e0dc4f66ade Sawan Chandak    2016-07-06  1191  }
86fbee86e94c7e Lalit Chandivade 2010-05-04  1192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
