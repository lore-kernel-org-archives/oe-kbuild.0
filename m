Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52C2F25F5
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771559994; cv=none; b=larsrdqM4DgsX4zpjiz1Jf9UlAQxKKwMNl1Uk/ZE+gaMt0rY6Q8PwIU+euI/oRX3sD2F7tRbxa51yi8KEx9Eh6DRnvxGm6SxWiFik1/wf8xoiadaIWXVWiXJg7HrvhPYrtJhTypmXfL1DijnsLNjb3k/xzm6lRvb4q9R0y52Eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771559994; c=relaxed/simple;
	bh=NrbPjCxBBaXe+1VJgHBmooVlEUF9F+XNcX+bS9kYjms=;
	h=Date:From:To:Subject:Message-ID; b=lWWRD9mVQEQJIKyjahPpAVaNcGAMveP2/9GQ1QaPzGk7gIlVHfwkct60WNYWeUxkt/qyetRmYSVdovE2mb0qdN+9ww5dqy6h0TBwJztuXLlb+X51kd+y3DLpawP73vK9d2EtJOmlh4/crXVgh9PT509GYZAnqsCs5RbTmEX/RDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q96Kh0Yg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q96Kh0Yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771559992; x=1803095992;
  h=date:from:to:subject:message-id;
  bh=NrbPjCxBBaXe+1VJgHBmooVlEUF9F+XNcX+bS9kYjms=;
  b=Q96Kh0YgMP7MUUI6c/kf8MUl63IUlYUqcKpwK8iRqzy9PdWowzdnP4vj
   TyuZZCTQafm9y7wZjDUkKX0s36gw735yNiIwzKj16S26UAiMXl+Dtr8JW
   dUHxfwBEexg4cp8We1+vJIfzJ/yxx2lFsYJRK9+7Wr125bL3CObtxPjCP
   pDq2lPAF0wZhZxr1YALjIUj/F3v2TO7SoyyZBN9LyJ/MPrysDzA16m9Qz
   CjG/65kMPL/e9FtjsqQjBKKDxcUFXKes+kF9yRqUtvYF8COmTWoNhNe70
   JDUAG6zlB40QPIcLEUPiUrf5pdxwhfsCyesa2QRnYmIufu/ZSO9VCnejB
   A==;
X-CSE-ConnectionGUID: 0gS74kpXTpieCxl2Ir2PWQ==
X-CSE-MsgGUID: qz+FOEksRJqWtOlHgwnUPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71678965"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="71678965"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 19:59:48 -0800
X-CSE-ConnectionGUID: N/aCy41HT7alqOmPUVj3fw==
X-CSE-MsgGUID: 34JBFJPRQdC24SrVqQO8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213851239"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2026 19:59:47 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtHg8-0000000048D-3DjN
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 03:59:44 +0000
Date: Fri, 20 Feb 2026 04:59:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 71/81] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202602200457.VPLW8Oav-lkp@intel.com>
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
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   68777acba791f6c852c9128668ef27a662ab7bf4
commit: 979792367f37009e45b073abcd733bb095ac19ab [71/81] lib: introduce hierarchical per-cpu counters
:::::: branch date: 34 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602200457.VPLW8Oav-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#69: 
based on the the N-arity of each level and the batch size.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
