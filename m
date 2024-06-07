Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499B200A3
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Jun 2024 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717770863; cv=none; b=WYUAUFSDvTUpQjAB3GXciAhv0h6SHf5lEIyGZgJMEdBuF+SA7nAqW9tSao6jJM88Q3lJ64GyRUrUk0h+z2F9BSPpUpDG0LHyCb8/5B2bLvhhXWVi3rKJf8ugLUCDNVluya9uHXnVgpj1ztg4Q9dcN0fOoBL8M0fMvyn2l05mXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717770863; c=relaxed/simple;
	bh=9Rxf/XTTGgtpijCUCsqO1VLg2+8FFbBPIjKhlFE9Jbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkFx4dI7MoIVpTVvlZDlEZGt7qnU7b/5rOitT78GREo6v2EizrMnpxFyQMq9EvLxCGHe482CUraRJSiWnsXcANC/X+FegRznbnUo/nBTUyni0PH2PrDlUVfx2rSuIcOtoWc/EzrMuyBBAYqPJhz8SzqD5McQc88bPs2Yg5zAGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR08wNfv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR08wNfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717770862; x=1749306862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Rxf/XTTGgtpijCUCsqO1VLg2+8FFbBPIjKhlFE9Jbs=;
  b=CR08wNfvLFrz6KDibZvSfwpNx/qPJLYQb3zyJ6R7DOSxgFLDBKROI1fK
   CO13Kd7QmIXXXxx0XmryDrGlyeCD8u//SPUl6O0cZKPftNnXSJsOIiCJ1
   XhA4Er+HIkDg9CUObJm3ajaQAy41xlVu0YBQ0fHH/RvIXZQ3eJLxn2oUB
   PkSlqqkOLKAxmFIOLrMnN5oQlUpC2n0erpZUWbnb3Vt3Uevc+INbIVGM2
   dWLnFpaawsVPj3cjf5WAjp7XQXCFY0CJcGzanxjTZdHWr+De9fGQ8hnWz
   tapWCXE8q1kQ968l7KSuo0ROc5m1faaVr/p4cmnvRHOnBTTZ6KLtNBlOt
   w==;
X-CSE-ConnectionGUID: AzjXFDBTTASj+cjfP4xQRg==
X-CSE-MsgGUID: TOVWUBn2Tw2stuCiju5O6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25148546"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25148546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:34:21 -0700
X-CSE-ConnectionGUID: LPb3zORQQJajCoNzWqAucQ==
X-CSE-MsgGUID: y7ImIzy8TNCiLhimQlR0KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42792525"
Received: from lkp-server01.sh.intel.com (HELO 7b447d911354) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jun 2024 07:34:21 -0700
Received: from kbuild by 7b447d911354 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFafZ-00001u-2h;
	Fri, 07 Jun 2024 14:34:17 +0000
Date: Fri, 7 Jun 2024 22:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: also defined at arch/arm64/boot/dts/qcom/qrb4210-rb2.dts:167.12-170.3
Message-ID: <202406072207.7IeMkSrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem:   also defined at arch/arm64/boot/dts/qcom/qrb4210-rb2.dts:167.12-170.3"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a92980606e3585d72d510a03b59906e96755b8a
commit: f7b01e07e89ced85975345b12cb63538ee07e91c arm64: dts: qcom: qrb4210-rb2: Enable display out
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406072207.7IeMkSrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406072207.7IeMkSrU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6115.dtsi:701.34-710.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@4410000: simple-bus unit address format error, expected "4411000"
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1253.27-1323.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>>   also defined at arch/arm64/boot/dts/qcom/qrb4210-rb2.dts:167.12-170.3
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1211.11-1221.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
