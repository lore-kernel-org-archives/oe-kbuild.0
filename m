Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23C82E36EB
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754168025; cv=none; b=t/YY6WskJGui+OblRjz49x8D9gsn0BamgSSK2De7aZDYCKM0fMOzhWA8pWW/47x91s8t8MojxTcuEfWGaxxFqNUla1c6L/GjZqovV/GnC1eqtZpz+vDffobod3XTajcOi58asEbcvwL50RMWWfgvFZb1WU78+IYHnC/Tyv2IMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754168025; c=relaxed/simple;
	bh=X76Aes6eRNhjKTg0bF7V2aZhHAx2Uyw5vFzP6U7wNBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUliyLz4YgIW4VJIRCAoA0kwhFZzKNAaLXyEjAwflgxEQ34oIiJV4L81Z8vuxPX5lEsaQzcAwRGdso8ueiXyWkwIabiEvUPARxse9y0uZy6Tn8bSoA0qWbTxBSDn6eSe7qXqIldXHPDuDXEqWQSf2vem5jbirg7OW/HG6QgPYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTIW7Af4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTIW7Af4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754168024; x=1785704024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X76Aes6eRNhjKTg0bF7V2aZhHAx2Uyw5vFzP6U7wNBQ=;
  b=LTIW7Af4kRkqt9ZbDrn+8CfaNmUrbvcENlvxRz8mCs6rwzrZS3dLyrYM
   im6NAGC17Bg/qFmiEVDfkPHoqEqHM54E7PAmQqGfgiGz+EjG+GG0xcG9V
   OcW5YG7a/d36miweMF/mYFbrwfH/AYMq4pQnKsKpzY8WL/hQYh6wcPMrB
   wX21D5dLyMbHkx1VEgD62hoFF6FYaJdYWM6cPM5PN+R6bpPdSE4BlogFG
   KQ9l38N9hxV9xiDZMkbES0qQ07eDwjUP1ld30nB2EA/gcL2OlpXojdjyF
   yhfUQy1HXnV4B00TO0uVvAhLJpls7vEHhHWFOI0maEZFagBpCgIqooiye
   Q==;
X-CSE-ConnectionGUID: A/vKzu7RSNS4gITcx196Qw==
X-CSE-MsgGUID: SIjPyc4JQ0OaQ2Dp/ecK4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="73939553"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="73939553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 13:53:44 -0700
X-CSE-ConnectionGUID: w+/v7FLoTEmjNk9LalMkbA==
X-CSE-MsgGUID: DjoSUSWbQuqVw/bW2WhhVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163114885"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2025 13:53:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiJEa-0005b2-1I;
	Sat, 02 Aug 2025 20:53:40 +0000
Date: Sun, 3 Aug 2025 04:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 11/60]
 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display
 (microtips,mf-101hiebcaf0): 'power-supply' is a required property
Message-ID: <202508030438.TKjuX4As-lkp@intel.com>
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
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 8e43509c0c4dec12fbbc332cd4a3230caa5eb656 [11/60] arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030438.TKjuX4As-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030438.TKjuX4As-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030438.TKjuX4As-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: /display: failed to match any schema with compatible: ['microtips,mf-101hiebcaf0', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
