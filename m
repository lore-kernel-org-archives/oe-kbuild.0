Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE02FBDFD
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136901; cv=none; b=Qs7b0K9HYEGfSDcP/8Rcc5q1fnpeHzXx83SgGJxXaIsqtiZl1WJLt/TcKPtc1Q3NuIygZbP8HLHfqDRyafJ59aj5cNbrhA6L1u3eFDZBO8E4En8PA1fcRTUslCcN0wJViwjf0KMOcu/CT8l+N17iLjqt1fOF7OSHGfvzWcFmc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136901; c=relaxed/simple;
	bh=lpAC+8NxrSJZoCDYRVWjX3IIqLsFYOBnVRY/OGCEypQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcYc3urbbyQflzvrGlPz4Jgf/yeNwm6l3bE6TZfXP7yj4k+itc4fzzUKXgu5B7ucwDlIv9iTOszICuscMXVoH13lhGFVGkna6vIQXlUrHKVpkEcIIGJ2eFNoGih3+hZHQmKITbpkEWjQqC9VEtzDuNRuiZm4yb7fgIft4dIzYO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdCCXXIl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdCCXXIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773136900; x=1804672900;
  h=date:from:to:subject:message-id:mime-version;
  bh=lpAC+8NxrSJZoCDYRVWjX3IIqLsFYOBnVRY/OGCEypQ=;
  b=CdCCXXIllox3k8wv/IG+UaSrteJkZoF9mUv/NerKpftH+KYvABtqOz+p
   vJ+D1rhMpT5kMhkQUtxbA8d1tylupHrU/lmrGAPR008m1ZKQbh/XW4+C/
   x4B+BY71MgbBlPWLU3Z5JcWSOs41TwK8VQTHj3KU5Qg/ovZmOeDHmEgol
   ya4l9P81Zng6N1v1tC6VNd3FHxLyeRBxr+4CDaDWfhMCDtdQVtY8MQ3fA
   Wi9BhOGL0wH3CLWr/GSyzIqj2OEFJOKM+zyLIifY3GuEivpYDTYYhPS/r
   Ki4ZkL5tqhEK/XfPdIICVUq26Y/b/goy99C92X8z0qRCNl7zV+/DJ3go9
   Q==;
X-CSE-ConnectionGUID: //fGfuPTQT6QN+bjZMfrAA==
X-CSE-MsgGUID: bkIZJdCnTlGtoqIMyKBRwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="61750416"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="61750416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 03:01:39 -0700
X-CSE-ConnectionGUID: FFJdvNstQuCFHZupIJZNpg==
X-CSE-MsgGUID: OAxVbILFSCiEgTnaBHm/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="217599082"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2026 03:01:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vztuC-0000000032r-2uCE
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Mar 2026 10:01:36 +0000
Date: Tue, 10 Mar 2026 11:01:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on
 parsing NULL endpoints
Message-ID: <202603101001.y01dAvxN-lkp@intel.com>
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
In-Reply-To: <20260310080038.1182695-1-sakari.ailus@linux.intel.com>
References: <20260310080038.1182695-1-sakari.ailus@linux.intel.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: linux-media@vger.kernel.org

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l2-fwnode-Return-EPROBE_DEFER-on-parsing-NULL-endpoints/20260310-160121
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260310080038.1182695-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH v4 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603101001.y01dAvxN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#39: FILE: drivers/media/v4l2-core/v4l2-fwnode.c:474:
+	 * another error such as -EINVAL.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
