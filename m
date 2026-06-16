Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836C43D4E8
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629505; cv=none; b=U93KpGA6kFH+a1ahSnHFwsRR9IIzpAHJF2fpBaCOqSlcEjLylLyraLnTrEpCmmCkm98V9wBuvIdhkBsF3peoSMQJKg/sxnGWPHHSgJ+bZwRJqq+PI4gxd3pfvOx8Gqbq22v9d01k4w4p0LZsvbGD+vZZpr581f0KQzE/Nt+Fzsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629505; c=relaxed/simple;
	bh=jw9iZSSuAyCopE8eFaJ+u0+jnXrpeByeregVNeCtaWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9BjtSGFGVPqY1H9apjZ1feaJUUREt2ok0qmsmOFVHturHfnGyX443q6Jz1x/NSchoftNetRGl6loi4f2e97p0h1eWl+1RxlHX5gJOSo0rqM6TVnWnK9aatImlBdoec03CS9b8jxMaCr34Rf0FOT2zxXXjNyl5W0Hi540oTF63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+nZb+D5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+nZb+D5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781629503; x=1813165503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jw9iZSSuAyCopE8eFaJ+u0+jnXrpeByeregVNeCtaWc=;
  b=n+nZb+D5kctS/yGwv6lttdPqdK3ub06MlUk8/g0uoKNWf95fmZ12rpHO
   MVVCZepec83HcGpJpxbBWedJZJgL73wb+8Nv+/1vPK58P8eqXZYEaoMjY
   n5fw5OmLUklUJktkmPEJi/hDZ9XusgPwDEF5inUip/mqOovWBPIRB/sWb
   XDlgjA9WKr+mQIPkiT3px1hOgCv3qgELxUXVdr/D7VS2R9XCIWCgM3AnH
   neA4ETwotX5LihuVzBAm/56B2msiquphWvZ9XvkkdPv5SwZAAQ6PF4icf
   Ytz41BKVvIEvWk7W+lpIDu+bB6M2+6cMIpiBbExI+q75HI08qdfmmA7Up
   Q==;
X-CSE-ConnectionGUID: ONYHXlZmSB+l6d0whcMJ7g==
X-CSE-MsgGUID: LwTdailMRfWzcYc6CNAr+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81540591"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="81540591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 10:05:02 -0700
X-CSE-ConnectionGUID: ZxH7PeobQHCxBqpt1RRcwA==
X-CSE-MsgGUID: LEi6/gptRbeoYJP5UxKPFg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2026 10:05:01 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZXDf-0000000059t-0YNY;
	Tue, 16 Jun 2026 17:04:59 +0000
Date: Tue, 16 Jun 2026 19:04:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs with ADV7513
Message-ID: <202606161823.TFcVkbL8-lkp@intel.com>
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
In-Reply-To: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

[auto build test WARNING on linux-review/Prabhakar/clk-renesas-rzv2h-cpg-Use-per-SoC-PLL-reference-frequency-for-calculations/20260615-190846]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g077-Add-VSPD-and-FCPVD-nodes/20260615-200213
base:   https://github.com/intel-lab-lkp/linux Prabhakar/clk-renesas-rzv2h-cpg-Use-per-SoC-PLL-reference-frequency-for-calculations/20260615-190846
patch link:    https://lore.kernel.org/r/20260615115455.1412098-6-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260616/202606161823.TFcVkbL8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev12+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161823.TFcVkbL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606161823.TFcVkbL8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): clocks: [[3, 0, 8], [3, 1, 1204], [3, 0, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g077-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g077-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: vsp@920e0000 (renesas,r9a09g077-vsp2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-vsp2', 'renesas,r9a07g044-vsp2'] is too long
   	'renesas,r9a09g077-vsp2' is not one of ['renesas,r9a07g044-vsp2', 'renesas,vsp1', 'renesas,vsp2']
   	'renesas,r9a09g077-vsp2' is not one of ['renesas,r9a07g043u-vsp2', 'renesas,r9a07g054-vsp2', 'renesas,r9a09g056-vsp2', 'renesas,r9a09g057-vsp2']
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: vsp@920e0000 (renesas,r9a09g077-vsp2): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
