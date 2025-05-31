Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3FD515
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748656234; cv=none; b=HrZlbEyg0NGihnJPiWvvxM5PQ0L3irkCJAuIyjx1aFhx4QuzUTaB6YSvIWVwu+A8TsoCwLF+drXXjHjReXo5Pnk44LxHlm0f00xvLpK8xqn/lwZeEnqMxZZx9XncGeNb24reRlk1qNL7IZLEAAvks2FJtFqTOpaqDDxkaIKxyVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748656234; c=relaxed/simple;
	bh=rtnbUbq36w0FmJviQ2FXxTmfxAsnXEwbIZbna7U+k0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKWrfE+Dvpdi+ZqnAIUXgixf7LZpoX94f2OHQyIbCQdGY2yPdtf5loQZ85HMxcMk0MAVLVrUKfBoYHJUSvPeh87jBM1MWlmrTbLtUok/E10fPhSIxDrVSGyPKKNbNsRtrG19nnFy715Zfh2CBZYZPw0I4hRdikT79nH4CJe1KBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpPcMj7Q; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpPcMj7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748656231; x=1780192231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtnbUbq36w0FmJviQ2FXxTmfxAsnXEwbIZbna7U+k0Y=;
  b=JpPcMj7Q7wnyPLuyJ8C7H/YvwUMkibOVnFP+i2UdU7RbNKGVZIiTnjVe
   F1haLn0iLDdslUVaJ6EaZZIN/scdvEr3veYa51rSPXcz3SRaMFLF62pK5
   9gtnp5J66ZCxsVUTPPs8jBkuYfUhajwzLWTOILfh+WsGOjAR1hBdtBhji
   mlWVGSpS4h+J/DRBfELUgnDBM1ARVilyxLmoOFptfAAN2FJyPmXC0oCRi
   VFNDbu+/T3tvD7IzkOlAidRolWHmaEOj7Ct6zrpoodyIXVcfuA6wv5US7
   16/GLfK2S4XDiMVXxA+aA7k1n7TXKoO1Kt/8jjNtFQZXjXGhIQsP9zYdJ
   A==;
X-CSE-ConnectionGUID: gw6ojjgXSSWOaf1mzOVnrg==
X-CSE-MsgGUID: 8E2z54oCRmCMT/9XnvksRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49876281"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="49876281"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 18:50:31 -0700
X-CSE-ConnectionGUID: cupwgxeGRbmZMyfyxSO14g==
X-CSE-MsgGUID: zgRUyBr5T/Kkfd4RStoI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="147914772"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 May 2025 18:50:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLBMY-000Y80-06;
	Sat, 31 May 2025 01:50:18 +0000
Date: Sat, 31 May 2025 09:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt
 to yaml format
Message-ID: <202505310956.lqfxqlYH-lkp@intel.com>
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
In-Reply-To: <20250529193241.793678-1-Frank.Li@nxp.com>
References: <20250529193241.793678-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-input-touchscreen-convert-tsc2007-txt-to-yaml-format/20250530-033447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250529193241.793678-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310956.lqfxqlYH-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310956.lqfxqlYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310956.lqfxqlYH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
