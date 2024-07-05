Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1713ADA
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 05:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158533; cv=none; b=EfFaC2itZJdUhdvoyLnyWACGDwfQ6F6i1tir/lX0SnnB7cScsSUwDQjGuTZb950j7Bo/QHvUthl0sFw7/EJJT92wMWTC6v4Oc5LJ9OOsV8xtH7+JjSX5y/vK46hS/A63pzyhWixRdVnh0+v5b6s6pk4w6dum4DbqztH4B/awVKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158533; c=relaxed/simple;
	bh=vF29W36akATU9Ci3RjUIHQ6jdTpEc0PiYXpw3BxuAu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iybydwlppvb9BENShb/mqDWcs+zfSJgDdm986fRSkRCrSjc35aUM/XZNlExi3TiWFPPvUXYFUrT3y64IyCbKqhXVPa8JOWIXlY9y9gq7kqc09a8vhhPvx0VXtqKjrXwVTEv572OC6LT+AzuJH0svBR7S3fcBgbKf9cZgN0nMyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwTgduY9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwTgduY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720158531; x=1751694531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vF29W36akATU9Ci3RjUIHQ6jdTpEc0PiYXpw3BxuAu4=;
  b=dwTgduY9CE+goEJeYHFMC3YER0zmxpgTPK5vtiXjHAkaCn4l0dDtZ90L
   rQctMm8/Qc4IDN2//citkg7tWEZ3aiWO8oP/SB7doBbRLTEq8gBL9E9Pl
   8MQjxmq7LlMPhM0qwq29Z0wFi9yy+3WVb+FL5QO4Se7PYkmC18s8cpvF7
   NXMh5f1gjKX9g9wDcRV/aubQW+8dii2NzgjiuPaElYLR8dESf/+rRoe+X
   rhQW2SkEDFI5PEiKy3rry6u/+puDu6ZQqIXOm3TQKfPvphPwogaIUEfEk
   /B+b9g7Ftay4+fJ7EXvO/yo3Qw5/w4VX1Vpb8tuZ6Qg5ZsfXR3oZKVF3h
   A==;
X-CSE-ConnectionGUID: NjvhVZX9Rvub4Eyvhj+tRA==
X-CSE-MsgGUID: OR+C+PN8RKahSUEkBvS8IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28840594"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="28840594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 22:48:51 -0700
X-CSE-ConnectionGUID: tZzt5RnbQTaN0XT3biTo+A==
X-CSE-MsgGUID: hELKzaubT3SQ9WmD7pfntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46794326"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2024 22:48:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPboN-000Rzw-2L;
	Fri, 05 Jul 2024 05:48:47 +0000
Date: Fri, 5 Jul 2024 13:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 5/92]
 drivers/net/ethernet/intel/ice/ice_parser.c:971 __ice_pg_nm_cam_match()
 error: __builtin_memcmp() '&item->key.val' too small (9 vs 13)
Message-ID: <202407051306.vVRgJOS7-lkp@intel.com>
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
head:   d051d5283b530af3f9627c8e600aa581bc6c1958
commit: cfc9287ed8be21b5defa15342ef643e096f292b3 [5/92] ice: add parser internal helper functions
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051306.vVRgJOS7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407051306.vVRgJOS7-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_parser.c:971 __ice_pg_nm_cam_match() error: __builtin_memcmp() '&item->key.val' too small (9 vs 13)

vim +971 drivers/net/ethernet/intel/ice/ice_parser.c

cfc9287ed8be21 Junfeng Guo 2024-05-27  966  
cfc9287ed8be21 Junfeng Guo 2024-05-27  967  static bool __ice_pg_nm_cam_match(struct ice_pg_nm_cam_item *item,
cfc9287ed8be21 Junfeng Guo 2024-05-27  968  				  struct ice_pg_cam_key *key)
cfc9287ed8be21 Junfeng Guo 2024-05-27  969  {
cfc9287ed8be21 Junfeng Guo 2024-05-27  970  	return (item->key.valid &&
cfc9287ed8be21 Junfeng Guo 2024-05-27 @971  		!memcmp(&item->key.val, &key->val, sizeof(key->val)));
cfc9287ed8be21 Junfeng Guo 2024-05-27  972  }
cfc9287ed8be21 Junfeng Guo 2024-05-27  973  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
