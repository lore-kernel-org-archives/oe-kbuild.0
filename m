Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B54433AD
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758927736; cv=none; b=E8AluMFQP7O0ED/hzU7PUKWnP49GIK0r00y4nnLbwZl4L4kbzgyk49bRp/F2vgBhnwdWJiAJ/KF1y1Vw6PiQmz0aJ984LZXaV1a5z9+FMrNcHnfThLVK69OMTR9jEwT0tQfF53e7gcJeovAlAqkHJWBh0rtb+QJSUUzMZ/oKHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758927736; c=relaxed/simple;
	bh=78yHdpD2zEfpgnHrEukbLxOzCkYZ7kZMfAoIlCYC81Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iekv/NieRE0RiTeusLPfgDyplIpxe1tlCAZF1BLQ4rmb0BbFr1aPUfc7TJG2afOQk1jO2uihMSpTXi27yxJblnkurDQUC711Z3+YWTaeD8gnSfXF6uwLRFg5IS4qS6KWeL/qiHGThlij5yb6zVqNeGfpvxTsdBhcgbS/0tN+QG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieOODDe0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieOODDe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758927734; x=1790463734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=78yHdpD2zEfpgnHrEukbLxOzCkYZ7kZMfAoIlCYC81Y=;
  b=ieOODDe0nB48D5q7HOyN28eI3yKcXifYt7iXVBNVPPUGdndWyhkmjLCV
   RloL3DgAPtAfRm/+ogGQ4LzEdg2Dm0+DSj1fdLsUSru/h/sOw3aBRtVEu
   HE4NRfHQLRjSAzIrbxyOKkHRR9n/vtf6LVUeqtbOTdhKx/qeK2YgJZxDp
   DFsDQLVWL6hz4Gq9Fr4hDunHBK3LKfLTwXXYxEubGM3PI6wum6pyi8kDA
   TsimWXxOFbOZhApEwtT72v/9sZmUckxNmf7OMisRrvWP8rrgLXHiKioQQ
   zPAAtQeLTEO1/76ZxLVTe/TG4l4UmX1IUzfz6SRTL9bXlRRyD4Il1Af5M
   Q==;
X-CSE-ConnectionGUID: 7jI8yO6RTkyR+ZVGB+am7A==
X-CSE-MsgGUID: cb2mHDrXRIStlC0Wx1sKDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63900004"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="63900004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 16:02:13 -0700
X-CSE-ConnectionGUID: rtE5IOJATcKbtwnItG4l5w==
X-CSE-MsgGUID: 84unq2ieQRqYTSLtpLEO5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="177656904"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2025 16:02:12 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2HS6-0006ed-0s;
	Fri, 26 Sep 2025 23:02:10 +0000
Date: Sat, 27 Sep 2025 07:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/7] arm64: dts: renesas: r9a09g077: Add ADCs support
Message-ID: <202509270619.ZcFhldYO-lkp@intel.com>
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
In-Reply-To: <20250925224013.2146983-5-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20250925224013.2146983-5-cosmin-gabriel.tanislav.xa@renesas.com>
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
patch link:    https://lore.kernel.org/r/20250925224013.2146983-5-cosmin-gabriel.tanislav.xa%40renesas.com
patch subject: [PATCH v2 4/7] arm64: dts: renesas: r9a09g077: Add ADCs support
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250926 (https://download.01.org/0day-ci/archive/20250927/202509270619.ZcFhldYO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270619.ZcFhldYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509270619.ZcFhldYO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000 (renesas,r9a09g077-adc): 'renesas,max-channels' does not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014400 (renesas,r9a09g077-adc): 'renesas,max-channels' does not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@80008000 (renesas,r9a09g077-adc): 'renesas,max-channels' does not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
