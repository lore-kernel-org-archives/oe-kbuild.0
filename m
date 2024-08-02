Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB18F65E20
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722640024; cv=none; b=KQ1IkTb4w0e4Z5U5LwQCumbV/MFFyQXXjxAdeIZEw2ZY/QTX3ObPumQTbUU+EZOYHrimP4sceZfTNtYzYHhKjY9pACJuTV3To+F7YwtVMxtR6CBD/TdKatBCcpOm6YU53Nss5ex5QfhNYGKLCAZKqqICln15khzAgoOspT9LIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722640024; c=relaxed/simple;
	bh=cncQpkP7/3tQ/JCkejG5QLNtVFRYZG5Fn891DDDTmEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFKYo2a99NWPrnXuvoeFQ/VO564Mf13T0nM+2WRoTnQ1OxcuEWuT21kiJjI7hEq+iUbnv2VkLtgOT+DYlDjJ130JER+Xa2gp5DqiAhZIXwsKR82uaGhubkITNkMZ8bSfo7iwdpEIfXMULLqUPn9xTbDZbYyhUsFyWfFemABwHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9a2xRSD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9a2xRSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722640023; x=1754176023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cncQpkP7/3tQ/JCkejG5QLNtVFRYZG5Fn891DDDTmEU=;
  b=K9a2xRSDlwyn1LG2Ayck1lAlHwBCt/ykIBqgg/UC/2QI1ahGcnlUDkZx
   HerSRP7lGhsmCoJhyqr/xBKFUG/cGqExrcajxkV5i7uqHaFwvHtl17Dcy
   MwUvgmqsyFgcgEUt0gH1AWBncmRCokgrQuOIPQmyQlpoH6981pRDUU/pW
   o3SaLg6sLUU75BMnXI74OAWWmFQKUiwEIQf2JNqklpdgiA2x+jhd1XoWD
   9GDITI55fvOfk8Zb/XboYUz+p/3WUMGT8yzMdJPUea3D6k3Nqx/rZkPto
   D3UFlg5ynDumlojfd7FnnJ1gcVWL+gNtx4p3+vCe0F9Ft8JBFKrO2SM5c
   A==;
X-CSE-ConnectionGUID: BCS0ucseSmaAdIho464UPA==
X-CSE-MsgGUID: l753YPw1Q++BJ6H8uOHUnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20812014"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20812014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 16:05:56 -0700
X-CSE-ConnectionGUID: OqEcbQ5ARGWSVLKmIfdx+g==
X-CSE-MsgGUID: 0vi0CukzSmW5jp7+5U9gIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60396345"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 16:05:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa1LM-000xX2-0I;
	Fri, 02 Aug 2024 23:05:52 +0000
Date: Sat, 3 Aug 2024 07:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] interconnect: qcom: Add SM4450 interconnect
 provider driver
Message-ID: <202408030616.IhRcAnMm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240801-sm4450_interconnect-v3-2-8e364d0faa99@quicinc.com>
References: <20240801-sm4450_interconnect-v3-2-8e364d0faa99@quicinc.com>
TO: Tengfei Fan <quic_tengfan@quicinc.com>
TO: Georgi Djakov <djakov@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
CC: kernel@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Tengfei Fan <quic_tengfan@quicinc.com>

Hi Tengfei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 048d8cb65cde9fe7534eb4440bcfddcf406bb49c]

url:    https://github.com/intel-lab-lkp/linux/commits/Tengfei-Fan/dt-bindings-interconnect-Add-Qualcomm-SM4450/20240802-194900
base:   048d8cb65cde9fe7534eb4440bcfddcf406bb49c
patch link:    https://lore.kernel.org/r/20240801-sm4450_interconnect-v3-2-8e364d0faa99%40quicinc.com
patch subject: [PATCH v3 2/3] interconnect: qcom: Add SM4450 interconnect provider driver
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408030616.IhRcAnMm-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/interconnect/qcom/sm4450.c: icc-rpmh.h is included more than once.

vim +16 drivers/interconnect/qcom/sm4450.c

    14	
    15	#include "bcm-voter.h"
  > 16	#include "icc-rpmh.h"
  > 17	#include "icc-rpmh.h"
    18	#include "sm4450.h"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
