Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E915613DB9F
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 18:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458827; cv=none; b=enWX0ISwLtYHQpbYWnLloF8Sv0VJhoV4pWJjV2uxWJis+cw/hDwaSdjRZS0uvvGxZvD6ccZCax4k3gwDoUy92oUW8riALxMBkjuNO9dB7fIpCDdM1Vqsjqh6gNxDIEd2gefYD10OqtxXGyIJMPh27/HwI2ODLyUxbd28pW4ho70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458827; c=relaxed/simple;
	bh=RNxwvbt68iCHfj6o1V8TL+IvG9FifFh8wKqNSDDio74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d5NaYdmQxuH5xU65gBmfYTIFAznzic6f3xPCDVa44GmsUd5iYtSTEubhEci8dm/jW+tiTjF2bBBsEutZLMTYvWkrckL2oPJmoJuFhXW4L7ycI5yjYOxpQRvHQBMF3HP9S/AbG3+kdvBFl9PRoPZYeP7tNCQx54L0ZVkPooKKAHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5g4RPOe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5g4RPOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734458825; x=1765994825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNxwvbt68iCHfj6o1V8TL+IvG9FifFh8wKqNSDDio74=;
  b=J5g4RPOekub33XO1W86sAZXAUG9/JPqCBr/aZDgh8QU9Qfuu90gtaIig
   D+7TXfAlJQkxLrkGV7O/spluZFpiQgzsO4EeA6LE2znGWanRTYvlKBiqe
   ASQTW07VFci9V/DejHbftNHiBKOAIk0iTaWVN9e8819du5GKvA1bu89Vj
   ipHVSRMYMY2dg5MVIx/oY07mQyQJU5/hJtug5I7vguuQiyFsgaNfECX8+
   38F6esbkURp4AWT2qqy4PcGC8p7Gg5VMNHmux+3m1RmTVLMw4ZhA8DqGj
   vmqg2dgjkX0lasMAQ61GbOvMDzfUS4iW7HchQGs1gLA+kV2kLo+Q7jQDR
   g==;
X-CSE-ConnectionGUID: /NmIhvc4QVSwMOff8OPDNQ==
X-CSE-MsgGUID: RtHQ+3aPTRii9TzdiVi60g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38837401"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38837401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 10:07:04 -0800
X-CSE-ConnectionGUID: ctumLadASg6wUUHjz/sRCA==
X-CSE-MsgGUID: ozNK7MsdTsGwZiUoeFVDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="102443772"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Dec 2024 10:07:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNbyH-000FiK-0K;
	Tue, 17 Dec 2024 18:07:01 +0000
Date: Wed, 18 Dec 2024 02:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.14 29/31]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8c00:
 Unevaluated properties are not allowed ('compatible' was unexpected)
Message-ID: <202412180156.ThmhLDvm-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.14
head:   acb247afab5bc2b4462f4dfc17a9d930e1153e52
commit: 558a25c2ee3815c3d59d4dd9440a1cb3a78d20ab [29/31] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
:::::: branch date: 9 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20241217 (https://download.01.org/0day-ci/archive/20241218/202412180156.ThmhLDvm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412180156.ThmhLDvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412180156.ThmhLDvm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i2c@10090400/clock-generator@68: failed to match any schema with compatible: ['renesas,5l35023']
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8000: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8400: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8800: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8c00: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8c00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: clock-controller@11010000: #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
