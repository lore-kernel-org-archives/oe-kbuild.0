Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66B39C627
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712949; cv=none; b=k41i+mcHL0sNl4B2cYnqZtrgdB6PRZB/lLAGGy/k28GKW/A0nxsnzGRqDFp0XpQ7CfFKpAoiIk99JsRBRjG8N/BnFL+FGreYlO6Jv8jTsh3L6m0VFBSa4mwqPejqDBz6oyTARqqR57USUjs+ORyImB3kCMPgvDrYT0Savy8RHn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712949; c=relaxed/simple;
	bh=SCgc090RpC7GKTHPqMFWwpOzwDyHI2Pk1o0VOdkZ9YQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uByQMDly4PY+mco5DkwAaY8XM2ENMbFOGTYcDWYeiXkbjfNpk0U5plPwu0Aew7h+MYGNzpkIkdJ/liM/wsWQTUhrXLsAVWgVP8S5ggSfqtkKYy+ldNkjl0nd/L8ZN8ySgF1DyDrBKXtvci0SsN/S+UI/9ITsltS9XcSYCqSMUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQkQr/wb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQkQr/wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772712945; x=1804248945;
  h=date:from:to:cc:subject:message-id;
  bh=SCgc090RpC7GKTHPqMFWwpOzwDyHI2Pk1o0VOdkZ9YQ=;
  b=cQkQr/wbOCbWDaFgpX90/y2olX6wtorl6y15onSHTh2WXyUBSUwKisA1
   it66LVN4L75gcsdPN2ZbnNeclHs3vN/Wl9hnfJfZm6vk83oW2X0rTO+MJ
   LGvZTZi/1mcEObi77Ii8B7WCh44B8qAA+CXa6Gp+YraMWFkk/JxvRdh8E
   nDcYBXDHBmA/qNXCeB+4K77cTjLaVF6gMIvJzLln+s7j1Q7nuURVNmKmS
   96/LGbhMp7e2jrn9wOsnG9XqpqEbJGBQXpwZN3GwLTqNihkYqso13DrVQ
   A8dSZw+YFyWVdEZsl98gqFW0pwCMyN9lBuO8hMO50OfjGy106LkrwA5Kl
   w==;
X-CSE-ConnectionGUID: LOcGFdxDTaG8Jrkk/HrrgQ==
X-CSE-MsgGUID: UuTMbahKTNmSt2N23LYSTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73987702"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="73987702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 04:15:45 -0800
X-CSE-ConnectionGUID: Q+prfaZVTQasb4F1yo0gdQ==
X-CSE-MsgGUID: WNmB6T8GQ2qTv8iM34CNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="249135446"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 04:15:44 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy7cC-000000001zJ-48j2;
	Thu, 05 Mar 2026 12:15:40 +0000
Date: Thu, 05 Mar 2026 13:15:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_msgdma_v2 1/3]
 Documentation/devicetree/bindings/dma/altr,socfpga-pref-msgdma.yaml:
 ignoring, error parsing file
Message-ID: <202603051341.gsb6jLKj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Narayan, Preetam" <preetam.narayan@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: "Subhransu S. Prusty" <subhransu.sekhar.prusty@altera.com>
CC: Krishna Kumar S R <krishna.kumar.simmadhari.ramadass@altera.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_msgdma_v2
head:   51a0b5a7acc55c6a02167c4dfcee381ae2e2e649
commit: 9e039c6a38a3aafc98665da5f558d392f9866b8c [1/3] dt-bindings: dma: altr,socfpga-pref-msgdma: Add binding for mSGDMA Prefetcher
:::::: branch date: 8 hours ago
:::::: commit date: 23 hours ago
config: openrisc-randconfig-2051-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051341.gsb6jLKj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051341.gsb6jLKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603051341.gsb6jLKj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/dma/altr,socfpga-pref-msgdma.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/dma/altr,socfpga-pref-msgdma.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/dma/altr,socfpga-pref-msgdma.yaml: ignoring, error parsing file
--
>> Documentation/devicetree/bindings/dma/altr,socfpga-pref-msgdma.yaml:10:1: found character '\t' that cannot start any token
--
>> Documentation/devicetree/bindings/dma/altr,socfpga-pref-msgdma.yaml:10:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
