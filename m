Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92BE2580F3
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069058; cv=none; b=r9e1k/cuFhCCBGRSqJmfJ3bMFp3jkkPBBBPi7yv4lmb6a1AN4W3bNujlMgGnk7YyZ9MqKNStH4x5KbSbLq/Ohmy0AAdRtC9MdMxVm3kiCQeqZt+A9a5hqvgReLMZdT15hQuVIUuGUxRXb0MZMJ6swQchQjw4fehIcua/YG2DwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069058; c=relaxed/simple;
	bh=HIieQviU+qy2REuTw8Taf/qWH4UccElvRrQ0Yzejndc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oacjkTWARSzVF1bn+BcWpSbkfF0fD+0qL6f1llenrGmYjiR7hyP7ekCA26/O3KUts5emwsAOGehMF1sVFTGILh034m0TzFHfu0vwtOBkXjD6IcADKBFHo9CRG1yGPr+y9cbBXROS5t15T5tKgmc69kgAUWN9/tpt8fNQo0VbxSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m18xHriq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m18xHriq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069057; x=1794605057;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HIieQviU+qy2REuTw8Taf/qWH4UccElvRrQ0Yzejndc=;
  b=m18xHriqvHoGLIahDMVXPmwtee68/zgVu8+ez4bP3RsvmW9iaIHGQXQ7
   lwGqYNI7CnciBi08EPTxlH/PGGw7eBdiUZon5GAJwIZ1ZcMDQIqZeDaaY
   UGBoEC/XaEteJkPLJxXP679LLeN+jxf5TJBTlwlVU1hr2I5XJi3ymhxYK
   Zn65MhxBEcop/l5zyX0djMYpldw434mamQVC6PxO3FJw+XpYRElDYyo+s
   dNQy+aHal7jVmiJDnHcbD92dbJ/zMcrsZc+KxP7sAjmVddWT4f/I8/nuT
   LBvm5diPSi0vbAxPFK3j324Fc+uYSbG6spGF+cw+pcxdgIGcEL3fO23jL
   A==;
X-CSE-ConnectionGUID: +DwKofqhQnaEhvkbnazW5g==
X-CSE-MsgGUID: DBcFqnFhScu5mu2fxeWhFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65202006"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65202006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: fb3GTVeHT1aHhNqWzJXOLQ==
X-CSE-MsgGUID: VGfmYojtShem92QKMgRbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189435657"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJend-0000000017T-06At;
	Thu, 13 Nov 2025 21:24:13 +0000
Date: Thu, 13 Nov 2025 22:23:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.19 83/88]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/gpu@fd000000: failed
 to match any schema with compatible: ['renesas,r8a779a0-gpu',
 'img,img-ge7800', 'img,img-rogue']
Message-ID: <202511130311.joGfkVkm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: "Niklas Söderlund" <niklas.soderlund+renesas@ragnatech.se>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
head:   8c95f813d75b33564b6c9f9c22a6914cabf6ad0d
commit: 7d41b3085b0b23a3536e2d4c964898428e9b9833 [83/88] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251112 (https://download.01.org/0day-ci/archive/20251113/202511130311.joGfkVkm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev17+geee71adb5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130311.joGfkVkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511130311.joGfkVkm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
   	['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
   	'renesas,r8a779a0-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a779a0-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a779a0-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
