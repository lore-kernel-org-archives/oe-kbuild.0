Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3373C3358B0
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772742351; cv=none; b=o9SHRt7xui7LNA99PeYJVUKqusKgeIUkiqVsDGYlw/3+HnBIJZ18uCshmqWKx9pTqKchvuv6oVpDJoJRLz2GMwf21VvTg3cCAdmT5ioolIl0lKC2guAY9r5Vfxmx9N6qKto1SVsajmi6THHqkcHBaJ+0gqbNWKAXmjg18Vz6bpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772742351; c=relaxed/simple;
	bh=7xAdjKzdzjlX5CuXtOYNC1dewGRGttMVSoNhWaD/dq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wa+8fUbV/oFQ1Lq07epalFmSEBVRMP20PzuMtZFlRaTR9mxe12vCKjKLUJ0q/c/dMknFqzcX4cv3WW2kwVJw8sdCKNB1bBXv1hHJPV5JzAxAIElN1hoEtHC9t2AZ0DaBY0mwPsg61VEhBWNEy/IkM+j5DUPa39RBkCD4gvFqNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ea0/U9jd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea0/U9jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772742349; x=1804278349;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7xAdjKzdzjlX5CuXtOYNC1dewGRGttMVSoNhWaD/dq4=;
  b=ea0/U9jdXe3s/D8fYTPocklxqoCrcH/VnQKDVCjwXjT+Ipy3xvFJ/hYn
   UMTPu2bEr+onvkW+R2qIoiVJAEdig+boxc1+NwpX4rShchg6LkDgCqQWQ
   /WGMQm6BXEpG7Q7C/1a4oXgJy7CXbQLzorBzGmbIDIrKAiTgqngsMc+bm
   nSa+YIL5j4xnVXKTUu3ZETZsRApPq3KeKd5+k0S0NM5dpyZHfKSbnTj2Z
   U/JveqqeOeq84/Z760IoLhOUfhIMXyZmez9NdVnfBesBdGh7js74U+H0Z
   M18jT0l5KzYV20qG8UWTu4h3aNgcDfNs7qftZdchgsfRvXe+HVjWmWRQn
   w==;
X-CSE-ConnectionGUID: 5pyN0poKTESwGz3kwyTPkA==
X-CSE-MsgGUID: E+7ZescQQFWTZMu8a2kxjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73918174"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73918174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:25:48 -0800
X-CSE-ConnectionGUID: iaL7d3WGQ2GDbbI2W/yK7w==
X-CSE-MsgGUID: Jh+26KfnQRmzFXPbQ8YK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218041067"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2026 12:25:48 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyFGT-0000000024D-1CbA;
	Thu, 05 Mar 2026 20:25:45 +0000
Date: Thu, 5 Mar 2026 21:24:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] powerpc: dts: Build devicetrees of enabled platforms
Message-ID: <202603052103.gSSlqzA6-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260305-mpc83xx-dtb-v2-1-cdb751458445@posteo.net>
References: <20260305-mpc83xx-dtb-v2-1-cdb751458445@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-dts-Build-devicetrees-of-enabled-platforms/20260305-175207
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260305-mpc83xx-dtb-v2-1-cdb751458445%40posteo.net
patch subject: [PATCH v2] powerpc: dts: Build devicetrees of enabled platforms
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc-randconfig-2051-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052103.gSSlqzA6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052103.gSSlqzA6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603052103.gSSlqzA6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/powerpc/boot/dts/fsl/turris1x.dtb', needed by 'arch/powerpc/boot/dts/fsl/'.
   make[4]: Target 'arch/powerpc/boot/dts/fsl/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
