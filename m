Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE21448E0
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769226166; cv=none; b=qnkiix485qwcxhnHVHv15Japds0yotSf036HsF6WB60zCPC4VIxOJv2ETKzKfX2AiQMEqGQp/MGlcJw9s5tBwMa6A+6/IJ/cZxX14IOB/wgT8CoPTnKq7ASMLzxdp7rZNmLIWvCJZ91rpNVg2fi4Mkm/lwogQhZVharKSdOnI7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769226166; c=relaxed/simple;
	bh=z8wLDCMEQi4DFoLweqguCdgy54sYDcFkZfFX9GIdHuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9QKNVmFFdCwuRal3nbouXRW2dXil56JFAsq2U7tjOcQJBfz6Q7JVFEpcDeBwvOKHqlrwbXd9S8hLbymbqTn2fjrYob0s0S32r7Ly5270NIqyJ0bXw/QkSDyCsEvwLD4tD5s+3v84dCdhNRKACvOAcoCeIPII/pruJFlEHvc13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNMFFdjl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNMFFdjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769226164; x=1800762164;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z8wLDCMEQi4DFoLweqguCdgy54sYDcFkZfFX9GIdHuk=;
  b=lNMFFdjlnRYkWkyxjqmpaJZWxhnN8qPRReDlL8X4eTp7GxuGE8taU0CK
   uLqd2N2m0Abm1S5r6eN5rMOyGIPKuoMTjE3xj0RvHR79+rrHDFAwik41h
   KNXbJ4GvquAn698P875bosAB/YQ6pkdOcJNmGCjHhQgr1FDgK7abGBMkP
   5QxADqHSNVxO1WJyEI7Ls90UtE9fU2B0WXLuUVISDd+1nLhXKWjQcvl0g
   jEPtpFnpPL6ObarSGBxi6BWXOSYQefBER1Uuz51R2fkXfEqhruc9BG3x4
   nFQ8UGbNfQhsAT+GfIVFvITsYfnEkfAKli+MxqCbJcsrfQ/yeuheciEXi
   g==;
X-CSE-ConnectionGUID: hSfgcF7SRbm4Vvh5iCtOlg==
X-CSE-MsgGUID: bg/BAhb/RoGBGgdzHDk7Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88052329"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88052329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:42:43 -0800
X-CSE-ConnectionGUID: TYJWeB9nTNe9u5pYuFhmuQ==
X-CSE-MsgGUID: 0AUEKdd/QSiMBXx9m3MqDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211644168"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 19:42:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjUXn-00000000UmE-3yvF;
	Sat, 24 Jan 2026 03:42:39 +0000
Date: Sat, 24 Jan 2026 11:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <202601241142.Vhc3i5y1-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/pwm/pwm-sun50i-h616.c:957:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123093322.1327389-3-richard.genoud@bootlin.com>
References: <20260123093322.1327389-3-richard.genoud@bootlin.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: Paul Kocialkowski <paulk@sys-base.io>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Richard Genoud <richard.genoud@bootlin.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/dt-bindings-pwm-allwinner-add-h616-pwm-compatible/20260123-174342
base:   9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
patch link:    https://lore.kernel.org/r/20260123093322.1327389-3-richard.genoud%40bootlin.com
patch subject: [PATCH v3 2/4] pwm: sun50i: Add H616 PWM support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm-randconfig-r112-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241142.Vhc3i5y1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241142.Vhc3i5y1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241142.Vhc3i5y1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pwm/pwm-sun50i-h616.c: note: in included file:
   include/linux/pwm.h:13:1: sparse: sparse: bad integer constant expression
   include/linux/pwm.h:13:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
>> drivers/pwm/pwm-sun50i-h616.c:957:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:957:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pwm/pwm-sun50i-h616.c:958:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:958:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pwm/pwm-sun50i-h616.c:959:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:959:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pwm/pwm-sun50i-h616.c:959:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-sun50i-h616.c:959:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +957 drivers/pwm/pwm-sun50i-h616.c

f15f2e06c26344 Richard Genoud 2026-01-23  956  
f15f2e06c26344 Richard Genoud 2026-01-23 @957  MODULE_AUTHOR("Richard Genoud <richard.genoud@bootlin.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
