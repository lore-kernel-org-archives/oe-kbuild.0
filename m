Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39B1EE03D
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Jul 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970573; cv=none; b=ESF/FCKEc4xzFF1r7ME9ALgSs+p9WMMeqsiNAO+NpWf4/ftnTTO45LLezZKWZn7NK6tVfyaqFvRgIqPnP4xW7PO1KO8rxBzFxhjzUg0yukP0Vn1RdSJMCAxL9iOBepPH3wjtEyPBlqQASof8Wn5Ms6npqjqVHmSl3vWzUDlg+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970573; c=relaxed/simple;
	bh=jD9TNGug0EdNyZatzmq21JWKZNYtlkk7d9ppExPGOoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xbzf+uyepqfbv4HzZBb04BW4EPDbm2l6tdTzPYBxEAtsnQTrLcqtAyzeQstwgDNflohR7zXepFT/1U/lkZDk+wIiZ4g0K/RD+vk+GBbNwJXgz6j9TuHP5DrJdKRQxkKiqxT3M/3/Ef3lah4X/d1BGz7lgwAE8Un9Ukhg3DoPKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMNxtq/z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMNxtq/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751970571; x=1783506571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jD9TNGug0EdNyZatzmq21JWKZNYtlkk7d9ppExPGOoE=;
  b=UMNxtq/zu91pDWMjcO0K8VtwYmeSOEziKoLYc1Hyaw6bQoMg98tCN/Gu
   q0CVMc4KO9FUhqK0rfJLwJnCRPF44B4u76mMLIX0pJb3LxBhY9CviuqFp
   xSn8V47zH/u/Ue1qjkI2tPK2VFHQNjFHGweVwRVbiCgZ22ctUUpUbZTcw
   ZfFL9RgwOGqcS+KW8L2FsfVsn7FnvElvLYlszOoWEH7V2SKD/9yyEAg8D
   ApZyoa99siPAkq/4uTuSB7VmCqmyI3kvcjqF6T9w1IIUmCUEsDCn72GLW
   cGsUqUtHsscP/SU1SZYjgv7rlAS/ZP/feGvOu2N3Nwp1vBH4x1WNkCbEl
   Q==;
X-CSE-ConnectionGUID: mG046fBMTZmYOODMJ3od+Q==
X-CSE-MsgGUID: DkEqAlxyR5Wb4rZ+Ymmdkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54132905"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="54132905"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 03:29:30 -0700
X-CSE-ConnectionGUID: hlMTK/94QXG75dKy3v3ZRw==
X-CSE-MsgGUID: /Fd+vn9JSQSq6p9HSYzwIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="156048436"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2025 03:29:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ5Zm-0001Jo-0g;
	Tue, 08 Jul 2025 10:29:26 +0000
Date: Tue, 8 Jul 2025 18:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:k1/for-next 4/6]
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a000
 (spacemit,k1-pwm): 'resets' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202507081856.VtcAAu5D-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Guodong Xu <guodong@riscstar.com>
CC: Yixun Lan <dlan@gentoo.org>

tree:   https://github.com/spacemit-com/linux k1/for-next
head:   588c02e28a587ed8b15e1eda87e80ed1766e841d
commit: 9aebdfc21f755e0d2766683aa251435fb656ea47 [4/6] riscv: dts: spacemit: add PWM support for K1 SoC
:::::: branch date: 13 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-051-20250708 (https://download.01.org/0day-ci/archive/20250708/202507081856.VtcAAu5D-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507081856.VtcAAu5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507081856.VtcAAu5D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401a000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401a400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401a800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401a800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401ac00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401ac00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401ac00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401ac00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401ac00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401b000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401b400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401b800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401b800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401bc00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401bc00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401bc00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d401bc00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d401bc00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4020000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4020400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4020800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020c00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020c00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020c00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4020c00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4020c00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4021000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4021400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4021800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021c00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021c00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021c00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4021c00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4021c00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4022000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4022400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4022800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022c00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022c00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022c00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pwm@d4022c00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pwm@d4022c00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
--
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401a000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401a400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401a800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401a800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401ac00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401ac00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401ac00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401ac00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401ac00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401b000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401b400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401b800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401b800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401bc00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401bc00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401bc00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d401bc00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d401bc00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4020000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4020400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4020800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020c00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020c00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020c00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4020c00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4020c00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4021000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4021400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4021800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021c00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021c00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021c00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4021c00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4021c00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022000 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022000 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022000 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022000 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4022000: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022400 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022400 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022400 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022400 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4022400: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022800 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022800 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022800 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022800 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4022800: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022c00 (spacemit,k1-pwm): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022c00 (spacemit,k1-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022c00 (spacemit,k1-pwm): compatible:0: 'spacemit,k1-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pwm@d4022c00 (spacemit,k1-pwm): compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pwm@d4022c00: failed to match any schema with compatible: ['spacemit,k1-pwm', 'marvell,pxa910-pwm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
