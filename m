Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5F360722
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520546; cv=none; b=kVcEBPst+ORA26SMPy93u6PcumVPWXCKKfCUxgNtW2jDiykxRys+JHLbBGCHqkZn6GlZ+PHZwqTejZ7rwrSVDjjnmBpD5TB0fRkoPLI/lxQ53VwyVz3CRrjS2wj87RXQO238gOBHwTjb7YJorYWEcfRH3lMhknAoLwuDN+c2IcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520546; c=relaxed/simple;
	bh=O/N81dmaZy5B2/CXFL8T1u+FpaoU53NoPJuIYArxYcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TeJ1fGBijAG2gJYX9H0Nlz2EM68CMehtpbjyahZDvMMunMcjK2gc9+BbEcAeTetvehV5YOd7mM2IW1PLQU2nvGrWaRItcyTPW9taqs9wbW4WNzYHqKSP3Ak6a0fWRKF/kT0aTjnkmmmzWzWFETDjLfJ2udUnXV+bWfJNEGW0zHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeYaHMBP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeYaHMBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779520542; x=1811056542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O/N81dmaZy5B2/CXFL8T1u+FpaoU53NoPJuIYArxYcM=;
  b=JeYaHMBPdJFdXWroEFO0gVDr3uHnUmPBhPBgdrksYA0cdfx3cE8kyLge
   EjiHo8UhIlRXmwr41xkZ8w0MXxE6ejo3IOlmxNu828u5u0LMBWoZHB0fx
   MpSi07AYCM+LXHSiJPRuG8OYFrA8KjNfhpjd5f4f6P+63sDcfZoT434Mo
   ZMKA41gQyWRg+uG1jmTeDNTSQYT30uwmC63gR9pzOo4ugzqbORReFs11k
   rrGLdN9f9wcJilATNkZDkUZM/KyWKUHFf3CTeBTgWjoQauLJlKB6UY8Nt
   B7hRajqF3+W4HUWi3mJW2YxHmLXT6JDY7naVbWcb0oKBOnpASTyq/3ifp
   g==;
X-CSE-ConnectionGUID: S94ZuKGGT1uxRF8yD+09ng==
X-CSE-MsgGUID: tQgBFJ/DQ/+4oIQnzPDDhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="103114202"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="103114202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 00:15:41 -0700
X-CSE-ConnectionGUID: 5YdfLfOXRn+V8KGGK1NypA==
X-CSE-MsgGUID: knNJO12WReeekMg3kDu2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="241324573"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2026 00:15:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQga9-00000000BY1-1zP1;
	Sat, 23 May 2026 07:15:37 +0000
Date: Sat, 23 May 2026 09:14:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: misc: add documentation for MediaLB DIM2
 controller
Message-ID: <202605230929.hv3exZ0g-lkp@intel.com>
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
In-Reply-To: <20260510184419.98043-1-contact.kartikn@gmail.com>
References: <20260510184419.98043-1-contact.kartikn@gmail.com>
TO: Kartik Nair <contact.kartikn@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: christian.gromm@microchip.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kartik Nair <contact.kartikn@gmail.com>

Hi Kartik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik-Nair/dt-bindings-misc-add-documentation-for-MediaLB-DIM2-controller/20260515-071025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260510184419.98043-1-contact.kartikn%40gmail.com
patch subject: [PATCH] dt-bindings: misc: add documentation for MediaLB DIM2 controller
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2055-20260522 (https://download.01.org/0day-ci/archive/20260523/202605230929.hv3exZ0g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230929.hv3exZ0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605230929.hv3exZ0g-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible:0: 'renesas,r8a77990-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible: ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible:0: 'renesas,r8a77995-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible: ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible:0: 'renesas,r8a77995-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible: ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible:0: 'renesas,r8a77990-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible: ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['fsl,imx6q-mlb150', 'renesas,mlp', 'renesas,rcar-gen3-mlp', 'xlnx,axi4-os62420_3pin-1.00.a', 'xlnx,axi4-os62420_6pin-1.00.a']
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
