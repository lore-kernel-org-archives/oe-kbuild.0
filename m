Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A03EBF09
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296023; cv=none; b=UKDAqPNXhLVQesS9+EzST4DlzCZS+42FRCxbhqzNsqxuHl8YvyRTnwIAUbIFhSnaxT7J58qfBbTMYlvDvUilwCR4ZbkranQDUDXFBiJZTK78XtLseiptKabIGs3xPXHbchPjmyr4TALGQHytANMpwR5dtWnEkyj+5Q4gK7g1oXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296023; c=relaxed/simple;
	bh=ISEI+NJpoaaUcHkAHOnt+0h6YHoZIrRjRk9SeQ05WFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQLfpa7x3zihMBXYnrvJKzO/HGMmDa6lhvB0X1PFaLd6m2px4SsT09WL0uDl+2HD7llpfG86FQu31n10IpQip/fUv0E9ZsZSGHB9sShy0r7EWnSOMDE1lQeAyzbBHh8IczKhyPhf94vfceHYpk8QR2Jmxn3pR1Xm3TRJBVo/sHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiFn6WQ6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiFn6WQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769296022; x=1800832022;
  h=date:from:to:cc:subject:message-id;
  bh=ISEI+NJpoaaUcHkAHOnt+0h6YHoZIrRjRk9SeQ05WFs=;
  b=jiFn6WQ69W8aq/Wc0kwSouMLgY1tnsKZDP7uZqs2ZgS7B6KYjL6CJqj0
   UCTinZCTXNZxWNsXS6ZqGAHGljaGJZnMhOF7Uq3hJkL5cuUu36+ac/XA/
   akHJua4gGIwmodY3UejR68O9vlGs05wvqWy7JvVDK5l99/dPqzgXkekE6
   vCdXO4B76KB6+WO6QtxUAM874bP6ZwhL7SdeaMWdob7y1RbQwW4/eZw8p
   9HtOJhBQmR1Ynfvh1YqOi11G0AJhu+Ur24g6ix+pWvrI1oM2EX5FNO6k+
   8vw5Bz4DWYo6AmEAG5vj8R7/cIYsWhtKaINdXdzOHQ6LoDJuB4tTRKnwn
   w==;
X-CSE-ConnectionGUID: yvTkHnjkQTSyTCO6+zga8w==
X-CSE-MsgGUID: qUkeZPp5QYmZDz0GO3EcYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70410106"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70410106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 15:07:01 -0800
X-CSE-ConnectionGUID: zKkBdKaJQCePec6VJnyx7g==
X-CSE-MsgGUID: R4IW2D7eT5CK0XsBS2XJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207584463"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jan 2026 15:07:00 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjmiX-00000000155-3vKk;
	Sat, 24 Jan 2026 23:06:57 +0000
Date: Sun, 25 Jan 2026 00:05:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:zymqmp/dt 12/17]
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kr-g-revB.dtb: gpio@11
 (dlg,slg7xl45106): 'label' does not match any of the regexes:
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
Message-ID: <202601250040.Ug4zOywH-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git zymqmp/dt
head:   0e81960419ad186378b4cb55d7939d03c85262ab
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 [12/17] arm64: zynqmp: Add support for kd240 board
:::::: branch date: 5 months ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260125/202601250040.Ug4zOywH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250040.Ug4zOywH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250040.Ug4zOywH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kr-g-revB.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
