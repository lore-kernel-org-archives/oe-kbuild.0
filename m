Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941020DCC
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715938319; cv=none; b=OdJz6AZetGAE3N1cURKhA3WakpkcJlbXnf6OmHqqHd42PCKZTrTXohGxCt5crP5rSCjl25SA+UIzjJZodSKWROlsjRn7Gy2Os2YqtpygpFDfOzr15q5LF+rWBU7OVgu2VwhKG4dUfACSRW2+9CFTZBnPvXpIHHFPPB0SMM1XSeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715938319; c=relaxed/simple;
	bh=dEjBW73Synkxtfn+VSnKnCSjL7B4w/MdGl2TJM2zE1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nf6gJ6cbhT/KdJuHdVtfT5k9nFcV0zkjXvIXM1rSNCLwbiIWs+LXD41F2D3RacL/aHqwh2BqdTRy6xgKGMi6KnR03kzawTP8z7W+C2xrpfzNvqzYaPlQ2cEPn6ertEdl6Zf8rASyUleicgZ0c4/SyKTBexOeBPpGI8fHPXf7ZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kf0JN/Ew; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kf0JN/Ew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715938318; x=1747474318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEjBW73Synkxtfn+VSnKnCSjL7B4w/MdGl2TJM2zE1A=;
  b=Kf0JN/EwM9Pqc1+rUbXp2RPesyLKJ+GjnT62EJzmbYgWoG4FH160afmM
   rbO/4UrZ6om4JNKK6Kw9GIts/HezXAXHNuavluiqLnQ6e75E7nJKy5GWj
   dfOrRvyMUbgEyGHLMlp7n+gxXTJ4rDAlNNtLnsjmuhsbZSMIIAZfP6G+i
   t/h63Oiv7U/KUUKNLJKi1+sQtKMx3VzkevUrb9XNiFoVMwxndsadTSgN4
   cnPyAm0DS0x14IVminZm4XkIxeoq8rQWs/DAHHeK3v4eFhnfARSmRkv4T
   p6sicmhbV/SjQb1Gi/vXRwob/P2lvoU7feCPoxOAXpuld9deAFuwkM0Le
   w==;
X-CSE-ConnectionGUID: b8mQMlSXRdKL3qeeL5dsNw==
X-CSE-MsgGUID: MqkjCX6VS/O7d9LsYaOrBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22780989"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22780989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 02:31:56 -0700
X-CSE-ConnectionGUID: ABM1m+ueS5eNW4+4yqPWXQ==
X-CSE-MsgGUID: IMc5jUfgQ1ew2s15kIkZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31735632"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2024 02:31:55 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7twN-0000Ww-1V;
	Fri, 17 May 2024 09:31:51 +0000
Date: Fri, 17 May 2024 17:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH mptcp-next v3 1/2] Squash to "selftests/bpf: Add mptcp
 subflow subtest"
Message-ID: <202405171757.SjnOU8Ef-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <e301d8027ec2ed1a9e77f461680593f30c5e2ced.1715848543.git.tanggeliang@kylinos.cn>
References: <e301d8027ec2ed1a9e77f461680593f30c5e2ced.1715848543.git.tanggeliang@kylinos.cn>
TO: Geliang Tang <geliang@kernel.org>
TO: mptcp@lists.linux.dev
CC: Geliang Tang <tanggeliang@kylinos.cn>

Hi Geliang,

kernel test robot noticed the following build errors:

