Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C02C1A5
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 21:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723412960; cv=none; b=UxxTzYx3bWdoeFfloK+4m4lZ5zmII5M2PtA3B3D9E0k/BDzJtV/0RRDnmW/tjK53uUvPIRNmxZQu1iZsna0SsiWuEb9L198bpD7lcTsyY9zvEP0ZAP/T92LNI0pp2jrVsc/ZHU6Nt6q77AB7wetQmmjxa5aAnjZ1/9nxXSmlvK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723412960; c=relaxed/simple;
	bh=hpRzYYQF15cfnRCvRvHU9UhDcN+Zz5kqXhtddoJqyYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msI19yScpPb1o4Ex4vDa/3Rgxk/w+XJoOt8tFlEszbVLtqDaaWfyk24kOt15SddJy/gnNmrl1n5Gg6143Ca1fNxVxXMm8KxGIz0id8KvR0oos8KpoJ107vubthk9c/475pEjq1q4cVoCgRFrasIFBn9u8SZyQWpE7lbZTNdiKtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsuY/vZt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsuY/vZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723412958; x=1754948958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpRzYYQF15cfnRCvRvHU9UhDcN+Zz5kqXhtddoJqyYw=;
  b=CsuY/vZtNZhHmy0bFYqz+5Re0uE13JX7JNdSHJ1c8VDSoVPdWjNHKt+3
   uvm9bXp3tSFZL9nOQh+Vz3iUEk1kvopfVTkZWOxqgDGs34h9VuOkeLQIZ
   TaeyeC3wwE81/kjPkFeI0OK8UOh1EFwbsFyfQjHAQv+RCmJvNk47IF0ui
   2IL7vM8az5QLBmtwpBO51LCT4WiZEkIPCOGZsRTEfZbt0A17+TpCtC/JL
   hCnLwXqEEobgXIC/v8V4LjzRDVb6L+30VB1adMIl8VQknnNS0O1R+fskU
   pFYeEcvXHEO642wBQs0thm8vI2GYgKpUJyyFuHruF1WHU7ukCqKE+Q3t2
   A==;
X-CSE-ConnectionGUID: AghwUBcjTrC8FvpWLIty6w==
X-CSE-MsgGUID: Icm0HdDCSuSFfUKD4kUPsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21641452"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21641452"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 14:49:17 -0700
X-CSE-ConnectionGUID: 0ELyDZv4RsOj5Z0ikJZxOQ==
X-CSE-MsgGUID: o18LvkjkR6SoByK0HGye2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58038885"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2024 14:49:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGR7-000BAD-2w;
	Sun, 11 Aug 2024 21:49:13 +0000
Date: Mon, 12 Aug 2024 05:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3739/3984] fs/bcachefs/btree_update_interior.o:
 warning: objtool: btree_path_set_should_be_locked+0x58: unreachable
 instruction
Message-ID: <202408120501.XHkSDNid-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: e20fed5cd40cf22f4ff3132cba3b5f5332c9d407 [3739/3984] bcachefs: Btree path tracepoints
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r064-20240810 (https://download.01.org/0day-ci/archive/20240812/202408120501.XHkSDNid-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120501.XHkSDNid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408120501.XHkSDNid-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_insert_fits+0xd8: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_update_add_new_node+0xa0: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_node_lock_write.constprop.0+0x80: unreachable instruction
>> fs/bcachefs/btree_update_interior.o: warning: objtool: btree_path_set_should_be_locked+0x58: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: btree_node_unlock.isra.0+0x5c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_node_free+0x194: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_insert_fixup_btree_ptr+0x294: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_btree_node_update_key+0x180: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_btree_node_alloc+0x158: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_set_root+0x278: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: btree_update_nodes_written+0x494: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_btree_calc_format+0x178: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_free_never_used+0x80: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_increase_depth+0x11c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_split_node.isra.0+0x510: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: btree_split+0x11c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_insert_node+0x10c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_foreground_maybe_merge+0x154: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_update_key_get_iter+0x130: unreachable instruction


objdump-func vmlinux.o btree_path_set_should_be_locked:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
