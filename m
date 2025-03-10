Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9DBD2FB
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741569050; cv=none; b=p9NUYr2tFM/o52898uJv/oJfHETQnh1Id1mz3FeBN//J3y9ZtfgceqG4KF/rvnjAUnw03jvROGxpku3QKtlE+b5tVBUrIeArEuXk4lkRXxjdUM97a9S5ZP84zJPPs3fSiPgo+vMu0TGL7dbbi1Z9he3NM016aiofQE/Riu/WrEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741569050; c=relaxed/simple;
	bh=Hs4pdOZ2z8h17GwDk0zCIp/U6ArvUPydEk6WFh2CFVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bceU84w6qTQ+3xvF2Q5v5WSItPRX3U7qVDL5kkps80s1aDo1BM3d1jTyIRyxERXTmZjp95Z4hWUr5d3fZ1ikzO4WSAgLyuRGaGLPypzhk7P7xy5kQjSqOE94NJaNcHidPKnezXSbqfWgcNfIBxTfYXolRWOTBlsjdxK0f7SK8kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OocZG41r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OocZG41r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741569048; x=1773105048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hs4pdOZ2z8h17GwDk0zCIp/U6ArvUPydEk6WFh2CFVA=;
  b=OocZG41rjFAERUa5AMMYgpBmnjAtx+YA0XBhXX4PBjTBRGxOEwdJQ9Al
   Yc5VJLmHeNS8wfEXVEgjxw4gdHJxCAxAut4IxFyNmU2fhKPVMx/GpUJTP
   KtGgBYcdPpuvjtYx233WJUHOjwRAs6eWA4jxEM1ghVckSO3UKPjbX8Njh
   1GOeqe41hamBiV1KYR9l6vR+qHPfvbM+7pPv+x/QqqvGpx2m6n0ERgrDY
   QFUOtXgArT/4/LyCDU8BQ1Zk73prIQdLLh5mslwmjx62IF7xXVa2KFJ7k
   b61IhEucZDs/P60kPGmv4krGE2dWNmjkiZP2ujCjutG1rpA1xkL0TuP7r
   g==;
X-CSE-ConnectionGUID: PBVnKOQNT/Sw/GhL8ANXWA==
X-CSE-MsgGUID: 4WkkCCBqTRWsgxLt5PphnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53928802"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53928802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 18:10:47 -0700
X-CSE-ConnectionGUID: uzdmyRjnTUKQTkbJbenJXw==
X-CSE-MsgGUID: TFdsKT6ERLOyLuhJTka5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119837681"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2025 18:10:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trRfH-0003fo-2D;
	Mon, 10 Mar 2025 01:10:43 +0000
Date: Mon, 10 Mar 2025 09:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/6] Audit: Add record for multiple object contexts
Message-ID: <202503100802.Dqju4qc5-lkp@intel.com>
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
In-Reply-To: <20250307183701.16970-7-casey@schaufler-ca.com>
References: <20250307183701.16970-7-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>
TO: casey@schaufler-ca.com
TO: paul@paul-moore.com
TO: eparis@redhat.com
TO: linux-security-module@vger.kernel.org
TO: audit@vger.kernel.org
CC: jmorris@namei.org
CC: serge@hallyn.com
CC: keescook@chromium.org
CC: john.johansen@canonical.com
CC: penguin-kernel@i-love.sakura.ne.jp
CC: stephen.smalley.work@gmail.com
CC: linux-kernel@vger.kernel.org
CC: selinux@vger.kernel.org

