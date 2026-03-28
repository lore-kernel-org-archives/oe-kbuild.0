Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3028258EDA
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774727291; cv=none; b=XpVicFIzO8HObcsauK4/1hMNurj5goSHZBM0Qnn70/QPwYp/NSld6Kic+KQ8zXnAZxfL84z0/4Uof5//KbEmTLNMg2Z4aQqVy8rZN7mhp41r446+MJa1Jwgpsw2ULT8HN1mb3mg+v5f2tGULEynsEYcFsiM9nEEJOdj183aR0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774727291; c=relaxed/simple;
	bh=j3DzKfkY4STEO1bIKCw205dojHWqO3GVw7d5EXbqisc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZ4iTExEn1YelWg4PR753WX+bX7Eo+KpH7MTx22VERp6GIyIVdDHeUKTkbh2GXKovPIP7wWwtD9KhT2Q8oG2K3La5D3i3cDl+Pw8j7xzm1gtdGNbLjM3/39l+TdzVxDvIAJO5SHKSq/94yUgSVVSrPEjp2fjbrJsO0zCr9OiBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljdJpjIU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljdJpjIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774727289; x=1806263289;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j3DzKfkY4STEO1bIKCw205dojHWqO3GVw7d5EXbqisc=;
  b=ljdJpjIU1E2glL4Xjzttnt5t7iUYfbq/SQrA50H3u0BbTqn2uzAfX1jg
   2UlLXv0+Z8BKkrzucWaJD6PChn7lfz8b0AIk9BuTEsWd34V4fCwzs8SvD
   ZwzHkr3JMDdjdk0fKbHTNKdMlz7JysvtStHkGsBOyZuJGBvU5IgS+kUQT
   AlZxHEw59WrJQRGeCg5n+5SZHDh1Uw04WTFfKFEcp8IKGOZFYWBgRREpB
   wnuNfI/BXo+RRDwGlt1/YD8LyUtlnKQTLZg3WBNAk1nzFS0R393e/jkuJ
   DnD/aXwyji8UcCslHJYWnK1fCl8zCddesjVMYdtsZ4O98U1dBmJCk0vSJ
   w==;
X-CSE-ConnectionGUID: IQzNiBAMSRebeZaFMXZQdw==
X-CSE-MsgGUID: 3p1xSE08TduLJQm/5UnYtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86461665"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86461665"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 12:48:06 -0700
X-CSE-ConnectionGUID: wJ0Q8W/BT6S6xTm5l1qt5g==
X-CSE-MsgGUID: WKKHuLQYQmiVYD8/epWgsg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2026 12:48:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Zdc-000000007il-1AJU
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 19:48:04 +0000
Date: Sat, 28 Mar 2026 20:47:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 05/20] drbd: add TCP transport implementation
Message-ID: <202603282031.CtopwsVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260327223820.2244227-6-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-6-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-6-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 05/20] drbd: add TCP transport implementation
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282031.CtopwsVW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#564: FILE: drivers/block/drbd/drbd_transport_tcp.c:491:
+	/* explicitly bind to the configured IP as source IP
+	*  for the outgoing connections.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
