Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D928EB
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 01:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722302595; cv=none; b=TkyGUZyTh4W217BctWT1MPQEh126Saa+ZiNmUPSeVExh0lLrcLLCNbFGer9RDZQYmOpYFIDl59mI8y+551Zea3ixl8FafMEqw6DllqQaEnWlbmcmYI7AOWK/Pxq2BSODSv02TACjSbgIQ5H9TSypT2zS/8qwqN//gi0oT+QIFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722302595; c=relaxed/simple;
	bh=GabztT3Nps6G4Hdja95xZM0TC7sSv9ngCTnPIvi0VZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h4yCLwLR468VkyL7bMB8EYu2vM9yRuJ90lXMRWOdJiB/kzin9P6GSfRAjgo3VG8yoNIKSvkK8qCHlP0IyNaFPuoAjAB6Y8B7lz3Q0ZsD/dsNctKskXmW+1jkHVY//sOsPTF4U3zuNLCKjfqcFFgJ89ziLJiR+Y93lHgYD/Yn84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO/XHJT9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO/XHJT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722302594; x=1753838594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GabztT3Nps6G4Hdja95xZM0TC7sSv9ngCTnPIvi0VZU=;
  b=EO/XHJT9K7M9WMwbX/EGEtB5hLT6Gk2n8ILK0aQ+aKvWOm5gHR/yjOjX
   vDvvV0N9ivOHD+oScE4w+X7XiGFAFA3iVpAx+F5SI+RMK6+epWdl0i/72
   D2wklFbmiC47WY44YZznl1UGDRcJORJeBUc6RwvCdXGWJ77QADdUXBgA1
   TQ7SFNDkJInOdnssS1RieyMw13QyvBrfhNuAPHB3TKVYlh6+AtA0Lu5KQ
   zVqcFR+B2TJUbsyOc75QCvtvm+UZQ0bYjleESHe/iL8vQuawcXn6LnzoM
   mGynkcx+2lKrRKBWimKY9GeCziZnRw+qc3CtBtlM3PfSU0wesuKpUe/Ed
   A==;
X-CSE-ConnectionGUID: v4XI9i7VTiOOkULTAO3NNw==
X-CSE-MsgGUID: orXDDXZaSXeU0B+tDsZW8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19977201"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="19977201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 18:23:13 -0700
X-CSE-ConnectionGUID: 9mL1csajR4eIQz9+J5ZHBw==
X-CSE-MsgGUID: 7qHjGVsISZCczpbbzWZYgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="58771695"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jul 2024 18:23:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYba2-000sIE-28;
	Tue, 30 Jul 2024 01:23:10 +0000
Date: Tue, 30 Jul 2024 09:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/netfs/write_issue.o: warning: objtool:
 netfs_kill_dirty_pages+0x74: unreachable instruction
Message-ID: <202407300959.sk7NwIp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b5faec9f564ea627c66064a4a6a5904fe5a07dd
commit: 288ace2f57c9d06dd2e42bd80d03747d879a4068 netfs: New writeback implementation
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300959.sk7NwIp2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300959.sk7NwIp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407300959.sk7NwIp2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/write_collect.o: warning: objtool: folio_detach_private.isra.0+0x44: unreachable instruction
--
>> fs/netfs/write_issue.o: warning: objtool: netfs_kill_dirty_pages+0x74: unreachable instruction


objdump-func vmlinux.o netfs_kill_dirty_pages:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
