Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C095B14EC73
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758463611; cv=none; b=SPafbIV/dLwdIx8s9j4Cx2NU3U0VZr3r3cb1vCBwshu+eQ4lMiL+OLsIH8uoJhgRECrjT0LN3WDfTZfTl+QH0LURbcr9rrw7CTbkhUw4JB217Iq02LkBcDg8umbQ5FkR82Z3xtT1KYFkH2hLtfEVWkefMFtp4N/K9AOw/FJw4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758463611; c=relaxed/simple;
	bh=KXRyFvSj/k4tl4gI57Ff0mlvmlpQUpQ6NogLpZmLV2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvSMVzDzm/ZaHOis5xVNeOhLpCKV9h5mzgqeCfW/3gTZSEp7quEtfZBcyFbXWiaUsco5V9ZF1jfryA6jiO/d6MgCx1GCCDXqWoJUpAJbp17ZBFYDcbrrPhT32uYOYXL1EAJ7Srm6NvdeSOQkf6KDOQJuMYFr1q7Amf4D2SJtHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avNczAQC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avNczAQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758463610; x=1789999610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXRyFvSj/k4tl4gI57Ff0mlvmlpQUpQ6NogLpZmLV2g=;
  b=avNczAQCW5cwZa+jxKhTnPin56rdjKKwyNwBkmU07Kzk+SpCXueMjRtQ
   /Ap2NpnjLCK7OOR5sYWPH/jW9jSTZnf5ms1zpMvSjgGEvsnhr+1XpKW7j
   MRUf+yrrhkGoGubXQBGFAwSCXKm5WP9jMzqHUvfDSbs1O/SWoJBQ4dUS/
   Bgat4nXnh4ZrY0YnGR7RlnyfqSRtL95tzsYmmybXJbWOgfIoyDZ1AAkfm
   92fLnRfzUC366O9UK0zl724mcm1aRuAFXMIE+dRa7fGw8dIZpTabKv6LE
   zW5wNbpJPwdhP3CsJK+SoJpQ4AJMwHHGsNVBwqi/Gqc8C9br71n/0aDVg
   g==;
X-CSE-ConnectionGUID: LOwm4B8wSMG8MpUaKNRN+Q==
X-CSE-MsgGUID: IEBDYjNWR3C2i3qOeeKO6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72111031"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="72111031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 07:06:49 -0700
X-CSE-ConnectionGUID: yHSUN+3gRSGF33L6WWhI2Q==
X-CSE-MsgGUID: 106DfccvQouawVqP+Jh/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="180519151"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 21 Sep 2025 07:06:47 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0KiD-000000003aL-0sJA;
	Sun, 21 Sep 2025 14:06:45 +0000
Date: Sun, 21 Sep 2025 16:05:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 7/134]
 arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a110000: failed to
 match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
Message-ID: <202509211630.Wi0wqFkm-lkp@intel.com>
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
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   00c6dc8272d302876034765e34843f6abc62219f
commit: 2f62f9cb61842e57711ee8085888d1897bf0869c [7/134] arm64: dts: apple: s800-0-3: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250921/202509211630.Wi0wqFkm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211630.Wi0wqFkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211630.Wi0wqFkm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
