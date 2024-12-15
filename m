Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF98F40
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 04:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734237003; cv=none; b=jBDOhnF3pJwoVs9KSTjO3NxokXsxEbfkEscx0Xm2qGWbvtMKyGmczVqPjqm6+LOVENxcWliD6rRHcRMjJHClZMBC2v/UyJh1szMkB1Djt2bu+wMYU6qQ5Jq90k7OK+SLsj/BspH3HP6Djwws/5RHnYD16MCe9ed8gSE/2k7utlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734237003; c=relaxed/simple;
	bh=gPSEEWL3wOpm8c37VbgHlxCinVYc2LyGHgMxOqO4mYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzlQB9jd5ut14V+MRbQk6FPwQcjD0bkuKyw+5xrlXh5ONh86PSy4jF/EJWsjSfJj3IIfhqg92uI6DGv6s2QBvITQTbdmv2BrZ9xEYpwrki2/A0lw5b4/LdDXtkuFj5LdCGSwU86osN6hG8WPem60VbcQFUF9t1hP7bKk/h5Q5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhexpCr8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhexpCr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734237002; x=1765773002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPSEEWL3wOpm8c37VbgHlxCinVYc2LyGHgMxOqO4mYA=;
  b=YhexpCr8E0K9iZ3cbZcww7qRIHHMeR2qHr36iZFDPrC3kRMl88kV/DUi
   W3rT9TKBRBRG9Yk1kkHChN4VZmYdcFlL/y5gJRXzGtuxO556OClmXTqRK
   p3ljW3sQ6IQDVf1/IcQ9wQPpN+/WIqYG2CwNVBS7mWDD+/c4i/r4dERDK
   BBgxHldPwTw8lv9loSjOmEkmIMab2CUNzIU/vM8f4iRM/tnHgpei+yLXl
   uYUl0JQBDXQ3MjuwCKVWX/tNCrSo8P+4EIYIcEC38MQH2UHB1JLvCn0X3
   9tbFl8kfbUQGDuRs7p0IXvx0o+VDiwwcRrhp0vgc1cLh6vRtpVd77KUWz
   Q==;
X-CSE-ConnectionGUID: q1LMyBhxT+CZ26YW87E1yg==
X-CSE-MsgGUID: DsqVoXL5S3yc6ojNBg7drw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="60039731"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="60039731"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 20:30:01 -0800
X-CSE-ConnectionGUID: SVRdbW4KTVSg8Bp4+l6akA==
X-CSE-MsgGUID: li6ArfGSRzmpXLIiungR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134233418"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2024 20:30:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMgGT-000DQw-1g;
	Sun, 15 Dec 2024 04:29:57 +0000
Date: Sun, 15 Dec 2024 12:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid
 reference to the index variable of the iterator on line 207
Message-ID: <202412151259.oCDDxELc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yang Wang <kevinyang.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
commit: f5e4cc8461c408dcb679bb1f7c3bd8a586406709 drm/amdgpu: implement RAS ACA driver framework
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-052-20241214 (https://download.01.org/0day-ci/archive/20241215/202412151259.oCDDxELc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412151259.oCDDxELc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid reference to the index variable of the iterator on line 207

vim +219 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c

f5e4cc8461c408d Yang Wang 2023-11-13  199  
f5e4cc8461c408d Yang Wang 2023-11-13  200  static struct aca_bank_error *find_bank_error(struct aca_error *aerr, struct aca_bank_info *info)
f5e4cc8461c408d Yang Wang 2023-11-13  201  {
f5e4cc8461c408d Yang Wang 2023-11-13  202  	struct aca_bank_error *bank_error = NULL;
f5e4cc8461c408d Yang Wang 2023-11-13  203  	struct aca_bank_info *tmp_info;
f5e4cc8461c408d Yang Wang 2023-11-13  204  	bool found = false;
f5e4cc8461c408d Yang Wang 2023-11-13  205  
f5e4cc8461c408d Yang Wang 2023-11-13  206  	mutex_lock(&aerr->lock);
f5e4cc8461c408d Yang Wang 2023-11-13 @207  	list_for_each_entry(bank_error, &aerr->list, node) {
f5e4cc8461c408d Yang Wang 2023-11-13  208  		tmp_info = &bank_error->info;
f5e4cc8461c408d Yang Wang 2023-11-13  209  		if (tmp_info->socket_id == info->socket_id &&
f5e4cc8461c408d Yang Wang 2023-11-13  210  		    tmp_info->die_id == info->die_id) {
f5e4cc8461c408d Yang Wang 2023-11-13  211  			found = true;
f5e4cc8461c408d Yang Wang 2023-11-13  212  			goto out_unlock;
f5e4cc8461c408d Yang Wang 2023-11-13  213  		}
f5e4cc8461c408d Yang Wang 2023-11-13  214  	}
f5e4cc8461c408d Yang Wang 2023-11-13  215  
f5e4cc8461c408d Yang Wang 2023-11-13  216  out_unlock:
f5e4cc8461c408d Yang Wang 2023-11-13  217  	mutex_unlock(&aerr->lock);
f5e4cc8461c408d Yang Wang 2023-11-13  218  
f5e4cc8461c408d Yang Wang 2023-11-13 @219  	return found ? bank_error : NULL;
f5e4cc8461c408d Yang Wang 2023-11-13  220  }
f5e4cc8461c408d Yang Wang 2023-11-13  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
