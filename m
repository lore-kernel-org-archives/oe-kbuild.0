Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8D1B3F08
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Aug 2024 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724171809; cv=none; b=scCq4074aCNfDhUi9aZVprh5bht3FpnoPfrxPtW37Q8UIZ7AXuiVqeF6DbxIZFL6e/doItAnSMcgZtOJGXZL9KvOL53A8R9MaAT/u9Nv45cD7+yuvvlImXT7CEX6NEKAyUtnQcqyC8WKOKg8kCbFcmmzC2jCUxOAz1+vR4gtrpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724171809; c=relaxed/simple;
	bh=8e+GGS4BPqGaVLgxBOJMep6vX8T3XBnKi9IxnfxAzuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/xJf1p+8o9NlW6WMUFPq0pQ7z9jwA37CN5PC0t0tZXCKw4eGi1sWuRSuXEyxbg7HxuOB5k8bvrxL890M8kA9MhKotoJMswR7utTcYPiHxFVVA1ccwS9vwjiRc/yCRp46ykliHlpvaWd/5cJX4HizedDrLsO2EN5Au1u2CCXy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrhZBPpu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrhZBPpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724171807; x=1755707807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8e+GGS4BPqGaVLgxBOJMep6vX8T3XBnKi9IxnfxAzuA=;
  b=TrhZBPpupdnMGaSSjV65loqoKDoLhop+4wL0dPAfxM/nr9KrASAmcPZ1
   kT65Xba7El0eOmi3yfSFnJxuTWg+uGSEpjxUPC/IFMXEj2+LWsjPlyt2O
   PPCK5qUjO0VUBzy1EhL4zHobwEHFNUmLShVET8SY7YUGRfk4exLp8SSq8
   ENjeQbGVP2amDH6fCydpuSvnq28JjkX7Zt/VEqbxTYPbgSU10PszOo2ts
   4I/FDcFVpj77hpSxmT7/KBMOr9s/lxu+W7okDuDdv+zZhwvMs6ROXpu+r
   Yb2kjYYfNV2c8Th2tQwc9x184+4LnprUNXsaUHpa1c8m7dyZsxbB6t2kU
   g==;
X-CSE-ConnectionGUID: 81SYn/IkSTOL+IruiULuTw==
X-CSE-MsgGUID: cMUnKZkWRWm/xhxwBpg+GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25386503"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="25386503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 09:36:46 -0700
X-CSE-ConnectionGUID: j7hFI+l+QHC+5c6QYfb1LQ==
X-CSE-MsgGUID: altp5CM9RY+DrwVgQshrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="91507761"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Aug 2024 09:36:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgRqc-000APW-2F;
	Tue, 20 Aug 2024 16:36:42 +0000
Date: Wed, 21 Aug 2024 00:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH dlm/next 10/12] dlm: separate dlm lockspaces per
 net-namespace
Message-ID: <202408210031.QCBHr27k-lkp@intel.com>
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
In-Reply-To: <20240819183742.2263895-11-aahringo@redhat.com>
References: <20240819183742.2263895-11-aahringo@redhat.com>
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
patch link:    https://lore.kernel.org/r/20240819183742.2263895-11-aahringo%40redhat.com
patch subject: [PATCH dlm/next 10/12] dlm: separate dlm lockspaces per net-namespace
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210031.QCBHr27k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408210031.QCBHr27k-lkp@intel.com/

New smatch warnings:
fs/dlm/lock.c:4989 dlm_receive_buffer() error: we previously assumed 'ls' could be null (see line 4988)

Old smatch warnings:
fs/dlm/lock.c:5646 dlm_recover_master_copy() error: we previously assumed 'lkb' could be null (see line 5635)

vim +/ls +4989 fs/dlm/lock.c

