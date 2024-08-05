Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A02AE95
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880066; cv=none; b=JUBGKYpve2p1NIaF+7lvTbsuHa3no79/bN+C8UVigmexl0hfZ++y3I4qPIzNyMCdkw9eXsTAyk1LMRlBzsbU/OMu9RnAVYN58p2EEZ3x4Wb/f1cvUT8Cuth/lXS6RoFBIgvHXwlSN/F79QLFGZFlUIZnJDbFbVKpJxaYuc6rH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880066; c=relaxed/simple;
	bh=K0Ob54/fkTIQW3bjvArnqK6bc5LuMhjvRzSztIhimZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTsF126sqQt3hN+v0jSzo1UI4A+j4H4mkPSXs74ePmcUUcNaWLR6TLS9l4gQiwu4fhlh9MwoB8Ym2bA3XzjQcwjKBsyCuEWO/mRq5OYsyl56WNBUuydbIgj60O4AQ8yX08QRJhxZhtmz1mAqjMzYyBbe+8SOhCV9nGzAs2suiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWKa9Mg4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWKa9Mg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722880064; x=1754416064;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K0Ob54/fkTIQW3bjvArnqK6bc5LuMhjvRzSztIhimZc=;
  b=JWKa9Mg4TQi/+rtT4jEmwsZsyYeayw7sg4seI9byLFoVYdls66vIWkAX
   rixtrDTu+xlcc0oY/ysGdGYXPvKHOKPqZ3zdrC+SUBM2oHajKPeyKUGEi
   HFYC5wrUc/nl+u1lWsk4ogksI6AtngmfQqkBwCeb0H8+meitvpcjBudut
   EA4BSG034/2GxRAHpg5sgAHCeSeIj+bSb992xJKD3jKgwgfVK+D1Fz/Qg
   geNyjbuGhrRGqBfNhNXq20s9ElkCc3rr22/r9gqxA1aNLIoTxDLHa745U
   Op64ZXwX7vhu9erLLSQMIvBCy15UGkTO3wSag+hZSf0p1RdOS+xad7QxO
   Q==;
X-CSE-ConnectionGUID: N2xJN7szT5SBFc7g9jkElQ==
X-CSE-MsgGUID: RBwt2Iw/QrSk+Sk6pVeXVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20739890"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20739890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 10:47:44 -0700
X-CSE-ConnectionGUID: 18gjQloLSA6acX+q69eQSw==
X-CSE-MsgGUID: sPXBeuxIQeGEk6QMatvUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56330679"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 10:47:42 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb1o4-0003Ma-0W;
	Mon, 05 Aug 2024 17:47:40 +0000
Date: Tue, 6 Aug 2024 01:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 2/48]
 drivers/gpu/drm/i915/display/intel_opregion.c:1040:27-28: WARNING
 opportunity for swap()
Message-ID: <202408060159.iCK99Vn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   d101d137caddccec5869425ef5bb85d930f04312
commit: 9a82665f0e365a88fc0101f0de2de1d84c349bfe [2/48] CHROMIUM: drm: i915: Quirk: Swap opregion version fields (Coral/Reef)
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-103-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060159.iCK99Vn6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408060159.iCK99Vn6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_opregion.c:1040:27-28: WARNING opportunity for swap()
   drivers/gpu/drm/i915/display/intel_opregion.c:1044:31-32: WARNING opportunity for swap()

vim +1040 drivers/gpu/drm/i915/display/intel_opregion.c

