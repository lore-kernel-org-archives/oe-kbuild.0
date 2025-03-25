Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D81F8EEF
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Mar 2025 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742932311; cv=none; b=VvdvNt5DygLe1QEkHzmH1rtjvL6a2/hrAA9I5WQmQAPGWtHraVj1Gp5zYwSxOAOAHYiNbccvxUZfrlPkYuY/IkQWrXvSea/peNr4atCvOrws3lNMgD4vOYdAWV5LnuATk3V0NKFHZ03DohO9jusFDZd6HR0xfo/0FTKS3yfGLXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742932311; c=relaxed/simple;
	bh=3z9aqEjNTvDBkWxgY0tkc9jT79vNWhUn6uPVJprcsKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgqDMvlH09vGxrpZ/m8taXrvAKFblSOwsqlXf+nGf6BxKM8l3/36/l4VPmXI+NusGzBEdWu4QcAq7BQIxi2BsGHtAD+XtAU8nwXkzJ4c97cEvQ7QF3lW7D6XxyN+vRgaBX8MslAiMe4ypMoNYUOEiLqv0MFh3HtU7voEP485tMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js+Fqfj2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js+Fqfj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742932310; x=1774468310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3z9aqEjNTvDBkWxgY0tkc9jT79vNWhUn6uPVJprcsKM=;
  b=Js+Fqfj2W0ORxb2cKFIUV2uji5amL+Avxda/LPF5JUaveW8X4sSs3yXF
   CFk4VbetbHj1BzfbjYtheqOEGIFzpYInhvwuF+iualuDP2CNxKzMUYEsc
   wh5XCkRT3/QMNZDbWjoe+4Sw2uJwih4gbEqJOoktqERPzJVnNYfFyKLe4
   QWLp69iVFmJ93JH+rYmUPy7wctL5BTOmKohF+T0NDjZrB4iLg4aop3Pbd
   ONSHAbDhP6SXpWwQop4rgf35ii6JXCd80IOlcnVaaEPtoiXw903Ys7k2B
   NwKGuJxKlQONl3LiCM1RviEc6BOR8BrUya8C8DCTdwg9pa1I3OWV4mux4
   g==;
X-CSE-ConnectionGUID: hHJ9UgHTSceAeCkerFbEig==
X-CSE-MsgGUID: YrcQmDOqQeeYXXi/uBXs2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43434491"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="43434491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 12:51:50 -0700
X-CSE-ConnectionGUID: dkOBdN0ySUaN/ypvycG5Cw==
X-CSE-MsgGUID: RAPLpMIYTiGT6Wm19BZ4EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="129673451"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Mar 2025 12:51:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txAJO-00058x-1H;
	Tue, 25 Mar 2025 19:51:46 +0000
Date: Wed, 26 Mar 2025 03:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-smp-spintable 5/5]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus:
 cpu@0:cpu-release-addr: size is 32, expected 64
Message-ID: <202503260304.AVl7JOB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@0:cpu-release-addr: size is 32, expected 64"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-smp-spintable
head:   6786f905b8ae11fd33df4d472b0f0d02eb7f01cc
commit: 6786f905b8ae11fd33df4d472b0f0d02eb7f01cc [5/5] scratch
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-051-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260304.AVl7JOB4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260304.AVl7JOB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503260304.AVl7JOB4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@0:cpu-release-addr: size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@1:cpu-release-addr: size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
--
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: cpus: cpu@0:cpu-release-addr: size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/broadcom/bcm96846.dtb: cpus: cpu@1:cpu-release-addr: size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
