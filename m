Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD81CEACB
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701488; cv=none; b=BtvMbMn0ZqQWrJXH3xWQf2WFuDzKBveIOvTdnvh/5Y0Z7SxlV9DXFYbsEQ6+EX9sn4dcwtBK/hSnkxWa/6brkjjFu2NsX9XsCTyncPo1uFYD9/etlz+JAOW5qvbAOiC0WU+uDzkZGbM6JS0dPiyvuooqoDUkdn//hNMPWxR+OE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701488; c=relaxed/simple;
	bh=1ovXekMd16lIsEOhuTEUMg6pL7yMHQcw6vR41d+fxjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiTtG6ynbO9M8pXDRKH1/neWRQkcbcSMzk5P8sSuKD751ELR9J7QeG0KQeIj/E3BO4FYiXuxMGygHQyO3/DSSNa4aBy/s097rblQ8g+2odw5rUn7OqquUwSxjmNTDTRusnhzhq9qviLNWbjAsO7+zbzctjipSETKVdXAuSD/Q2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdUHqBXI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdUHqBXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701486; x=1766237486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ovXekMd16lIsEOhuTEUMg6pL7yMHQcw6vR41d+fxjM=;
  b=OdUHqBXIFYOURljsKcQySYOnZEVo2/14Pk0YXBs027nqUoxOVsUySdWq
   0gafXWZcVUAr/cBg0//zjpHz/hnDK320UpUsdrXvTIE4soyr4CCatS3BR
   vm3LKGgxwsfT81EG/EaB7Izg2q+0UUul0svaEg9izvlyk1IEHP74uIfGY
   Sd9gOeRyz8/nvebObLLZMVeNqdbYCmVAUPytOuIbpouyDBg01A+zYPQmn
   VBEmyu32gL1eZGkpDXni6JXzGoE2WtXAXhkzWHlUZpXfvKYyOur2LxCKZ
   kid7nyMZ5wUQxzYUHAUIUC/Oryk8Jy1B0ZfFBLGDIDi6sKyfgOCoWIX2t
   Q==;
X-CSE-ConnectionGUID: P7EaByobTXKWNy6hy3IeXA==
X-CSE-MsgGUID: S7MbWSsMQJ+5n5tUFxzxgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45740729"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45740729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:31:26 -0800
X-CSE-ConnectionGUID: GQE3qlOKQTeKmKEd84x1tA==
X-CSE-MsgGUID: ck/PeSLbQ6yJoVUr6g9jSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103502797"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 05:31:24 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOd6A-0001BP-1f;
	Fri, 20 Dec 2024 13:31:22 +0000
Date: Fri, 20 Dec 2024 21:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Message-ID: <202412202152.7WyYu0Y6-lkp@intel.com>
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
In-Reply-To: <20241212090029.13692-3-crystal.guo@mediatek.com>
References: <20241212090029.13692-3-crystal.guo@mediatek.com>
TO: Crystal Guo <crystal.guo@mediatek.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Crystal Guo <crystal.guo@mediatek.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com

Hi Crystal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crystal-Guo/memory-mediatek-Add-an-interface-to-get-current-DDR-data-rate/20241212-170306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241212090029.13692-3-crystal.guo%40mediatek.com
patch subject: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek common-dramc dt-bindings
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: csky-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202152.7WyYu0Y6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202152.7WyYu0Y6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412202152.7WyYu0Y6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: support-ch-cnt: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: fmeter-version: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: crystal-freq: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: shu-of: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: pll-id: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: shu-lv: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: sdmpcw: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: posdiv: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: fbksel: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: dqsopen: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: async-ca: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: dq-ser-mode: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
