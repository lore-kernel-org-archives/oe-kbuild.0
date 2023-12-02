Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4127EC3
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Dec 2023 01:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIGmys9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701482010; x=1733018010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eD2JRD1+MUljkv2i2yHy5muvmr2zMmbpxi2xxVp1JS0=;
  b=MIGmys9ntoNSVnZQ909ZsmZFyAd+0FPe9+dy9euy1ueCE8KUM+ceXzfl
   Z7c7gR+M9vJks8KqatKMvZdjejKFnUCjQlEzV29L4HEsQZbrut9H0Bad2
   gWBxTXQXWz9RfpVUS4i8yc6YG5akl9WYDZ7OYUo/2ffX3hFbaYJwsec0Z
   px2JgcF7x7odL9iQewepotmGoZVwnsJhQAZtvOh8oPp96xHWAEMeH130M
   2b6rPSxv+T9lsCO7n6aSbkQoWJbhOxKNWd2PSZ3JoHdvJAywy2vZ6HvE/
   hcFuGlRFWXOFR3Sfuk3IzVr6zaIq62bheT8dMlhF0s0CdV/D4QLxbN2nP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="591366"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="591366"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 17:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="773616524"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="773616524"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2023 17:53:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9FC9-0004XA-0i;
	Sat, 02 Dec 2023 01:53:25 +0000
Date: Sat, 2 Dec 2023 09:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: security/commoncap.c:984:41: sparse: sparse: dubious: !x | y
Message-ID: <202312020942.iZzzEUVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: security/commoncap.c:984:41: sparse: sparse: dubious: !x | y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Lutomirski <luto@kernel.org>
CC: Christoph Lameter <cl@linux-foundation.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 58319057b7847667f0c9585b9de0e8932b0fdb08 capabilities: ambient capabilities
date:   8 years ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 years ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231202/202312020942.iZzzEUVT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312020942.iZzzEUVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020942.iZzzEUVT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/commoncap.c:984:41: sparse: sparse: dubious: !x | y
   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from security/commoncap.c:12:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:424:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     424 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   In file included from include/linux/capability.h:15,
                    from security/commoncap.c:10:
   security/commoncap.c: In function 'cap_prctl_drop':
   include/uapi/linux/capability.h:357:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     357 | #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
         |                           ^~
   security/commoncap.c:870:14: note: in expansion of macro 'cap_valid'
     870 |         if (!cap_valid(cap))
         |              ^~~~~~~~~
   security/commoncap.c: In function 'cap_task_prctl':
   include/uapi/linux/capability.h:357:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     357 | #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
         |                           ^~
   security/commoncap.c:900:22: note: in expansion of macro 'cap_valid'
     900 |                 if (!cap_valid(arg2))
         |                      ^~~~~~~~~
   include/uapi/linux/capability.h:357:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     357 | #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
         |                           ^~
   security/commoncap.c:984:24: note: in expansion of macro 'cap_valid'
     984 |                 if (((!cap_valid(arg3)) | arg4 | arg5))
         |                        ^~~~~~~~~
   security/commoncap.c:73: warning: Function parameter or member 'targ_ns' not described in 'cap_capable'
   security/commoncap.c:73: warning: Excess function parameter 'ns' description in 'cap_capable'
   security/commoncap.c:843: warning: expecting prototype for cap_task_ioprio(). Prototype was for cap_task_setioprio() instead
   security/commoncap.c:856: warning: expecting prototype for cap_task_ioprio(). Prototype was for cap_task_setnice() instead
   security/commoncap.c:894: warning: Function parameter or member 'arg2' not described in 'cap_task_prctl'
   security/commoncap.c:894: warning: Function parameter or member 'arg3' not described in 'cap_task_prctl'
   security/commoncap.c:894: warning: Function parameter or member 'arg4' not described in 'cap_task_prctl'
   security/commoncap.c:894: warning: Function parameter or member 'arg5' not described in 'cap_task_prctl'

