Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A344D8AD
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Aug 2024 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724182195; cv=none; b=oQYiEs7A2pJcMzMFa35VIs4KnT4lVz+9ANSN1IkcGK84Z+KHUKe3a9+UErRagILYPTzq+Y26/QJCvW6gI77d7EY9bBc9kHX3EO0RhfTR0Sh6sm7yQy/e2L0Vu141OsR3WNL6IwYZQz941LNSJpUR1Fk316IMRaM+0+y8BHppciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724182195; c=relaxed/simple;
	bh=Mgd1cMyb3rZ2Tsde4YBPahTgjZjfkA/0WmoICsPkloc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJ7vKxlph/OKj5DIqSW0aoun6a8wqYgcACMfQsC4k4eR8iRQg/3SaoxMv3+wtY/cjNkfNvesuG1ywp8+vUTRFx5mfx02haS8K9DhuhEgllp8sWDMQNjDtorO+y7KYq/wDco0JAeHWmAlPkfGco0N5M2VCbL8X1K4vCzP1drJLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfM2hurx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfM2hurx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724182194; x=1755718194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mgd1cMyb3rZ2Tsde4YBPahTgjZjfkA/0WmoICsPkloc=;
  b=IfM2hurx5lm2uWETyno8MkuoeDatYYXFpaGqXkffHolPuus0YS6VMcsc
   zeuds+NTO7dQzF1pg8+aY3oUiXjpeFy9YPm82hao0hkcQU1d/ic/tcPIP
   xgAni9fGmPjpXDiBBe8A9E6fy2HE5Nc/OCsUcnp4ZKBmzCt7orw3l8ZUo
   7pvd4vSLqsEGpkkDicjVgqE+s/yw3rwIK6SN4EOVuStF3v/SNd5SsC+2W
   ST3CNSUgglcr4JLuoi8hf0kUFKdQrQ9rzlBKOmzXlr9Y7umPllLeuET0C
   pr9W6ZnJGHLJsS498C86aVbsxA1hKv/7yLOTJzXvDypG4LmsStBGZNB3F
   w==;
X-CSE-ConnectionGUID: zlLQnRjTQ0quU1U5O8sHzw==
X-CSE-MsgGUID: bq9wXCsaSQ6XrOHmBtYIUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="45033708"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="45033708"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 12:29:53 -0700
X-CSE-ConnectionGUID: dz3VCv4TQvKq0wGtICrJbA==
X-CSE-MsgGUID: N1Ykp/+0SFS6bg9NtokJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65683862"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2024 12:29:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgUY9-000AXm-0P;
	Tue, 20 Aug 2024 19:29:49 +0000
Date: Wed, 21 Aug 2024 03:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH dlm/next 11/12] dlm: add nldlm net-namespace aware UAPI
Message-ID: <202408210355.7IoUxYtZ-lkp@intel.com>
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
In-Reply-To: <20240819183742.2263895-12-aahringo@redhat.com>
References: <20240819183742.2263895-12-aahringo@redhat.com>
TO: Alexander Aring <aahringo@redhat.com>
TO: teigland@redhat.com
CC: gfs2@lists.linux.dev
CC: song@kernel.org
CC: yukuai3@huawei.com
CC: agruenba@redhat.com
CC: mark@fasheh.com
CC: jlbec@evilplan.org
CC: joseph.qi@linux.alibaba.com
CC: gregkh@linuxfoundation.org
CC: rafael@kernel.org
CC: akpm@linux-foundation.org
CC: linux-kernel@vger.kernel.org
CC: linux-raid@vger.kernel.org
CC: ocfs2-devel@lists.linux.dev
CC: netdev@vger.kernel.org
CC: vvidic@valentin-vidic.from.hr
CC: heming.zhao@suse.com
CC: lucien.xin@gmail.com
CC: aahringo@redhat.com

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on teigland-dlm/next]
[also build test WARNING on next-20240820]
[cannot apply to gfs2/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/dlm-introduce-dlm_find_lockspace_name/20240820-024440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git next
patch link:    https://lore.kernel.org/r/20240819183742.2263895-12-aahringo%40redhat.com
patch subject: [PATCH dlm/next 11/12] dlm: add nldlm net-namespace aware UAPI
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210355.7IoUxYtZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408210355.7IoUxYtZ-lkp@intel.com/

smatch warnings:
fs/dlm/nldlm.c:202 nldlm_get_ls() error: uninitialized symbol 'ls'.

vim +/ls +202 fs/dlm/nldlm.c

9ef283f3b6bbf7 Alexander Aring 2024-08-19  181  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  182  static int nldlm_get_ls(struct sk_buff *msg, struct genl_info *info)
9ef283f3b6bbf7 Alexander Aring 2024-08-19  183  {
9ef283f3b6bbf7 Alexander Aring 2024-08-19  184  	struct dlm_net *dn = dlm_pernet(sock_net(msg->sk));
9ef283f3b6bbf7 Alexander Aring 2024-08-19  185  	struct dlm_cfg_ls *ls, *ls_iter = NULL;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  186  	char lsname[DLM_LOCKSPACE_LEN];
9ef283f3b6bbf7 Alexander Aring 2024-08-19  187  	struct sk_buff *skb;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  188  	int rv;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  189  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  190  	rv = nldlm_parse_ls(info->attrs[NLDLM_ATTR_LS], lsname);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  191  	if (rv < 0)
9ef283f3b6bbf7 Alexander Aring 2024-08-19  192  		return rv;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  193  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  194  	mutex_lock(&dn->cfg_lock);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  195  	list_for_each_entry(ls_iter, &dn->lockspaces, list) {
9ef283f3b6bbf7 Alexander Aring 2024-08-19  196  		if (!strncmp(ls_iter->name, lsname, DLM_LOCKSPACE_LEN)) {
9ef283f3b6bbf7 Alexander Aring 2024-08-19  197  			ls = ls_iter;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  198  			break;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  199  		}
9ef283f3b6bbf7 Alexander Aring 2024-08-19  200  	}
9ef283f3b6bbf7 Alexander Aring 2024-08-19  201  
9ef283f3b6bbf7 Alexander Aring 2024-08-19 @202  	if (!ls) {
9ef283f3b6bbf7 Alexander Aring 2024-08-19  203  		rv = -ENOENT;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  204  		goto err;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  205  	}
9ef283f3b6bbf7 Alexander Aring 2024-08-19  206  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  207  	skb = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  208  	if (!skb) {
9ef283f3b6bbf7 Alexander Aring 2024-08-19  209  		rv = -ENOMEM;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  210  		goto err;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  211  	}
9ef283f3b6bbf7 Alexander Aring 2024-08-19  212  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  213  	rv = __nldlm_get_ls(skb, ls, info->snd_portid,
9ef283f3b6bbf7 Alexander Aring 2024-08-19  214  			    info->snd_seq, NULL, 0);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  215  	if (rv < 0) {
9ef283f3b6bbf7 Alexander Aring 2024-08-19  216  		nlmsg_free(skb);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  217  		goto err;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  218  	}
9ef283f3b6bbf7 Alexander Aring 2024-08-19  219  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  220  	rv = genlmsg_reply(skb, info);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  221  
9ef283f3b6bbf7 Alexander Aring 2024-08-19  222  err:
9ef283f3b6bbf7 Alexander Aring 2024-08-19  223  	mutex_unlock(&dn->cfg_lock);
9ef283f3b6bbf7 Alexander Aring 2024-08-19  224  	return rv;
9ef283f3b6bbf7 Alexander Aring 2024-08-19  225  }
9ef283f3b6bbf7 Alexander Aring 2024-08-19  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
