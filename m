Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982704964F
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 03:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787628373; cv=none; b=juVCA3iDsVEQHKnkyFmvoXimxphnDlV+SYv1JeKd6+gdIREnkSITPuw4ymQZexP6OErxruoASTL1aaMJXRuhFQCrgeWedUyCQ2bB1UkZv228jliPGxnsaT+SG2vV1oVhCvOph/IeCC5AkRF4hfS63RmWbqPqluwcN4faCfh6BXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787628373; c=relaxed/simple;
	bh=wFSoLlhCn86bepTDbOOYaiy//NhtsUF4TLlfj2ZoyA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIRZqucExdh2oc9oET63ELnhW7MkGL4muGQe8cLCPXppJBlF6HchPIzguqTgWdQbpYX4VxKEyZtF+CztgndcGcMbUcQiSjmF6Vdk0iCRVHr7wJimTPuUo1VAqEPI5TX0kq4DDN0kwUJT+r9jEiRZ5wJEZl1ECLhszShaLcrisPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKdASZLb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKdASZLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787628370; x=1819164370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFSoLlhCn86bepTDbOOYaiy//NhtsUF4TLlfj2ZoyA4=;
  b=lKdASZLb9JCvyJJXIyXhaPQRKwDb5B7W4KzAdrIK+RxUQf1xUNy65vw1
   MDfnM260GfenqVRe4BhcLr/HOCGf/wI62CihD5/9+yjSjqKhCmUvjEdqf
   V+MUeJGTFnUkoszTRzJNrfviKOot87nvFiji5IU0N8ub4S6TWjntKUEUn
   UTLm8swyLCMABoThRUGwtpWCei/gfLRwlBlxcN3iVlRtTwJmffXaVxNrO
   8qa5Wj12RltPMIt3OZ6vt8f9+m6Z2NiQfs7MhM9Mnyo9bGWFpG7wFU7ie
   ggki0sHhdMezbX0itYQFQYsXwBuAQ2VA+zX2tTWsrtzEbql3yHSzX4h62
   Q==;
X-CSE-ConnectionGUID: l+f8VqNFSKOiZNwwOvaZ0g==
X-CSE-MsgGUID: VKQQu3p1QauwQj1kW3QG/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87216044"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87216044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 20:26:10 -0700
X-CSE-ConnectionGUID: NntCvB8AQQmtZMnm0Hmx2w==
X-CSE-MsgGUID: h44BE8QnTjq4WCdSileLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265852975"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 20:26:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyhna-000000004sN-23at;
	Tue, 25 Aug 2026 03:26:06 +0000
Date: Tue, 25 Aug 2026 11:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] fs: nfsd: Fix buffer overflow in
 write_pool_threads()
Message-ID: <202608251131.Gdli1CGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260812193349.13347-1-david.laight.linux@gmail.com>
References: <20260812193349.13347-1-david.laight.linux@gmail.com>
TO: David Laight <david.laight.linux@gmail.com>
TO: Chuck Lever <chuck.lever@oracle.com>
TO: Jeff Layton <jlayton@kernel.org>
TO: NeilBrown <neil@brown.name>
TO: linux-nfs@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Greg Banks <gnb@melbourne.sgi.com>
CC: David Laight <david.laight.linux@gmail.com>
CC: Olga Kornievskaia <okorniev@redhat.com>
CC: Dai Ngo <Dai.Ngo@oracle.com>
CC: Tom Talpey <tom@talpey.com>
CC: Andrew Morton <akpm@osdl.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/fs-nfsd-Fix-buffer-overflow-in-write_pool_threads/20260812-203349
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260812193349.13347-1-david.laight.linux%40gmail.com
patch subject: [PATCH net-next] fs: nfsd: Fix buffer overflow in write_pool_threads()
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260825/202608251131.Gdli1CGM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251131.Gdli1CGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251131.Gdli1CGM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfsctl.c:533:3: error: use of undeclared identifier 'msg'; did you mean 'mesg'?
     533 |                 msg[-1] = '\n';
         |                 ^~~
         |                 mesg
   fs/nfsd/nfsctl.c:470:8: note: 'mesg' declared here
     470 |         char *mesg = buf;
         |               ^
   1 error generated.


vim +533 fs/nfsd/nfsctl.c

