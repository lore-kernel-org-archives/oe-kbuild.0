Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E075729DB88
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 06:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067478; cv=none; b=YbUjqHrFFr3JVkJQ9CX5MOBhxTjPKmzSilod5ujdDC7H6PDSpp6+8dv+MbRlNz+qUdapp87EkGf/0ryOWxtTv8bEbrlsuz7A1jpFdd+UjwMLHOZ8obWKlJr1Ai4Oht3RAnZVbcCp4F12RbHTekqcSj7o2ShO9Jt5nHed06iwWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067478; c=relaxed/simple;
	bh=6yFDuGRk//zmPpmI2Ww5FfjQLZ4+0wbxxAnR1o653y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLbBkmiFG+e5u3epkQHjn7qm7A1gCfpbl3ie9lH0VPeGdaA38ZTuZZowOrzctYjBjkbnwHG2cZSIlRNhDCafZqyJjH9TEKer60OWD/vRPB4EzetV2pQDP19dTGUbqqO5mADHsdKtbf7ZtpBalA1TnuuioReOw0RBX8YCVgoY9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jE0v/RyY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jE0v/RyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755067477; x=1786603477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yFDuGRk//zmPpmI2Ww5FfjQLZ4+0wbxxAnR1o653y8=;
  b=jE0v/RyYoh28k3auFL8TfkkbRTnUV7DvdTw8D5wuDjatVtpx9Z4mRLRz
   8pf5GAbbxuBT7e3Be+yKNgvrrcFnwDm8yRnEP5X0ME72tbK5PQk9EsK+S
   acnPJmFdT/MlDqcnAMBsWo2495fedydL+RcD7nCQw0xa/N3esNXqF+9zb
   JJrlFE4UBFXBq4hmrYUNn07dDBs9I+e+rYZS0Y72l0Tt0EAJQvW6ymETg
   46V81hfc9BnBetCv1RrwOUjKwSYxcyt0fj7pmfIWpjUesd/CMLHuTawP9
   QRh1nlkJBAlaj6YJszB903Qt+H/JGG0AVtqXrzdemBP/s1eR/QElQocjJ
   w==;
X-CSE-ConnectionGUID: TcjjpbIkTj+NlaaJzBG8VA==
X-CSE-MsgGUID: e2x0mQysRFqufRXITJZkKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79926272"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="79926272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 23:44:36 -0700
X-CSE-ConnectionGUID: KWK2yR1HSiqXlcdOkQacbg==
X-CSE-MsgGUID: UDzoJoSLRZWGte9kgelHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="203573346"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2025 23:44:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um5Ds-0009cO-0a;
	Wed, 13 Aug 2025 06:44:32 +0000
Date: Wed, 13 Aug 2025 14:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
Message-ID: <202508131451.Om0x3g7n-lkp@intel.com>
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
In-Reply-To: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
References: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Qiang Zhao <qiang.zhao@nxp.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linux-kernel@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/soc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports/20250812-195423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: csky-randconfig-052-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131451.Om0x3g7n-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131451.Om0x3g7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508131451.Om0x3g7n-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
