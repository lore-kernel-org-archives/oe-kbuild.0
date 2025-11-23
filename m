Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BBC6FC3
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763875851; cv=none; b=Ldyi1jPxolbt5IvPhnk/FbiUkwA+mQCTKWPVucBm68i+OG3YdiL8disWBuf4xkQ5gVIgk90smBYAxeqfxuKKxzELqIMOm9INxxmXx9GREqMH6RCgFnE3cE+9HsFwRxuDprfaGmMSyXJn+VsO6b1swlz38KBekBX+11sTxPCKBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763875851; c=relaxed/simple;
	bh=02BNnf1ostVlB1+N2r5RVJIewPOMWI2gSOA1rIN9nY8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cb99KDbY/WZbGjv2bskNiyjaDI/Af3XSgkHAYo3OFGkkLrrGnSnVcfCmartrcTMmg+iHTBuBDU3DEtIqO2DzeG5pTGo8DfxdT+NC4+/kPHod6asRX0CVAnwlef+SJdKL6MD0moozNxJ55BF2TtsT7P+ue7Fj/LW6aawaqoAk6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmZq1zgt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmZq1zgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763875850; x=1795411850;
  h=date:from:to:subject:message-id:mime-version;
  bh=02BNnf1ostVlB1+N2r5RVJIewPOMWI2gSOA1rIN9nY8=;
  b=hmZq1zgtTRIEKd4fH5GD9ertr77N4rVG7cabsb0EnG+FKRQWJWQHbyDO
   yJQRw/GRIg/VD3sKEzjRy0jN+mZegoZnTkb8AZoQGPDeR1WEQVB8ncSne
   +llZQ2br6qhcyhUVLdlGPWUy40RHjYY5sG62NACyTdz9aM8CnZED9OZp0
   dkQt8mtfNubeO29pQ75de5p8rKdzKpbI6/rzpZD2L/+M95lwgoKjRVTL4
   0Xb97DdrEg8sZu6Y0rjyEbNThtsAIeIC8wFAJ1W2TrEkH+aokEhMzEm1z
   Hah6+2MxTW9vq6Id9k/zr+iouvZoRLDv47wIa8YD5cJqP2EuYesnT0AcJ
   g==;
X-CSE-ConnectionGUID: IxCyrTH2SG6Sy13Lwl2x7A==
X-CSE-MsgGUID: aLWdTPvsR1qQCRBEV3BwSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76242405"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="76242405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 21:30:48 -0800
X-CSE-ConnectionGUID: IlMihnFJRZmg6JdjnKcT8A==
X-CSE-MsgGUID: 7kVd5+X6QsmSiacSmzxJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="196201811"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2025 21:30:47 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vN2gO-000000002KV-49g6
	for oe-kbuild@lists.linux.dev;
	Sun, 23 Nov 2025 05:30:44 +0000
Date: Sun, 23 Nov 2025 06:29:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [morimoto:string-helper-2025-11-17 70/145] checkpatch:
 WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
Message-ID: <202511230640.Zqx0A3VD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux string-helper-2025-11-17
head:   44ab8a61746400859fc6dd4d140afdf27adf5d13
commit: 4d4e3ab96682206ac08b5fe4ad13770dd6d66d97 [70/145] usb: gadget: use string choices helper
:::::: branch date: 6 days ago
:::::: commit date: 10 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251123/202511230640.Zqx0A3VD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#22: FILE: drivers/usb/gadget/udc/bcm63xx_udc.c:2178:
+			seq_printf(s, "control ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#26: FILE: drivers/usb/gadget/udc/bcm63xx_udc.c:2181:
+			seq_printf(s, "bulk ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#30: FILE: drivers/usb/gadget/udc/bcm63xx_udc.c:2184:
+			seq_printf(s, "interrupt ");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
