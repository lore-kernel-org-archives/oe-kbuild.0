Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360C34D4E1
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 04:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768278226; cv=none; b=I900SlSr1ef1iLz5SERBj4On0d1mDoaDGeIsiPc4NBhuikTRXYnQfQxxvG5eW8fH/jYHmmBRmgxfC99m+WjNdqNFPPUxkCW0w6UkejvqJcD/ed33fxaf2kSzvO+fIExCoJHTnvdh9MiF6lu8fr0oDQog78ikOKiH2Tgi3NJIB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768278226; c=relaxed/simple;
	bh=GSj342GkshkFrVpWQAZYzirmQfT9OhMnuAmv5W4sRsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTWdWf2AulhlWe+w/fyU4t+Bh7DFCP8NElFl0peXIaN5IyIRZIV62/pzRWkrOPphkKOaRFzf4SjYFBIqDwk6h3XvyoXOAdeY9VdGWH+Tx3qo71/DjOMUPoCalOtZbt+JOvU+FVcrmlSRwmVe+b37orgWuKvlbebJN274iskfgxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COy6r0U+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COy6r0U+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768278224; x=1799814224;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GSj342GkshkFrVpWQAZYzirmQfT9OhMnuAmv5W4sRsU=;
  b=COy6r0U+LK+JMEi8V/WiIwXRg3K3EEjVFOxVgu2d5bwT+kZrENCXFa7i
   jHdYiDPwadjroJC0TQcJ3cZW5rxA9PE6YBA37J5Dk2SONh5/5VGrNPc6t
   GV1I6gMZ3pCD8O5Kk7vIzsB734To9/UR+R5w+hloZWT2lVC4ZqTwDR181
   dZosJtoTwKgLgHK9nE2cSzXXDI7PHx4C74FFAb1eDNPyJANx/K4+0+lo3
   S9lWcAEmvhf1vDHrGMPaiz8QQ6xnxZVnbhutkkAziQf4NgAJPSgon/kUj
   NpmGegoZOuZXrpwu0Mmum0ClpdrzMqt9VyLghrLyGuT7fByge/VuKPI32
   w==;
X-CSE-ConnectionGUID: tqsuRlI3Qz+yr/+b71KBhg==
X-CSE-MsgGUID: O2pVlWsJSUCMCKhIUHhoOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69470750"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69470750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 20:23:43 -0800
X-CSE-ConnectionGUID: 95Kq+8ftT5W/+GPzDEW47Q==
X-CSE-MsgGUID: BmHdzPxTTFmpRpEep37uHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204175852"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 20:23:42 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVwS-0000000013J-14g8;
	Tue, 13 Jan 2026 04:23:40 +0000
Date: Tue, 13 Jan 2026 05:23:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] dt-bindings: crypto: inside-secure,safexcel: Add SoC
 compatibles
Message-ID: <202601130506.NFKUvw9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260108110223.20008-3-angelogioacchino.delregno@collabora.com>
References: <20260108110223.20008-3-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: krzk+dt@kernel.org
CC: herbert@gondor.apana.org.au
CC: davem@davemloft.net
CC: robh@kernel.org
CC: conor+dt@kernel.org
CC: andrew@lunn.ch
CC: gregory.clement@bootlin.com
CC: sebastian.hesselbarth@gmail.com
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: atenart@kernel.org
CC: linux-crypto@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: kernel@collabora.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master robh/for-next linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-crypto-inside-secure-safexcel-Mandate-only-ring-IRQs/20260108-194407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20260108110223.20008-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 2/4] dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arc-randconfig-2051-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130506.NFKUvw9r-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130506.NFKUvw9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601130506.NFKUvw9r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml:16:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml:20:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

vim +16 Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml

