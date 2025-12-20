Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F5F204F93
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766230960; cv=none; b=kmMgSWeE+JiPkGQPYSXOIWy5hy6pG+jeZQqEimL6ew8UFxgU066QXAfaevYcIZI23T+jTH4BsR79Agcky8avYyQrx9ST57Qxl2guXBig2wscbCsFqrZgAgwmHbqZ1YgdIVBPa7uHP4hVsmTsaT0zsDnUVRGC5bfTmLmNMvim4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766230960; c=relaxed/simple;
	bh=vzXJKuTy1Bbm7BH/Gb196oiL7EqoU2we/kAtrDEHv+o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EjQVeDEnEO1ms8HiYOI2geMQUU/pTsdGbcHGA9/qICCHMM3CJ4xi8ds0vSRQAH8LZwTrFESdt2W3bK+z2xLoH5oEbTN8Xmwoec5AyWg+uDROssS6foXgRs0o+igtE9TxdL4/VScU+8Sf4Ju81fMOz1hZp075KWYemaaHYwBXh0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kV0UAEkq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kV0UAEkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766230957; x=1797766957;
  h=date:from:to:subject:message-id:mime-version;
  bh=vzXJKuTy1Bbm7BH/Gb196oiL7EqoU2we/kAtrDEHv+o=;
  b=kV0UAEkqy3dw/EdGF7iQUFHS8OwSV8iUKjom4Yf9SvHpZnPuhgH+KRXb
   j5fIirBCocR9MRDdU8UvbcexKqinq3qGYszrxXsNuVlCFH1IEXz1mTE2I
   XMM/61uxJEj+gRH6ogG9AWmewG2LbkYxUcYAqORuZRBjSH5zbA7yzhuwS
   wm1FdMhjaMCVFBrnuqPySsBZuhjWhsT8y+Dh372lfcEM21iYm4CwsRgxD
   3gWRmC2UTBQJlcqYQjySfRi5NnBlBWlXThXtF9gMW879MTbqFuQV7UKI/
   QBXQ93KBxv+hiaeEC4UkwKW6niLWYA2eTs3w49/hyvSVt4krLPPsvbvXY
   g==;
X-CSE-ConnectionGUID: HqrRl6vkTOKR5XAqfSWQpg==
X-CSE-MsgGUID: 3PNl+hEoT5mZcb35yVJdew==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="55745994"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="55745994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 03:42:37 -0800
X-CSE-ConnectionGUID: 6JmlwrPYRQOFd9nLmWHJAg==
X-CSE-MsgGUID: CqvzJfkoTYSz5Iz9ms5eqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="199328321"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 03:42:36 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWvM2-000000004YC-1I71
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 11:42:34 +0000
Date: Sat, 20 Dec 2025 12:41:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 76/76] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Shakeel Butt
 <shakeel.butt@linux.dev>Reported-by:
 syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com', should be: 'Shakeel
 Butt <shakeel.butt@linux.dev> (Reported-by: syzbot+09b7d050e48...
Message-ID: <202512201212.qCkkzltK-lkp@intel.com>
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
TO: Shakeel Butt <shakeel.butt@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   362ff9e04ee03cf2004045abcc524b0d6ff1a89a
commit: 362ff9e04ee03cf2004045abcc524b0d6ff1a89a [76/76] lib/buildid: use __kernel_read() for sleepable context
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201212.qCkkzltK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Shakeel Butt <shakeel.butt@linux.dev>Reported-by: syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com', should be: 'Shakeel Butt <shakeel.butt@linux.dev> (Reported-by: syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com)'
#26: 
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>Reported-by: syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
