Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035212;
	b=G8kVR/ow4YQMemL28IwNUcfpkEnJYJmSCUc+Nt2N0LBc5ztybEgGTd6IQZK1tQa5LyO/
	 DAlDBp/DT1prqCsoHOcLOUb8gYta/MKhKp6j1BvBZoiVwnRo5UiB3WgegR2CQvXBB6YHN
	 AAovAKYeGR84Q0B2w/FfVrUBMaF5LS35/ekucuMVxfTPhyNbqaucFmWVWCzxjmGaXDiSf
	 txOxe3hpc9vYrwdyO+OH3pEDu6yeHaEF0nt0QI5pJiLhb4QVCtephToni9UHD5cJxGepo
	 Flc25F+IQvbxJZ6m5eFRYRrQRlMTIY3vaTchROEeskyjITWbm+lrd3ERNIDZsZvfUSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035212;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=cGPVAe8nr9JBCy0h01ZmDFLmbVsFYO72QAMfZkjAWRc=;
	b=wT7whWA6cr2Bpci0b5PLgtc+i/2zxfYhCuzRpCXO+gdLCAWvs10g1SZEYuWy8pDNrSSu
	 CXC/s2UlNa9eOl/KdgjVyFjHZIbsHwpd5Q70EHy9uoHnLR8LtEEUwzUozMqzfbX72TY4g
	 cw4SvNran6cwlbSRSDJXedkQxCrFLJzySvcbee/H99TFUzSH/R0NoS8SjA5K5QKRM4fWr
	 RjQIn/qamRi2psZCRnfz48Vet/26P2dQi4sViTm2Rcz4AGU8udPXSLRwA6JM5VAGcL8LK
	 5JhaBIdFAuvtAEoZaa+IETFhBGDcMNOf4f/P0kZfUSEbiOoKarMcsCAVb0V1c0iao5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EtMnRBTL;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331F606A335
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 20:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4331F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EtMnRBTL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795035211; x=1826571211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2Vwf3FjyzBxGCIZ7KLz93F6K8NWN1uBFF6bqCqi2rM=;
  b=EtMnRBTLd9k8AYAjGRr5J+esUD8dT7fqFhB7qYtCxqQiSbNt4IWMBwJj
   ZuDZnsemm5R9xh7RdTQmsNIukF4ngwcGclCJqWHvnliWfhpLW8HMpe9nk
   Q7pScSwnjHx2AjF2OQrY/LB8L0Dxaeu6OsRFcSy6zoL/S/VtBiWf5NlU6
   K8NFpFZ/dw+tu2fpB6oEaRme9Pr7a0TWuloCK0K7/dgMThwM0ZX1aPGQH
   yIbiQcKVNkC7lpgc2uNrBIxPXS2CPuYed6r0SBZ1JBHy/M7S9+SWI2PA4
   hGfPzQcOyVidAuOr+kzb1XlimI8J6YMlpzW8OgXfgSBcJVUHDfxhQUWAT
   g==;
X-CSE-ConnectionGUID: M7Q/AMp0SN2wQEr/yZWU1g==
X-CSE-MsgGUID: iq1e8V2USCW8TbAIrbGNBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3943446"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3943446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:53:31 -0800
X-CSE-ConnectionGUID: DE8hkunuTn+i0xgNng8HRQ==
X-CSE-MsgGUID: k5JVVry1Q8yeU8GQqE3prQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10635664"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2026 12:53:29 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTmel-00000001EKy-0wL9;
	Wed, 18 Nov 2026 20:53:27 +0000
Date: Thu, 19 Nov 2026 04:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/6] soc: qcom: ice: Add TZ agnostic re-direction
 functions
Message-ID: <202611190323.Wc1KGP93-lkp@intel.com>
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
In-Reply-To: <20261111-ice-migrate-tee-svc-v2-1-29d19f6c92ab@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-1-29d19f6c92ab@oss.qualcomm.com>
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
patch link:    https://lore.kernel.org/r/20261111-ice-migrate-tee-svc-v2-1-29d19f6c92ab%40oss.qualcomm.com
patch subject: [PATCH v2 1/6] soc: qcom: ice: Add TZ agnostic re-direction functions
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261119/202611190323.Wc1KGP93-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 67ab6538dff0ed2593b90166214d93e992c74905)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190323.Wc1KGP93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611190323.Wc1KGP93-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ice.c:225:5: error: redefinition of 'qcom_ice_tz_ops_register'
     225 | int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *ops)
         |     ^
   include/soc/qcom/ice.h:79:19: note: previous definition is here
      79 | static inline int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *__unused)
         |                   ^
>> drivers/soc/qcom/ice.c:237:6: error: redefinition of 'qcom_ice_tz_ops_unregister'
     237 | void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *ops)
         |      ^
   include/soc/qcom/ice.h:85:6: note: previous definition is here
      85 | void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *__unused)
         |      ^
   2 errors generated.


vim +/qcom_ice_tz_ops_register +225 drivers/soc/qcom/ice.c

a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  224  
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11 @225  int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *ops)
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  226  {
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  227  	if (!qcom_ice_tz_ops_registered())
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  228  		/* Paired with smp_load_acquire() in qcom_ice_tz_ops_registered() */
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  229  		smp_store_release(&ice_tz_ops, ops);
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  230  	else
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  231  		return -EBUSY;
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  232  
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  233  	return 0;
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  234  }
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  235  EXPORT_SYMBOL_GPL(qcom_ice_tz_ops_register);
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  236  
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11 @237  void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *ops)
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  238  {
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  239  	if (READ_ONCE(ice_tz_ops) == ops)
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  240  		/* Paired with smp_load_acquire() in qcom_ice_tz_ops_registered() */
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  241  		smp_store_release(&ice_tz_ops, NULL);
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  242  }
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  243  EXPORT_SYMBOL_GPL(qcom_ice_tz_ops_unregister);
a3b7cfa9a5a3a11 Harshal Dev 2026-11-11  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
