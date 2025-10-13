Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4022124469B
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349212; cv=none; b=dWkOQRovI33zR4uqppOR623x+1ZMGKxnstq7rpZOt+e5sZhM8iL2ZdUXDDnkiLf3h5Pq22Gl9uBqx/enCr8x5EyrFOMrrF0vy9ySKVMV7ypyUWbE9tOKQYPOOKmyhk1p4AFpUJea7OzC1vPua5p3C4WD4XBTnwhFQaYf5SRxF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349212; c=relaxed/simple;
	bh=g8RmxpaNjBSPyNpThZLOOrRL9+kdpiVqKLRTVE3kCSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gg+iplow2WJjw3zSRPu7ODw0Fncmr1gq7JNCKFYl7xu+RT5wcGL3TRuIGxi233C0+XnuTK8/ws51dbkvvgWcw28Eo/k7PKGx8mpTZa/s/ELwTX2jcugweHkBpxtCsEqQL/0o0oikbrDFfJWcbGnwH8hKTZi5Rot+2U4q3utyvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsE6P3VR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsE6P3VR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760349210; x=1791885210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g8RmxpaNjBSPyNpThZLOOrRL9+kdpiVqKLRTVE3kCSM=;
  b=SsE6P3VRtXE8jE0LuGoJIvG99UQG1pcq750/rBm4rcFj5Hbxn+aJtilB
   Oj3QYlswrFKI+qRY7r1ABmufHH1G7b5SGglHHh5VGG997z6tnU+nuq9gm
   G/GIv2nr1rb4AikRIIPUo2krWaXUFc1kJqbwi7ffpsi4siBNMgIWQzv4A
   DLuwmb73dIVF2ohb1gqL34/rnNVepoC5kSINl6sRE74abMKMAFqOBx+lv
   KXWVJr4/JpP5yCrx6NB828YtXcdHZhyUrTUjFkgRR29su8ckfjb8fJpG5
   jlnzOAqUjsvg26LZBnY+F+f8M061OLZfLcuwQSWCuf6qcPJTY+LCEOmZV
   g==;
X-CSE-ConnectionGUID: f1todsjwTamaTmZaMyxWiw==
X-CSE-MsgGUID: ImebVYpwQQ2rhQgsOY/9EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62374092"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62374092"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 02:53:30 -0700
X-CSE-ConnectionGUID: hyQml7XXT1WTuEtR7ePc3Q==
X-CSE-MsgGUID: XvIEnwl1SLCpJjalZf4cvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="181987631"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2025 02:53:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8FF8-0000Kh-2O;
	Mon, 13 Oct 2025 09:53:26 +0000
Date: Mon, 13 Oct 2025 17:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 4/7]
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb:
 /soc@0/clock-controller@1a800000: failed to match any schema with
 compatible: ['samsung,exynosautov920-cmu-m2m']
Message-ID: <202510131728.06PYvgT9-lkp@intel.com>
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
TO: Raghav Sharma <raghav.s@samsung.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f409bd20f0a94ca4eece7eb919b800e013abc043
commit: 7b0ccabb873de4b4dec3214b2a0ee3c32c326101 [4/7] arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
:::::: branch date: 7 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-054-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131728.06PYvgT9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131728.06PYvgT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510131728.06PYvgT9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@1a800000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-m2m']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
