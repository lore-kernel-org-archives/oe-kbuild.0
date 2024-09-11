Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552686F2FD
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726056354; cv=none; b=uLcOH5V5lczmNBjfCvYBUL+8PWZw9IQxapGIAwduieQyNK9nPR25Uj+CHgZVySNkkhSMWPecZS3hhW7Y5PS/eivbS20cMIJ105Dmo+PDXfXJsm+HfU1n5rYZxW1Re86UWGq6fjOxsjy7ovb0ouMDL3sduCEIh63RyAzGRTUfilQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726056354; c=relaxed/simple;
	bh=l35aQvN/gGPeyv5WCHTLYH5B0USBS5kWEE3eqouj8sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2od29QUj8WbR1mUtR0pPSrOZi2rde88sYV9bdx9BiG4CFx5OjAmr+BldeXAZ7GkpqK9ASDVoBn0bkMFvLufBCiorufiWsziEX5BY9AsU6ZMLGEx+oMMUlsTLf5vd7vPhorrgqcrV0yQdmEdCHNJhQ9/T0vj96gc6vjZx1vJRxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkG/nq0/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkG/nq0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726056352; x=1757592352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l35aQvN/gGPeyv5WCHTLYH5B0USBS5kWEE3eqouj8sY=;
  b=JkG/nq0/Qv05Ow0iWmkElQnPN7Wz/5MFEtXiaRWesTtebONQFTEudq0J
   VjgXgGlhzAbkQGe2k3ubRhO2oojfpDeL/dHNNagc+M8OXhMhndOP8lKJx
   htY/AuBfJ9/WppC0YpbhQCktVXi7/f1kryqNnYEj8Iv+2wBLmh5lYpvDb
   BoMpBTG6ueEonAW1iGsYbS2lLrxY3QqrBrGfQwuRVGVQFzlHRnBnpjFce
   NrdbxUsVtdeyDq3uEGFSLhsL/eN2zsqSZeF5yKpsi6eG+ZSr/uO+WrYL2
   0/6cHgfS1aYMD2ptshe2OecPlgFrMf+FcNhoDIQLzMdOO2RkZ9gOIW8po
   Q==;
X-CSE-ConnectionGUID: mXmUC+3MTQ+6tvqU7tOMdg==
X-CSE-MsgGUID: jKXJua4EQWaOY3NJqPOcJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36204195"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="36204195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 05:05:51 -0700
X-CSE-ConnectionGUID: Ao+7iqmBQ1mU17Hd0eSMTA==
X-CSE-MsgGUID: T6/CeRDYTuCWTIf2/p/Ktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="98185689"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2024 05:05:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soM6V-0003Vm-2K;
	Wed, 11 Sep 2024 12:05:47 +0000
Date: Wed, 11 Sep 2024 20:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:fs-next 623/909] fs/bcachefs/rcu_pending.c:167:8-10:
 ERROR: reference preceded by free on line 167
Message-ID: <202409111938.kA7K68o3-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   812a5e57015292f971bbdf945d1dc688d25d1005
commit: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 [623/909] bcachefs: rcu_pending now works in userspace
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111938.kA7K68o3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409111938.kA7K68o3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by free on line 167

vim +167 fs/bcachefs/rcu_pending.c

8e973a4f3c7482 Kent Overstreet 2024-06-10  162  
d2ed0f206a9d8b Kent Overstreet 2024-08-23  163  #ifndef __KERNEL__
d2ed0f206a9d8b Kent Overstreet 2024-08-23  164  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b Kent Overstreet 2024-08-23  165  {
d2ed0f206a9d8b Kent Overstreet 2024-08-23  166  	while (nr--)
d2ed0f206a9d8b Kent Overstreet 2024-08-23 @167  		kfree(*p);
d2ed0f206a9d8b Kent Overstreet 2024-08-23  168  }
d2ed0f206a9d8b Kent Overstreet 2024-08-23  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
