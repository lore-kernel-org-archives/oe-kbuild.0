Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2761AA791
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829156; cv=none; b=fwl/XUdzqBq4irAkXUiKlXJVMd+PeVPhcUULN6/zmBS05Vyf3LCBT5r1mIwlbr/rnVlFaaGh9h0r7qnXpcQAaboT0JZ4TDqy+SAKlOua1C4kKoHM8gTLYT/+l6OBvuSTQd8b379opW03wHJMjWKA3fxYpF76+GvR9XeZtoJsEdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829156; c=relaxed/simple;
	bh=Ks2rMyXQBu47jG71pMWc4/Chkl0xFy23j+7yt3scVrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VlREeiMRNXZYDs4VSy8aN0NITEgNMH2uIwXH4QspjACUBgWLBj3g/mPBzS8GKR9HMFpiHbhY/+zqipVa6elSoymYhzgEBUfZBfdwKSCBRR1kxqVXQ9KLM2WoSPWJBBURBdwXuenpScC4KfPCRkcy3K7faFDjpdGm4Gr2eer60Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEpq0vek; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEpq0vek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739829154; x=1771365154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ks2rMyXQBu47jG71pMWc4/Chkl0xFy23j+7yt3scVrI=;
  b=LEpq0vekTEN90M5xmRkJTnpDCK1a9Q7xtruwAJelEICf2f28K7oDw+cV
   /ph2yzcGXTpby4Ed5061oI1P2WcpQfsqo8qu1l4P77hR//T9etaiB65fp
   kIzpoGIrF/IisANlBhdTYsjQPG4FMh7DNmowfXMQu9XCRkcTx1y1My4Pt
   wfM1IxFHZXje3sQvHlK04Dj3jEG8FKyUvObb6NsZcKMZbQurvy/9SMzbT
   y0F9tL3a+QIRnXbNC9UBrkC1Jk5ajKTk2eDD4Cs813WV+rAISMU/nxntU
   H+iTDTkNvdRZSy4yanXkHIte0Fc0huoCexupGQZNq4wF8JaTYB8EudGj/
   A==;
X-CSE-ConnectionGUID: scIlBGLDTwK16ajD0Gj+fw==
X-CSE-MsgGUID: WrA0FYlMRnS93ni2rm8+4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28114821"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="28114821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:52:32 -0800
X-CSE-ConnectionGUID: 6k3kVt7PTmunZuUaLBl58A==
X-CSE-MsgGUID: Z8PHDSK2StOT7Io0eTVzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115114135"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2025 13:52:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk92T-001Dcp-1Q;
	Mon, 17 Feb 2025 21:52:29 +0000
Date: Tue, 18 Feb 2025 05:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/56 1/1] WARNING: modpost:
 drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.o: section mismatch
 in reference: tfp410_driver (section: .data) -> tfp410_driver_exit (section:
 .exit.text)
Message-ID: <202502180521.ogQ4rodj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

Hi Uwe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: 999ecc936a99cdd3392a652fa3686e74bae5d671 [1/1] modpost: Don't let "driver"s reference .exit.*
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250218/202502180521.ogQ4rodj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180521.ogQ4rodj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502180521.ogQ4rodj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.o: section mismatch in reference: opa362_driver (section: .data) -> opa362_remove (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.o: section mismatch in reference: tfp410_driver (section: .data) -> tfp410_driver_exit (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.o: section mismatch in reference: tpd_driver (section: .data) -> tpd_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.o: section mismatch in reference: dvi_connector_driver (section: .data) -> dvic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.o: section mismatch in reference: hdmi_connector_driver (section: .data) -> hdmic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.o: section mismatch in reference: tvc_connector_driver (section: .data) -> tvc_remove (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.o: section mismatch in reference: panel_dpi_driver (section: .data) -> panel_dpi_driver_exit (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.o: section mismatch in reference: dsicm_driver (section: .data) -> dsicm_driver_exit (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.o: section mismatch in reference: sharp_ls_driver (section: .data) -> sharp_ls_remove (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/atmel_lcdfb.o: section mismatch in reference: atmel_lcdfb_driver (section: .data) -> atmel_lcdfb_driver_exit (section: .exit.text)
>> WARNING: modpost: drivers/rtc/rtc-at91rm9200.o: section mismatch in reference: at91_rtc_driver (section: .data) -> at91_rtc_driver_exit (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-davinci.o: section mismatch in reference: davinci_rtc_driver (section: .data) -> davinci_rtc_remove (section: .exit.text)
>> WARNING: modpost: drivers/rtc/rtc-mv.o: section mismatch in reference: mv_rtc_driver (section: .data) -> mv_rtc_driver_exit (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-pcap.o: section mismatch in reference: pcap_rtc_driver (section: .data) -> pcap_rtc_remove (section: .exit.text)
>> WARNING: modpost: drivers/rtc/rtc-sh.o: section mismatch in reference: sh_rtc_platform_driver (section: .data) -> sh_rtc_platform_driver_exit (section: .exit.text)
WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8.o: section mismatch in reference: et8ek8_i2c_driver (section: .data) -> et8ek8_remove (section: .exit.text)
>> WARNING: modpost: drivers/watchdog/at91sam9_wdt.o: section mismatch in reference: at91wdt_driver (section: .data) -> at91wdt_driver_exit (section: .exit.text)
WARNING: modpost: drivers/mmc/host/davinci_mmc.o: section mismatch in reference: davinci_mmcsd_driver (section: .data) -> davinci_mmcsd_driver_exit (section: .exit.text)
WARNING: modpost: drivers/memory/emif.o: section mismatch in reference: emif_driver (section: .data) -> emif_remove (section: .exit.text)
WARNING: modpost: drivers/ata/pata_samsung_cf.o: section mismatch in reference: pata_s3c_driver (section: .data) -> pata_s3c_remove (section: .exit.text)
WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc.o: section mismatch in reference: txx9ndfmc_driver (section: .data) -> txx9ndfmc_remove (section: .exit.text)
WARNING: modpost: drivers/hwmon/smsc47m1.o: section mismatch in reference: smsc47m1_driver (section: .data) -> smsc47m1_remove (section: .exit.text)
>> WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx.o: section mismatch in reference: adc3xxx_i2c_driver (section: .data) -> adc3xxx_i2c_driver_exit (section: .exit.text)
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
