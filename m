Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DC270552
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764301613; cv=none; b=tnYsZsYQq2ZiwLrrLChbcuooAcRLD9i1WE1xMXKTuCszyjShBz64hhwY5DtlGqHjpEkQvkHKtz9CBSKIeadj/CqqGc5u3c68nGqd8jFTDAmIgTrS2a0GYONL+X9EeBbo5pzr2eu5upQSbBf/z9hJJn1yZzcdrCjrbSUfTqreyPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764301613; c=relaxed/simple;
	bh=Sqz7ynw0BLOB9reCuuoJu6mnMlz7a49zS+emCjwcSNE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VreG1QuL9EwMmWyynpies/xvT/9kn60kBQkC0knJ4w6ULjMicjMXAcUdNbzA8h5bGubaV7iVNuB0mQrpIDhQYiahWAHQ6rXnvejIa/sDziS5lkuwMYJQXfs2bC67RpfOJxusv+huOBVV0vjO0sEtZuFXehtWmMK8ej4xmu3WYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eergc7sI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eergc7sI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764301612; x=1795837612;
  h=date:from:to:subject:message-id:mime-version;
  bh=Sqz7ynw0BLOB9reCuuoJu6mnMlz7a49zS+emCjwcSNE=;
  b=eergc7sIVtT1eIEMNoGPXl/HwlSVcEOld9kK+pKHMx1rdpGL6jPGMcwf
   lJ4nbo5TNYG6R3hYhnrYJvPHoZtgqEDhqWxapsv1lvM1KaRxHQ+rWqMGV
   seqEjNPDFhkJ0DxdEl3CMs1dd+i2lphb6j86scp927qhrmHwsfInvTcO2
   /ACLiXUR7pr/WAIFrbgvick/wMxmEPNpvIfOrMRSrZuFHzamjUq5g9Snn
   UDvH1d7fx2vcHRxoDH8vQ4KtS86+00sV6OIUvdpV74T/ZQk37kqJQ4iZG
   sFKp5+aj50UAHSGQBkKO+6i4FS86VKn6YPEi57Ni0E7P+RZJu3WQS3UWd
   A==;
X-CSE-ConnectionGUID: L1xzABhmRhuDyMQ1x2bFVw==
X-CSE-MsgGUID: AKCF0zgvTBGkX56j/aoSHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77442466"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77442466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:46:52 -0800
X-CSE-ConnectionGUID: yBp05YhzS0KsEWXdv1A8PA==
X-CSE-MsgGUID: R7m2dbwPQdSoVz0yYsAIfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193587669"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2025 19:46:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpRY-000000001wJ-01j1
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 03:46:48 +0000
Date: Fri, 28 Nov 2025 04:46:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 14/15] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202511280425.TlquaJz0-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   8149f28aa60a619b57e2d4d50e4211a307ce7e3d
commit: e12ecc6f7320528418e243fb4b3f9a1e38e658ee [14/15] LiteX: driver for MMCM
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280425.TlquaJz0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1223: FILE: drivers/clk/clk-litex.c:925:
+				synthetic_phase = (d_t * global_period) +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
