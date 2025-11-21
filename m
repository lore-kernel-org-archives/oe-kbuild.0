Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5497260B
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741898; cv=none; b=F+N9EdOB7rsWSQZ2IwlJtftZTaiHW4HibA2rnKskoqUljq4kq8qv7aIXOBwv2BMs5McAIYkAwun95u4a4UZelQJewlHd4hN8q4Rr8tUrtNSUSPpSVCcm1lo5d3Cb9aYDOoVh5Wp2LGFCdJtJRlqf3iiHGEupUsZP74rB7/tT83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741898; c=relaxed/simple;
	bh=IV5jMzDWbLsmMnCvc82fpgey3vNflaU1SR/6d4SZEoQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oITiuXAZJ46t2SC/VO4P0mf1n2m6uHpmzGinzf6z4DWB9JFMthG12eHfPg+sRcewa5JNNL1SPbihmuf6a3M1vnlurSZbvz61M8r/b4pRog4UAdvuZixUkmaCyZq5hyRFDvR9ZA9KFMe/AVM+5EQLKUpAV2XUkzvREWC85zZCxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTvR8jzn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTvR8jzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763741897; x=1795277897;
  h=date:from:to:subject:message-id:mime-version;
  bh=IV5jMzDWbLsmMnCvc82fpgey3vNflaU1SR/6d4SZEoQ=;
  b=jTvR8jznTk8wAsqcR6vqC+BLIl9w+yEvpR1LJ+XON9TOGgJRyPvlsld4
   px0RbeOlXsIIWmFPptQg8ttHK57oY0XYV3fMmUmLc5o6mR1fqIIuuUCuZ
   5g3XI3WsnN+z4ugosaNHSuFq34jjYtaTl9TlFy3jJBcNalX61KAC7kWFY
   MURrnr+RAgC3uoYqQwudnujr0LmBMIOnfM2adv7csfFWy/AODv3Gpssis
   fgXH8SSBegUM3sj+Icxel1ZCDCg7Ee8M4eBFNCmHlEQAQQ7WXvjz1lkxG
   98ogzehmYXB6G/ECBk/8Wiu6pDRlHTIvbrBc8jZYU+/lR5VFQlXCodp+4
   g==;
X-CSE-ConnectionGUID: O49PF1ZWRyeYz79Xsipflw==
X-CSE-MsgGUID: V0WeCq79RX2CccEnid0jkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88490012"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="88490012"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:18:17 -0800
X-CSE-ConnectionGUID: vPxfjbL2QoiXTlWMHrDTfw==
X-CSE-MsgGUID: eXvjIZRvQPiIYohtew7i8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196190788"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2025 08:18:16 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMTpt-000000001rr-32Ah
	for oe-kbuild@lists.linux.dev;
	Fri, 21 Nov 2025 16:18:13 +0000
Date: Fri, 21 Nov 2025 17:17:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tytso-ext4:dev 2/25] checkpatch: ERROR:POINTER_LOCATION: "foo *
 bar" should be "foo *bar"
Message-ID: <202511211705.8aJkL7HZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ranganath V N <vnranganath.20@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   103ce01cd045197461d654f62f1a30cabedbcad4
commit: 6640d552185f7c11235c64a832004db9af119b2d [2/25] fs: ext4: fix uninitialized symbols
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251121/202511211705.8aJkL7HZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211705.8aJkL7HZ-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#56: FILE: fs/ext4/namei.c:1821:
+	struct ext4_dir_entry_2 * de = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