c36258b5925e6c David Teigland  2007-09-27  4955  
c36258b5925e6c David Teigland  2007-09-27  4956  /* This is called by the midcomms layer when something is received for
c36258b5925e6c David Teigland  2007-09-27  4957     the lockspace.  It could be either a MSG (normal message sent as part of
c36258b5925e6c David Teigland  2007-09-27  4958     standard locking activity) or an RCOM (recovery message sent as part of
c36258b5925e6c David Teigland  2007-09-27  4959     lockspace recovery). */
c36258b5925e6c David Teigland  2007-09-27  4960  
bde0f4dba584ae Alexander Aring 2024-08-19  4961  void dlm_receive_buffer(struct dlm_net *dn, const union dlm_packet *p,
bde0f4dba584ae Alexander Aring 2024-08-19  4962  			int nodeid)
c36258b5925e6c David Teigland  2007-09-27  4963  {
1151935182b40b Alexander Aring 2023-08-01  4964  	const struct dlm_header *hd = &p->header;
c36258b5925e6c David Teigland  2007-09-27  4965  	struct dlm_ls *ls;
c36258b5925e6c David Teigland  2007-09-27  4966  	int type = 0;
c36258b5925e6c David Teigland  2007-09-27  4967  
c36258b5925e6c David Teigland  2007-09-27  4968  	switch (hd->h_cmd) {
c36258b5925e6c David Teigland  2007-09-27  4969  	case DLM_MSG:
00e99ccde75722 Alexander Aring 2022-04-04  4970  		type = le32_to_cpu(p->message.m_type);
c36258b5925e6c David Teigland  2007-09-27  4971  		break;
c36258b5925e6c David Teigland  2007-09-27  4972  	case DLM_RCOM:
2f9dbeda8dc04b Alexander Aring 2022-04-04  4973  		type = le32_to_cpu(p->rcom.rc_type);
c36258b5925e6c David Teigland  2007-09-27  4974  		break;
c36258b5925e6c David Teigland  2007-09-27  4975  	default:
c36258b5925e6c David Teigland  2007-09-27  4976  		log_print("invalid h_cmd %d from %u", hd->h_cmd, nodeid);
c36258b5925e6c David Teigland  2007-09-27  4977  		return;
c36258b5925e6c David Teigland  2007-09-27  4978  	}
c36258b5925e6c David Teigland  2007-09-27  4979  
3428785a65dabf Alexander Aring 2022-04-04  4980  	if (le32_to_cpu(hd->h_nodeid) != nodeid) {
c36258b5925e6c David Teigland  2007-09-27  4981  		log_print("invalid h_nodeid %d from %d lockspace %x",
3428785a65dabf Alexander Aring 2022-04-04  4982  			  le32_to_cpu(hd->h_nodeid), nodeid,
3428785a65dabf Alexander Aring 2022-04-04  4983  			  le32_to_cpu(hd->u.h_lockspace));
c36258b5925e6c David Teigland  2007-09-27  4984  		return;
c36258b5925e6c David Teigland  2007-09-27  4985  	}
c36258b5925e6c David Teigland  2007-09-27  4986  
bde0f4dba584ae Alexander Aring 2024-08-19  4987  	ls = dlm_find_lockspace_global(dn, le32_to_cpu(hd->u.h_lockspace));
c36258b5925e6c David Teigland  2007-09-27 @4988  	if (!ls) {
bde0f4dba584ae Alexander Aring 2024-08-19 @4989  		log_limit(ls, "dlm: invalid lockspace %u from %d cmd %d type %d\n",
3428785a65dabf Alexander Aring 2022-04-04  4990  			  le32_to_cpu(hd->u.h_lockspace), nodeid,
3428785a65dabf Alexander Aring 2022-04-04  4991  			  hd->h_cmd, type);
c36258b5925e6c David Teigland  2007-09-27  4992  
c36258b5925e6c David Teigland  2007-09-27  4993  		if (hd->h_cmd == DLM_RCOM && type == DLM_RCOM_STATUS)
bde0f4dba584ae Alexander Aring 2024-08-19  4994  			dlm_send_ls_not_ready(dn, nodeid, &p->rcom);
c36258b5925e6c David Teigland  2007-09-27  4995  		return;
c36258b5925e6c David Teigland  2007-09-27  4996  	}
c36258b5925e6c David Teigland  2007-09-27  4997  
c36258b5925e6c David Teigland  2007-09-27  4998  	/* this rwsem allows dlm_ls_stop() to wait for all dlm_recv threads to
c36258b5925e6c David Teigland  2007-09-27  4999  	   be inactive (in this ls) before transitioning to recovery mode */
c36258b5925e6c David Teigland  2007-09-27  5000  
578acf9a87a875 Alexander Aring 2024-04-02  5001  	read_lock_bh(&ls->ls_recv_active);
c36258b5925e6c David Teigland  2007-09-27  5002  	if (hd->h_cmd == DLM_MSG)
eef7d739c218cb Al Viro         2008-01-25  5003  		dlm_receive_message(ls, &p->message, nodeid);
f45307d395da7a Alexander Aring 2022-08-15  5004  	else if (hd->h_cmd == DLM_RCOM)
eef7d739c218cb Al Viro         2008-01-25  5005  		dlm_receive_rcom(ls, &p->rcom, nodeid);
f45307d395da7a Alexander Aring 2022-08-15  5006  	else
f45307d395da7a Alexander Aring 2022-08-15  5007  		log_error(ls, "invalid h_cmd %d from %d lockspace %x",
f45307d395da7a Alexander Aring 2022-08-15  5008  			  hd->h_cmd, nodeid, le32_to_cpu(hd->u.h_lockspace));
578acf9a87a875 Alexander Aring 2024-04-02  5009  	read_unlock_bh(&ls->ls_recv_active);
c36258b5925e6c David Teigland  2007-09-27  5010  
c36258b5925e6c David Teigland  2007-09-27  5011  	dlm_put_lockspace(ls);
c36258b5925e6c David Teigland  2007-09-27  5012  }
e7fd41792fc0ee David Teigland  2006-01-18  5013  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
