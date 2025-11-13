Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E7323416
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069240; cv=none; b=rDYFmjkT9uJ5RSWnRzyQ8rlLx+Jdep8p9pUlKb0GihZuR02OFV2dA3iXdgAt/jCDVmytxpZ8mNPYSaMkH0bg35lGyv6c5ttX4zsZDFcZHKhX0k/+tF6fxv+iDCkLzh8yTAmItbd1c8sIglQiECKX89ZI8lOkxX1+d22ODnHlkt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069240; c=relaxed/simple;
	bh=gWEPnWPBxrYf9PAzgiGBbFh4DZn7mrsiMUb0gmf4KRw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q/9QucqMILLMdseuiYJEB57QznGy9or1c6LelohTg2rolSjdvYTHuk6z2ZpP5xvnkFtFy7P+gMQ8w6glteuImS5fTDOcSgovVAUX1m5tSWY1yCeNEypfbd1XT0Ui2eNVcOTyaZ1mwt/v6kOT3VwD0c4ut/I77gP+cxMdpoNj7YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JG/SqeAp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JG/SqeAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069239; x=1794605239;
  h=date:from:to:subject:message-id:mime-version;
  bh=gWEPnWPBxrYf9PAzgiGBbFh4DZn7mrsiMUb0gmf4KRw=;
  b=JG/SqeApEcCXOdM2EAKsDZe9dUurxZlHBH5UhVwP0FUp7j1lwHM8dZJo
   FtmfRkaFxyxoZezwOyiRVGoOxokGqVP8+9Fy9D9vgVzw0XBJH7VJPPDrx
   26AiKm5aJ2s3W1+nJtbRTYQGtWW27OYveSu6NuNoaPGfzXZNQLREq63qS
   H1tS2iSR2jliysjShT/KF3hkR//NQjN9z0O05xy0xAbwlzTs2g1Mcfqo9
   FOoyayDkiQavFqkOOtLcES3blrwW+7qTjdpdLmCcYuSqvqNnqOmM47uUm
   tWvYlVq4eCKyf0CLQXQEPZypESrp0cozG7It6e7bmFnp39kSnieZgoHSl
   g==;
X-CSE-ConnectionGUID: r5bjGcX2T2SzEpxYy1SyHw==
X-CSE-MsgGUID: rHHn+JV/T3uxBM7R2egJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64871229"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64871229"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: On/TJJESTJWIoTEoraDYJg==
X-CSE-MsgGUID: N1qHiWIPQeKN0s3dEvrmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189450239"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqY-0000000019B-06ft
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:14 +0000
Date: Thu, 13 Nov 2025 22:26:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 365/867] checkpatch: ERROR:SPACING: space
 prohibited before that close parenthesis ')'
Message-ID: <202511131909.8drpPhZH-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: fb635f469c2e998160c94015c782aab948771a33 [365/867] bcahcefs: Improve discard_buckets tracepoints
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131909.8drpPhZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131909.8drpPhZH-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited before that close parenthesis ')'
#136: FILE: fs/bcachefs/trace.h:731:
+		__field(u64,		commit_in_flight	)

ERROR:SPACING: space prohibited before that close parenthesis ')'
#137: FILE: fs/bcachefs/trace.h:732:
+		__field(u64,		bad_data_type		)

ERROR:SPACING: space prohibited before that close parenthesis ')'
#138: FILE: fs/bcachefs/trace.h:733:
+		__field(u64,		already_discarding	)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
