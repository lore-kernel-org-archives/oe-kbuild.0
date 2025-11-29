Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3691A9F97
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764439886; cv=none; b=rJ6GRWg/jWh0bH1XMfymz6TZn+6DOFL1PYQnPlDE0Kdk9gerHG9N9sWU9kstt6z4s5qzSoDp3U/P2f38MJcQWjcE6eis+qOztzaNem4S6WblgC/R0mKaNLGtUBSkoYIFWYTNMlQLPjhOgqMdRKaGVURTt4b5TrZ9pHuUPrtOK3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764439886; c=relaxed/simple;
	bh=iNn/hy45oYf6P2u47VoTiL2eSXx6UTTiW4bZK8yS/Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CC1fWfoVzkt6EQatDaO9BQuuz/FMwaPaNo9++/Pgiu9f/WAy45EV0+PpuF2KcZPT5tLY/HAAnc4Otg8tunDXf1BYBpNTj1YNmMkzl/Zpxh6/gJpfYuXYsAFlbjHkhEKQE100e8ih7KDOs3xBd0jhWohALWLOab7tPMUBFND7tTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRDrjqMT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRDrjqMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764439884; x=1795975884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iNn/hy45oYf6P2u47VoTiL2eSXx6UTTiW4bZK8yS/Bc=;
  b=BRDrjqMTERtoV51XKhu5f8xU7wmTXcqANxAFkQV65Wf9EMHFAN+69zMi
   0ni/5BXLh01gg/9AGMYarrriFQWxlqsYLVFEdBYdmhtHADD7RRjVK58Ha
   D92kfGpRsNDQkc3SAGuMqjeHUfs0MikBYKBq62ORtrqKC57S5I5Ab0QWd
   tC/gQVPAS+XQ7U5mZQ51T8EzslOMhRFsObjG4nIEIMTMaZJrsVitMnVrA
   U+PAe4TEZjT+Kpu0eLDGSgUt5oR7CpVUmxfQPPdCAp09FjFwlY9FYid7W
   7jlJU4im/5lnNBGf9m/UhlD3j/bBvkLFZX04tEIeVxsknr9OljRMU9OVG
   g==;
X-CSE-ConnectionGUID: jb0o5CbHRDG2HEacFPSoQQ==
X-CSE-MsgGUID: LFS+0/8PTEqNLv63+1ENOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="83817613"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="83817613"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 10:11:23 -0800
X-CSE-ConnectionGUID: Y49mupBYRe2o2IW+Lmgicw==
X-CSE-MsgGUID: 7lfzGLNQRiiFRoSWrENXkw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Nov 2025 10:11:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPPPl-000000007Rd-0BVc;
	Sat, 29 Nov 2025 18:11:21 +0000
Date: Sun, 30 Nov 2025 02:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC mptcp-next v2 2/7] mptcp: add sock_set_reuseaddr
Message-ID: <202511300130.mpb3qtNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <ff2a24c1ef454b1a56b56496c092e5053e438de6.1764152990.git.tanggeliang@kylinos.cn>
References: <ff2a24c1ef454b1a56b56496c092e5053e438de6.1764152990.git.tanggeliang@kylinos.cn>
TO: Geliang Tang <geliang@kernel.org>

Hi Geliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mptcp/export]
[also build test WARNING on next-20251128]
[cannot apply to mptcp/export-net linux-nvme/for-next linus/master v6.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-allow-overridden-write_space-to-be-invoked/20251126-184411
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/ff2a24c1ef454b1a56b56496c092e5053e438de6.1764152990.git.tanggeliang%40kylinos.cn
patch subject: [RFC mptcp-next v2 2/7] mptcp: add sock_set_reuseaddr
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251129 (https://download.01.org/0day-ci/archive/20251130/202511300130.mpb3qtNM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511300130.mpb3qtNM-lkp@intel.com/

New smatch warnings:
net/mptcp/protocol.c:3795 mptcp_sock_set_reuseaddr() warn: 'ssk' can also be NULL

Old smatch warnings:
net/mptcp/protocol.c:3983 mptcp_connect() warn: 'ssk' can also be NULL
net/mptcp/protocol.c:4103 mptcp_listen() warn: 'ssk' can also be NULL

vim +/ssk +3795 net/mptcp/protocol.c

e777a7fb06b17c Paolo Abeni  2025-11-21  3785  
5a190eae995e5e Geliang Tang 2025-11-26  3786  void mptcp_sock_set_reuseaddr(struct sock *sk)
5a190eae995e5e Geliang Tang 2025-11-26  3787  {
5a190eae995e5e Geliang Tang 2025-11-26  3788  	struct mptcp_sock *msk = mptcp_sk(sk);
5a190eae995e5e Geliang Tang 2025-11-26  3789  	struct sock *ssk;
5a190eae995e5e Geliang Tang 2025-11-26  3790  
5a190eae995e5e Geliang Tang 2025-11-26  3791  	lock_sock(sk);
5a190eae995e5e Geliang Tang 2025-11-26  3792  	ssk = __mptcp_nmpc_sk(msk);
5a190eae995e5e Geliang Tang 2025-11-26  3793  	if (IS_ERR(ssk))
5a190eae995e5e Geliang Tang 2025-11-26  3794  		goto unlock;
5a190eae995e5e Geliang Tang 2025-11-26 @3795  	ssk->sk_reuse = SK_CAN_REUSE;
5a190eae995e5e Geliang Tang 2025-11-26  3796  unlock:
5a190eae995e5e Geliang Tang 2025-11-26  3797  	release_sock(sk);
5a190eae995e5e Geliang Tang 2025-11-26  3798  }
5a190eae995e5e Geliang Tang 2025-11-26  3799  EXPORT_SYMBOL(mptcp_sock_set_reuseaddr);
5a190eae995e5e Geliang Tang 2025-11-26  3800  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
