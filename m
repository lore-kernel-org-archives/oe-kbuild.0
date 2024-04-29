Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF91B372
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Apr 2024 04:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714365509; cv=none; b=LoUx0f+7Ew+ZqGGPxNV63NhFRV+ET3ZkF0vMnVYw6RBglkIZyU/vzcyX3Hu84GGOA6MRqdkCSxVixCa2M551UId8o83Rn1x3K3iVVub/2oJbTUTywO5OtU9XeUGQeXBHykHKMP5PWGBz1RGTuVz2uENxGjV6oJCXWtIvp0+WBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714365509; c=relaxed/simple;
	bh=hjBD2ITyPB9mAU3+jiAI0NVpEePry9CM0myqJuU84Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RMLG2Uut+NLYgRhnTJSo1SEyY9v9t1i3aHV2902pnvxlTCucN4y8PFsc8bxuEL3VLcXOvj2js/3OIMKyhfUgoY54zmo1LeiXbxDYVVGMSnGkCGDIBIbF75Nj798ltYvNOO8zt1Bqloed3fNr4+IZRnjcyad0BO8cfLrKza9wKns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0Yhs9Us; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0Yhs9Us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714365506; x=1745901506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjBD2ITyPB9mAU3+jiAI0NVpEePry9CM0myqJuU84Tw=;
  b=M0Yhs9Us1dk/yBY1eozkIkCT1G8A7rZVlF1ACz/s47Ljr9z+jZfiTnzp
   vbc74v6coXdYqhvjI+8PDl8b/iD8TEiFxa/bhoQ6dfq+IsNrpEiFAoz9I
   EFeWLThqR85oT3yd4sH5FedlgDrdbHv02SKw5qfAqxTRWp+rUZ9qsRPSJ
   Hzk7RjLq21J1TF+fTOMmhC5YoTNUliX+5H+i+ZAaWIRYqapqufq/ZS3v1
   xwvqKFsj0g9/v2LiZmpMK3+rlZTcIHZtzaJEkw/0CdnNxOAHixBdJ3ebm
   xkfiup5mWFjkQZuJhyZTG11K6p5D3Ydd5wSbwR9H91fmsl+T0RaWGKztO
   A==;
X-CSE-ConnectionGUID: bSovOWPAREqKa8pd4sXafg==
X-CSE-MsgGUID: 7Lp/4A65QzerwExFW7FqTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21428291"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="21428291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 21:38:26 -0700
X-CSE-ConnectionGUID: QKSvCg6iTgqFg30aMuziKg==
X-CSE-MsgGUID: Vkr6aCxZQyGHUtl69jT4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26061322"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2024 21:38:25 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1ImV-0006wz-06;
	Mon, 29 Apr 2024 04:38:23 +0000
Date: Mon, 29 Apr 2024 12:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 7604/7622]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:
 hinic3_hwif.h is included more than once.
Message-ID: <202404291225.3zIqKn4U-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Shuai Wu <wushuai51@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f120c2ab14341c60bcc055c700c0a29dce5837ac
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [7604/7622] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404291225.3zIqKn4U-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c: hinic3_hwif.h is included more than once.

vim +19 drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c

    13	
    14	#include "ossl_knl.h"
    15	#include "hinic3_common.h"
    16	#include "hinic3_hw.h"
    17	#include "hinic3_hwdev.h"
    18	#include "hinic3_csr.h"
  > 19	#include "hinic3_hwif.h"
    20	#include "hinic3_api_cmd.h"
    21	#include "hinic3_mgmt.h"
    22	#include "hinic3_mbox.h"
  > 23	#include "hinic3_hwif.h"
    24	#include "hinic3_multi_host_mgmt.h"
    25	#include "hinic3_hw_cfg.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
