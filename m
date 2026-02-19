Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836D1F4CB3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 18:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771526685; cv=none; b=rlj2EGtveI1qYmbzLRHPk0kPEOnthtaJ3OXe27+5Upql1wF0Pih6bnVYKwIwWLhp4iIqUHx3G3RbN2zoE54f0UKnHcb25O+VFG4umA9ScAWoTVNErvmDZ+sQmfRlTjzKq981XynaHKhNAsBH/T3xZNjeT1z+KCKCfzIpqQ1kbhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771526685; c=relaxed/simple;
	bh=FB65TVPHBRbwjS57PZkuW15k8Sfm3zCVBonrDLaDHnQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=sDd1lP98VLfGyCXMW4N6VsqgDrHct2xENXb1YG8PEnNN9ltEGe6eUaQ6swIifIMC+zrofDew3KR+DZq9K2V8C8AOIndDPBhir2WghRGJiMktQ7lH5+PuTZC9k8lF2sQeOKltq6OKFqeYhxBxA+dpX/m71vmPQEmKwBm/ER+qxL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBin1WQd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBin1WQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771526684; x=1803062684;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FB65TVPHBRbwjS57PZkuW15k8Sfm3zCVBonrDLaDHnQ=;
  b=nBin1WQdO0PeNQpofMZGc0jX26CNhgHH4iH4xfB0ps/wOG1KJTu7MwS4
   hILgkgNWEIibVKWXBjDOlotHnxUfBKKK3p6+Osd8wDZgCTdmdFeCqcajA
   38+ugXgApA7P4BVG2ottBCDTNJm9NHEXbli2K73rs5rdq7GUOcF/C7Kvv
   /Bltcpy6O2TlIReVctHSqDXJ8NSFhLDNHf7DMY5AOKhqK3LChoBC2p3VN
   iCByD8E9eTsgoogX+YCjOYeEEZhbKXcz5iPTfRMhTwM4nR5xSSVRNsjCJ
   32zBojiOJXxm/6uvrA96R7+m44k6mZK+22PsdvhvybtuLEU5ZnRr4YC/X
   w==;
X-CSE-ConnectionGUID: gpasoWKyQr2gc/DHORHI3Q==
X-CSE-MsgGUID: MJIzcfCFT6++KbtUFJtVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76236036"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="76236036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 10:44:43 -0800
X-CSE-ConnectionGUID: DSLYZ/o5RwSVHkTGSwp1ig==
X-CSE-MsgGUID: fUvCHd4gSXe9w9b27uli3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="237600753"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2026 10:44:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt90x-00000000421-3Z9R
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 18:44:39 +0000
Date: Thu, 19 Feb 2026 19:44:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [deller-fbdev:for-next 6/7] checkpatch: ERROR:OPEN_BRACE:
 open brace '{' following struct go on the same line
Message-ID: <202602191911.BroiaiEX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.=
git for-next
head:   0f967cb8ea04486953f85b249b42dda3de842053
commit: cd849d26d09dc661d835e5d2b59dfb34948cc776 [6/7] fbdev: au1100fb: Fol=
d au1100fb.h into its only user
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602191911.B=
roiaiEX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#51: FILE: drivers/video/fbdev/au1100fb.c:85:
+struct au1100fb_panel
+{

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#66: FILE: drivers/video/fbdev/au1100fb.c:100:
+struct au1100fb_regs
+{

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
