Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956855;
	b=WpNHq49iXjHiHbZ1ZlR1nHs8RJ5b+TL/eGB28CFXzew0C6P3RYIadNzWdTakEXvhhnyJ
	 YLOOGz1KOsHF8+ICnazlJnrlVhbWcMDgfa4X+3EDwmJiQpGASOgHP5n7nqTdrJtC5708w
	 W3JDQ+qcQw5LzlkVIehBSw3kQiH5qIKpZbJ2L+TpMMgZQgS/3KX7rFU+nQ4HJxiLbmvnX
	 Az3N8C++GoIEiBoGpu299f7rSN35GUv7xbzieDW4UqVM5RnJOImhAHQ4hFgG5iY3PSpbW
	 mhztL9sazqfNfjIndckSqcjl+BeKXMhtLmgfNm3DZD7zQ+IBUCb/HpkeEs6IFR2DWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=dHZ3RJXH0n/5iehnCputCPKWrhI0yL0auFLJiGBlyus=;
	b=Fud1AYaux84wicQJULr7iVR61ITr/FLEkMTVjg/RxpA7AScpdHvLtnelu/28ZwIkfveH
	 UCfRUZuS3Qlpk08bK9LBU6IYZqvWhU8TffPlO934t8YIRcVDRBttdAtxZjBoAdqA4SA+d
	 uZUsl/ofA3WqpjyWgfXimd4R7HCE3gb7qwNVzYrVNRXl1XqNIOexDhJ0kZBYelDuM6caz
	 13v67EpxGSWPaUI/IOxkJlhV+LvYg2PmpcNcrFLZ5S+HIY2G4YW5oxC6yZpnAc2tx4HCz
	 xXU5+SWcFjxTD2RH2Ws2zO3gPDOxGj92VF3EghbMbgOOad59ByyubOWQM6kVKSRYeVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jcXRvlMg;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40D606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 23:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC40D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jcXRvlMg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794956852; x=1826492852;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RggtgDf3joADADpwQJE/hGRaz21w2NUUDrTt1sUi230=;
  b=jcXRvlMgspc4wt1SHJo62r79GNCxHS1C5Pp9zSQ4kL/lvuViQIVqrAsi
   VFKmT0nwto9pMWYOp1g+5WrcULl0gBBgG1uhrqGPgtH4CgMjWDWD8KwDA
   3G7bEXEbunUXsDvCh7xKD2EWsJXM80bucDRl87r7eJpXtESPI2C3BMe4+
   1j+1FI550jYP/JRMdibaXmi7yeLpduphm9EKHlO0/xf1+3sWTsdEZG3AV
   S2kA9HmytVUZ5olp80R5j4rm5I9s+yX52L0zUlfkXDuKsYJPjYvoLTj46
   rKt26KUASEJSocwSeAXccm/j8AJoRQhsYmiw2MPF4EZbAFkZ3Hd7qauqb
   w==;
X-CSE-ConnectionGUID: l0SCwxVpRJqluYbucI08dw==
X-CSE-MsgGUID: dZ1A5IYjTam1e01ADSIDFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3751676"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3751676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 15:07:31 -0800
X-CSE-ConnectionGUID: pij2gRcfSpSfkk2BunuNFw==
X-CSE-MsgGUID: BrNfuLQHQ9a/oMJ5ZFmuqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9960744"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2026 15:07:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTSGt-00000001CdF-32c0;
	Tue, 17 Nov 2026 23:07:27 +0000
Date: Wed, 18 Nov 2026 07:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
Message-ID: <202611180504.XxXMU3Rs-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261104070441.74127-3-val@packett.cool>
References: <20261104070441.74127-3-val@packett.cool>
TO: Val Packett <val@packett.cool>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abel Vesa <abelvesa@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Maximilian Luz <luzmaximilian@gmail.com>
CC: Hans de Goede <hansg@kernel.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-rtc@vger.kernel.org
CC: Val Packett <val@packett.cool>

Hi Val,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on abelloni/rtc-next abelvesa/for-next linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Val-Packett/dt-bindings-arm-qcom-Document-Microsoft-Surface-Pro-X/20261104-040432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261104070441.74127-3-val%40packett.cool
patch subject: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro X
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261118/202611180504.XxXMU3Rs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dabc01bba1df10de6fb3c32fcf9db4aafe78f38)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/202611180504.XxXMU3Rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611180504.XxXMU3Rs-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:400.1-11 Label or path smb2351_2 not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:404.1-11 Label or path smb2351_a not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:803.1-17 Label or path remoteproc_slpi not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-cambria.dts:34.1-17 Label or path remoteproc_slpi not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:400.1-11 Label or path smb2351_2 not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:404.1-11 Label or path smb2351_a not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:803.1-17 Label or path remoteproc_slpi not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-carina.dts:46.1-17 Label or path remoteproc_slpi not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:400.1-11 Label or path smb2351_2 not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:404.1-11 Label or path smb2351_a not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi:803.1-17 Label or path remoteproc_slpi not found
   Error: arch/arm64/boot/dts/qcom/sc8180x-microsoft-caspar.dts:34.1-17 Label or path remoteproc_slpi not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
