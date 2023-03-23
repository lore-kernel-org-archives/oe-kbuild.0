Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081AC17CA
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679539089; x=1711075089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+IvM45Pm938vp3P6cRvz1c6t25nNN2jLeI/er635bAo=;
  b=aZTO7FJL0FY/Lm6BCBvlTmoeq8hkc5w+y6idXWjs+KdqZcg1R5OKWx00
   TsSt/cfNl37UmW9kT//H+cZORPTd8jRcDLr3/UlB5HvQG8VoJM9i8RWEm
   yfFweIJJq9NYMjmi4ZZMGvcwTe2vfYm29+YZUeMScAqdBHbOZjZMuOymu
   R3oswyds+3oZM0+xu2elzszNu3MOYQ7vbZJ44yLzPnY1XoTyhkoUutPo2
   RGTj9GIy94r+zDdvcK1m7UcKmkD4QUgS9bUaU/5i1CIUNXLIJXMEHKaMD
   1pcQEe2CQOfKF1W4w7fqU/TQ8Mec47jqK7XVf+B5GoE6hAnUBhtWzn1gl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319771463"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319771463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 19:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="928061885"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="928061885"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 19:38:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfAq5-000Drw-0I;
	Thu, 23 Mar 2023 02:38:05 +0000
Date: Thu, 23 Mar 2023 10:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/shstk 24/40] mm/gup.c:981 check_vma_flags() warn: bitwise
 AND condition is false here
Message-ID: <202303231034.6vLxTnU6-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   b642e9e5f0dc797f543b431d4ba910a3da72a074
commit: 75818f575af6d20c96ac42fd8fc59020ed24f331 [24/40] mm: Don't allow write GUPs to shadow stack memory
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230323/202303231034.6vLxTnU6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303231034.6vLxTnU6-lkp@intel.com/

smatch warnings:
mm/gup.c:981 check_vma_flags() warn: bitwise AND condition is false here

vim +981 mm/gup.c

1674448345cdb5 Kirill A. Shutemov 2014-06-04   961  
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   962  static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   963  {
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   964  	vm_flags_t vm_flags = vma->vm_flags;
1b2ee1266ea647 Dave Hansen        2016-02-12   965  	int write = (gup_flags & FOLL_WRITE);
1b2ee1266ea647 Dave Hansen        2016-02-12   966  	int foreign = (gup_flags & FOLL_REMOTE);
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   967  
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   968  	if (vm_flags & (VM_IO | VM_PFNMAP))
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   969  		return -EFAULT;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   970  
7f7ccc2ccc2e70 Willy Tarreau      2018-05-11   971  	if (gup_flags & FOLL_ANON && !vma_is_anonymous(vma))
7f7ccc2ccc2e70 Willy Tarreau      2018-05-11   972  		return -EFAULT;
7f7ccc2ccc2e70 Willy Tarreau      2018-05-11   973  
52650c8b466bac Jason Gunthorpe    2020-12-14   974  	if ((gup_flags & FOLL_LONGTERM) && vma_is_fsdax(vma))
52650c8b466bac Jason Gunthorpe    2020-12-14   975  		return -EOPNOTSUPP;
52650c8b466bac Jason Gunthorpe    2020-12-14   976  
1507f51255c9ff Mike Rapoport      2021-07-07   977  	if (vma_is_secretmem(vma))
1507f51255c9ff Mike Rapoport      2021-07-07   978  		return -EFAULT;
1507f51255c9ff Mike Rapoport      2021-07-07   979  
1b2ee1266ea647 Dave Hansen        2016-02-12   980  	if (write) {
75818f575af6d2 Rick Edgecombe     2023-03-18  @981  		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   982  			if (!(gup_flags & FOLL_FORCE))
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   983  				return -EFAULT;
f347454d034184 David Hildenbrand  2022-10-31   984  			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
f347454d034184 David Hildenbrand  2022-10-31   985  			if (is_vm_hugetlb_page(vma))
f347454d034184 David Hildenbrand  2022-10-31   986  				return -EFAULT;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   987  			/*
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   988  			 * We used to let the write,force case do COW in a
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   989  			 * VM_MAYWRITE VM_SHARED !VM_WRITE vma, so ptrace could
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   990  			 * set a breakpoint in a read-only mapping of an
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   991  			 * executable, without corrupting the file (yet only
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   992  			 * when that file had been opened for writing!).
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   993  			 * Anon pages in shared mappings are surprising: now
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   994  			 * just reject it.
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   995  			 */
46435364742779 Hugh Dickins       2016-01-30   996  			if (!is_cow_mapping(vm_flags))
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   997  				return -EFAULT;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   998  		}
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04   999  	} else if (!(vm_flags & VM_READ)) {
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1000  		if (!(gup_flags & FOLL_FORCE))
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1001  			return -EFAULT;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1002  		/*
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1003  		 * Is there actually any vma we can reach here which does not
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1004  		 * have VM_MAYREAD set?
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1005  		 */
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1006  		if (!(vm_flags & VM_MAYREAD))
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1007  			return -EFAULT;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1008  	}
d61172b4b695b8 Dave Hansen        2016-02-12  1009  	/*
d61172b4b695b8 Dave Hansen        2016-02-12  1010  	 * gups are always data accesses, not instruction
d61172b4b695b8 Dave Hansen        2016-02-12  1011  	 * fetches, so execute=false here
d61172b4b695b8 Dave Hansen        2016-02-12  1012  	 */
d61172b4b695b8 Dave Hansen        2016-02-12  1013  	if (!arch_vma_access_permitted(vma, write, false, foreign))
33a709b25a760b Dave Hansen        2016-02-12  1014  		return -EFAULT;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1015  	return 0;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1016  }
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
