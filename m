Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559016;
	b=RIvpyC2wZExbUAbas5Hta1aVGoZtsqJl6mS33TSWNMhk7zqpdMfHQSKk9MC//PyvTYfW
	 Esp3q9HzYe3Qp34Jz3t7HeAlX+IQCx9vCooE51Y9R7XyPi9RHKsIzNFQnjLnjmYZsj5mN
	 virVFEZfRiUD2M4hLxJobU0eAVc7TCqLd+g77bV3kmqvac80aEkefFQdQQ9q76GWdOoII
	 gtDMzgyeBUe8MvmbC14kzjXy6+FSUEVVVG+BOHy7UiJz61bkqai/eJnvf4g1PzLzJyycg
	 dVlQFsUUAbEP2Za+bbBHLYB1IiHjVq9m32DyDAbsf+9a7g46O074mxWBkYSBRTFFQXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559016;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=OHXyRZHg4yuDmpE6kQVVCXvDY/sFLIoN3SarH9GXqZU=;
	b=x9tYtCQkbCAI/SfrxnwBJa4wQJNFiQ2VmKBC/jkAZi43GsxFEQSFmEE9gImnZDAHA8CA
	 1TWFi33K2u5d7FUCHjg4RAFky5dR/e5CFuAcYjcjHCqp5YeOZvvzgGSxaxMofEShNM8bI
	 5B/pp4ZMeGr3rAY4bFpR+F+iOdg037l52ygSDIEEgiPdabZdR1GKRyIF2dYRhKpJLeNgc
	 N528jTVf3Ox+LnLMKzOWF8OUQwYwfMs/UnEqRZUNpMF//5mRwIwT+SZKPGxmiZzRQw9gb
	 H9Si6mCq9VCyh102JiHV/cdKmF67T8OYF3O3yo56KITXonq7CXTyIaGHE3HqFceC5PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7vGsH4f;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38654606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 18:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38654606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7vGsH4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793559015; x=1825095015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OT70yyWhB1r1T62S+QAz1f+ANjp7l6bSGV0ci9fmElk=;
  b=a7vGsH4fhAWTPybcPDNOz5uUGuBC+H7/IHUkLi85o+uNXaqd4LKgKcGL
   EE/3wrNCLCrwdDL3MbKLNfN9omVQVY1Am5VkgQ+hGzvjekNPVHTyb6c1U
   XS4GotUqM6fmR6B1qdIn+20o/OBLzOs8HDgEppPQo/ip/PBdpYb2lV3KV
   vXMkook4tFAPQU+6L3skH6seMmvO+Z+enKJJuqoofHl243GFThM0XIPgJ
   HI04CUtHsUnQOKldXuQOGB2JDVMargQ0gXFPbDL1xs+FTmKz73nbFMHYw
   mkfeiwQjOQx/hWP2cXX2zeYXc+nki3ke+LVE+/tNLb1l60tLVAzJkbpmf
   w==;
X-CSE-ConnectionGUID: 0vfHczZHSyOlhcaUdgQNQA==
X-CSE-MsgGUID: /Oj0bGycQHaO0ml5GN1BQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2344987"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2344987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 10:50:14 -0800
X-CSE-ConnectionGUID: 5YpVRkxOT0Ci8gC1UfWkgg==
X-CSE-MsgGUID: 7r1EfpzuQRikYHbCxV3DgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5791791"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2026 10:50:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNad9-00000000fIG-3eIe;
	Sun, 01 Nov 2026 18:50:11 +0000
Date: Mon, 2 Nov 2026 02:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
Message-ID: <202611020207.AdYHNLj4-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
References: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Thomas Gleixner <tglx@kernel.org>
TO: Radu Rendec <radu@rendec.net>
TO: Stephen Boyd <swboyd@chromium.org>
TO: Marc Zyngier <maz@kernel.org>
TO: Lina Iyer <ilina@codeaurora.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/irqchip-qcom-pdc-Handle-ESPIs-in-qcom-pdc-ranges/20261022-104402
base:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
patch link:    https://lore.kernel.org/r/20261022-topic-pdc_map_espi-v1-1-7c481a42bac5%40oss.qualcomm.com
patch subject: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261102/202611020207.AdYHNLj4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020207.AdYHNLj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611020207.AdYHNLj4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/qcom-pdc.c:12:
>> include/linux/irqchip/arm-gic-v3.h:605:10: fatal error: asm/arch_gicv3.h: No such file or directory
     605 | #include <asm/arch_gicv3.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +605 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e109 Andre Przywara        2014-11-12  604  
7936e914f7b0827 Jean-Philippe Brucker 2015-10-01 @605  #include <asm/arch_gicv3.h>
021f653791ad17e Marc Zyngier          2014-06-30  606  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
