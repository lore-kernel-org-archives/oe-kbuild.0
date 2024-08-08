Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E116C697
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723094940; cv=none; b=RdhLaHouOCpg99AtP0p41w360o9C3SUyaThCimnkHNJsiG/vkE1jakU5+R+O4md0XEXMfmZyX+ybIL+FQvMED9RNmaHoBV8p0fpusd7wQjbYr3Z76VkobetnYqDxOti9q6Zk5rITvtyr74GffhKQZmPffIm72CNqSVeAJisz8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723094940; c=relaxed/simple;
	bh=7eb5uX4RKzbo0S5P5qvfZQq9FYPm9zgNzt2WO5Qre8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ceqAhcKvr8aUc/Neb/Z5j/+QUoLaJ3r+lzVOWopQ+ohOtveNJq6bHcwjjtz0r52PfVRIdmJmjUoocFau8Mis/iA786Q1R5nzJVAQWZYMSimqBa+0owdXR4IAh2C3e7gxKlngHiMPklnspstfVzkBXuV7QDxyjJhjcAzT73XRnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcZgG1IX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcZgG1IX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723094938; x=1754630938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7eb5uX4RKzbo0S5P5qvfZQq9FYPm9zgNzt2WO5Qre8E=;
  b=JcZgG1IXIHnyFM6pUqdKECR1MZZRKOOgfj9Q0wIuXF5Nwls/s7al6jEf
   Imc/QXOvHEXxITKYLg/47Fc+MlrICEtZRTBgcEjrM7QmQFkHrzeWMtOQK
   Dnzj5b4l25reVb+7nwHjJMVPZlcbiXNKGqX3+P23gREbKM16LRT3sUO9N
   C1x7XhRHPQyo9aet/hKs8t+KqjmmxgtBauN4HC5mym0YGxbxCSOEL3kyq
   FmSDowC2On0xnTD9s9HiCgJc9HYN6uZv9Uv1jNxLA2lmlhRFFlRyYNx/1
   XSTnlsPa1bCXvk87gkZRZtMEcrxiZ4Xias0XSJUadmWETHPhxy5CE65wS
   A==;
X-CSE-ConnectionGUID: AcOGwDawR4ep6BiPVC64iw==
X-CSE-MsgGUID: 3353UflES22PeigozG17ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21172557"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21172557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 22:28:58 -0700
X-CSE-ConnectionGUID: Va6ov9Z/SBaXY1JyEZaodQ==
X-CSE-MsgGUID: 7jd59yGLRhiuN5Dmhj+zkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57178720"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2024 22:28:57 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbvhj-0005xU-17;
	Thu, 08 Aug 2024 05:28:53 +0000
Date: Thu, 8 Aug 2024 13:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6561
Message-ID: <202408081330.78WSlgKc-lkp@intel.com>
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
In-Reply-To: <20240807180956.1341332-2-ilordash02@gmail.com>
References: <20240807180956.1341332-2-ilordash02@gmail.com>
TO: Ilya Orazov <ilordash02@gmail.com>
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Aswath Govindraju <a-govindraju@ti.com>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-can@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Ilya Orazov <ilordash02@gmail.com>

Hi Ilya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkl-can-next/testing]
[also build test WARNING on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Orazov/dt-bindings-phy-ti-tcan104x-can-Document-Microchip-ATA6561/20240808-045713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
patch link:    https://lore.kernel.org/r/20240807180956.1341332-2-ilordash02%40gmail.com
patch subject: [PATCH v2 1/1] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6561
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arc-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081330.78WSlgKc-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081330.78WSlgKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408081330.78WSlgKc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
