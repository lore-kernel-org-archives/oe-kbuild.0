Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0426FDA4
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754646817; cv=none; b=MAB7nkZZxoytfk1Jj6RTqn438xI2HFzMp789uOItlqQtVNvvvbg5ywxO5xfbKoflGiDOVg4/czT3ex9GgNWEtUH+jV7PPgTAm2wPEtKbstlr3R7TedqsN6h0RkeO8rFJmlS6y/TiqgrbDr+lQ4ikkpWjVxqPhEiOUKLM+z76tgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754646817; c=relaxed/simple;
	bh=RbePJULomk4cqjm5U8kPggo0zOMtAXq/yjBp2TkZNdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBcjjBllBpUFFSn472bDVp4BrPataWUIuS0ut9s1AWiNe4WUqIqbswj4OeKxOM4BdjHQCkXooYIaXYwAjsoQZgb/EFUvEwqwX4EcJTNwgN2UbapoRPNMCpkYVCYQNeh+r+dPURXpVlvnX6meehX0r1opBiQMQVc0CnupiWnaLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/9svy9Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/9svy9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754646815; x=1786182815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RbePJULomk4cqjm5U8kPggo0zOMtAXq/yjBp2TkZNdE=;
  b=A/9svy9YbE+Y89Yho1pD1i0HXXFbPyAa+/Iwuc44pESOXMHSm5mdvCUy
   yg/QUITOQ0Fx1lqGyE9U6ENEpLODuebW9KktDv8tsYSd2uuc1W+AyGyFt
   ddhlnL/JLOf+LZC9bzDch1IbLOtlRe3gF8dHGmQ9vjV9NdePWINWuDh/b
   P3ViKBxhuBm+1v/q2Qry1HBNnzkMP9nK5WNhs8CYvmF27PPRAj8ET74tn
   VbGCBpBk8UD4XD8wMKEErSi/vgnHDC7LzrQWiHYOL0KDp/J+xd2gek4Mz
   o6WgiPOob6emNw25oxF6Lh3WDqusf4mn8tsrjgHXNrDu65hmCVRHKOB5G
   A==;
X-CSE-ConnectionGUID: Q8Y98dFSR+aW8+ai8e/+DA==
X-CSE-MsgGUID: DYr7OnlkQ+W1MesuqiH99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67583666"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67583666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 02:53:35 -0700
X-CSE-ConnectionGUID: 1VTlVV+mQJmLCadDNai8ag==
X-CSE-MsgGUID: aJ4NkPzXR2OdouH+JLuq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169752704"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2025 02:53:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukJmf-0003lY-2g;
	Fri, 08 Aug 2025 09:53:15 +0000
Date: Fri, 8 Aug 2025 17:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 262/801]
 arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: crypto_mbox@0
 (brcm,iproc-flexrm-mbox): reg: [[0, 2097152]] is too short
Message-ID: <202508081729.lfhWbSXs-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 5b4b8a92f4bf4dad8fc97a0f1f3d95ca2e78adba [262/801] dt-bindings: mailbox: Convert brcm,iproc-flexrm-mbox to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081729.lfhWbSXs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081729.lfhWbSXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081729.lfhWbSXs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: fs4 (simple-bus): raid@6: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: fs4 (simple-bus): raid@7: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: fs4 (simple-bus): $nodename:0: 'fs4' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: crypto_mbox@0 (brcm,iproc-flexrm-mbox): reg: [[0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/brcm,iproc-flexrm-mbox.yaml#
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: raid_mbox@400000 (brcm,iproc-flexrm-mbox): reg: [[4194304, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/brcm,iproc-flexrm-mbox.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: pcie-ss (simple-bus): $nodename:0: 'pcie-ss' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /usb/usb@2000: failed to match any schema with compatible: ['brcm,bdc-v0.16']
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /usb/usb@21000: failed to match any schema with compatible: ['brcm,bdc-v0.16']
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: hsls (simple-bus): $nodename:0: 'hsls' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: pinconf@140000 (pinconf-single): $nodename:0: 'pinconf@140000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
