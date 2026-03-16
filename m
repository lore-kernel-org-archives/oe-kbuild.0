Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67FE18EFD1
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 04:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773633703; cv=none; b=o+k0f2TkWXODYqg9HJfjAWlILKFDNC046RQblNgXg7jLrKHqw2J/iaU8jfdvPkFHo5cxKb7vQLsa1UJ857f4BtPYX2dUdX4rfO3ybIk0FrZDFrZ7rIE4v5LVCoGniDcDfLPOoHy3idxdQLKBqdMLAHnDKaNeL7tl6j7K+LZFKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773633703; c=relaxed/simple;
	bh=VwqlPCJnCBd9iRML2rVbI4udgv8odzpZeouF04/B6rg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uqq0EUnRx2+f9jgfihe9YalggeCc8SX2MwN+oK+1fDRhluolt8mULkyBP8cxlwUnZHQx0B+fSSbKeu0gjHxH2ToK7Cq3IWp3DSwks38swk/l6SE7G0FKQKRIHNn1cpz1j+1KsVnnSdsFurLlzBEUMoZLvGLXD1JR3sQdsvKnhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxIvvMHm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxIvvMHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773633701; x=1805169701;
  h=date:from:to:subject:message-id:mime-version;
  bh=VwqlPCJnCBd9iRML2rVbI4udgv8odzpZeouF04/B6rg=;
  b=bxIvvMHmQB6cmd++oHpftzqMLm5hVrLBemwAzE2Kndw9UB9HcrxWvwW+
   xVY4mGlhXVpBX1H7HIslXTngsPWAD4Yuq3ZuevpW1hlxxcZwlS4lbRWig
   /qOzAgPK+szhhQajnIe+LNzlMuMewkKNnH4hEfYq3T/iNW6vjk+NNuMpl
   tmOjkigI/s8p1gQpBmPiMgRmykaRuBioExLhqCVF+x92+2bYkAfwbCjj1
   EVG3ZK37k7Uo1pnlspKTzNcbwDBttfWVB4XLHlHELsmAUamll35L50j7m
   6xCWUL9o/k3rhPYvdI6V3LfvCEARtG6hUu25EUDO7Venc1ArYqRCxrFSm
   w==;
X-CSE-ConnectionGUID: T9IyXWqXRwi5iZ4c78Bjdg==
X-CSE-MsgGUID: HrI2jrZaQjmdpX+8CtBtcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78537612"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78537612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 21:01:41 -0700
X-CSE-ConnectionGUID: rJ+SadTHTUeiJ5bVIAnw9Q==
X-CSE-MsgGUID: JOLDHhaWT6eulzBtIpcmPA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2026 21:01:40 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1z98-0000000049h-2AmY
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Mar 2026 04:01:38 +0000
Date: Mon, 16 Mar 2026 05:01:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v6 1/2] hfsplus: refactor b-tree map page access and add
 node-type validation
Message-ID: <202603160520.MP4tNNFl-lkp@intel.com>
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
In-Reply-To: <20260315172005.2066677-2-shardul.b@mpiricsoftware.com>
References: <20260315172005.2066677-2-shardul.b@mpiricsoftware.com>
TO: Shardul Bankar <shardul.b@mpiricsoftware.com>
TO: slava@dubeyko.com
TO: glaubitz@physik.fu-berlin.de
TO: frank.li@vivo.com
TO: linux-fsdevel@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Shardul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shardul-Bankar/hfsplus-refactor-b-tree-map-page-access-and-add-node-type-validation/20260316-021009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260315172005.2066677-2-shardul.b%40mpiricsoftware.com
patch subject: [PATCH v6 1/2] hfsplus: refactor b-tree map page access and add node-type validation
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603160520.MP4tNNFl-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'free'
#264: FILE: fs/hfsplus/btree.c:585:
+		pr_crit("trying to free free bnode %u(%d)\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
