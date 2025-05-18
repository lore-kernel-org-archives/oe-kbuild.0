Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8EC1802B
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 01:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747530743; cv=none; b=jBvjpGupWWifiMmODrLU2+Y/K4Kk/1os2kNKgSJLD9PAw1NZ5jkZCCs1D20Cb5ZeEGR2OvwyE9dLeATBr73o+9gHRKe3/ypmI8vOu5dNXJboLTqHkJoIqSj4kyovD6n/5Kf/KeiTfVq9M9al6mnm00Bd309j4z7fbgLcwluB9e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747530743; c=relaxed/simple;
	bh=X3xwN8CKNXfzlxDQ4YeLuK2l66dWtcbM8rCrHhNX2hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VuTe4X+yxKWnQcKhl3mXQ930jkbq6GL5cICJzwzjJWwqgS6CsXNdzlbK2iWAJ822ZW9019wVIP0xmjIXiLBfYHYVmsXY+Fyw3c+Z9CHO8vbTDKXkspgh8nYSZyi/jQwYbmLX80V+PK/C255q41uvz3rzSsaUfyO2NzKskps59v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOo9jsWJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOo9jsWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747530741; x=1779066741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X3xwN8CKNXfzlxDQ4YeLuK2l66dWtcbM8rCrHhNX2hk=;
  b=MOo9jsWJV/hgWxC8QDoM0omu1/lRZQDBdwXo3HvWWaV/b2dcAO98BnYa
   e1T2nIlf1gKCitX7rRumZo5qpuOE3uwISX4VGRwJ2meUYB/xaoC+ohg01
   UwqvWdepeK2+nIFzHSA1jFZL8R5gfq9nqeW1omRdyDLXqBM2LWPkJvb+a
   pE3wVAHM9HAGMnuToAbOEtJyetdh6m1OF+3t2SICDyg3H7sToAe4jKGZi
   dlO5Xjv2V4vTBwCKjBgO70+a632TJHgZgccFVu9Mwr1OCDmAejRI4i5m/
   xnEtQv5/Mt2YS8c0Y7uTxtb1MNxhxVvTBZJF24YOamMQiLM139JbxXIqB
   w==;
X-CSE-ConnectionGUID: CuumyZx3RZeAHKb3zuOh7Q==
X-CSE-MsgGUID: omds7K9KRfG5u81Rp9S0DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49620338"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49620338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 18:12:20 -0700
X-CSE-ConnectionGUID: gRnCb5R6R0K9PjEiAlAPWw==
X-CSE-MsgGUID: FwT49pUaTXWgtJL3D4bDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="144154973"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 17 May 2025 18:12:19 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGSZc-0000c7-3B;
	Sun, 18 May 2025 01:12:16 +0000
Date: Sun, 18 May 2025 09:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15 1/1]
 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: connector:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <202505180943.OjGjyTl8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: connector: Missing additionalProperties/unevaluatedProperties constraint"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: 621600ed2ce5833a72f73433aa5b05a7b9fed3c5 [1/1] dt-bindings: Another pass removing cases of 'allOf' containing a '$ref'
:::::: branch date: 9 days ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-2052-20250516 (https://download.01.org/0day-ci/archive/20250518/202505180943.OjGjyTl8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180943.OjGjyTl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505180943.OjGjyTl8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   7 is greater than the maximum of 5
   7 is greater than the maximum of 6
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
   Documentation/devicetree/bindings/clock/imx8m-clock.yaml: title: 'NXP i.MX8M Family Clock Control Module Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: title: 'STMicroelectronics STM32 USB HS PHY controller binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: connector: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
