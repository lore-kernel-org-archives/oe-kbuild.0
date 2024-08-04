Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D595D63CB
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722745562; cv=none; b=EUw5nz8XxBIBf9SbjhZLgcm7uiL7bJ7OyT56E4nOyxTMGdJNdZ09xZnWKntxk6I1FztTguc5BgYqEUEptAa6bC8sJGw7hXmTrPWv2b79p9x1givbrY0AHSSXWzUWdMErfuQDeIM0PVrlmuU4zkFJScgd9+y3/oMKevftxv55/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722745562; c=relaxed/simple;
	bh=4GXusnhjNgm4+47nxUZjgm5GgbmE3RpPyIWbUlBoY70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeKMuSsBgYVK2EqTR0Skva0zdkI2+8DRNHI1jVg/wvPDiMCZnc/4d1ekRlcA9MaA0qrxbsD8MMFJ19tOCxcalwVigglHCniYTyCh1mqEfv/UDjD0qMi9QJGnAOvqLY6u5tWjMxvo1spYE9zhSb0LgFCflPZT+YoMTElEuzxBWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlxP2xIm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlxP2xIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722745560; x=1754281560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GXusnhjNgm4+47nxUZjgm5GgbmE3RpPyIWbUlBoY70=;
  b=IlxP2xIm8XAwxBbgonAYUSqkZV8y3VyqAZKaQn17FOm3Ble7/hU8Ri+y
   RdEnXh16nueVhODKM3MAtKQQawTBn7mYMhfpySnunLsnVBM8EuwVT0D3s
   gyjlQKbqkLtot/Q95dx5qyMHaZpwRUYCeD8sdZ5+bVfvW4b8AswssJ2aH
   Xp0G7F8kCgYntn1+bzrXLmySoXMLVpQuQcRojxg2AhnE1TFd5mfmziexr
   uAsH9CqKnHdKKkIE0q+2Pcqs1wXb8ILy6yESfzW3NYE59ixIqCoNwyL1q
   ySiAUKovY9QS5hl9feXNN37KzrbBDxQI/a6Vo7EtXQenJ/G9tlhKHdf5v
   w==;
X-CSE-ConnectionGUID: 1wWdPkrkSLmPKRDuNR1lhA==
X-CSE-MsgGUID: wtr1dtEpQ6ivNAn+ot1N8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31380775"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="31380775"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 21:25:47 -0700
X-CSE-ConnectionGUID: xmmgQ2JUQty+Ef2+XYX2EQ==
X-CSE-MsgGUID: fhqNrItlTY+TbKvFf4tY/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="60636158"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2024 21:25:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saSoL-0001BW-3B;
	Sun, 04 Aug 2024 04:25:38 +0000
Date: Sun, 4 Aug 2024 12:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/netfs/fscache_cookie.o: warning: objtool:
 fscache_hash_cookie+0x15c: unreachable instruction
Message-ID: <202408041248.yJkyxCQd-lkp@intel.com>
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
head:   17712b7ea0756799635ba159cc773082230ed028
commit: 5fb70e7275a61dd404f684370e1add7fe0ebe9c5 netfs, 9p: Implement helpers for new write code
date:   3 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r112-20240802 (https://download.01.org/0day-ci/archive/20240804/202408041248.yJkyxCQd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240804/202408041248.yJkyxCQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408041248.yJkyxCQd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/fscache_cookie.o: warning: objtool: fscache_hash_cookie+0x15c: unreachable instruction
   fs/netfs/fscache_cookie.o: warning: objtool: __fscache_relinquish_cookie+0x7c: unreachable instruction
--
>> fs/netfs/fscache_volume.o: warning: objtool: fscache_hash_volume+0x124: unreachable instruction


objdump-func vmlinux.o fscache_hash_cookie:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
