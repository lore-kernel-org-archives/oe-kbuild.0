Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EADA2264DC
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454211; cv=none; b=p/vlshQv1xGfzAifZ52e6S4EWzVVNZ2L/t3vvAOiTa/JRdTu3UYQ1SSP5rAqzBYpywCwelaQGdrZ2udEKpgIOElpoxY8K5M2LjjipjeoOblwy1BNhWrdSFPuVkfy92goCybETHOy4DJSDn6fm+qebV+pmobn+yl6a4cfQ8GedeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454211; c=relaxed/simple;
	bh=z/+mWxw38FxCRFNCAzZ4DK2gFMWVzynTIld2zqKLRT4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSIS9LhBsWKTDaxkUUXqQFKYUCgN5Y9SpKHq5/Nni56jg+Q+Q3Jabf58rB3ZCPgC796tYsJgrO9/8Vn4rECJZTEjpqAXsZtyM5qykJILERYKHpErjpI1iSDUYEjJzhQt7IiWMNa4R2zy7oL7UEoNzSj2OosHx64dM6reYDi+aYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgHN8igv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgHN8igv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766454210; x=1797990210;
  h=date:from:to:subject:message-id:mime-version;
  bh=z/+mWxw38FxCRFNCAzZ4DK2gFMWVzynTIld2zqKLRT4=;
  b=lgHN8igvw7b/UVtyjUHjttGZDAe7WvWwOhjDkiIHisJBdBcZdV2CHUnA
   DoYQE+ATo6kUTZW2ZwqscwRqS4XcsHX9i4DT6yuki1kAyugVpcMjuug3I
   T3dEHNfUalottP7cVT5ZxxR1tR08M9aebprMP343Px7VEjcV46evH5GOu
   2/EsgYx37iODh7I0GeRobeVfgJZrIojZ8XKeXyZrVzjJnDQhTDuIBcsaW
   wcJn7IkMZnLAJSzADQSXmDH1p+CTGUJcWYRSrf2bsmyH6QmKP2ELgHWQA
   aVW9gIhuJvtGB1M9xg5epAUYzRvw7plo7HpvxAZxCReKxYbucrhhcmQfJ
   g==;
X-CSE-ConnectionGUID: T8oaGb9zTfSEGQnAHagBag==
X-CSE-MsgGUID: eDSwxS0ESky9TBy7rLD9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93779222"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="93779222"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:43:29 -0800
X-CSE-ConnectionGUID: 1idy1ypTRga8iSVZJWGmgw==
X-CSE-MsgGUID: Pu6LgSqLTQKZmzlXVxYxZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230672294"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2025 17:43:29 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXrQs-000000005hC-3Qpy
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 01:43:26 +0000
Date: Tue, 23 Dec 2025 02:42:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 19/20] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512230223.ApM3vmbq-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   16a586b4e966771bbc7240083c366ba674702b86
commit: e58fa3024a4071ae1e929401bc99dc3b2dde7cf6 [19/20] objtool: fix build failure due to missing libopcodes check
:::::: branch date: 2 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230223.ApM3vmbq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#34: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
