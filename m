Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D707FF
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Apr 2024 04:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713155938; cv=none; b=IZuEcbbd1HqKGYwWvqanH7uQUEP1xtLoYeh+tIvTaK89yI9nGqdhDOS/Se/1aVICbJJWMGJ9tHuIICXrkzcL8mZwaQjLfVlPfvcDBJ/CsXRit3IMXNdFntb0zzhk9+RQ+8wE0uZgKG/ZTWDlMOtcbuLMTnbDUAWnZ7AaHt6odlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713155938; c=relaxed/simple;
	bh=mSZ1UgOEnZOGnuo0J2xrxc11rJs+O7Eb9q62XfDJmtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvhV2HDAVXQwFYvwnbG8ez5eJKKlKtWcBcmOIGdrVwp3KAaRCegOj1DOHQkTz1O+z+C/LiL0eyYzBwcZuqc7rXBXMLORjo1wlEJK/8hEr128gqj6KxG6XSOB8LS53OtVkGs96dkVNGwThlPZyCjPBHp+Ndn9UDOd5IuH7tb7f7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3Wkq+zW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3Wkq+zW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713155936; x=1744691936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSZ1UgOEnZOGnuo0J2xrxc11rJs+O7Eb9q62XfDJmtk=;
  b=P3Wkq+zWk2LXo2ntXp2xhWDPC4+OzwZf2jwc379jCyIGzQsZ5di3RXLN
   TfkTSyZuugjYTZi7OIq72geG3ZgMPeRPE/J4GD4k8aPczL/d5VAwfp35s
   +M7UWOnGVcoF+J1fEgvt2PyO9qqG8cqdTbtHTSnStXd5VR3Lb3umUmfWe
   yzrXo7wWQDZTR1Mg0hR049otC6WLBl9JbvrKFn6DCPjqghZtMONo5UTKI
   4n43kzWcg9PT9KV+uQSd8c9zJjSqvK0ngUQbNpFNBy4SAeq/fjnj8/dW7
   dwYvYgaOezbR7lIYY6wCxnGJ2UBiK9OSpZFXrt3hKuZl8hJ6C+lYmtwJ6
   A==;
X-CSE-ConnectionGUID: jEYsKLzGTAac9i2tWD9icg==
X-CSE-MsgGUID: a9kQ8Mk+Sg+fEg3jEJpW0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8697989"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8697989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 21:38:56 -0700
X-CSE-ConnectionGUID: TCHwfmfVR6qnlOGtQGJxpA==
X-CSE-MsgGUID: RK1+LIRORFqI+bKq6K3NHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="26596201"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2024 21:38:54 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwE7H-0003yW-2k;
	Mon, 15 Apr 2024 04:38:51 +0000
Date: Mon, 15 Apr 2024 12:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.9-r4-mt76 28/30]
 drivers/net/wireless/mediatek/Kconfig:16: can't open file
 "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
Message-ID: <202404151217.r4ybuTL5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-r4-mt76
head:   6db64c8bb7677e3efb47ec465d384a5d12104316
commit: 60b08ce2a46db43df611883b23db830b26fbedc2 [28/30] mt76: add mt76 submodule for r4 (bpi-source)
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151217.r4ybuTL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404151217.r4ybuTL5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: drivers/net/wireless/mediatek/mt76_r4/Makefile: No such file or directory
>> make[8]: *** No rule to make target 'drivers/net/wireless/mediatek/mt76_r4/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/wireless/mediatek/mt76_r4/Makefile'.
   make[7]: *** [scripts/Makefile.clean:61: drivers/net/wireless/mediatek/mt76_r4] Error 2
   make[7]: Target '__clean' not remade because of errors.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/wireless/mediatek] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: drivers/net/wireless] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:1924: _clean_.] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.
--
>> drivers/net/wireless/mediatek/Kconfig:16: can't open file "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:688: oldconfig] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/net/wireless/mediatek/Kconfig:16: can't open file "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:688: olddefconfig] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +16 drivers/net/wireless/mediatek/Kconfig

60b08ce2a46db4 Frank Wunderlich 2024-04-14 @16  source "drivers/net/wireless/mediatek/mt76_r4/Kconfig"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
