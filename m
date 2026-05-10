Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48738242D6A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 22:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778451113; cv=none; b=QC0Bwp5g01/1WpBsZMxniph+YfMRq+t01hVu/rfjRAPslf3siYpxaTLOPALZa1k4BTTt8mfK3yG8qwlIGyf0ncSNhRUj/LuKP5dWxjnwrUDuYEWWAOzhN3PODi+X3H2E454fJtQMDYoLETnGGDdUG0zMGij1m3sBKNepl9rzt6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778451113; c=relaxed/simple;
	bh=0pVHonFUL5+Ub3mvR+CyUV0fMmaB/d29Y5ZMxzASVdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5AaQxSSeLcNasCtOu58YEnnnU3df+vNE2AvhtZ7wKQthac5k+Kx58jTBYTTBku2J874AtAKjTFua6wBIq4hOj6t645bRouTNdMWjIabe4h/FTmGQm7wS3x2fL254clOSDuYXAfKVrvEKSP6cZcVSWz31f5LoxP9UG0IPFsOIEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh3PbMZ3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh3PbMZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778451111; x=1809987111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pVHonFUL5+Ub3mvR+CyUV0fMmaB/d29Y5ZMxzASVdg=;
  b=bh3PbMZ3Qh8IhCoaOKqHyFO9l76HCKUGtjplpIX5ZEcmEIu1utbj2qMm
   AQsVXOerCEVpbGIcqkZ6cc5/s88qajZgju45oZPp4rvwEYjQMWkH4kTgr
   SYUTzTid6chDOLkRgQLrr9RNaXAzaMIGqSW++/iCqYOLPl0ptXsoVQ95k
   HrMDPbugMZmDVFOVuxA9CpMiU0uF8kspAc+RfA6qBsW07yA81cx+PecO/
   qdzruZNgyPN92BMGhCEWLBUvvbd6iDh59kFjpx0aIkwO8j59u3dPzYzg8
   4LiJRaqH13L5T9Iawv09uFHvXgbuzBFzsDTdgGIsA3fOFhP0NOM2349cP
   A==;
X-CSE-ConnectionGUID: jZaEEk1ITUCmQZsEQVCT5A==
X-CSE-MsgGUID: bibzQ3prRX2H8VJeyzSAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="96907313"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="96907313"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 15:11:50 -0700
X-CSE-ConnectionGUID: 94NfhCZGR9GlarSDf8Sxog==
X-CSE-MsgGUID: cWIg/9C1ST+mz2X13IKLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="275420576"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2026 15:11:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMCNH-000000007oD-2TmH;
	Sun, 10 May 2026 22:11:47 +0000
Date: Mon, 11 May 2026 00:10:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
Message-ID: <202605110043.OdkDEonO-lkp@intel.com>
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
In-Reply-To: <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Prabhakar <prabhakar.csengg@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prabhakar <prabhakar.csengg@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4e98e8ccf664c41c70abb12f2316b2b49ffc3567]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g077-Add-xSPI-nodes/20260510-012430
base:   4e98e8ccf664c41c70abb12f2316b2b49ffc3567
patch link:    https://lore.kernel.org/r/20260505120153.680979-4-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-2055-20260510 (https://download.01.org/0day-ci/archive/20260511/202605110043.OdkDEonO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110043.OdkDEonO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605110043.OdkDEonO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c0000 (renesas,r9a09g077-xspi): clock-names:1: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c0000 (renesas,r9a09g077-xspi): clock-names: ['ahb', 'spi'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c0000 (renesas,r9a09g077-xspi): clocks: [[3, 1, 4], [3, 0, 22]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c0000 (renesas,r9a09g077-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g077-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c0000 (renesas,r9a09g077-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c0000 (renesas,r9a09g077-xspi): resets: [[3, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): clock-names:1: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): clock-names: ['ahb', 'spi'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): clocks: [[3, 1, 5], [3, 0, 23]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g077-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): resets: [[3, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
