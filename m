Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352730;
	b=gW1X8sq7ewWscRhMSNIKsn+2nB3wWyEaHg7EacO+bQ72jjLqoHTQIuFie42ZrYKjlYcD
	 oSO9VlDZYsWLlQxthsnzHj38/NlGoelBVMF7LC41sqrXE2VYLd5OTHbBkTpQbKliLBDmr
	 6jWaMWUZZLunchlR5JM+cx25KE1sFIBN6+MRLx9qJUweTCWAqbvmWjRFkRc+fegofVziJ
	 0XbSkOVzpU5ZLBBu/oqrOFbH3jf0uVJQKFQPLDH5J/EBk7yMiMjtPEXBqqZdgm7Tl/lVf
	 JTNup3Gna/zK4vjU/FaUOQ7z3d7Uz2g9W0dZ9z8GNBhBRmsX9B3dkeKmE5VfEJDFSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352730;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=jp+24jvTt9mj4ir2xY9+fsDS628cAWAZ7/2txxP3uvY=;
	b=c5BMrM5yCHHOOTGTO+NUcPwlZ/sUZcB8eorWO07p09lWpYlmRST27HX+2UhLqZSLf4wt
	 FoMjwPU4vzj60n1Zpk0lBqIbb0tTN7Q/pJZJtcjNvrZcAk9YOuRsn5hqZYarc6FBvSe+M
	 cCv6ni6bCfrxUnonC1lR2V3cPPZ/aEThTHbypkHlA0IOKJ2uZmrLeMSzsJ4QVMCf6n6fg
	 3Xu0JEARyJ1M8LJOB54OMGEH+mMckJNYdnDsgLBd+IQkqsj+K8N9vNnUWJ7vzzY9YLhFP
	 /N9s4wGQHMue4zjtAaNBHkYBhRadNx/yF0nmlBhHMLwZJVFLSsRSE+n1oxJub2D8IaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5SNIhL3;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD87606A32A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 13:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5SNIhL3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795352729; x=1826888729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+QQlnWVeud04zK3tUFfvj4haxOXzjDhbEtqAt0PSqI=;
  b=M5SNIhL3pHLv7fB+IzwZ3nm1KhmnIdtm1QEkVlzRp+wXD9JKVRSvDXC5
   SPOg7vIZxdz7k6bvRvwpvJCRdgep7EOs3gjV1C7sy8QZR8EjQvA8OeKlz
   HdV759WIRjPr3kcNNDA3IKxCqXuMLs6XQZA0P8biLyqi7Yut8FECk/DQk
   4y0a0JycVhuG/44oQWXM2EesnT5nsIklnaxSEtt7eXW2eizEHVv8RL2Qc
   pzcPmrCI1d8wzYFMIIm41q+5/Y7aaY+IGNkxh8w6NHFG1bLKKmQgqSmxb
   UX/C0cV87s/2Ve4URxLjppEid0T56stsHAYxp8fueuQ5vQvPwoiBfzIic
   g==;
X-CSE-ConnectionGUID: qw59E5gjTU69JTmht4DH5A==
X-CSE-MsgGUID: xJt3CdRuRDqWEOITEZaWOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4178429"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4178429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 05:05:28 -0800
X-CSE-ConnectionGUID: I5rBK36mSeaDf50EBmAJ2A==
X-CSE-MsgGUID: BAUU3lrtSbCqBe9PR4nClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11371917"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2026 05:05:29 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV7G1-00000001LX8-42CF;
	Sun, 22 Nov 2026 13:05:25 +0000
Date: Sun, 22 Nov 2026 21:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] smb: client: convert DFS target node name from cache
 charset on mount
Message-ID: <202611222108.7GCO1GPZ-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261122045841.99012-1-fredric.cover.lkernel@gmail.com>
References: <20261122045841.99012-1-fredric.cover.lkernel@gmail.com>
TO: Fredric Cover <fredric.cover.lkernel@gmail.com>
TO: Paulo Alcantara <pc@manguebit.org>
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
CC: Tom Talpey <tom@talpey.com>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Shyam Prasad N <sprasad@microsoft.com>
CC: Bharath SM <bharathsm@microsoft.com>
CC: linux-cifs@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Fredric Cover <fredric.cover.lkernel@gmail.com>
CC: stable@vger.kernel.org

