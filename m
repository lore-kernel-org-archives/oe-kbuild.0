Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9C78821
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 00:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723075286; cv=none; b=MNnMvggTUMLg78ckpfh4sEkUiD+yUgib4RRRRd/DQKz883qh1/sPgRP95Fl/UjasjfX2ALxV0hELvlVywVYh+zAWnIwfpNPoT7zpLb+LGyp6F2eOuEGTmTZclLTUuVNt7yRmeZ3N1omWcKexa9k4oCo9iVUty4Rg+5hvXfDtKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723075286; c=relaxed/simple;
	bh=/YCSgPEu15DwaccthzrQKyYYZruf8XLTSql9UxMeF8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0FE1P8Yv1lqgyTvgi5NDA2gTzLvU8EbuNmJZ7cjXeCG4o6vqDhAQsrqWZhRP+D3W6cI1CwuakSR+MoW32HKFndLsI34IVgjzxCE+zOjrsyDn+Kn2aC5lnaxumXE8HqwDc/rFqC3ffhqk1qFQlTeVRBF8HZegzJQJC3YdhHkm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PktXB99/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PktXB99/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723075284; x=1754611284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YCSgPEu15DwaccthzrQKyYYZruf8XLTSql9UxMeF8M=;
  b=PktXB99//ABGKvJMOXgMdvkeyBeJrglVgNhf91u6f5dVsd7bLQbHdbND
   fe9PayQNGhZLmKq8X92jSsqNqpPaJl4TjnFyd46f1igZ4gcLnU9rjJ4xd
   v800D5xUWw8x8JcYTXUD+bqZ0NeVwxVmVWInEGmOWCX6dWoy8h5vqvJv+
   sBjOU9WvVap5d/Uh7kr8GwwhReUNtJc8js9+Ar5ci/hxcdZYVQpWDh1BY
   eCC2DBqfOQxvMz1xVtyatuc2KgTTKqZcDmQu4hhU6YOzy8kHOKHhMFKCa
   Fo7R10uF1R0v+/73GiCL+BeyrmTtLuHAt1RobvimCNycSgPGR0iFeyR2h
   w==;
X-CSE-ConnectionGUID: K+fskSRgQgaIo+kf0qpk1A==
X-CSE-MsgGUID: ZTWBCAlSQz+FohO76RYKhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31848435"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="31848435"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 17:01:23 -0700
X-CSE-ConnectionGUID: uCmwxSFfTTWGU41y2mHezg==
X-CSE-MsgGUID: IHxd/dpyQxO6xPLDqXmDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56980010"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2024 17:01:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbqam-0005o8-0S;
	Thu, 08 Aug 2024 00:01:20 +0000
Date: Thu, 8 Aug 2024 08:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] dt-bindings: usb: microchip,usb2514: add support for
 port vbus-supply
Message-ID: <202408080755.icJLopyd-lkp@intel.com>
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
In-Reply-To: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-2-f33ce21353c9@pengutronix.de>
References: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-2-f33ce21353c9@pengutronix.de>
TO: Marco Felsch <m.felsch@pengutronix.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Matthias Kaehlcke <mka@chromium.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Fabio Estevam <festevam@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: kernel@pengutronix.de
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Marco Felsch <m.felsch@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/usb-hub-add-infrastructure-to-pass-onboard_dev-port-features/20240807-224100
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20240807-b4-v6-10-topic-usb-onboard-dev-v1-2-f33ce21353c9%40pengutronix.de
patch subject: [PATCH 2/3] dt-bindings: usb: microchip,usb2514: add support for port vbus-supply
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408080755.icJLopyd-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080755.icJLopyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408080755.icJLopyd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/usb/microchip,usb2514.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
