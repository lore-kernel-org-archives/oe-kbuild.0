Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B817995
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 03:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977847; cv=none; b=L2+138nayAZIauhU0UT5L1e9Oxj9OYj/fFcxZlvbP1wEhj1v9N2Rgr6AdZ2kJi84qqLJQ3udJ77iHU+CL51S1Ynty2K9Og0newKCd3KkgiqhNP+768AJvoyo4N9ozxQJgF50DGSZdWub9n04djmIJN91CtYokj+OuMarIc5eRto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977847; c=relaxed/simple;
	bh=rHcj1Kcq9By3ux2PDlMkBMhkOsjBt8zBjfEYBPmBhpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YX+eRjYZjjUxxlPFjLyoudkh58vN7m4SWCYqm8fS8hEaMqZPxh8fh6ChO1NY7dca/yINPixNOmjfOI4t35C5/UW8h4HzAFbIVLPp3R9prfWxFgMkS80eJn0QO9dugeqaGcBapQ4SSow7YynfbRohRGNsv4eSHkhXiZur2ckYK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2cATnNv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2cATnNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719977845; x=1751513845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rHcj1Kcq9By3ux2PDlMkBMhkOsjBt8zBjfEYBPmBhpc=;
  b=W2cATnNvP/tXhuzQlBuXEDLRB04B4uZgwITmZDHSmArEOYA+MptWlMpr
   oDgGYqS8C//d/YOA124y+wHgfocIizL2hrKitB4mrTQfWicNnInlRNaiW
   /XWczVWSOcN3yZP8kUNfO1LlAaj+nScv/SMf7b7DTRO4wTMyli1cbWjbd
   fdQUBFXXekx96j/a7s+SdVNZGijGB3hzQ3P1Bnd4r51BaONp/+8Ivh5Bq
   Z6oPeop/he3vQoAbLQtZkh8jtyW0d+c8LxiVpSDbvJC7b+Q2ruKVXsyng
   8SxENpYAPxcO5bCrKTiryfBOCRC8Ykyh1YPQw3AaZftVhSEwFUG/+pYtb
   g==;
X-CSE-ConnectionGUID: g2b612a8RqeJkpJS7KTrrA==
X-CSE-MsgGUID: yl68vJPLSRqE3AWUMAYtmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17321756"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17321756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 20:37:24 -0700
X-CSE-ConnectionGUID: IwPoW7WZRZ6BAKqrpcuPIA==
X-CSE-MsgGUID: 1AkQ2h/5Q0KsT4UhziROMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="77264229"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2024 20:37:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOqo5-000PDn-1M;
	Wed, 03 Jul 2024 03:37:21 +0000
Date: Wed, 3 Jul 2024 11:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [anna-maria-devel:timers/misc 5/8] kernel/time/timer_migration.c:539
 __walk_groups() warn: variable dereferenced before check 'group' (see line
 538)
Message-ID: <202407031108.pd47N271-lkp@intel.com>
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
TO: "Anna-Maria Behnsen" <anna-maria@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc
head:   a75487ea30d064b9ff2bb081ff82696ae9e97014
commit: 7566dd71b07f51730aec154322a3426784a17478 [5/8] timers/migration: Read childmask and parent pointer in a single place
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031108.pd47N271-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407031108.pd47N271-lkp@intel.com/

smatch warnings:
kernel/time/timer_migration.c:539 __walk_groups() warn: variable dereferenced before check 'group' (see line 538)

vim +/group +539 kernel/time/timer_migration.c

8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  524  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  525  static void __walk_groups(up_f up, struct tmigr_walk *data,
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  526  			  struct tmigr_cpu *tmc)
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  527  {
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  528  	struct tmigr_group *child = NULL, *group = tmc->tmgroup;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  529  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  530  	do {
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  531  		WARN_ON_ONCE(group->level >= tmigr_hierarchy_levels);
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  532  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  533  		if (up(group, child, data))
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  534  			break;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  535  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  536  		child = group;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  537  		group = group->parent;
7566dd71b07f517 Anna-Maria Behnsen 2024-06-25 @538  		data->childmask = group->childmask;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25 @539  	} while (group);
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  540  }
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  541  

:::::: The code at line 539 was first introduced by commit
:::::: 8d3c19ba160fa100a11985ef576b13c76376259d timers/migration: Use a single struct for hierarchy walk data

:::::: TO: Anna-Maria Behnsen <anna-maria@linutronix.de>
:::::: CC: Anna-Maria Behnsen <anna-maria@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
