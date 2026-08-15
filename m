Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFBA13777E
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836251; cv=none; b=mlnicSmZ2hTq4AyX25l/x/LIyn8QPVshCgDj0fxM+yOtYyiLgMgFhiC/CfzA7ks8kYndulHrLvNozasMsTEcD/yJEPsgKX2LeFiABZBxuWPcx/8YEcHLa4kCRfYNTHjg2toH/XNdzDa3nNLTDZ1xi9u9cX/TfPPrzhkC+xrnTEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836251; c=relaxed/simple;
	bh=llP9TiL1Fm9SF+xnefluWpGdRjp4ed+FjBV27kfb7ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/hzzZ6xSjp+7Olhpuk3bXUM5cpknNQ9W29JrH4y+mUYqzcHVAjmqAgpQV12u/GbbRonUn6dY9qgoua39seeNcZb1WaYvepU+tnELs9P/nK+fpDe2X/5Dhle5NI8IiTPstZ2gwNndqjLwdSSVGI56jTALeR0S2fJxXjTZSot35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKypoliu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKypoliu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786836250; x=1818372250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llP9TiL1Fm9SF+xnefluWpGdRjp4ed+FjBV27kfb7ps=;
  b=NKypoliuLnJDtk4T+LDsT88/E6zylC3untTa7boiVmZX8vu9Fp0WfyRy
   8l1mkLz+BoaNfO2HV005JVjgh8HGnt4wzV9S2PdCIhi1C42TiWdF8B8rl
   D3XN/xmMh71weP8z+H1Suhy88slo8zJ6uPwlMh3K/vPYraLRN4sbRDPHx
   RdZmcz80/U1YhQRB6KZKHM5ro5xPc92jQwCM/M4135aVsU5mWoJ8YAy+V
   k1h4WpuY3TY7tHqS2I6BpTppPscklxWJAU+/0BtH1ove4RajggIwCtO6Q
   Qg5d19Y0k16AKjNU0dc7V+IW3gDqPYKJF7IswMAb+Ncb6oo509fOBjExa
   g==;
X-CSE-ConnectionGUID: I7OTDactStqINz192WzrtA==
X-CSE-MsgGUID: brVryopNR+GguSZ2e2qNzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91179233"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="91179233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 16:24:09 -0700
X-CSE-ConnectionGUID: rSIm+db+RGmGMT5SBTGWNA==
X-CSE-MsgGUID: UDAvlBvSRMKmpv6MKlRzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="258338475"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2026 16:24:08 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvNjR-000000006Ur-3iQG;
	Sat, 15 Aug 2026 23:24:05 +0000
Date: Sun, 16 Aug 2026 01:24:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: freescale: Add common DTS overlay for
 IMX-AUD-IO add-on board
Message-ID: <202608160143.ii52x3vm-lkp@intel.com>
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
In-Reply-To: <20260629074734.3643227-5-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-5-chancel.liu@oss.nxp.com>
TO: chancel.liu@oss.nxp.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: Frank.Li@nxp.com
TO: s.hauer@pengutronix.de
CC: kernel@pengutronix.de
CC: festevam@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Chancel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.2-rc7 next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chancel-liu-oss-nxp-com/dt-bindings-connector-Add-fsl-aud-io-slot-binding/20260813-144309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260629074734.3643227-5-chancel.liu%40oss.nxp.com
patch subject: [PATCH v2 4/4] arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on board
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-2051-20260815 (https://download.01.org/0day-ci/archive/20260816/202608160143.ii52x3vm-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160143.ii52x3vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160143.ii52x3vm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map: missing type definition
>> Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map-mask: missing type definition
>> Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map-pass-thru: missing type definition
--
>> Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: Unresolvable reference: /schemas/clock/clock-nexus-node.yaml#

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
