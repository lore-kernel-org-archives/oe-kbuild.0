Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF023BCF7
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 23:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766533015; cv=none; b=CLHfQuuJE8DmAoHiPnlW8lqkqdEDd4vi6dd0BExOrc7mLibLQ/qVoleuNmnZqgeazpgfryCi1G9LXFbKhJQGthhPqvqwjJNT+aASC6g+Mlb3rkXtKQmHbR5DoM+oKuYTYpEalYbz94uvssMQQs96ehEjxG2/22+HjfnosK9Uf3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766533015; c=relaxed/simple;
	bh=G5u/DQuKsUCWXK8zaruVp1JfpJviNB9BPBFN+7j3/VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebZ26fkkmOTH9pYlnlaM2xQjVHIf74tKW1YQADIH0ymvkZ/jfh9GjZLJ4JCzS7pMDedW5qyFUW3ZeYSm5bBqnqGToK2JWOK3BMi2roECwc5wXSB+KPySB+syZpDDmscot0wmNbnrgpXDyXypP27406nRN+go/HU69LQtYMm8hUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W64C+yd2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W64C+yd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766533014; x=1798069014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G5u/DQuKsUCWXK8zaruVp1JfpJviNB9BPBFN+7j3/VA=;
  b=W64C+yd2sndvtWE7FJv+4JpOGZAp6W8aM8pgU12NHX7YLlc6W3VASJO1
   Wgy3jhA4DcDHC0yaXfZwoAA/3W2JcOsfhsG8sgE+OcQqfJnUWX6z9+D4g
   A7VMitFeqf6rFbzqYFS/hObGoYfwrqTXtpinYKjZaDIz/MZWmrXXGN/YX
   xx33ROsjApZUyypST68xOPVLuJx/D2F4pIrcmxZ6Ahrci6QUxfaYqRrtB
   apeo82Nw8xPAJPaaDNtvrIOyOR/Bnc6g4vOkMX24lGX/50FUdUleW527H
   uN2kSbau51Mf250x4dic25tDlA/H6Dm4BkvmRBOxrEoYwJmUGXLpFNIQP
   g==;
X-CSE-ConnectionGUID: jRqd3BGiQ+6PS3LM+SjEfA==
X-CSE-MsgGUID: cp7P3UWKS3qsDcuLE8ro/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68319123"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68319123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:36:53 -0800
X-CSE-ConnectionGUID: JHLvanVMQr+EcW4/WTg/fQ==
X-CSE-MsgGUID: BVxlYEzYQCCB0btjwYr+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="223373383"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 15:36:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYBvt-000000002U9-378q;
	Tue, 23 Dec 2025 23:36:49 +0000
Date: Wed, 24 Dec 2025 07:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
Message-ID: <202512240703.KYyreBeA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/phy-google-usb.c:294:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-phyb4-v9-2-82c0b671b070@google.com>
References: <20251222-phyb4-v9-2-82c0b671b070@google.com>
TO: Roy Luo <royluo@google.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Peter Griffin <peter.griffin@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Tudor Ambarus <tudor.ambarus@linaro.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Badhri Jagan Sridharan <badhri@google.com>
CC: Doug Anderson <dianders@google.com>
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: Joy Chakraborty <joychakr@google.com>
CC: Naveen Kumar <mnkumar@google.com>
CC: Roy Luo <royluo@google.com>

Hi Roy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea1013c1539270e372fc99854bc6e4d94eaeff66]

url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Luo/dt-bindings-phy-google-Add-Google-Tensor-G5-USB-PHY/20251223-053359
base:   ea1013c1539270e372fc99854bc6e4d94eaeff66
patch link:    https://lore.kernel.org/r/20251222-phyb4-v9-2-82c0b671b070%40google.com
patch subject: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: mips-randconfig-r132-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240703.KYyreBeA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240703.KYyreBeA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240703.KYyreBeA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-google-usb.c:294:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-google-usb.c:294:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/phy/phy-google-usb.c:295:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-google-usb.c:295:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +294 drivers/phy/phy-google-usb.c

0e3b48ae38f7b7 Roy Luo 2025-12-22  292  
0e3b48ae38f7b7 Roy Luo 2025-12-22  293  module_platform_driver(google_usb_phy);
0e3b48ae38f7b7 Roy Luo 2025-12-22 @294  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