Hi Casey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-selinux/next]
[also build test WARNING on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/Audit-Create-audit_stamp-structure/20250308-024950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20250307183701.16970-7-casey%40schaufler-ca.com
patch subject: [PATCH v2 6/6] Audit: Add record for multiple object contexts
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r073-20250309 (https://download.01.org/0day-ci/archive/20250310/202503100802.Dqju4qc5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503100802.Dqju4qc5-lkp@intel.com/

smatch warnings:
kernel/auditsc.c:1753 audit_log_exit() warn: if statement not indented

vim +1753 kernel/auditsc.c

5bd2182d58e9d9 Paul Moore         2021-02-16  1651  
2a1fe215e7300c Paul Moore         2018-11-26  1652  static void audit_log_exit(void)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1653  {
9c7aa6aa74fa8a Steve Grubb        2006-03-31  1654  	int i, call_panic = 0;
2a1fe215e7300c Paul Moore         2018-11-26  1655  	struct audit_context *context = audit_context();
^1da177e4c3f41 Linus Torvalds     2005-04-16  1656  	struct audit_buffer *ab;
7551ced334ce6e David Woodhouse    2005-05-26  1657  	struct audit_aux_data *aux;
5195d8e217a786 Eric Paris         2012-01-03  1658  	struct audit_names *n;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1659  
2a1fe215e7300c Paul Moore         2018-11-26  1660  	context->personality = current->personality;
e495149b173d8e Al Viro            2006-03-29  1661  
12c5e81d3fd0a6 Paul Moore         2021-02-16  1662  	switch (context->context) {
12c5e81d3fd0a6 Paul Moore         2021-02-16  1663  	case AUDIT_CTX_SYSCALL:
e495149b173d8e Al Viro            2006-03-29  1664  		ab = audit_log_start(context, GFP_KERNEL, AUDIT_SYSCALL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1665  		if (!ab)
12c5e81d3fd0a6 Paul Moore         2021-02-16  1666  			return;
bccf6ae083318e David Woodhouse    2005-05-23  1667  		audit_log_format(ab, "arch=%x syscall=%d",
bccf6ae083318e David Woodhouse    2005-05-23  1668  				 context->arch, context->major);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1669  		if (context->personality != PER_LINUX)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1670  			audit_log_format(ab, " per=%lx", context->personality);
ba59eae7238572 Alex Shi           2020-11-06  1671  		if (context->return_valid != AUDITSC_INVALID)
2fd6f58ba6efc8 David Woodhouse    2005-04-29  1672  			audit_log_format(ab, " success=%s exit=%ld",
89282beaf75d81 Thorsten Blum      2024-10-18  1673  					 str_yes_no(context->return_valid ==
89282beaf75d81 Thorsten Blum      2024-10-18  1674  						    AUDITSC_SUCCESS),
2fd6f58ba6efc8 David Woodhouse    2005-04-29  1675  					 context->return_code);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1676  		audit_log_format(ab,
e23eb920b0f397 Peter Moody        2012-06-14  1677  				 " a0=%lx a1=%lx a2=%lx a3=%lx items=%d",
^1da177e4c3f41 Linus Torvalds     2005-04-16  1678  				 context->argv[0],
^1da177e4c3f41 Linus Torvalds     2005-04-16  1679  				 context->argv[1],
^1da177e4c3f41 Linus Torvalds     2005-04-16  1680  				 context->argv[2],
^1da177e4c3f41 Linus Torvalds     2005-04-16  1681  				 context->argv[3],
e23eb920b0f397 Peter Moody        2012-06-14  1682  				 context->name_count);
2a1fe215e7300c Paul Moore         2018-11-26  1683  		audit_log_task_info(ab);
9d9609851003eb Eric Paris         2009-06-11  1684  		audit_log_key(ab, context->filterkey);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1685  		audit_log_end(ab);
12c5e81d3fd0a6 Paul Moore         2021-02-16  1686  		break;
5bd2182d58e9d9 Paul Moore         2021-02-16  1687  	case AUDIT_CTX_URING:
5bd2182d58e9d9 Paul Moore         2021-02-16  1688  		audit_log_uring(context);
5bd2182d58e9d9 Paul Moore         2021-02-16  1689  		break;
12c5e81d3fd0a6 Paul Moore         2021-02-16  1690  	default:
12c5e81d3fd0a6 Paul Moore         2021-02-16  1691  		BUG();
12c5e81d3fd0a6 Paul Moore         2021-02-16  1692  		break;
12c5e81d3fd0a6 Paul Moore         2021-02-16  1693  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1694  
7551ced334ce6e David Woodhouse    2005-05-26  1695  	for (aux = context->aux; aux; aux = aux->next) {
c04049939f88b2 Steve Grubb        2005-05-13  1696  
e495149b173d8e Al Viro            2006-03-29  1697  		ab = audit_log_start(context, GFP_KERNEL, aux->type);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1698  		if (!ab)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1699  			continue; /* audit_panic has been called */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1700  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1701  		switch (aux->type) {
20ca73bc792be9 George C. Wilson   2006-05-24  1702  
3fc689e96c0c90 Eric Paris         2008-11-11  1703  		case AUDIT_BPRM_FCAPS: {
3fc689e96c0c90 Eric Paris         2008-11-11  1704  			struct audit_aux_data_bprm_fcaps *axs = (void *)aux;
254c8b96c4af02 Roni Nevalainen    2021-05-05  1705  
3fc689e96c0c90 Eric Paris         2008-11-11  1706  			audit_log_format(ab, "fver=%x", axs->fcap_ver);
3fc689e96c0c90 Eric Paris         2008-11-11  1707  			audit_log_cap(ab, "fp", &axs->fcap.permitted);
3fc689e96c0c90 Eric Paris         2008-11-11  1708  			audit_log_cap(ab, "fi", &axs->fcap.inheritable);
3fc689e96c0c90 Eric Paris         2008-11-11  1709  			audit_log_format(ab, " fe=%d", axs->fcap.fE);
3fc689e96c0c90 Eric Paris         2008-11-11  1710  			audit_log_cap(ab, "old_pp", &axs->old_pcap.permitted);
3fc689e96c0c90 Eric Paris         2008-11-11  1711  			audit_log_cap(ab, "old_pi", &axs->old_pcap.inheritable);
3fc689e96c0c90 Eric Paris         2008-11-11  1712  			audit_log_cap(ab, "old_pe", &axs->old_pcap.effective);
7786f6b6dfc12d Richard Guy Briggs 2017-04-07  1713  			audit_log_cap(ab, "old_pa", &axs->old_pcap.ambient);
7786f6b6dfc12d Richard Guy Briggs 2017-04-07  1714  			audit_log_cap(ab, "pp", &axs->new_pcap.permitted);
7786f6b6dfc12d Richard Guy Briggs 2017-04-07  1715  			audit_log_cap(ab, "pi", &axs->new_pcap.inheritable);
7786f6b6dfc12d Richard Guy Briggs 2017-04-07  1716  			audit_log_cap(ab, "pe", &axs->new_pcap.effective);
7786f6b6dfc12d Richard Guy Briggs 2017-04-07  1717  			audit_log_cap(ab, "pa", &axs->new_pcap.ambient);
2fec30e245a3b4 Richard Guy Briggs 2019-01-23  1718  			audit_log_format(ab, " frootid=%d",
2fec30e245a3b4 Richard Guy Briggs 2019-01-23  1719  					 from_kuid(&init_user_ns,
2fec30e245a3b4 Richard Guy Briggs 2019-01-23  1720  						   axs->fcap.rootid));
3fc689e96c0c90 Eric Paris         2008-11-11  1721  			break; }
3fc689e96c0c90 Eric Paris         2008-11-11  1722  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1723  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1724  		audit_log_end(ab);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1725  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1726  
f3298dc4f22778 Al Viro            2008-12-10  1727  	if (context->type)
a33e6751003c5a Al Viro            2008-12-10  1728  		show_special(context, &call_panic);
f3298dc4f22778 Al Viro            2008-12-10  1729  
157cf649a735a2 Al Viro            2008-12-14  1730  	if (context->fds[0] >= 0) {
157cf649a735a2 Al Viro            2008-12-14  1731  		ab = audit_log_start(context, GFP_KERNEL, AUDIT_FD_PAIR);
157cf649a735a2 Al Viro            2008-12-14  1732  		if (ab) {
157cf649a735a2 Al Viro            2008-12-14  1733  			audit_log_format(ab, "fd0=%d fd1=%d",
157cf649a735a2 Al Viro            2008-12-14  1734  					context->fds[0], context->fds[1]);
157cf649a735a2 Al Viro            2008-12-14  1735  			audit_log_end(ab);
157cf649a735a2 Al Viro            2008-12-14  1736  		}
157cf649a735a2 Al Viro            2008-12-14  1737  	}
157cf649a735a2 Al Viro            2008-12-14  1738  
4f6b434fee2402 Al Viro            2008-12-09  1739  	if (context->sockaddr_len) {
4f6b434fee2402 Al Viro            2008-12-09  1740  		ab = audit_log_start(context, GFP_KERNEL, AUDIT_SOCKADDR);
4f6b434fee2402 Al Viro            2008-12-09  1741  		if (ab) {
4f6b434fee2402 Al Viro            2008-12-09  1742  			audit_log_format(ab, "saddr=");
4f6b434fee2402 Al Viro            2008-12-09  1743  			audit_log_n_hex(ab, (void *)context->sockaddr,
4f6b434fee2402 Al Viro            2008-12-09  1744  					context->sockaddr_len);
4f6b434fee2402 Al Viro            2008-12-09  1745  			audit_log_end(ab);
4f6b434fee2402 Al Viro            2008-12-09  1746  		}
4f6b434fee2402 Al Viro            2008-12-09  1747  	}
4f6b434fee2402 Al Viro            2008-12-09  1748  
e54dc2431d740a Amy Griffis        2007-03-29  1749  	for (aux = context->aux_pids; aux; aux = aux->next) {
e54dc2431d740a Amy Griffis        2007-03-29  1750  		struct audit_aux_data_pids *axs = (void *)aux;
e54dc2431d740a Amy Griffis        2007-03-29  1751  
e54dc2431d740a Amy Griffis        2007-03-29  1752  		for (i = 0; i < axs->pid_count; i++)
e54dc2431d740a Amy Griffis        2007-03-29 @1753  			if (audit_log_pid_context(context, axs->target_pid[i],
c2a7780efe37d0 Eric Paris         2008-01-07  1754  						  axs->target_auid[i],
c2a7780efe37d0 Eric Paris         2008-01-07  1755  						  axs->target_uid[i],
4746ec5b01ed07 Eric Paris         2008-01-08  1756  						  axs->target_sessionid[i],
13d826e564e2cc Casey Schaufler    2024-10-09  1757  						  &axs->target_ref[i],
c2a7780efe37d0 Eric Paris         2008-01-07  1758  						  axs->target_comm[i]))
e54dc2431d740a Amy Griffis        2007-03-29  1759  			call_panic = 1;
a5cb013da773a6 Al Viro            2007-03-20  1760  	}
a5cb013da773a6 Al Viro            2007-03-20  1761  
e54dc2431d740a Amy Griffis        2007-03-29  1762  	if (context->target_pid &&
e54dc2431d740a Amy Griffis        2007-03-29  1763  	    audit_log_pid_context(context, context->target_pid,
c2a7780efe37d0 Eric Paris         2008-01-07  1764  				  context->target_auid, context->target_uid,
4746ec5b01ed07 Eric Paris         2008-01-08  1765  				  context->target_sessionid,
5766a4da73fe3c Casey Schaufler    2025-03-07  1766  				  &context->target_ref,
5766a4da73fe3c Casey Schaufler    2025-03-07  1767  				  context->target_comm))
e54dc2431d740a Amy Griffis        2007-03-29  1768  		call_panic = 1;
e54dc2431d740a Amy Griffis        2007-03-29  1769  
44707fdf5938ad Jan Blunck         2008-02-14  1770  	if (context->pwd.dentry && context->pwd.mnt) {
e495149b173d8e Al Viro            2006-03-29  1771  		ab = audit_log_start(context, GFP_KERNEL, AUDIT_CWD);
8f37d47c9bf74c David Woodhouse    2005-05-27  1772  		if (ab) {
44707fdf5938ad Jan Blunck         2008-02-14  1773  			audit_log_d_path(ab, "cwd=", &context->pwd);
8f37d47c9bf74c David Woodhouse    2005-05-27  1774  			audit_log_end(ab);
8f37d47c9bf74c David Woodhouse    2005-05-27  1775  		}
8f37d47c9bf74c David Woodhouse    2005-05-27  1776  	}
8c8570fb8feef2 Dustin Kirkland    2005-11-03  1777  
5195d8e217a786 Eric Paris         2012-01-03  1778  	i = 0;
79f6530cb59e2a Jeff Layton        2013-07-08  1779  	list_for_each_entry(n, &context->names_list, list) {
79f6530cb59e2a Jeff Layton        2013-07-08  1780  		if (n->hidden)
79f6530cb59e2a Jeff Layton        2013-07-08  1781  			continue;
b24a30a7305418 Eric Paris         2013-04-30  1782  		audit_log_name(context, n, NULL, i++, &call_panic);
79f6530cb59e2a Jeff Layton        2013-07-08  1783  	}
c0641f28dcbecb Eric Paris         2008-01-07  1784  
12c5e81d3fd0a6 Paul Moore         2021-02-16  1785  	if (context->context == AUDIT_CTX_SYSCALL)
2a1fe215e7300c Paul Moore         2018-11-26  1786  		audit_log_proctitle();
3f1c82502c299d William Roberts    2014-02-11  1787  
c0641f28dcbecb Eric Paris         2008-01-07  1788  	/* Send end of event record to help user space know we are finished */
c0641f28dcbecb Eric Paris         2008-01-07  1789  	ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
c0641f28dcbecb Eric Paris         2008-01-07  1790  	if (ab)
c0641f28dcbecb Eric Paris         2008-01-07  1791  		audit_log_end(ab);
1b50eed9cac0e8 Steve Grubb        2006-04-03  1792  	if (call_panic)
12c5e81d3fd0a6 Paul Moore         2021-02-16  1793  		audit_panic("error in audit_log_exit()");
^1da177e4c3f41 Linus Torvalds     2005-04-16  1794  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1795  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
