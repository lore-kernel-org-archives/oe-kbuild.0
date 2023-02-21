Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397FA8492
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 18:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677003815; x=1708539815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FSKnXC2Es6lroZV4tYMgxOROhOjWS0D3GLAAbP9aMY=;
  b=EMKuqKXx2XEZKPO7VJ/d+scTwOv+IQ8A+HvKf6CLUEdqLKKuvH3f+non
   nK8bRYYTal1fXCcNmNCXsFynD22quTLGj3Bxt4xg5Jx0buOORH2DTZFRg
   Td4Xq9XNTrnC9zHhI23Vi1PjnhZH5Db0sjj9htC3sBUI+ZCFYuwHWcD1z
   2Aaw0KO8PWNwQK04iEuMRVqtx30idy20D5M87THvnPhffrct1a0E7l4fK
   7xi7ysX0GHgqi+Si4ylATVCXUf545cDPkpKx6UcRxAkoK6R+DIqRihbug
   LhIb/bxsfEXdJKqbAG8LKVuIYZ6hC/sYBjKmtpS7LCwbNp1PgXBAMNUyR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397403727"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="397403727"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 10:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="740506802"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="740506802"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2023 10:23:33 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUXIa-00008H-17;
	Tue, 21 Feb 2023 18:23:32 +0000
Date: Wed, 22 Feb 2023 02:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [l1k:doe 19/25] lib/asn1_encoder.c:345:14: warning: Array access
 (from variable 'integer') results in a null pointer dereference
 [clang-analyzer-core.NullDereference]
