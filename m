Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76828278E53
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 23:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764200015; cv=none; b=fpz7ahlc6hwIayqyC2oEBPbt3ycvjsyesU/sknoQCBK6cEprCgsrmAEcdc4NKPGhO+iWkwHwj8P+Uzd8rL3hXuB4FOp4GxNgOA9N/bDe/WSEPnuMkaiqXAeeRIYmxVpfR5HCB4wACQBXSe1qG7KS6n4wpeK8Mky9mYpMc20FmUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764200015; c=relaxed/simple;
	bh=BH64X2OdFh32H+qhwvQSaXl25Qi3eJAhqnB/fV14O+s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbnHIByhqWctoFdsN39KkTwcdjNS25lS9wK9Asu/qRxt0NnsVihfTZKF9fnIPr978Zmi9WenqlP14pqaaDCq9lu3sEgxxzgos7p7k3OJc8XiKhP/nal920mvZhyDfgfANr1v9A1qxESk+rG2AtMaYLK3QJx3p+IoMBVO01n8Upk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCrIdmyj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCrIdmyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764200014; x=1795736014;
  h=date:from:to:subject:message-id:mime-version;
  bh=BH64X2OdFh32H+qhwvQSaXl25Qi3eJAhqnB/fV14O+s=;
  b=CCrIdmyj/ujk2fnC7rn+ARw2xvtIbsmO6xS1p1dHLBkE0N3Cn2hZxTtz
   v18J6AyAxUgha+igVeYScdhgdFrsg8HxJBzrxZuLWlqiTgj9qyDiq3Axg
   GWVo8FwyJ7/zCzJ7acH1nvX2kRBsmyEmkGBpLqTSKzd+xvFvN2QExF1Hh
   GsRRIOVzRlOyJ4DhOTu3cACKuBnDTHNvqZVLNP91zy4tKpd2Fma9N5VK3
   g3cN3BUiZ4l7O1fUS/KmsLlXTUg6ixe5fjDBv40cELV7uzfrZF01V2BZy
   VWGnKlKOds5mw4grL7KFM5SPz8PljuCt8/wclZGvvp3q5frZXJoWF+r9u
   Q==;
X-CSE-ConnectionGUID: f6wVHmSLQ4uwJnUrJHVcag==
X-CSE-MsgGUID: lFNjhvKWQEiE943E3qFgOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70112956"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="70112956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:33:32 -0800
X-CSE-ConnectionGUID: gDqR92EiRoCk5Tzljyu/NA==
X-CSE-MsgGUID: weTPqYE2QL26N5Glz2kF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193177143"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 15:33:31 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOP0r-000000001YJ-1AVr
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 23:33:29 +0000
Date: Thu, 27 Nov 2025 00:33:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1004/1004] checkpatch: ERROR:SPACING:
 space required after that ',' (ctx:VxV)
Message-ID: <202511270034.UJA9wuZc-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   4870a60a33869486b2c40d0212c7831662778138
commit: 4870a60a33869486b2c40d0212c7831662778138 [1004/1004] bcachefs: BCH_MEMBER_ROTATIONAL()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270034.UJA9wuZc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#195: FILE: fs/bcachefs/sb/members_format.h:102:
+LE64_BITMASK(BCH_MEMBER_RESIZE_ON_MOUNT,struct bch_member, flags, 31, 32)
                                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
