Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BB136326
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 21:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737841974; cv=none; b=di/6YacjQV3JoJ4Y9CGshxRjTHJpdlmxpqNGJN1aRTHmmyjjbFuv2aupdVTljkokxGE2RggVAYnEZVhRpI27BdfKnQua/cfJQonAil0q6nrOxqdB5+6Unp8yQvFea0YlougS+m7CCV+aQCMbVHpd2oViBjId6yo0uNt9OsfdY6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737841974; c=relaxed/simple;
	bh=sVXoKaL9WPvTm3N++msJNh/D5jGp5GbnoEuSghciHOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNkY8YY6e1sSBM921v3CNPx1YDz3B+gwhKgZitJmjqI2fBfYArlT0oL/d4L2J4vw2QGxJU+4TYebI7bnfp4uthYcL3o0rE3aoU38tVBC3+TNyUvg98vYpOxhkYNjwBpHY9LVXRUNmN1PSTLfdNRydJKB8cp0ObDReW3cAfJSL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJI2g7LI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJI2g7LI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737841972; x=1769377972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVXoKaL9WPvTm3N++msJNh/D5jGp5GbnoEuSghciHOw=;
  b=cJI2g7LIJfbqQcq2zcoHlWAqyp84riiOQfAoCB19FG5ChZIGPp1hv3hD
   BX5ZwilL78LlS8vjOe15WKFqhxlHgFxR2R5Wq9H6oUCcVXbp6GQn1RhgR
   kWclA45U2C6CmJCLhAaKiRZYhaFJLd7B1fi/AxRmD+VgbbvVz0GuhyUcA
   8sNeHW6J4l0doLh+K//5xovdSQgw4s1HdB9C1ERC79HgC6bvp7mZD+GQr
   qBDQmHDPE8UuO9hb67wlQ8+YlNgV0gALse8bI0UdQgu24Gt0h/ZH0BG6y
   VxZZzlGsJj0ri2HFOm6IC/Czf7dm0uGGhFex602YnHCPwFIWL0OSfcuzn
   w==;
X-CSE-ConnectionGUID: IqRRuU81RGy8r7O4RB5eIQ==
X-CSE-MsgGUID: NXuhsdETQsyRFa9VZ0Q4qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="41187754"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="41187754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 13:52:52 -0800
X-CSE-ConnectionGUID: DAD1jHCjRvqbctar0pxGbQ==
X-CSE-MsgGUID: uWJjPKvZTFG4TZyUZdMetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="108192764"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jan 2025 13:52:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbo5A-000eFx-2N;
	Sat, 25 Jan 2025 21:52:48 +0000
Date: Sun, 26 Jan 2025 05:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.15 59/63]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb:
 /soc/i2c@10090400/clock-generator@68: failed to match any schema with
 compatible: ['renesas,5l35023']
Message-ID: <202501260507.VJWxVaQB-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
head:   d1be18bd0830e8e5c62e1eab570e890d70a4fafb
commit: b18f8c709e98b0d1cd8cf3a3ce4da5432e154900 [59/63] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250125 (https://download.01.org/0day-ci/archive/20250126/202501260507.VJWxVaQB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260507.VJWxVaQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501260507.VJWxVaQB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: /soc/i2c@10090400/clock-generator@68: failed to match any schema with compatible: ['renesas,5l35023']
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: ssi@100a8000: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: ssi@100a8400: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: ssi@100a8800: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: ssi@100a8c00: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: ssi@100a8c00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: clock-controller@11010000: #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
