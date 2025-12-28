Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CA620ED
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 05:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766899432; cv=none; b=BKjCKCZ89VjoVPLIjRqhbL5hqwkvt7ZF8uqm8FxAAw9VOCCFqt01lwIcNZjQoX/8uyihtq0VH8xehZPnEO3wSmv4Ls6GF5ThybGdJH7PpvkXFcPDggNfw07WZcA+z0+zqcq8uMpU/PtghDz6daiUtTbZDyYnetVAjOiF2ypirkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766899432; c=relaxed/simple;
	bh=45G+j2ROmKzeojd1vwSsIri4hAK5KOv+wza82ybLmFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vpy1WZ7hzyWa/XgYS0BkuraWJL0S3GZkgztXxKrfVnY+gihJBzm4kLEXy+aF6C+SrhEPLf9d5EPJrAb615BogZlelJRF8Ay4Pw769G+0XTuMjjRBd/Crhv1MoZqKG3rI3dAMBso1OpoL+OWOa7lSwzsNDp6Sz7SllkxAojgPem4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uzf8OteR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uzf8OteR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766899430; x=1798435430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=45G+j2ROmKzeojd1vwSsIri4hAK5KOv+wza82ybLmFo=;
  b=Uzf8OteR+hRRiyDQUtXu/WT4uqaiKp4AaE477NEKfLmTT5zQPIyFX/Ef
   u7wZip0gtWkrWr2MMzzkzNTwpTURal8G5QE0hw7XVrIFTwHMotCAN1h4u
   PFghSGm60eojmMiEZIZXmS4FUT2tPEFKf1IJ5otDbcS8YjLXB7CwuicAr
   WHkrAAKnUIE6dC0ebR86KWzLkqUJFjS/n991vLl/ZN77MmqZMF+nyhHqx
   9y68ipJoJpzK0y++8YCQ9Fom4aivJf29NNxrfVPcVNYf8otUtIA1ND86X
   ZtLRL/atFIrBrgzzuSdK9tyKZB4uttIb9LW51ebTR85d7wt5onFE+1elt
   w==;
X-CSE-ConnectionGUID: gUcBQvhiRfmSw39gxF16SA==
X-CSE-MsgGUID: TA3RA+zwQJql6uPRedD4OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68497370"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68497370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 21:23:49 -0800
X-CSE-ConnectionGUID: KJVHsRbJQMiq1TzmSF8vkA==
X-CSE-MsgGUID: nHWgFNAKTqOraV6pTxDlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="205135243"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2025 21:23:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZjFq-000000007Oy-0riS;
	Sun, 28 Dec 2025 05:23:46 +0000
Date: Sun, 28 Dec 2025 06:23:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 126/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/mux@38304c000: failed to
 match any schema with compatible: ['apple,t8103-display-crossbar']
Message-ID: <202512280637.S9ykNgEW-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 05517482ac69dcc86a1bbc2846d06f1d1f4756c0 [126/128] rm64: dts: apple: t8103: Add ATC display crossbar devices
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251228/202512280637.S9ykNgEW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280637.S9ykNgEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512280637.S9ykNgEW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: mux@38304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: mux@50304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: mux@38304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: mux@50304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j313.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: mux@38304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: mux@50304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any schema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any schema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j456.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: mux@38304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: mux@50304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j457.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: mux@38304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: mux@50304c000 (apple,t8103-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any schema with compatible: ['apple,j457-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any schema with compatible: ['apple,j457-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
