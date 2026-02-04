Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12E2D7D42
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219186; cv=none; b=GNFUwnDwGMTtQPGqcBmn1KrpVdqPsjT2N98kS/MYrCxKWkPdND81gNvjMDWrckNOj2xBtOv318iP2wvPnXxVTWxG2SJSM3DpFQW6BC1LNUmP7GyZ+ZumYChwM3pU7OmZdxDy2QgfLmpqpyNE4e30bbxle/LcOZUQ9fZzfl+JcwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219186; c=relaxed/simple;
	bh=aqk+f4/MrMv5tDa6b7Qpl1B7y/XmrQlJu7ms0z8q6M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btyJbXxi3dwSjav1S7wI+UuZdanucI/aD9rKcrvhfJKhxpMyUbOGAq6VeWplRKQT2JENnKgzihCihVlCmnldDwf6IwGXh99C/mJofrIbYWXwmrR5qjc1L6JWZeWRK5HxtzXgxq4PNiGAdzS4PJynECOg84WUvkncH9tjmPPyBpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dvqf5vxV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dvqf5vxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770219186; x=1801755186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqk+f4/MrMv5tDa6b7Qpl1B7y/XmrQlJu7ms0z8q6M8=;
  b=Dvqf5vxVQtBuPYRBuKVB5K9syssTAh7XbgQEJq2jzCI1H/0foM5k7amt
   B68vU3c5bV9kR8yhYTXMJppcDQkLhU5I5P437gsMDnEj/dJWGVMK8oFV6
   76MEWbjhpmnAH7ams0Jdc8GXNQzCB7zOJl69rM5U2UYHMYKtPvjjZpBtj
   zUeSAoBp38XXhx7u1M3xJ4DE9vuQFBycGViiqH/M+TyurfoUm/LtXBKoM
   zZ3q7grWBiWqy1aUAxSQIJ17vhCMxgjRi7336z2et1grb14KaBgxo+JrS
   BonJ1oRZIlXbrDB86ZtGY5h2je8l08pF4giJ+1TpbsGPBYOzDoRJDYdtE
   Q==;
X-CSE-ConnectionGUID: ceJUxUqqRIO9P7B8G9xYxA==
X-CSE-MsgGUID: jsp+k/+bQLaB6macRlqwHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75260835"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75260835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 07:33:06 -0800
X-CSE-ConnectionGUID: 1TtyRhaVRRiMh+/+VNItqg==
X-CSE-MsgGUID: ismUBfGPTzaZ8OvjrcTsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="240968579"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2026 07:33:04 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnesI-000000003ib-1ZKJ;
	Wed, 04 Feb 2026 15:33:02 +0000
Date: Wed, 4 Feb 2026 16:33:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] media: dt-bindings: media: microchip,dim2: Add
 MediaLB DIM2 binding
Message-ID: <202602041630.5LXKhtw9-lkp@intel.com>
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
In-Reply-To: <20260203041325.12419-1-harshdaniel66356@gmail.com>
References: <20260203041325.12419-1-harshdaniel66356@gmail.com>
TO: harshdaniel66356@gmail.com
TO: parthiban.veerasooran@microchip.com
TO: christian.gromm@microchip.com
TO: gregkh@linuxfoundation.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-staging@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Harsh Daniel <harshdaniel66356@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.19-rc8 next-20260203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/harshdaniel66356-gmail-com/media-dt-bindings-media-microchip-dim2-Add-MediaLB-DIM2-binding/20260203-121629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260203041325.12419-1-harshdaniel66356%40gmail.com
patch subject: [PATCH v3] media: dt-bindings: media: microchip,dim2: Add MediaLB DIM2 binding
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2052-20260203 (https://download.01.org/0day-ci/archive/20260204/202602041630.5LXKhtw9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041630.5LXKhtw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602041630.5LXKhtw9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible:0: 'renesas,r8a77990-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible: ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible:0: 'renesas,r8a77995-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible: ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible:0: 'renesas,r8a77990-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible: ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible:0: 'renesas,r8a77995-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible: ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
--
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/microchip,dim2.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
