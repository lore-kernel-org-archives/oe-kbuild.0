Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720D1773A
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731821883; cv=none; b=LMrEHkzcRBOlhpSq4yegwjxujgNHfV2BSJZBdNYEd0qzqOYid9t4hW/pZXUdcvIaMCsSyKiw1i7LudRnaSnm64pWDc7AIVNEcBhNfiYa4Q4x2oqK/vkXGzEhCiq4XfRbs4flX3eF/LMrysKWVv01L7niHub46spETXdft1J61VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731821883; c=relaxed/simple;
	bh=omlQErDoB7dLKSOaf2rDXFOdC2KFbMJ23gXQxKcK1sE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dRWshtst391T1uGSSehBgV3CIWP9+cTui8EDKeOlPlUz+tm9FWpQhbcu+jxDvMrvS8tKyZhAR9SvGcaKN/rbRvZWPUJx0s7bmHjvuCU/WRpXelo407xMyfRk1ePU1zL2ejv3KjlaY/vUqR4hyNE7kqF0dLN2vFthAjePbC3OQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esNJ2gdT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esNJ2gdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731821881; x=1763357881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omlQErDoB7dLKSOaf2rDXFOdC2KFbMJ23gXQxKcK1sE=;
  b=esNJ2gdTXdMxIFSpK5uJyhZR7g5pLu2WUPyy61i+qwD5Imw3u8C5BJBA
   VXy5pfXl47DcQFr4+aFHMTBPP76Fc/AYJ3zoN5Qz0ZfvDL0VikPjnoRWO
   PdIuN5tAbZB07O5iVXwnHwXmyxtc0nmC84HYjff2i4jvEIdu56BOUA0iT
   hTPPJloO7Lr1ZBfiH/THaMmwwXQD8LpbqAdyRy7qI6S4xuotL6KeVR7Va
   qZQNFxoTMGi+1yJsE9+i7IY/6b+sBjGYRWYVRMEMAJY8LudUUMxoH3lvu
   /6xL9OHlhYuvrOEFNIm1XDGmzyrHK9CB+s4gFDMHK1iERNvwKO48imzdu
   g==;
X-CSE-ConnectionGUID: qgcK0matS/awAgp8RMtGOA==
X-CSE-MsgGUID: KfP7Az+YTyGqf0KhkBpsgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42424043"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="42424043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 21:38:00 -0800
X-CSE-ConnectionGUID: 4wc5XDpWRhu94Sb+W4WOEw==
X-CSE-MsgGUID: 2cO3bngnSZmb1adAnF8/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="93950832"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Nov 2024 21:37:59 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCXyu-0001ZV-0u;
	Sun, 17 Nov 2024 05:37:56 +0000
Date: Sun, 17 Nov 2024 13:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11280/11989] fs/smb/client/fs_context.c:1017
 smb3_reconfigure() warn: inconsistent returns '&ses->session_mutex'.
Message-ID: <202411171308.yWc07G0Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>
CC: Meetakshi Setiya <msetiya@microsoft.com>

Hi Shyam,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   744cf71b8bdfcdd77aaf58395e068b7457634b2c
commit: 7e654ab7da03193bb3aebc7645b336839434f180 [11280/11989] cifs: during remount, make sure passwords are in sync
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20241116 (https://download.01.org/0day-ci/archive/20241117/202411171308.yWc07G0Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411171308.yWc07G0Q-lkp@intel.com/

smatch warnings:
fs/smb/client/fs_context.c:1017 smb3_reconfigure() warn: inconsistent returns '&ses->session_mutex'.

vim +1017 fs/smb/client/fs_context.c

d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14  1016  
d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14 @1017  	return rc;
d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14  1018  }
d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14  1019  

:::::: The code at line 1017 was first introduced by commit
:::::: d6a78783407cdf9f8dcf677f7e5a26b1aa22bc0e cifs: add initial reconfigure support

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
