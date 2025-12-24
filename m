Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D91FDA92
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 05:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766553351; cv=none; b=h6pk07McaVqQTnL0zXJhJgd/jN2o0FPtnxqcvnpEL+7y5/sieEc5sVZ+spTY2nbR7oBL3IF3l25roRp/FIL296C8GGEDr8OluA5RQL6de2AOn8u/7/+Xe6Ie1kRAN4I/iEaG51MrTf2z3Y943hOi4DebIOb7dy25O6NTVWPGxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766553351; c=relaxed/simple;
	bh=rahj/xBxzMsdo/vvegyzF4MXPWP7cVKhByswB0qQBXY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3k/OnVjb8mbCD3JZUuTioTPKU9sRetzmpUyrtJbAilbZnlp/tB1dwDXwu9U6hQeSKy0nFH6yzTar6iaBUuVOGolKKN9wZ/hgseSgW0F7yJwLYWShIxlhe2ynxFyby/bI0fK43RUjxndE/9bIVEfdNKOJXVjfXYjT1ijb3raLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTbjLWwS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTbjLWwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766553351; x=1798089351;
  h=date:from:to:subject:message-id:mime-version;
  bh=rahj/xBxzMsdo/vvegyzF4MXPWP7cVKhByswB0qQBXY=;
  b=GTbjLWwSGGAs6ZXcumcWc4fd8CrS8A3bcoaQjEYw18n7v1EOsaI6qLJ6
   pirCbBvYahaZbio6SgbXwM2Hz9kxekBxupCxrJw95mND1qy6iY8RK2kq0
   Eaw4ATmvf8eTEppwC4cu6nL8V0hxzOnwVTawhDXmIn5dqpoVEfdFI+Otk
   nCOrmwfE6YTcaxGVrV3QbjT5kLv/FCLd0gS/1XzwemX5mrqvWqjwcA1yP
   5X2L906lEH3r25H+tx5duoy/EC7M+Eyj3mtYhsy4ErllXQQgQ+I3k2/Zi
   IPsftf+27GzSdlT6/Nnmk9bsjBmvvjDzUgoxYjMtK34oe2CitPZIxpFba
   g==;
X-CSE-ConnectionGUID: lN3knp5RRxatMjV/hfFbPA==
X-CSE-MsgGUID: XI6F8adlQAeQqlWoKPtI1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79847286"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79847286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 21:15:50 -0800
X-CSE-ConnectionGUID: F4uNxlmtSSSonzAtoWTNPA==
X-CSE-MsgGUID: K3xw+OzOT9eEKXw6LCYUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204079961"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Dec 2025 21:15:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYHDu-0000000067I-3gGR
	for oe-kbuild@lists.linux.dev;
	Wed, 24 Dec 2025 05:15:46 +0000
Date: Wed, 24 Dec 2025 06:15:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 6/6] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512240638.yAcQpCSo-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   edaf1cb1ffed2b9a8d3b69eb87ade59734000112
commit: edaf1cb1ffed2b9a8d3b69eb87ade59734000112 [6/6] iomap: fix ifs/folio uptodate mismatch in FUSE
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240638.yAcQpCSo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#44: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
