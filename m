Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5312236E8
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769246756; cv=none; b=BID3tJ+rdPKhIBQWQWxEV7t7cx5ShAJbd2ZXnQoDo1v1eLRi2TbrabRr9tJlg+954Sk0sok1aHmVu9aEBUXtG0wRg4hRYV3SGX9Fx3ZFrFnvI9w4hlReyCkkCJ0vz0ZJLfflHaALyBV1EThuQpaisJOPTijO/XXcYFa1yjENZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769246756; c=relaxed/simple;
	bh=/6vwQAQ30CznTspylG3SR305K89bcKEef1Pp9lVFovI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHQlpWJ9TdQWJ3Pke1XdkpFXuaHZG20y68yKb5+uXMdUVeCDPEhLnp2x1ksBcn//qk/jHqnDeGcXZMEf0luOTkNE3/jOrWi8vUaf/p5+TjmFKbMlG5bNuYTwBs4GGjK71+LnrmZIJspwxF0XROpZjSUgVI5Iwtg+vyTetQ0Xyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vge1YLlQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vge1YLlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769246755; x=1800782755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6vwQAQ30CznTspylG3SR305K89bcKEef1Pp9lVFovI=;
  b=Vge1YLlQK1a7WTNaP611hWcrEVMowyVWADzucbFENjMqnDrssGPt/ECu
   7rf6rS8gi4tRltWwRi6MvteJeiMykCJndPB+bjqub/HceB76zm8D4n52J
   KursJxe/WUleXVsjaWGHI6sC5+YxUkdA1RI4IYB609XB+qgzqMb/VyLaX
   n1u4XuRpZmnclv3xnCtpspkgsz75rwpLyHnlTHrbe/MOqNd0ZjaSC5zhi
   3q7bxx7U+K0ANwfg6muz1E50T0KniMq3QYS5pgYXMyNp6F9nzwSLwu0NQ
   Popo0AsLOrN0vtnP0WhFU2Sb41Kv4BrV3ARfIPfhqtiN5ykLPdiEzPez6
   g==;
X-CSE-ConnectionGUID: Z8DuHCpTRGO2jibW2cOgkQ==
X-CSE-MsgGUID: DIAR/6k8Q8ewqbC1WIJEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70382669"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70382669"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 01:25:54 -0800
X-CSE-ConnectionGUID: 1XTlWbCQSp6SRHRHhlVq3g==
X-CSE-MsgGUID: Cn2fV+17RaqKlCZxw4t2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207661282"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jan 2026 01:25:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjZtv-000000000wD-2Fr7;
	Sat, 24 Jan 2026 09:25:51 +0000
Date: Sat, 24 Jan 2026 10:25:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Message-ID: <202601241047.7S6ymY5V-lkp@intel.com>
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
In-Reply-To: <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
References: <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
TO: John Madieu <john.madieu.xa@bp.renesas.com>
TO: claudiu.beznea.uj@bp.renesas.com
TO: lpieralisi@kernel.org
TO: kwilczynski@kernel.org
TO: mani@kernel.org
TO: geert+renesas@glider.be
TO: krzk+dt@kernel.org
CC: robh@kernel.org
CC: bhelgaas@google.com
CC: conor+dt@kernel.org
CC: magnus.damm@gmail.com
CC: biju.das.jz@bp.renesas.com
CC: linux-pci@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: john.madieu@gmail.com
CC: John Madieu <john.madieu.xa@bp.renesas.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260122]
[cannot apply to pci/next pci/for-linus geert-renesas-drivers/renesas-clk geert-renesas-devel/next linus/master v6.19-rc6 v6.19-rc5 v6.19-rc4 v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Madieu/PCI-rzg3s-host-Fix-reset-handling-in-probe-error-path/20260123-220948
base:   next-20260122
patch link:    https://lore.kernel.org/r/20260123140031.94752-16-john.madieu.xa%40bp.renesas.com
patch subject: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241047.7S6ymY5V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241047.7S6ymY5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241047.7S6ymY5V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: pcie-clkreq-n: $nodename:0: 'pcie-clkreq-n' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: pcie-clkreq-n: $nodename:0: 'pcie-clkreq-n' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
