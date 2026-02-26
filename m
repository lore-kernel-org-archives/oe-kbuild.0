Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3087389443
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134041; cv=none; b=pzZv+9YpD6igG/6IHL1gPwxTjng/24jQYdIRVYL5malSDINfhSQ8ik0nbeHnYcc5OK7P+TN5jZuHXXc5tla6x4hgD+pbWmfN/96vg/6hdEMSP3uvqSC/n2tRAVMuhcsyA+LEk75/acejPxnOdWruw4/L5GlUEYgUsaQ8EoPN9Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134041; c=relaxed/simple;
	bh=ELIgKbpfCHThP5HIHmDA7UWzUhwQyiVx/jVNC/vuM1I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAVlSNYLT45YJPq6zS4UQJjNAWz5UhN2dNE4BCyHlBgNkp1GEnSpzaISBP+4RJ/2vpB4S5zkTVRKFksKlyDy3rYUX0Qe/xJcVjn0vQOraHbQ8ZWenknQk5wLFtZfElANOTUB0ohB//J7TVroy7sYTtzXhFiMvE+AE6AnQVdmDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ch6/Ol8M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ch6/Ol8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772134038; x=1803670038;
  h=date:from:to:subject:message-id:mime-version;
  bh=ELIgKbpfCHThP5HIHmDA7UWzUhwQyiVx/jVNC/vuM1I=;
  b=Ch6/Ol8M3WveNo4y/VyglST0dU1pU92Z3R8Ti7W6RgPkP4A+3ndSFtX5
   pvoK8ticYN+I8MFHl0o0w47ylRyDYF+qvr0EIGIfKICfk+XZ43GnRLdVD
   XhlQNmHGLlmAoWnRmDTRZA963WgMqYl5PZDN/zmgju86bWZm9tXzdnT23
   ItmAnJR+I1BXhxhdUJGcPBPSovKTph/mWL568bVCV2Ex7vvVtkIqMuJ5Z
   OwgZjrHtArtXFlQ52IYO7hTn0DYRuxMDK2oWb7TlpbWkeT4fniEarzVoo
   8pk6MfSLWYaCA5Kxg2qp3GYMOJhuBUlnaMzDd6/MmEJsilf4fjMgaqc5t
   A==;
X-CSE-ConnectionGUID: dEUUXkv2RdKNigDxKmzY1A==
X-CSE-MsgGUID: q2cveYeKROCnsb1zsFvS6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83540537"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83540537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:27:18 -0800
X-CSE-ConnectionGUID: lh27Gk6aSbylwidNZTjKOQ==
X-CSE-MsgGUID: h6AWaKDxTE+J/TONxUReMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="239659108"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2026 11:27:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvh10-000000000Hx-1bkT
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Feb 2026 19:27:14 +0000
Date: Thu, 26 Feb 2026 20:26:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 3/3] selftests/bpf: add test for btf__add_btf() with
 split BTF sources
Message-ID: <202602262053.gel5WzQC-lkp@intel.com>
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
In-Reply-To: <dbaf8e09041984d90e0e3acb4aa86a3700728b00.1771950922.git.josef@toxicpanda.com>
References: <dbaf8e09041984d90e0e3acb4aa86a3700728b00.1771950922.git.josef@toxicpanda.com>
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
patch link:    https://lore.kernel.org/r/dbaf8e09041984d90e0e3acb4aa86a3700728b00.1771950922.git.josef%40toxicpanda.com
patch subject: [PATCH v5 3/3] selftests/bpf: add test for btf__add_btf() with split BTF sources
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602262053.gel5WzQC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#13: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
