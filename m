Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BE6FA6
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Nov 2022 17:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669052253; x=1700588253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFbPEvIy582fu34LKtQho9CF7jK8kX9XVdO5F8VPsT4=;
  b=dlGzhP+2KL09kfoRyawU66EW+F3LHAKbLC8ZAfwza30s4voJGlzmdLNV
   5YnufxgCnlYlZcH/itQ0vmnDTh3LlaGZ7Xuosg3H65JK+KI4HPLupyNaE
   DX+R5T+mVkhdpfjk1+I97Yhh6ZAK5GZlMci2o8p/y7/rXxZjcMVHn5FBO
   ZHy4al1dC7sa4EtzgixwdOebK/yZJrVVj5nKF63hb37/17i7+0NpABKsJ
   rodcz2PvJi6SchTAuosc2C+thw547nTegL9xPuJcieCb/dObeoiIL62C1
   YDMNupbhMRw7yLDgwoXwFhhBOWgCtz0kz5XqpQO59rWE5IytJtWvfi8A5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="296974904"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="296974904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 09:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886201383"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="886201383"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2022 09:37:31 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oxAja-0000df-2Q;
	Mon, 21 Nov 2022 17:37:30 +0000
Date: Tue, 22 Nov 2022 01:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/madvise.c:1438:6: warning: Redundant assignment of 'ret' to
 itself. [selfAssignment]
Message-ID: <202211220120.NoN1DywU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/madvise.c:1438:6: warning: Redundant assignment of 'ret' to itself. [selfAssignment]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Charan Teja Kalla <quic_charante@quicinc.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
commit: 5bd009c7c9a9e888077c07535dc0c70aeab242c3 mm: madvise: return correct bytes advised with process_madvise
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5bd009c7c9a9e888077c07535dc0c70aeab242c3
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/madvise.c:1438:6: warning: Redundant assignment of 'ret' to itself. [selfAssignment]
    ret = (total_len - iov_iter_count(&iter)) ? : ret;
        ^
   mm/madvise.c:123:28: warning: Parameter 'anon_name' can be declared as pointer to const [constParameter]
        struct anon_vma_name *anon_name)
                              ^

vim +/ret +1438 mm/madvise.c

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1378  
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1379  SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1380  		size_t, vlen, int, behavior, unsigned int, flags)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1381  {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1382  	ssize_t ret;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1383  	struct iovec iovstack[UIO_FASTIOV], iovec;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1384  	struct iovec *iov = iovstack;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1385  	struct iov_iter iter;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1386  	struct task_struct *task;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1387  	struct mm_struct *mm;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1388  	size_t total_len;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1389  	unsigned int f_flags;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1390  
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1391  	if (flags != 0) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1392  		ret = -EINVAL;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1393  		goto out;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1394  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1395  
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1396  	ret = import_iovec(READ, vec, vlen, ARRAY_SIZE(iovstack), &iov, &iter);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1397  	if (ret < 0)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1398  		goto out;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1399  
ee9955d61a0a77 Christian Brauner  2021-10-11  1400  	task = pidfd_get_task(pidfd, &f_flags);
ee9955d61a0a77 Christian Brauner  2021-10-11  1401  	if (IS_ERR(task)) {
ee9955d61a0a77 Christian Brauner  2021-10-11  1402  		ret = PTR_ERR(task);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1403  		goto free_iov;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1404  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1405  
a68a0262abdaa2 Minchan Kim        2020-12-08  1406  	if (!process_madvise_behavior_valid(behavior)) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1407  		ret = -EINVAL;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1408  		goto release_task;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1409  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1410  
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1411  	/* Require PTRACE_MODE_READ to avoid leaking ASLR metadata. */
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1412  	mm = mm_access(task, PTRACE_MODE_READ_FSCREDS);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1413  	if (IS_ERR_OR_NULL(mm)) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1414  		ret = IS_ERR(mm) ? PTR_ERR(mm) : -ESRCH;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1415  		goto release_task;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1416  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1417  
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1418  	/*
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1419  	 * Require CAP_SYS_NICE for influencing process performance. Note that
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1420  	 * only non-destructive hints are currently supported.
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1421  	 */
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1422  	if (!capable(CAP_SYS_NICE)) {
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1423  		ret = -EPERM;
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1424  		goto release_mm;
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1425  	}
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1426  
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1427  	total_len = iov_iter_count(&iter);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1428  
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1429  	while (iov_iter_count(&iter)) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1430  		iovec = iov_iter_iovec(&iter);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1431  		ret = do_madvise(mm, (unsigned long)iovec.iov_base,
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1432  					iovec.iov_len, behavior);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1433  		if (ret < 0)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1434  			break;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1435  		iov_iter_advance(&iter, iovec.iov_len);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1436  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1437  
5bd009c7c9a9e8 Charan Teja Kalla  2022-03-22 @1438  	ret = (total_len - iov_iter_count(&iter)) ? : ret;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
