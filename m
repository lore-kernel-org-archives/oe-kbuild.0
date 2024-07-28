Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815711392
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jul 2024 01:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722130191; cv=none; b=pFHaPAepS4jX6zQcawbfllMkzUoqJRa8M1W0lzGRhfrbgoAJu4QKfNAofMNEwMenLJmkkD4dttXBIvLwGDnXdnF5BlVv8Lj7RCLUE8xVnVIFqnQUyB2XCEkDVzQDPJJUQFFg/1rWd7NWhLGScJx1hLZavlLjcdiEEW6/DkF5Hvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722130191; c=relaxed/simple;
	bh=ZN8/35kQB24gs9VMi8HOLiPrJO1Rt9GL6zl8mt2y6Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1yRDETavVCueG3z/EVSO7z30yhNN/qa7hnkRLr4UO6gyXdEgT6PYRrCc2qEGgGVzsVjKWdjEEcLSGokvoTjBDr2FeWfIa66rxAr7NGXYzDEJovSJflXR1WcbYDRZMKT+W3inWUBTYTYrWiznN5Jpqn7I8hMIDf7LDk8lZy5JYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKWO1iaE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKWO1iaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722130188; x=1753666188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZN8/35kQB24gs9VMi8HOLiPrJO1Rt9GL6zl8mt2y6Tk=;
  b=QKWO1iaECG3NqG6h2XhkUysnXoAcrvIApaWAoOyUGYDvCz4h5GKikyuJ
   SEAPAomowzImYLEzKHyBq8mwNJyQyUAC6653NYyOu//znhMRGXcBZfrix
   9Eevw54mJPOa7iqdxP7Fyst3y+bQPbzwcY79YMqeSHgNnLPbd8od9LRr8
   qc16gyr1Wx65tiEzOOwBsGIxWf+XXUfTRd4ZykcG7ER6t+rxvEEHAXGEt
   sTi4kXGJIY3DkrlpcubQ0fhZrj2pYyl/E4dAdh8FAS3oCt9hLHNfDEkdr
   w65JBzE1LihIjUccbHM1UZg8jbMXNEn1Se5p6CXRFAd7H6EP/lGGtszem
   g==;
X-CSE-ConnectionGUID: fgUJVFDtQBKRxdQS7v4ucQ==
X-CSE-MsgGUID: boysSY85QAm7ubnwYGwGlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="19587550"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="19587550"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 18:29:48 -0700
X-CSE-ConnectionGUID: XEbr7pBqTQOfuBk6FE1/hQ==
X-CSE-MsgGUID: 0Zvhp9ltROidBT4FCX5XeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53275584"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jul 2024 18:29:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXsjI-000qPk-38;
	Sun, 28 Jul 2024 01:29:44 +0000
Date: Sun, 28 Jul 2024 09:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: msm8992-lg-h815: Initial
 support for LG G4 (H815)
Message-ID: <202407280935.KnJ3mzhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240727201413.114317-3-alexander.reimelt@posteo.de>
References: <20240727201413.114317-3-alexander.reimelt@posteo.de>
TO: Alexander Reimelt <alexander.reimelt@posteo.de>
TO: andersson@kernel.org
TO: petr.vorel@gmail.com
TO: konrad.dybcio@linaro.org
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10 next-20240726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Reimelt/dt-bindings-arm-qcom-Add-LG-G4-h815/20240728-042033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240727201413.114317-3-alexander.reimelt%40posteo.de
patch subject: [PATCH v3 2/2] arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm64-randconfig-051-20240728 (https://download.01.org/0day-ci/archive/20240728/202407280935.KnJ3mzhG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280935.KnJ3mzhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407280935.KnJ3mzhG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8994.dtsi:132.9-151.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