cc03a934c5da76 Rafał Miłecki              2023-11-16   8  
cc03a934c5da76 Rafał Miłecki              2023-11-16   9  maintainers:
cc03a934c5da76 Rafał Miłecki              2023-11-16  10    - Antoine Tenart <atenart@kernel.org>
cc03a934c5da76 Rafał Miłecki              2023-11-16  11  
cc03a934c5da76 Rafał Miłecki              2023-11-16  12  properties:
cc03a934c5da76 Rafał Miłecki              2023-11-16  13    compatible:
cc03a934c5da76 Rafał Miłecki              2023-11-16  14      oneOf:
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  15        - items:
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08 @16          - const: marvell,armada-cp110-crypto
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  17          - const: inside-secure,safexcel-eip197b
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  18        - items:
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  19          - enum:
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  20            - marvell,armada-3700-crypto
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  21            - mediatek,mt7986-crypto
0821c0fc4030f8 AngeloGioacchino Del Regno 2026-01-08  22          - const: inside-secure,safexcel-eip97ies
cc03a934c5da76 Rafał Miłecki              2023-11-16  23        - const: inside-secure,safexcel-eip197b
cc03a934c5da76 Rafał Miłecki              2023-11-16  24        - const: inside-secure,safexcel-eip197d
cc03a934c5da76 Rafał Miłecki              2023-11-16  25        - const: inside-secure,safexcel-eip97ies
cc03a934c5da76 Rafał Miłecki              2023-11-16  26        - const: inside-secure,safexcel-eip197
cc03a934c5da76 Rafał Miłecki              2023-11-16  27          description: Equivalent of inside-secure,safexcel-eip197b
cc03a934c5da76 Rafał Miłecki              2023-11-16  28          deprecated: true
cc03a934c5da76 Rafał Miłecki              2023-11-16  29        - const: inside-secure,safexcel-eip97
cc03a934c5da76 Rafał Miłecki              2023-11-16  30          description: Equivalent of inside-secure,safexcel-eip97ies
cc03a934c5da76 Rafał Miłecki              2023-11-16  31          deprecated: true
cc03a934c5da76 Rafał Miłecki              2023-11-16  32  
cc03a934c5da76 Rafał Miłecki              2023-11-16  33    reg:
cc03a934c5da76 Rafał Miłecki              2023-11-16  34      maxItems: 1
cc03a934c5da76 Rafał Miłecki              2023-11-16  35  
cc03a934c5da76 Rafał Miłecki              2023-11-16  36    interrupts:
6ba4da14f53232 AngeloGioacchino Del Regno 2026-01-08  37      minItems: 4
cc03a934c5da76 Rafał Miłecki              2023-11-16  38      maxItems: 6
cc03a934c5da76 Rafał Miłecki              2023-11-16  39  
cc03a934c5da76 Rafał Miłecki              2023-11-16  40    interrupt-names:
6ba4da14f53232 AngeloGioacchino Del Regno 2026-01-08  41      minItems: 4
cc03a934c5da76 Rafał Miłecki              2023-11-16  42      items:
cc03a934c5da76 Rafał Miłecki              2023-11-16  43        - const: ring0
cc03a934c5da76 Rafał Miłecki              2023-11-16  44        - const: ring1
cc03a934c5da76 Rafał Miłecki              2023-11-16  45        - const: ring2
cc03a934c5da76 Rafał Miłecki              2023-11-16  46        - const: ring3
cc03a934c5da76 Rafał Miłecki              2023-11-16  47        - const: eip
cc03a934c5da76 Rafał Miłecki              2023-11-16  48        - const: mem
cc03a934c5da76 Rafał Miłecki              2023-11-16  49  
cc03a934c5da76 Rafał Miłecki              2023-11-16  50    clocks:
cc03a934c5da76 Rafał Miłecki              2023-11-16  51      minItems: 1
cc03a934c5da76 Rafał Miłecki              2023-11-16  52      maxItems: 2
cc03a934c5da76 Rafał Miłecki              2023-11-16  53  
cc03a934c5da76 Rafał Miłecki              2023-11-16  54    clock-names:
cc03a934c5da76 Rafał Miłecki              2023-11-16  55      minItems: 1
cc03a934c5da76 Rafał Miłecki              2023-11-16  56      items:
cc03a934c5da76 Rafał Miłecki              2023-11-16  57        - const: core
cc03a934c5da76 Rafał Miłecki              2023-11-16  58        - const: reg
cc03a934c5da76 Rafał Miłecki              2023-11-16  59  
ef2a68f815daa7 Rob Herring (Arm           2025-02-26  60)   dma-coherent: true
ef2a68f815daa7 Rob Herring (Arm           2025-02-26  61) 
cc03a934c5da76 Rafał Miłecki              2023-11-16  62  required:
cc03a934c5da76 Rafał Miłecki              2023-11-16  63    - reg
cc03a934c5da76 Rafał Miłecki              2023-11-16  64    - interrupts
cc03a934c5da76 Rafał Miłecki              2023-11-16  65    - interrupt-names
cc03a934c5da76 Rafał Miłecki              2023-11-16  66  
cc03a934c5da76 Rafał Miłecki              2023-11-16  67  allOf:
cc03a934c5da76 Rafał Miłecki              2023-11-16  68    - if:
cc03a934c5da76 Rafał Miłecki              2023-11-16  69        properties:
cc03a934c5da76 Rafał Miłecki              2023-11-16  70          clocks:
cc03a934c5da76 Rafał Miłecki              2023-11-16  71            minItems: 2
cc03a934c5da76 Rafał Miłecki              2023-11-16  72      then:
cc03a934c5da76 Rafał Miłecki              2023-11-16  73        properties:
cc03a934c5da76 Rafał Miłecki              2023-11-16  74          clock-names:
cc03a934c5da76 Rafał Miłecki              2023-11-16  75            minItems: 2
cc03a934c5da76 Rafał Miłecki              2023-11-16  76        required:
cc03a934c5da76 Rafał Miłecki              2023-11-16  77          - clock-names
cc03a934c5da76 Rafał Miłecki              2023-11-16  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
