Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C085F194C78
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734199885; cv=none; b=CDLXY5V2QhNzfgcK9IsSuZP8A6QmGB9R1jWCUHWBIrmenLkKWiKLnQxmMIVUCUOj9BJ24FujvJYiVgcV7C1ZEZM5QQy8g0718pkc9Qmj4X9P6CTdzkrr9METh8Ykcse9k1N50d3gV5F7QO1J6teXUmURryvFeUSekTZ8mgb1MyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734199885; c=relaxed/simple;
	bh=tF+JuWEZKlOrgGzcNvYaIzYY0VmmSFo+IU+c5s5MDe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2GmVg6pViIMRwr7ytOFawzBfWh6m96Hysi5gmg+2JqoHHn3wtmaigs//ARx3D9NwsJwzPlbuyk6aGCtwQO60R/DQwj1bucR3mvN1WJaYXRCCcfbRiC8z9Q3ovAl67TqEWqe5UbFH7QLvprssMT9N5gw3O5ya8Bbh2BwbTlzCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkgQ253z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkgQ253z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734199884; x=1765735884;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tF+JuWEZKlOrgGzcNvYaIzYY0VmmSFo+IU+c5s5MDe8=;
  b=FkgQ253zJ6TSGbkddIgJNp4xiK62tpERTbNbGHwDkH47WNwfylH/mPOd
   XidD9SZGW01jjKzBjJbqVGca7tF/Q7ECdm9jOwKvztY3VeVXkxia76asV
   nDmTVcvUR89Ky99zdg5y1YkUoRL1HpzoM/LzmL/CLoB6z7ve6WUgW/9Fq
   cnAULXVV+2K62CfNIeT9c5pKp8VCl+wG2+kD5KFq1avEQxjCwRzoKx4PX
   AN8DReJLVOmUEp/k/dcGgwft3mPqh4oU/i93DkgIMAjkZouQaQXnWg7jL
   wv2rftsYOhe15RaLiGWnCcDbU/1ifVCek//+JI/ZALZM98o8QZdeP++Km
   g==;
X-CSE-ConnectionGUID: 3MmYsg2RRB+kObsQAidpuQ==
X-CSE-MsgGUID: CG29KuagSAaf44WqLBcgQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="57115462"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="57115462"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:11:23 -0800
X-CSE-ConnectionGUID: 7McrYqXBTSu5kcSeFBFOCQ==
X-CSE-MsgGUID: dhH4z1rjS9+9BQVEBQcgnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97613938"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Dec 2024 10:11:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMWbn-000D7z-2G;
	Sat, 14 Dec 2024 18:11:19 +0000
Date: Sun, 15 Dec 2024 02:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_guc_relay.c:598 relay_handle_failure() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202412150254.vl3tkK75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "José Roberto de Souza" <jose.souza@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: 2b35ae108c7f5486adbc9e70377110ab8c91f61b drm/xe: Fix compilation without CONFIG_KUNIT
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241215/202412150254.vl3tkK75-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150254.vl3tkK75-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_relay.c:598 relay_handle_failure() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +598 drivers/gpu/drm/xe/xe_guc_relay.c

811fe9f556fcb28 Michal Wajdeczko 2024-01-04  590  
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  591  static int relay_handle_failure(struct xe_guc_relay *relay, u32 origin,
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  592  				u32 rid, const u32 *msg, u32 len)
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  593  {
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  594  	int error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  595  	u32 hint __maybe_unused = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  596  
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  597  	relay_assert(relay, len);
811fe9f556fcb28 Michal Wajdeczko 2024-01-04 @598  	relay_debug(relay, "%u.%u error %#x (%pe) hint %u debug %*ph\n",
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  599  		    origin, rid, error, ERR_PTR(-error), hint, 4 * (len - 1), msg + 1);
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  600  
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  601  	return relay_handle_reply(relay, origin, rid, error ?: -EREMOTEIO, NULL, 0);
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  602  }
811fe9f556fcb28 Michal Wajdeczko 2024-01-04  603  

:::::: The code at line 598 was first introduced by commit
:::::: 811fe9f556fcb281ea2db1b0fff3bab20f0a4d42 drm/xe/guc: Introduce Relay Communication for SR-IOV

:::::: TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
:::::: CC: Michal Wajdeczko <michal.wajdeczko@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
