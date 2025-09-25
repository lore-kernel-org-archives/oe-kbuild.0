Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAF1F94A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758775849; cv=none; b=luVtRV9ARTEczHJ1mpZp+kIC7yl/HtYlnM5ILmwBs3gEPVd46jp/wRhq1YQbWD/oGs8RNdBIAWhFC5FQDJI7fNB7wTHd5IRmYaZVdKK7NYgVTBxNog2Jb4l542d8PBfWxk+hZat8HX1A6cWB3/KebmwIOxIPXwRmKa2T57XtfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758775849; c=relaxed/simple;
	bh=0oQuoYNTNVxSClFGUDHhmr5pEDkOPf1Rf1E0IKCIYQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icJWcEVuaCtUcXYUzPadO6afefbmMna054Fgv3g8AYz/aCbQ/qonGcZ6ETGP31prTBX1rcuYcC2v7qWSZsJao+UjKJ8XGdVG7Kc1JLClIM73L0nSs/Gg03sz1GmCWLRvGjTfKKcUi9u6gEOsQ5h2uawpsvSw1u0FGYvN7GJkEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbbiygBA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbbiygBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758775847; x=1790311847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oQuoYNTNVxSClFGUDHhmr5pEDkOPf1Rf1E0IKCIYQg=;
  b=RbbiygBAJxsxHA/O/coCvLlgEiNbjXqD9t1VzmGEaYx9s8e7FVQKLg54
   4fJHFZBteGxTMxxlybjHPmdO6/AlWemy7Wqw092cIlLaNRWCV0aped95q
   mLEE6cdHG14X7GRg+LaWYxv3Llsucbk/G6IfOcaJitJnKgBBx3ASTR08P
   lpSH7KxYPm3Jh9OxBmgm/VoJgr26SxYk8cauEUkgpys3gkVZnr/EneVfm
   +NzoofviStQm5EZcAkzvJqizx+iS6KdIjEUaOcLWMMD5G0x0F/Wr+14wI
   vGx/02JWbRFe0je0s76xMrAiGyiprgHAiwU1ah+f4XbuxFl9XHXFppU47
   g==;
X-CSE-ConnectionGUID: 4/VF2V/uQSClNEYcK0RFZg==
X-CSE-MsgGUID: eWkGOBPnRCy3khxR+mCBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60298292"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60298292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 21:50:47 -0700
X-CSE-ConnectionGUID: 307ZxX76RQGPnowDE3k1mg==
X-CSE-MsgGUID: mhjxxanrRyyPeJnV1dr12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="214359927"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2025 21:50:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1dwI-0004vZ-2e;
	Thu, 25 Sep 2025 04:50:42 +0000
Date: Thu, 25 Sep 2025 12:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 2/2] arm64: dts: renesas: R8A78000: Add initial
 Ironhide support
Message-ID: <202509251231.Tip0NZz7-lkp@intel.com>
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
In-Reply-To: <87ecrwa3fj.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecrwa3fj.wl-kuninori.morimoto.gx@renesas.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on linus/master v6.17-rc7 next-20250924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/arm64-dts-renesas-Add-R8A78000-X5H-DTs/20250924-122002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/87ecrwa3fj.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v6 2/2] arm64: dts: renesas: R8A78000: Add initial Ironhide support
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250924 (https://download.01.org/0day-ci/archive/20250925/202509251231.Tip0NZz7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251231.Tip0NZz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509251231.Tip0NZz7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@50200: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@50300: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@60000: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@60100: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@60200: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@60300: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70000: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70100: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70200: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70300: failed to match any schema with compatible: ['arm,cortex-a720ae']
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
