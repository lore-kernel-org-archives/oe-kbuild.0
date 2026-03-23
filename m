Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A73AB295
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273388; cv=none; b=azo4dM2z6KOOYTx2CTLyT3E217CJdHk93CuxvVnMSlZO68iyk5KU7Oslk3C6zMCoT5jNXA/5S3R3+yHblOOXSxGLpEHeC3aydxogq/e5vV4nb8dGbACEHA/U1q4N/LbTuBqJgIYrKyNmalqqpipLp/ulepL6ZgcDQzmZg2zneMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273388; c=relaxed/simple;
	bh=M/OYn+n8NjDdDhStXwn+fzTITKcwuRDig9m1liRNdD0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3kEng5x8Q0+ZxJ4Fazo3M023I1P1tCjdZe1aSeOyDualXZBCtsZi/+T6oxoP7DEY7uK3qD374hFgYUmE+5DHzx1eG42toSerzWK8+k/nqrSqj0uYZ/wQUK19D64quFJSajUidX5umfMFgVTbOFHqItKj7fmkcJqgx6syGpXkqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViwhKJiD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViwhKJiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774273387; x=1805809387;
  h=date:from:to:subject:message-id:mime-version;
  bh=M/OYn+n8NjDdDhStXwn+fzTITKcwuRDig9m1liRNdD0=;
  b=ViwhKJiDUtDsaflU+c7oaKaLZ1H0dXzcYpO1TjN+9lXWVftwf+yqXjD3
   FwlyBasEdvubdPDDSdsaybBn/12Q7aT65MyB10NCydLPFolYDSIgmFq1V
   iMVhAo3SdHJBPFKAZUVpCH70zfHGOgZMkwnUUHnj5akvIZmje2x9EaVdg
   aNZ5ZO4Suo3hFQW/aIKS/UUfFhB7QVFVPB8ZlLhz46rjWkhfzKATBbVL1
   YlpuzLxONIOVzO4IW0TKa2EahIiHqDqDQEjCeqqaCQQsMSbE3SSB9kOCu
   bZN7Om9BDCk3egneTg31c+MtmxLHY5Fv5u5WYS98//1wbM2CMwBHuP0Hc
   Q==;
X-CSE-ConnectionGUID: jyCys/gLSKGiRuaEGakT9Q==
X-CSE-MsgGUID: IJjzzUv4TgWhxhCzNevmRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75240981"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75240981"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:43:07 -0700
X-CSE-ConnectionGUID: 52kTGEX6RCeFkm+02r+NVw==
X-CSE-MsgGUID: +buLWrnsQcC30UeOlkgD8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224244882"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2026 06:43:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4fYd-000000006dd-3zpo
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 13:43:03 +0000
Date: Mon, 23 Mar 2026 14:42:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V
 Jupiter
Message-ID: <202603231405.SfgbW8Ll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260322203356.2206927-7-aurelien@aurel32.net>
References: <20260322203356.2206927-7-aurelien@aurel32.net>
TO: Aurelien Jarno <aurelien@aurel32.net>
TO: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Yixun Lan <dlan@kernel.org>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>

Hi Aurelien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on spacemit/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aurelien-Jarno/riscv-dts-spacemit-add-LEDs-for-Milk-V-Jupiter-board/20260323-081657
base:   https://github.com/spacemit-com/linux for-next
patch link:    https://lore.kernel.org/r/20260322203356.2206927-7-aurelien%40aurel32.net
patch subject: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603231405.SfgbW8Ll-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#7: 
are routed to the M.2 M-key connector and to the the PCIe x8 slot.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