Hi Fredric,

kernel test robot noticed the following build errors:

[auto build test ERROR on manguebit/cifs-next]
[also build test ERROR on manguebit/cifs-fixes linus/master v7.4-rc3 next-20261120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fredric-Cover/smb-client-convert-DFS-target-node-name-from-cache-charset-on-mount/20261122-045840
base:   https://git.manguebit.org/linux.git cifs-next
patch link:    https://lore.kernel.org/r/20261122045841.99012-1-fredric.cover.lkernel%40gmail.com
patch subject: [PATCH] smb: client: convert DFS target node name from cache charset on mount
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261122/202611222108.7GCO1GPZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611222108.7GCO1GPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611222108.7GCO1GPZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/dfs.c: In function 'dfs_parse_target_referral':
>> fs/smb/client/dfs.c:44:21: error: implicit declaration of function 'dfs_cache_local_path'; did you mean 'dfs_cache_canonical_path'? [-Wimplicit-function-declaration]
      44 |         node_name = dfs_cache_local_path(ref->node_name, ctx->local_nls);
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     dfs_cache_canonical_path
>> fs/smb/client/dfs.c:44:19: error: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      44 |         node_name = dfs_cache_local_path(ref->node_name, ctx->local_nls);
         |                   ^


vim +44 fs/smb/client/dfs.c

ad46faff1afcc8d fs/smb/client/dfs.c Paulo Alcantara 2025-01-03  13  
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  14  /**
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  15   * dfs_parse_target_referral - set fs context for dfs target referral
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  16   *
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  17   * @full_path: full path in UNC format.
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  18   * @ref: dfs referral pointer.
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  19   * @ctx: smb3 fs context pointer.
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  20   *
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  21   * Return zero if dfs referral was parsed correctly, otherwise non-zero.
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  22   */
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  23  int dfs_parse_target_referral(const char *full_path, const struct dfs_info3_param *ref,
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  24  			      struct smb3_fs_context *ctx)
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  25  {
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  26  	int rc;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  27  	const char *prepath = NULL;
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22  28  	char *node_name = NULL;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  29  	char *path;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  30  
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  31  	if (!full_path || !*full_path || !ref || !ctx)
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  32  		return -EINVAL;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  33  
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  34  	if (WARN_ON_ONCE(!ref->node_name || ref->path_consumed < 0))
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  35  		return -EINVAL;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  36  
86aacc2f3f6ba18 fs/smb/client/dfs.c Fredric Cover   2026-11-07  37  	if ((size_t)ref->path_consumed < strlen(full_path)) {
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  38  		prepath = full_path + ref->path_consumed;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  39  		/* skip initial delimiter */
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  40  		if (*prepath == '/' || *prepath == '\\')
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  41  			prepath++;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  42  	}
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  43  
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22 @44  	node_name = dfs_cache_local_path(ref->node_name, ctx->local_nls);
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22  45  	if (IS_ERR(node_name))
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22  46  		return PTR_ERR(node_name);
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22  47  
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22  48  	path = cifs_build_devname(node_name, prepath);
431f71072745dae fs/smb/client/dfs.c Fredric Cover   2026-11-22  49  	kfree(node_name);
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  50  	if (IS_ERR(path))
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  51  		return PTR_ERR(path);
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  52  
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  53  	rc = smb3_parse_devname(path, ctx);
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  54  	if (rc)
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  55  		goto out;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  56  
4b1b4c8be9dee9a fs/smb/client/dfs.c Paulo Alcantara 2025-01-07  57  	rc = dns_resolve_unc(DFS_DOM(ctx), path,
4b1b4c8be9dee9a fs/smb/client/dfs.c Paulo Alcantara 2025-01-07  58  			     (struct sockaddr *)&ctx->dstaddr);
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  59  out:
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  60  	kfree(path);
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  61  	return rc;
abdb1742a312388 fs/cifs/dfs.c       Paulo Alcantara 2022-10-04  62  }
a1c0d00572fca4a fs/cifs/dfs.c       Paulo Alcantara 2022-11-17  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
