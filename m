Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B382EBDC0
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 04:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771387521; cv=none; b=qfAU/Ja0KoLMKt+mybSpGlSCZAbTIe8rFrty6CD8gMiiwuCrLX0tU4W494vS3y5Wtu+eR6A1p7jyZK/2ox5CstRYeGRwx/9JBVZzXc09vFQ0NxzpOil5xB6dLva9FAuXsEMjnfI8Ifbe8yAJcCdCuGmeCAz4zTOS98HNyr8rZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771387521; c=relaxed/simple;
	bh=0qxaJFCA3MwGicKGvtg/hJ+Ej6OT0PrX4aOJmPFfzd8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6aY3ZeAE0uABEQet7vZOZQ28IK7wxAprNBBdgXhdjWvt4NLZ9iqxB9ozQgDHKGwYNRpADTcyEC0cvi8WwthnxaG2mNoKmwpw/p8K79oGczLzv88E97+0DYiB9by/sgLcsIImPKxFbHsXiuqTr8PtOT3vx47dlVa10cFyggDtbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSKd+qit; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSKd+qit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771387519; x=1802923519;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0qxaJFCA3MwGicKGvtg/hJ+Ej6OT0PrX4aOJmPFfzd8=;
  b=VSKd+qit5MtZgxiLwWwFXjZNXY7MHUghzszcZFUuHS8t6OTJ76qTO5f9
   GSQZ9wg64WkgFGsLo6OOXCZf3Sedw+8h2h2k0qsZeH9q1GbLsEBMuhJB1
   Hc41WZuPrjzxEJBURViGVxpPIzCI0nevKa/WAdB0wXVKfMOfCw2q8qAvE
   Oy7vXVvHG7Vxf3ufT4fArAOFvoSoqwr0XWT4189qjfdKQd/21TzfhCOpS
   8G3fpKyEx0acUFLXq+Zw/azZLEFtZhrI2qyF+vD7yAeaWjXVoFanrwqWh
   +Qc+zlk6Q5QLl5TMXYmCWu+Fuvpmlq7XrdD8326wXIm9LeUiyToFXKDCW
   A==;
X-CSE-ConnectionGUID: cpNW0upvTA6uESSF7FDy2w==
X-CSE-MsgGUID: 2kvHodHXRweYmwHVRYCWcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83910126"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83910126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:05:19 -0800
X-CSE-ConnectionGUID: n08kPH/yTpyrix66jLKCXQ==
X-CSE-MsgGUID: nYU1mMoISFuwYFchx2LO/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213325849"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2026 20:05:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsYoM-000000003Vn-05vR
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 04:05:14 +0000
Date: Wed, 18 Feb 2026 05:04:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/3] HID: apple: avoid memory leak in apple_report_fixup()
Message-ID: <202602180520.2aYGtcdP-lkp@intel.com>
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
In-Reply-To: <20260217160125.1097578-2-gnoack@google.com>
References: <20260217160125.1097578-2-gnoack@google.com>
TO: "Günther Noack" <gnoack@google.com>
TO: Jiri Kosina <jikos@kernel.org>

Hi Günther,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/G-nther-Noack/HID-apple-avoid-memory-leak-in-apple_report_fixup/20260218-000629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260217160125.1097578-2-gnoack%40google.com
patch subject: [PATCH 1/3] HID: apple: avoid memory leak in apple_report_fixup()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602180520.2aYGtcdP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Gemini-CLI:Google Gemini 3'
#15: 
Assisted-by: Gemini-CLI:Google Gemini 3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
