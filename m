Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC91F8AC5
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Aug 2026 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419277; cv=none; b=XYW2Mhh8scqyQxxvUKujBF7RIoDe9HbKsYI7hd9ce1nmSMXvjSqgKcbcHZUqAaS7fXuqis1b7TRYbl8K6f/EDGlaVLw5ZDmf95ifapWi8IItNfSKRE5lkDNU7h4X2Z2yWemc1eqsvW5dNGeURppbXU1wa/+rE1JX1BT3zdERtxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419277; c=relaxed/simple;
	bh=eeaJaACdRSKotPJLsFXnSXsA7uDUeQre1smAMt7JTAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hSDf9nsHFObHiOq1idYC2Q1TGJvRcPNQq92kMosWnEljidJKCKmKpVqzm65QnsCZXzLQYgypFP2M4pjDN9PajVhpjynB9njWtDYnrSSkCcNPU7UohB15pblohFDoSaV8y9OoNQKgGhTdg/c8iiZF1oAViUx/QZssYC+KkayGfdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRs0ZjAS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRs0ZjAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786419275; x=1817955275;
  h=date:from:to:cc:subject:message-id;
  bh=eeaJaACdRSKotPJLsFXnSXsA7uDUeQre1smAMt7JTAI=;
  b=PRs0ZjASklNX8BD9tR71WBk4D5hZ3V1NjBMTBIyiOOXVUCQrZySXe1Yw
   6V3e7M21Jof/WYCqBeOnnINLMVy+XBOgEMkOzZYc8LiBWcZuwGvlEaL4Y
   yOpcRUoFklw/DFQ4am8/hg9B1BVibf/zabQ97+UBAoVp7Pl6i54w3+Xu2
   imBvwvyI/lj4DjzSYaB+POpmkfiX/h8jTeBd2ezdIx4lPHAorn/RL0rcH
   XV4ZxFEnewzfcTB4goYqqjHVKZl0sJhWFNAEpdLIb4KK7EillPD5zDU/7
   vrQkBjG5HxW3bOQ1cQve6isahaHmUgln1Q5wHeJH+HpfHW0vOia4EFQU1
   w==;
X-CSE-ConnectionGUID: 8Bfz94gAQbCyvQJV3vT4Sw==
X-CSE-MsgGUID: coDoYEiBRiakIi6zDt17ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="89470211"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="89470211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:34:34 -0700
X-CSE-ConnectionGUID: oBRBtiJRR2OBXaWAlkOW5A==
X-CSE-MsgGUID: dTLDxfOhQFCnXI04oUpkdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="265223187"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Aug 2026 20:34:33 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtdG3-000000005YU-0Sly;
	Tue, 11 Aug 2026 03:34:31 +0000
Date: Tue, 11 Aug 2026 05:33:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64-intend 132/152]
 arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usb@5b110000
 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed
 ('iommus' was unexpected)
Message-ID: <202608110550.0Ma5k7l8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64-intend
head:   825817212686334aa7c3c04d6e2797647ef7fa6e
commit: 239bf457d81dda8a71d7cae04bcb745e4efba1ee [132/152] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2055-20260810 (https://download.01.org/0day-ci/archive/20260811/202608110550.0Ma5k7l8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608110550.0Ma5k7l8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608110550.0Ma5k7l8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: usb@5b110000 (fsl,imx8qm-usb3): usb@5b120000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: usb@5b120000 (cdns,usb3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
