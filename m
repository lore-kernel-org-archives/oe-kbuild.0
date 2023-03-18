Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B47C
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679099848; x=1710635848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJ22aSaBXZ3NImVwaixjIs7xR636sLeKbvNw1hIfMVc=;
  b=Eal5lQO+rE1/aDS38qQe4vu4o3nfwRAFyldT2Wt3Od9KVMNwsoA1LsDA
   EZcfgS7r07yw87BdpkW3epcqBAmAEkY61rQWSVSf45yPA81KggrB27hRX
   tawprhu7jhAFC7aIDuBr0eifTt3beqDkOiOm9Lg3agan4h9l9Snu28nNr
   uoGSQhgM5Ml+DDbw8y70761e79mYWWOXwZ5UDuwVXgbEmKCGDjRanb0WZ
   uwU7yWDDoSRywdUAwt6HeNL9hxpzIGAfPfbkt2uiC7+Y5D6NRbnWhWqi0
   iGJTCddTHPla1eqjwHJqMv5vk3PR/pdnUtJLwSsYLtuk6gmtUzP5tfHSJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337096993"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337096993"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 17:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="804298902"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="804298902"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Mar 2023 17:37:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdKZZ-0009gn-2Q;
	Sat, 18 Mar 2023 00:37:25 +0000
Date: Sat, 18 Mar 2023 08:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cel:topic-rpc-with-tls-upcall 7/20]
 include/linux/fortify-string.h:63:33: warning: use of NULL 'str' where
 non-null expected [CWE-476]
Message-ID: <202303180848.RjzP787J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/fortify-string.h:63:33: warning: use of NULL 'str' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   12050f1a9e648a9a557c8e5b1c635a2af6a29202
commit: 29aac75ee9d33d88511d1452d6b14bcf94734589 [7/20] SUNRPC: Add RPC client support for the RPC_AUTH_TLS auth flavor
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-c001-20230313 (https://download.01.org/0day-ci/archive/20230318/202303180848.RjzP787J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=29aac75ee9d33d88511d1452d6b14bcf94734589
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 29aac75ee9d33d88511d1452d6b14bcf94734589
        # save the config file
        make ARCH=i386 KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        make ARCH=i386 KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303180848.RjzP787J-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:254,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/sunrpc/auth_tls.c:10:
   include/linux/fortify-string.h: In function 'tls_validate':
>> include/linux/fortify-string.h:63:33: warning: use of NULL 'str' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      63 | #define __underlying_memcmp     __builtin_memcmp
         |                                 ^
   include/linux/fortify-string.h:665:16: note: in expansion of macro '__underlying_memcmp'
     665 |         return __underlying_memcmp(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'tls_validate': events 1-6
       |
       |net/sunrpc/auth_tls.c:67:12:
       |   67 | static int tls_validate(struct rpc_task *task, struct xdr_stream *xdr)
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'tls_validate'
       |......
       |   73 |         if (!p)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'p' is non-NULL)...
       |   74 |                 return -EIO;
       |   75 |         if (*p != rpc_auth_null)
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (4) following 'false' branch...
       |      |         (3) ...to here
       |   76 |                 return -EIO;
       |   77 |         if (xdr_stream_decode_opaque_inline(xdr, &str, starttls_len) != starttls_len)
       |      |         ~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |   |
       |      |         |   (6) calling 'xdr_stream_decode_opaque_inline' from 'tls_validate'
       |      |         (5) ...to here
       |
       +--> 'xdr_stream_decode_opaque_inline': event 7
              |
              |include/linux/sunrpc/xdr.h:739:1:
              |  739 | xdr_stream_decode_opaque_inline(struct xdr_stream *xdr, void **ptr, size_t maxlen)
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (7) entry to 'xdr_stream_decode_opaque_inline'
              |
            'xdr_stream_decode_opaque_inline': event 8
              |
              |  744 |         *ptr = NULL;
              |
       <------+
       |
     'tls_validate': events 9-12
       |
       |net/sunrpc/auth_tls.c:77:13:
       |   77 |         if (xdr_stream_decode_opaque_inline(xdr, &str, starttls_len) != starttls_len)
       |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            ||
       |      |            |(9) returning to 'tls_validate' from 'xdr_stream_decode_opaque_inline'
       |      |            (10) following 'false' branch...
       |   78 |                 return -EIO;
       |   79 |         if (memcmp(str, starttls_token, starttls_len))
       |      |         ~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |   |
       |      |         |   (12) 'str' is NULL
       |      |         (11) ...to here
       |
     'tls_validate': events 13-14
       |
       |include/linux/fortify-string.h:663:12:
       |  663 |         if (p_size < size || q_size < size)
       |      |            ^
       |      |            |
       |      |            (13) following 'false' branch...
       |  664 |                 fortify_panic(__func__);
       |  665 |         return __underlying_memcmp(p, q, size);
       |      |         ~~~~~~
       |      |         |
       |      |         (14) ...to here
       |
     'tls_validate': event 15
       |
       |   63 | #define __underlying_memcmp     __builtin_memcmp
       |      |                                 ^
       |      |                                 |
       |      |                                 (15) argument 1 ('str') NULL where non-null expected
   include/linux/fortify-string.h:665:16: note: in expansion of macro '__underlying_memcmp'
       |  665 |         return __underlying_memcmp(p, q, size);
       |      |                ^~~~~~~~~~~~~~~~~~~
       |
   <built-in>: note: argument 1 of '__builtin_memcmp' must be non-null

vim +/str +63 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24 @63  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25  65  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25  68  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
a28a6e860c6cf2 Francis Laniel      2021-02-25  70  

:::::: The code at line 63 was first introduced by commit
:::::: 78a498c3a227f2ac773a8234b2ce092a4403f2c3 x86: fortify: kmsan: fix KMSAN fortify builds

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
