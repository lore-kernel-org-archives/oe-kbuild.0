Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF84283CB8
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261808; cv=none; b=XQpZ7QHeQBojRl7y+f5SBBYKJr9LdamvnbsuavVAeO1WlmZ0+1phhaH3SDtaghoN503dygIm5RR1XLdDzXNDzowkdk0gJiBSZIUuM9SQYA/OHHOhNRmTE3Epar69/Iw+UeS97AOcNxzKb38i9zibjNFJHS4TEITlYRv+5bj9LHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261808; c=relaxed/simple;
	bh=yjQKHEGRn9o1TM4e7QCOTAzDiETznHY65I7OcnnDNfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ck2sGkjdD1wrv9cxbvVUrw250ok0fbYu82Ol6hFVy3Lk+2uwwFJ9odYdQaCefHIJnK0gIUJKlbXIxdI3YFbnGh2ZlDJjSP2TDHGPRzeSmNMa9lgNyYzHVDIhfDq7bm4QykJLfT2Et4gJ6ygIEeVUez1Piok/hnNcdbFkOCUWScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdr5zFGZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdr5zFGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753261807; x=1784797807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjQKHEGRn9o1TM4e7QCOTAzDiETznHY65I7OcnnDNfc=;
  b=bdr5zFGZD39Uu1TxOvYNkx1ENKo07YAEVxluCIyJRqdSGVd3PvqcUAgr
   qLrqc7Cel/834L+7C5msJ1JaybyQvis43QMrqtujBI5O6aPLJeh0CQfD7
   g/Hh4aeOWqL7Vb14v6TYQAiJCJGph3sZSvomOYgrt9xHc259wN6MRLBtK
   n27w4uJTbPCUyghy9DdGvHmIvgZFzJyH6dWM9c4FoDEDGBguzmw9Fvold
   Uqig56XbKJH7s6BwoZC8VXa7/IaCpq+v9qHf5HtahgFh0lPVctLxbGJNQ
   fiqsigNzfpLByUWfKZOtBFVXMB8t72oUeVfVS/w5oof6l7SuZPD9gjjc+
   Q==;
X-CSE-ConnectionGUID: RdUuI80zRUCFiWVnuMNaOQ==
X-CSE-MsgGUID: WYufivoHSFSo7ooTCWbP+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55479477"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55479477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 02:10:06 -0700
X-CSE-ConnectionGUID: QTZ57fXAQZW+Y3G90t3U0g==
X-CSE-MsgGUID: tfva9iNLQo22T6kzzvmh0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159056851"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2025 02:10:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueVUB-000JAd-1c;
	Wed, 23 Jul 2025 09:10:03 +0000
Date: Wed, 23 Jul 2025 17:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] dt-bindings: ufs: qcom: Document HS gear and rate
 limit properties
Message-ID: <202507231639.CDuz9xs4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
References: <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
TO: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
TO: mani@kernel.org
TO: alim.akhtar@samsung.com
TO: avri.altman@wdc.com
TO: bvanassche@acm.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: James.Bottomley@HansenPartnership.com
TO: martin.petersen@oracle.com
TO: agross@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.16-rc7 next-20250723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Kumar-Dwivedi/ufs-ufs-qcom-Add-support-for-DT-based-gear-and-rate-limiting/20250723-001521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250722161103.3938-4-quic_rdwivedi%40quicinc.com
patch subject: [PATCH 3/3] dt-bindings: ufs: qcom: Document HS gear and rate limit properties
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-052-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231639.CDuz9xs4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231639.CDuz9xs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507231639.CDuz9xs4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: limit-hs-gear: missing type definition
>> Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: limit-rate: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
