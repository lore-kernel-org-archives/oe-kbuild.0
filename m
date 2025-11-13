Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18947322A13
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069063; cv=none; b=KBcFKwJ7Vd2ht6kaekWYqc7YIIc+ruqPubL5XuwGo0XJliWAo0YPb++/HQG8bYfM6zx6045fLyHfUJsYXbtJFw5JpHd88R8nk0+EyX94ot16xkRAEz2zSTIn8qR0w+DcSnGVYXW57RBr3B0l4M7RmsyIQNZe1N8VUW05dxR59vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069063; c=relaxed/simple;
	bh=n9aZVk/p4VtSu+k+4wp+6Io5FPsd7hvYd1q/hapZFt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDGF1j9TQ3tacy1esMK3xsEagK8GgjRgWE8Dg/MUklgvfgnLCnNhTXtVqu7Io0+NAoGiwNeQ+pw6943E6+9oUsTVidu3lTwY8ivRg0GLGZmI1rl60BmItnrzNSEu7DAlo0aYGQ47YBqqDmAAqseb7eEI657ihNhYOThSAjnG/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/C529SP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/C529SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069061; x=1794605061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n9aZVk/p4VtSu+k+4wp+6Io5FPsd7hvYd1q/hapZFt0=;
  b=g/C529SPOG5eAO83+m74aEAJv5HBHyT+lhCSS1K49eqeRpwoW+FVfNnh
   Xy6MdaneE+a6Heofc1as+CqN/6nVi+/0hcl5lz7d/85oDkpRnLKxeq5ZN
   6vwPHNwNrNW1d3YTYeAYWU4xzvJZ7nR7Kbf43y496rtp0ZiJjOoFXurI3
   f4upqPyzaWMgLFIb4YICwsY4xSmZrVb0ygXJuBTp3UAPLGjdbN0sfSXc/
   VE/CnSufssivBPP1aEwZuXbo3HhSea6bClsi87E4WVxWlLXhfwmz+Tky7
   Hs4CzxCVdoHwaC+gwZej8/8vVdhPBJ3T8CAHOK+vnN3UIwwBGrB4ZbqlE
   w==;
X-CSE-ConnectionGUID: E+KYwb5VRGKyshKh8i6LKA==
X-CSE-MsgGUID: 7Wh37sgER+OsR3Y+KStQEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65202010"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65202010"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: wrFGu4+uRV6fWcGePRWAtA==
X-CSE-MsgGUID: jsyZdWrFSqGijNNtHIqlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189435661"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJenc-0000000017P-3za5;
	Thu, 13 Nov 2025 21:24:12 +0000
Date: Thu, 13 Nov 2025 22:23:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.19 81/88]
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: gpu@fd000000
 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202511122326.mp7NoK9X-lkp@intel.com>
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
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
head:   8c95f813d75b33564b6c9f9c22a6914cabf6ad0d
commit: 303a5185e024ee6282d93c13304ef88bea45e603 [81/88] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122326.mp7NoK9X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev17+geee71adb5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122326.mp7NoK9X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511122326.mp7NoK9X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77965-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a77965-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77965-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77965-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77965-gpu', 'img,img-ge7800', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
