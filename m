Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F8A288C38
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759458492; cv=none; b=hZP8H55llBYlYQYG0FT8jWRI1eeo9NUv3+XJhUbQKozkdto16rlKawC3ayKijEroDh+CHz5jXTcAFAGerpn6sZIGkwa/5d2OVfWHMaOAvgiA812+HafHVKp/mTswIqbmG6SM9IXSjzsl0oOsPojzfHHv6m4tiPFHKCnuOo90j8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759458492; c=relaxed/simple;
	bh=uw1jazKBBLbhLMinSyDTM6uBuEBhjAiG6iBdtiN/s4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7u4TSDZIuTJrIMxEXrl9Bo2bafFK+enAhr4o5i6xGTmwur2uuXxnSyE/QYV0OE6bnwa3QnkHHC9Qy5VZZnPGxs4FoyGkKdLL5LbHduZNKROaDIeK6PYc/yL8XwGLjEGupW8BWGgw//OKCQRAVcvcZ4J7IXJ81gJ1vXqB5P1hrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXSjj4tg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXSjj4tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759458490; x=1790994490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uw1jazKBBLbhLMinSyDTM6uBuEBhjAiG6iBdtiN/s4s=;
  b=RXSjj4tgGHWEHL4x5ourUwzwuZAZo9jGJSUbnHQwVjEELkcLJDqecZjz
   uEDQu7CWlG2A3BGcByLsTq/jqDCa2Yl12T2y6GDvpTqqHeqXscO4QOp5W
   CceYr7pxwuy37ydVCYZ35yjw7wv1bF1JlLI/nsLcN+lvJKWMmYzIiJVe6
   J98Um1j6ZYSL2HSmqwaAeDzCn4wbB1XA8JlU/wlxHIlXqJpr0emCSEjQk
   KlJAtSXI+wi4oVsDNZX2iaAGGW4Op5QGgITbq3NxlSsp2ZslBuy9Tq8Xg
   JSQ0c9lJq4We5dd+Pfjb2a6KIkkE8+INNLYGSf1spW+degJzQgFBio/+o
   A==;
X-CSE-ConnectionGUID: r9wz99JsT/2AfYF+9n0txQ==
X-CSE-MsgGUID: 9NIT0hZVSI+X5bmdSJowhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73097956"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="73097956"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 19:28:09 -0700
X-CSE-ConnectionGUID: Bz7/2tmuTu2W9FX8w2Etbg==
X-CSE-MsgGUID: 6dJFv+5qR1Sh58+NXTy+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="184386601"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2025 19:28:08 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v4VWg-000000007L1-0cZD;
	Fri, 03 Oct 2025 02:28:06 +0000
Date: Fri, 3 Oct 2025 04:27:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 93/128]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000
 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated
 properties are not allowed ('data-lanes' was unexpected)
Message-ID: <202510030436.ZypBJdPH-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Abel Vesa <abel.vesa@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   2949bb3792dc77680810d071b39c600a94cb95dc
commit: 8f5bf2305b4994dc72270d6524edae8df271fbe3 [93/128] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes
:::::: branch date: 8 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2053-20251002 (https://download.01.org/0day-ci/archive/20251003/202510030436.ZypBJdPH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030436.ZypBJdPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510030436.ZypBJdPH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3012.12-3017.7: Warning (graph_child_address): /soc@0/phy@fdf000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4884.11-4894.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3012.12-3017.7: Warning (graph_child_address): /soc@0/phy@fdf000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4884.11-4894.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
