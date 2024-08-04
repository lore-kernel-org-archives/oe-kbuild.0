Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED4F17588
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722760153; cv=none; b=GTO/5hzq77BoAZjXWL4zWs4wN2ouRoEgZQD8z+FVS4hZlmfmCddMwbEBbLav/BnIuAlFJA3cK8Gp/+HjPRlWwc3SonWymjUzwmRTpSyHwmFt1cBTUTOWtLECRNngSlmCubrN+w9/MKrxHmq1Tk5Kz623wRPL7KY95wI1Fu5P3aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722760153; c=relaxed/simple;
	bh=mqmdvVoRyrdOZWR7kR/QOPYpqqXLeD3iqwPXkD6JpD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPYX0r+5ydRJ/zi4L8P09wEF02/8iWNuplTdWuFXoOJw9GQqPoE/++LrJqiIxX1LA4/bJdHfFWWvbNw2b3nQVslDfCl9ZSmezN8WugN5bfnf3np6fjrGN8Dgvty30Rcfr3mPn6QQiU/uQZdfanC1QbzyvXhTjn35/PhNTaOA+HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nB6St0JN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nB6St0JN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722760152; x=1754296152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mqmdvVoRyrdOZWR7kR/QOPYpqqXLeD3iqwPXkD6JpD8=;
  b=nB6St0JNf7wHji6Q1lV2qQ5NLNqZPleX4mgrDrR+LQndLbwRhDnnx1fX
   +rb0BwW6Yok8fcRpXDjcn428xrzWQVehoZno/CkgvYLX1jz8OQDQ43XnB
   FRytR6bEm9feN3bfLtRcrkXb2eqiyK9IiCJlMNLPa0+ZB5J6QwsF+RHYx
   bWLZ3nssxRkXJofTMcXSbrDc7ox/FgiS3eUVYAqkVXwWUXC5gLpMshllO
   4YgTG+TJkqVJeTbmv8HLCRWcppyKdDuKS7oEb1qrqO8SfY1G1bcqGZpWH
   ftmCbtvBglDN4Zj/d6n540PeZ73aurOnIEePF4myDZmGmuvxJ3K2Lommx
   A==;
X-CSE-ConnectionGUID: 3KKU+zazQROhmoDfB0mk9g==
X-CSE-MsgGUID: ddMz5SS3QoCLs2fPC4nBuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31886671"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="31886671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 01:29:11 -0700
X-CSE-ConnectionGUID: z53opoa9RR2AwtYFoyWDpQ==
X-CSE-MsgGUID: FF+u6IR7TjyfjxQxx8Dg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="55806075"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2024 01:29:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saWbz-0001KE-1Q;
	Sun, 04 Aug 2024 08:29:07 +0000
Date: Sun, 4 Aug 2024 16:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: Add Loongson UART controller
Message-ID: <202408041649.r0sSTgd7-lkp@intel.com>
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
In-Reply-To: <20240804063834.70022-1-zhenghaowei@loongson.cn>
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
TO: zhenghaowei@loongson.cn
TO: zhenghaowei@loongson.cn
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: p.zabel@pengutronix.de
CC: linux-serial@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: loongarch@lists.linux.dev

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenghaowei-loongson-cn/tty-serial-8250-Add-loongson-uart-driver-support/20240804-145047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240804063834.70022-1-zhenghaowei%40loongson.cn
patch subject: [PATCH v2 1/3] dt-bindings: serial: Add Loongson UART controller
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arc-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041649.r0sSTgd7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041649.r0sSTgd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408041649.r0sSTgd7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml: fractional-division: missing type definition
>> Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml: rts-invert: missing type definition
>> Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml: dtr-invert: missing type definition
>> Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml: cts-invert: missing type definition
>> Documentation/devicetree/bindings/serial/loongson,ls7a-uart.yaml: dsr-invert: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
