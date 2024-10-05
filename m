Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274C157E6B
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728149846; cv=none; b=INBFIqwUhBPHM8IOPE6rWivBodLMs/Pxm5Uj4jOqrnVfNfNhrkQGhlaZzzSui12t3yWGZ5ac8PTWi4nQVvzsXoFUyRCOMGOaf3R4tfP6iee351z8EAoiL9TAzaI/nUme/dqVI8LgloYeua7WwSrKbC1jgVDj3l+dgq0pJjLvIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728149846; c=relaxed/simple;
	bh=yhw2wXUbhGBNUUezn8n+98ZwpZywpYCsXRn7VdiZmvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhdxTF6i0me33HnGbTOhu62bUE9Vyf/yNFY/Z0ft1S1RlOG/34T3Xvn6tppSfpsMZ91DCXe9AuHP6RzfG5O+5pprecdvaSnaTFWiYkC8zTJTMOUw8AyLBnozGbS24XPLbDiXKcm9BKWdffj/C8YhEi6N7cpqqO+1OKbaGJpTkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMbU6Wk0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMbU6Wk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728149844; x=1759685844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhw2wXUbhGBNUUezn8n+98ZwpZywpYCsXRn7VdiZmvU=;
  b=aMbU6Wk02tBosHWrPo7dTgvjhQnI7UHu50Cgp1UX0qxTVQhgYD54hbil
   oHoLofIld+aBttKHQ/OWYbN5albU9GkWPpkk3NrDDH8fTd9K2z1kPW6sX
   5MN/dgU9GjojXSLKWkeEX5W9iMr/GxxW/xFK/1z1GDRcBKG/5NQzB4QOO
   S+v1K1vDpH2yF6UjCj3NJ4RYfgfhw3JgjNz8btTkTaXUC7ITB+KqhzewK
   S3PyMNrjavz8O8fyFupJuMeH5ZQTq5Ncv3i8r92A9OcFZcxYoKej6i+Xi
   isEIjuCBkT4tNOM429ZMVPsuWenDaOVuCKxMRXBto1IUJU3i8JZVMTSXA
   A==;
X-CSE-ConnectionGUID: ka5F4LtbRvmVZRsOr6d/SA==
X-CSE-MsgGUID: i6Kd8ZkkRmeUhwcQATKDhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="14970382"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="14970382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 10:37:23 -0700
X-CSE-ConnectionGUID: czs344xYSWSkFDDqGRt6xQ==
X-CSE-MsgGUID: IgofUJOaShO69R97roIA+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75000968"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Oct 2024 10:37:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx8iW-0003Di-07;
	Sat, 05 Oct 2024 17:37:20 +0000
Date: Sun, 6 Oct 2024 01:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/block/rbd.o: warning: objtool: rbd_img_handle_request+0xe0:
 unreachable instruction
Message-ID: <202410060153.ugFmLihV-lkp@intel.com>
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
TO: Ilya Dryomov <idryomov@gmail.com>
CC: Dongsheng Yang <dongsheng.yang@easystack.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27cc6fdf720183dce1dbd293483ec5a9cb6b595e
commit: 2237ceb71f89837ac47c5dce2aaa2c2b3a337a3c rbd: don't assume RBD_LOCK_STATE_LOCKED for exclusive mappings
date:   2 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 2 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241006/202410060153.ugFmLihV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060153.ugFmLihV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410060153.ugFmLihV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/rbd.o: warning: objtool: rbd_parse_param+0x2a0: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_quiesce_lock+0x6c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_osd_setup_data+0xac: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_object_map_update_finish+0x90: unreachable instruction
   drivers/block/rbd.o: warning: objtool: zero_bvecs+0x64: unreachable instruction
   drivers/block/rbd.o: warning: objtool: set_bvec_pos+0x54: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_img_obj_request_del+0x44: unreachable instruction
   drivers/block/rbd.o: warning: objtool: zero_bios+0x74: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_advance_read+0x8c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_image_name+0x70: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_spec_fill_snap_id+0x60: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_spec_fill_names+0x5c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_header_info+0x64: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_refresh+0xec: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_osd_setup_write_ops+0x170: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_copyup_read_parent+0x54: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_advance_copyup+0xe4: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_advance_write+0xc0: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_img_advance+0xb0: unreachable instruction
>> drivers/block/rbd.o: warning: objtool: rbd_img_handle_request+0xe0: unreachable instruction
   drivers/block/rbd.o: warning: objtool: wake_lock_waiters+0x98: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_acquire_lock+0x128: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_image_probe+0x234: unreachable instruction
   drivers/block/rbd.o: warning: objtool: do_rbd_add+0x4a8: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_slab_exit+0x2c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_init+0x78: unreachable instruction


objdump-func vmlinux.o rbd_img_handle_request:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