[auto build test ERROR on mptcp/export]
[cannot apply to mptcp/export-net linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/Squash-to-selftests-bpf-Add-mptcp-subflow-subtest/20240516-164043
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/e301d8027ec2ed1a9e77f461680593f30c5e2ced.1715848543.git.tanggeliang%40kylinos.cn
patch subject: [PATCH mptcp-next v3 1/2] Squash to "selftests/bpf: Add mptcp subflow subtest"
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171757.SjnOU8Ef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405171757.SjnOU8Ef-lkp@intel.com/

All errors (new ones prefixed by >>):

   tools/testing/selftests/bpf/prog_tests/mptcp.c: In function 'test_subflow':
>> tools/testing/selftests/bpf/prog_tests/mptcp.c:439:19: error: too many arguments to function 'create_netns'
     439 |         nstoken = create_netns(NS_TEST);
         |                   ^~~~~~~~~~~~
   tools/testing/selftests/bpf/prog_tests/mptcp.c:82:24: note: declared here
      82 | static struct nstoken *create_netns(void)
         |                        ^~~~~~~~~~~~


vim +/create_netns +439 tools/testing/selftests/bpf/prog_tests/mptcp.c

1797e1ab533bb8 Geliang Tang 2024-05-16  415  
1797e1ab533bb8 Geliang Tang 2024-05-16  416  static void test_subflow(void)
1797e1ab533bb8 Geliang Tang 2024-05-16  417  {
1797e1ab533bb8 Geliang Tang 2024-05-16  418  	int cgroup_fd, prog_fd, err;
1797e1ab533bb8 Geliang Tang 2024-05-16  419  	struct mptcp_subflow *skel;
1797e1ab533bb8 Geliang Tang 2024-05-16  420  	struct nstoken *nstoken;
1797e1ab533bb8 Geliang Tang 2024-05-16  421  
1797e1ab533bb8 Geliang Tang 2024-05-16  422  	cgroup_fd = test__join_cgroup("/mptcp_subflow");
1797e1ab533bb8 Geliang Tang 2024-05-16  423  	if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup: mptcp_subflow"))
1797e1ab533bb8 Geliang Tang 2024-05-16  424  		return;
1797e1ab533bb8 Geliang Tang 2024-05-16  425  
1797e1ab533bb8 Geliang Tang 2024-05-16  426  	skel = mptcp_subflow__open_and_load();
1797e1ab533bb8 Geliang Tang 2024-05-16  427  	if (!ASSERT_OK_PTR(skel, "skel_open_load: mptcp_subflow"))
1797e1ab533bb8 Geliang Tang 2024-05-16  428  		goto close_cgroup;
1797e1ab533bb8 Geliang Tang 2024-05-16  429  
1797e1ab533bb8 Geliang Tang 2024-05-16  430  	err = mptcp_subflow__attach(skel);
1797e1ab533bb8 Geliang Tang 2024-05-16  431  	if (!ASSERT_OK(err, "skel_attach: mptcp_subflow"))
1797e1ab533bb8 Geliang Tang 2024-05-16  432  		goto skel_destroy;
1797e1ab533bb8 Geliang Tang 2024-05-16  433  
1797e1ab533bb8 Geliang Tang 2024-05-16  434  	prog_fd = bpf_program__fd(skel->progs.mptcp_subflow);
1797e1ab533bb8 Geliang Tang 2024-05-16  435  	err = bpf_prog_attach(prog_fd, cgroup_fd, BPF_CGROUP_SOCK_OPS, 0);
1797e1ab533bb8 Geliang Tang 2024-05-16  436  	if (!ASSERT_OK(err, "prog_attach"))
1797e1ab533bb8 Geliang Tang 2024-05-16  437  		goto skel_destroy;
1797e1ab533bb8 Geliang Tang 2024-05-16  438  
f5ba017ea187d1 Geliang Tang 2024-05-16 @439  	nstoken = create_netns(NS_TEST);
1797e1ab533bb8 Geliang Tang 2024-05-16  440  	if (!ASSERT_OK_PTR(nstoken, "create_netns: mptcp_subflow"))
1797e1ab533bb8 Geliang Tang 2024-05-16  441  		goto skel_destroy;
1797e1ab533bb8 Geliang Tang 2024-05-16  442  
1797e1ab533bb8 Geliang Tang 2024-05-16  443  	if (!ASSERT_OK(endpoint_init("subflow"), "endpoint_init"))
1797e1ab533bb8 Geliang Tang 2024-05-16  444  		goto close_netns;
1797e1ab533bb8 Geliang Tang 2024-05-16  445  
1797e1ab533bb8 Geliang Tang 2024-05-16  446  	run_subflow(skel->data->cc);
1797e1ab533bb8 Geliang Tang 2024-05-16  447  
1797e1ab533bb8 Geliang Tang 2024-05-16  448  close_netns:
1797e1ab533bb8 Geliang Tang 2024-05-16  449  	cleanup_netns(nstoken);
1797e1ab533bb8 Geliang Tang 2024-05-16  450  skel_destroy:
1797e1ab533bb8 Geliang Tang 2024-05-16  451  	mptcp_subflow__destroy(skel);
1797e1ab533bb8 Geliang Tang 2024-05-16  452  close_cgroup:
1797e1ab533bb8 Geliang Tang 2024-05-16  453  	close(cgroup_fd);
1797e1ab533bb8 Geliang Tang 2024-05-16  454  }
1797e1ab533bb8 Geliang Tang 2024-05-16  455  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
