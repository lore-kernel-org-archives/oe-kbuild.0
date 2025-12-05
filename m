Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADBD3358CE
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941277; cv=none; b=Ni8UoS9UjpoDV8ws0UaKKfiUQvE9k+Q/TnOT+3DeAhNMITsCYsVW4QtCH6wDAHoVCJhlQrZuasp2NZ8Obn7oKgopub8FRO7eBV1aT8PXYgTAt+hhBIRdZ08PYkblbebHkrmp00OX4gCKOZvmNQ1G+Qkl5BQzSJKvmeP61SopzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941277; c=relaxed/simple;
	bh=cEQtm9YCgVBLmV3G19hti/P81u1iD3dgLygYMMmdPy0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KdbliMs77+FKqKQzIqRQsrDTE2BONFcFMwpn7n7lajehBAhrhQgMsxeBiWSpE2h6r6U6L+Ela61H/v7OvENJQG29wQNlbD4hLgb+A/DL2rpkqECnQeA1uudfnkMwClgb+Nml6PmAiu8y/eW100W/3Grz7gh0wSUk3KZU6XU8pug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNQUOA1C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNQUOA1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764941275; x=1796477275;
  h=date:from:to:subject:message-id:mime-version;
  bh=cEQtm9YCgVBLmV3G19hti/P81u1iD3dgLygYMMmdPy0=;
  b=bNQUOA1CBYxjg2oJ/EQ2oi0i9kGfyH8Bmq18MmzyNqDaRIcQwtL39ZI9
   IffH6vtf/5VbWBbclKy4eCzRrQiuIC8I/K72RFdpJ2FaVyvxtPgdf+0oC
   IF8B5MPBYlfokb2rISk1eE+pTz1+RHHWiuSLmG4UYsIp5SyoB+yxxxzoG
   AuK7/qvWl7accrv+NSwBy3KUJ3Bb0D+XhW3k5dHIRDg1eShr4vZEGGuPC
   DF5ww9HTyumdepegCs3lONr8TkBGufaMenchHSKSqVQGV2ZhPWmPBuFVc
   H771lTzjk7flW5rPKpiByIbcS3HeJZBUPL/zZNOJlAjsQl/Ud9aKTs1Ej
   A==;
X-CSE-ConnectionGUID: O0fcwUMUSk6/E7tRniZTBg==
X-CSE-MsgGUID: hSXGbkZ+S++2MAQ1+J0z6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70593724"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="70593724"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:27:53 -0800
X-CSE-ConnectionGUID: 5aVkSr/qRIeLinmw5k3rYw==
X-CSE-MsgGUID: KY4MXuaETiW14Sv5lrnMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195323766"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2025 05:27:53 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRVqg-000000000wb-1R8z
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 13:27:50 +0000
Date: Fri, 5 Dec 2025 14:27:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 15/15] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202512051406.1jF2Two8-lkp@intel.com>
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
TO: Gabriel Somlo <gsomlo@gmail.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   296c02a312917e381bdb9ff6b3d0364b8074e529
commit: 296c02a312917e381bdb9ff6b3d0364b8074e529 [15/15] LiteX: LiteSATA block driver
:::::: branch date: 72 minutes ago
:::::: commit date: 72 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051406.1jF2Two8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#330: FILE: drivers/block/litesata.c:280:
+	for(i = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
