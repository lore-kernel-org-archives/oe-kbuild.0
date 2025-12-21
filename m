Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E42F656E
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331307; cv=none; b=HQdobH9uo1GHiMFBj92nHd9D5X1cjAnxhQ0mjDlEBiPIGBxpo2NWkeNl9mUQa4i2r5hp6yPzg2aq7XhZqhVS6rDVzyPOcQHRM+fBDKu0B21opwiomPOPPF+KfNUDMY7KUcs+AbNfaCnz4MS2c445pU+sBm4cLo6xjQgZkIXErUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331307; c=relaxed/simple;
	bh=Gt2bhSrZj414nYLznprSRXJVEBx/IhKifjr8YJaG/+c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1NFx2kDrDHdy3dhW2nN+cZiJzHtNX2ozT6d9P/Qts63TdHSaICGXgbD117r1Ut/6lUbSbyKn8+Nf3v8ku0stwrRbgnIr8TpZ5HFksHjaAD7G6UC09dR5Q5ATAxNl7lvFJsywi8NDhgwmFZZ3m4qUwGQxtF33vSzg2fpaLNGqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLWXKFQz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLWXKFQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331306; x=1797867306;
  h=date:from:to:subject:message-id:mime-version;
  bh=Gt2bhSrZj414nYLznprSRXJVEBx/IhKifjr8YJaG/+c=;
  b=HLWXKFQzmbmknp6bHlBvqUPI6nl1l2kZHKkJwD6ssrl75YEwEUh9bDQg
   wwit4uQm8Mei60GgOpm/OQfP1yRz+nxO1sBGxbsoAKlB/uRW0RuWbiDLV
   dfqH8BDz8mXrJJlmnC9lKwdatr4MXruceXaYLRCkcB5okz9JRphryEdII
   ule3g0tSEmkYuSYm+Q6WbKWGQ7BixIR4qGh/gNsmknyrMnlBWL/Xs+QRx
   JSXoW929TdmQ3OG9iWVFXI3RnEifwqkbJO7cG0u/ci4savXJGGyDr8HHS
   EYUlRhh1VSQZl7FMcP/xmiUGehyi7hdga6WO5yU5KwSnRkAfnRzIw7WG3
   Q==;
X-CSE-ConnectionGUID: JoYMRdJ9Quq4lAkUTcrOlQ==
X-CSE-MsgGUID: I0VHD+O5TjObxnmsp6eWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93684781"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="93684781"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:35:03 -0800
X-CSE-ConnectionGUID: Jms8R4LqTce91Z8YYQk94A==
X-CSE-MsgGUID: bvhF+KKHRHih0sjdKVDnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203794213"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2025 07:35:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLSW-00000000583-44z1
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:35:00 +0000
Date: Sun, 21 Dec 2025 16:34:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 94/246] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202512211641.0TWktOTc-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: cdff22eff9f346645ddfd6a74c1b82a421a9d723 [94/246] drm/apple: Add support for the macOS 13.2 DCP firmware
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211641.0TWktOTc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#2524: FILE: drivers/gpu/drm/apple/iomfb_template.c:446:
+		return (struct DCP_FW_NAME(dcp_map_reg_resp)){ .ret = 1 };

ERROR:SPACING: space required before the open brace '{'
#2533: FILE: drivers/gpu/drm/apple/iomfb_template.c:455:
+		return (struct DCP_FW_NAME(dcp_map_reg_resp)){

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#2873: FILE: drivers/gpu/drm/apple/iomfb_template.c:795:
+	kref_put(&cookie->refcount, release_wait_cookie);;

ERROR:SPACING: space required before the open brace '{'
#3267: FILE: drivers/gpu/drm/apple/iomfb_template.c:1189:
+		req->surf[l] = (struct DCP_FW_NAME(dcp_surface)){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