Message-ID: <202302220220.UDiPAMwA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/asn1_encoder.c:345:14: warning: Array access (from variable 'integer') results in a null pointer dereference [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux doe
head:   c29365fc138584d495a12c0879b8f503ada167c7
commit: da91e966c1c5f212203b62a9f6e9049686a2321e [19/25] lib/asn1_encoder: Add a function to encode many byte integer values.
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-c004-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220220.UDiPAMwA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/l1k/linux/commit/da91e966c1c5f212203b62a9f6e9049686a2321e
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout da91e966c1c5f212203b62a9f6e9049686a2321e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302220220.UDiPAMwA-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   4 warnings generated.
   drivers/input/joystick/sidewinder.c:717:2: warning: Value stored to 'k' is never read [clang-analyzer-deadcode.DeadStores]
           k = i;
           ^   ~
   drivers/input/joystick/sidewinder.c:717:2: note: Value stored to 'k' is never read
           k = i;
           ^   ~
   drivers/input/joystick/sidewinder.c:718:2: warning: Value stored to 'l' is never read [clang-analyzer-deadcode.DeadStores]
           l = j;
           ^   ~
   drivers/input/joystick/sidewinder.c:718:2: note: Value stored to 'l' is never read
           l = j;
           ^   ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/decompress_bunzip2.c:149:51: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
                                                            ^
   lib/decompress_bunzip2.c:177:31: note: Passing the value 32 via 2nd parameter 'bits_wanted'
           bd->headerCRC = get_bits(bd, 32);
                                        ^~
   lib/decompress_bunzip2.c:177:18: note: Calling 'get_bits'
           bd->headerCRC = get_bits(bd, 32);
                           ^~~~~~~~~~~~~~~~
   lib/decompress_bunzip2.c:123:9: note: Assuming 'bits_wanted' is <= field 'inbufBitCount'
           while (bd->inbufBitCount < bits_wanted) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/decompress_bunzip2.c:123:2: note: Loop condition is false. Execution continues on line 148
           while (bd->inbufBitCount < bits_wanted) {
           ^
   lib/decompress_bunzip2.c:149:51: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int'
           bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
                                                            ^  ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> lib/asn1_encoder.c:345:14: warning: Array access (from variable 'integer') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                   int byte = integer[i];
                              ^~~~~~~
   lib/asn1_encoder.c:328:11: note: Assuming 'tag' is <= 30
           if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
                    ^
   include/asm-generic/bug.h:174:25: note: expanded from macro 'WARN'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   lib/asn1_encoder.c:328:6: note: Taking false branch
           if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
               ^
   include/asm-generic/bug.h:175:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   lib/asn1_encoder.c:328:2: note: Taking false branch
           if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
           ^
   lib/asn1_encoder.c:331:6: note: Assuming 'integer' is null
           if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))
               ^~~~~~~~
   lib/asn1_encoder.c:331:6: note: Left side of '&&' is true
   lib/asn1_encoder.c:331:23: note: Assuming 'len' is <= 127
           if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))
                                ^
   include/asm-generic/bug.h:174:25: note: expanded from macro 'WARN'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   lib/asn1_encoder.c:331:18: note: Taking false branch
           if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))
                           ^
   include/asm-generic/bug.h:175:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   lib/asn1_encoder.c:331:2: note: Taking false branch
           if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))
           ^
   lib/asn1_encoder.c:334:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   lib/asn1_encoder.c:337:6: note: Assuming 'data_len' is >= 3
           if (data_len < 3)
               ^~~~~~~~~~~~
   lib/asn1_encoder.c:337:2: note: Taking false branch
           if (data_len < 3)
           ^
   lib/asn1_encoder.c:344:14: note: Assuming 'i' is < 'len'
           for (i = 0; i < len; i++) {
                       ^~~~~~~
   lib/asn1_encoder.c:344:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < len; i++) {
           ^
   lib/asn1_encoder.c:345:14: note: Array access (from variable 'integer') results in a null pointer dereference
                   int byte = integer[i];
                              ^~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   block/blk-mq.c:1064:28: warning: Access to field 'queue' results in a dereference of a null pointer (loaded from variable 'hctx') [clang-analyzer-core.NullDereference]

vim +/integer +345 lib/asn1_encoder.c

b07067627cd5f1 James Bottomley  2021-01-27  317  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  318  unsigned char *
da91e966c1c5f2 Jonathan Cameron 2022-09-06  319  asn1_encode_integer_large_positive(unsigned char *data,
da91e966c1c5f2 Jonathan Cameron 2022-09-06  320  				   const unsigned char *end_data, u32 tag,
da91e966c1c5f2 Jonathan Cameron 2022-09-06  321  				   const unsigned char *integer, int len)
da91e966c1c5f2 Jonathan Cameron 2022-09-06  322  {
da91e966c1c5f2 Jonathan Cameron 2022-09-06  323  	int data_len = end_data - data;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  324  	unsigned char *d = &data[2];
da91e966c1c5f2 Jonathan Cameron 2022-09-06  325  	bool found = false;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  326  	int i;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  327  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  328  	if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
da91e966c1c5f2 Jonathan Cameron 2022-09-06  329  		return ERR_PTR(-EINVAL);
da91e966c1c5f2 Jonathan Cameron 2022-09-06  330  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  331  	if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))
da91e966c1c5f2 Jonathan Cameron 2022-09-06  332  		return ERR_PTR(-EINVAL);
da91e966c1c5f2 Jonathan Cameron 2022-09-06  333  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  334  	if (IS_ERR(data))
da91e966c1c5f2 Jonathan Cameron 2022-09-06  335  		return data;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  336  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  337  	if (data_len < 3)
da91e966c1c5f2 Jonathan Cameron 2022-09-06  338  		return ERR_PTR(-EINVAL);
da91e966c1c5f2 Jonathan Cameron 2022-09-06  339  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  340  	data[0] = _tagn(UNIV, PRIM, tag);
da91e966c1c5f2 Jonathan Cameron 2022-09-06  341  	/* Leave space for length */
da91e966c1c5f2 Jonathan Cameron 2022-09-06  342  	data_len -= 2;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  343  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  344  	for (i = 0; i < len; i++) {
da91e966c1c5f2 Jonathan Cameron 2022-09-06 @345  		int byte = integer[i];
da91e966c1c5f2 Jonathan Cameron 2022-09-06  346  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  347  		if (!found && byte == 0)
da91e966c1c5f2 Jonathan Cameron 2022-09-06  348  			continue;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  349  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  350  		/*
da91e966c1c5f2 Jonathan Cameron 2022-09-06  351  		 * as per encode_integer
da91e966c1c5f2 Jonathan Cameron 2022-09-06  352  		 */
da91e966c1c5f2 Jonathan Cameron 2022-09-06  353  		if (!found && (byte & 0x80)) {
da91e966c1c5f2 Jonathan Cameron 2022-09-06  354  			*d++ = 0;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  355  			data_len--;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  356  		}
da91e966c1c5f2 Jonathan Cameron 2022-09-06  357  		found = true;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  358  		if (data_len == 0)
da91e966c1c5f2 Jonathan Cameron 2022-09-06  359  			return ERR_PTR(-EINVAL);
da91e966c1c5f2 Jonathan Cameron 2022-09-06  360  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  361  		*d++ = byte;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  362  		data_len--;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  363  	}
da91e966c1c5f2 Jonathan Cameron 2022-09-06  364  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  365  	data[1] = d - data - 2;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  366  
da91e966c1c5f2 Jonathan Cameron 2022-09-06  367  	return d;
da91e966c1c5f2 Jonathan Cameron 2022-09-06  368  }
da91e966c1c5f2 Jonathan Cameron 2022-09-06  369  EXPORT_SYMBOL_GPL(asn1_encode_integer_large_positive);
da91e966c1c5f2 Jonathan Cameron 2022-09-06  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