vim +984 security/commoncap.c

3898b1b4ebff8d Andrew G. Morgan  2008-04-28   879  
1d045980e1eff4 David Howells     2008-11-14   880  /**
1d045980e1eff4 David Howells     2008-11-14   881   * cap_task_prctl - Implement process control functions for this security module
1d045980e1eff4 David Howells     2008-11-14   882   * @option: The process control function requested
1d045980e1eff4 David Howells     2008-11-14   883   * @arg2, @arg3, @arg4, @arg5: The argument data for this function
1d045980e1eff4 David Howells     2008-11-14   884   *
1d045980e1eff4 David Howells     2008-11-14   885   * Allow process control functions (sys_prctl()) to alter capabilities; may
1d045980e1eff4 David Howells     2008-11-14   886   * also deny access to other functions not otherwise implemented here.
1d045980e1eff4 David Howells     2008-11-14   887   *
1d045980e1eff4 David Howells     2008-11-14   888   * Returns 0 or +ve on success, -ENOSYS if this function is not implemented
1d045980e1eff4 David Howells     2008-11-14   889   * here, other -ve on error.  If -ENOSYS is returned, sys_prctl() and other LSM
1d045980e1eff4 David Howells     2008-11-14   890   * modules will consider performing the function.
1d045980e1eff4 David Howells     2008-11-14   891   */
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   892  int cap_task_prctl(int option, unsigned long arg2, unsigned long arg3,
d84f4f992cbd76 David Howells     2008-11-14   893  		   unsigned long arg4, unsigned long arg5)
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   894  {
6d6f3328422a3b Tetsuo Handa      2014-07-22   895  	const struct cred *old = current_cred();
d84f4f992cbd76 David Howells     2008-11-14   896  	struct cred *new;
d84f4f992cbd76 David Howells     2008-11-14   897  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   898  	switch (option) {
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   899  	case PR_CAPBSET_READ:
d84f4f992cbd76 David Howells     2008-11-14   900  		if (!cap_valid(arg2))
6d6f3328422a3b Tetsuo Handa      2014-07-22   901  			return -EINVAL;
6d6f3328422a3b Tetsuo Handa      2014-07-22   902  		return !!cap_raised(old->cap_bset, arg2);
d84f4f992cbd76 David Howells     2008-11-14   903  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   904  	case PR_CAPBSET_DROP:
6d6f3328422a3b Tetsuo Handa      2014-07-22   905  		return cap_prctl_drop(arg2);
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   906  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   907  	/*
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   908  	 * The next four prctl's remain to assist with transitioning a
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   909  	 * system from legacy UID=0 based privilege (when filesystem
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   910  	 * capabilities are not in use) to a system using filesystem
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   911  	 * capabilities only - as the POSIX.1e draft intended.
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   912  	 *
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   913  	 * Note:
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   914  	 *
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   915  	 *  PR_SET_SECUREBITS =
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   916  	 *      issecure_mask(SECURE_KEEP_CAPS_LOCKED)
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   917  	 *    | issecure_mask(SECURE_NOROOT)
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   918  	 *    | issecure_mask(SECURE_NOROOT_LOCKED)
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   919  	 *    | issecure_mask(SECURE_NO_SETUID_FIXUP)
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   920  	 *    | issecure_mask(SECURE_NO_SETUID_FIXUP_LOCKED)
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   921  	 *
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   922  	 * will ensure that the current process and all of its
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   923  	 * children will be locked into a pure
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   924  	 * capability-based-privilege environment.
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   925  	 */
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   926  	case PR_SET_SECUREBITS:
6d6f3328422a3b Tetsuo Handa      2014-07-22   927  		if ((((old->securebits & SECURE_ALL_LOCKS) >> 1)
6d6f3328422a3b Tetsuo Handa      2014-07-22   928  		     & (old->securebits ^ arg2))			/*[1]*/
6d6f3328422a3b Tetsuo Handa      2014-07-22   929  		    || ((old->securebits & SECURE_ALL_LOCKS & ~arg2))	/*[2]*/
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   930  		    || (arg2 & ~(SECURE_ALL_LOCKS | SECURE_ALL_BITS))	/*[3]*/
6a9de49115d5ff Eric Paris        2012-01-03   931  		    || (cap_capable(current_cred(),
c4a4d603796c72 Eric W. Biederman 2011-11-16   932  				    current_cred()->user_ns, CAP_SETPCAP,
3699c53c485bf0 David Howells     2009-01-06   933  				    SECURITY_CAP_AUDIT) != 0)		/*[4]*/
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   934  			/*
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   935  			 * [1] no changing of bits that are locked
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   936  			 * [2] no unlocking of locks
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   937  			 * [3] no setting of unsupported bits
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   938  			 * [4] doing anything requires privilege (go read about
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   939  			 *     the "sendmail capabilities bug")
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   940  			 */
d84f4f992cbd76 David Howells     2008-11-14   941  		    )
d84f4f992cbd76 David Howells     2008-11-14   942  			/* cannot change a locked bit */
6d6f3328422a3b Tetsuo Handa      2014-07-22   943  			return -EPERM;
6d6f3328422a3b Tetsuo Handa      2014-07-22   944  
6d6f3328422a3b Tetsuo Handa      2014-07-22   945  		new = prepare_creds();
6d6f3328422a3b Tetsuo Handa      2014-07-22   946  		if (!new)
6d6f3328422a3b Tetsuo Handa      2014-07-22   947  			return -ENOMEM;
d84f4f992cbd76 David Howells     2008-11-14   948  		new->securebits = arg2;
6d6f3328422a3b Tetsuo Handa      2014-07-22   949  		return commit_creds(new);
d84f4f992cbd76 David Howells     2008-11-14   950  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   951  	case PR_GET_SECUREBITS:
6d6f3328422a3b Tetsuo Handa      2014-07-22   952  		return old->securebits;
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   953  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   954  	case PR_GET_KEEPCAPS:
6d6f3328422a3b Tetsuo Handa      2014-07-22   955  		return !!issecure(SECURE_KEEP_CAPS);
d84f4f992cbd76 David Howells     2008-11-14   956  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   957  	case PR_SET_KEEPCAPS:
d84f4f992cbd76 David Howells     2008-11-14   958  		if (arg2 > 1) /* Note, we rely on arg2 being unsigned here */
6d6f3328422a3b Tetsuo Handa      2014-07-22   959  			return -EINVAL;
d84f4f992cbd76 David Howells     2008-11-14   960  		if (issecure(SECURE_KEEP_CAPS_LOCKED))
6d6f3328422a3b Tetsuo Handa      2014-07-22   961  			return -EPERM;
6d6f3328422a3b Tetsuo Handa      2014-07-22   962  
6d6f3328422a3b Tetsuo Handa      2014-07-22   963  		new = prepare_creds();
6d6f3328422a3b Tetsuo Handa      2014-07-22   964  		if (!new)
6d6f3328422a3b Tetsuo Handa      2014-07-22   965  			return -ENOMEM;
d84f4f992cbd76 David Howells     2008-11-14   966  		if (arg2)
d84f4f992cbd76 David Howells     2008-11-14   967  			new->securebits |= issecure_mask(SECURE_KEEP_CAPS);
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   968  		else
d84f4f992cbd76 David Howells     2008-11-14   969  			new->securebits &= ~issecure_mask(SECURE_KEEP_CAPS);
6d6f3328422a3b Tetsuo Handa      2014-07-22   970  		return commit_creds(new);
3898b1b4ebff8d Andrew G. Morgan  2008-04-28   971  
58319057b78476 Andy Lutomirski   2015-09-04   972  	case PR_CAP_AMBIENT:
58319057b78476 Andy Lutomirski   2015-09-04   973  		if (arg2 == PR_CAP_AMBIENT_CLEAR_ALL) {
58319057b78476 Andy Lutomirski   2015-09-04   974  			if (arg3 | arg4 | arg5)
58319057b78476 Andy Lutomirski   2015-09-04   975  				return -EINVAL;
58319057b78476 Andy Lutomirski   2015-09-04   976  
58319057b78476 Andy Lutomirski   2015-09-04   977  			new = prepare_creds();
58319057b78476 Andy Lutomirski   2015-09-04   978  			if (!new)
58319057b78476 Andy Lutomirski   2015-09-04   979  				return -ENOMEM;
58319057b78476 Andy Lutomirski   2015-09-04   980  			cap_clear(new->cap_ambient);
58319057b78476 Andy Lutomirski   2015-09-04   981  			return commit_creds(new);
58319057b78476 Andy Lutomirski   2015-09-04   982  		}
58319057b78476 Andy Lutomirski   2015-09-04   983  
58319057b78476 Andy Lutomirski   2015-09-04  @984  		if (((!cap_valid(arg3)) | arg4 | arg5))
58319057b78476 Andy Lutomirski   2015-09-04   985  			return -EINVAL;
58319057b78476 Andy Lutomirski   2015-09-04   986  
58319057b78476 Andy Lutomirski   2015-09-04   987  		if (arg2 == PR_CAP_AMBIENT_IS_SET) {
58319057b78476 Andy Lutomirski   2015-09-04   988  			return !!cap_raised(current_cred()->cap_ambient, arg3);
58319057b78476 Andy Lutomirski   2015-09-04   989  		} else if (arg2 != PR_CAP_AMBIENT_RAISE &&
58319057b78476 Andy Lutomirski   2015-09-04   990  			   arg2 != PR_CAP_AMBIENT_LOWER) {
58319057b78476 Andy Lutomirski   2015-09-04   991  			return -EINVAL;
58319057b78476 Andy Lutomirski   2015-09-04   992  		} else {
58319057b78476 Andy Lutomirski   2015-09-04   993  			if (arg2 == PR_CAP_AMBIENT_RAISE &&
58319057b78476 Andy Lutomirski   2015-09-04   994  			    (!cap_raised(current_cred()->cap_permitted, arg3) ||
58319057b78476 Andy Lutomirski   2015-09-04   995  			     !cap_raised(current_cred()->cap_inheritable,
58319057b78476 Andy Lutomirski   2015-09-04   996  					 arg3)))
58319057b78476 Andy Lutomirski   2015-09-04   997  				return -EPERM;
58319057b78476 Andy Lutomirski   2015-09-04   998  
58319057b78476 Andy Lutomirski   2015-09-04   999  			new = prepare_creds();
58319057b78476 Andy Lutomirski   2015-09-04  1000  			if (!new)
58319057b78476 Andy Lutomirski   2015-09-04  1001  				return -ENOMEM;
58319057b78476 Andy Lutomirski   2015-09-04  1002  			if (arg2 == PR_CAP_AMBIENT_RAISE)
58319057b78476 Andy Lutomirski   2015-09-04  1003  				cap_raise(new->cap_ambient, arg3);
58319057b78476 Andy Lutomirski   2015-09-04  1004  			else
58319057b78476 Andy Lutomirski   2015-09-04  1005  				cap_lower(new->cap_ambient, arg3);
58319057b78476 Andy Lutomirski   2015-09-04  1006  			return commit_creds(new);
58319057b78476 Andy Lutomirski   2015-09-04  1007  		}
58319057b78476 Andy Lutomirski   2015-09-04  1008  
3898b1b4ebff8d Andrew G. Morgan  2008-04-28  1009  	default:
3898b1b4ebff8d Andrew G. Morgan  2008-04-28  1010  		/* No functionality available - continue with default */
6d6f3328422a3b Tetsuo Handa      2014-07-22  1011  		return -ENOSYS;
3898b1b4ebff8d Andrew G. Morgan  2008-04-28  1012  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1013  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1014  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
