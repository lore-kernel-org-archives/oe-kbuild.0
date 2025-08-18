Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C781A4F3C
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755553535; cv=none; b=FjZyt8kZGVmjdD84mYPbuzEj970+mUHuOdHUL5Ez58d8bQxJJ/ByInSyMNoNTJbB3RcWRmxsYUwpnPUa4er9iUqLPeXN/t3MXRySxrPpE7wvpE9bXIN30jmdEXNc41ybPy51mVJ4hbxehpNlVd+kNPMP2x/7ahfX66J2mNyhY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755553535; c=relaxed/simple;
	bh=SwLTeaH1xq2wUJAosDe3rYnwBabV4O2NA4wZlK4RRfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AXTxOJAIMBcmzfyximhbNMpR9pc/JJSdKbExp4ktCmo/AtV/S7ENVzKvwBGU13uWH11PvjNUTqL4y1LkcPVVqSi6vOEc/vNBtUBXAJ8IbXqNKPrKYjbSvtR4ALyu5ig8hTaqEHew2FlBVu6N9LXjhtdIYJxg3PR7bm7vMWNAQD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPAWed/v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPAWed/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755553534; x=1787089534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwLTeaH1xq2wUJAosDe3rYnwBabV4O2NA4wZlK4RRfU=;
  b=ZPAWed/vaiFoFiKZT80fn67Kt7oEN3iSH5AQFLIG3lT9R/upy5iGUQCA
   E+0iFrlhnRi8Vt8i9vB7lSUJvM40TDKvK2uIUDrQPwsIWuMj3pGfDKEU0
   AxPw5dhPxFj8gsjqimYpJqF3s1LuE8pBjC0ID7I+E4L97RfatZBf8Ebhl
   073Oi5BJV5HhrJfYUJazjaYBAtinoxTSCnJTIoN2j9J4LCrzZpbXuWT08
   3mH9Om+4P2MPqeHc0L7z1F9LDX/XGiKx0cUgOzoL1CnpXOHv6086vT2yu
   n0TP9HDIMxw+7JSfYCE40Z3xcu7w5aavwJ104V+Hc5UlEDlF4P88ayW5Z
   g==;
X-CSE-ConnectionGUID: xlI18z1VR5+U8/XnvW1/9Q==
X-CSE-MsgGUID: u5+QCXn5SDqwCVjiJDChYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="80378268"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="80378268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 14:45:32 -0700
X-CSE-ConnectionGUID: FWmurVXVSxuUlZ6qccfH0g==
X-CSE-MsgGUID: ZwRwSP3oS/mFRqG8OlK/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167300323"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2025 14:45:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo7f7-000GEF-2u;
	Mon, 18 Aug 2025 21:45:28 +0000
Date: Tue, 19 Aug 2025 05:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.17-rc1 8/164]
 arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): memory: False schema does
 not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368,
 268435456]], 'phandle': 57}
Message-ID: <202508190533.o2Yw9OJn-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.17-rc1
head:   33bec5367ad36fc3e940629a2cf5e2191da759ce
commit: d41a94676ca4939c5f3f95c548620efd092b9516 [8/164] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: mips-randconfig-052-20250819 (https://download.01.org/0day-ci/archive/20250819/202508190533.o2Yw9OJn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190533.o2Yw9OJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508190533.o2Yw9OJn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): analog-amplifier@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): i2c-controller@3: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]], 'phandle': 57}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: interrupt-controller@10001000 (ingenic,jz4770-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-intc'] is too short
   	'ingenic,jz4770-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: jz4770-cgu@10000000 (ingenic,jz4770-cgu): $nodename:0: 'jz4770-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
