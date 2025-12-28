Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBC7DA66
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766885809; cv=none; b=T7iVDvmN4XClYaTqUc7m6n/66qw+P7QbZc3dT9QYmAPZ4q/29Hyw7WUlHKLyFA6uiEE7S3SXp2F5J6C+k2MouuqqTAiKUlCMPz/jyhyaopdVGn2T46qfd+WgzPB11gOqtksjwVZefMXhtjd8w8xT2pNegBJNwVLggSrOayYvZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766885809; c=relaxed/simple;
	bh=ZmI9r83XGimmgmJw1913fzWTgpegsbx/e29uKBzFUvI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsZmMiDOur2YzSbN07mfjnX35rcVgGH6wUQPVn5i2meVJSpglWY6j5/LFb6hVO7iZFqu/ApnL4MniU/kATC7cO3KZ9XpBXamnrs0SqzkG8k7d+n8XJZYIqScwHfxUcbkumQ0m3RLSUhkhsWU7o02BcHTsexsq+VrTn0oMVybJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUadGsDm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUadGsDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766885808; x=1798421808;
  h=date:from:to:subject:message-id:mime-version;
  bh=ZmI9r83XGimmgmJw1913fzWTgpegsbx/e29uKBzFUvI=;
  b=mUadGsDmJvXir1SMgAJ2A92Yd+PH8/iSXWLl3ONh8PVZ5GVO+q36DDAm
   2C71pkwDltg3Qyd6Ez9pehjSey5ykVbmY/d03ervVxX31ELQahf9cahJh
   XyDu546RE6kxJmUW9xyfsBiBLiEfu09yefmNvPYc/bFF4H6Xmg7/CqBT0
   kGv7JvptL/kQUwAbbKdddKkbuLfKift6N/PXwHR8bItT5mIjh8mJOtzTC
   sistw8DGo7DXuLgXA3XXn9fuxUytRYYucabGi31rAGqFI1lPeHFy/82Oq
   iIi254dQHMHCQqdzAns8pjKwKRNuwmR0cL8Ks0ZDTWEnchvKrq7k7aFta
   w==;
X-CSE-ConnectionGUID: Y2CD9O2qTAaCNcbImp1jgg==
X-CSE-MsgGUID: xts2aqLUQKGZdr/eT4l3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="85980482"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="85980482"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 17:36:47 -0800
X-CSE-ConnectionGUID: cej+ngYwTPGMo9XEFUEeuA==
X-CSE-MsgGUID: Jp4UaqWaS92BYhNGILTYRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="205114954"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2025 17:36:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZfi8-000000007Lw-0AiT
	for oe-kbuild@lists.linux.dev;
	Sun, 28 Dec 2025 01:36:44 +0000
Date: Sun, 28 Dec 2025 02:35:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1 7/7] NFSD: Enable filehandle encryption
Message-ID: <202512280216.vaVV4Mgx-lkp@intel.com>
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
In-Reply-To: <9c444871bf7bbce9d5ba3ac628d3f0d0a359b21b.1766848778.git.bcodding@hammerspace.com>
References: <9c444871bf7bbce9d5ba3ac628d3f0d0a359b21b.1766848778.git.bcodding@hammerspace.com>
TO: Benjamin Coddington <bcodding@hammerspace.com>
TO: Chuck Lever <chuck.lever@oracle.com>
TO: Jeff Layton <jlayton@kernel.org>
TO: NeilBrown <neil@brown.name>
TO: Trond Myklebust <trondmy@kernel.org>
TO: Anna Schumaker <anna@kernel.org>
TO: Benjamin Coddington <bcodding@hammerspace.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/nfsd-Convert-export-flags-to-use-BIT-macro/20251228-010753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/9c444871bf7bbce9d5ba3ac628d3f0d0a359b21b.1766848778.git.bcodding%40hammerspace.com
patch subject: [PATCH v1 7/7] NFSD: Enable filehandle encryption
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251228/202512280216.vaVV4Mgx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#118: FILE: fs/nfsd/nfsfh.c:342:
+		trace_nfsd_set_fh_dentry_badhandle(rqstp, fhp, ret);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