ab3595bc4ff328e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-08-17   933  
6f9f4b7a2cf7c50 drivers/gpu/drm/i915/intel_opregion.c         Chris Wilson       2016-05-23   934  int intel_opregion_setup(struct drm_i915_private *dev_priv)
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   935  {
7249dfcb6fc0950 drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-08-29   936  	struct intel_opregion *opregion = &dev_priv->display.opregion;
8ff5446a7ca47cf drivers/gpu/drm/i915/display/intel_opregion.c Thomas Zimmermann  2021-01-28   937  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   938  	u32 asls, mboxes;
5bc4418b557d3f5 drivers/gpu/drm/i915/intel_opregion.c         Ben Widawsky       2012-04-16   939  	char buf[sizeof(OPREGION_SIGNATURE)];
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   940  	int err = 0;
115719fceaa733d drivers/gpu/drm/i915/intel_opregion.c         Williams, Dan J    2015-10-12   941  	void *base;
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29   942  	const void *vbt;
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29   943  	u32 vbt_size;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   944  
2d80391d36e698e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-07-02   945  	BUILD_BUG_ON(sizeof(struct opregion_header) != 0x100);
2d80391d36e698e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-07-02   946  	BUILD_BUG_ON(sizeof(struct opregion_acpi) != 0x100);
2d80391d36e698e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-07-02   947  	BUILD_BUG_ON(sizeof(struct opregion_swsci) != 0x100);
2d80391d36e698e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-07-02   948  	BUILD_BUG_ON(sizeof(struct opregion_asle) != 0x100);
b3cbd98b2572ada drivers/gpu/drm/i915/intel_opregion.c         Deepak M           2015-12-14   949  	BUILD_BUG_ON(sizeof(struct opregion_asle_ext) != 0x400);
2d80391d36e698e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-07-02   950  
6f9f4b7a2cf7c50 drivers/gpu/drm/i915/intel_opregion.c         Chris Wilson       2016-05-23   951  	pci_read_config_dword(pdev, ASLS, &asls);
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22   952  	drm_dbg(&dev_priv->drm, "graphic opregion physical addr: 0x%x\n",
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22   953  		asls);
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   954  	if (asls == 0) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22   955  		drm_dbg(&dev_priv->drm, "ACPI OpRegion not supported!\n");
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   956  		return -ENOTSUPP;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   957  	}
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   958  
91a60f20712179e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2013-10-31   959  	INIT_WORK(&opregion->asle_work, asle_work);
91a60f20712179e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2013-10-31   960  
115719fceaa733d drivers/gpu/drm/i915/intel_opregion.c         Williams, Dan J    2015-10-12   961  	base = memremap(asls, OPREGION_SIZE, MEMREMAP_WB);
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   962  	if (!base)
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   963  		return -ENOMEM;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   964  
115719fceaa733d drivers/gpu/drm/i915/intel_opregion.c         Williams, Dan J    2015-10-12   965  	memcpy(buf, base, sizeof(buf));
5bc4418b557d3f5 drivers/gpu/drm/i915/intel_opregion.c         Ben Widawsky       2012-04-16   966  
5bc4418b557d3f5 drivers/gpu/drm/i915/intel_opregion.c         Ben Widawsky       2012-04-16   967  	if (memcmp(buf, OPREGION_SIGNATURE, 16)) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22   968  		drm_dbg(&dev_priv->drm, "opregion signature mismatch\n");
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   969  		err = -EINVAL;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   970  		goto err_out;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   971  	}
44834a67c0082e2 drivers/gpu/drm/i915/intel_opregion.c         Chris Wilson       2010-08-19   972  	opregion->header = base;
82d3c90cc8e3ca8 drivers/gpu/drm/i915/intel_opregion.c         Chris Wilson       2011-02-24   973  	opregion->lid_state = base + ACPI_CLID;
01fe9dbde19a1a2 drivers/gpu/drm/i915/intel_opregion.c         Chris Wilson       2011-01-16   974  
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22   975  	drm_dbg(&dev_priv->drm, "ACPI OpRegion version %u.%u.%u\n",
98fdaaca9537b99 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08   976  		opregion->header->over.major,
98fdaaca9537b99 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08   977  		opregion->header->over.minor,
98fdaaca9537b99 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08   978  		opregion->header->over.revision);
98fdaaca9537b99 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08   979  
115719fceaa733d drivers/gpu/drm/i915/intel_opregion.c         Williams, Dan J    2015-10-12   980  	mboxes = opregion->header->mboxes;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   981  	if (mboxes & MBOX_ACPI) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22   982  		drm_dbg(&dev_priv->drm, "Public ACPI methods supported\n");
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   983  		opregion->acpi = base + OPREGION_ACPI_OFFSET;
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   984  		/*
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   985  		 * Indicate we handle monitor hotplug events ourselves so we do
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   986  		 * not need ACPI notifications for them. Disabling these avoids
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   987  		 * triggering the AML code doing the notifation, which may be
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   988  		 * broken as Windows also seems to disable these.
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   989  		 */
6fb0a14fac871af drivers/gpu/drm/i915/display/intel_opregion.c Hans de Goede      2019-12-12   990  		opregion->acpi->chpd = 1;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   991  	}
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   992  
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05   993  	if (mboxes & MBOX_SWSCI) {
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10   994  		u8 major = opregion->header->over.major;
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10   995  
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10   996  		if (major >= 3) {
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10   997  			drm_err(&dev_priv->drm, "SWSCI Mailbox #2 present for opregion v3.x, ignoring\n");
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10   998  		} else {
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10   999  			if (major >= 2)
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10  1000  				drm_dbg(&dev_priv->drm, "SWSCI Mailbox #2 present for opregion v2.x\n");
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1001  			drm_dbg(&dev_priv->drm, "SWSCI supported\n");
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1002  			opregion->swsci = base + OPREGION_SWSCI_OFFSET;
6f9f4b7a2cf7c50 drivers/gpu/drm/i915/intel_opregion.c         Chris Wilson       2016-05-23  1003  			swsci_setup(dev_priv);
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1004  		}
69898171829d6fb drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10  1005  	}
b3cbd98b2572ada drivers/gpu/drm/i915/intel_opregion.c         Deepak M           2015-12-14  1006  
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1007  	if (mboxes & MBOX_ASLE) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1008  		drm_dbg(&dev_priv->drm, "ASLE supported\n");
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1009  		opregion->asle = base + OPREGION_ASLE_OFFSET;
68bca4b0c5553c0 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2013-04-29  1010  
115719fceaa733d drivers/gpu/drm/i915/intel_opregion.c         Williams, Dan J    2015-10-12  1011  		opregion->asle->ardy = ASLE_ARDY_NOT_READY;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1012  	}
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1013  
e35d8762b04f89f drivers/gpu/drm/i915/display/intel_opregion.c Anisse Astier      2021-12-29  1014  	if (mboxes & MBOX_ASLE_EXT) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1015  		drm_dbg(&dev_priv->drm, "ASLE extension supported\n");
e35d8762b04f89f drivers/gpu/drm/i915/display/intel_opregion.c Anisse Astier      2021-12-29  1016  		opregion->asle_ext = base + OPREGION_ASLE_EXT_OFFSET;
e35d8762b04f89f drivers/gpu/drm/i915/display/intel_opregion.c Anisse Astier      2021-12-29  1017  	}
b3cbd98b2572ada drivers/gpu/drm/i915/intel_opregion.c         Deepak M           2015-12-14  1018  
a391e06958b2fe3 drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10  1019  	if (mboxes & MBOX_BACKLIGHT) {
a391e06958b2fe3 drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10  1020  		drm_dbg(&dev_priv->drm, "Mailbox #2 for backlight present\n");
a391e06958b2fe3 drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10  1021  	}
a391e06958b2fe3 drivers/gpu/drm/i915/display/intel_opregion.c Jani Nikula        2022-02-10  1022  
ab3595bc4ff328e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-08-17  1023  	if (intel_load_vbt_firmware(dev_priv) == 0)
ab3595bc4ff328e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-08-17  1024  		goto out;
ab3595bc4ff328e drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-08-17  1025  
0e53f472c3f6d72 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1026  	if (dmi_check_system(intel_no_opregion_vbt))
0e53f472c3f6d72 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1027  		goto out;
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1028  
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1029  	if (dmi_check_system(chromebook_broken_opregion_version)) {
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1030  		typeof(opregion->header->over) *over = &(opregion->header->over);
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1031  		u8 tmp;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1032  
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1033  		if (over->major == 0 && over->minor == 0 &&
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1034  		    over->revision == 0 && over->rsvd == 2) {
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1035  			drm_info(&dev_priv->drm,
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1036  				 "Quirk: swapping fields in opregion %hhu %hhu %hhu %hhu\n",
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1037  				 over->major, over->minor, over->revision, over->rsvd);
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1038  
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1039  			tmp = over->rsvd;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28 @1040  			over->rsvd = over->major;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1041  			over->major = tmp;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1042  
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1043  			tmp = over->revision;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1044  			over->revision = over->minor;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1045  			over->minor = tmp;
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1046  		}
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1047  	}
9a82665f0e365a8 drivers/gpu/drm/i915/display/intel_opregion.c Radoslaw Biernacki 2021-12-28  1048  
98fdaaca9537b99 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1049  	if (opregion->header->over.major >= 2 && opregion->asle &&
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1050  	    opregion->asle->rvda && opregion->asle->rvds) {
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1051  		resource_size_t rvda = opregion->asle->rvda;
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1052  
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1053  		/*
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1054  		 * opregion 2.0: rvda is the physical VBT address.
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1055  		 *
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1056  		 * opregion 2.1+: rvda is unsigned, relative offset from
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1057  		 * opregion base, and should never point within opregion.
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1058  		 */
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1059  		if (opregion->header->over.major > 2 ||
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1060  		    opregion->header->over.minor >= 1) {
f4224a4cb16c248 drivers/gpu/drm/i915/display/intel_opregion.c Pankaj Bharadiya   2020-01-28  1061  			drm_WARN_ON(&dev_priv->drm, rvda < OPREGION_SIZE);
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1062  
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1063  			rvda += asls;
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1064  		}
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1065  
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1066  		opregion->rvda = memremap(rvda, opregion->asle->rvds,
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1067  					  MEMREMAP_WB);
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1068  
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1069  		vbt = opregion->rvda;
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1070  		vbt_size = opregion->asle->rvds;
f0067a31e83425d drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1071  		if (intel_bios_is_valid_vbt(vbt, vbt_size)) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1072  			drm_dbg_kms(&dev_priv->drm,
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1073  				    "Found valid VBT in ACPI OpRegion (RVDA)\n");
f0067a31e83425d drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1074  			opregion->vbt = vbt;
ada8f955988394c drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1075  			opregion->vbt_size = vbt_size;
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1076  			goto out;
2e5fec5f621410f drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1077  		} else {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1078  			drm_dbg_kms(&dev_priv->drm,
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1079  				    "Invalid VBT in ACPI OpRegion (RVDA)\n");
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1080  			memunmap(opregion->rvda);
a0f52c3d357af21 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2019-02-08  1081  			opregion->rvda = NULL;
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1082  		}
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1083  	}
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1084  
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1085  	vbt = base + OPREGION_VBT_OFFSET;
dfb65e71ea2c1d9 drivers/gpu/drm/i915/intel_opregion.c         Hans de Goede      2017-02-14  1086  	/*
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1087  	 * The VBT specification says that if the ASLE ext mailbox is not used
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1088  	 * its area is reserved, but on some CHT boards the VBT extends into the
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1089  	 * ASLE ext area. Allow this even though it is against the spec, so we
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1090  	 * do not end up rejecting the VBT on those boards (and end up not
ccbf6b6498a47a7 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1091  	 * finding the LCD panel because of this).
dfb65e71ea2c1d9 drivers/gpu/drm/i915/intel_opregion.c         Hans de Goede      2017-02-14  1092  	 */
dfb65e71ea2c1d9 drivers/gpu/drm/i915/intel_opregion.c         Hans de Goede      2017-02-14  1093  	vbt_size = (mboxes & MBOX_ASLE_EXT) ?
dfb65e71ea2c1d9 drivers/gpu/drm/i915/intel_opregion.c         Hans de Goede      2017-02-14  1094  		OPREGION_ASLE_EXT_OFFSET : OPREGION_SIZE;
dfb65e71ea2c1d9 drivers/gpu/drm/i915/intel_opregion.c         Hans de Goede      2017-02-14  1095  	vbt_size -= OPREGION_VBT_OFFSET;
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1096  	if (intel_bios_is_valid_vbt(vbt, vbt_size)) {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1097  		drm_dbg_kms(&dev_priv->drm,
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1098  			    "Found valid VBT in ACPI OpRegion (Mailbox #4)\n");
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1099  		opregion->vbt = vbt;
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1100  		opregion->vbt_size = vbt_size;
2e5fec5f621410f drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1101  	} else {
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1102  		drm_dbg_kms(&dev_priv->drm,
5cb82703ce9eb20 drivers/gpu/drm/i915/display/intel_opregion.c Wambui Karuga      2020-01-22  1103  			    "Invalid VBT in ACPI OpRegion (Mailbox #4)\n");
04ebaadb9f2dc66 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-15  1104  	}
b30581a4d64f226 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2015-12-14  1105  
0e53f472c3f6d72 drivers/gpu/drm/i915/intel_opregion.c         Jani Nikula        2017-03-29  1106  out:
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1107  	return 0;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1108  
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1109  err_out:
115719fceaa733d drivers/gpu/drm/i915/intel_opregion.c         Williams, Dan J    2015-10-12  1110  	memunmap(base);
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1111  	return err;
8ee1c3db9075cb3 drivers/gpu/drm/i915/i915_opregion.c          Matthew Garrett    2008-08-05  1112  }
a05628195a0d9f3 drivers/gpu/drm/i915/intel_opregion.c         Ville Syrjälä      2016-04-11  1113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
