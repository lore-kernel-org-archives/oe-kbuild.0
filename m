Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83C1852
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Oct 2022 04:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666844256; x=1698380256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OG3FHpcLyPjKPmpj20kIeLDoHq/899gBOg23SDtul+Q=;
  b=CmmFs402xeCAedpb1pGxxAGkluOHviK5EhRiLnmeWqzotiny4ptFIYEf
   wdukcQckspLizGK2WoViHjkfd085WCQdwi+tgBhR41aNAf4jw6pFkvi0q
   tIPRXkYGthieG/EQE+pP1lPqYh67pptk4GDudbjcgKGH2VasJx4S2H063
   oVqOi3214eeT09ATcBuRqyJ+NcFDnXzqmxFQEjAU349dOFpQVqA7dmDvP
   lUEwgIw0Iee740vhqysn+L4UMhMbZptA62z/0niTyiSHe9ZfVht6CqrQo
   b3dnl7096y0LJaItpagKG7PYKpA+XfpWMDOnkwOA/JKoiuKBqWnFmXA2s
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309217114"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="309217114"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 21:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="665533090"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="665533090"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2022 21:17:35 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onuKk-0008Fl-2b;
	Thu, 27 Oct 2022 04:17:34 +0000
Date: Thu, 27 Oct 2022 12:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 61/206]
 drivers/dax/mapping.c:88:35: warning: Parameter 'entry' can be declared as
 pointer to const [constParameter]
Message-ID: <202210271218.ZJvEcSQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dax/mapping.c:88:35: warning: Parameter 'entry' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: Dan Williams <dan.j.williams@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Dan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   c2bddb77ef24391d2fb7b50c41e438b57fffeb53
commit: 4f9b304aa3299038f6bdeecbab539e5dd9774f07 [61/206] devdax: move address_space helpers to the DAX core
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4f9b304aa3299038f6bdeecbab539e5dd9774f07
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/dax/mapping.c:88:35: warning: Parameter 'entry' can be declared as pointer to const [constParameter]
   static bool dax_is_conflict(void *entry)
                                     ^
>> drivers/dax/mapping.c:378:71: warning: Parameter 'mapping' can be declared as pointer to const [constParameter]
   static void dax_disassociate_entry(void *entry, struct address_space *mapping,
                                                                         ^
--
>> fs/fs_context.c:388:39: warning: va_list 'va' used before va_start() was called. [va_list_usedBeforeStarted]
    struct va_format vaf = {.fmt = fmt, .va = &va};
                                         ^
--
>> fs/ext4/xattr.h:169:70: warning: Parameter 'save' can be declared as pointer to const [constParameter]
   static inline void ext4_write_unlock_xattr(struct inode *inode, int *save)
                                                                        ^
>> fs/ext4/ext4.h:591:2: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    CHECK_FLAG_VALUE(RESERVED);
    ^
>> fs/ext4/ext4.h:591:2: warning: Signed integer overflow for expression '1<<EXT4_INODE_RESERVED'. [integerOverflow]
    CHECK_FLAG_VALUE(RESERVED);
    ^
>> fs/ext4/ext4_jbd2.h:402:9: warning: Variable '__ensure_end' is not assigned a value. [unassignedVariable]
    return ext4_journal_ensure_credits_fn(handle, credits, credits,
           ^
>> fs/ext4/inode.c:5556:3: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
     ext4_std_error(inode->i_sb, error);
     ^
   fs/ext4/inode.c:5555:7: note: outer condition: error
    if  (error)
         ^
   fs/ext4/inode.c:5556:3: note: identical inner condition: error
     ext4_std_error(inode->i_sb, error);
     ^

vim +/entry +88 drivers/dax/mapping.c

4f9b304aa32990 Dan Williams 2022-10-14  83  
4f9b304aa32990 Dan Williams 2022-10-14  84  /*
4f9b304aa32990 Dan Williams 2022-10-14  85   * true if the entry that was found is of a smaller order than the entry
4f9b304aa32990 Dan Williams 2022-10-14  86   * we were looking for
4f9b304aa32990 Dan Williams 2022-10-14  87   */
4f9b304aa32990 Dan Williams 2022-10-14 @88  static bool dax_is_conflict(void *entry)
4f9b304aa32990 Dan Williams 2022-10-14  89  {
4f9b304aa32990 Dan Williams 2022-10-14  90  	return entry == XA_RETRY_ENTRY;
4f9b304aa32990 Dan Williams 2022-10-14  91  }
4f9b304aa32990 Dan Williams 2022-10-14  92  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
