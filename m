Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472C31282C
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187651; cv=none; b=FWtAC/eyIIes1PEvCCUUACDm4fchkN8q1cUsfRm+qVud0hfyxB29SU/GoOVDU42uB7JYqxFqpZMLDBZ8lvmSVY7uStAUpTih91z+ShBXx/UrAQRj1S2pmOBa2kplgE8ef7JazCzdLJw+1E/BDhzeE2BO1zr+0qigschNH8vUUcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187651; c=relaxed/simple;
	bh=SPbjDsAfaOsISmHRXFhvnStGh1TMRvcU7Q8dkuyuC9g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVKRpenGaoylJjvbAbkaEf8iwMMCRgczGm21IE3MzVMRTmONDcAoZOUcne8Uik3fcjG6/2kJ0Bs4kfl/W7N1qHitlZcVqjDgm3NkIveFYt3ZBx25TiLcUeLef6tiDDVy2zxCMAl7py3I2VM32w/9NUKxn04TEjGtlmieDbFd6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6eO33jW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6eO33jW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187650; x=1795723650;
  h=date:from:to:subject:message-id:mime-version;
  bh=SPbjDsAfaOsISmHRXFhvnStGh1TMRvcU7Q8dkuyuC9g=;
  b=J6eO33jWURwz5f+61dnd1NVFkYANhWGk4ubnA+DHJA0o9ivNfvm5Dcum
   FHfJ9gDCHQIU48lr4nD8Cql3GBuTupsQ3JicbELTTsH9rJT2wyhigL+PO
   /KZCO8GqOdFpK4zBi0ay3PfrkFY+IISW8bniEe+K6t9vxtWxNvBELiXvb
   lzlB3yg5Dfrg5v9yvaGrJh9XqxLhWC9n2QfM1KyqHA0Mgs6FICbAjinyO
   LeUTrWOeWI4QnNS+xBFyICfJiRf/PwT+JcLlXEWGHuKU6mlfUP4gI55vk
   cSy5g8auU6CNZmaGRjA3lBhtf8HnmkbfoFumuD2m84j0LX2CvcBTuHjC8
   g==;
X-CSE-ConnectionGUID: D//8cpoCQyO2f+1WZdPDAg==
X-CSE-MsgGUID: pLvgerbhR2uKp4H9MQdUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65941599"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65941599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 12:07:30 -0800
X-CSE-ConnectionGUID: wPKgrJ1MTVW4VahBpzZ/xg==
X-CSE-MsgGUID: T8WRETzPTxa1C0JlhcTkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197528166"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 12:07:28 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLnS-000000001Tp-0CZg
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 20:07:26 +0000
Date: Wed, 26 Nov 2025 21:06:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 981/999] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxV)
Message-ID: <202511262104.SjA4otAv-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: f815b3dfd0016437bde9b36af2b04f35ce71c132 [981/999] bcachefs: kill bch2_read_(decrypt|decompress)_err()
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262104.SjA4otAv-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#108: FILE: fs/bcachefs/errcode.h:359:
+	x(BCH_ERR_data_read_retry_avoid,data_read_decompress_err)		\
 	                               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#109: FILE: fs/bcachefs/errcode.h:360:
+	x(BCH_ERR_data_read_retry_avoid,data_read_decrypt_err)			\
 	                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
