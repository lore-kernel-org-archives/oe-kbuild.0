Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AA837C
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678938921; x=1710474921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpL810yR6iYGk9ktABebZJ1V4KbFZZguO8sqyqfbO1k=;
  b=FW/xS5F4rY5vtJf1isSYd3Sk75LN9VaRVkHLTqeOdRGlf+bBSAP/c091
   BzEUL5QMCELU7g85bwAmJ+j+ik5Na2/1WIGheoUxET3QR174gdqdG69uy
   TFtyNtAxLxtlqlyfykkajgWDWivrjujAMxLCvWDWHOt9adChemEhEXloI
   yq+/w9+T8pdHGiqFd3uO5SEF2LqVPsdtHWirkCWZIzZv+vveIqsEVQgYg
   CLQyzurv8Em59uijOHaAQiw0VG65XepZ2ioR4cjqcSJmjzU8n7JClrrj6
   L0OyD0yyE4318ToPEf6sPNbSLPwXKa3o2HaqqPKCeK4GYuF/hKFIMTRI3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336575866"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="336575866"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 20:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1009069594"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="1009069594"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 20:55:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcehz-0008Hh-0h;
	Thu, 16 Mar 2023 03:55:19 +0000
Date: Thu, 16 Mar 2023 11:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: io_uring/rsrc.c:1076:34: warning: Parameter 'hpage' can be declared
 as pointer to const [constParameter]
Message-ID: <202303161145.O4qGg32s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/rsrc.c:1076:34: warning: Parameter 'hpage' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c1bec9c0b08abeac72ed6214b723adc224013bf
commit: 73572984481907d92673255b494c0ff4f77c8ed4 io_uring: move rsrc related data, core, and commands
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 73572984481907d92673255b494c0ff4f77c8ed4
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303161145.O4qGg32s-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/mincore.c:198:17: warning: Local variable 'pages' shadows outer argument [shadowArgument]
     unsigned long pages = DIV_ROUND_UP(end - addr, PAGE_SIZE);
                   ^
   mm/mincore.c:187:58: note: Shadowed declaration
   static long do_mincore(unsigned long addr, unsigned long pages, unsigned char *vec)
                                                            ^
   mm/mincore.c:198:17: note: Shadow variable
     unsigned long pages = DIV_ROUND_UP(end - addr, PAGE_SIZE);
                   ^
--
>> io_uring/rsrc.c:1076:34: warning: Parameter 'hpage' can be declared as pointer to const [constParameter]
         int nr_pages, struct page *hpage)
                                    ^
>> lib/zstd/decompress/zstd_decompress.c:1784:49: warning: Parameter 'oend' can be declared as pointer to const [constParameter]
               ZSTD_DStream* zds, char** op, char* oend,
                                                   ^
>> lib/zstd/decompress/huf_decompress.c:302:71: warning: Parameter 'pEnd' can be declared as pointer to const [constParameter]
   HUF_decodeStreamX1(BYTE* p, BIT_DStream_t* const bitDPtr, BYTE* const pEnd, const HUF_DEltX1* const dt, const U32 dtLog)
                                                                         ^
>> kernel/bpf/syscall.c:3143:12: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
>> kernel/bpf/syscall.c:2206:28: warning: Parameter 'attach_type' can be declared as pointer to const [constParameter]
          enum bpf_prog_type *attach_type, bool attach_drv)
                              ^
>> kernel/bpf/syscall.c:2286:19: warning: Parameter 'attach_btf' can be declared as pointer to const [constParameter]
         struct btf *attach_btf, u32 btf_id,
                     ^
>> kernel/bpf/syscall.c:2287:24: warning: Parameter 'dst_prog' can be declared as pointer to const [constParameter]
         struct bpf_prog *dst_prog)
                          ^

vim +/hpage +1076 io_uring/rsrc.c

73572984481907 Jens Axboe 2022-06-13  1065  
73572984481907 Jens Axboe 2022-06-13  1066  /*
73572984481907 Jens Axboe 2022-06-13  1067   * Not super efficient, but this is just a registration time. And we do cache
73572984481907 Jens Axboe 2022-06-13  1068   * the last compound head, so generally we'll only do a full search if we don't
73572984481907 Jens Axboe 2022-06-13  1069   * match that one.
73572984481907 Jens Axboe 2022-06-13  1070   *
73572984481907 Jens Axboe 2022-06-13  1071   * We check if the given compound head page has already been accounted, to
73572984481907 Jens Axboe 2022-06-13  1072   * avoid double accounting it. This allows us to account the full size of the
73572984481907 Jens Axboe 2022-06-13  1073   * page, not just the constituent pages of a huge page.
73572984481907 Jens Axboe 2022-06-13  1074   */
73572984481907 Jens Axboe 2022-06-13  1075  static bool headpage_already_acct(struct io_ring_ctx *ctx, struct page **pages,
73572984481907 Jens Axboe 2022-06-13 @1076  				  int nr_pages, struct page *hpage)
73572984481907 Jens Axboe 2022-06-13  1077  {
73572984481907 Jens Axboe 2022-06-13  1078  	int i, j;
73572984481907 Jens Axboe 2022-06-13  1079  
73572984481907 Jens Axboe 2022-06-13  1080  	/* check current page array */
73572984481907 Jens Axboe 2022-06-13  1081  	for (i = 0; i < nr_pages; i++) {
73572984481907 Jens Axboe 2022-06-13  1082  		if (!PageCompound(pages[i]))
73572984481907 Jens Axboe 2022-06-13  1083  			continue;
73572984481907 Jens Axboe 2022-06-13  1084  		if (compound_head(pages[i]) == hpage)
73572984481907 Jens Axboe 2022-06-13  1085  			return true;
73572984481907 Jens Axboe 2022-06-13  1086  	}
73572984481907 Jens Axboe 2022-06-13  1087  
73572984481907 Jens Axboe 2022-06-13  1088  	/* check previously registered pages */
73572984481907 Jens Axboe 2022-06-13  1089  	for (i = 0; i < ctx->nr_user_bufs; i++) {
73572984481907 Jens Axboe 2022-06-13  1090  		struct io_mapped_ubuf *imu = ctx->user_bufs[i];
73572984481907 Jens Axboe 2022-06-13  1091  
73572984481907 Jens Axboe 2022-06-13  1092  		for (j = 0; j < imu->nr_bvecs; j++) {
73572984481907 Jens Axboe 2022-06-13  1093  			if (!PageCompound(imu->bvec[j].bv_page))
73572984481907 Jens Axboe 2022-06-13  1094  				continue;
73572984481907 Jens Axboe 2022-06-13  1095  			if (compound_head(imu->bvec[j].bv_page) == hpage)
73572984481907 Jens Axboe 2022-06-13  1096  				return true;
73572984481907 Jens Axboe 2022-06-13  1097  		}
73572984481907 Jens Axboe 2022-06-13  1098  	}
73572984481907 Jens Axboe 2022-06-13  1099  
73572984481907 Jens Axboe 2022-06-13  1100  	return false;
73572984481907 Jens Axboe 2022-06-13  1101  }
73572984481907 Jens Axboe 2022-06-13  1102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
