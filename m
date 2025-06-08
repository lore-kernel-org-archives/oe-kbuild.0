Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5CD13B788
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749378595; cv=none; b=dvjLS5jIL1mLjh6o65nHvQasjpcoVZ0FvWdtoJMw/BXPmztDSUMoQT6ttIIW+2YRdEL8Ykq6LqIXVc0PohbJ/mM3/Dbd7vh9/3Vhi82XuHwUUj6aLfHVN3WWCPUVHYHn2Mk2/iGDPY9pjCbLnzJL43j0e519Yhzbw9n0bpnxAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749378595; c=relaxed/simple;
	bh=Cd/EbRk47i22DQ9edRj3yRVB7Y+Mpm2Lt6gEzgIdP48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRnvsaYehiwNng+RAVW1+tduWpCZc1zrIwp3V0pqveHWjosF0NRjsufyaqofleyR+c6rbZcKlIqYE6va7iv+C+XrPT+KCtr8htZGJN/sj4x7bqVyjQEdcOSJE9T0QrAeBDa/Cp77asH16rMWxj3n96XK6nF2LkXjMzyHIioWLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3NtCqs/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3NtCqs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749378591; x=1780914591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cd/EbRk47i22DQ9edRj3yRVB7Y+Mpm2Lt6gEzgIdP48=;
  b=e3NtCqs/DAV5I5HnrYILqMJz6JVvhwQghlAleULpXfK+18XK6INzqn2s
   1y9qFpHwUzP4+RbKIgQtkzHJ9EANd8eWwrJ2lpXs8rbjxNDGjBs82YsLG
   Ld0CIl6qpg7R1jC/AUaUacyeTHT4i6WQoMYQ+++cilR4+t5U7UMAftSpu
   Axdfb5nL7T+cwQJpaXbAS3jfaGjuuhg4u3OJaUtkL7VOZ+xNDzoydlyVT
   RtQjGtqBLVE6YQdduxozmmK14WOV1YeleLiV9cHW3ZD7sA5goYatwqQJ8
   MvURD0VKGkm0ewnrODetp7UZPE5wIZIbOnQKyeURxMzof1N7mSza3M4+r
   A==;
X-CSE-ConnectionGUID: A7SwyuSvQv22QBi/27ttPw==
X-CSE-MsgGUID: LUyB9SVsQ6qZam5uv9tZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="50580047"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="50580047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 03:29:51 -0700
X-CSE-ConnectionGUID: 7mP+ZN1FTFeJ5/GhBlI6kQ==
X-CSE-MsgGUID: UTTi6QoZT3u2ZMufkfEUDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146134223"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jun 2025 03:29:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uODHg-0006K9-0a;
	Sun, 08 Jun 2025 10:29:48 +0000
Date: Sun, 8 Jun 2025 18:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW
 board
Message-ID: <202506081814.3FIfmBz0-lkp@intel.com>
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
In-Reply-To: <20250607093342.2248695-10-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-10-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: Matteo Lisi <matteo.lisi@engicam.com>
CC: linux-amarula@amarulasolutions.com
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bdc7f8c5adad50dad2ec762e317f8b212f5782ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-arm-fsl-support-Engicam-MicroGEA-BMM-board/20250607-173700
base:   bdc7f8c5adad50dad2ec762e317f8b212f5782ac
patch link:    https://lore.kernel.org/r/20250607093342.2248695-10-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW board
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm-randconfig-052-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081814.3FIfmBz0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081814.3FIfmBz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506081814.3FIfmBz0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
