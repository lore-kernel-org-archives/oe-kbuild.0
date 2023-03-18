Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384662F46
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679156571; x=1710692571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m05FBVaGGHX9vBTMN99MUiB1zEdAJINUsuVbNQlhGCI=;
  b=id2yX/ghpgyoNYkiU+FThZuS88cuiHIekSsY8VLKBF6KBRlkjTYy92ta
   +62SHjuIJYIoPtDx6o6LAsE0Udcs22C4wGDSbR8ww9eSpRstPGefUE7Si
   pFNk2jdjLboGeRCP3Qyr3bXo+kesHVZigT5EhnldozaUCm05A63xNKKOZ
   1wPBw9/D2ELXJf8SaLzvRFs1wpY3teYZs6zo5gY7BvvZIjHxO9/ySgd0c
   h06YE5xNmArlyu5P8lkpgQ5FyIJ/OnvyG6qTrTxLq/qeEILCmOxitmi1O
   Nw5j1LJdW/XQ6KU+pVrSzkFBJyQ9XrFImpUsv/q1uj83OUEGeDxhlCPEL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="322293080"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322293080"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 09:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="657892318"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="657892318"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 09:22:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdZKS-000A9e-1o;
	Sat, 18 Mar 2023 16:22:48 +0000
Date: Sun, 19 Mar 2023 00:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cel:topic-rpc-with-tls-upcall 7/20] net/sunrpc/auth_tls.c:79:13:
 warning: use of NULL 'str' where non-null expected [CWE-476]
Message-ID: <202303190021.HVMuukbX-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: net/sunrpc/auth_tls.c:79:13: warning: use of NULL 'str' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   12050f1a9e648a9a557c8e5b1c635a2af6a29202
commit: 29aac75ee9d33d88511d1452d6b14bcf94734589 [7/20] SUNRPC: Add RPC client support for the RPC_AUTH_TLS auth flavor
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20230316 (https://download.01.org/0day-ci/archive/20230319/202303190021.HVMuukbX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=29aac75ee9d33d88511d1452d6b14bcf94734589
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 29aac75ee9d33d88511d1452d6b14bcf94734589
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190021.HVMuukbX-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/sunrpc/sched.h:19,
                    from include/linux/sunrpc/clnt.h:20,
                    from net/sunrpc/auth_tls.c:11:
   include/linux/sunrpc/xdr.h: In function 'xdr_stream_decode_opaque_inline':
   include/linux/sunrpc/xdr.h:742:15: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     742 |         __u32 len;
         |               ^~~
     'xdr_stream_decode_opaque_inline': event 1
       |
       |  742 |         __u32 len;
       |      |               ^~~
       |      |               |
       |      |               (1) use of uninitialized value '<unknown>' here
       |
   net/sunrpc/auth_tls.c: In function 'tls_validate':
>> net/sunrpc/auth_tls.c:79:13: warning: use of NULL 'str' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      79 |         if (memcmp(str, starttls_token, starttls_len))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'tls_validate': events 1-6
       |
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
     'tls_validate': events 9-13
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
       |      |         |   (13) argument 1 ('str') NULL where non-null expected
       |      |         (11) ...to here
       |
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from net/sunrpc/auth_tls.c:10:
   include/linux/string.h:156:12: note: argument 1 of 'memcmp' must be non-null
     156 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^~~~~~

vim +/str +79 net/sunrpc/auth_tls.c

29aac75ee9d33d Chuck Lever 2022-04-22  66  
29aac75ee9d33d Chuck Lever 2022-04-22  67  static int tls_validate(struct rpc_task *task, struct xdr_stream *xdr)
29aac75ee9d33d Chuck Lever 2022-04-22  68  {
29aac75ee9d33d Chuck Lever 2022-04-22  69  	__be32 *p;
29aac75ee9d33d Chuck Lever 2022-04-22  70  	void *str;
29aac75ee9d33d Chuck Lever 2022-04-22  71  
29aac75ee9d33d Chuck Lever 2022-04-22  72  	p = xdr_inline_decode(xdr, XDR_UNIT);
29aac75ee9d33d Chuck Lever 2022-04-22  73  	if (!p)
29aac75ee9d33d Chuck Lever 2022-04-22  74  		return -EIO;
29aac75ee9d33d Chuck Lever 2022-04-22  75  	if (*p != rpc_auth_null)
29aac75ee9d33d Chuck Lever 2022-04-22  76  		return -EIO;
29aac75ee9d33d Chuck Lever 2022-04-22  77  	if (xdr_stream_decode_opaque_inline(xdr, &str, starttls_len) != starttls_len)
29aac75ee9d33d Chuck Lever 2022-04-22  78  		return -EIO;
29aac75ee9d33d Chuck Lever 2022-04-22 @79  	if (memcmp(str, starttls_token, starttls_len))
29aac75ee9d33d Chuck Lever 2022-04-22  80  		return -EIO;
29aac75ee9d33d Chuck Lever 2022-04-22  81  	return 0;
29aac75ee9d33d Chuck Lever 2022-04-22  82  }
29aac75ee9d33d Chuck Lever 2022-04-22  83  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
