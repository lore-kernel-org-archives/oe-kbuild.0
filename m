Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F60C145
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769862197; cv=none; b=gfS+/SOMofVy1YaP9dJeQfp7T/Za3a68MRAaydUaEFUkv8uigSuVqMMazXMrPXGEVINqZDCIVKTv7Io+PUR2/EGM1/9xu23qBqeYpOABWPcj2YdPHai5s8pncYwFZK8S8TihtuMa5Tyv4TbCGlbsVXLD9G5YUsRVKLNLSCZciMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769862197; c=relaxed/simple;
	bh=lh9Fs7ft9kcORAJ5DlIuvixc2Vd8hG/DWSU4Ir0XEcw=;
	h=Date:From:To:Subject:Message-ID; b=Xztk28ThvnuNMOAsbAu8UHkWGE9fe1wcFvp7clDOYQc+KP/r2tQUAmDVLi+UQPlsDFuSwzn4AuZxYLcWFFpy84noSHVny/TteAXF1aJ+medl2RJaUdJ8MMubL3CjA0fvlGOTosOglwznW+DW05NxfVu+MbOGpOYZUwN7nGBv5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He9LDEN/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He9LDEN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769862196; x=1801398196;
  h=date:from:to:subject:message-id;
  bh=lh9Fs7ft9kcORAJ5DlIuvixc2Vd8hG/DWSU4Ir0XEcw=;
  b=He9LDEN/Foyg/xyZhJbi0GDbWeUeTF7+YBdbv5zq0VHf0Ruim+hKqUH4
   4wJAe1bOpGluH5QrJYJ0Vr0MIBDxg+5bHdMhOXkF6TUJRUicjj+aZszvy
   zIk3uCC9TTYDzSIL4rM8nIkQ2ZeKv0YWqaGLKYF+gOZl/WxkC22yVjmXg
   sLzxCdD5B3IGMS0Xmh7LmD3gStwDyD5JauZ2ZEMtuuMc8XyXqgGUE8R8D
   nKt1GwP3hgANydibFWZj/sE+RRJjZ1Jdn1l2atr5DyNpvuUqEp3S8wOlk
   Ye49MQVOq+Rak/KH1/F0iSblNOclhL5tgjRQ0ODrflrX3uHLu5HyDyBeu
   Q==;
X-CSE-ConnectionGUID: OKH6FzISQ3qcMzxvA1YFNA==
X-CSE-MsgGUID: h5BnGt9GQ0OWjv6ZmH5IyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71006049"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71006049"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 04:23:16 -0800
X-CSE-ConnectionGUID: SPbrPHP1Q8Cc59Du5fDlaw==
X-CSE-MsgGUID: VHMfiTNrQeO15lYd/ysPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209168158"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Jan 2026 04:23:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmA0P-000000002hV-1Sbl
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 12:23:13 +0000
Date: Sat, 31 Jan 2026 13:22:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [viro-vfs:for-wsamuel2 14/40] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'in'
Message-ID: <202601311308.WoJYtxEW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-wsamuel2
head:   9a8dd89bd5c65c4189f2bf6291f0f9a3d0df31c5
commit: 1e508e05dd087b182143d9f55809e7feca662fb7 [14/40] convert mqueue
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601311308.WoJYtxEW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#7: 
persistent in in mqueue_create_attr() and discardable in mqueue_unlink()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
