Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94B423A8E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134044; cv=none; b=gkSKqXr8s5eV77yUdQj/zy1RCypTdHh+wc+K1LjMMU+StzYjZX6xVGOpjr7dur80jbUm6nHqYPO8qJ5mhmm2d6NERg8BUenqpRI8jg/quhcIwhIgEMoPaCSZM1HbK/iILtQwVkovlMFPyKJSKYW0Xmrqb8bmheXqJpCN/cdf4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134044; c=relaxed/simple;
	bh=o70X9u2DYcnLgVdQ/oPvyG6+Ch1fRM+wf7ve8G2TVdg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dC58QlxmUcOONqZUE6Ry1H6vUC58CVoxFgh7yQ3KxrlFVwmEt+phVpHerPqwAsBtLmYnwxokoAfG2sDgDsEXwhZBAzmKXiQOmj62ecNiF4SIuU+fLdGwe4xiqwsOmEASfbLJG0foAzEZ1dEnIjjobbWkMkEtk1wGDnyE5L8s/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcX2Z7et; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcX2Z7et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772134042; x=1803670042;
  h=date:from:to:subject:message-id:mime-version;
  bh=o70X9u2DYcnLgVdQ/oPvyG6+Ch1fRM+wf7ve8G2TVdg=;
  b=KcX2Z7et3yL4c0sigwpEuT9FivMqM+NlpHHNqCxAziAsECb+uFz4TdH1
   GeXIYCraDiGikI4MLRhPt15acH+ZeKAK2VXJAX3LG5hIuD8DvsKtaINir
   kfwCRye+XdzLBKCy+sEG1TASQsNuDV95kWoF968QcbBSnNxLztTTk2qZP
   3Do2XIlr5Ct8WsU4ymjYlLvMJg2eCoyElSsgNmNJEeCCxBIw9wHxmoiLj
   WGkpDEjaJiPNmNkZvSAQjGm0Cin62CbvHJJH+JSTIOLCaA4YhF7d5iooy
   pzYK7vTEYa6fAWFw9++wXB2jAAgDnRhE7LHzHDvzRmYXjvS5Tmo7nDXFi
   w==;
X-CSE-ConnectionGUID: CBZfx/G2RQy9B6koTnh7Pw==
X-CSE-MsgGUID: +QWM6i8MSym5S2QLTG6aFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83540539"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83540539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:27:18 -0800
X-CSE-ConnectionGUID: I/qa6HGYQpi9enI9fxPBeg==
X-CSE-MsgGUID: HIAr9pfbT1aXG2RRRyqnNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="239659110"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2026 11:27:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvh10-000000000Hv-1S9x
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Feb 2026 19:27:14 +0000
Date: Thu, 26 Feb 2026 20:26:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 2/3] bpftool: support merging multiple module BTFs in
 btf dump
Message-ID: <202602262034.jMrzy5Ml-lkp@intel.com>
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
In-Reply-To: <ebce5bbcffe226e4ca1894c4970d094fadd711f7.1771950922.git.josef@toxicpanda.com>
References: <ebce5bbcffe226e4ca1894c4970d094fadd711f7.1771950922.git.josef@toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: bpf@vger.kernel.org

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/libbpf-support-appending-split-BTF-in-btf__add_btf/20260225-005622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/ebce5bbcffe226e4ca1894c4970d094fadd711f7.1771950922.git.josef%40toxicpanda.com
patch subject: [PATCH v5 2/3] bpftool: support merging multiple module BTFs in btf dump
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602262034.jMrzy5Ml-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#26: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
