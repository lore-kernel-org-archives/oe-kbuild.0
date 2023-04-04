Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632D62F
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Apr 2023 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680578640; x=1712114640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zT4aBkv5yEl8uABYM1cSx83WwQkfckSMi5jzoxAMIXI=;
  b=RJ2HFIYdwbzd8Nnx4D+zIBQTkfVWeyny29XZ0pT78y3syQC3MWP1p8ad
   vvfOEvvKkC3/HmRTeQoYew0wFHg4w0NIxN64YnD4Wult+19Zvt+mHdYHm
   1toZKLUxHXarW2VTTtqKVJsnoOnn5YMni2K8IIDNdLBj89uxJWDoEZgsU
   EeFvSHaBroEtxUwt/GhmOjwiIeSqkmRAKZAoFTPoNbMJ83IkcZNMXhcNi
   aP4BA3y5k0IsgriMB2UgCLl2rphl3XRoCKPpc0c4IcixPREu38chCDEEy
   1tkBizADeLHYhEzbn720Qynf1ESV0qHVjNC8NOVIsizmxQl2IP0aBmHd5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407138879"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="407138879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 20:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688727858"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="688727858"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Apr 2023 20:23:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjXH3-000P6r-2F;
	Tue, 04 Apr 2023 03:23:57 +0000
Date: Tue, 4 Apr 2023 11:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/mempolicy.c:804:2: warning: syntax error [syntaxError]
Message-ID: <202304041143.IoX77jRZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/mempolicy.c:804:2: warning: syntax error [syntaxError]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   148341f0a2f53b5e8808d093333d85170586a15d
commit: f10c2abcdac4a44795fae9118eaedfe56204afda mempolicy: convert to vma iterator
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f10c2abcdac4a44795fae9118eaedfe56204afda
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304041143.IoX77jRZ-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/mempolicy.c:804:2: warning: syntax error [syntaxError]
    do {
    ^

vim +804 mm/mempolicy.c

8d34694c1abf29 KOSAKI Motohiro    2012-10-08  785  
^1da177e4c3f41 Linus Torvalds     2005-04-16  786  /* Step 2: apply policy to a range and do splits. */
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  787  static int mbind_range(struct mm_struct *mm, unsigned long start,
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  788  		       unsigned long end, struct mempolicy *new_pol)
^1da177e4c3f41 Linus Torvalds     2005-04-16  789  {
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  790  	VMA_ITERATOR(vmi, mm, start);
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  791  	struct vm_area_struct *prev;
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  792  	struct vm_area_struct *vma;
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  793  	int err = 0;
e26a51148f3ebd KOSAKI Motohiro    2011-12-28  794  	pgoff_t pgoff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  795  
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  796  	prev = vma_prev(&vmi);
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  797  	vma = vma_find(&vmi, end);
7329e3ebe3594b Liam Howlett       2022-10-15  798  	if (WARN_ON(!vma))
7329e3ebe3594b Liam Howlett       2022-10-15  799  		return 0;
7329e3ebe3594b Liam Howlett       2022-10-15  800  
7329e3ebe3594b Liam Howlett       2022-10-15  801  	if (start > vma->vm_start)
7329e3ebe3594b Liam Howlett       2022-10-15  802  		prev = vma;
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  803  
f10c2abcdac4a4 Liam R. Howlett    2023-01-20 @804  	do {
66850be55e8e5f Liam R. Howlett    2022-09-06  805  		unsigned long vmstart = max(start, vma->vm_start);
66850be55e8e5f Liam R. Howlett    2022-09-06  806  		unsigned long vmend = min(end, vma->vm_end);
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  807  
e26a51148f3ebd KOSAKI Motohiro    2011-12-28  808  		if (mpol_equal(vma_policy(vma), new_pol))
66850be55e8e5f Liam R. Howlett    2022-09-06  809  			goto next;
e26a51148f3ebd KOSAKI Motohiro    2011-12-28  810  
e26a51148f3ebd KOSAKI Motohiro    2011-12-28  811  		pgoff = vma->vm_pgoff +
e26a51148f3ebd KOSAKI Motohiro    2011-12-28  812  			((vmstart - vma->vm_start) >> PAGE_SHIFT);
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  813  		prev = vmi_vma_merge(&vmi, mm, prev, vmstart, vmend, vma->vm_flags,
e26a51148f3ebd KOSAKI Motohiro    2011-12-28  814  				 vma->anon_vma, vma->vm_file, pgoff,
9a10064f5625d5 Colin Cross        2022-01-14  815  				 new_pol, vma->vm_userfaultfd_ctx,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  816  				 anon_vma_name(vma));
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  817  		if (prev) {
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  818  			vma = prev;
3964acd0dbec12 Oleg Nesterov      2013-07-31  819  			goto replace;
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  820  		}
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  821  		if (vma->vm_start != vmstart) {
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  822  			err = vmi_split_vma(&vmi, vma->vm_mm, vma, vmstart, 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  823  			if (err)
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  824  				goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  825  		}
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  826  		if (vma->vm_end != vmend) {
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  827  			err = vmi_split_vma(&vmi, vma->vm_mm, vma, vmend, 0);
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  828  			if (err)
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  829  				goto out;
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  830  		}
3964acd0dbec12 Oleg Nesterov      2013-07-31  831  replace:
869833f2c5c6e4 KOSAKI Motohiro    2012-10-08  832  		err = vma_replace_policy(vma, new_pol);
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  833  		if (err)
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  834  			goto out;
66850be55e8e5f Liam R. Howlett    2022-09-06  835  next:
66850be55e8e5f Liam R. Howlett    2022-09-06  836  		prev = vma;
f10c2abcdac4a4 Liam R. Howlett    2023-01-20  837  	} for_each_vma_range(vmi, vma, end);
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  838  
9d8cebd4bcd7c3 KOSAKI Motohiro    2010-03-05  839  out:
^1da177e4c3f41 Linus Torvalds     2005-04-16  840  	return err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  841  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  842  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
