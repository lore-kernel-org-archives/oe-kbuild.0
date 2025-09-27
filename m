Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561D1A5B92
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758957287; cv=none; b=DPHokEtjlMWsxOkxkw2FwUmE9auEJt8o1GT6nk4ky6s9Evu/Pieb+VSwCoFj+jEwqX8QEw0hBdiILf6xLL7VtacXZv8oqQY7XHg6Q59nN3DexfwjGwrRqRHYX1tRibIXRp+6OripdzqcdLQ79pzx++VeHXfb9CY1UxffFXtuWt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758957287; c=relaxed/simple;
	bh=ayiTIT+m0wmdjOw8aALaNePXQ2NqhCTT9UxjM5FPPvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlCAhpONfANR63d4X7N6XkbE3XI2UIFRbzpXDZaYFztREf69p5nAOgWYGFRN1CgpoaJj9SBrgIDhJ/xqKkBqP7Pe2PXkzCiJLbETby54D0Cxk77fkrrbAvU3rkIYZ8r+wCJHoqP4r/EQonWHmZvFTpuAkRY7/zwEqiJIf2Bfdc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2VcevHE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2VcevHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758957285; x=1790493285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ayiTIT+m0wmdjOw8aALaNePXQ2NqhCTT9UxjM5FPPvw=;
  b=C2VcevHEVL6y9nio1VqDn4ZPr9C0IyHSx8GaJKYuILsUk+5tY7dyUqUz
   GD8n6wXo4STCgiYpovtILcs+aIwyiHRPt4W4KW6vH2SY308aBFSPFiLGF
   23zNGQJXeUGusS/XT6Bti2n4FT6rLWTf6VfbEghCF8U47F2TzFr1Po8Lf
   +XWke+3FBVuMU3KtiWi9W0V0fyh4E5S3Qvl8NAdySxQcESaopNKYbjoOG
   kOTN9UWoZQ3kAyfuqyOw+9tZxYG1rSLb6W1XIX6HollWzC3mtrGSMBv67
   mGfIqHfZTw0itw07uvE9/NuEcYD7Mv+f0b5cKiB8JhRxVikFbPZXDfy9C
   A==;
X-CSE-ConnectionGUID: c92XgKJERoapvFW8TZadQA==
X-CSE-MsgGUID: W7LFNJadRXCaA5lDIQJiJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61170405"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61170405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 00:14:45 -0700
X-CSE-ConnectionGUID: YZliaL/+QdmNTLe1IyCz0g==
X-CSE-MsgGUID: 9KgNAOKnRHaB22CZAf2yJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="177060383"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2025 00:14:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2P8i-0006rf-0U;
	Sat, 27 Sep 2025 07:14:40 +0000
Date: Sat, 27 Sep 2025 15:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/7] arm64: dts: renesas: r9a09g087: Add ADCs support
Message-ID: <202509271542.FFi88lSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250925224013.2146983-6-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20250925224013.2146983-6-cosmin-gabriel.tanislav.xa@renesas.com>
TO: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
CC: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>
CC: "Nuno Sá" <nuno.sa@analog.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: linux-iio@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250925]
[cannot apply to geert-renesas-devel/next jic23-iio/togreg geert-renesas-drivers/renesas-clk arm64/for-next/core robh/for-next linus/master v6.17-rc7 v6.17-rc6 v6.17-rc5 v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/clk-renesas-r9a09g077-Add-ADC-modules-clock/20250926-064447
base:   next-20250925
patch link:    https://lore.kernel.org/r/20250925224013.2146983-6-cosmin-gabriel.tanislav.xa%40renesas.com
patch subject: [PATCH v2 5/7] arm64: dts: renesas: r9a09g087: Add ADCs support
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20250926 (https://download.01.org/0day-ci/archive/20250927/202509271542.FFi88lSP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271542.FFi88lSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509271542.FFi88lSP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): 'renesas,max-channels' does not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014400 (renesas,r9a09g087-adc): 'renesas,max-channels' does not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@80008000 (renesas,r9a09g087-adc): 'renesas,max-channels' does not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
