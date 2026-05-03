Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE690317162
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777775596; cv=none; b=numqyuwGCl3tpmjYv9jeZMekRyWdhMZoOl5rUI0zmgTXXHdO8dUtHgOccDIgMZCVEZwt7XIqfsPhLp7WZliAfyCFrkrR+kPcyNRJAxmKIkPupmOs2sWMd2rp0S86OYfSCzwqRzl0mLrvggRNlcgLPIQo3lRp9SVc14mRo+VYs6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777775596; c=relaxed/simple;
	bh=/XeXhAEhr9pagVjMXMrAtVPYDt8pXjf3CzuCqgWnwhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJSsvvRj8WPQKTdICLWx9zjsO85zITE8FtS2ZZeHGbVX150lEVNWQiuJbMUYpdXVJDCNpKjovIe7rGvLUau1Z0SuCuq7gL6fGNVe9ibJzMN1fMk1lEkuNhhCq25c0bEooqYe3QGAxKmetpoV6aCFYn9sRBlLJDD10ljwKc+M6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioSxIBa4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioSxIBa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777775594; x=1809311594;
  h=date:from:to:cc:subject:message-id;
  bh=/XeXhAEhr9pagVjMXMrAtVPYDt8pXjf3CzuCqgWnwhA=;
  b=ioSxIBa4L/YD7x5aYRALbxkF8ExIBi/Rx0KybIaTBxZzGWqt/fJrh4Qe
   FL+YBZtJ3l1sJhp1u/RFM7Y3Hs7InwGLAQA0635sWf46x5UrxWtDOytPL
   hZi6H5yDQgRS75MkzRELKYavcsPejeIwNKohzB+/yhv8ptV5toXTXDa7Z
   OIdrWxX1YBPxXb8LMTypfHF8Jznk8/pZMVjWdWHIBwVEo2HJwwvyh/wZD
   eO/OKEJHSn9ceIvOczVX6w1EErU8T1OsoZHRIwahJMI1DzONsR0DmNWhU
   i32pK6XBUo1kU+IjsvwiFSuj01cFN66aynhMCJpFf60cSXaxBqk8AMKla
   A==;
X-CSE-ConnectionGUID: 8Yxq3W1tQOOX9MHbEsSUOg==
X-CSE-MsgGUID: oxcQmGpaQ1u89qdrEJQIMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78709825"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78709825"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 19:33:13 -0700
X-CSE-ConnectionGUID: nOoTUSN1TF6cLP5tz0gXoQ==
X-CSE-MsgGUID: uZ6nf8nPT02s00vQoxQMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258554784"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 19:33:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJMdq-000000005R7-0vm3;
	Sun, 03 May 2026 02:33:10 +0000
Date: Sun, 03 May 2026 04:32:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: tools/bpf/bpftool/bpftool: No such file
 or directory
Message-ID: <202605030403.FrjvXYyE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Blaise-Boscaccy/crypto-pkcs7-add-flag-for-validated-trust-on-a-signed-info-block/20260502-054022
head:   dd83740fb7ac14161725928d746e1715974802da
commit: a89290bb17ae209a158be7be88616bce4b03e431 selftests/hornet: Add a selftest for the Hornet LSM
date:   29 hours ago
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260503/202605030403.FrjvXYyE-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030403.FrjvXYyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030403.FrjvXYyE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: tools/bpf/bpftool/bpftool: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
