Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316428F527
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144520; cv=none; b=V9eVorN8wG+DlC9ffqV46aW5BJYhRCVfLexZFlA1TAv+SoYKvZBmjdqRl7S6nOGkaTF5wCbkbig4ylTPDICzHW7hMZxSCeg9j+W1Mg8ibsIf9rlmjh24Vi+C2efLeuWUM26fI6WiDziiBKHY8mIVpVfhM02tPHTgBmtt7IhVISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144520; c=relaxed/simple;
	bh=/e3bTasVhR4jKl4TfggkEF3XFmfqQy0kMrodsgyAnIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gp8Xvu1RpfVGfqezWS56uCsXtPRJvgVyjb3Ib2szKMqw4Yg0QlwajlhFHGJoOkBRFXrntwJGJm6vuJ3CLDlJ1CIqWmZl9Zog6db5lrnjLwpVp3+w3TQetRAkA4PyJ1skJX2QKxOhlz7jotxQZgZZtQlhh2F5QMjVYC6QkchQ0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvXQp0qg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvXQp0qg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747144519; x=1778680519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/e3bTasVhR4jKl4TfggkEF3XFmfqQy0kMrodsgyAnIE=;
  b=gvXQp0qgp+UjcztzAN9mq3Cmnyd2jAB7MRaKIbRcqJeGNEchx3kve0v6
   FedqZjrb9e0puU/RZRGOVtHxSNPKYMqN5Z2BqDoBGbCIakpb0gJ/jQ+a9
   a7EkjhV/MN/TtbAvM94I1GUjaIQX8jboOr1nRbsyyfkKk9UrzD11OQK6D
   nDgAJOSAOj+/mqzc2ltEM1Mb1SeCfJG5PafyAvVZoc00VTpoaSZL16IBK
   9PGFCR+QH3b7mJtAw30u6zdIRrxHtaPfOwdrwpYnmPCcbX3VeFkl4kXLx
   lXjaavhIbGKDStZZNbPfICfMSndo3IJpZLUct91GRYzvqk1OklLPv3kiq
   g==;
X-CSE-ConnectionGUID: ZO/RIFnlQOmcUZppFZKk0w==
X-CSE-MsgGUID: 1B4s3LhGRuuoeFwLbYXu9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59999336"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="59999336"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:55:18 -0700
X-CSE-ConnectionGUID: 6eSOpXNxS7GnAXcnXMwwUg==
X-CSE-MsgGUID: sljMMF04QJGb4T1Ia8OLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142835536"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2025 06:55:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEq6F-000G69-0A;
	Tue, 13 May 2025 13:55:15 +0000
Date: Tue, 13 May 2025 21:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/fs.o: warning: objtool: btrfs_exclop_balance+0xf4:
 unreachable instruction
Message-ID: <202505132138.PpMPodVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: 0b93369104ac5f65721793e038cafa4b3e58fdba btrfs: move the exclusive operation functions into fs.c
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505132138.PpMPodVb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505132138.PpMPodVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505132138.PpMPodVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/fs.o: warning: objtool: btrfs_exclop_balance+0xf4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
