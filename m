Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530472877EA
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164772; cv=none; b=Xmlw4A4tpMhvANmwV1lYDwhstp9nC3UxXyp4QLY89+O8vtBZ2iYwhdFim0tMtyOol8Ll8BfTzcxp6S6MQtnT8Lm7z2pudDqaWewopx6jMYXj4ft5eaKTNbEfL7gekpqCJw0fqce5MqMVoQ5lELQtx2nWE+Ma0cmpSDgr8mY1ewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164772; c=relaxed/simple;
	bh=ynUbTC2DnxjIhjp9NOwl7/IXwJ7R4uvOJv69C31SLIU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2jP3W965IMSgIWeVwh/ktL2pUttXpVEogNdmhALi36xIrTqrK3hkMmAN0aH5mqXmWTwrPLoV72870HPs8HpdCwNrheI+NZ0T/Bk609L0xljCWWv87BO4ETuL++Nm5q5RHIDdLUxb7eHR6izAbpxwF/f6kvchJJ8mW7A99z5Vq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5726hCh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5726hCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766164770; x=1797700770;
  h=date:from:to:subject:message-id:mime-version;
  bh=ynUbTC2DnxjIhjp9NOwl7/IXwJ7R4uvOJv69C31SLIU=;
  b=B5726hCh3NhnnyvQtZQAg/ahVkZgNeBrzWVT2q5IrNVb5mddJH4hDCqn
   sMsen5cGYXWrKWkN1anLf2CxUfvJaWNbWE54tXBilNaWV8ad3YKPEyje+
   xAlbm7auFKRYd+WPRmgH0RwUFudbOnbFQI0r0RETY72DThNDW1vNr6XB7
   Gm9JuIWHje0ycPMrZNzxNEu7WGUX31AUNrMTo1DDmI/QRs8Igtbc5krZC
   anBYby4IUvuyC5iml4xZIEzW/Mj/HJ4XkTCHANljXHLMdtmdRK28GKprC
   iDB5osKLOjm6/GpDuSi5bf7xTV68IKhgbPpiNSGLkTlwfB+T/0Cdli8qr
   g==;
X-CSE-ConnectionGUID: Pp35f6qwTrqY1kHAsPtfnQ==
X-CSE-MsgGUID: nP+zuiOET7a3rLrLa3mSnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90787471"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="90787471"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 09:19:29 -0800
X-CSE-ConnectionGUID: YeNYq20xS9+DgKkhspCoYw==
X-CSE-MsgGUID: A/5BYnReSn2dlE3NYDQ60w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198059553"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 09:19:29 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWe8U-000000004Ns-3Wpx
	for oe-kbuild@lists.linux.dev;
	Fri, 19 Dec 2025 17:19:26 +0000
Date: Fri, 19 Dec 2025 18:18:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/4] xfs: rename xfs_linux.h to xfs_platform.h
Message-ID: <202512191801.CYuDRRG2-lkp@intel.com>
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
In-Reply-To: <20251219054202.1773441-2-hch@lst.de>
References: <20251219054202.1773441-2-hch@lst.de>
TO: Christoph Hellwig <hch@lst.de>
TO: Carlos Maiolino <cem@kernel.org>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/xfs-include-global-headers-first-in-xfs_platform-h/20251219-144249
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20251219054202.1773441-2-hch%40lst.de
patch subject: [PATCH 1/4] xfs: rename xfs_linux.h to xfs_platform.h
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251219/202512191801.CYuDRRG2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'including'
#6: 
Rename xfs_linux.h to prepare for including including it directly

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
