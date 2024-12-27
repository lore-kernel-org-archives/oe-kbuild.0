Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424A1F5F6
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 19:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326329; cv=none; b=XqjAIL9cSQ2pomwxZV+/MigA6Pqxkr7mj2l400TR3QTnfxBv0p6mDonWvM7rhuJGtoMkfQzBnrZPYqDsWdIx6efwP5cK+zXuF0+34Nb3mPH3qFmhDqcj1kvQ8gTY5r5lB2yDRLOFWVue49d6IcTNZF04S3MVY5B/oislge2BNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326329; c=relaxed/simple;
	bh=8HzOkXTZ9/wwVEPQ40/na4OoXgkHuBl7p1S3mVzqVE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ph0hrXOmq+VXZZvEZta6x3HCjAFsXpTt4sTD6wZPiVFXFb/HYABGpAOvOeGVe6mfetTpsPX8Mz313YuqCkGju8RLct/GllSOrETfAyPdliPr8jieaX7vjPhj+evozuyb8Hq7enhSby/ZMqbeUeMpFstTirFJfcABZbruPEWlBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDFLpFjF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDFLpFjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735326328; x=1766862328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8HzOkXTZ9/wwVEPQ40/na4OoXgkHuBl7p1S3mVzqVE0=;
  b=XDFLpFjFK0IIXbyOKcNiBJDZMCRiC5748xQsZfnZF9EbvslHCWAd3Q8+
   cHdQjp0J54APluAwxW4PK0LgbaR08po5CGOxafREubvZJAyHaTfZp3duO
   sOE2i8/NAPSrjOW240hgRMTQOuD/wOK1teeLVBy7IfOGvMkuvEszbjFNf
   stUujV1xgD178swAZK87KoH9nzoAFqOL+D3mS1DrOaXK3FvTeqzvUy7Co
   kkCv7k3ft7dnjjrvcQhx51kuVNaTWBsfP3I0Iuy4QIBbGXJwIXd47fwht
   QL7wt7KK60DeUpjGLnKW9CXIWKSt8BG9f6sDqEVprGqKYjeWcQ59h+CKj
   A==;
X-CSE-ConnectionGUID: pROd8xTOQgGQWgeIsnaDQQ==
X-CSE-MsgGUID: IFPWOYJQSmK/30hohGMfrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35843238"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35843238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 11:05:25 -0800
X-CSE-ConnectionGUID: HOUBKLcoSHSPE35V9T7JcQ==
X-CSE-MsgGUID: wzD8tK5sQbGYahenZKSHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105067751"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Dec 2024 11:05:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRFeC-0003Ud-1e;
	Fri, 27 Dec 2024 19:05:20 +0000
Date: Sat, 28 Dec 2024 03:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 73/123]
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: panel: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412280235.Ldmicq7A-lkp@intel.com>
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
TO: Maud Spierings <maud_spierings@hotmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 9861aefc51102c8f4b419b57af451b63af0dd79c [73/123] arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
:::::: branch date: 15 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280235.Ldmicq7A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280235.Ldmicq7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280235.Ldmicq7A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4662.11-4672.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: panel: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,atna56ac03', 'samsung,atna33xc20'] is too long
   	'samsung,atna33xc20' was expected
   	'samsung,atna56ac03' is not one of ['samsung,atna45af01', 'samsung,atna45dc02']
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: failed to match any schema with compatible: ['samsung,atna56ac03', 'samsung,atna33xc20']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
