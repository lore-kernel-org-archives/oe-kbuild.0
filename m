Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C314295
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jun 2024 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717977527; cv=none; b=Y79YGLrxGzgEflzZhHbyANIVoFYBHQ69nc2Nral6ttEVXXr5Mb/nrJYtOBpH4p3fHkOSBNIX76pLUqPcGeYAQFzVG+V+xyy7jKGku4Vb8cIzs5vDXtsMAtqEtZTudmXZMu+dK1rYPVSzeOIZRnwtRrKdmb1fvUtIcnUIVXXSmro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717977527; c=relaxed/simple;
	bh=AbvfVMrhYgBbmYIbuHtPdrJME3mjBBDHwR+jTFAGg8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJKVNbjrGvsxJ0RA0GrLatUqMMAXbcikGlkl9+IqSDUTP89YiChgHiokKALaDV5B2r7YkTu7iH/eEldNdZdvKrYzZHnS3UoXQxE9QmMG50MS+xFOcMNBWLwFp2X2nRKJJDdAP80VvQqA/997Cdt+sbYhiLIoLqCbYtUSlpvLtR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjmA1VVK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjmA1VVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717977525; x=1749513525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AbvfVMrhYgBbmYIbuHtPdrJME3mjBBDHwR+jTFAGg8I=;
  b=NjmA1VVKJdsKnpgvc/3/das1UWRTEFygziBGnVwWmzywSKwLTEth8Ebm
   Sxs3KZ/c0YcKqWTh5MC8sp0gMPfxU00SO89jkrjxcW4TnvamD3R7vmcyZ
   ojnu8XN0afCWxohwnO/KMTYMiLC5wlAuGD0N1dIMm1FH+jGRA8bgNIIiS
   gCmjWPNkHotrcPp+ZZnw1AogaedyJjuqEEq5Ztendkq+0dXnO/mprsGD7
   LVcmQ7jhmq7UR6emNL2bhWmOrZTh5OIXWvZqpODE60zOFHGobuOUBMC9K
   GRyYAsNPQkZsE+1JEHkTMnFeVJvCer/wbwXT8ZklsZRqXfQLwsdz8Ge2b
   w==;
X-CSE-ConnectionGUID: T8vxhUaiQmyBtrPgRGqi5Q==
X-CSE-MsgGUID: F0dZBwSTSM23QuVaJyzDIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26029964"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="26029964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:58:45 -0700
X-CSE-ConnectionGUID: 4UMaU6lBTVuU2TUhzbKsCA==
X-CSE-MsgGUID: sAHaQoD0QHmtdpvTBr8vpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="44016188"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2024 16:58:44 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGSQr-0001gg-1c;
	Sun, 09 Jun 2024 23:58:41 +0000
Date: Mon, 10 Jun 2024 07:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 20/95]
 drivers/net/ethernet/intel/ice/ice_parser.c:971 __ice_pg_nm_cam_match()
 error: memcmp() '&item->key.val' too small (9 vs 13)
Message-ID: <202406100753.38qaQzo9-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Junfeng Guo <junfeng.guo@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>
CC: Marcin Szycik <marcin.szycik@linux.intel.com>
CC: Qi Zhang <qi.z.zhang@intel.com>
CC: Ahmed Zaki <ahmed.zaki@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   2746dc17cbf54ef20cc09a7ec6862477a326fae1
commit: 678aebbf361736b67e2d83264fb1f2b49ecf6bc0 [20/95] ice: add parser internal helper functions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100753.38qaQzo9-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406100753.38qaQzo9-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_parser.c:971 __ice_pg_nm_cam_match() error: memcmp() '&item->key.val' too small (9 vs 13)

vim +971 drivers/net/ethernet/intel/ice/ice_parser.c

678aebbf361736 Junfeng Guo 2024-05-27  966  
678aebbf361736 Junfeng Guo 2024-05-27  967  static bool __ice_pg_nm_cam_match(struct ice_pg_nm_cam_item *item,
678aebbf361736 Junfeng Guo 2024-05-27  968  				  struct ice_pg_cam_key *key)
678aebbf361736 Junfeng Guo 2024-05-27  969  {
678aebbf361736 Junfeng Guo 2024-05-27  970  	return (item->key.valid &&
678aebbf361736 Junfeng Guo 2024-05-27 @971  		!memcmp(&item->key.val, &key->val, sizeof(key->val)));
678aebbf361736 Junfeng Guo 2024-05-27  972  }
678aebbf361736 Junfeng Guo 2024-05-27  973  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
