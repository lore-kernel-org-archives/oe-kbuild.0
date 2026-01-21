Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CF42B72B
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985810; cv=none; b=I95PsX6rIpr/hfwr1MDWF7POluztIZknHD2JSyomMUy7CsVKjRaj4m8xFVPvU3YkxWeyQcKbhbGuZ74Zd04yr1oE4LW357NnHLdmhkZR8SNJqmSWOGpkSne69qsRUrMkYMNq8aX/SML3XmLhAhi1AC+D+TYZ/M7lHVI9rEYuhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985810; c=relaxed/simple;
	bh=DYG2ZnFJcqKMNCDQug3tiibtMepScoQwVYcceavWS5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=optHSjIJdghqd3r+uLgK5+Wow9hjOExWnCSoOZk7cyiCM6V2hrh0N/eIpdx06xBov8cTcIcTTLVO895HvCbuj0aUYBBWXV0CMRx+3Fc62VAi7u4UcVM+rtUMhidZz4JHkINJdcYOw7R+zIY25r4YDO2jaYnGHNKRAnZbZJuIrEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkYR2ZJS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkYR2ZJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768985808; x=1800521808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYG2ZnFJcqKMNCDQug3tiibtMepScoQwVYcceavWS5I=;
  b=AkYR2ZJSWPg7OSHIGCAWZNKSgN+UpmXxwjoIRmJblHeXKKJdxcTr8Sy7
   xWZbncdnLGTck7U8DlO1us/tM/o+QTSDCRmFn1ZlukEbulmv35A53l07Q
   urOV1/Jwlh2bUNuSLAkmHjw0A620tNy0EaJZRX0MIhDmWuCMSNB15o6MK
   vZrStFCI9VYDsZp6kWhZRA5slOPLNNTs+gVKr5o9zw8QB7nx5frzWrIMJ
   FgFzFNjjOuDhF1x8VZ2GoozM+6Gvc5D0HuOZvA4dJOm2fzEYD6ag8qF/b
   Ye3p4PvcjIQ3PMFqngGuz+T0NFViG1RQMmoEYBqkuyj+E0mvT3xNzNrft
   w==;
X-CSE-ConnectionGUID: mVHEX4+xT2S0dPv6jEy9rA==
X-CSE-MsgGUID: QXM7gBVKQoOKvIgFWfvaOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70374802"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70374802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:56:46 -0800
X-CSE-ConnectionGUID: xal2MEhzToeOwO6y4dyotQ==
X-CSE-MsgGUID: L4UlP6hjRBCvMh8wY1HhDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210557321"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2026 00:56:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viU14-00000000QBd-1gd0;
	Wed, 21 Jan 2026 08:56:42 +0000
Date: Wed, 21 Jan 2026 16:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] pinctrl: qcom: Add Eliza pinctrl driver
Message-ID: <202601211636.ZpWmSebr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/qcom/pinctrl-eliza.c:1546:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
References: <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

Hi Abel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-pinctrl-document-the-Eliza-Top-Level-Mode-Multiplexer/20260120-182353
base:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
patch link:    https://lore.kernel.org/r/20260120-eliza-pinctrl-v1-2-b31c3f85a5d5%40oss.qualcomm.com
patch subject: [PATCH 2/3] pinctrl: qcom: Add Eliza pinctrl driver
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: mips-randconfig-r122-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.ZpWmSebr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211636.ZpWmSebr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601211636.ZpWmSebr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/qcom/pinctrl-eliza.c:1546:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/qcom/pinctrl-eliza.c:1546:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pinctrl/qcom/pinctrl-eliza.c:1547:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/qcom/pinctrl-eliza.c:1547:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1546 drivers/pinctrl/qcom/pinctrl-eliza.c

478d351f93e4cc Abel Vesa 2026-01-20  1545  
478d351f93e4cc Abel Vesa 2026-01-20 @1546  MODULE_DESCRIPTION("QTI eliza TLMM driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
