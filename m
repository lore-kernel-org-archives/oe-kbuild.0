Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9D17A31E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769252937; cv=none; b=fMGE5LrLokk8tnZoazHmEs1iPb1yNejQrKUdrX0/RiJvSGbW+JxGxKjAXVKFHBCmag17MTxs6TXzzXXqNEQCAUEwUPfFjmqNQC3lLIlL8TUEk2U2S2JVRlt/h3ALfGpLjH+GWKpH/8zE0W/W+ifxH1p5RG2mrrvbiSQjEZm+v90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769252937; c=relaxed/simple;
	bh=l9CDakLEKmYKdKrl+F3K/Ydz9sAN2MSTCbduYRuI4Xw=;
	h=Date:From:To:Subject:Message-ID; b=FKAxRb+676QGL4p0JUrTtqXgFhm5VxfpwOUhdV0sBJ6p6Z0qdHl3QMFRPg6+Ngmv5E9AjaMFW53CIHC7icYCQBQs540F6+auLam2KcGQLuCxs+gR7/ej4HvED+6jmB3Zhy8Vmo3Xui0C2oe6EbeFVP2Rp9KGkQDJd/vGB/d05rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJCCl+vQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJCCl+vQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769252935; x=1800788935;
  h=date:from:to:subject:message-id;
  bh=l9CDakLEKmYKdKrl+F3K/Ydz9sAN2MSTCbduYRuI4Xw=;
  b=NJCCl+vQXgMqIXkZfJzyfufvXyskqL3clYye1Kfn6VIqNz0noEi1e/pJ
   Mg3KacTMRkFsH98Ey8oNK7fKGthfPwQNFAKy8L6btti34+UBBZzVuZ7yv
   2cUBC8agi2fjkiBeKPwQ1cscaCyYoakCs62agVfTtBiLNicAL0Tx6CdYt
   afan4Ui+rxm7iPnRKVPPOC3NFnVDgpsQj/3lHySyPE4sPV14Dv3MkBsLj
   rYZ5WO/AZ6zDVoRI190gi71/L4ZO1igg6Z6k64hpHGGhUciA9NKKxjoWb
   Ob0kQydEx7zvxIeOFSQ7c4UcdGGAiE+QiU8rWyOQ8tmQnVyUB8JqKaNER
   Q==;
X-CSE-ConnectionGUID: JGKqxDHSQwWeqmbHh1QfuA==
X-CSE-MsgGUID: oZ/2W4W6S8CnoEEvOhcT+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81856704"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="81856704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:08:55 -0800
X-CSE-ConnectionGUID: oC0Ip/6+R8K57WCG4tIAgw==
X-CSE-MsgGUID: TYuv9WprTYSHYGdh3FdfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="206851497"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2026 03:08:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbVc-000000000wz-0Ttu
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 11:08:52 +0000
Date: Sat, 24 Jan 2026 12:08:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 20/27] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202601241230.lOLeyHcK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   1a9ae6af19a2a7cc9af7c824230c5c51e6270e35
commit: 55771701114d8fed9cf71fcc1b03c928aaa17f5c [20/27] dma-buf: Remove unused SGT stuff from the common structures
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601241230.lOLeyHcK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#178: FILE: include/linux/dma-buf-mapping.h:121:
+	 * Note that for non-dynamic exporters the driver must guarantee that
+	 * that the memory is available for use and cleared of any old data by

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
