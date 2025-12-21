Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F83481DD
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766356701; cv=none; b=t8hyfc86HB0ownaTgWHaw/XgU3DFUtxZjXUf+Xy5DOyPsbe8ihZg2VnBR4HTWJvxJpM4GRCxlkSEfqUFD/nG08xe7o4/s01Dc8phFrRuiIs15jkpO9o5ecSf7X4qTDrnsoNT/9FQIPzWFV7/f5rv+5Q4AGIOZGlvHjXdO/PNabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766356701; c=relaxed/simple;
	bh=bfYB8SxIig2a3/h/WT2Jy/peJid4x2e0Vdqv3FrBfIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ib8AYVStRiyrN3CeHG4DRVjKIeA0lFT/3E+74VDXobB+9f+mCzqZgb4vpipurWF8jab7NWOqQBSIegn507bFaWY6anJG97C4jGFovEJdpGt9911jTLifQ1/zzzDDcfxiK6zf4apoxIq1gnyXyatWdN220jOvkPMKsqpc/iY6OZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuFTd2II; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuFTd2II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766356700; x=1797892700;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bfYB8SxIig2a3/h/WT2Jy/peJid4x2e0Vdqv3FrBfIs=;
  b=JuFTd2IIuLsVYhBvQWrAl73kcxVGg8sup2wgX7v5OYJcbJ02LTNqMZJK
   L6fUwatZPbAXGiLeS0t8QWa8pOqMdpZCzF9VxOv5BLF0CVV+/wVKZucjv
   Ouhu6gzRMXyYRFCrl9I15OhvQ3KP16GWUsO2NqReStxIFwM7Vgb1ofc3T
   +ExoPD1xvbv8BuY06Cwt7EjkQTLe+Q3lZUCqZzzcM5w3oMA73m8ZIXk/g
   r0TYxXZI9jYFGzpPBVFkazXPYNNo4UjyNOa9tlxgluHl2Z0JGs8/ERWg1
   OLbBb8nDK1cX9qA/2PpIQzfyIlCrYegNk+SHlGboaa1DaRLX7/1J3kU3P
   Q==;
X-CSE-ConnectionGUID: ZhpVW4d9QzeSJe8vP64nKg==
X-CSE-MsgGUID: NdTJePBAT8SXhEMukYQbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67417628"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67417628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:38:19 -0800
X-CSE-ConnectionGUID: hGaetwBAQy2mGt4xV1Z+Jg==
X-CSE-MsgGUID: N3nqcgklTjeynv2V1ScvuQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 14:38:18 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXS48-000000000FN-1Lct;
	Sun, 21 Dec 2025 22:38:16 +0000
Date: Mon, 22 Dec 2025 06:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <202512220656.WTEiImqi-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/usb/dwc3/dwc3-google.c:627:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251218-controller-v10-2-4047c9077274@google.com>
References: <20251218-controller-v10-2-4047c9077274@google.com>
TO: Roy Luo <royluo@google.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Peter Griffin <peter.griffin@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Tudor Ambarus <tudor.ambarus@linaro.org>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: Badhri Jagan Sridharan <badhri@google.com>
CC: Doug Anderson <dianders@google.com>
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: Joy Chakraborty <joychakr@google.com>
CC: Naveen Kumar <mnkumar@google.com>
CC: Roy Luo <royluo@google.com>

Hi Roy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus robh/for-next krzk-dt/for-next v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Luo/dt-bindings-usb-dwc3-Add-Google-Tensor-G5-DWC3/20251219-032644
base:   linus/master
patch link:    https://lore.kernel.org/r/20251218-controller-v10-2-4047c9077274%40google.com
patch subject: [PATCH v10 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r134-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220656.WTEiImqi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220656.WTEiImqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220656.WTEiImqi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/dwc3/dwc3-google.c:627:1: sparse: sparse: bad integer constant expression
   drivers/usb/dwc3/dwc3-google.c:627:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/usb/dwc3/dwc3-google.c:627:1: sparse: sparse: bad integer constant expression
   drivers/usb/dwc3/dwc3-google.c:627:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/usb/dwc3/dwc3-google.c:628:1: sparse: sparse: bad integer constant expression
   drivers/usb/dwc3/dwc3-google.c:628:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +627 drivers/usb/dwc3/dwc3-google.c

d8ed4e47bd86032 Roy Luo 2025-12-18  625  
d8ed4e47bd86032 Roy Luo 2025-12-18  626  module_platform_driver(dwc3_google_driver);
d8ed4e47bd86032 Roy Luo 2025-12-18 @627  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