^1da177e4c3f415 Linus Torvalds       2005-04-16  442  
f2453978a4f2ddb Chuck Lever          2020-04-06  443  /*
364410170ab33f6 Jeff Layton          2026-02-05  444   * write_pool_threads - Set or report the configured number of threads per pool
262a09823bb07c6 Chuck Lever          2008-12-12  445   *
262a09823bb07c6 Chuck Lever          2008-12-12  446   * Input:
262a09823bb07c6 Chuck Lever          2008-12-12  447   *			buf:		ignored
262a09823bb07c6 Chuck Lever          2008-12-12  448   *			size:		zero
262a09823bb07c6 Chuck Lever          2008-12-12  449   *
262a09823bb07c6 Chuck Lever          2008-12-12  450   * OR
262a09823bb07c6 Chuck Lever          2008-12-12  451   *
262a09823bb07c6 Chuck Lever          2008-12-12  452   * Input:
262a09823bb07c6 Chuck Lever          2008-12-12  453   *			buf:		C string containing whitespace-
262a09823bb07c6 Chuck Lever          2008-12-12  454   *					separated unsigned integer values
262a09823bb07c6 Chuck Lever          2008-12-12  455   *					representing the number of NFSD
262a09823bb07c6 Chuck Lever          2008-12-12  456   *					threads to start in each pool
262a09823bb07c6 Chuck Lever          2008-12-12  457   *			size:		non-zero length of C string in @buf
262a09823bb07c6 Chuck Lever          2008-12-12  458   * Output:
262a09823bb07c6 Chuck Lever          2008-12-12  459   *	On success:	passed-in buffer filled with '\n'-terminated C
262a09823bb07c6 Chuck Lever          2008-12-12  460   *			string containing integer values representing the
364410170ab33f6 Jeff Layton          2026-02-05  461   *			configured number of NFSD threads in each pool;
262a09823bb07c6 Chuck Lever          2008-12-12  462   *			return code is the size in bytes of the string
262a09823bb07c6 Chuck Lever          2008-12-12  463   *	On error:	return code is zero or a negative errno value
262a09823bb07c6 Chuck Lever          2008-12-12  464   */
eed2965af1bae30 Greg Banks           2006-10-02  465  static ssize_t write_pool_threads(struct file *file, char *buf, size_t size)
eed2965af1bae30 Greg Banks           2006-10-02  466  {
eed2965af1bae30 Greg Banks           2006-10-02  467  	/* if size > 0, look for an array of number of threads per node
eed2965af1bae30 Greg Banks           2006-10-02  468  	 * and apply them  then write out number of threads per node as reply
eed2965af1bae30 Greg Banks           2006-10-02  469  	 */
eed2965af1bae30 Greg Banks           2006-10-02  470  	char *mesg = buf;
eed2965af1bae30 Greg Banks           2006-10-02  471  	int i;
eed2965af1bae30 Greg Banks           2006-10-02  472  	int rv;
eed2965af1bae30 Greg Banks           2006-10-02  473  	int len;
bedbdd8bada194a NeilBrown            2008-06-10  474  	int npools;
eed2965af1bae30 Greg Banks           2006-10-02  475  	int *nthreads;
244c7d444b8bf5b Al Viro              2014-10-21  476  	struct net *net = netns(file);
eed2965af1bae30 Greg Banks           2006-10-02  477  
bedbdd8bada194a NeilBrown            2008-06-10  478  	mutex_lock(&nfsd_mutex);
9dd9845f084cda0 Stanislav Kinsbursky 2012-12-06  479  	npools = nfsd_nrpools(net);
eed2965af1bae30 Greg Banks           2006-10-02  480  	if (npools == 0) {
eed2965af1bae30 Greg Banks           2006-10-02  481  		/*
eed2965af1bae30 Greg Banks           2006-10-02  482  		 * NFS is shut down.  The admin can start it by
eed2965af1bae30 Greg Banks           2006-10-02  483  		 * writing to the threads file but NOT the pool_threads
eed2965af1bae30 Greg Banks           2006-10-02  484  		 * file, sorry.  Report zero threads.
eed2965af1bae30 Greg Banks           2006-10-02  485  		 */
bedbdd8bada194a NeilBrown            2008-06-10  486  		mutex_unlock(&nfsd_mutex);
0e77811e20d0e64 David Laight         2026-08-12  487  		return strscpy(buf, "0\n", SIMPLE_TRANSACTION_LIMIT);
eed2965af1bae30 Greg Banks           2006-10-02  488  	}
eed2965af1bae30 Greg Banks           2006-10-02  489  
bf4afc53b77aeaa Linus Torvalds       2026-02-21  490  	nthreads = kzalloc_objs(int, npools);
bedbdd8bada194a NeilBrown            2008-06-10  491  	rv = -ENOMEM;
eed2965af1bae30 Greg Banks           2006-10-02  492  	if (nthreads == NULL)
bedbdd8bada194a NeilBrown            2008-06-10  493  		goto out_free;
eed2965af1bae30 Greg Banks           2006-10-02  494  
eed2965af1bae30 Greg Banks           2006-10-02  495  	if (size > 0) {
eed2965af1bae30 Greg Banks           2006-10-02  496  		for (i = 0; i < npools; i++) {
eed2965af1bae30 Greg Banks           2006-10-02  497  			rv = get_int(&mesg, &nthreads[i]);
eed2965af1bae30 Greg Banks           2006-10-02  498  			if (rv == -ENOENT)
eed2965af1bae30 Greg Banks           2006-10-02  499  				break;		/* fewer numbers than pools */
eed2965af1bae30 Greg Banks           2006-10-02  500  			if (rv)
eed2965af1bae30 Greg Banks           2006-10-02  501  				goto out_free;	/* syntax error */
eed2965af1bae30 Greg Banks           2006-10-02  502  			rv = -EINVAL;
eed2965af1bae30 Greg Banks           2006-10-02  503  			if (nthreads[i] < 0)
eed2965af1bae30 Greg Banks           2006-10-02  504  				goto out_free;
39d432fc76301cf Chuck Lever          2023-05-15  505  			trace_nfsd_ctl_pool_threads(net, i, nthreads[i]);
eed2965af1bae30 Greg Banks           2006-10-02  506  		}
b4d8f228915f98f Jeff Layton          2024-06-13  507  
b4d8f228915f98f Jeff Layton          2024-06-13  508  		/*
b4d8f228915f98f Jeff Layton          2024-06-13  509  		 * There must always be a thread in pool 0; the admin
b4d8f228915f98f Jeff Layton          2024-06-13  510  		 * can't shut down NFS completely using pool_threads.
b4d8f228915f98f Jeff Layton          2024-06-13  511  		 */
b4d8f228915f98f Jeff Layton          2024-06-13  512  		if (nthreads[0] == 0)
b4d8f228915f98f Jeff Layton          2024-06-13  513  			nthreads[0] = 1;
b4d8f228915f98f Jeff Layton          2024-06-13  514  
3938a0d5eb5effc Stanislav Kinsbursky 2012-12-10  515  		rv = nfsd_set_nrthreads(i, nthreads, net);
eed2965af1bae30 Greg Banks           2006-10-02  516  		if (rv)
eed2965af1bae30 Greg Banks           2006-10-02  517  			goto out_free;
eed2965af1bae30 Greg Banks           2006-10-02  518  	}
eed2965af1bae30 Greg Banks           2006-10-02  519  
9dd9845f084cda0 Stanislav Kinsbursky 2012-12-06  520  	rv = nfsd_get_nrthreads(npools, nthreads, net);
eed2965af1bae30 Greg Banks           2006-10-02  521  	if (rv)
eed2965af1bae30 Greg Banks           2006-10-02  522  		goto out_free;
eed2965af1bae30 Greg Banks           2006-10-02  523  
eed2965af1bae30 Greg Banks           2006-10-02  524  	mesg = buf;
eed2965af1bae30 Greg Banks           2006-10-02  525  	size = SIMPLE_TRANSACTION_LIMIT;
0e77811e20d0e64 David Laight         2026-08-12  526  	for (i = 0; i < npools; i++) {
0e77811e20d0e64 David Laight         2026-08-12  527  		len = scnprintf(mesg, size, "%d ", nthreads[i]);
eed2965af1bae30 Greg Banks           2006-10-02  528  		size -= len;
eed2965af1bae30 Greg Banks           2006-10-02  529  		mesg += len;
eed2965af1bae30 Greg Banks           2006-10-02  530  	}
413d63d7106b914 J. Bruce Fields      2009-07-28  531  	rv = mesg - buf;
0e77811e20d0e64 David Laight         2026-08-12  532  	if (rv != SIMPLE_TRANSACTION_LIMIT - 1)
0e77811e20d0e64 David Laight         2026-08-12 @533  		msg[-1] = '\n';
eed2965af1bae30 Greg Banks           2006-10-02  534  out_free:
eed2965af1bae30 Greg Banks           2006-10-02  535  	kfree(nthreads);
bedbdd8bada194a NeilBrown            2008-06-10  536  	mutex_unlock(&nfsd_mutex);
eed2965af1bae30 Greg Banks           2006-10-02  537  	return rv;
eed2965af1bae30 Greg Banks           2006-10-02  538  }
eed2965af1bae30 Greg Banks           2006-10-02  539  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
