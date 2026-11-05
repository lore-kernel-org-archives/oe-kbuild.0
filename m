Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842678;
	b=CS5RTvMg1wNg0G58d/PrU9X54mXfWXCKQnrzIr45dI9+24CyiC9qns8rS1VQ/R/6Tmnr
	 txR6JeaIIYhBqckwwOTAy/CYVVlT2K53wvulxji88rswfmojYblmOj5srIq/4hKXwf84N
	 gPWRBfR60Y1EmdnOtonT2QmCsbslrFu8nv4FhL0xyDN3msF4F8q+tggz++dnallL4BjFG
	 AfK9DopdYzumfDOV1z7lZjeTrKU4s93AXy/0//MxRu/LduZBjimoobEfX27tU8tIS469V
	 uLG44T5GKwtKN0QwqFP0/EwSBwGIFW1+Jngk4v45IXnExZ2B96iOvWEivpvSD8RWqgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842678;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hm4NeSe3wgu3KS+Vwz2n/QTjItoKSLX2+pEy1UdtMso=;
	b=QT4sROlvnL92af7Ek/b5AReE9K8W1VnLHn0ImWAwktsnbB1w/jkG3ko4BpUvOvP2Lna+
	 2EglFaQoenCUIRzCi5ILJ3nQVTwUdNeK422LAJeniZDNEvhD8Q0+XyRTuRnmSDfWY3Xdi
	 zphzAlC2SdFZzpi9xtOc5aHD/chCqHvNmeiIDQCRDZIf+iAeVBLuyzoHDA9VhYnv3/G66
	 n55NEQTyM5rQsPE6t4dd1oOY+r3wyS4W/XgpEiy+Mvcgg+7dTk5RiWvByhmAIYml5JVyW
	 ulIXTcLo8/UqeK56MJrjWT+LT61w1aAPsJ6w/f6I57wAKNXKqiH6QJGw6Dt0vvuLcVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ckrdVO1D;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990F9606A326
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 01:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ckrdVO1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793842675; x=1825378675;
  h=date:from:to:cc:subject:message-id;
  bh=Me8+o/chyaqjQY1V2rodEgGtPTEDphN9dJLiV5OUU8o=;
  b=ckrdVO1D75XtaWaZKji4tzWBYpgO74vodTE652Q1KxW6Jk2FHqmZCOPA
   fibaGyVQQyBx/I7+3fA53noWzkAdzI2htI7r6ImNqWBbFAOlZmYXMtBMj
   h3N3FpNcFap61kT86Psu/OxfUxBZUW3NykM85F0+UcpOd30YVdGD5YPfH
   zr5hPyf+aNxaLCQVHHcWD26MNAEWJ0yJAkle3Dc4uvsbM5PNlavHAsDW5
   3iQXdoQe2EJXKFvrVj0JKaZWefUBM8s5wZYQw94WhBBYEd4sXZ0OcYEY6
   0lDPIaTV13pKCqIOwFEH7jv6ZrMR0F3//pjbA/Ygi8uBRVCI+sZqPXolm
   A==;
X-CSE-ConnectionGUID: 7jrKJhZsTU+wYYKudBzGuQ==
X-CSE-MsgGUID: hh2tf0cVRE+u5dzz0S1WZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2502254"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2502254"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:37:55 -0800
X-CSE-ConnectionGUID: rUmkAud1Taqi4FPKbUttXA==
X-CSE-MsgGUID: QjC202tPTnyehSD/G++mCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6884565"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2026 17:37:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOmQJ-000000009Qj-2D5X;
	Thu, 05 Nov 2026 01:37:51 +0000
Date: Thu, 05 Nov 2026 02:37:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:work.procfs.cleanup 21/159]
 fs/proc/generic.c:910 proc_remove() warn: inconsistent returns 'global
 &proc_subdir_lock'.
Message-ID: <202611050222.pPFMimZ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs.cleanup
head:   f445e4492022fee8fcf28abe412e5011f62fa08a
commit: 6aa859e9c3a158fe1e6aad9d10239e5a3bf055b5 [21/159] proc: let proc_remove() remove the entry it was given
:::::: branch date: 9 hours ago
:::::: commit date: 17 hours ago
config: um-randconfig-2200-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050222.pPFMimZ5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611050222.pPFMimZ5-lkp@intel.com/

smatch warnings:
fs/proc/generic.c:910 proc_remove() warn: inconsistent returns 'global &proc_subdir_lock'.

vim +910 fs/proc/generic.c

a8ca16ea7b0abb0 David Howells     2013-04-12  891  
a8ca16ea7b0abb0 David Howells     2013-04-12  892  void proc_remove(struct proc_dir_entry *de)
a8ca16ea7b0abb0 David Howells     2013-04-12  893  {
6aa859e9c3a158f Christian Brauner 2026-11-02  894  	if (!de)
6aa859e9c3a158f Christian Brauner 2026-11-02  895  		return;
6aa859e9c3a158f Christian Brauner 2026-11-02  896  
6aa859e9c3a158f Christian Brauner 2026-11-02  897  	write_lock(&proc_subdir_lock);
6aa859e9c3a158f Christian Brauner 2026-11-02  898  	/* Removed already, maybe along with its parent. */
6aa859e9c3a158f Christian Brauner 2026-11-02  899  	if (RB_EMPTY_NODE(&de->subdir_node)) {
6aa859e9c3a158f Christian Brauner 2026-11-02  900  		write_unlock(&proc_subdir_lock);
6aa859e9c3a158f Christian Brauner 2026-11-02  901  		return;
6aa859e9c3a158f Christian Brauner 2026-11-02  902  	}
6aa859e9c3a158f Christian Brauner 2026-11-02  903  	if (unlikely(pde_is_permanent(de))) {
6aa859e9c3a158f Christian Brauner 2026-11-02  904  		write_unlock(&proc_subdir_lock);
6aa859e9c3a158f Christian Brauner 2026-11-02  905  		WARN(1, "removing permanent /proc entry '%s/%s'",
6aa859e9c3a158f Christian Brauner 2026-11-02  906  		     de->parent->name, de->name);
6aa859e9c3a158f Christian Brauner 2026-11-02  907  		return;
6aa859e9c3a158f Christian Brauner 2026-11-02  908  	}
6aa859e9c3a158f Christian Brauner 2026-11-02  909  	pde_erase(de, de->parent);
6aa859e9c3a158f Christian Brauner 2026-11-02 @910  	__remove_proc_subtree(de);
a8ca16ea7b0abb0 David Howells     2013-04-12  911  }
a8ca16ea7b0abb0 David Howells     2013-04-12  912  EXPORT_SYMBOL(proc_remove);
c30480b92cf497a David Howells     2013-04-12  913  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
