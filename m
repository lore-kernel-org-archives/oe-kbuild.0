Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4070372
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 02:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754102300; cv=none; b=QxF+l3R55xVurihSj96+OvdPe6WlF0VNwSFEEId/z3N6YyezRRwtF00/yqP4M6MUv6X8ZLYDNatjjHepMJXTEH5NK13sXm9tkIp9KHNVyGMsKs/jmUCPk2KZ3s0WgiXI0YyKACAQnaUXe+jM6aMwLJ3xYePugFmqGcwyL4M2xEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754102300; c=relaxed/simple;
	bh=NgD52P07/SzXovb9YzzCh75Qrspw+HDz5hBh7rd+GG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLJNEYAafPz3c58U7L0YEZXhCns3pNlbgwKdzuwfbcnYspNk6nwyxzq9vv9VzgYcJZyRHi4V6jqKuoEr/EC8/2gnTgeKzjWlq7dJ+0AK8oJI0R2l+OzrAC19qFuMC5RxxUjAJMFYOhzthGvORLssLEGptW933u/YG/VKkOYGnJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYwuttrj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYwuttrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754102298; x=1785638298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgD52P07/SzXovb9YzzCh75Qrspw+HDz5hBh7rd+GG0=;
  b=bYwuttrjAg6WSVkD3P2PGODjAgraPtD+jfwHOzXDR+HvcotRAd/IlcIK
   4/cHczA6PqbHPtD7qjDGJl91Quzj9BaGNz5RZI+L1o6Jspa8b54i3q17M
   ULjWVti5Yj53b7aPJF62YVlDgQS0HBXDUL5Win7Hb5eg2DfG+Ha9wfEHS
   8GRD2cqTbmwNpZ6Un2Rnl6nTa/6q51VUB6al73rI4metO/5bzvHI86I0I
   /Yrg/wxdxT8Bu2bIz5ymyOGz0cko3T6LS7hdWuFZnmsQAc2GWOSDzMkSH
   0ZhR1rdxB7aI9kegI4FH0YG9h1add9gEjH+7UHepiaD8pPLEHiOpxzecJ
   Q==;
X-CSE-ConnectionGUID: v3ceSxohStuL7sQhMKroNA==
X-CSE-MsgGUID: hwKiXwfmTOy5LckTwgpOkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56589960"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56589960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:38:18 -0700
X-CSE-ConnectionGUID: caXDiF/YTteTg4nkowXmKA==
X-CSE-MsgGUID: R5Zk1WaYTn2Z5+MNRrQ95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162991222"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2025 19:38:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui28U-00056m-23;
	Sat, 02 Aug 2025 02:38:14 +0000
Date: Sat, 2 Aug 2025 10:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting
 node
Message-ID: <202508021004.ITT3mtc4-lkp@intel.com>
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
In-Reply-To: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
References: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
TO: Biju <biju.das.au@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on linus/master v6.16 next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/arm64-dts-renesas-rzg2lc-smarc-Fix-typo-for-deleting-node/20250731-205310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250731125109.147422-1-biju.das.jz%40bp.renesas.com
patch subject: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250801 (https://download.01.org/0day-ci/archive/20250802/202508021004.ITT3mtc4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021004.ITT3mtc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508021004.ITT3mtc4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: can@10050000 (renesas,r9a07g044-canfd): 'channel0' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: can@10050000 (renesas,r9a07g044-canfd): 'channel0' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
