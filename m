Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C38483
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 04:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695961273; x=1727497273;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AVoqNQBGvZAREO20wM8t1REcp2E0R8Pc2M12NEcl8AU=;
  b=KQ2RgtYcn9DkhaTeK5JDnlUWzBGHGYSDKVH3Da066h7UWk5J+Q2iN8yK
   8VsRWUxpxQ5UA0pSGxWsBKviHC0LBzmzyVMRjnWUivv/7W5qG75XOtcqJ
   UO+ThnsfNlh/KSs5DRd1DCZ8wIKU8II44f2da6Y8rpKGUZokEE1AYfCCU
   5Q1FD7lMY9Rowzuet51Y9eM94b9c31I3MckLYv2IomvL9tzFgTKKbAw1a
   97QBM9H+V4BYi1vW617ZmRCRr5Z418pMhdqTV1H0x488EpDJF/BoTKdB4
   EFmhNV1f5wuTbQ6v/QA+nCF169uFpRhseSn5cUjamhYvE5zgjy2+043Sk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385050370"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="385050370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753258307"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="753258307"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2023 21:21:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm4zz-0002Sh-1r;
	Fri, 29 Sep 2023 04:21:07 +0000
Date: Fri, 29 Sep 2023 12:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4849/8507] lib/test_bpf.c:5119:25: sparse:
 sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes
 deadbeef)
Message-ID: <202309291222.b5ga5Zzb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Puranjay Mohan <puranjay12@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   719136e5c24768ebdf80b9daa53facebbdd377c3
commit: daabb2b098e04753fa3d1b1feed13e5a61bef61c [4849/8507] bpf/tests: add tests for cpuv4 instructions
:::::: branch date: 24 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291222.b5ga5Zzb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291222.b5ga5Zzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309291222.b5ga5Zzb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/test_bpf.c:7852:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __be16 [usertype] @@
   lib/test_bpf.c:7852:25: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7852:25: sparse:     got restricted __be16 [usertype]
   lib/test_bpf.c:7866:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __be32 [usertype] @@
   lib/test_bpf.c:7866:24: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7866:24: sparse:     got restricted __be32 [usertype]
   lib/test_bpf.c:7877:25: sparse: sparse: cast from restricted __be64
   lib/test_bpf.c:7889:31: sparse: sparse: restricted __be64 degrades to integer
   lib/test_bpf.c:7901:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __be16 [usertype] @@
   lib/test_bpf.c:7901:25: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7901:25: sparse:     got restricted __be16 [usertype]
   lib/test_bpf.c:7915:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __be32 [usertype] @@
   lib/test_bpf.c:7915:24: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7915:24: sparse:     got restricted __be32 [usertype]
   lib/test_bpf.c:7926:25: sparse: sparse: cast from restricted __be64
   lib/test_bpf.c:7938:31: sparse: sparse: restricted __be64 degrades to integer
   lib/test_bpf.c:7950:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __le16 [usertype] @@
   lib/test_bpf.c:7950:24: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7950:24: sparse:     got restricted __le16 [usertype]
   lib/test_bpf.c:7964:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __le32 [usertype] @@
   lib/test_bpf.c:7964:24: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7964:24: sparse:     got restricted __le32 [usertype]
   lib/test_bpf.c:7975:25: sparse: sparse: cast from restricted __le64
   lib/test_bpf.c:7987:31: sparse: sparse: restricted __le64 degrades to integer
   lib/test_bpf.c:7999:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __le16 [usertype] @@
   lib/test_bpf.c:7999:25: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:7999:25: sparse:     got restricted __le16 [usertype]
   lib/test_bpf.c:8013:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] result @@     got restricted __le32 [usertype] @@
   lib/test_bpf.c:8013:24: sparse:     expected unsigned int [usertype] result
   lib/test_bpf.c:8013:24: sparse:     got restricted __le32 [usertype]
   lib/test_bpf.c:8024:25: sparse: sparse: cast from restricted __le64
   lib/test_bpf.c:8036:31: sparse: sparse: restricted __le64 degrades to integer
   lib/test_bpf.c:4877:25: sparse: sparse: cast truncates bits from constant value (567800001234 becomes 1234)
   lib/test_bpf.c:4888:25: sparse: sparse: cast truncates bits from constant value (1ffffffff becomes ffffffff)
   lib/test_bpf.c:4965:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5043:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5059:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
>> lib/test_bpf.c:5119:25: sparse: sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes deadbeef)
   lib/test_bpf.c:5135:25: sparse: sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes deadbeef)
   lib/test_bpf.c:5151:25: sparse: sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes deadbeef)
   lib/test_bpf.c:5168:25: sparse: sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes deadbeef)
   lib/test_bpf.c:5184:25: sparse: sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes deadbeef)
   lib/test_bpf.c:5200:25: sparse: sparse: cast truncates bits from constant value (deadbeefdeadbeef becomes deadbeef)
   lib/test_bpf.c:5282:25: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   lib/test_bpf.c:5460:25: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   lib/test_bpf.c:5770:25: sparse: sparse: cast truncates bits from constant value (fedcba987654321 becomes 87654321)
   lib/test_bpf.c:5771:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef0 becomes 9abcdef0)
   lib/test_bpf.c:5782:25: sparse: sparse: cast truncates bits from constant value (fedcba987654321 becomes 87654321)
   lib/test_bpf.c:5783:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef0 becomes 9abcdef0)
   lib/test_bpf.c:5905:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5916:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6403:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6441:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6457:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6458:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6489:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6505:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6506:25: sparse: sparse: cast truncates bits from constant value (123456780a0c0e0 becomes 80a0c0e0)
   lib/test_bpf.c:6615:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6653:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6654:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6669:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6701:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6702:25: sparse: sparse: cast truncates bits from constant value (12345678fafcfef becomes 8fafcfef)
   lib/test_bpf.c:6717:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6827:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6865:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6866:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6881:25: sparse: sparse: cast truncates bits from constant value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6882:25: sparse: sparse: cast truncates bits from constant value (ffff00000000ffff becomes ffff)
   lib/test_bpf.c:6913:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6914:25: sparse: sparse: cast truncates bits from constant value (123456786a4c2e0 becomes 86a4c2e0)
   lib/test_bpf.c:6929:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6930:25: sparse: sparse: cast truncates bits from constant value (fedcba98795b3d1f becomes 795b3d1f)
   lib/test_bpf.c:7006:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7018:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7031:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7043:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7056:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7068:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7081:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7093:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7173:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7184:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7196:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7207:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7219:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7230:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7242:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7314:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7326:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7339:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7351:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7364:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7376:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7389:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7401:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7481:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7492:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7504:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7515:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7527:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7538:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7550:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7574:25: sparse: sparse: cast truncates bits from constant value (ff00ff0000000000 becomes 0)
   lib/test_bpf.c:7586:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7598:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7611:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7623:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7636:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7648:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7661:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7673:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7709:25: sparse: sparse: cast truncates bits from constant value (ff00ff0000000000 becomes 0)
   lib/test_bpf.c:7720:25: sparse: sparse: cast truncates bits from constant value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7731:25: sparse: sparse: too many warnings

vim +5119 lib/test_bpf.c

a7d2e752e52050f Johan Almbladh     2021-09-14  3061  
a5a36544de38057 Johan Almbladh     2021-09-14  3062  
64a8946b447e418 Alexei Starovoitov 2014-05-08  3063  static struct bpf_test tests[] = {
64a8946b447e418 Alexei Starovoitov 2014-05-08  3064  	{
64a8946b447e418 Alexei Starovoitov 2014-05-08  3065  		"TAX",
ece80490e2c1cef Andrew Morton      2014-05-22  3066  		.u.insns = {
64a8946b447e418 Alexei Starovoitov 2014-05-08  3067  			BPF_STMT(BPF_LD | BPF_IMM, 1),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3068  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3069  			BPF_STMT(BPF_LD | BPF_IMM, 2),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3070  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3071  			BPF_STMT(BPF_ALU | BPF_NEG, 0), /* A == -3 */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3072  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3073  			BPF_STMT(BPF_LD | BPF_LEN, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3074  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3075  			BPF_STMT(BPF_MISC | BPF_TAX, 0), /* X == len - 3 */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3076  			BPF_STMT(BPF_LD | BPF_B | BPF_IND, 1),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3077  			BPF_STMT(BPF_RET | BPF_A, 0)
64a8946b447e418 Alexei Starovoitov 2014-05-08  3078  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3079  		CLASSIC,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3080  		{ 10, 20, 30, 40, 50 },
64a8946b447e418 Alexei Starovoitov 2014-05-08  3081  		{ { 2, 10 }, { 3, 20 }, { 4, 30 } },
64a8946b447e418 Alexei Starovoitov 2014-05-08  3082  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3083  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3084  		"TXA",
ece80490e2c1cef Andrew Morton      2014-05-22  3085  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3086  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3087  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3088  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3089  			BPF_STMT(BPF_RET | BPF_A, 0) /* A == len * 2 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3090  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3091  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3092  		{ 10, 20, 30, 40, 50 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3093  		{ { 1, 2 }, { 3, 6 }, { 4, 8 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3094  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3095  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3096  		"ADD_SUB_MUL_K",
ece80490e2c1cef Andrew Morton      2014-05-22  3097  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3098  			BPF_STMT(BPF_LD | BPF_IMM, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3099  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3100  			BPF_STMT(BPF_LDX | BPF_IMM, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3101  			BPF_STMT(BPF_ALU | BPF_SUB | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3102  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 0xffffffff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3103  			BPF_STMT(BPF_ALU | BPF_MUL | BPF_K, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3104  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3105  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3106  		CLASSIC | FLAG_NO_DATA,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3107  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3108  		{ { 0, 0xfffffffd } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3109  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3110  	{
6867b17b26d80cf Denis Kirjanov     2014-12-01  3111  		"DIV_MOD_KX",
ece80490e2c1cef Andrew Morton      2014-05-22  3112  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3113  			BPF_STMT(BPF_LD | BPF_IMM, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3114  			BPF_STMT(BPF_ALU | BPF_DIV | BPF_K, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3115  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3116  			BPF_STMT(BPF_LD | BPF_IMM, 0xffffffff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3117  			BPF_STMT(BPF_ALU | BPF_DIV | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3118  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3119  			BPF_STMT(BPF_LD | BPF_IMM, 0xffffffff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3120  			BPF_STMT(BPF_ALU | BPF_DIV | BPF_K, 0x70000000),
6867b17b26d80cf Denis Kirjanov     2014-12-01  3121  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
6867b17b26d80cf Denis Kirjanov     2014-12-01  3122  			BPF_STMT(BPF_LD | BPF_IMM, 0xffffffff),
6867b17b26d80cf Denis Kirjanov     2014-12-01  3123  			BPF_STMT(BPF_ALU | BPF_MOD | BPF_X, 0),
6867b17b26d80cf Denis Kirjanov     2014-12-01  3124  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
6867b17b26d80cf Denis Kirjanov     2014-12-01  3125  			BPF_STMT(BPF_LD | BPF_IMM, 0xffffffff),
6867b17b26d80cf Denis Kirjanov     2014-12-01  3126  			BPF_STMT(BPF_ALU | BPF_MOD | BPF_K, 0x70000000),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3127  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3128  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3129  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3130  		CLASSIC | FLAG_NO_DATA,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3131  		{ },
6867b17b26d80cf Denis Kirjanov     2014-12-01  3132  		{ { 0, 0x20000000 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3133  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3134  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3135  		"AND_OR_LSH_K",
ece80490e2c1cef Andrew Morton      2014-05-22  3136  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3137  			BPF_STMT(BPF_LD | BPF_IMM, 0xff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3138  			BPF_STMT(BPF_ALU | BPF_AND | BPF_K, 0xf0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3139  			BPF_STMT(BPF_ALU | BPF_LSH | BPF_K, 27),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3140  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3141  			BPF_STMT(BPF_LD | BPF_IMM, 0xf),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3142  			BPF_STMT(BPF_ALU | BPF_OR | BPF_K, 0xf0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3143  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3144  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3145  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3146  		CLASSIC | FLAG_NO_DATA,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3147  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3148  		{ { 0, 0x800000ff }, { 1, 0x800000ff } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3149  	},
e9d9450497f77ee Chema Gonzalez     2014-05-30  3150  	{
e9d9450497f77ee Chema Gonzalez     2014-05-30  3151  		"LD_IMM_0",
e9d9450497f77ee Chema Gonzalez     2014-05-30  3152  		.u.insns = {
e9d9450497f77ee Chema Gonzalez     2014-05-30  3153  			BPF_STMT(BPF_LD | BPF_IMM, 0), /* ld #0 */
e9d9450497f77ee Chema Gonzalez     2014-05-30  3154  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0, 1, 0),
e9d9450497f77ee Chema Gonzalez     2014-05-30  3155  			BPF_STMT(BPF_RET | BPF_K, 0),
e9d9450497f77ee Chema Gonzalez     2014-05-30  3156  			BPF_STMT(BPF_RET | BPF_K, 1),
e9d9450497f77ee Chema Gonzalez     2014-05-30  3157  		},
e9d9450497f77ee Chema Gonzalez     2014-05-30  3158  		CLASSIC,
e9d9450497f77ee Chema Gonzalez     2014-05-30  3159  		{ },
e9d9450497f77ee Chema Gonzalez     2014-05-30  3160  		{ { 1, 1 } },
e9d9450497f77ee Chema Gonzalez     2014-05-30  3161  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3162  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3163  		"LD_IND",
ece80490e2c1cef Andrew Morton      2014-05-22  3164  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3165  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3166  			BPF_STMT(BPF_LD | BPF_H | BPF_IND, MAX_K),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3167  			BPF_STMT(BPF_RET | BPF_K, 1)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3168  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3169  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3170  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3171  		{ { 1, 0 }, { 10, 0 }, { 60, 0 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3172  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3173  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3174  		"LD_ABS",
ece80490e2c1cef Andrew Morton      2014-05-22  3175  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3176  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 1000),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3177  			BPF_STMT(BPF_RET | BPF_K, 1)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3178  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3179  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3180  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3181  		{ { 1, 0 }, { 10, 0 }, { 60, 0 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3182  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3183  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3184  		"LD_ABS_LL",
ece80490e2c1cef Andrew Morton      2014-05-22  3185  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3186  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, SKF_LL_OFF),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3187  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3188  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, SKF_LL_OFF + 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3189  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3190  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3191  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3192  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3193  		{ 1, 2, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3194  		{ { 1, 0 }, { 2, 3 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3195  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3196  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3197  		"LD_IND_LL",
ece80490e2c1cef Andrew Morton      2014-05-22  3198  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3199  			BPF_STMT(BPF_LD | BPF_IMM, SKF_LL_OFF - 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3200  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3201  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3202  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3203  			BPF_STMT(BPF_LD | BPF_B | BPF_IND, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3204  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3205  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3206  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3207  		{ 1, 2, 3, 0xff },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3208  		{ { 1, 1 }, { 3, 3 }, { 4, 0xff } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3209  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3210  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3211  		"LD_ABS_NET",
ece80490e2c1cef Andrew Morton      2014-05-22  3212  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3213  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, SKF_NET_OFF),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3214  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3215  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, SKF_NET_OFF + 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3216  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3217  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3218  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3219  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3220  		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3221  		{ { 15, 0 }, { 16, 3 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3222  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3223  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3224  		"LD_IND_NET",
ece80490e2c1cef Andrew Morton      2014-05-22  3225  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3226  			BPF_STMT(BPF_LD | BPF_IMM, SKF_NET_OFF - 15),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3227  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3228  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3229  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3230  			BPF_STMT(BPF_LD | BPF_B | BPF_IND, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3231  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3232  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3233  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3234  		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3235  		{ { 14, 0 }, { 15, 1 }, { 17, 3 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3236  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3237  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3238  		"LD_PKTTYPE",
ece80490e2c1cef Andrew Morton      2014-05-22  3239  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3240  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3241  				 SKF_AD_OFF + SKF_AD_PKTTYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3242  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3243  			BPF_STMT(BPF_RET | BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3244  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3245  				 SKF_AD_OFF + SKF_AD_PKTTYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3246  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3247  			BPF_STMT(BPF_RET | BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3248  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3249  				 SKF_AD_OFF + SKF_AD_PKTTYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3250  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3251  			BPF_STMT(BPF_RET | BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3252  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3253  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3254  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3255  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3256  		{ { 1, 3 }, { 10, 3 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3257  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3258  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3259  		"LD_MARK",
ece80490e2c1cef Andrew Morton      2014-05-22  3260  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3261  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3262  				 SKF_AD_OFF + SKF_AD_MARK),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3263  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3264  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3265  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3266  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3267  		{ { 1, SKB_MARK}, { 10, SKB_MARK} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3268  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3269  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3270  		"LD_RXHASH",
ece80490e2c1cef Andrew Morton      2014-05-22  3271  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3272  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3273  				 SKF_AD_OFF + SKF_AD_RXHASH),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3274  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3275  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3276  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3277  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3278  		{ { 1, SKB_HASH}, { 10, SKB_HASH} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3279  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3280  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3281  		"LD_QUEUE",
ece80490e2c1cef Andrew Morton      2014-05-22  3282  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3283  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3284  				 SKF_AD_OFF + SKF_AD_QUEUE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3285  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3286  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3287  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3288  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3289  		{ { 1, SKB_QUEUE_MAP }, { 10, SKB_QUEUE_MAP } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3290  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3291  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3292  		"LD_PROTOCOL",
ece80490e2c1cef Andrew Morton      2014-05-22  3293  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3294  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3295  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 20, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3296  			BPF_STMT(BPF_RET | BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3297  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3298  				 SKF_AD_OFF + SKF_AD_PROTOCOL),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3299  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3300  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3301  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 30, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3302  			BPF_STMT(BPF_RET | BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3303  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3304  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3305  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3306  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3307  		{ 10, 20, 30 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3308  		{ { 10, ETH_P_IP }, { 100, ETH_P_IP } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3309  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3310  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3311  		"LD_VLAN_TAG",
ece80490e2c1cef Andrew Morton      2014-05-22  3312  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3313  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3314  				 SKF_AD_OFF + SKF_AD_VLAN_TAG),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3315  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3316  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3317  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3318  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3319  		{
0c4b2d370514cb4 Michał Mirosław    2018-11-10  3320  			{ 1, SKB_VLAN_TCI },
0c4b2d370514cb4 Michał Mirosław    2018-11-10  3321  			{ 10, SKB_VLAN_TCI }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3322  		},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3323  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3324  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3325  		"LD_VLAN_TAG_PRESENT",
ece80490e2c1cef Andrew Morton      2014-05-22  3326  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3327  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3328  				 SKF_AD_OFF + SKF_AD_VLAN_TAG_PRESENT),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3329  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3330  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3331  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3332  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3333  		{
0c4b2d370514cb4 Michał Mirosław    2018-11-10  3334  			{ 1, SKB_VLAN_PRESENT },
0c4b2d370514cb4 Michał Mirosław    2018-11-10  3335  			{ 10, SKB_VLAN_PRESENT }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3336  		},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3337  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3338  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3339  		"LD_IFINDEX",
ece80490e2c1cef Andrew Morton      2014-05-22  3340  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3341  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3342  				 SKF_AD_OFF + SKF_AD_IFINDEX),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3343  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3344  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3345  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3346  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3347  		{ { 1, SKB_DEV_IFINDEX }, { 10, SKB_DEV_IFINDEX } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3348  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3349  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3350  		"LD_HATYPE",
ece80490e2c1cef Andrew Morton      2014-05-22  3351  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3352  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3353  				 SKF_AD_OFF + SKF_AD_HATYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3354  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3355  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3356  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3357  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3358  		{ { 1, SKB_DEV_TYPE }, { 10, SKB_DEV_TYPE } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3359  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3360  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3361  		"LD_CPU",
ece80490e2c1cef Andrew Morton      2014-05-22  3362  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3363  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3364  				 SKF_AD_OFF + SKF_AD_CPU),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3365  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3366  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3367  				 SKF_AD_OFF + SKF_AD_CPU),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3368  			BPF_STMT(BPF_ALU | BPF_SUB | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3369  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3370  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3371  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3372  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3373  		{ { 1, 0 }, { 10, 0 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3374  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3375  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3376  		"LD_NLATTR",
ece80490e2c1cef Andrew Morton      2014-05-22  3377  		.u.insns = {
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3378  			BPF_STMT(BPF_LDX | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3379  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3380  			BPF_STMT(BPF_LDX | BPF_IMM, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3381  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3382  				 SKF_AD_OFF + SKF_AD_NLATTR),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3383  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3384  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3385  		CLASSIC,
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3386  #ifdef __BIG_ENDIAN
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3387  		{ 0xff, 0xff, 0, 4, 0, 2, 0, 4, 0, 3 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3388  #else
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3389  		{ 0xff, 0xff, 4, 0, 2, 0, 4, 0, 3, 0 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3390  #endif
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3391  		{ { 4, 0 }, { 20, 6 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3392  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3393  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3394  		"LD_NLATTR_NEST",
ece80490e2c1cef Andrew Morton      2014-05-22  3395  		.u.insns = {
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3396  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3397  			BPF_STMT(BPF_LDX | BPF_IMM, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3398  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3399  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3400  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3401  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3402  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3403  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3404  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3405  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3406  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3407  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3408  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3409  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3410  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3411  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3412  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3413  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3414  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3415  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3416  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3417  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3418  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3419  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3420  				 SKF_AD_OFF + SKF_AD_NLATTR_NEST),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3421  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3422  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3423  		CLASSIC,
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3424  #ifdef __BIG_ENDIAN
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3425  		{ 0xff, 0xff, 0, 12, 0, 1, 0, 4, 0, 2, 0, 4, 0, 3 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3426  #else
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3427  		{ 0xff, 0xff, 12, 0, 1, 0, 4, 0, 2, 0, 4, 0, 3, 0 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3428  #endif
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3429  		{ { 4, 0 }, { 20, 10 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3430  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3431  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3432  		"LD_PAYLOAD_OFF",
ece80490e2c1cef Andrew Morton      2014-05-22  3433  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3434  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3435  				 SKF_AD_OFF + SKF_AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3436  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3437  				 SKF_AD_OFF + SKF_AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3438  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3439  				 SKF_AD_OFF + SKF_AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3440  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3441  				 SKF_AD_OFF + SKF_AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3442  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3443  				 SKF_AD_OFF + SKF_AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3444  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3445  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3446  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3447  		/* 00:00:00:00:00:00 > 00:00:00:00:00:00, ethtype IPv4 (0x0800),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3448  		 * length 98: 127.0.0.1 > 127.0.0.1: ICMP echo request,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3449  		 * id 9737, seq 1, length 64
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3450  		 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3451  		{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3452  		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3453  		  0x08, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3454  		  0x45, 0x00, 0x00, 0x54, 0xac, 0x8b, 0x40, 0x00, 0x40,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3455  		  0x01, 0x90, 0x1b, 0x7f, 0x00, 0x00, 0x01 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3456  		{ { 30, 0 }, { 100, 42 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3457  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3458  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3459  		"LD_ANC_XOR",
ece80490e2c1cef Andrew Morton      2014-05-22  3460  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3461  			BPF_STMT(BPF_LD | BPF_IMM, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3462  			BPF_STMT(BPF_LDX | BPF_IMM, 300),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3463  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3464  				 SKF_AD_OFF + SKF_AD_ALU_XOR_X),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3465  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3466  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3467  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3468  		{ },
098454362a06029 Nathan Chancellor  2019-08-18  3469  		{ { 4, 0xA ^ 300 }, { 20, 0xA ^ 300 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3470  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3471  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3472  		"SPILL_FILL",
ece80490e2c1cef Andrew Morton      2014-05-22  3473  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3474  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3475  			BPF_STMT(BPF_LD | BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3476  			BPF_STMT(BPF_ALU | BPF_RSH, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3477  			BPF_STMT(BPF_ALU | BPF_XOR | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3478  			BPF_STMT(BPF_ST, 1), /* M1 = 1 ^ len */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3479  			BPF_STMT(BPF_ALU | BPF_XOR | BPF_K, 0x80000000),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3480  			BPF_STMT(BPF_ST, 2), /* M2 = 1 ^ len ^ 0x80000000 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3481  			BPF_STMT(BPF_STX, 15), /* M3 = len */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3482  			BPF_STMT(BPF_LDX | BPF_MEM, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3483  			BPF_STMT(BPF_LD | BPF_MEM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3484  			BPF_STMT(BPF_ALU | BPF_XOR | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3485  			BPF_STMT(BPF_LDX | BPF_MEM, 15),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3486  			BPF_STMT(BPF_ALU | BPF_XOR | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3487  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3488  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3489  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3490  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3491  		{ { 1, 0x80000001 }, { 2, 0x80000002 }, { 60, 0x80000000 ^ 60 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3492  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3493  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3494  		"JEQ",
ece80490e2c1cef Andrew Morton      2014-05-22  3495  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3496  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3497  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3498  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_X, 0, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3499  			BPF_STMT(BPF_RET | BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3500  			BPF_STMT(BPF_RET | BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3501  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3502  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3503  		{ 3, 3, 3, 3, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3504  		{ { 1, 0 }, { 3, 1 }, { 4, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3505  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3506  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3507  		"JGT",
ece80490e2c1cef Andrew Morton      2014-05-22  3508  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3509  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3510  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3511  			BPF_JUMP(BPF_JMP | BPF_JGT | BPF_X, 0, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3512  			BPF_STMT(BPF_RET | BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3513  			BPF_STMT(BPF_RET | BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3514  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3515  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3516  		{ 4, 4, 4, 3, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3517  		{ { 2, 0 }, { 3, 1 }, { 4, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3518  	},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3519  	{
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3520  		"JGE (jt 0), test 1",
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3521  		.u.insns = {
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3522  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3523  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 2),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3524  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_X, 0, 0, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3525  			BPF_STMT(BPF_RET | BPF_K, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3526  			BPF_STMT(BPF_RET | BPF_K, MAX_K)
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3527  		},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3528  		CLASSIC,
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3529  		{ 4, 4, 4, 3, 3 },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3530  		{ { 2, 0 }, { 3, 1 }, { 4, 1 } },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3531  	},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3532  	{
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3533  		"JGE (jt 0), test 2",
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3534  		.u.insns = {
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3535  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3536  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 2),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3537  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_X, 0, 0, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3538  			BPF_STMT(BPF_RET | BPF_K, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3539  			BPF_STMT(BPF_RET | BPF_K, MAX_K)
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3540  		},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3541  		CLASSIC,
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3542  		{ 4, 4, 5, 3, 3 },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3543  		{ { 4, 1 }, { 5, 1 }, { 6, MAX_K } },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3544  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3545  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3546  		"JGE",
ece80490e2c1cef Andrew Morton      2014-05-22  3547  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3548  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3549  			BPF_STMT(BPF_LD | BPF_B | BPF_IND, MAX_K),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3550  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_K, 1, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3551  			BPF_STMT(BPF_RET | BPF_K, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3552  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_K, 2, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3553  			BPF_STMT(BPF_RET | BPF_K, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3554  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_K, 3, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3555  			BPF_STMT(BPF_RET | BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3556  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_K, 4, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3557  			BPF_STMT(BPF_RET | BPF_K, 40),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3558  			BPF_STMT(BPF_RET | BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3559  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3560  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3561  		{ 1, 2, 3, 4, 5 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3562  		{ { 1, 20 }, { 3, 40 }, { 5, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3563  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3564  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3565  		"JSET",
ece80490e2c1cef Andrew Morton      2014-05-22  3566  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3567  			BPF_JUMP(BPF_JMP | BPF_JA, 0, 0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3568  			BPF_JUMP(BPF_JMP | BPF_JA, 1, 1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3569  			BPF_JUMP(BPF_JMP | BPF_JA, 0, 0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3570  			BPF_JUMP(BPF_JMP | BPF_JA, 0, 0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3571  			BPF_STMT(BPF_LDX | BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3572  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3573  			BPF_STMT(BPF_ALU | BPF_SUB | BPF_K, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3574  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3575  			BPF_STMT(BPF_LD | BPF_W | BPF_IND, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3576  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 1, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3577  			BPF_STMT(BPF_RET | BPF_K, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3578  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0x80000000, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3579  			BPF_STMT(BPF_RET | BPF_K, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3580  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3581  			BPF_STMT(BPF_RET | BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3582  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3583  			BPF_STMT(BPF_RET | BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3584  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3585  			BPF_STMT(BPF_RET | BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3586  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3587  			BPF_STMT(BPF_RET | BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3588  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3589  			BPF_STMT(BPF_RET | BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3590  			BPF_STMT(BPF_RET | BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3591  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3592  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3593  		{ 0, 0xAA, 0x55, 1 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3594  		{ { 4, 10 }, { 5, 20 }, { 6, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3595  	},
64a8946b447e418 Alexei Starovoitov 2014-05-08  3596  	{
64a8946b447e418 Alexei Starovoitov 2014-05-08  3597  		"tcpdump port 22",
ece80490e2c1cef Andrew Morton      2014-05-22  3598  		.u.insns = {
ce25b68b74593bb Daniel Borkmann    2014-05-26  3599  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 12),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3600  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x86dd, 0, 8), /* IPv6 */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3601  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3602  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x84, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3603  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x6, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3604  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x11, 0, 17),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3605  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 54),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3606  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 22, 14, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3607  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 56),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3608  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 22, 12, 13),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3609  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x0800, 0, 12), /* IPv4 */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3610  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 23),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3611  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x84, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3612  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x6, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3613  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x11, 0, 8),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3614  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3615  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0x1fff, 6, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3616  			BPF_STMT(BPF_LDX | BPF_B | BPF_MSH, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3617  			BPF_STMT(BPF_LD | BPF_H | BPF_IND, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3618  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 22, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3619  			BPF_STMT(BPF_LD | BPF_H | BPF_IND, 16),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3620  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 22, 0, 1),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3621  			BPF_STMT(BPF_RET | BPF_K, 0xffff),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3622  			BPF_STMT(BPF_RET | BPF_K, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3623  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3624  		CLASSIC,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3625  		/* 3c:07:54:43:e5:76 > 10:bf:48:d6:43:d6, ethertype IPv4(0x0800)
64a8946b447e418 Alexei Starovoitov 2014-05-08  3626  		 * length 114: 10.1.1.149.49700 > 10.1.2.10.22: Flags [P.],
64a8946b447e418 Alexei Starovoitov 2014-05-08  3627  		 * seq 1305692979:1305693027, ack 3650467037, win 65535,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3628  		 * options [nop,nop,TS val 2502645400 ecr 3971138], length 48
64a8946b447e418 Alexei Starovoitov 2014-05-08  3629  		 */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3630  		{ 0x10, 0xbf, 0x48, 0xd6, 0x43, 0xd6,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3631  		  0x3c, 0x07, 0x54, 0x43, 0xe5, 0x76,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3632  		  0x08, 0x00,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3633  		  0x45, 0x10, 0x00, 0x64, 0x75, 0xb5,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3634  		  0x40, 0x00, 0x40, 0x06, 0xad, 0x2e, /* IP header */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3635  		  0x0a, 0x01, 0x01, 0x95, /* ip src */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3636  		  0x0a, 0x01, 0x02, 0x0a, /* ip dst */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3637  		  0xc2, 0x24,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3638  		  0x00, 0x16 /* dst port */ },
64a8946b447e418 Alexei Starovoitov 2014-05-08  3639  		{ { 10, 0 }, { 30, 0 }, { 100, 65535 } },
64a8946b447e418 Alexei Starovoitov 2014-05-08  3640  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3641  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3642  		"tcpdump complex",
ece80490e2c1cef Andrew Morton      2014-05-22  3643  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3644  			/* tcpdump -nei eth0 'tcp port 22 and (((ip[2:2] -
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3645  			 * ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0) and
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3646  			 * (len > 115 or len < 30000000000)' -d
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3647  			 */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3648  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 12),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3649  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x86dd, 30, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3650  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x800, 0, 29),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3651  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 23),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3652  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0x6, 0, 27),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3653  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3654  			BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, 0x1fff, 25, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3655  			BPF_STMT(BPF_LDX | BPF_B | BPF_MSH, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3656  			BPF_STMT(BPF_LD | BPF_H | BPF_IND, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3657  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 22, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3658  			BPF_STMT(BPF_LD | BPF_H | BPF_IND, 16),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3659  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 22, 0, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3660  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 16),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3661  			BPF_STMT(BPF_ST, 1),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3662  			BPF_STMT(BPF_LD | BPF_B | BPF_ABS, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3663  			BPF_STMT(BPF_ALU | BPF_AND | BPF_K, 0xf),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3664  			BPF_STMT(BPF_ALU | BPF_LSH | BPF_K, 2),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3665  			BPF_STMT(BPF_MISC | BPF_TAX, 0x5), /* libpcap emits K on TAX */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3666  			BPF_STMT(BPF_LD | BPF_MEM, 1),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3667  			BPF_STMT(BPF_ALU | BPF_SUB | BPF_X, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3668  			BPF_STMT(BPF_ST, 5),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3669  			BPF_STMT(BPF_LDX | BPF_B | BPF_MSH, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3670  			BPF_STMT(BPF_LD | BPF_B | BPF_IND, 26),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3671  			BPF_STMT(BPF_ALU | BPF_AND | BPF_K, 0xf0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3672  			BPF_STMT(BPF_ALU | BPF_RSH | BPF_K, 2),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3673  			BPF_STMT(BPF_MISC | BPF_TAX, 0x9), /* libpcap emits K on TAX */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3674  			BPF_STMT(BPF_LD | BPF_MEM, 5),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3675  			BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_X, 0, 4, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3676  			BPF_STMT(BPF_LD | BPF_LEN, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3677  			BPF_JUMP(BPF_JMP | BPF_JGT | BPF_K, 0x73, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3678  			BPF_JUMP(BPF_JMP | BPF_JGE | BPF_K, 0xfc23ac00, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3679  			BPF_STMT(BPF_RET | BPF_K, 0xffff),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3680  			BPF_STMT(BPF_RET | BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3681  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3682  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3683  		{ 0x10, 0xbf, 0x48, 0xd6, 0x43, 0xd6,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3684  		  0x3c, 0x07, 0x54, 0x43, 0xe5, 0x76,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3685  		  0x08, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3686  		  0x45, 0x10, 0x00, 0x64, 0x75, 0xb5,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3687  		  0x40, 0x00, 0x40, 0x06, 0xad, 0x2e, /* IP header */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3688  		  0x0a, 0x01, 0x01, 0x95, /* ip src */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3689  		  0x0a, 0x01, 0x02, 0x0a, /* ip dst */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3690  		  0xc2, 0x24,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3691  		  0x00, 0x16 /* dst port */ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3692  		{ { 10, 0 }, { 30, 0 }, { 100, 65535 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3693  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3694  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3695  		"RET_A",
ece80490e2c1cef Andrew Morton      2014-05-22  3696  		.u.insns = {
53b0fe36ab7c6eb Zhen Lei           2021-07-07  3697  			/* check that uninitialized X and A contain zeros */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3698  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3699  			BPF_STMT(BPF_RET | BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3700  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3701  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3702  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3703  		{ {1, 0}, {2, 0} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3704  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3705  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3706  		"INT: ADD trivial",
ece80490e2c1cef Andrew Morton      2014-05-22  3707  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3708  			BPF_ALU64_IMM(BPF_MOV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3709  			BPF_ALU64_IMM(BPF_ADD, R1, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3710  			BPF_ALU64_IMM(BPF_MOV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3711  			BPF_ALU64_REG(BPF_SUB, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3712  			BPF_ALU64_IMM(BPF_ADD, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3713  			BPF_ALU64_IMM(BPF_MUL, R1, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3714  			BPF_ALU64_REG(BPF_MOV, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3715  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3716  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3717  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3718  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3719  		{ { 0, 0xfffffffd } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3720  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3721  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3722  		"INT: MUL_X",
ece80490e2c1cef Andrew Morton      2014-05-22  3723  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3724  			BPF_ALU64_IMM(BPF_MOV, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3725  			BPF_ALU64_IMM(BPF_MOV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3726  			BPF_ALU64_IMM(BPF_MOV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3727  			BPF_ALU64_REG(BPF_MUL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3728  			BPF_JMP_IMM(BPF_JEQ, R1, 0xfffffffd, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3729  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3730  			BPF_ALU64_IMM(BPF_MOV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3731  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3732  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3733  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3734  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3735  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3736  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3737  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3738  		"INT: MUL_X2",
ece80490e2c1cef Andrew Morton      2014-05-22  3739  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3740  			BPF_ALU32_IMM(BPF_MOV, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3741  			BPF_ALU32_IMM(BPF_MOV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3742  			BPF_ALU32_IMM(BPF_MOV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3743  			BPF_ALU64_REG(BPF_MUL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3744  			BPF_ALU64_IMM(BPF_RSH, R1, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3745  			BPF_JMP_IMM(BPF_JEQ, R1, 0x2ffffff, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3746  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3747  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3748  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3749  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3750  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3751  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3752  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3753  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3754  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3755  		"INT: MUL32_X",
ece80490e2c1cef Andrew Morton      2014-05-22  3756  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3757  			BPF_ALU32_IMM(BPF_MOV, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3758  			BPF_ALU64_IMM(BPF_MOV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3759  			BPF_ALU32_IMM(BPF_MOV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3760  			BPF_ALU32_REG(BPF_MUL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3761  			BPF_ALU64_IMM(BPF_RSH, R1, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3762  			BPF_JMP_IMM(BPF_JEQ, R1, 0xffffff, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3763  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3764  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3765  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3766  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3767  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3768  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3769  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3770  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3771  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3772  		/* Have to test all register combinations, since
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3773  		 * JITing of different registers will produce
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3774  		 * different asm code.
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3775  		 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3776  		"INT: ADD 64-bit",
ece80490e2c1cef Andrew Morton      2014-05-22  3777  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3778  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3779  			BPF_ALU64_IMM(BPF_MOV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3780  			BPF_ALU64_IMM(BPF_MOV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3781  			BPF_ALU64_IMM(BPF_MOV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3782  			BPF_ALU64_IMM(BPF_MOV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3783  			BPF_ALU64_IMM(BPF_MOV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3784  			BPF_ALU64_IMM(BPF_MOV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3785  			BPF_ALU64_IMM(BPF_MOV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3786  			BPF_ALU64_IMM(BPF_MOV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3787  			BPF_ALU64_IMM(BPF_MOV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3788  			BPF_ALU64_IMM(BPF_ADD, R0, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3789  			BPF_ALU64_IMM(BPF_ADD, R1, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3790  			BPF_ALU64_IMM(BPF_ADD, R2, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3791  			BPF_ALU64_IMM(BPF_ADD, R3, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3792  			BPF_ALU64_IMM(BPF_ADD, R4, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3793  			BPF_ALU64_IMM(BPF_ADD, R5, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3794  			BPF_ALU64_IMM(BPF_ADD, R6, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3795  			BPF_ALU64_IMM(BPF_ADD, R7, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3796  			BPF_ALU64_IMM(BPF_ADD, R8, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3797  			BPF_ALU64_IMM(BPF_ADD, R9, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3798  			BPF_ALU64_IMM(BPF_SUB, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3799  			BPF_ALU64_IMM(BPF_SUB, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3800  			BPF_ALU64_IMM(BPF_SUB, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3801  			BPF_ALU64_IMM(BPF_SUB, R3, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3802  			BPF_ALU64_IMM(BPF_SUB, R4, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3803  			BPF_ALU64_IMM(BPF_SUB, R5, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3804  			BPF_ALU64_IMM(BPF_SUB, R6, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3805  			BPF_ALU64_IMM(BPF_SUB, R7, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3806  			BPF_ALU64_IMM(BPF_SUB, R8, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3807  			BPF_ALU64_IMM(BPF_SUB, R9, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3808  			BPF_ALU64_REG(BPF_ADD, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3809  			BPF_ALU64_REG(BPF_ADD, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3810  			BPF_ALU64_REG(BPF_ADD, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3811  			BPF_ALU64_REG(BPF_ADD, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3812  			BPF_ALU64_REG(BPF_ADD, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3813  			BPF_ALU64_REG(BPF_ADD, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3814  			BPF_ALU64_REG(BPF_ADD, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3815  			BPF_ALU64_REG(BPF_ADD, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3816  			BPF_ALU64_REG(BPF_ADD, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3817  			BPF_ALU64_REG(BPF_ADD, R0, R9), /* R0 == 155 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3818  			BPF_JMP_IMM(BPF_JEQ, R0, 155, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3819  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3820  			BPF_ALU64_REG(BPF_ADD, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3821  			BPF_ALU64_REG(BPF_ADD, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3822  			BPF_ALU64_REG(BPF_ADD, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3823  			BPF_ALU64_REG(BPF_ADD, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3824  			BPF_ALU64_REG(BPF_ADD, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3825  			BPF_ALU64_REG(BPF_ADD, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3826  			BPF_ALU64_REG(BPF_ADD, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3827  			BPF_ALU64_REG(BPF_ADD, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3828  			BPF_ALU64_REG(BPF_ADD, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3829  			BPF_ALU64_REG(BPF_ADD, R1, R9), /* R1 == 456 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3830  			BPF_JMP_IMM(BPF_JEQ, R1, 456, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3831  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3832  			BPF_ALU64_REG(BPF_ADD, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3833  			BPF_ALU64_REG(BPF_ADD, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3834  			BPF_ALU64_REG(BPF_ADD, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3835  			BPF_ALU64_REG(BPF_ADD, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3836  			BPF_ALU64_REG(BPF_ADD, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3837  			BPF_ALU64_REG(BPF_ADD, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3838  			BPF_ALU64_REG(BPF_ADD, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3839  			BPF_ALU64_REG(BPF_ADD, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3840  			BPF_ALU64_REG(BPF_ADD, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3841  			BPF_ALU64_REG(BPF_ADD, R2, R9), /* R2 == 1358 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3842  			BPF_JMP_IMM(BPF_JEQ, R2, 1358, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3843  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3844  			BPF_ALU64_REG(BPF_ADD, R3, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3845  			BPF_ALU64_REG(BPF_ADD, R3, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3846  			BPF_ALU64_REG(BPF_ADD, R3, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3847  			BPF_ALU64_REG(BPF_ADD, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3848  			BPF_ALU64_REG(BPF_ADD, R3, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3849  			BPF_ALU64_REG(BPF_ADD, R3, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3850  			BPF_ALU64_REG(BPF_ADD, R3, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3851  			BPF_ALU64_REG(BPF_ADD, R3, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3852  			BPF_ALU64_REG(BPF_ADD, R3, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3853  			BPF_ALU64_REG(BPF_ADD, R3, R9), /* R3 == 4063 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3854  			BPF_JMP_IMM(BPF_JEQ, R3, 4063, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3855  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3856  			BPF_ALU64_REG(BPF_ADD, R4, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3857  			BPF_ALU64_REG(BPF_ADD, R4, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3858  			BPF_ALU64_REG(BPF_ADD, R4, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3859  			BPF_ALU64_REG(BPF_ADD, R4, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3860  			BPF_ALU64_REG(BPF_ADD, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3861  			BPF_ALU64_REG(BPF_ADD, R4, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3862  			BPF_ALU64_REG(BPF_ADD, R4, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3863  			BPF_ALU64_REG(BPF_ADD, R4, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3864  			BPF_ALU64_REG(BPF_ADD, R4, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3865  			BPF_ALU64_REG(BPF_ADD, R4, R9), /* R4 == 12177 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3866  			BPF_JMP_IMM(BPF_JEQ, R4, 12177, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3867  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3868  			BPF_ALU64_REG(BPF_ADD, R5, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3869  			BPF_ALU64_REG(BPF_ADD, R5, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3870  			BPF_ALU64_REG(BPF_ADD, R5, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3871  			BPF_ALU64_REG(BPF_ADD, R5, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3872  			BPF_ALU64_REG(BPF_ADD, R5, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3873  			BPF_ALU64_REG(BPF_ADD, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3874  			BPF_ALU64_REG(BPF_ADD, R5, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3875  			BPF_ALU64_REG(BPF_ADD, R5, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3876  			BPF_ALU64_REG(BPF_ADD, R5, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3877  			BPF_ALU64_REG(BPF_ADD, R5, R9), /* R5 == 36518 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3878  			BPF_JMP_IMM(BPF_JEQ, R5, 36518, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3879  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3880  			BPF_ALU64_REG(BPF_ADD, R6, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3881  			BPF_ALU64_REG(BPF_ADD, R6, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3882  			BPF_ALU64_REG(BPF_ADD, R6, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3883  			BPF_ALU64_REG(BPF_ADD, R6, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3884  			BPF_ALU64_REG(BPF_ADD, R6, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3885  			BPF_ALU64_REG(BPF_ADD, R6, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3886  			BPF_ALU64_REG(BPF_ADD, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3887  			BPF_ALU64_REG(BPF_ADD, R6, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3888  			BPF_ALU64_REG(BPF_ADD, R6, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3889  			BPF_ALU64_REG(BPF_ADD, R6, R9), /* R6 == 109540 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3890  			BPF_JMP_IMM(BPF_JEQ, R6, 109540, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3891  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3892  			BPF_ALU64_REG(BPF_ADD, R7, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3893  			BPF_ALU64_REG(BPF_ADD, R7, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3894  			BPF_ALU64_REG(BPF_ADD, R7, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3895  			BPF_ALU64_REG(BPF_ADD, R7, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3896  			BPF_ALU64_REG(BPF_ADD, R7, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3897  			BPF_ALU64_REG(BPF_ADD, R7, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3898  			BPF_ALU64_REG(BPF_ADD, R7, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3899  			BPF_ALU64_REG(BPF_ADD, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3900  			BPF_ALU64_REG(BPF_ADD, R7, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3901  			BPF_ALU64_REG(BPF_ADD, R7, R9), /* R7 == 328605 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3902  			BPF_JMP_IMM(BPF_JEQ, R7, 328605, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3903  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3904  			BPF_ALU64_REG(BPF_ADD, R8, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3905  			BPF_ALU64_REG(BPF_ADD, R8, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3906  			BPF_ALU64_REG(BPF_ADD, R8, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3907  			BPF_ALU64_REG(BPF_ADD, R8, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3908  			BPF_ALU64_REG(BPF_ADD, R8, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3909  			BPF_ALU64_REG(BPF_ADD, R8, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3910  			BPF_ALU64_REG(BPF_ADD, R8, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3911  			BPF_ALU64_REG(BPF_ADD, R8, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3912  			BPF_ALU64_REG(BPF_ADD, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3913  			BPF_ALU64_REG(BPF_ADD, R8, R9), /* R8 == 985799 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3914  			BPF_JMP_IMM(BPF_JEQ, R8, 985799, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3915  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3916  			BPF_ALU64_REG(BPF_ADD, R9, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3917  			BPF_ALU64_REG(BPF_ADD, R9, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3918  			BPF_ALU64_REG(BPF_ADD, R9, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3919  			BPF_ALU64_REG(BPF_ADD, R9, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3920  			BPF_ALU64_REG(BPF_ADD, R9, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3921  			BPF_ALU64_REG(BPF_ADD, R9, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3922  			BPF_ALU64_REG(BPF_ADD, R9, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3923  			BPF_ALU64_REG(BPF_ADD, R9, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3924  			BPF_ALU64_REG(BPF_ADD, R9, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3925  			BPF_ALU64_REG(BPF_ADD, R9, R9), /* R9 == 2957380 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3926  			BPF_ALU64_REG(BPF_MOV, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3927  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3928  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3929  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3930  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3931  		{ { 0, 2957380 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3932  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3933  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3934  		"INT: ADD 32-bit",
ece80490e2c1cef Andrew Morton      2014-05-22  3935  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3936  			BPF_ALU32_IMM(BPF_MOV, R0, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3937  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3938  			BPF_ALU32_IMM(BPF_MOV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3939  			BPF_ALU32_IMM(BPF_MOV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3940  			BPF_ALU32_IMM(BPF_MOV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3941  			BPF_ALU32_IMM(BPF_MOV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3942  			BPF_ALU32_IMM(BPF_MOV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3943  			BPF_ALU32_IMM(BPF_MOV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3944  			BPF_ALU32_IMM(BPF_MOV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3945  			BPF_ALU32_IMM(BPF_MOV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3946  			BPF_ALU64_IMM(BPF_ADD, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3947  			BPF_ALU64_IMM(BPF_ADD, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3948  			BPF_ALU64_IMM(BPF_ADD, R3, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3949  			BPF_ALU64_IMM(BPF_ADD, R4, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3950  			BPF_ALU64_IMM(BPF_ADD, R5, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3951  			BPF_ALU64_IMM(BPF_ADD, R6, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3952  			BPF_ALU64_IMM(BPF_ADD, R7, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3953  			BPF_ALU64_IMM(BPF_ADD, R8, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3954  			BPF_ALU64_IMM(BPF_ADD, R9, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3955  			BPF_ALU32_REG(BPF_ADD, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3956  			BPF_ALU32_REG(BPF_ADD, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3957  			BPF_ALU32_REG(BPF_ADD, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3958  			BPF_ALU32_REG(BPF_ADD, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3959  			BPF_ALU32_REG(BPF_ADD, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3960  			BPF_ALU32_REG(BPF_ADD, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3961  			BPF_ALU32_REG(BPF_ADD, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3962  			BPF_ALU32_REG(BPF_ADD, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3963  			BPF_ALU32_REG(BPF_ADD, R0, R9), /* R0 == 155 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3964  			BPF_JMP_IMM(BPF_JEQ, R0, 155, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3965  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3966  			BPF_ALU32_REG(BPF_ADD, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3967  			BPF_ALU32_REG(BPF_ADD, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3968  			BPF_ALU32_REG(BPF_ADD, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3969  			BPF_ALU32_REG(BPF_ADD, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3970  			BPF_ALU32_REG(BPF_ADD, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3971  			BPF_ALU32_REG(BPF_ADD, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3972  			BPF_ALU32_REG(BPF_ADD, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3973  			BPF_ALU32_REG(BPF_ADD, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3974  			BPF_ALU32_REG(BPF_ADD, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3975  			BPF_ALU32_REG(BPF_ADD, R1, R9), /* R1 == 456 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3976  			BPF_JMP_IMM(BPF_JEQ, R1, 456, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3977  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3978  			BPF_ALU32_REG(BPF_ADD, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3979  			BPF_ALU32_REG(BPF_ADD, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3980  			BPF_ALU32_REG(BPF_ADD, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3981  			BPF_ALU32_REG(BPF_ADD, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3982  			BPF_ALU32_REG(BPF_ADD, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3983  			BPF_ALU32_REG(BPF_ADD, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3984  			BPF_ALU32_REG(BPF_ADD, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3985  			BPF_ALU32_REG(BPF_ADD, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3986  			BPF_ALU32_REG(BPF_ADD, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3987  			BPF_ALU32_REG(BPF_ADD, R2, R9), /* R2 == 1358 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3988  			BPF_JMP_IMM(BPF_JEQ, R2, 1358, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3989  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3990  			BPF_ALU32_REG(BPF_ADD, R3, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3991  			BPF_ALU32_REG(BPF_ADD, R3, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3992  			BPF_ALU32_REG(BPF_ADD, R3, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3993  			BPF_ALU32_REG(BPF_ADD, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3994  			BPF_ALU32_REG(BPF_ADD, R3, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3995  			BPF_ALU32_REG(BPF_ADD, R3, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3996  			BPF_ALU32_REG(BPF_ADD, R3, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3997  			BPF_ALU32_REG(BPF_ADD, R3, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3998  			BPF_ALU32_REG(BPF_ADD, R3, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3999  			BPF_ALU32_REG(BPF_ADD, R3, R9), /* R3 == 4063 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4000  			BPF_JMP_IMM(BPF_JEQ, R3, 4063, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4001  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4002  			BPF_ALU32_REG(BPF_ADD, R4, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4003  			BPF_ALU32_REG(BPF_ADD, R4, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4004  			BPF_ALU32_REG(BPF_ADD, R4, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4005  			BPF_ALU32_REG(BPF_ADD, R4, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4006  			BPF_ALU32_REG(BPF_ADD, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4007  			BPF_ALU32_REG(BPF_ADD, R4, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4008  			BPF_ALU32_REG(BPF_ADD, R4, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4009  			BPF_ALU32_REG(BPF_ADD, R4, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4010  			BPF_ALU32_REG(BPF_ADD, R4, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4011  			BPF_ALU32_REG(BPF_ADD, R4, R9), /* R4 == 12177 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4012  			BPF_JMP_IMM(BPF_JEQ, R4, 12177, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4013  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4014  			BPF_ALU32_REG(BPF_ADD, R5, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4015  			BPF_ALU32_REG(BPF_ADD, R5, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4016  			BPF_ALU32_REG(BPF_ADD, R5, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4017  			BPF_ALU32_REG(BPF_ADD, R5, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4018  			BPF_ALU32_REG(BPF_ADD, R5, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4019  			BPF_ALU32_REG(BPF_ADD, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4020  			BPF_ALU32_REG(BPF_ADD, R5, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4021  			BPF_ALU32_REG(BPF_ADD, R5, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4022  			BPF_ALU32_REG(BPF_ADD, R5, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4023  			BPF_ALU32_REG(BPF_ADD, R5, R9), /* R5 == 36518 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4024  			BPF_JMP_IMM(BPF_JEQ, R5, 36518, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4025  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4026  			BPF_ALU32_REG(BPF_ADD, R6, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4027  			BPF_ALU32_REG(BPF_ADD, R6, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4028  			BPF_ALU32_REG(BPF_ADD, R6, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4029  			BPF_ALU32_REG(BPF_ADD, R6, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4030  			BPF_ALU32_REG(BPF_ADD, R6, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4031  			BPF_ALU32_REG(BPF_ADD, R6, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4032  			BPF_ALU32_REG(BPF_ADD, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4033  			BPF_ALU32_REG(BPF_ADD, R6, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4034  			BPF_ALU32_REG(BPF_ADD, R6, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4035  			BPF_ALU32_REG(BPF_ADD, R6, R9), /* R6 == 109540 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4036  			BPF_JMP_IMM(BPF_JEQ, R6, 109540, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4037  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4038  			BPF_ALU32_REG(BPF_ADD, R7, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4039  			BPF_ALU32_REG(BPF_ADD, R7, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4040  			BPF_ALU32_REG(BPF_ADD, R7, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4041  			BPF_ALU32_REG(BPF_ADD, R7, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4042  			BPF_ALU32_REG(BPF_ADD, R7, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4043  			BPF_ALU32_REG(BPF_ADD, R7, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4044  			BPF_ALU32_REG(BPF_ADD, R7, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4045  			BPF_ALU32_REG(BPF_ADD, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4046  			BPF_ALU32_REG(BPF_ADD, R7, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4047  			BPF_ALU32_REG(BPF_ADD, R7, R9), /* R7 == 328605 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4048  			BPF_JMP_IMM(BPF_JEQ, R7, 328605, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4049  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4050  			BPF_ALU32_REG(BPF_ADD, R8, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4051  			BPF_ALU32_REG(BPF_ADD, R8, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4052  			BPF_ALU32_REG(BPF_ADD, R8, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4053  			BPF_ALU32_REG(BPF_ADD, R8, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4054  			BPF_ALU32_REG(BPF_ADD, R8, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4055  			BPF_ALU32_REG(BPF_ADD, R8, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4056  			BPF_ALU32_REG(BPF_ADD, R8, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4057  			BPF_ALU32_REG(BPF_ADD, R8, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4058  			BPF_ALU32_REG(BPF_ADD, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4059  			BPF_ALU32_REG(BPF_ADD, R8, R9), /* R8 == 985799 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4060  			BPF_JMP_IMM(BPF_JEQ, R8, 985799, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4061  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4062  			BPF_ALU32_REG(BPF_ADD, R9, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4063  			BPF_ALU32_REG(BPF_ADD, R9, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4064  			BPF_ALU32_REG(BPF_ADD, R9, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4065  			BPF_ALU32_REG(BPF_ADD, R9, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4066  			BPF_ALU32_REG(BPF_ADD, R9, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4067  			BPF_ALU32_REG(BPF_ADD, R9, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4068  			BPF_ALU32_REG(BPF_ADD, R9, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4069  			BPF_ALU32_REG(BPF_ADD, R9, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4070  			BPF_ALU32_REG(BPF_ADD, R9, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4071  			BPF_ALU32_REG(BPF_ADD, R9, R9), /* R9 == 2957380 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4072  			BPF_ALU32_REG(BPF_MOV, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4073  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4074  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4075  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4076  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4077  		{ { 0, 2957380 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4078  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4079  	{	/* Mainly checking JIT here. */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4080  		"INT: SUB",
ece80490e2c1cef Andrew Morton      2014-05-22  4081  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4082  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4083  			BPF_ALU64_IMM(BPF_MOV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4084  			BPF_ALU64_IMM(BPF_MOV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4085  			BPF_ALU64_IMM(BPF_MOV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4086  			BPF_ALU64_IMM(BPF_MOV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4087  			BPF_ALU64_IMM(BPF_MOV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4088  			BPF_ALU64_IMM(BPF_MOV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4089  			BPF_ALU64_IMM(BPF_MOV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4090  			BPF_ALU64_IMM(BPF_MOV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4091  			BPF_ALU64_IMM(BPF_MOV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4092  			BPF_ALU64_REG(BPF_SUB, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4093  			BPF_ALU64_REG(BPF_SUB, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4094  			BPF_ALU64_REG(BPF_SUB, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4095  			BPF_ALU64_REG(BPF_SUB, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4096  			BPF_ALU64_REG(BPF_SUB, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4097  			BPF_ALU64_REG(BPF_SUB, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4098  			BPF_ALU64_REG(BPF_SUB, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4099  			BPF_ALU64_REG(BPF_SUB, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4100  			BPF_ALU64_REG(BPF_SUB, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4101  			BPF_ALU64_REG(BPF_SUB, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4102  			BPF_ALU64_IMM(BPF_SUB, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4103  			BPF_JMP_IMM(BPF_JEQ, R0, -55, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4104  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4105  			BPF_ALU64_REG(BPF_SUB, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4106  			BPF_ALU64_REG(BPF_SUB, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4107  			BPF_ALU64_REG(BPF_SUB, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4108  			BPF_ALU64_REG(BPF_SUB, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4109  			BPF_ALU64_REG(BPF_SUB, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4110  			BPF_ALU64_REG(BPF_SUB, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4111  			BPF_ALU64_REG(BPF_SUB, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4112  			BPF_ALU64_REG(BPF_SUB, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4113  			BPF_ALU64_REG(BPF_SUB, R1, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4114  			BPF_ALU64_IMM(BPF_SUB, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4115  			BPF_ALU64_REG(BPF_SUB, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4116  			BPF_ALU64_REG(BPF_SUB, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4117  			BPF_ALU64_REG(BPF_SUB, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4118  			BPF_ALU64_REG(BPF_SUB, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4119  			BPF_ALU64_REG(BPF_SUB, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4120  			BPF_ALU64_REG(BPF_SUB, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4121  			BPF_ALU64_REG(BPF_SUB, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4122  			BPF_ALU64_REG(BPF_SUB, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4123  			BPF_ALU64_REG(BPF_SUB, R2, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4124  			BPF_ALU64_IMM(BPF_SUB, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4125  			BPF_ALU64_REG(BPF_SUB, R3, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4126  			BPF_ALU64_REG(BPF_SUB, R3, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4127  			BPF_ALU64_REG(BPF_SUB, R3, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4128  			BPF_ALU64_REG(BPF_SUB, R3, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4129  			BPF_ALU64_REG(BPF_SUB, R3, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4130  			BPF_ALU64_REG(BPF_SUB, R3, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4131  			BPF_ALU64_REG(BPF_SUB, R3, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4132  			BPF_ALU64_REG(BPF_SUB, R3, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4133  			BPF_ALU64_REG(BPF_SUB, R3, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4134  			BPF_ALU64_IMM(BPF_SUB, R3, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4135  			BPF_ALU64_REG(BPF_SUB, R4, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4136  			BPF_ALU64_REG(BPF_SUB, R4, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4137  			BPF_ALU64_REG(BPF_SUB, R4, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4138  			BPF_ALU64_REG(BPF_SUB, R4, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4139  			BPF_ALU64_REG(BPF_SUB, R4, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4140  			BPF_ALU64_REG(BPF_SUB, R4, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4141  			BPF_ALU64_REG(BPF_SUB, R4, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4142  			BPF_ALU64_REG(BPF_SUB, R4, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4143  			BPF_ALU64_REG(BPF_SUB, R4, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4144  			BPF_ALU64_IMM(BPF_SUB, R4, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4145  			BPF_ALU64_REG(BPF_SUB, R5, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4146  			BPF_ALU64_REG(BPF_SUB, R5, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4147  			BPF_ALU64_REG(BPF_SUB, R5, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4148  			BPF_ALU64_REG(BPF_SUB, R5, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4149  			BPF_ALU64_REG(BPF_SUB, R5, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4150  			BPF_ALU64_REG(BPF_SUB, R5, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4151  			BPF_ALU64_REG(BPF_SUB, R5, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4152  			BPF_ALU64_REG(BPF_SUB, R5, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4153  			BPF_ALU64_REG(BPF_SUB, R5, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4154  			BPF_ALU64_IMM(BPF_SUB, R5, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4155  			BPF_ALU64_REG(BPF_SUB, R6, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4156  			BPF_ALU64_REG(BPF_SUB, R6, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4157  			BPF_ALU64_REG(BPF_SUB, R6, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4158  			BPF_ALU64_REG(BPF_SUB, R6, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4159  			BPF_ALU64_REG(BPF_SUB, R6, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4160  			BPF_ALU64_REG(BPF_SUB, R6, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4161  			BPF_ALU64_REG(BPF_SUB, R6, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4162  			BPF_ALU64_REG(BPF_SUB, R6, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4163  			BPF_ALU64_REG(BPF_SUB, R6, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4164  			BPF_ALU64_IMM(BPF_SUB, R6, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4165  			BPF_ALU64_REG(BPF_SUB, R7, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4166  			BPF_ALU64_REG(BPF_SUB, R7, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4167  			BPF_ALU64_REG(BPF_SUB, R7, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4168  			BPF_ALU64_REG(BPF_SUB, R7, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4169  			BPF_ALU64_REG(BPF_SUB, R7, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4170  			BPF_ALU64_REG(BPF_SUB, R7, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4171  			BPF_ALU64_REG(BPF_SUB, R7, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4172  			BPF_ALU64_REG(BPF_SUB, R7, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4173  			BPF_ALU64_REG(BPF_SUB, R7, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4174  			BPF_ALU64_IMM(BPF_SUB, R7, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4175  			BPF_ALU64_REG(BPF_SUB, R8, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4176  			BPF_ALU64_REG(BPF_SUB, R8, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4177  			BPF_ALU64_REG(BPF_SUB, R8, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4178  			BPF_ALU64_REG(BPF_SUB, R8, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4179  			BPF_ALU64_REG(BPF_SUB, R8, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4180  			BPF_ALU64_REG(BPF_SUB, R8, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4181  			BPF_ALU64_REG(BPF_SUB, R8, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4182  			BPF_ALU64_REG(BPF_SUB, R8, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4183  			BPF_ALU64_REG(BPF_SUB, R8, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4184  			BPF_ALU64_IMM(BPF_SUB, R8, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4185  			BPF_ALU64_REG(BPF_SUB, R9, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4186  			BPF_ALU64_REG(BPF_SUB, R9, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4187  			BPF_ALU64_REG(BPF_SUB, R9, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4188  			BPF_ALU64_REG(BPF_SUB, R9, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4189  			BPF_ALU64_REG(BPF_SUB, R9, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4190  			BPF_ALU64_REG(BPF_SUB, R9, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4191  			BPF_ALU64_REG(BPF_SUB, R9, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4192  			BPF_ALU64_REG(BPF_SUB, R9, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4193  			BPF_ALU64_REG(BPF_SUB, R9, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4194  			BPF_ALU64_IMM(BPF_SUB, R9, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4195  			BPF_ALU64_IMM(BPF_SUB, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4196  			BPF_ALU64_IMM(BPF_NEG, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4197  			BPF_ALU64_REG(BPF_SUB, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4198  			BPF_ALU64_REG(BPF_SUB, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4199  			BPF_ALU64_REG(BPF_SUB, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4200  			BPF_ALU64_REG(BPF_SUB, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4201  			BPF_ALU64_REG(BPF_SUB, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4202  			BPF_ALU64_REG(BPF_SUB, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4203  			BPF_ALU64_REG(BPF_SUB, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4204  			BPF_ALU64_REG(BPF_SUB, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4205  			BPF_ALU64_REG(BPF_SUB, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4206  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4207  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4208  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4209  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4210  		{ { 0, 11 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4211  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4212  	{	/* Mainly checking JIT here. */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4213  		"INT: XOR",
ece80490e2c1cef Andrew Morton      2014-05-22  4214  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4215  			BPF_ALU64_REG(BPF_SUB, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4216  			BPF_ALU64_REG(BPF_XOR, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4217  			BPF_JMP_REG(BPF_JEQ, R0, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4218  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4219  			BPF_ALU64_IMM(BPF_MOV, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4220  			BPF_ALU64_IMM(BPF_MOV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4221  			BPF_ALU64_REG(BPF_SUB, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4222  			BPF_ALU64_REG(BPF_XOR, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4223  			BPF_JMP_REG(BPF_JEQ, R1, R2, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4224  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4225  			BPF_ALU64_REG(BPF_SUB, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4226  			BPF_ALU64_REG(BPF_XOR, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4227  			BPF_ALU64_IMM(BPF_MOV, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4228  			BPF_ALU64_IMM(BPF_MOV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4229  			BPF_JMP_REG(BPF_JEQ, R2, R3, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4230  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4231  			BPF_ALU64_REG(BPF_SUB, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4232  			BPF_ALU64_REG(BPF_XOR, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4233  			BPF_ALU64_IMM(BPF_MOV, R2, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4234  			BPF_ALU64_IMM(BPF_MOV, R5, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4235  			BPF_JMP_REG(BPF_JEQ, R3, R4, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4236  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4237  			BPF_ALU64_REG(BPF_SUB, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4238  			BPF_ALU64_REG(BPF_XOR, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4239  			BPF_ALU64_IMM(BPF_MOV, R3, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4240  			BPF_ALU64_IMM(BPF_MOV, R7, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4241  			BPF_JMP_REG(BPF_JEQ, R5, R4, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4242  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4243  			BPF_ALU64_IMM(BPF_MOV, R5, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4244  			BPF_ALU64_REG(BPF_SUB, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4245  			BPF_ALU64_REG(BPF_XOR, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4246  			BPF_ALU64_IMM(BPF_MOV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4247  			BPF_ALU64_IMM(BPF_MOV, R8, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4248  			BPF_JMP_REG(BPF_JEQ, R5, R6, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4249  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4250  			BPF_ALU64_REG(BPF_SUB, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4251  			BPF_ALU64_REG(BPF_XOR, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4252  			BPF_JMP_REG(BPF_JEQ, R7, R6, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4253  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4254  			BPF_ALU64_REG(BPF_SUB, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4255  			BPF_ALU64_REG(BPF_XOR, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4256  			BPF_JMP_REG(BPF_JEQ, R7, R8, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4257  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4258  			BPF_ALU64_REG(BPF_SUB, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4259  			BPF_ALU64_REG(BPF_XOR, R9, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4260  			BPF_JMP_REG(BPF_JEQ, R9, R8, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4261  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4262  			BPF_ALU64_REG(BPF_SUB, R9, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4263  			BPF_ALU64_REG(BPF_XOR, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4264  			BPF_JMP_REG(BPF_JEQ, R9, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4265  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4266  			BPF_ALU64_REG(BPF_SUB, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4267  			BPF_ALU64_REG(BPF_XOR, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4268  			BPF_JMP_REG(BPF_JEQ, R9, R0, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4269  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4270  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4271  			BPF_ALU64_IMM(BPF_MOV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4272  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4273  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4274  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4275  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4276  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4277  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4278  	{	/* Mainly checking JIT here. */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4279  		"INT: MUL",
ece80490e2c1cef Andrew Morton      2014-05-22  4280  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4281  			BPF_ALU64_IMM(BPF_MOV, R0, 11),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4282  			BPF_ALU64_IMM(BPF_MOV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4283  			BPF_ALU64_IMM(BPF_MOV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4284  			BPF_ALU64_IMM(BPF_MOV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4285  			BPF_ALU64_IMM(BPF_MOV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4286  			BPF_ALU64_IMM(BPF_MOV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4287  			BPF_ALU64_IMM(BPF_MOV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4288  			BPF_ALU64_IMM(BPF_MOV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4289  			BPF_ALU64_IMM(BPF_MOV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4290  			BPF_ALU64_IMM(BPF_MOV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4291  			BPF_ALU64_REG(BPF_MUL, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4292  			BPF_ALU64_REG(BPF_MUL, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4293  			BPF_ALU64_REG(BPF_MUL, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4294  			BPF_ALU64_REG(BPF_MUL, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4295  			BPF_ALU64_REG(BPF_MUL, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4296  			BPF_ALU64_REG(BPF_MUL, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4297  			BPF_ALU64_REG(BPF_MUL, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4298  			BPF_ALU64_REG(BPF_MUL, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4299  			BPF_ALU64_REG(BPF_MUL, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4300  			BPF_ALU64_REG(BPF_MUL, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4301  			BPF_ALU64_IMM(BPF_MUL, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4302  			BPF_JMP_IMM(BPF_JEQ, R0, 439084800, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4303  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4304  			BPF_ALU64_REG(BPF_MUL, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4305  			BPF_ALU64_REG(BPF_MUL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4306  			BPF_ALU64_REG(BPF_MUL, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4307  			BPF_ALU64_REG(BPF_MUL, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4308  			BPF_ALU64_REG(BPF_MUL, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4309  			BPF_ALU64_REG(BPF_MUL, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4310  			BPF_ALU64_REG(BPF_MUL, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4311  			BPF_ALU64_REG(BPF_MUL, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4312  			BPF_ALU64_REG(BPF_MUL, R1, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4313  			BPF_ALU64_IMM(BPF_MUL, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4314  			BPF_ALU64_REG(BPF_MOV, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4315  			BPF_ALU64_IMM(BPF_RSH, R2, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4316  			BPF_JMP_IMM(BPF_JEQ, R2, 0x5a924, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4317  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4318  			BPF_ALU64_IMM(BPF_LSH, R1, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4319  			BPF_ALU64_IMM(BPF_ARSH, R1, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4320  			BPF_JMP_IMM(BPF_JEQ, R1, 0xebb90000, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4321  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4322  			BPF_ALU64_REG(BPF_MUL, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4323  			BPF_ALU64_REG(BPF_MUL, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4324  			BPF_ALU64_REG(BPF_MUL, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4325  			BPF_ALU64_REG(BPF_MUL, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4326  			BPF_ALU64_REG(BPF_MUL, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4327  			BPF_ALU64_REG(BPF_MUL, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4328  			BPF_ALU64_REG(BPF_MUL, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4329  			BPF_ALU64_REG(BPF_MUL, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4330  			BPF_ALU64_REG(BPF_MUL, R2, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4331  			BPF_ALU64_IMM(BPF_MUL, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4332  			BPF_ALU64_IMM(BPF_RSH, R2, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4333  			BPF_ALU64_REG(BPF_MOV, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4334  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4335  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4336  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4337  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4338  		{ { 0, 0x35d97ef2 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4339  	},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4340  	{	/* Mainly checking JIT here. */
9dd2af834dea132 Daniel Borkmann    2015-12-17  4341  		"MOV REG64",
9dd2af834dea132 Daniel Borkmann    2015-12-17  4342  		.u.insns_int = {
9dd2af834dea132 Daniel Borkmann    2015-12-17  4343  			BPF_LD_IMM64(R0, 0xffffffffffffffffLL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4344  			BPF_MOV64_REG(R1, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4345  			BPF_MOV64_REG(R2, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4346  			BPF_MOV64_REG(R3, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4347  			BPF_MOV64_REG(R4, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4348  			BPF_MOV64_REG(R5, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4349  			BPF_MOV64_REG(R6, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4350  			BPF_MOV64_REG(R7, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4351  			BPF_MOV64_REG(R8, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4352  			BPF_MOV64_REG(R9, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4353  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4354  			BPF_ALU64_IMM(BPF_MOV, R1, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4355  			BPF_ALU64_IMM(BPF_MOV, R2, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4356  			BPF_ALU64_IMM(BPF_MOV, R3, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4357  			BPF_ALU64_IMM(BPF_MOV, R4, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4358  			BPF_ALU64_IMM(BPF_MOV, R5, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4359  			BPF_ALU64_IMM(BPF_MOV, R6, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4360  			BPF_ALU64_IMM(BPF_MOV, R7, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4361  			BPF_ALU64_IMM(BPF_MOV, R8, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4362  			BPF_ALU64_IMM(BPF_MOV, R9, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4363  			BPF_ALU64_REG(BPF_ADD, R0, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4364  			BPF_ALU64_REG(BPF_ADD, R0, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4365  			BPF_ALU64_REG(BPF_ADD, R0, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4366  			BPF_ALU64_REG(BPF_ADD, R0, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4367  			BPF_ALU64_REG(BPF_ADD, R0, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4368  			BPF_ALU64_REG(BPF_ADD, R0, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4369  			BPF_ALU64_REG(BPF_ADD, R0, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4370  			BPF_ALU64_REG(BPF_ADD, R0, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4371  			BPF_ALU64_REG(BPF_ADD, R0, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4372  			BPF_ALU64_REG(BPF_ADD, R0, R9),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4373  			BPF_ALU64_IMM(BPF_ADD, R0, 0xfefe),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4374  			BPF_EXIT_INSN(),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4375  		},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4376  		INTERNAL,
9dd2af834dea132 Daniel Borkmann    2015-12-17  4377  		{ },
9dd2af834dea132 Daniel Borkmann    2015-12-17  4378  		{ { 0, 0xfefe } }
9dd2af834dea132 Daniel Borkmann    2015-12-17  4379  	},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4380  	{	/* Mainly checking JIT here. */
9dd2af834dea132 Daniel Borkmann    2015-12-17  4381  		"MOV REG32",
9dd2af834dea132 Daniel Borkmann    2015-12-17  4382  		.u.insns_int = {
9dd2af834dea132 Daniel Borkmann    2015-12-17  4383  			BPF_LD_IMM64(R0, 0xffffffffffffffffLL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4384  			BPF_MOV64_REG(R1, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4385  			BPF_MOV64_REG(R2, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4386  			BPF_MOV64_REG(R3, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4387  			BPF_MOV64_REG(R4, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4388  			BPF_MOV64_REG(R5, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4389  			BPF_MOV64_REG(R6, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4390  			BPF_MOV64_REG(R7, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4391  			BPF_MOV64_REG(R8, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4392  			BPF_MOV64_REG(R9, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4393  			BPF_ALU32_IMM(BPF_MOV, R0, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4394  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4395  			BPF_ALU32_IMM(BPF_MOV, R2, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4396  			BPF_ALU32_IMM(BPF_MOV, R3, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4397  			BPF_ALU32_IMM(BPF_MOV, R4, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4398  			BPF_ALU32_IMM(BPF_MOV, R5, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4399  			BPF_ALU32_IMM(BPF_MOV, R6, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4400  			BPF_ALU32_IMM(BPF_MOV, R7, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4401  			BPF_ALU32_IMM(BPF_MOV, R8, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4402  			BPF_ALU32_IMM(BPF_MOV, R9, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4403  			BPF_ALU64_REG(BPF_ADD, R0, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4404  			BPF_ALU64_REG(BPF_ADD, R0, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4405  			BPF_ALU64_REG(BPF_ADD, R0, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4406  			BPF_ALU64_REG(BPF_ADD, R0, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4407  			BPF_ALU64_REG(BPF_ADD, R0, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4408  			BPF_ALU64_REG(BPF_ADD, R0, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4409  			BPF_ALU64_REG(BPF_ADD, R0, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4410  			BPF_ALU64_REG(BPF_ADD, R0, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4411  			BPF_ALU64_REG(BPF_ADD, R0, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4412  			BPF_ALU64_REG(BPF_ADD, R0, R9),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4413  			BPF_ALU64_IMM(BPF_ADD, R0, 0xfefe),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4414  			BPF_EXIT_INSN(),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4415  		},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4416  		INTERNAL,
9dd2af834dea132 Daniel Borkmann    2015-12-17  4417  		{ },
9dd2af834dea132 Daniel Borkmann    2015-12-17  4418  		{ { 0, 0xfefe } }
9dd2af834dea132 Daniel Borkmann    2015-12-17  4419  	},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4420  	{	/* Mainly checking JIT here. */
9dd2af834dea132 Daniel Borkmann    2015-12-17  4421  		"LD IMM64",
9dd2af834dea132 Daniel Borkmann    2015-12-17  4422  		.u.insns_int = {
9dd2af834dea132 Daniel Borkmann    2015-12-17  4423  			BPF_LD_IMM64(R0, 0xffffffffffffffffLL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4424  			BPF_MOV64_REG(R1, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4425  			BPF_MOV64_REG(R2, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4426  			BPF_MOV64_REG(R3, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4427  			BPF_MOV64_REG(R4, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4428  			BPF_MOV64_REG(R5, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4429  			BPF_MOV64_REG(R6, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4430  			BPF_MOV64_REG(R7, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4431  			BPF_MOV64_REG(R8, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4432  			BPF_MOV64_REG(R9, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4433  			BPF_LD_IMM64(R0, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4434  			BPF_LD_IMM64(R1, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4435  			BPF_LD_IMM64(R2, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4436  			BPF_LD_IMM64(R3, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4437  			BPF_LD_IMM64(R4, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4438  			BPF_LD_IMM64(R5, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4439  			BPF_LD_IMM64(R6, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4440  			BPF_LD_IMM64(R7, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4441  			BPF_LD_IMM64(R8, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4442  			BPF_LD_IMM64(R9, 0x0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4443  			BPF_ALU64_REG(BPF_ADD, R0, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4444  			BPF_ALU64_REG(BPF_ADD, R0, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4445  			BPF_ALU64_REG(BPF_ADD, R0, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4446  			BPF_ALU64_REG(BPF_ADD, R0, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4447  			BPF_ALU64_REG(BPF_ADD, R0, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4448  			BPF_ALU64_REG(BPF_ADD, R0, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4449  			BPF_ALU64_REG(BPF_ADD, R0, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4450  			BPF_ALU64_REG(BPF_ADD, R0, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4451  			BPF_ALU64_REG(BPF_ADD, R0, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4452  			BPF_ALU64_REG(BPF_ADD, R0, R9),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4453  			BPF_ALU64_IMM(BPF_ADD, R0, 0xfefe),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4454  			BPF_EXIT_INSN(),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4455  		},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4456  		INTERNAL,
9dd2af834dea132 Daniel Borkmann    2015-12-17  4457  		{ },
9dd2af834dea132 Daniel Borkmann    2015-12-17  4458  		{ { 0, 0xfefe } }
9dd2af834dea132 Daniel Borkmann    2015-12-17  4459  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4460  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4461  		"INT: ALU MIX",
ece80490e2c1cef Andrew Morton      2014-05-22  4462  		.u.insns_int = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4463  			BPF_ALU64_IMM(BPF_MOV, R0, 11),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4464  			BPF_ALU64_IMM(BPF_ADD, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4465  			BPF_ALU64_IMM(BPF_MOV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4466  			BPF_ALU64_IMM(BPF_XOR, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4467  			BPF_ALU64_REG(BPF_DIV, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4468  			BPF_JMP_IMM(BPF_JEQ, R0, 10, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4469  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4470  			BPF_ALU64_IMM(BPF_MOD, R0, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4471  			BPF_JMP_IMM(BPF_JEQ, R0, 1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4472  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4473  			BPF_ALU64_IMM(BPF_MOV, R0, -1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4474  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4475  		},
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4476  		INTERNAL,
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4477  		{ },
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4478  		{ { 0, -1 } }
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4479  	},
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4480  	{
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4481  		"INT: shifts by register",
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4482  		.u.insns_int = {
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4483  			BPF_MOV64_IMM(R0, -1234),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4484  			BPF_MOV64_IMM(R1, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4485  			BPF_ALU32_REG(BPF_RSH, R0, R1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4486  			BPF_JMP_IMM(BPF_JEQ, R0, 0x7ffffd97, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4487  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4488  			BPF_MOV64_IMM(R2, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4489  			BPF_ALU64_REG(BPF_LSH, R0, R2),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4490  			BPF_MOV32_IMM(R4, -1234),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4491  			BPF_JMP_REG(BPF_JEQ, R0, R4, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4492  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4493  			BPF_ALU64_IMM(BPF_AND, R4, 63),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4494  			BPF_ALU64_REG(BPF_LSH, R0, R4), /* R0 <= 46 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4495  			BPF_MOV64_IMM(R3, 47),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4496  			BPF_ALU64_REG(BPF_ARSH, R0, R3),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4497  			BPF_JMP_IMM(BPF_JEQ, R0, -617, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4498  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4499  			BPF_MOV64_IMM(R2, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4500  			BPF_ALU64_REG(BPF_LSH, R4, R2), /* R4 = 46 << 1 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4501  			BPF_JMP_IMM(BPF_JEQ, R4, 92, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4502  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4503  			BPF_MOV64_IMM(R4, 4),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4504  			BPF_ALU64_REG(BPF_LSH, R4, R4), /* R4 = 4 << 4 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4505  			BPF_JMP_IMM(BPF_JEQ, R4, 64, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4506  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4507  			BPF_MOV64_IMM(R4, 5),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4508  			BPF_ALU32_REG(BPF_LSH, R4, R4), /* R4 = 5 << 5 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4509  			BPF_JMP_IMM(BPF_JEQ, R4, 160, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4510  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4511  			BPF_MOV64_IMM(R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4512  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4513  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4514  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4515  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4516  		{ { 0, -1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4517  	},
53e33f9928cd612 Johan Almbladh     2021-08-09  4518  #ifdef CONFIG_32BIT
53e33f9928cd612 Johan Almbladh     2021-08-09  4519  	{
53e33f9928cd612 Johan Almbladh     2021-08-09  4520  		"INT: 32-bit context pointer word order and zero-extension",
53e33f9928cd612 Johan Almbladh     2021-08-09  4521  		.u.insns_int = {
53e33f9928cd612 Johan Almbladh     2021-08-09  4522  			BPF_ALU32_IMM(BPF_MOV, R0, 0),
53e33f9928cd612 Johan Almbladh     2021-08-09  4523  			BPF_JMP32_IMM(BPF_JEQ, R1, 0, 3),
53e33f9928cd612 Johan Almbladh     2021-08-09  4524  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
53e33f9928cd612 Johan Almbladh     2021-08-09  4525  			BPF_JMP32_IMM(BPF_JNE, R1, 0, 1),
53e33f9928cd612 Johan Almbladh     2021-08-09  4526  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
53e33f9928cd612 Johan Almbladh     2021-08-09  4527  			BPF_EXIT_INSN(),
53e33f9928cd612 Johan Almbladh     2021-08-09  4528  		},
53e33f9928cd612 Johan Almbladh     2021-08-09  4529  		INTERNAL,
53e33f9928cd612 Johan Almbladh     2021-08-09  4530  		{ },
53e33f9928cd612 Johan Almbladh     2021-08-09  4531  		{ { 0, 1 } }
53e33f9928cd612 Johan Almbladh     2021-08-09  4532  	},
53e33f9928cd612 Johan Almbladh     2021-08-09  4533  #endif
64a8946b447e418 Alexei Starovoitov 2014-05-08  4534  	{
64a8946b447e418 Alexei Starovoitov 2014-05-08  4535  		"check: missing ret",
ece80490e2c1cef Andrew Morton      2014-05-22  4536  		.u.insns = {
64a8946b447e418 Alexei Starovoitov 2014-05-08  4537  			BPF_STMT(BPF_LD | BPF_IMM, 1),
64a8946b447e418 Alexei Starovoitov 2014-05-08  4538  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4539  		CLASSIC | FLAG_NO_DATA | FLAG_EXPECTED_FAIL,
64a8946b447e418 Alexei Starovoitov 2014-05-08  4540  		{ },
09584b406742413 Yonghong Song      2018-02-02  4541  		{ },
09584b406742413 Yonghong Song      2018-02-02  4542  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4543  		.expected_errcode = -EINVAL,
64a8946b447e418 Alexei Starovoitov 2014-05-08  4544  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4545  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4546  		"check: div_k_0",
ece80490e2c1cef Andrew Morton      2014-05-22  4547  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4548  			BPF_STMT(BPF_ALU | BPF_DIV | BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4549  			BPF_STMT(BPF_RET | BPF_K, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4550  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4551  		CLASSIC | FLAG_NO_DATA | FLAG_EXPECTED_FAIL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4552  		{ },
09584b406742413 Yonghong Song      2018-02-02  4553  		{ },
09584b406742413 Yonghong Song      2018-02-02  4554  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4555  		.expected_errcode = -EINVAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4556  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4557  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4558  		"check: unknown insn",
ece80490e2c1cef Andrew Morton      2014-05-22  4559  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4560  			/* seccomp insn, rejected in socket filter */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4561  			BPF_STMT(BPF_LDX | BPF_W | BPF_ABS, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4562  			BPF_STMT(BPF_RET | BPF_K, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4563  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4564  		CLASSIC | FLAG_EXPECTED_FAIL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4565  		{ },
09584b406742413 Yonghong Song      2018-02-02  4566  		{ },
09584b406742413 Yonghong Song      2018-02-02  4567  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4568  		.expected_errcode = -EINVAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4569  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4570  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4571  		"check: out of range spill/fill",
ece80490e2c1cef Andrew Morton      2014-05-22  4572  		.u.insns = {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4573  			BPF_STMT(BPF_STX, 16),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4574  			BPF_STMT(BPF_RET | BPF_K, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4575  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4576  		CLASSIC | FLAG_NO_DATA | FLAG_EXPECTED_FAIL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4577  		{ },
09584b406742413 Yonghong Song      2018-02-02  4578  		{ },
09584b406742413 Yonghong Song      2018-02-02  4579  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4580  		.expected_errcode = -EINVAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4581  	},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4582  	{
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4583  		"JUMPS + HOLES",
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4584  		.u.insns = {
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4585  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4586  			BPF_JUMP(BPF_JMP | BPF_JGE, 0, 13, 15),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4587  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4588  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4589  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4590  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4591  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4592  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4593  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4594  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4595  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4596  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4597  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4598  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4599  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4600  			BPF_JUMP(BPF_JMP | BPF_JEQ, 0x90c2894d, 3, 4),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4601  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4602  			BPF_JUMP(BPF_JMP | BPF_JEQ, 0x90c2894d, 1, 2),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4603  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4604  			BPF_JUMP(BPF_JMP | BPF_JGE, 0, 14, 15),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4605  			BPF_JUMP(BPF_JMP | BPF_JGE, 0, 13, 14),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4606  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4607  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4608  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4609  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4610  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4611  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4612  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4613  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4614  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4615  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4616  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4617  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4618  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4619  			BPF_JUMP(BPF_JMP | BPF_JEQ, 0x2ac28349, 2, 3),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4620  			BPF_JUMP(BPF_JMP | BPF_JEQ, 0x2ac28349, 1, 2),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4621  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4622  			BPF_JUMP(BPF_JMP | BPF_JGE, 0, 14, 15),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4623  			BPF_JUMP(BPF_JMP | BPF_JGE, 0, 13, 14),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4624  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4625  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4626  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4627  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4628  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4629  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4630  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4631  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4632  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4633  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4634  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4635  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4636  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4637  			BPF_JUMP(BPF_JMP | BPF_JEQ, 0x90d2ff41, 2, 3),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4638  			BPF_JUMP(BPF_JMP | BPF_JEQ, 0x90d2ff41, 1, 2),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4639  			BPF_STMT(BPF_LD | BPF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4640  			BPF_STMT(BPF_RET | BPF_A, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4641  			BPF_STMT(BPF_RET | BPF_A, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4642  		},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4643  		CLASSIC,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4644  		{ 0x00, 0x1b, 0x21, 0x3c, 0x9d, 0xf8,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4645  		  0x90, 0xe2, 0xba, 0x0a, 0x56, 0xb4,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4646  		  0x08, 0x00,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4647  		  0x45, 0x00, 0x00, 0x28, 0x00, 0x00,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4648  		  0x20, 0x00, 0x40, 0x11, 0x00, 0x00, /* IP header */
ce25b68b74593bb Daniel Borkmann    2014-05-26  4649  		  0xc0, 0xa8, 0x33, 0x01,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4650  		  0xc0, 0xa8, 0x33, 0x02,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4651  		  0xbb, 0xb6,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4652  		  0xa9, 0xfa,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4653  		  0x00, 0x14, 0x00, 0x00,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4654  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4655  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4656  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4657  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4658  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4659  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4660  		  0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4661  		  0xcc, 0xcc, 0xcc, 0xcc },
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4662  		{ { 88, 0x001b } }
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4663  	},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4664  	{
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4665  		"check: RET X",
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4666  		.u.insns = {
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4667  			BPF_STMT(BPF_RET | BPF_X, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4668  		},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4669  		CLASSIC | FLAG_NO_DATA | FLAG_EXPECTED_FAIL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4670  		{ },
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4671  		{ },
09584b406742413 Yonghong Song      2018-02-02  4672  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4673  		.expected_errcode = -EINVAL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4674  	},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4675  	{
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4676  		"check: LDX + RET X",
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4677  		.u.insns = {
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4678  			BPF_STMT(BPF_LDX | BPF_IMM, 42),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4679  			BPF_STMT(BPF_RET | BPF_X, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4680  		},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4681  		CLASSIC | FLAG_NO_DATA | FLAG_EXPECTED_FAIL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4682  		{ },
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4683  		{ },
09584b406742413 Yonghong Song      2018-02-02  4684  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4685  		.expected_errcode = -EINVAL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4686  	},
108cc22a93e1843 Daniel Borkmann    2014-05-26  4687  	{	/* Mainly checking JIT here. */
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4688  		"M[]: alt STX + LDX",
108cc22a93e1843 Daniel Borkmann    2014-05-26  4689  		.u.insns = {
108cc22a93e1843 Daniel Borkmann    2014-05-26  4690  			BPF_STMT(BPF_LDX | BPF_IMM, 100),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4691  			BPF_STMT(BPF_STX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4692  			BPF_STMT(BPF_LDX | BPF_MEM, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4693  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4694  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4695  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4696  			BPF_STMT(BPF_STX, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4697  			BPF_STMT(BPF_LDX | BPF_MEM, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4698  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4699  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4700  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4701  			BPF_STMT(BPF_STX, 2),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4702  			BPF_STMT(BPF_LDX | BPF_MEM, 2),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4703  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4704  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4705  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4706  			BPF_STMT(BPF_STX, 3),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4707  			BPF_STMT(BPF_LDX | BPF_MEM, 3),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4708  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4709  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4710  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4711  			BPF_STMT(BPF_STX, 4),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4712  			BPF_STMT(BPF_LDX | BPF_MEM, 4),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4713  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4714  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4715  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4716  			BPF_STMT(BPF_STX, 5),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4717  			BPF_STMT(BPF_LDX | BPF_MEM, 5),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4718  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4719  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4720  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4721  			BPF_STMT(BPF_STX, 6),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4722  			BPF_STMT(BPF_LDX | BPF_MEM, 6),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4723  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4724  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4725  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4726  			BPF_STMT(BPF_STX, 7),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4727  			BPF_STMT(BPF_LDX | BPF_MEM, 7),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4728  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4729  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4730  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4731  			BPF_STMT(BPF_STX, 8),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4732  			BPF_STMT(BPF_LDX | BPF_MEM, 8),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4733  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4734  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4735  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4736  			BPF_STMT(BPF_STX, 9),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4737  			BPF_STMT(BPF_LDX | BPF_MEM, 9),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4738  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4739  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4740  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4741  			BPF_STMT(BPF_STX, 10),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4742  			BPF_STMT(BPF_LDX | BPF_MEM, 10),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4743  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4744  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4745  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4746  			BPF_STMT(BPF_STX, 11),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4747  			BPF_STMT(BPF_LDX | BPF_MEM, 11),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4748  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4749  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4750  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4751  			BPF_STMT(BPF_STX, 12),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4752  			BPF_STMT(BPF_LDX | BPF_MEM, 12),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4753  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4754  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4755  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4756  			BPF_STMT(BPF_STX, 13),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4757  			BPF_STMT(BPF_LDX | BPF_MEM, 13),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4758  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4759  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4760  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4761  			BPF_STMT(BPF_STX, 14),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4762  			BPF_STMT(BPF_LDX | BPF_MEM, 14),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4763  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4764  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4765  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4766  			BPF_STMT(BPF_STX, 15),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4767  			BPF_STMT(BPF_LDX | BPF_MEM, 15),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4768  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4769  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4770  			BPF_STMT(BPF_MISC | BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4771  			BPF_STMT(BPF_RET | BPF_A, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4772  		},
108cc22a93e1843 Daniel Borkmann    2014-05-26  4773  		CLASSIC | FLAG_NO_DATA,
108cc22a93e1843 Daniel Borkmann    2014-05-26  4774  		{ },
108cc22a93e1843 Daniel Borkmann    2014-05-26  4775  		{ { 0, 116 } },
108cc22a93e1843 Daniel Borkmann    2014-05-26  4776  	},
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4777  	{	/* Mainly checking JIT here. */
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4778  		"M[]: full STX + full LDX",
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4779  		.u.insns = {
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4780  			BPF_STMT(BPF_LDX | BPF_IMM, 0xbadfeedb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4781  			BPF_STMT(BPF_STX, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4782  			BPF_STMT(BPF_LDX | BPF_IMM, 0xecabedae),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4783  			BPF_STMT(BPF_STX, 1),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4784  			BPF_STMT(BPF_LDX | BPF_IMM, 0xafccfeaf),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4785  			BPF_STMT(BPF_STX, 2),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4786  			BPF_STMT(BPF_LDX | BPF_IMM, 0xbffdcedc),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4787  			BPF_STMT(BPF_STX, 3),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4788  			BPF_STMT(BPF_LDX | BPF_IMM, 0xfbbbdccb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4789  			BPF_STMT(BPF_STX, 4),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4790  			BPF_STMT(BPF_LDX | BPF_IMM, 0xfbabcbda),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4791  			BPF_STMT(BPF_STX, 5),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4792  			BPF_STMT(BPF_LDX | BPF_IMM, 0xaedecbdb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4793  			BPF_STMT(BPF_STX, 6),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4794  			BPF_STMT(BPF_LDX | BPF_IMM, 0xadebbade),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4795  			BPF_STMT(BPF_STX, 7),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4796  			BPF_STMT(BPF_LDX | BPF_IMM, 0xfcfcfaec),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4797  			BPF_STMT(BPF_STX, 8),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4798  			BPF_STMT(BPF_LDX | BPF_IMM, 0xbcdddbdc),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4799  			BPF_STMT(BPF_STX, 9),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4800  			BPF_STMT(BPF_LDX | BPF_IMM, 0xfeefdfac),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4801  			BPF_STMT(BPF_STX, 10),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4802  			BPF_STMT(BPF_LDX | BPF_IMM, 0xcddcdeea),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4803  			BPF_STMT(BPF_STX, 11),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4804  			BPF_STMT(BPF_LDX | BPF_IMM, 0xaccfaebb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4805  			BPF_STMT(BPF_STX, 12),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4806  			BPF_STMT(BPF_LDX | BPF_IMM, 0xbdcccdcf),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4807  			BPF_STMT(BPF_STX, 13),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4808  			BPF_STMT(BPF_LDX | BPF_IMM, 0xaaedecde),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4809  			BPF_STMT(BPF_STX, 14),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4810  			BPF_STMT(BPF_LDX | BPF_IMM, 0xfaeacdad),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4811  			BPF_STMT(BPF_STX, 15),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4812  			BPF_STMT(BPF_LDX | BPF_MEM, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4813  			BPF_STMT(BPF_MISC | BPF_TXA, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4814  			BPF_STMT(BPF_LDX | BPF_MEM, 1),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4815  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4816  			BPF_STMT(BPF_LDX | BPF_MEM, 2),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4817  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4818  			BPF_STMT(BPF_LDX | BPF_MEM, 3),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4819  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4820  			BPF_STMT(BPF_LDX | BPF_MEM, 4),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4821  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4822  			BPF_STMT(BPF_LDX | BPF_MEM, 5),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4823  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4824  			BPF_STMT(BPF_LDX | BPF_MEM, 6),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4825  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4826  			BPF_STMT(BPF_LDX | BPF_MEM, 7),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4827  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4828  			BPF_STMT(BPF_LDX | BPF_MEM, 8),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4829  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4830  			BPF_STMT(BPF_LDX | BPF_MEM, 9),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4831  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4832  			BPF_STMT(BPF_LDX | BPF_MEM, 10),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4833  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4834  			BPF_STMT(BPF_LDX | BPF_MEM, 11),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4835  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4836  			BPF_STMT(BPF_LDX | BPF_MEM, 12),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4837  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4838  			BPF_STMT(BPF_LDX | BPF_MEM, 13),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4839  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4840  			BPF_STMT(BPF_LDX | BPF_MEM, 14),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4841  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4842  			BPF_STMT(BPF_LDX | BPF_MEM, 15),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4843  			BPF_STMT(BPF_ALU | BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4844  			BPF_STMT(BPF_RET | BPF_A, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4845  		},
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4846  		CLASSIC | FLAG_NO_DATA,
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4847  		{ },
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4848  		{ { 0, 0x2a5a5e5 } },
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4849  	},
d50bc1575096250 Daniel Borkmann    2014-05-29  4850  	{
d50bc1575096250 Daniel Borkmann    2014-05-29  4851  		"check: SKF_AD_MAX",
d50bc1575096250 Daniel Borkmann    2014-05-29  4852  		.u.insns = {
d50bc1575096250 Daniel Borkmann    2014-05-29  4853  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
d50bc1575096250 Daniel Borkmann    2014-05-29  4854  				 SKF_AD_OFF + SKF_AD_MAX),
d50bc1575096250 Daniel Borkmann    2014-05-29  4855  			BPF_STMT(BPF_RET | BPF_A, 0),
d50bc1575096250 Daniel Borkmann    2014-05-29  4856  		},
d50bc1575096250 Daniel Borkmann    2014-05-29  4857  		CLASSIC | FLAG_NO_DATA | FLAG_EXPECTED_FAIL,
d50bc1575096250 Daniel Borkmann    2014-05-29  4858  		{ },
d50bc1575096250 Daniel Borkmann    2014-05-29  4859  		{ },
09584b406742413 Yonghong Song      2018-02-02  4860  		.fill_helper = NULL,
09584b406742413 Yonghong Song      2018-02-02  4861  		.expected_errcode = -EINVAL,
d50bc1575096250 Daniel Borkmann    2014-05-29  4862  	},
d50bc1575096250 Daniel Borkmann    2014-05-29  4863  	{	/* Passes checker but fails during runtime. */
d50bc1575096250 Daniel Borkmann    2014-05-29  4864  		"LD [SKF_AD_OFF-1]",
d50bc1575096250 Daniel Borkmann    2014-05-29  4865  		.u.insns = {
d50bc1575096250 Daniel Borkmann    2014-05-29  4866  			BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
d50bc1575096250 Daniel Borkmann    2014-05-29  4867  				 SKF_AD_OFF - 1),
d50bc1575096250 Daniel Borkmann    2014-05-29  4868  			BPF_STMT(BPF_RET | BPF_K, 1),
d50bc1575096250 Daniel Borkmann    2014-05-29  4869  		},
d50bc1575096250 Daniel Borkmann    2014-05-29  4870  		CLASSIC,
d50bc1575096250 Daniel Borkmann    2014-05-29  4871  		{ },
d50bc1575096250 Daniel Borkmann    2014-05-29  4872  		{ { 1, 0 } },
d50bc1575096250 Daniel Borkmann    2014-05-29  4873  	},
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4874  	{
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4875  		"load 64-bit immediate",
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4876  		.u.insns_int = {
25ee7327d04bc3f Alexei Starovoitov 2014-09-19  4877  			BPF_LD_IMM64(R1, 0x567800001234LL),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4878  			BPF_MOV64_REG(R2, R1),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4879  			BPF_MOV64_REG(R3, R2),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4880  			BPF_ALU64_IMM(BPF_RSH, R2, 32),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4881  			BPF_ALU64_IMM(BPF_LSH, R3, 32),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4882  			BPF_ALU64_IMM(BPF_RSH, R3, 32),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4883  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4884  			BPF_JMP_IMM(BPF_JEQ, R2, 0x5678, 1),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4885  			BPF_EXIT_INSN(),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4886  			BPF_JMP_IMM(BPF_JEQ, R3, 0x1234, 1),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4887  			BPF_EXIT_INSN(),
986ccfdbd90a292 Xi Wang            2015-05-09  4888  			BPF_LD_IMM64(R0, 0x1ffffffffLL),
986ccfdbd90a292 Xi Wang            2015-05-09  4889  			BPF_ALU64_IMM(BPF_RSH, R0, 32), /* R0 = 1 */
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4890  			BPF_EXIT_INSN(),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4891  		},
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4892  		INTERNAL,
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4893  		{ },
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4894  		{ { 0, 1 } }
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4895  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4896  	/* BPF_ALU | BPF_MOV | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  4897  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4898  		"ALU_MOV_X: dst = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4899  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  4900  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4901  			BPF_ALU32_REG(BPF_MOV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4902  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4903  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4904  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4905  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4906  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4907  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4908  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4909  		"ALU_MOV_X: dst = 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4910  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4911  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4912  			BPF_ALU32_REG(BPF_MOV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4913  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4914  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4915  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4916  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4917  		{ { 0, 4294967295U } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4918  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4919  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4920  		"ALU64_MOV_X: dst = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4921  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  4922  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4923  			BPF_ALU64_REG(BPF_MOV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4924  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4925  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4926  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4927  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4928  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4929  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4930  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4931  		"ALU64_MOV_X: dst = 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4932  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4933  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4934  			BPF_ALU64_REG(BPF_MOV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4935  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4936  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4937  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4938  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4939  		{ { 0, 4294967295U } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4940  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4941  	/* BPF_ALU | BPF_MOV | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  4942  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4943  		"ALU_MOV_K: dst = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4944  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  4945  			BPF_ALU32_IMM(BPF_MOV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4946  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4947  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4948  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4949  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4950  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4951  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4952  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4953  		"ALU_MOV_K: dst = 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4954  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4955  			BPF_ALU32_IMM(BPF_MOV, R0, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4956  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4957  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4958  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4959  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4960  		{ { 0, 4294967295U } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4961  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4962  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4963  		"ALU_MOV_K: 0x0000ffffffff0000 = 0x00000000ffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  4964  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4965  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  4966  			BPF_LD_IMM64(R3, 0x00000000ffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  4967  			BPF_ALU32_IMM(BPF_MOV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  4968  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4969  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4970  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4971  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4972  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4973  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4974  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4975  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4976  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4977  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4978  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4979  		"ALU_MOV_K: small negative",
565731acfcf28ff Johan Almbladh     2021-08-09  4980  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  4981  			BPF_ALU32_IMM(BPF_MOV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  4982  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4983  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4984  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4985  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4986  		{ { 0, -123 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4987  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4988  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4989  		"ALU_MOV_K: small negative zero extension",
565731acfcf28ff Johan Almbladh     2021-08-09  4990  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  4991  			BPF_ALU32_IMM(BPF_MOV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  4992  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  4993  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4994  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4995  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4996  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4997  		{ { 0, 0 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4998  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4999  	{
565731acfcf28ff Johan Almbladh     2021-08-09  5000  		"ALU_MOV_K: large negative",
565731acfcf28ff Johan Almbladh     2021-08-09  5001  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  5002  			BPF_ALU32_IMM(BPF_MOV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  5003  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  5004  		},
565731acfcf28ff Johan Almbladh     2021-08-09  5005  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  5006  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  5007  		{ { 0, -123456789 } }
565731acfcf28ff Johan Almbladh     2021-08-09  5008  	},
565731acfcf28ff Johan Almbladh     2021-08-09  5009  	{
565731acfcf28ff Johan Almbladh     2021-08-09  5010  		"ALU_MOV_K: large negative zero extension",
565731acfcf28ff Johan Almbladh     2021-08-09  5011  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  5012  			BPF_ALU32_IMM(BPF_MOV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  5013  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  5014  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  5015  		},
565731acfcf28ff Johan Almbladh     2021-08-09  5016  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  5017  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  5018  		{ { 0, 0 } }
565731acfcf28ff Johan Almbladh     2021-08-09  5019  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5020  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5021  		"ALU64_MOV_K: dst = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5022  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5023  			BPF_ALU64_IMM(BPF_MOV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5024  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5025  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5026  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5027  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5028  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5029  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5030  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5031  		"ALU64_MOV_K: dst = 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5032  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5033  			BPF_ALU64_IMM(BPF_MOV, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5034  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5035  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5036  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5037  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5038  		{ { 0, 2147483647 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5039  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5040  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5041  		"ALU64_OR_K: dst = 0x0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5042  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5043  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5044  			BPF_LD_IMM64(R3, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5045  			BPF_ALU64_IMM(BPF_MOV, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5046  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5047  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5048  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5049  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5050  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5051  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5052  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5053  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5054  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5055  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5056  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5057  		"ALU64_MOV_K: dst = -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5058  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5059  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5060  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5061  			BPF_ALU64_IMM(BPF_MOV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5062  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5063  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5064  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5065  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5066  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5067  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5068  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5069  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5070  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5071  	},
565731acfcf28ff Johan Almbladh     2021-08-09  5072  	{
565731acfcf28ff Johan Almbladh     2021-08-09  5073  		"ALU64_MOV_K: small negative",
565731acfcf28ff Johan Almbladh     2021-08-09  5074  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  5075  			BPF_ALU64_IMM(BPF_MOV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  5076  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  5077  		},
565731acfcf28ff Johan Almbladh     2021-08-09  5078  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  5079  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  5080  		{ { 0, -123 } }
565731acfcf28ff Johan Almbladh     2021-08-09  5081  	},
565731acfcf28ff Johan Almbladh     2021-08-09  5082  	{
565731acfcf28ff Johan Almbladh     2021-08-09  5083  		"ALU64_MOV_K: small negative sign extension",
565731acfcf28ff Johan Almbladh     2021-08-09  5084  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  5085  			BPF_ALU64_IMM(BPF_MOV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  5086  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  5087  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  5088  		},
565731acfcf28ff Johan Almbladh     2021-08-09  5089  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  5090  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  5091  		{ { 0, 0xffffffff } }
565731acfcf28ff Johan Almbladh     2021-08-09  5092  	},
565731acfcf28ff Johan Almbladh     2021-08-09  5093  	{
565731acfcf28ff Johan Almbladh     2021-08-09  5094  		"ALU64_MOV_K: large negative",
565731acfcf28ff Johan Almbladh     2021-08-09  5095  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  5096  			BPF_ALU64_IMM(BPF_MOV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  5097  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  5098  		},
565731acfcf28ff Johan Almbladh     2021-08-09  5099  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  5100  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  5101  		{ { 0, -123456789 } }
565731acfcf28ff Johan Almbladh     2021-08-09  5102  	},
565731acfcf28ff Johan Almbladh     2021-08-09  5103  	{
565731acfcf28ff Johan Almbladh     2021-08-09  5104  		"ALU64_MOV_K: large negative sign extension",
565731acfcf28ff Johan Almbladh     2021-08-09  5105  		.u.insns_int = {
565731acfcf28ff Johan Almbladh     2021-08-09  5106  			BPF_ALU64_IMM(BPF_MOV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  5107  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  5108  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  5109  		},
565731acfcf28ff Johan Almbladh     2021-08-09  5110  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  5111  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  5112  		{ { 0, 0xffffffff } }
565731acfcf28ff Johan Almbladh     2021-08-09  5113  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5114  	/* MOVSX32 */
daabb2b098e0475 Puranjay Mohan     2023-09-07  5115  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  5116  		"ALU_MOVSX | BPF_B",
daabb2b098e0475 Puranjay Mohan     2023-09-07  5117  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  5118  			BPF_LD_IMM64(R2, 0x00000000ffffffefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07 @5119  			BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5120  			BPF_MOVSX32_REG(R1, R3, 8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5121  			BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5122  			BPF_MOV32_IMM(R0, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5123  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5124  			BPF_MOV32_IMM(R0, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5125  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5126  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5127  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  5128  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5129  		{ { 0, 0x1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5130  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5131  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  5132  		"ALU_MOVSX | BPF_H",
daabb2b098e0475 Puranjay Mohan     2023-09-07  5133  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  5134  			BPF_LD_IMM64(R2, 0x00000000ffffbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5135  			BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5136  			BPF_MOVSX32_REG(R1, R3, 16),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5137  			BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5138  			BPF_MOV32_IMM(R0, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5139  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5140  			BPF_MOV32_IMM(R0, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5141  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5142  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5143  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  5144  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5145  		{ { 0, 0x1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5146  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5147  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  5148  		"ALU_MOVSX | BPF_W",
daabb2b098e0475 Puranjay Mohan     2023-09-07  5149  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  5150  			BPF_LD_IMM64(R2, 0x00000000deadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5151  			BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5152  			BPF_MOVSX32_REG(R1, R3, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5153  			BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5154  			BPF_MOV32_IMM(R0, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5155  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5156  			BPF_MOV32_IMM(R0, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5157  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5158  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5159  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  5160  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5161  		{ { 0, 0x1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5162  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5163  	/* MOVSX64 REG */
daabb2b098e0475 Puranjay Mohan     2023-09-07  5164  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  5165  		"ALU64_MOVSX | BPF_B",
daabb2b098e0475 Puranjay Mohan     2023-09-07  5166  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  5167  			BPF_LD_IMM64(R2, 0xffffffffffffffefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5168  			BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5169  			BPF_MOVSX64_REG(R1, R3, 8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5170  			BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5171  			BPF_MOV32_IMM(R0, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5172  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5173  			BPF_MOV32_IMM(R0, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5174  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5175  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5176  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  5177  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5178  		{ { 0, 0x1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5179  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5180  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  5181  		"ALU64_MOVSX | BPF_H",
daabb2b098e0475 Puranjay Mohan     2023-09-07  5182  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  5183  			BPF_LD_IMM64(R2, 0xffffffffffffbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5184  			BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5185  			BPF_MOVSX64_REG(R1, R3, 16),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5186  			BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5187  			BPF_MOV32_IMM(R0, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5188  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5189  			BPF_MOV32_IMM(R0, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5190  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5191  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5192  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  5193  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5194  		{ { 0, 0x1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5195  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5196  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  5197  		"ALU64_MOVSX | BPF_W",
daabb2b098e0475 Puranjay Mohan     2023-09-07  5198  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  5199  			BPF_LD_IMM64(R2, 0xffffffffdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5200  			BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5201  			BPF_MOVSX64_REG(R1, R3, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5202  			BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5203  			BPF_MOV32_IMM(R0, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5204  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5205  			BPF_MOV32_IMM(R0, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5206  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  5207  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  5208  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  5209  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5210  		{ { 0, 0x1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  5211  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5212  	/* BPF_ALU | BPF_ADD | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5213  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5214  		"ALU_ADD_X: 1 + 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5215  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5216  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5217  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5218  			BPF_ALU32_REG(BPF_ADD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5219  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5220  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5221  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5222  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5223  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5224  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5225  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5226  		"ALU_ADD_X: 1 + 4294967294 = 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  5227  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5228  			BPF_LD_IMM64(R0, 1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5229  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5230  			BPF_ALU32_REG(BPF_ADD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5231  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5232  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5233  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5234  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  5235  		{ { 0, 4294967295U } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5236  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  5237  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  5238  		"ALU_ADD_X: 2 + 4294967294 = 0",
b64b50eac47046f Naveen N. Rao      2016-04-05  5239  		.u.insns_int = {
b64b50eac47046f Naveen N. Rao      2016-04-05  5240  			BPF_LD_IMM64(R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5241  			BPF_LD_IMM64(R1, 4294967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  5242  			BPF_ALU32_REG(BPF_ADD, R0, R1),
b64b50eac47046f Naveen N. Rao      2016-04-05  5243  			BPF_JMP_IMM(BPF_JEQ, R0, 0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5244  			BPF_ALU32_IMM(BPF_MOV, R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  5245  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5246  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  5247  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5248  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  5249  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  5250  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  5251  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  5252  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5253  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5254  		"ALU64_ADD_X: 1 + 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5255  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5256  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5257  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5258  			BPF_ALU64_REG(BPF_ADD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5259  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5260  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5261  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5262  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5263  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5264  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5265  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5266  		"ALU64_ADD_X: 1 + 4294967294 = 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  5267  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5268  			BPF_LD_IMM64(R0, 1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5269  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5270  			BPF_ALU64_REG(BPF_ADD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5271  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5272  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5273  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5274  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  5275  		{ { 0, 4294967295U } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5276  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  5277  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  5278  		"ALU64_ADD_X: 2 + 4294967294 = 4294967296",
b64b50eac47046f Naveen N. Rao      2016-04-05  5279  		.u.insns_int = {
b64b50eac47046f Naveen N. Rao      2016-04-05  5280  			BPF_LD_IMM64(R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5281  			BPF_LD_IMM64(R1, 4294967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  5282  			BPF_LD_IMM64(R2, 4294967296ULL),
b64b50eac47046f Naveen N. Rao      2016-04-05  5283  			BPF_ALU64_REG(BPF_ADD, R0, R1),
b64b50eac47046f Naveen N. Rao      2016-04-05  5284  			BPF_JMP_REG(BPF_JEQ, R0, R2, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5285  			BPF_MOV32_IMM(R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  5286  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5287  			BPF_MOV32_IMM(R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  5288  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5289  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  5290  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  5291  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  5292  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  5293  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5294  	/* BPF_ALU | BPF_ADD | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5295  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5296  		"ALU_ADD_K: 1 + 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5297  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5298  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5299  			BPF_ALU32_IMM(BPF_ADD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5300  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5301  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5302  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5303  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5304  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5305  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5306  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5307  		"ALU_ADD_K: 3 + 0 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5308  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5309  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5310  			BPF_ALU32_IMM(BPF_ADD, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5311  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5312  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5313  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5314  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5315  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5316  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5317  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5318  		"ALU_ADD_K: 1 + 4294967294 = 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  5319  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5320  			BPF_LD_IMM64(R0, 1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5321  			BPF_ALU32_IMM(BPF_ADD, R0, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5322  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5323  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5324  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5325  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  5326  		{ { 0, 4294967295U } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5327  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  5328  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  5329  		"ALU_ADD_K: 4294967294 + 2 = 0",
b64b50eac47046f Naveen N. Rao      2016-04-05  5330  		.u.insns_int = {
b64b50eac47046f Naveen N. Rao      2016-04-05  5331  			BPF_LD_IMM64(R0, 4294967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  5332  			BPF_ALU32_IMM(BPF_ADD, R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5333  			BPF_JMP_IMM(BPF_JEQ, R0, 0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5334  			BPF_ALU32_IMM(BPF_MOV, R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  5335  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5336  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  5337  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5338  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  5339  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  5340  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  5341  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  5342  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5343  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5344  		"ALU_ADD_K: 0 + (-1) = 0x00000000ffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5345  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5346  			BPF_LD_IMM64(R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5347  			BPF_LD_IMM64(R3, 0x00000000ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5348  			BPF_ALU32_IMM(BPF_ADD, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5349  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5350  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5351  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5352  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5353  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5354  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5355  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5356  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5357  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5358  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5359  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5360  		"ALU_ADD_K: 0 + 0xffff = 0xffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5361  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5362  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5363  			BPF_LD_IMM64(R3, 0xffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5364  			BPF_ALU32_IMM(BPF_ADD, R2, 0xffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5365  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5366  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5367  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5368  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5369  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5370  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5371  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5372  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5373  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5374  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5375  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5376  		"ALU_ADD_K: 0 + 0x7fffffff = 0x7fffffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5377  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5378  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5379  			BPF_LD_IMM64(R3, 0x7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5380  			BPF_ALU32_IMM(BPF_ADD, R2, 0x7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5381  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5382  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5383  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5384  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5385  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5386  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5387  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5388  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5389  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5390  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5391  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5392  		"ALU_ADD_K: 0 + 0x80000000 = 0x80000000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5393  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5394  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5395  			BPF_LD_IMM64(R3, 0x80000000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5396  			BPF_ALU32_IMM(BPF_ADD, R2, 0x80000000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5397  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5398  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5399  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5400  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5401  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5402  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5403  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5404  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5405  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5406  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5407  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5408  		"ALU_ADD_K: 0 + 0x80008000 = 0x80008000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5409  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5410  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5411  			BPF_LD_IMM64(R3, 0x80008000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5412  			BPF_ALU32_IMM(BPF_ADD, R2, 0x80008000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5413  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5414  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5415  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5416  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5417  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5418  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5419  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5420  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5421  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5422  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5423  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5424  		"ALU64_ADD_K: 1 + 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5425  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5426  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5427  			BPF_ALU64_IMM(BPF_ADD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5428  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5429  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5430  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5431  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5432  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5433  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5434  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5435  		"ALU64_ADD_K: 3 + 0 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5436  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5437  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5438  			BPF_ALU64_IMM(BPF_ADD, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5439  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5440  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5441  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5442  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5443  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5444  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5445  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5446  		"ALU64_ADD_K: 1 + 2147483646 = 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5447  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5448  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5449  			BPF_ALU64_IMM(BPF_ADD, R0, 2147483646),
cffc642d93f9324 Michael Holzheu    2015-05-11  5450  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5451  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5452  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5453  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5454  		{ { 0, 2147483647 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5455  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  5456  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  5457  		"ALU64_ADD_K: 4294967294 + 2 = 4294967296",
b64b50eac47046f Naveen N. Rao      2016-04-05  5458  		.u.insns_int = {
b64b50eac47046f Naveen N. Rao      2016-04-05  5459  			BPF_LD_IMM64(R0, 4294967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  5460  			BPF_LD_IMM64(R1, 4294967296ULL),
b64b50eac47046f Naveen N. Rao      2016-04-05  5461  			BPF_ALU64_IMM(BPF_ADD, R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5462  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  5463  			BPF_ALU32_IMM(BPF_MOV, R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  5464  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5465  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  5466  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  5467  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  5468  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  5469  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  5470  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  5471  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5472  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5473  		"ALU64_ADD_K: 2147483646 + -2147483647 = -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5474  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5475  			BPF_LD_IMM64(R0, 2147483646),
cffc642d93f9324 Michael Holzheu    2015-05-11  5476  			BPF_ALU64_IMM(BPF_ADD, R0, -2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5477  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5478  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5479  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5480  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5481  		{ { 0, -1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5482  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5483  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5484  		"ALU64_ADD_K: 1 + 0 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5485  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5486  			BPF_LD_IMM64(R2, 0x1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5487  			BPF_LD_IMM64(R3, 0x1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5488  			BPF_ALU64_IMM(BPF_ADD, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5489  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5490  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5491  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5492  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5493  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5494  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5495  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5496  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5497  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5498  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5499  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5500  		"ALU64_ADD_K: 0 + (-1) = 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5501  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5502  			BPF_LD_IMM64(R2, 0x0),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5503  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5504  			BPF_ALU64_IMM(BPF_ADD, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5505  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5506  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5507  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5508  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5509  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5510  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5511  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5512  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5513  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5514  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5515  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5516  		"ALU64_ADD_K: 0 + 0xffff = 0xffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5517  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5518  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5519  			BPF_LD_IMM64(R3, 0xffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5520  			BPF_ALU64_IMM(BPF_ADD, R2, 0xffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5521  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5522  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5523  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5524  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5525  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5526  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5527  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5528  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5529  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5530  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5531  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5532  		"ALU64_ADD_K: 0 + 0x7fffffff = 0x7fffffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5533  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5534  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5535  			BPF_LD_IMM64(R3, 0x7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5536  			BPF_ALU64_IMM(BPF_ADD, R2, 0x7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5537  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5538  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5539  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5540  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5541  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5542  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5543  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5544  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5545  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5546  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5547  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5548  		"ALU64_ADD_K: 0 + 0x80000000 = 0xffffffff80000000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5549  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5550  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5551  			BPF_LD_IMM64(R3, 0xffffffff80000000LL),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5552  			BPF_ALU64_IMM(BPF_ADD, R2, 0x80000000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5553  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5554  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5555  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5556  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5557  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5558  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5559  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5560  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5561  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5562  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5563  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5564  		"ALU_ADD_K: 0 + 0x80008000 = 0xffffffff80008000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5565  		.u.insns_int = {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5566  			BPF_LD_IMM64(R2, 0x0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5567  			BPF_LD_IMM64(R3, 0xffffffff80008000LL),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5568  			BPF_ALU64_IMM(BPF_ADD, R2, 0x80008000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5569  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5570  			BPF_MOV32_IMM(R0, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5571  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5572  			BPF_MOV32_IMM(R0, 1),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5573  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5574  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5575  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5576  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5577  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5578  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5579  	/* BPF_ALU | BPF_SUB | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5580  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5581  		"ALU_SUB_X: 3 - 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5582  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5583  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5584  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5585  			BPF_ALU32_REG(BPF_SUB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5586  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5587  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5588  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5589  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5590  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5591  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5592  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5593  		"ALU_SUB_X: 4294967295 - 4294967294 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5594  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5595  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5596  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5597  			BPF_ALU32_REG(BPF_SUB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5598  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5599  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5600  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5601  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5602  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5603  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5604  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5605  		"ALU64_SUB_X: 3 - 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5606  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5607  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5608  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5609  			BPF_ALU64_REG(BPF_SUB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5610  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5611  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5612  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5613  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5614  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5615  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5616  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5617  		"ALU64_SUB_X: 4294967295 - 4294967294 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5618  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5619  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5620  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5621  			BPF_ALU64_REG(BPF_SUB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5622  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5623  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5624  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5625  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5626  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5627  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5628  	/* BPF_ALU | BPF_SUB | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5629  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5630  		"ALU_SUB_K: 3 - 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5631  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5632  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5633  			BPF_ALU32_IMM(BPF_SUB, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5634  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5635  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5636  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5637  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5638  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5639  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5640  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5641  		"ALU_SUB_K: 3 - 0 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5642  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5643  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5644  			BPF_ALU32_IMM(BPF_SUB, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5645  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5646  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5647  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5648  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5649  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5650  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5651  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5652  		"ALU_SUB_K: 4294967295 - 4294967294 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5653  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5654  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5655  			BPF_ALU32_IMM(BPF_SUB, R0, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5656  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5657  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5658  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5659  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5660  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5661  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5662  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5663  		"ALU64_SUB_K: 3 - 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5664  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5665  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5666  			BPF_ALU64_IMM(BPF_SUB, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5667  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5668  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5669  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5670  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5671  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5672  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5673  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5674  		"ALU64_SUB_K: 3 - 0 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5675  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5676  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5677  			BPF_ALU64_IMM(BPF_SUB, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5678  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5679  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5680  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5681  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5682  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5683  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5684  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5685  		"ALU64_SUB_K: 4294967294 - 4294967295 = -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5686  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5687  			BPF_LD_IMM64(R0, 4294967294U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5688  			BPF_ALU64_IMM(BPF_SUB, R0, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5689  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5690  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5691  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5692  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5693  		{ { 0, -1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5694  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5695  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5696  		"ALU64_ADD_K: 2147483646 - 2147483647 = -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5697  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5698  			BPF_LD_IMM64(R0, 2147483646),
cffc642d93f9324 Michael Holzheu    2015-05-11  5699  			BPF_ALU64_IMM(BPF_SUB, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5700  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5701  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5702  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5703  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5704  		{ { 0, -1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5705  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5706  	/* BPF_ALU | BPF_MUL | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5707  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5708  		"ALU_MUL_X: 2 * 3 = 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5709  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5710  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5711  			BPF_ALU32_IMM(BPF_MOV, R1, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5712  			BPF_ALU32_REG(BPF_MUL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5713  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5714  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5715  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5716  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5717  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5718  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5719  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5720  		"ALU_MUL_X: 2 * 0x7FFFFFF8 = 0xFFFFFFF0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5721  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5722  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5723  			BPF_ALU32_IMM(BPF_MOV, R1, 0x7FFFFFF8),
cffc642d93f9324 Michael Holzheu    2015-05-11  5724  			BPF_ALU32_REG(BPF_MUL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5725  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5726  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5727  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5728  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5729  		{ { 0, 0xFFFFFFF0 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5730  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5731  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5732  		"ALU_MUL_X: -1 * -1 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5733  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5734  			BPF_LD_IMM64(R0, -1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5735  			BPF_ALU32_IMM(BPF_MOV, R1, -1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5736  			BPF_ALU32_REG(BPF_MUL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5737  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5738  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5739  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5740  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5741  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5742  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5743  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5744  		"ALU64_MUL_X: 2 * 3 = 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5745  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5746  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5747  			BPF_ALU32_IMM(BPF_MOV, R1, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5748  			BPF_ALU64_REG(BPF_MUL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5749  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5750  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5751  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5752  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5753  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5754  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5755  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5756  		"ALU64_MUL_X: 1 * 2147483647 = 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5757  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5758  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5759  			BPF_ALU32_IMM(BPF_MOV, R1, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5760  			BPF_ALU64_REG(BPF_MUL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5761  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5762  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5763  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5764  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5765  		{ { 0, 2147483647 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5766  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5767  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5768  		"ALU64_MUL_X: 64x64 multiply, low word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5769  		.u.insns_int = {
faa576253d5fe75 Johan Almbladh     2021-08-09  5770  			BPF_LD_IMM64(R0, 0x0fedcba987654321LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5771  			BPF_LD_IMM64(R1, 0x123456789abcdef0LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5772  			BPF_ALU64_REG(BPF_MUL, R0, R1),
faa576253d5fe75 Johan Almbladh     2021-08-09  5773  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5774  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5775  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5776  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5777  		{ { 0, 0xe5618cf0 } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5778  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5779  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5780  		"ALU64_MUL_X: 64x64 multiply, high word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5781  		.u.insns_int = {
faa576253d5fe75 Johan Almbladh     2021-08-09  5782  			BPF_LD_IMM64(R0, 0x0fedcba987654321LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5783  			BPF_LD_IMM64(R1, 0x123456789abcdef0LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5784  			BPF_ALU64_REG(BPF_MUL, R0, R1),
faa576253d5fe75 Johan Almbladh     2021-08-09  5785  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
faa576253d5fe75 Johan Almbladh     2021-08-09  5786  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5787  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5788  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5789  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5790  		{ { 0, 0x2236d88f } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5791  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5792  	/* BPF_ALU | BPF_MUL | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5793  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5794  		"ALU_MUL_K: 2 * 3 = 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5795  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5796  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5797  			BPF_ALU32_IMM(BPF_MUL, R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5798  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5799  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5800  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5801  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5802  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5803  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5804  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5805  		"ALU_MUL_K: 3 * 1 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5806  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5807  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5808  			BPF_ALU32_IMM(BPF_MUL, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5809  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5810  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5811  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5812  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5813  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5814  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5815  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5816  		"ALU_MUL_K: 2 * 0x7FFFFFF8 = 0xFFFFFFF0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5817  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5818  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5819  			BPF_ALU32_IMM(BPF_MUL, R0, 0x7FFFFFF8),
cffc642d93f9324 Michael Holzheu    2015-05-11  5820  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5821  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5822  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5823  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5824  		{ { 0, 0xFFFFFFF0 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5825  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5826  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5827  		"ALU_MUL_K: 1 * (-1) = 0x00000000ffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5828  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5829  			BPF_LD_IMM64(R2, 0x1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5830  			BPF_LD_IMM64(R3, 0x00000000ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5831  			BPF_ALU32_IMM(BPF_MUL, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5832  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5833  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5834  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5835  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5836  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5837  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5838  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5839  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5840  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5841  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5842  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5843  		"ALU64_MUL_K: 2 * 3 = 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5844  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5845  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5846  			BPF_ALU64_IMM(BPF_MUL, R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5847  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5848  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5849  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5850  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5851  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5852  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5853  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5854  		"ALU64_MUL_K: 3 * 1 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5855  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5856  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5857  			BPF_ALU64_IMM(BPF_MUL, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5858  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5859  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5860  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5861  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5862  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5863  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5864  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5865  		"ALU64_MUL_K: 1 * 2147483647 = 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5866  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5867  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5868  			BPF_ALU64_IMM(BPF_MUL, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5869  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5870  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5871  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5872  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5873  		{ { 0, 2147483647 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5874  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5875  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5876  		"ALU64_MUL_K: 1 * -2147483647 = -2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5877  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5878  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5879  			BPF_ALU64_IMM(BPF_MUL, R0, -2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5880  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5881  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5882  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5883  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5884  		{ { 0, -2147483647 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5885  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5886  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5887  		"ALU64_MUL_K: 1 * (-1) = 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5888  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5889  			BPF_LD_IMM64(R2, 0x1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5890  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5891  			BPF_ALU64_IMM(BPF_MUL, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5892  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5893  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5894  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5895  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5896  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5897  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5898  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5899  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5900  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5901  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5902  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5903  		"ALU64_MUL_K: 64x32 multiply, low word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5904  		.u.insns_int = {
faa576253d5fe75 Johan Almbladh     2021-08-09  5905  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5906  			BPF_ALU64_IMM(BPF_MUL, R0, 0x12345678),
faa576253d5fe75 Johan Almbladh     2021-08-09  5907  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5908  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5909  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5910  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5911  		{ { 0, 0xe242d208 } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5912  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5913  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5914  		"ALU64_MUL_K: 64x32 multiply, high word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5915  		.u.insns_int = {
faa576253d5fe75 Johan Almbladh     2021-08-09  5916  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5917  			BPF_ALU64_IMM(BPF_MUL, R0, 0x12345678),
faa576253d5fe75 Johan Almbladh     2021-08-09  5918  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
faa576253d5fe75 Johan Almbladh     2021-08-09  5919  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5920  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5921  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5922  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5923  		{ { 0, 0xc28f5c28 } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5924  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5925  	/* BPF_ALU | BPF_DIV | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5926  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5927  		"ALU_DIV_X: 6 / 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5928  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5929  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5930  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5931  			BPF_ALU32_REG(BPF_DIV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5932  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5933  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5934  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5935  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5936  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5937  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5938  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5939  		"ALU_DIV_X: 4294967295 / 4294967295 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5940  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5941  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5942  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5943  			BPF_ALU32_REG(BPF_DIV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5944  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5945  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5946  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5947  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5948  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5949  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5950  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5951  		"ALU64_DIV_X: 6 / 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5952  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5953  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5954  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5955  			BPF_ALU64_REG(BPF_DIV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5956  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5957  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5958  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5959  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5960  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5961  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5962  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5963  		"ALU64_DIV_X: 2147483647 / 2147483647 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5964  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5965  			BPF_LD_IMM64(R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5966  			BPF_ALU32_IMM(BPF_MOV, R1, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5967  			BPF_ALU64_REG(BPF_DIV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5968  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5969  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5970  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5971  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5972  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5973  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5974  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5975  		"ALU64_DIV_X: 0xffffffffffffffff / (-1) = 0x0000000000000001",
cffc642d93f9324 Michael Holzheu    2015-05-11  5976  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5977  			BPF_LD_IMM64(R2, 0xffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5978  			BPF_LD_IMM64(R4, 0xffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5979  			BPF_LD_IMM64(R3, 0x0000000000000001LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5980  			BPF_ALU64_REG(BPF_DIV, R2, R4),
cffc642d93f9324 Michael Holzheu    2015-05-11  5981  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5982  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5983  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5984  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5985  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5986  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5987  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5988  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5989  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5990  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5991  	/* BPF_ALU | BPF_DIV | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5992  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5993  		"ALU_DIV_K: 6 / 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5994  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  5995  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5996  			BPF_ALU32_IMM(BPF_DIV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5997  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5998  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5999  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6000  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6001  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6002  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6003  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6004  		"ALU_DIV_K: 3 / 1 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6005  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6006  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6007  			BPF_ALU32_IMM(BPF_DIV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6008  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6009  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6010  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6011  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6012  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6013  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6014  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6015  		"ALU_DIV_K: 4294967295 / 4294967295 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6016  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6017  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6018  			BPF_ALU32_IMM(BPF_DIV, R0, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  6019  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6020  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6021  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6022  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6023  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6024  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6025  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6026  		"ALU_DIV_K: 0xffffffffffffffff / (-1) = 0x1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6027  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6028  			BPF_LD_IMM64(R2, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6029  			BPF_LD_IMM64(R3, 0x1UL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6030  			BPF_ALU32_IMM(BPF_DIV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6031  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6032  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6033  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6034  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6035  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6036  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6037  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6038  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6039  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6040  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6041  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6042  		"ALU64_DIV_K: 6 / 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6043  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6044  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6045  			BPF_ALU64_IMM(BPF_DIV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6046  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6047  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6048  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6049  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6050  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6051  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6052  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6053  		"ALU64_DIV_K: 3 / 1 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6054  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6055  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6056  			BPF_ALU64_IMM(BPF_DIV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6057  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6058  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6059  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6060  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6061  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6062  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6063  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6064  		"ALU64_DIV_K: 2147483647 / 2147483647 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6065  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6066  			BPF_LD_IMM64(R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  6067  			BPF_ALU64_IMM(BPF_DIV, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  6068  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6069  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6070  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6071  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6072  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6073  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6074  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6075  		"ALU64_DIV_K: 0xffffffffffffffff / (-1) = 0x0000000000000001",
cffc642d93f9324 Michael Holzheu    2015-05-11  6076  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6077  			BPF_LD_IMM64(R2, 0xffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6078  			BPF_LD_IMM64(R3, 0x0000000000000001LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6079  			BPF_ALU64_IMM(BPF_DIV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6080  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6081  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6082  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6083  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6084  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6085  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6086  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6087  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6088  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6089  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6090  	/* BPF_ALU | BPF_MOD | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6091  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6092  		"ALU_MOD_X: 3 % 2 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6093  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6094  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6095  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6096  			BPF_ALU32_REG(BPF_MOD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6097  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6098  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6099  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6100  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6101  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6102  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6103  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6104  		"ALU_MOD_X: 4294967295 % 4294967293 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6105  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6106  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6107  			BPF_ALU32_IMM(BPF_MOV, R1, 4294967293U),
cffc642d93f9324 Michael Holzheu    2015-05-11  6108  			BPF_ALU32_REG(BPF_MOD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6109  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6110  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6111  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6112  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6113  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6114  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6115  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6116  		"ALU64_MOD_X: 3 % 2 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6117  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6118  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6119  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6120  			BPF_ALU64_REG(BPF_MOD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6121  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6122  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6123  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6124  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6125  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6126  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6127  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6128  		"ALU64_MOD_X: 2147483647 % 2147483645 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6129  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6130  			BPF_LD_IMM64(R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  6131  			BPF_ALU32_IMM(BPF_MOV, R1, 2147483645),
cffc642d93f9324 Michael Holzheu    2015-05-11  6132  			BPF_ALU64_REG(BPF_MOD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6133  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6134  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6135  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6136  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6137  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6138  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6139  	/* BPF_ALU | BPF_MOD | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6140  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6141  		"ALU_MOD_K: 3 % 2 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6142  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6143  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6144  			BPF_ALU32_IMM(BPF_MOD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6145  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6146  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6147  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6148  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6149  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6150  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6151  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6152  		"ALU_MOD_K: 3 % 1 = 0",
cffc642d93f9324 Michael Holzheu    2015-05-11  6153  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6154  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6155  			BPF_ALU32_IMM(BPF_MOD, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6156  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6157  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6158  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6159  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6160  		{ { 0, 0 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6161  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6162  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6163  		"ALU_MOD_K: 4294967295 % 4294967293 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6164  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6165  			BPF_LD_IMM64(R0, 4294967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6166  			BPF_ALU32_IMM(BPF_MOD, R0, 4294967293U),
cffc642d93f9324 Michael Holzheu    2015-05-11  6167  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6168  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6169  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6170  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6171  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6172  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6173  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6174  		"ALU64_MOD_K: 3 % 2 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6175  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6176  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6177  			BPF_ALU64_IMM(BPF_MOD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6178  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6179  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6180  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6181  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6182  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6183  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6184  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6185  		"ALU64_MOD_K: 3 % 1 = 0",
cffc642d93f9324 Michael Holzheu    2015-05-11  6186  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6187  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6188  			BPF_ALU64_IMM(BPF_MOD, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6189  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6190  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6191  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6192  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6193  		{ { 0, 0 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6194  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6195  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6196  		"ALU64_MOD_K: 2147483647 % 2147483645 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6197  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6198  			BPF_LD_IMM64(R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  6199  			BPF_ALU64_IMM(BPF_MOD, R0, 2147483645),
cffc642d93f9324 Michael Holzheu    2015-05-11  6200  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6201  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6202  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6203  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6204  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6205  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6206  	/* BPF_ALU | BPF_DIV | BPF_X off=1 (SDIV) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6207  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6208  		"ALU_SDIV_X: -6 / 2 = -3",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6209  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6210  			BPF_LD_IMM64(R0, -6),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6211  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6212  			BPF_ALU32_REG_OFF(BPF_DIV, R0, R1, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6213  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6214  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6215  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6216  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6217  		{ { 0, -3 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6218  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6219  	/* BPF_ALU | BPF_DIV | BPF_K off=1 (SDIV) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6220  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6221  		"ALU_SDIV_K: -6 / 2 = -3",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6222  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6223  			BPF_LD_IMM64(R0, -6),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6224  			BPF_ALU32_IMM_OFF(BPF_DIV, R0, 2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6225  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6226  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6227  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6228  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6229  		{ { 0, -3 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6230  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6231  	/* BPF_ALU64 | BPF_DIV | BPF_X off=1 (SDIV64) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6232  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6233  		"ALU64_SDIV_X: -6 / 2 = -3",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6234  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6235  			BPF_LD_IMM64(R0, -6),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6236  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6237  			BPF_ALU64_REG_OFF(BPF_DIV, R0, R1, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6238  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6239  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6240  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6241  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6242  		{ { 0, -3 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6243  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6244  	/* BPF_ALU64 | BPF_DIV | BPF_K off=1 (SDIV64) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6245  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6246  		"ALU64_SDIV_K: -6 / 2 = -3",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6247  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6248  			BPF_LD_IMM64(R0, -6),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6249  			BPF_ALU64_IMM_OFF(BPF_DIV, R0, 2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6250  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6251  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6252  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6253  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6254  		{ { 0, -3 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6255  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6256  	/* BPF_ALU | BPF_MOD | BPF_X off=1 (SMOD) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6257  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6258  		"ALU_SMOD_X: -7 % 2 = -1",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6259  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6260  			BPF_LD_IMM64(R0, -7),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6261  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6262  			BPF_ALU32_REG_OFF(BPF_MOD, R0, R1, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6263  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6264  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6265  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6266  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6267  		{ { 0, -1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6268  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6269  	/* BPF_ALU | BPF_MOD | BPF_K off=1 (SMOD) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6270  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6271  		"ALU_SMOD_K: -7 % 2 = -1",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6272  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6273  			BPF_LD_IMM64(R0, -7),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6274  			BPF_ALU32_IMM_OFF(BPF_MOD, R0, 2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6275  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6276  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6277  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6278  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6279  		{ { 0, -1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6280  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6281  	/* BPF_ALU64 | BPF_MOD | BPF_X off=1 (SMOD64) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6282  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6283  		"ALU64_SMOD_X: -7 % 2 = -1",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6284  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6285  			BPF_LD_IMM64(R0, -7),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6286  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6287  			BPF_ALU64_REG_OFF(BPF_MOD, R0, R1, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6288  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6289  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6290  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6291  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6292  		{ { 0, -1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6293  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6294  	/* BPF_ALU64 | BPF_MOD | BPF_K off=1 (SMOD64) */
daabb2b098e0475 Puranjay Mohan     2023-09-07  6295  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  6296  		"ALU64_SMOD_X: -7 % 2 = -1",
daabb2b098e0475 Puranjay Mohan     2023-09-07  6297  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  6298  			BPF_LD_IMM64(R0, -7),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6299  			BPF_ALU64_IMM_OFF(BPF_MOD, R0, 2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6300  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  6301  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  6302  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  6303  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6304  		{ { 0, -1 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  6305  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6306  	/* BPF_ALU | BPF_AND | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6307  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6308  		"ALU_AND_X: 3 & 2 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6309  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6310  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6311  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6312  			BPF_ALU32_REG(BPF_AND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6313  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6314  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6315  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6316  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6317  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6318  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6319  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6320  		"ALU_AND_X: 0xffffffff & 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6321  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6322  			BPF_LD_IMM64(R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6323  			BPF_ALU32_IMM(BPF_MOV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6324  			BPF_ALU32_REG(BPF_AND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6325  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6326  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6327  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6328  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6329  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6330  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6331  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6332  		"ALU64_AND_X: 3 & 2 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6333  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6334  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6335  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6336  			BPF_ALU64_REG(BPF_AND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6337  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6338  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6339  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6340  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6341  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6342  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6343  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6344  		"ALU64_AND_X: 0xffffffff & 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6345  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6346  			BPF_LD_IMM64(R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6347  			BPF_ALU32_IMM(BPF_MOV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6348  			BPF_ALU64_REG(BPF_AND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6349  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6350  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6351  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6352  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6353  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6354  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6355  	/* BPF_ALU | BPF_AND | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6356  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6357  		"ALU_AND_K: 3 & 2 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6358  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6359  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6360  			BPF_ALU32_IMM(BPF_AND, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6361  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6362  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6363  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6364  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6365  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6366  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6367  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6368  		"ALU_AND_K: 0xffffffff & 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6369  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6370  			BPF_LD_IMM64(R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6371  			BPF_ALU32_IMM(BPF_AND, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6372  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6373  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6374  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6375  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6376  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6377  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6378  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6379  		"ALU_AND_K: Small immediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6380  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6381  			BPF_ALU32_IMM(BPF_MOV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6382  			BPF_ALU32_IMM(BPF_AND, R0, 15),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6383  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6384  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6385  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6386  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6387  		{ { 0, 4 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6388  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6389  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6390  		"ALU_AND_K: Large immediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6391  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6392  			BPF_ALU32_IMM(BPF_MOV, R0, 0xf1f2f3f4),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6393  			BPF_ALU32_IMM(BPF_AND, R0, 0xafbfcfdf),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6394  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6395  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6396  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6397  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6398  		{ { 0, 0xa1b2c3d4 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6399  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6400  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6401  		"ALU_AND_K: Zero extension",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6402  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6403  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6404  			BPF_LD_IMM64(R1, 0x0000000080a0c0e0LL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6405  			BPF_ALU32_IMM(BPF_AND, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6406  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6407  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6408  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6409  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6410  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6411  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6412  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6413  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6414  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6415  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6416  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6417  		"ALU64_AND_K: 3 & 2 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6418  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6419  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  6420  			BPF_ALU64_IMM(BPF_AND, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6421  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6422  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6423  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6424  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6425  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6426  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6427  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6428  		"ALU64_AND_K: 0xffffffff & 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6429  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6430  			BPF_LD_IMM64(R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6431  			BPF_ALU64_IMM(BPF_AND, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6432  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6433  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6434  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6435  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6436  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6437  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6438  	{
e92c813bf119324 Johan Almbladh     2021-08-09  6439  		"ALU64_AND_K: 0x0000ffffffff0000 & 0x0 = 0x0000000000000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6440  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6441  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6442  			BPF_LD_IMM64(R3, 0x0000000000000000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6443  			BPF_ALU64_IMM(BPF_AND, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6444  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6445  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6446  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6447  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6448  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6449  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6450  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6451  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6452  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6453  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6454  	{
e92c813bf119324 Johan Almbladh     2021-08-09  6455  		"ALU64_AND_K: 0x0000ffffffff0000 & -1 = 0x0000ffffffff0000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6456  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6457  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6458  			BPF_LD_IMM64(R3, 0x0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6459  			BPF_ALU64_IMM(BPF_AND, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6460  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6461  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6462  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6463  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6464  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6465  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6466  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6467  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6468  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6469  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6470  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6471  		"ALU64_AND_K: 0xffffffffffffffff & -1 = 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6472  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6473  			BPF_LD_IMM64(R2, 0xffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6474  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6475  			BPF_ALU64_IMM(BPF_AND, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6476  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6477  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6478  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6479  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6480  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6481  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6482  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6483  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6484  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6485  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6486  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6487  		"ALU64_AND_K: Sign extension 1",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6488  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6489  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6490  			BPF_LD_IMM64(R1, 0x00000000090b0d0fLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6491  			BPF_ALU64_IMM(BPF_AND, R0, 0x0f0f0f0f),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6492  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6493  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6494  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6495  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6496  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6497  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6498  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6499  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6500  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6501  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6502  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6503  		"ALU64_AND_K: Sign extension 2",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6504  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6505  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6506  			BPF_LD_IMM64(R1, 0x0123456780a0c0e0LL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6507  			BPF_ALU64_IMM(BPF_AND, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6508  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6509  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6510  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6511  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6512  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6513  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6514  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6515  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6516  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6517  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6518  	/* BPF_ALU | BPF_OR | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6519  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6520  		"ALU_OR_X: 1 | 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6521  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6522  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6523  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6524  			BPF_ALU32_REG(BPF_OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6525  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6526  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6527  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6528  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6529  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6530  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6531  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6532  		"ALU_OR_X: 0x0 | 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6533  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6534  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6535  			BPF_ALU32_IMM(BPF_MOV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6536  			BPF_ALU32_REG(BPF_OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6537  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6538  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6539  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6540  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6541  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6542  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6543  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6544  		"ALU64_OR_X: 1 | 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6545  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6546  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6547  			BPF_ALU32_IMM(BPF_MOV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6548  			BPF_ALU64_REG(BPF_OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6549  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6550  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6551  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6552  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6553  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6554  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6555  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6556  		"ALU64_OR_X: 0 | 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6557  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6558  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6559  			BPF_ALU32_IMM(BPF_MOV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6560  			BPF_ALU64_REG(BPF_OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6561  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6562  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6563  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6564  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6565  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6566  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6567  	/* BPF_ALU | BPF_OR | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6568  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6569  		"ALU_OR_K: 1 | 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6570  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6571  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6572  			BPF_ALU32_IMM(BPF_OR, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6573  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6574  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6575  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6576  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6577  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6578  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6579  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6580  		"ALU_OR_K: 0 & 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6581  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6582  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6583  			BPF_ALU32_IMM(BPF_OR, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6584  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6585  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6586  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6587  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6588  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6589  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6590  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6591  		"ALU_OR_K: Small immediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6592  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6593  			BPF_ALU32_IMM(BPF_MOV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6594  			BPF_ALU32_IMM(BPF_OR, R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6595  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6596  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6597  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6598  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6599  		{ { 0, 0x01020305 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6600  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6601  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6602  		"ALU_OR_K: Large immediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6603  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6604  			BPF_ALU32_IMM(BPF_MOV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6605  			BPF_ALU32_IMM(BPF_OR, R0, 0xa0b0c0d0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6606  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6607  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6608  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6609  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6610  		{ { 0, 0xa1b2c3d4 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6611  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6612  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6613  		"ALU_OR_K: Zero extension",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6614  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6615  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6616  			BPF_LD_IMM64(R1, 0x00000000f9fbfdffLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6617  			BPF_ALU32_IMM(BPF_OR, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6618  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6619  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6620  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6621  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6622  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6623  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6624  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6625  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6626  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6627  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6628  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6629  		"ALU64_OR_K: 1 | 2 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6630  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6631  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6632  			BPF_ALU64_IMM(BPF_OR, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6633  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6634  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6635  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6636  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6637  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6638  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6639  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6640  		"ALU64_OR_K: 0 & 0xffffffff = 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6641  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6642  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6643  			BPF_ALU64_IMM(BPF_OR, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6644  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6645  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6646  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6647  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6648  		{ { 0, 0xffffffff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6649  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6650  	{
e92c813bf119324 Johan Almbladh     2021-08-09  6651  		"ALU64_OR_K: 0x0000ffffffff0000 | 0x0 = 0x0000ffffffff0000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6652  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6653  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6654  			BPF_LD_IMM64(R3, 0x0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6655  			BPF_ALU64_IMM(BPF_OR, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6656  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6657  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6658  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6659  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6660  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6661  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6662  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6663  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6664  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6665  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6666  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6667  		"ALU64_OR_K: 0x0000ffffffff0000 | -1 = 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6668  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6669  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6670  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6671  			BPF_ALU64_IMM(BPF_OR, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6672  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6673  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6674  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6675  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6676  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6677  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6678  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6679  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6680  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6681  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6682  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6683  		"ALU64_OR_K: 0x000000000000000 | -1 = 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6684  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6685  			BPF_LD_IMM64(R2, 0x0000000000000000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6686  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6687  			BPF_ALU64_IMM(BPF_OR, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6688  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6689  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6690  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6691  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6692  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6693  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6694  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6695  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6696  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6697  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6698  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6699  		"ALU64_OR_K: Sign extension 1",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6700  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6701  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6702  			BPF_LD_IMM64(R1, 0x012345678fafcfefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6703  			BPF_ALU64_IMM(BPF_OR, R0, 0x0f0f0f0f),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6704  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6705  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6706  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6707  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6708  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6709  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6710  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6711  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6712  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6713  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6714  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6715  		"ALU64_OR_K: Sign extension 2",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6716  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6717  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6718  			BPF_LD_IMM64(R1, 0xfffffffff9fbfdffLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6719  			BPF_ALU64_IMM(BPF_OR, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6720  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6721  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6722  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6723  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6724  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6725  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6726  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6727  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6728  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6729  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6730  	/* BPF_ALU | BPF_XOR | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6731  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6732  		"ALU_XOR_X: 5 ^ 6 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6733  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6734  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6735  			BPF_ALU32_IMM(BPF_MOV, R1, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6736  			BPF_ALU32_REG(BPF_XOR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6737  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6738  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6739  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6740  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6741  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6742  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6743  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6744  		"ALU_XOR_X: 0x1 ^ 0xffffffff = 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6745  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6746  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6747  			BPF_ALU32_IMM(BPF_MOV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6748  			BPF_ALU32_REG(BPF_XOR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6749  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6750  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6751  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6752  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6753  		{ { 0, 0xfffffffe } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6754  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6755  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6756  		"ALU64_XOR_X: 5 ^ 6 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6757  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6758  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6759  			BPF_ALU32_IMM(BPF_MOV, R1, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6760  			BPF_ALU64_REG(BPF_XOR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6761  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6762  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6763  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6764  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6765  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6766  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6767  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6768  		"ALU64_XOR_X: 1 ^ 0xffffffff = 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6769  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6770  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6771  			BPF_ALU32_IMM(BPF_MOV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6772  			BPF_ALU64_REG(BPF_XOR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6773  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6774  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6775  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6776  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6777  		{ { 0, 0xfffffffe } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6778  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6779  	/* BPF_ALU | BPF_XOR | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6780  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6781  		"ALU_XOR_K: 5 ^ 6 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6782  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6783  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6784  			BPF_ALU32_IMM(BPF_XOR, R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6785  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6786  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6787  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6788  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6789  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6790  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6791  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6792  		"ALU_XOR_K: 1 ^ 0xffffffff = 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6793  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6794  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6795  			BPF_ALU32_IMM(BPF_XOR, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6796  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6797  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6798  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6799  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6800  		{ { 0, 0xfffffffe } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6801  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6802  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6803  		"ALU_XOR_K: Small immediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6804  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6805  			BPF_ALU32_IMM(BPF_MOV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6806  			BPF_ALU32_IMM(BPF_XOR, R0, 15),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6807  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6808  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6809  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6810  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6811  		{ { 0, 0x0102030b } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6812  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6813  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6814  		"ALU_XOR_K: Large immediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6815  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6816  			BPF_ALU32_IMM(BPF_MOV, R0, 0xf1f2f3f4),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6817  			BPF_ALU32_IMM(BPF_XOR, R0, 0xafbfcfdf),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6818  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6819  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6820  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6821  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6822  		{ { 0, 0x5e4d3c2b } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6823  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6824  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6825  		"ALU_XOR_K: Zero extension",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6826  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6827  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6828  			BPF_LD_IMM64(R1, 0x00000000795b3d1fLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6829  			BPF_ALU32_IMM(BPF_XOR, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6830  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6831  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6832  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6833  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6834  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6835  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6836  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6837  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6838  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6839  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6840  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6841  		"ALU64_XOR_K: 5 ^ 6 = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6842  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6843  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6844  			BPF_ALU64_IMM(BPF_XOR, R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6845  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6846  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6847  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6848  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6849  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6850  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6851  	{
e92c813bf119324 Johan Almbladh     2021-08-09  6852  		"ALU64_XOR_K: 1 ^ 0xffffffff = 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6853  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6854  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6855  			BPF_ALU64_IMM(BPF_XOR, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6856  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6857  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6858  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6859  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6860  		{ { 0, 0xfffffffe } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6861  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6862  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6863  		"ALU64_XOR_K: 0x0000ffffffff0000 ^ 0x0 = 0x0000ffffffff0000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6864  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6865  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6866  			BPF_LD_IMM64(R3, 0x0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6867  			BPF_ALU64_IMM(BPF_XOR, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6868  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6869  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6870  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6871  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6872  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6873  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6874  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6875  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6876  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6877  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6878  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6879  		"ALU64_XOR_K: 0x0000ffffffff0000 ^ -1 = 0xffff00000000ffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6880  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6881  			BPF_LD_IMM64(R2, 0x0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6882  			BPF_LD_IMM64(R3, 0xffff00000000ffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6883  			BPF_ALU64_IMM(BPF_XOR, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6884  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6885  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6886  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6887  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6888  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6889  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6890  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6891  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6892  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6893  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6894  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6895  		"ALU64_XOR_K: 0x000000000000000 ^ -1 = 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6896  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6897  			BPF_LD_IMM64(R2, 0x0000000000000000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6898  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6899  			BPF_ALU64_IMM(BPF_XOR, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6900  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6901  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6902  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6903  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6904  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6905  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6906  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6907  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6908  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6909  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6910  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6911  		"ALU64_XOR_K: Sign extension 1",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6912  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6913  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6914  			BPF_LD_IMM64(R1, 0x0123456786a4c2e0LL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6915  			BPF_ALU64_IMM(BPF_XOR, R0, 0x0f0f0f0f),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6916  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6917  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6918  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6919  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6920  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6921  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6922  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6923  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6924  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6925  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6926  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6927  		"ALU64_XOR_K: Sign extension 2",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6928  		.u.insns_int = {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6929  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6930  			BPF_LD_IMM64(R1, 0xfedcba98795b3d1fLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6931  			BPF_ALU64_IMM(BPF_XOR, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6932  			BPF_JMP_REG(BPF_JEQ, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6933  			BPF_MOV32_IMM(R0, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6934  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6935  			BPF_MOV32_IMM(R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6936  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6937  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6938  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6939  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6940  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6941  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6942  	/* BPF_ALU | BPF_LSH | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6943  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6944  		"ALU_LSH_X: 1 << 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6945  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6946  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6947  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6948  			BPF_ALU32_REG(BPF_LSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6949  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6950  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6951  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6952  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6953  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6954  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6955  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6956  		"ALU_LSH_X: 1 << 31 = 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6957  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6958  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6959  			BPF_ALU32_IMM(BPF_MOV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6960  			BPF_ALU32_REG(BPF_LSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6961  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6962  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6963  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6964  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6965  		{ { 0, 0x80000000 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6966  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6967  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6968  		"ALU_LSH_X: 0x12345678 << 12 = 0x45678000",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6969  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6970  			BPF_ALU32_IMM(BPF_MOV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6971  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6972  			BPF_ALU32_REG(BPF_LSH, R0, R1),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6973  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6974  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6975  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6976  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6977  		{ { 0, 0x45678000 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6978  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6979  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6980  		"ALU64_LSH_X: 1 << 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6981  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6982  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6983  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6984  			BPF_ALU64_REG(BPF_LSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6985  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6986  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6987  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6988  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6989  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6990  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6991  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6992  		"ALU64_LSH_X: 1 << 31 = 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6993  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  6994  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6995  			BPF_ALU32_IMM(BPF_MOV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6996  			BPF_ALU64_REG(BPF_LSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6997  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6998  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6999  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7000  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7001  		{ { 0, 0x80000000 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7002  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7003  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7004  		"ALU64_LSH_X: Shift < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7005  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7006  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7007  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7008  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7009  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7010  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7011  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7012  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7013  		{ { 0, 0xbcdef000 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7014  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7015  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7016  		"ALU64_LSH_X: Shift < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7017  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7018  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7019  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7020  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7021  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7022  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7023  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7024  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7025  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7026  		{ { 0, 0x3456789a } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7027  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7028  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7029  		"ALU64_LSH_X: Shift > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7030  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7031  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7032  			BPF_ALU32_IMM(BPF_MOV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7033  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7034  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7035  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7036  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7037  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7038  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7039  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7040  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7041  		"ALU64_LSH_X: Shift > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7042  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7043  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7044  			BPF_ALU32_IMM(BPF_MOV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7045  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7046  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7047  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7048  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7049  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7050  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7051  		{ { 0, 0x9abcdef0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7052  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7053  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7054  		"ALU64_LSH_X: Shift == 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7055  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7056  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7057  			BPF_ALU32_IMM(BPF_MOV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7058  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7059  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7060  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7061  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7062  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7063  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7064  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7065  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7066  		"ALU64_LSH_X: Shift == 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7067  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7068  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7069  			BPF_ALU32_IMM(BPF_MOV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7070  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7071  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7072  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7073  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7074  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7075  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7076  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7077  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7078  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7079  		"ALU64_LSH_X: Zero shift, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7080  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7081  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7082  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7083  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7084  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7085  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7086  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7087  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7088  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7089  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7090  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7091  		"ALU64_LSH_X: Zero shift, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7092  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7093  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7094  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7095  			BPF_ALU64_REG(BPF_LSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7096  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7097  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7098  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7099  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7100  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7101  		{ { 0, 0x01234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7102  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7103  	/* BPF_ALU | BPF_LSH | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  7104  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7105  		"ALU_LSH_K: 1 << 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  7106  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7107  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7108  			BPF_ALU32_IMM(BPF_LSH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7109  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7110  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7111  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7112  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7113  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7114  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7115  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7116  		"ALU_LSH_K: 1 << 31 = 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  7117  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7118  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7119  			BPF_ALU32_IMM(BPF_LSH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  7120  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7121  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7122  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7123  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7124  		{ { 0, 0x80000000 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7125  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7126  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7127  		"ALU_LSH_K: 0x12345678 << 12 = 0x45678000",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7128  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7129  			BPF_ALU32_IMM(BPF_MOV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7130  			BPF_ALU32_IMM(BPF_LSH, R0, 12),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7131  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7132  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7133  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7134  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7135  		{ { 0, 0x45678000 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7136  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7137  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7138  		"ALU_LSH_K: 0x12345678 << 0 = 0x12345678",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7139  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7140  			BPF_ALU32_IMM(BPF_MOV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7141  			BPF_ALU32_IMM(BPF_LSH, R0, 0),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7142  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7143  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7144  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7145  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7146  		{ { 0, 0x12345678 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7147  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7148  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7149  		"ALU64_LSH_K: 1 << 1 = 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  7150  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7151  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7152  			BPF_ALU64_IMM(BPF_LSH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7153  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7154  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7155  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7156  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7157  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7158  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7159  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7160  		"ALU64_LSH_K: 1 << 31 = 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  7161  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7162  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7163  			BPF_ALU64_IMM(BPF_LSH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  7164  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7165  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7166  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7167  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7168  		{ { 0, 0x80000000 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7169  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7170  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7171  		"ALU64_LSH_K: Shift < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7172  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7173  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7174  			BPF_ALU64_IMM(BPF_LSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7175  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7176  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7177  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7178  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7179  		{ { 0, 0xbcdef000 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7180  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7181  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7182  		"ALU64_LSH_K: Shift < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7183  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7184  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7185  			BPF_ALU64_IMM(BPF_LSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7186  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7187  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7188  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7189  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7190  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7191  		{ { 0, 0x3456789a } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7192  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7193  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7194  		"ALU64_LSH_K: Shift > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7195  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7196  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7197  			BPF_ALU64_IMM(BPF_LSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7198  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7199  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7200  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7201  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7202  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7203  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7204  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7205  		"ALU64_LSH_K: Shift > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7206  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7207  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7208  			BPF_ALU64_IMM(BPF_LSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7209  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7210  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7211  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7212  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7213  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7214  		{ { 0, 0x9abcdef0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7215  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7216  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7217  		"ALU64_LSH_K: Shift == 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7218  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7219  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7220  			BPF_ALU64_IMM(BPF_LSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7221  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7222  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7223  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7224  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7225  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7226  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7227  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7228  		"ALU64_LSH_K: Shift == 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7229  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7230  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7231  			BPF_ALU64_IMM(BPF_LSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7232  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7233  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7234  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7235  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7236  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7237  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7238  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7239  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7240  		"ALU64_LSH_K: Zero shift",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7241  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7242  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7243  			BPF_ALU64_IMM(BPF_LSH, R0, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7244  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7245  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7246  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7247  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7248  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7249  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7250  	/* BPF_ALU | BPF_RSH | BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  7251  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7252  		"ALU_RSH_X: 2 >> 1 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7253  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7254  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  7255  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7256  			BPF_ALU32_REG(BPF_RSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7257  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7258  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7259  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7260  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7261  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7262  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7263  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7264  		"ALU_RSH_X: 0x80000000 >> 31 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7265  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7266  			BPF_LD_IMM64(R0, 0x80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  7267  			BPF_ALU32_IMM(BPF_MOV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  7268  			BPF_ALU32_REG(BPF_RSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7269  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7270  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7271  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7272  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7273  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7274  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7275  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7276  		"ALU_RSH_X: 0x12345678 >> 20 = 0x123",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7277  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7278  			BPF_ALU32_IMM(BPF_MOV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7279  			BPF_ALU32_IMM(BPF_MOV, R1, 20),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7280  			BPF_ALU32_REG(BPF_RSH, R0, R1),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7281  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7282  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7283  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7284  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7285  		{ { 0, 0x123 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7286  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7287  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7288  		"ALU64_RSH_X: 2 >> 1 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7289  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7290  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  7291  			BPF_ALU32_IMM(BPF_MOV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7292  			BPF_ALU64_REG(BPF_RSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7293  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7294  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7295  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7296  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7297  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7298  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7299  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7300  		"ALU64_RSH_X: 0x80000000 >> 31 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7301  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7302  			BPF_LD_IMM64(R0, 0x80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  7303  			BPF_ALU32_IMM(BPF_MOV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  7304  			BPF_ALU64_REG(BPF_RSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7305  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7306  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7307  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7308  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7309  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7310  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7311  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7312  		"ALU64_RSH_X: Shift < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7313  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7314  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7315  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7316  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7317  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7318  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7319  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7320  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7321  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7322  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7323  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7324  		"ALU64_RSH_X: Shift < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7325  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7326  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7327  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7328  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7329  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7330  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7331  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7332  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7333  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7334  		{ { 0, 0x00081234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7335  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7336  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7337  		"ALU64_RSH_X: Shift > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7338  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7339  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7340  			BPF_ALU32_IMM(BPF_MOV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7341  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7342  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7343  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7344  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7345  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7346  		{ { 0, 0x08123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7347  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7348  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7349  		"ALU64_RSH_X: Shift > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7350  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7351  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7352  			BPF_ALU32_IMM(BPF_MOV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7353  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7354  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7355  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7356  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7357  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7358  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7359  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7360  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7361  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7362  		"ALU64_RSH_X: Shift == 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7363  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7364  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7365  			BPF_ALU32_IMM(BPF_MOV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7366  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7367  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7368  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7369  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7370  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7371  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7372  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7373  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7374  		"ALU64_RSH_X: Shift == 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7375  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7376  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7377  			BPF_ALU32_IMM(BPF_MOV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7378  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7379  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7380  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7381  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7382  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7383  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7384  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7385  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7386  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7387  		"ALU64_RSH_X: Zero shift, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7388  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7389  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7390  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7391  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7392  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7393  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7394  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7395  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7396  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7397  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7398  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7399  		"ALU64_RSH_X: Zero shift, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7400  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7401  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7402  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7403  			BPF_ALU64_REG(BPF_RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7404  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7405  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7406  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7407  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7408  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7409  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7410  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7411  	/* BPF_ALU | BPF_RSH | BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  7412  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7413  		"ALU_RSH_K: 2 >> 1 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7414  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7415  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  7416  			BPF_ALU32_IMM(BPF_RSH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7417  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7418  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7419  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7420  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7421  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7422  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7423  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7424  		"ALU_RSH_K: 0x80000000 >> 31 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7425  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7426  			BPF_LD_IMM64(R0, 0x80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  7427  			BPF_ALU32_IMM(BPF_RSH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  7428  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7429  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7430  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7431  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7432  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7433  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7434  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7435  		"ALU_RSH_K: 0x12345678 >> 20 = 0x123",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7436  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7437  			BPF_ALU32_IMM(BPF_MOV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7438  			BPF_ALU32_IMM(BPF_RSH, R0, 20),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7439  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7440  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7441  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7442  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7443  		{ { 0, 0x123 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7444  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7445  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7446  		"ALU_RSH_K: 0x12345678 >> 0 = 0x12345678",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7447  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7448  			BPF_ALU32_IMM(BPF_MOV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7449  			BPF_ALU32_IMM(BPF_RSH, R0, 0),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7450  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7451  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7452  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7453  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7454  		{ { 0, 0x12345678 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7455  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7456  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7457  		"ALU64_RSH_K: 2 >> 1 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7458  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7459  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  7460  			BPF_ALU64_IMM(BPF_RSH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7461  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7462  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7463  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7464  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7465  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7466  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7467  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7468  		"ALU64_RSH_K: 0x80000000 >> 31 = 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  7469  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7470  			BPF_LD_IMM64(R0, 0x80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  7471  			BPF_ALU64_IMM(BPF_RSH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  7472  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7473  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7474  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7475  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7476  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7477  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7478  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7479  		"ALU64_RSH_K: Shift < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7480  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7481  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7482  			BPF_ALU64_IMM(BPF_RSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7483  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7484  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7485  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7486  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7487  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7488  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7489  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7490  		"ALU64_RSH_K: Shift < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7491  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7492  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7493  			BPF_ALU64_IMM(BPF_RSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7494  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7495  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7496  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7497  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7498  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7499  		{ { 0, 0x00081234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7500  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7501  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7502  		"ALU64_RSH_K: Shift > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7503  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7504  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7505  			BPF_ALU64_IMM(BPF_RSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7506  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7507  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7508  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7509  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7510  		{ { 0, 0x08123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7511  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7512  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7513  		"ALU64_RSH_K: Shift > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7514  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7515  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7516  			BPF_ALU64_IMM(BPF_RSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7517  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7518  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7519  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7520  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7521  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7522  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7523  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7524  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7525  		"ALU64_RSH_K: Shift == 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7526  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7527  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7528  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7529  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7530  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7531  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7532  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7533  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7534  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7535  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7536  		"ALU64_RSH_K: Shift == 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7537  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7538  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7539  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7540  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7541  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7542  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7543  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7544  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7545  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7546  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7547  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7548  		"ALU64_RSH_K: Zero shift",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7549  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7550  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7551  			BPF_ALU64_IMM(BPF_RSH, R0, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7552  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7553  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7554  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7555  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7556  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7557  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7558  	/* BPF_ALU | BPF_ARSH | BPF_X */
0f2fca1ab18319d Johan Almbladh     2021-08-09  7559  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7560  		"ALU32_ARSH_X: -1234 >> 7 = -10",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7561  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7562  			BPF_ALU32_IMM(BPF_MOV, R0, -1234),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7563  			BPF_ALU32_IMM(BPF_MOV, R1, 7),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7564  			BPF_ALU32_REG(BPF_ARSH, R0, R1),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7565  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7566  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7567  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7568  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7569  		{ { 0, -10 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7570  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7571  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7572  		"ALU64_ARSH_X: 0xff00ff0000000000 >> 40 = 0xffffffffffff00ff",
cffc642d93f9324 Michael Holzheu    2015-05-11  7573  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7574  			BPF_LD_IMM64(R0, 0xff00ff0000000000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7575  			BPF_ALU32_IMM(BPF_MOV, R1, 40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7576  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7577  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7578  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7579  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7580  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7581  		{ { 0, 0xffff00ff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7582  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7583  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7584  		"ALU64_ARSH_X: Shift < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7585  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7586  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7587  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7588  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7589  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7590  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7591  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7592  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7593  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7594  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7595  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7596  		"ALU64_ARSH_X: Shift < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7597  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7598  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7599  			BPF_ALU32_IMM(BPF_MOV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7600  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7601  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7602  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7603  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7604  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7605  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7606  		{ { 0, 0xfff81234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7607  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7608  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7609  		"ALU64_ARSH_X: Shift > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7610  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7611  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7612  			BPF_ALU32_IMM(BPF_MOV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7613  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7614  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7615  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7616  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7617  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7618  		{ { 0, 0xf8123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7619  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7620  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7621  		"ALU64_ARSH_X: Shift > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7622  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7623  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7624  			BPF_ALU32_IMM(BPF_MOV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7625  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7626  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7627  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7628  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7629  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7630  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7631  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7632  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7633  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7634  		"ALU64_ARSH_X: Shift == 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7635  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7636  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7637  			BPF_ALU32_IMM(BPF_MOV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7638  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7639  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7640  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7641  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7642  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7643  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7644  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7645  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7646  		"ALU64_ARSH_X: Shift == 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7647  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7648  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7649  			BPF_ALU32_IMM(BPF_MOV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7650  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7651  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7652  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7653  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7654  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7655  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7656  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7657  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7658  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7659  		"ALU64_ARSH_X: Zero shift, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7660  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7661  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7662  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7663  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7664  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7665  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7666  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7667  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7668  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7669  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7670  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7671  		"ALU64_ARSH_X: Zero shift, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7672  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7673  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7674  			BPF_ALU32_IMM(BPF_MOV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7675  			BPF_ALU64_REG(BPF_ARSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7676  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7677  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7678  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7679  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7680  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7681  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7682  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7683  	/* BPF_ALU | BPF_ARSH | BPF_K */
0f2fca1ab18319d Johan Almbladh     2021-08-09  7684  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7685  		"ALU32_ARSH_K: -1234 >> 7 = -10",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7686  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7687  			BPF_ALU32_IMM(BPF_MOV, R0, -1234),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7688  			BPF_ALU32_IMM(BPF_ARSH, R0, 7),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7689  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7690  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7691  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7692  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7693  		{ { 0, -10 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7694  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7695  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7696  		"ALU32_ARSH_K: -1234 >> 0 = -1234",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7697  		.u.insns_int = {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7698  			BPF_ALU32_IMM(BPF_MOV, R0, -1234),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7699  			BPF_ALU32_IMM(BPF_ARSH, R0, 0),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7700  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7701  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7702  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7703  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7704  		{ { 0, -1234 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7705  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7706  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7707  		"ALU64_ARSH_K: 0xff00ff0000000000 >> 40 = 0xffffffffffff00ff",
cffc642d93f9324 Michael Holzheu    2015-05-11  7708  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7709  			BPF_LD_IMM64(R0, 0xff00ff0000000000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7710  			BPF_ALU64_IMM(BPF_ARSH, R0, 40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7711  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7712  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7713  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7714  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7715  		{ { 0, 0xffff00ff } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7716  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7717  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7718  		"ALU64_ARSH_K: Shift < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7719  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7720  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7721  			BPF_ALU64_IMM(BPF_RSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7722  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7723  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7724  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7725  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7726  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7727  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7728  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7729  		"ALU64_ARSH_K: Shift < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7730  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7731  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7732  			BPF_ALU64_IMM(BPF_ARSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7733  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7734  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7735  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7736  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7737  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7738  		{ { 0, 0xfff81234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7739  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7740  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7741  		"ALU64_ARSH_K: Shift > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7742  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7743  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7744  			BPF_ALU64_IMM(BPF_ARSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7745  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7746  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7747  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7748  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7749  		{ { 0, 0xf8123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7750  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7751  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7752  		"ALU64_ARSH_K: Shift > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7753  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7754  			BPF_LD_IMM64(R0, 0xf123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7755  			BPF_ALU64_IMM(BPF_ARSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7756  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7757  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7758  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7759  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7760  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7761  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7762  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7763  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7764  		"ALU64_ARSH_K: Shift == 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7765  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7766  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7767  			BPF_ALU64_IMM(BPF_ARSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7768  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7769  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7770  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7771  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7772  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7773  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7774  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7775  		"ALU64_ARSH_K: Shift == 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7776  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7777  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7778  			BPF_ALU64_IMM(BPF_ARSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7779  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7780  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7781  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7782  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7783  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7784  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7785  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7786  	{
1bda52f80471260 Colin Ian King     2021-08-15  7787  		"ALU64_ARSH_K: Zero shift",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7788  		.u.insns_int = {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7789  			BPF_LD_IMM64(R0, 0x8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7790  			BPF_ALU64_IMM(BPF_ARSH, R0, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7791  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7792  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7793  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7794  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7795  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7796  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7797  	/* BPF_ALU | BPF_NEG */
cffc642d93f9324 Michael Holzheu    2015-05-11  7798  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7799  		"ALU_NEG: -(3) = -3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7800  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7801  			BPF_ALU32_IMM(BPF_MOV, R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7802  			BPF_ALU32_IMM(BPF_NEG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7803  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7804  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7805  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7806  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7807  		{ { 0, -3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7808  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7809  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7810  		"ALU_NEG: -(-3) = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7811  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7812  			BPF_ALU32_IMM(BPF_MOV, R0, -3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7813  			BPF_ALU32_IMM(BPF_NEG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7814  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7815  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7816  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7817  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7818  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7819  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7820  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7821  		"ALU64_NEG: -(3) = -3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7822  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7823  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7824  			BPF_ALU64_IMM(BPF_NEG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7825  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7826  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7827  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7828  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7829  		{ { 0, -3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7830  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7831  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7832  		"ALU64_NEG: -(-3) = 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7833  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7834  			BPF_LD_IMM64(R0, -3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7835  			BPF_ALU64_IMM(BPF_NEG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7836  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7837  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7838  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7839  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7840  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7841  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7842  	/* BPF_ALU | BPF_END | BPF_FROM_BE */
cffc642d93f9324 Michael Holzheu    2015-05-11  7843  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7844  		"ALU_END_FROM_BE 16: 0x0123456789abcdef -> 0xcdef",
cffc642d93f9324 Michael Holzheu    2015-05-11  7845  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7846  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7847  			BPF_ENDIAN(BPF_FROM_BE, R0, 16),
cffc642d93f9324 Michael Holzheu    2015-05-11  7848  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7849  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7850  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7851  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7852  		{ { 0,  cpu_to_be16(0xcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7853  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7854  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7855  		"ALU_END_FROM_BE 32: 0x0123456789abcdef -> 0x89abcdef",
cffc642d93f9324 Michael Holzheu    2015-05-11  7856  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7857  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7858  			BPF_ENDIAN(BPF_FROM_BE, R0, 32),
ba29becd770ffec Xi Wang            2015-07-08  7859  			BPF_ALU64_REG(BPF_MOV, R1, R0),
ba29becd770ffec Xi Wang            2015-07-08  7860  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
ba29becd770ffec Xi Wang            2015-07-08  7861  			BPF_ALU32_REG(BPF_ADD, R0, R1), /* R1 = 0 */
cffc642d93f9324 Michael Holzheu    2015-05-11  7862  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7863  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7864  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7865  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7866  		{ { 0, cpu_to_be32(0x89abcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7867  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7868  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7869  		"ALU_END_FROM_BE 64: 0x0123456789abcdef -> 0x89abcdef",
cffc642d93f9324 Michael Holzheu    2015-05-11  7870  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7871  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7872  			BPF_ENDIAN(BPF_FROM_BE, R0, 64),
cffc642d93f9324 Michael Holzheu    2015-05-11  7873  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7874  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7875  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7876  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7877  		{ { 0, (u32) cpu_to_be64(0x0123456789abcdefLL) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7878  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7879  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7880  		"ALU_END_FROM_BE 64: 0x0123456789abcdef >> 32 -> 0x01234567",
f536a7c80675e48 Johan Almbladh     2021-09-14  7881  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7882  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7883  			BPF_ENDIAN(BPF_FROM_BE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7884  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7885  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7886  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7887  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7888  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7889  		{ { 0, (u32) (cpu_to_be64(0x0123456789abcdefLL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7890  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7891  	/* BPF_ALU | BPF_END | BPF_FROM_BE, reversed */
f536a7c80675e48 Johan Almbladh     2021-09-14  7892  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7893  		"ALU_END_FROM_BE 16: 0xfedcba9876543210 -> 0x3210",
f536a7c80675e48 Johan Almbladh     2021-09-14  7894  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7895  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7896  			BPF_ENDIAN(BPF_FROM_BE, R0, 16),
f536a7c80675e48 Johan Almbladh     2021-09-14  7897  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7898  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7899  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7900  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7901  		{ { 0,  cpu_to_be16(0x3210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7902  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7903  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7904  		"ALU_END_FROM_BE 32: 0xfedcba9876543210 -> 0x76543210",
f536a7c80675e48 Johan Almbladh     2021-09-14  7905  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7906  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7907  			BPF_ENDIAN(BPF_FROM_BE, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7908  			BPF_ALU64_REG(BPF_MOV, R1, R0),
f536a7c80675e48 Johan Almbladh     2021-09-14  7909  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7910  			BPF_ALU32_REG(BPF_ADD, R0, R1), /* R1 = 0 */
f536a7c80675e48 Johan Almbladh     2021-09-14  7911  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7912  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7913  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7914  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7915  		{ { 0, cpu_to_be32(0x76543210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7916  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7917  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7918  		"ALU_END_FROM_BE 64: 0xfedcba9876543210 -> 0x76543210",
f536a7c80675e48 Johan Almbladh     2021-09-14  7919  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7920  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7921  			BPF_ENDIAN(BPF_FROM_BE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7922  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7923  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7924  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7925  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7926  		{ { 0, (u32) cpu_to_be64(0xfedcba9876543210ULL) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7927  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7928  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7929  		"ALU_END_FROM_BE 64: 0xfedcba9876543210 >> 32 -> 0xfedcba98",
f536a7c80675e48 Johan Almbladh     2021-09-14  7930  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7931  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7932  			BPF_ENDIAN(BPF_FROM_BE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7933  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7934  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7935  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7936  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7937  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7938  		{ { 0, (u32) (cpu_to_be64(0xfedcba9876543210ULL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7939  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7940  	/* BPF_ALU | BPF_END | BPF_FROM_LE */
cffc642d93f9324 Michael Holzheu    2015-05-11  7941  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7942  		"ALU_END_FROM_LE 16: 0x0123456789abcdef -> 0xefcd",
cffc642d93f9324 Michael Holzheu    2015-05-11  7943  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7944  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7945  			BPF_ENDIAN(BPF_FROM_LE, R0, 16),
cffc642d93f9324 Michael Holzheu    2015-05-11  7946  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7947  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7948  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7949  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7950  		{ { 0, cpu_to_le16(0xcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7951  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7952  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7953  		"ALU_END_FROM_LE 32: 0x0123456789abcdef -> 0xefcdab89",
cffc642d93f9324 Michael Holzheu    2015-05-11  7954  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7955  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7956  			BPF_ENDIAN(BPF_FROM_LE, R0, 32),
ba29becd770ffec Xi Wang            2015-07-08  7957  			BPF_ALU64_REG(BPF_MOV, R1, R0),
ba29becd770ffec Xi Wang            2015-07-08  7958  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
ba29becd770ffec Xi Wang            2015-07-08  7959  			BPF_ALU32_REG(BPF_ADD, R0, R1), /* R1 = 0 */
cffc642d93f9324 Michael Holzheu    2015-05-11  7960  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7961  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7962  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7963  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7964  		{ { 0, cpu_to_le32(0x89abcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7965  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7966  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7967  		"ALU_END_FROM_LE 64: 0x0123456789abcdef -> 0x67452301",
cffc642d93f9324 Michael Holzheu    2015-05-11  7968  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  7969  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7970  			BPF_ENDIAN(BPF_FROM_LE, R0, 64),
cffc642d93f9324 Michael Holzheu    2015-05-11  7971  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7972  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7973  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7974  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7975  		{ { 0, (u32) cpu_to_le64(0x0123456789abcdefLL) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7976  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7977  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7978  		"ALU_END_FROM_LE 64: 0x0123456789abcdef >> 32 -> 0xefcdab89",
f536a7c80675e48 Johan Almbladh     2021-09-14  7979  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7980  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7981  			BPF_ENDIAN(BPF_FROM_LE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7982  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7983  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7984  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7985  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7986  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7987  		{ { 0, (u32) (cpu_to_le64(0x0123456789abcdefLL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7988  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7989  	/* BPF_ALU | BPF_END | BPF_FROM_LE, reversed */
f536a7c80675e48 Johan Almbladh     2021-09-14  7990  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7991  		"ALU_END_FROM_LE 16: 0xfedcba9876543210 -> 0x1032",
f536a7c80675e48 Johan Almbladh     2021-09-14  7992  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  7993  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7994  			BPF_ENDIAN(BPF_FROM_LE, R0, 16),
f536a7c80675e48 Johan Almbladh     2021-09-14  7995  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7996  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7997  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7998  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7999  		{ { 0,  cpu_to_le16(0x3210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  8000  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  8001  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  8002  		"ALU_END_FROM_LE 32: 0xfedcba9876543210 -> 0x10325476",
f536a7c80675e48 Johan Almbladh     2021-09-14  8003  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  8004  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  8005  			BPF_ENDIAN(BPF_FROM_LE, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  8006  			BPF_ALU64_REG(BPF_MOV, R1, R0),
f536a7c80675e48 Johan Almbladh     2021-09-14  8007  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  8008  			BPF_ALU32_REG(BPF_ADD, R0, R1), /* R1 = 0 */
f536a7c80675e48 Johan Almbladh     2021-09-14  8009  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  8010  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  8011  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  8012  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  8013  		{ { 0, cpu_to_le32(0x76543210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  8014  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  8015  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  8016  		"ALU_END_FROM_LE 64: 0xfedcba9876543210 -> 0x10325476",
f536a7c80675e48 Johan Almbladh     2021-09-14  8017  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  8018  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  8019  			BPF_ENDIAN(BPF_FROM_LE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  8020  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  8021  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  8022  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  8023  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  8024  		{ { 0, (u32) cpu_to_le64(0xfedcba9876543210ULL) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  8025  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  8026  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  8027  		"ALU_END_FROM_LE 64: 0xfedcba9876543210 >> 32 -> 0x98badcfe",
f536a7c80675e48 Johan Almbladh     2021-09-14  8028  		.u.insns_int = {
f536a7c80675e48 Johan Almbladh     2021-09-14  8029  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  8030  			BPF_ENDIAN(BPF_FROM_LE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  8031  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  8032  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  8033  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  8034  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  8035  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  8036  		{ { 0, (u32) (cpu_to_le64(0xfedcba9876543210ULL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  8037  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8038  	/* BSWAP */
daabb2b098e0475 Puranjay Mohan     2023-09-07  8039  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8040  		"BSWAP 16: 0x0123456789abcdef -> 0xefcd",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8041  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8042  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8043  			BPF_BSWAP(R0, 16),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8044  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8045  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8046  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8047  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8048  		{ { 0, 0xefcd } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8049  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8050  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8051  		"BSWAP 32: 0x0123456789abcdef -> 0xefcdab89",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8052  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8053  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8054  			BPF_BSWAP(R0, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8055  			BPF_ALU64_REG(BPF_MOV, R1, R0),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8056  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8057  			BPF_ALU32_REG(BPF_ADD, R0, R1), /* R1 = 0 */
daabb2b098e0475 Puranjay Mohan     2023-09-07  8058  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8059  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8060  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8061  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8062  		{ { 0, 0xefcdab89 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8063  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8064  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8065  		"BSWAP 64: 0x0123456789abcdef -> 0x67452301",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8066  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8067  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8068  			BPF_BSWAP(R0, 64),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8069  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8070  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8071  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8072  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8073  		{ { 0, 0x67452301 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8074  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8075  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8076  		"BSWAP 64: 0x0123456789abcdef >> 32 -> 0xefcdab89",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8077  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8078  			BPF_LD_IMM64(R0, 0x0123456789abcdefLL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8079  			BPF_BSWAP(R0, 64),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8080  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8081  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8082  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8083  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8084  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8085  		{ { 0, 0xefcdab89 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8086  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8087  	/* BSWAP, reversed */
daabb2b098e0475 Puranjay Mohan     2023-09-07  8088  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8089  		"BSWAP 16: 0xfedcba9876543210 -> 0x1032",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8090  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8091  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8092  			BPF_BSWAP(R0, 16),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8093  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8094  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8095  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8096  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8097  		{ { 0, 0x1032 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8098  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8099  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8100  		"BSWAP 32: 0xfedcba9876543210 -> 0x10325476",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8101  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8102  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8103  			BPF_BSWAP(R0, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8104  			BPF_ALU64_REG(BPF_MOV, R1, R0),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8105  			BPF_ALU64_IMM(BPF_RSH, R1, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8106  			BPF_ALU32_REG(BPF_ADD, R0, R1), /* R1 = 0 */
daabb2b098e0475 Puranjay Mohan     2023-09-07  8107  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8108  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8109  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8110  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8111  		{ { 0, 0x10325476 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8112  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8113  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8114  		"BSWAP 64: 0xfedcba9876543210 -> 0x98badcfe",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8115  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8116  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8117  			BPF_BSWAP(R0, 64),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8118  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8119  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8120  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8121  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8122  		{ { 0, 0x98badcfe } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8123  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8124  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8125  		"BSWAP 64: 0xfedcba9876543210 >> 32 -> 0x10325476",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8126  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8127  			BPF_LD_IMM64(R0, 0xfedcba9876543210ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8128  			BPF_BSWAP(R0, 64),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8129  			BPF_ALU64_IMM(BPF_RSH, R0, 32),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8130  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8131  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8132  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8133  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8134  		{ { 0, 0x10325476 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8135  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8136  	/* BPF_LDX_MEM B/H/W/DW */
caaaa1667bf198c Johan Almbladh     2021-10-01  8137  	{
f516420f683d147 Xu Kuohai          2022-03-21  8138  		"BPF_LDX_MEM | BPF_B, base",
caaaa1667bf198c Johan Almbladh     2021-10-01  8139  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8140  			BPF_LD_IMM64(R1, 0x0102030405060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8141  			BPF_LD_IMM64(R2, 0x0000000000000008ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8142  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8143  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8144  			BPF_LDX_MEM(BPF_B, R0, R10, -1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8145  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8146  			BPF_LDX_MEM(BPF_B, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8147  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8148  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8149  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8150  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8151  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8152  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8153  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8154  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8155  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8156  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8157  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8158  		"BPF_LDX_MEM | BPF_B, MSB set",
caaaa1667bf198c Johan Almbladh     2021-10-01  8159  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8160  			BPF_LD_IMM64(R1, 0x8182838485868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8161  			BPF_LD_IMM64(R2, 0x0000000000000088ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8162  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8163  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8164  			BPF_LDX_MEM(BPF_B, R0, R10, -1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8165  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8166  			BPF_LDX_MEM(BPF_B, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8167  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8168  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8169  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8170  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8171  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8172  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8173  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8174  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8175  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8176  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8177  	{
f516420f683d147 Xu Kuohai          2022-03-21  8178  		"BPF_LDX_MEM | BPF_B, negative offset",
f516420f683d147 Xu Kuohai          2022-03-21  8179  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8180  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8181  			BPF_LD_IMM64(R3, 0x0000000000000088ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8182  			BPF_ALU64_IMM(BPF_ADD, R1, 512),
f516420f683d147 Xu Kuohai          2022-03-21  8183  			BPF_STX_MEM(BPF_B, R1, R2, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8184  			BPF_LDX_MEM(BPF_B, R0, R1, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8185  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8186  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8187  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8188  		},
f516420f683d147 Xu Kuohai          2022-03-21  8189  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8190  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8191  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8192  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8193  	},
f516420f683d147 Xu Kuohai          2022-03-21  8194  	{
f516420f683d147 Xu Kuohai          2022-03-21  8195  		"BPF_LDX_MEM | BPF_B, small positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8196  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8197  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8198  			BPF_LD_IMM64(R3, 0x0000000000000088ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8199  			BPF_STX_MEM(BPF_B, R1, R2, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8200  			BPF_LDX_MEM(BPF_B, R0, R1, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8201  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8202  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8203  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8204  		},
f516420f683d147 Xu Kuohai          2022-03-21  8205  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8206  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8207  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8208  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8209  	},
f516420f683d147 Xu Kuohai          2022-03-21  8210  	{
f516420f683d147 Xu Kuohai          2022-03-21  8211  		"BPF_LDX_MEM | BPF_B, large positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8212  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8213  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8214  			BPF_LD_IMM64(R3, 0x0000000000000088ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8215  			BPF_STX_MEM(BPF_B, R1, R2, 4096),
f516420f683d147 Xu Kuohai          2022-03-21  8216  			BPF_LDX_MEM(BPF_B, R0, R1, 4096),
f516420f683d147 Xu Kuohai          2022-03-21  8217  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8218  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8219  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8220  		},
f516420f683d147 Xu Kuohai          2022-03-21  8221  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8222  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8223  		{ { 4096 + 16, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8224  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8225  	},
f516420f683d147 Xu Kuohai          2022-03-21  8226  	{
f516420f683d147 Xu Kuohai          2022-03-21  8227  		"BPF_LDX_MEM | BPF_H, base",
caaaa1667bf198c Johan Almbladh     2021-10-01  8228  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8229  			BPF_LD_IMM64(R1, 0x0102030405060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8230  			BPF_LD_IMM64(R2, 0x0000000000000708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8231  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8232  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8233  			BPF_LDX_MEM(BPF_H, R0, R10, -2),
caaaa1667bf198c Johan Almbladh     2021-10-01  8234  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8235  			BPF_LDX_MEM(BPF_H, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8236  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8237  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8238  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8239  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8240  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8241  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8242  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8243  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8244  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8245  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8246  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8247  		"BPF_LDX_MEM | BPF_H, MSB set",
caaaa1667bf198c Johan Almbladh     2021-10-01  8248  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8249  			BPF_LD_IMM64(R1, 0x8182838485868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8250  			BPF_LD_IMM64(R2, 0x0000000000008788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8251  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8252  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8253  			BPF_LDX_MEM(BPF_H, R0, R10, -2),
caaaa1667bf198c Johan Almbladh     2021-10-01  8254  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8255  			BPF_LDX_MEM(BPF_H, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8256  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8257  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8258  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8259  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8260  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8261  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8262  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8263  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8264  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8265  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8266  	{
f516420f683d147 Xu Kuohai          2022-03-21  8267  		"BPF_LDX_MEM | BPF_H, negative offset",
f516420f683d147 Xu Kuohai          2022-03-21  8268  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8269  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8270  			BPF_LD_IMM64(R3, 0x0000000000008788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8271  			BPF_ALU64_IMM(BPF_ADD, R1, 512),
f516420f683d147 Xu Kuohai          2022-03-21  8272  			BPF_STX_MEM(BPF_H, R1, R2, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8273  			BPF_LDX_MEM(BPF_H, R0, R1, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8274  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8275  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8276  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8277  		},
f516420f683d147 Xu Kuohai          2022-03-21  8278  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8279  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8280  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8281  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8282  	},
f516420f683d147 Xu Kuohai          2022-03-21  8283  	{
f516420f683d147 Xu Kuohai          2022-03-21  8284  		"BPF_LDX_MEM | BPF_H, small positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8285  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8286  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8287  			BPF_LD_IMM64(R3, 0x0000000000008788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8288  			BPF_STX_MEM(BPF_H, R1, R2, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8289  			BPF_LDX_MEM(BPF_H, R0, R1, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8290  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8291  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8292  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8293  		},
f516420f683d147 Xu Kuohai          2022-03-21  8294  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8295  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8296  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8297  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8298  	},
f516420f683d147 Xu Kuohai          2022-03-21  8299  	{
f516420f683d147 Xu Kuohai          2022-03-21  8300  		"BPF_LDX_MEM | BPF_H, large positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8301  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8302  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8303  			BPF_LD_IMM64(R3, 0x0000000000008788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8304  			BPF_STX_MEM(BPF_H, R1, R2, 8192),
f516420f683d147 Xu Kuohai          2022-03-21  8305  			BPF_LDX_MEM(BPF_H, R0, R1, 8192),
f516420f683d147 Xu Kuohai          2022-03-21  8306  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8307  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8308  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8309  		},
f516420f683d147 Xu Kuohai          2022-03-21  8310  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8311  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8312  		{ { 8192 + 16, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8313  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8314  	},
f516420f683d147 Xu Kuohai          2022-03-21  8315  	{
f516420f683d147 Xu Kuohai          2022-03-21  8316  		"BPF_LDX_MEM | BPF_H, unaligned positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8317  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8318  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8319  			BPF_LD_IMM64(R3, 0x0000000000008788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8320  			BPF_STX_MEM(BPF_H, R1, R2, 13),
f516420f683d147 Xu Kuohai          2022-03-21  8321  			BPF_LDX_MEM(BPF_H, R0, R1, 13),
f516420f683d147 Xu Kuohai          2022-03-21  8322  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8323  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8324  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8325  		},
f516420f683d147 Xu Kuohai          2022-03-21  8326  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8327  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8328  		{ { 32, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8329  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8330  	},
f516420f683d147 Xu Kuohai          2022-03-21  8331  	{
f516420f683d147 Xu Kuohai          2022-03-21  8332  		"BPF_LDX_MEM | BPF_W, base",
caaaa1667bf198c Johan Almbladh     2021-10-01  8333  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8334  			BPF_LD_IMM64(R1, 0x0102030405060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8335  			BPF_LD_IMM64(R2, 0x0000000005060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8336  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8337  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8338  			BPF_LDX_MEM(BPF_W, R0, R10, -4),
caaaa1667bf198c Johan Almbladh     2021-10-01  8339  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8340  			BPF_LDX_MEM(BPF_W, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8341  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8342  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8343  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8344  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8345  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8346  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8347  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8348  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8349  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8350  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8351  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8352  		"BPF_LDX_MEM | BPF_W, MSB set",
caaaa1667bf198c Johan Almbladh     2021-10-01  8353  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8354  			BPF_LD_IMM64(R1, 0x8182838485868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8355  			BPF_LD_IMM64(R2, 0x0000000085868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8356  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8357  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8358  			BPF_LDX_MEM(BPF_W, R0, R10, -4),
caaaa1667bf198c Johan Almbladh     2021-10-01  8359  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8360  			BPF_LDX_MEM(BPF_W, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8361  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8362  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8363  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8364  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8365  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8366  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8367  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8368  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8369  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8370  	},
f516420f683d147 Xu Kuohai          2022-03-21  8371  	{
f516420f683d147 Xu Kuohai          2022-03-21  8372  		"BPF_LDX_MEM | BPF_W, negative offset",
f516420f683d147 Xu Kuohai          2022-03-21  8373  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8374  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8375  			BPF_LD_IMM64(R3, 0x0000000085868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8376  			BPF_ALU64_IMM(BPF_ADD, R1, 512),
f516420f683d147 Xu Kuohai          2022-03-21  8377  			BPF_STX_MEM(BPF_W, R1, R2, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8378  			BPF_LDX_MEM(BPF_W, R0, R1, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8379  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8380  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8381  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8382  		},
f516420f683d147 Xu Kuohai          2022-03-21  8383  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8384  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8385  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8386  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8387  	},
f516420f683d147 Xu Kuohai          2022-03-21  8388  	{
f516420f683d147 Xu Kuohai          2022-03-21  8389  		"BPF_LDX_MEM | BPF_W, small positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8390  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8391  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8392  			BPF_LD_IMM64(R3, 0x0000000085868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8393  			BPF_STX_MEM(BPF_W, R1, R2, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8394  			BPF_LDX_MEM(BPF_W, R0, R1, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8395  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8396  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8397  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8398  		},
f516420f683d147 Xu Kuohai          2022-03-21  8399  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8400  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8401  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8402  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8403  	},
f516420f683d147 Xu Kuohai          2022-03-21  8404  	{
f516420f683d147 Xu Kuohai          2022-03-21  8405  		"BPF_LDX_MEM | BPF_W, large positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8406  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8407  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8408  			BPF_LD_IMM64(R3, 0x0000000085868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8409  			BPF_STX_MEM(BPF_W, R1, R2, 16384),
f516420f683d147 Xu Kuohai          2022-03-21  8410  			BPF_LDX_MEM(BPF_W, R0, R1, 16384),
f516420f683d147 Xu Kuohai          2022-03-21  8411  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8412  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8413  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8414  		},
f516420f683d147 Xu Kuohai          2022-03-21  8415  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8416  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8417  		{ { 16384 + 16, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8418  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8419  	},
f516420f683d147 Xu Kuohai          2022-03-21  8420  	{
f516420f683d147 Xu Kuohai          2022-03-21  8421  		"BPF_LDX_MEM | BPF_W, unaligned positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8422  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8423  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8424  			BPF_LD_IMM64(R3, 0x0000000085868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8425  			BPF_STX_MEM(BPF_W, R1, R2, 13),
f516420f683d147 Xu Kuohai          2022-03-21  8426  			BPF_LDX_MEM(BPF_W, R0, R1, 13),
f516420f683d147 Xu Kuohai          2022-03-21  8427  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8428  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8429  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8430  		},
f516420f683d147 Xu Kuohai          2022-03-21  8431  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8432  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8433  		{ { 32, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8434  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8435  	},
f516420f683d147 Xu Kuohai          2022-03-21  8436  	{
f516420f683d147 Xu Kuohai          2022-03-21  8437  		"BPF_LDX_MEM | BPF_DW, base",
f516420f683d147 Xu Kuohai          2022-03-21  8438  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8439  			BPF_LD_IMM64(R1, 0x0102030405060708ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8440  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
f516420f683d147 Xu Kuohai          2022-03-21  8441  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
f516420f683d147 Xu Kuohai          2022-03-21  8442  			BPF_JMP_REG(BPF_JNE, R0, R1, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8443  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8444  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8445  		},
f516420f683d147 Xu Kuohai          2022-03-21  8446  		INTERNAL,
f516420f683d147 Xu Kuohai          2022-03-21  8447  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8448  		{ { 0, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8449  		.stack_depth = 8,
f516420f683d147 Xu Kuohai          2022-03-21  8450  	},
f516420f683d147 Xu Kuohai          2022-03-21  8451  	{
f516420f683d147 Xu Kuohai          2022-03-21  8452  		"BPF_LDX_MEM | BPF_DW, MSB set",
f516420f683d147 Xu Kuohai          2022-03-21  8453  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8454  			BPF_LD_IMM64(R1, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8455  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
f516420f683d147 Xu Kuohai          2022-03-21  8456  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
f516420f683d147 Xu Kuohai          2022-03-21  8457  			BPF_JMP_REG(BPF_JNE, R0, R1, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8458  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8459  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8460  		},
f516420f683d147 Xu Kuohai          2022-03-21  8461  		INTERNAL,
f516420f683d147 Xu Kuohai          2022-03-21  8462  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8463  		{ { 0, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8464  		.stack_depth = 8,
f516420f683d147 Xu Kuohai          2022-03-21  8465  	},
f516420f683d147 Xu Kuohai          2022-03-21  8466  	{
f516420f683d147 Xu Kuohai          2022-03-21  8467  		"BPF_LDX_MEM | BPF_DW, negative offset",
f516420f683d147 Xu Kuohai          2022-03-21  8468  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8469  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8470  			BPF_ALU64_IMM(BPF_ADD, R1, 512),
f516420f683d147 Xu Kuohai          2022-03-21  8471  			BPF_STX_MEM(BPF_DW, R1, R2, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8472  			BPF_LDX_MEM(BPF_DW, R0, R1, -256),
f516420f683d147 Xu Kuohai          2022-03-21  8473  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8474  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8475  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8476  		},
f516420f683d147 Xu Kuohai          2022-03-21  8477  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8478  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8479  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8480  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8481  	},
f516420f683d147 Xu Kuohai          2022-03-21  8482  	{
f516420f683d147 Xu Kuohai          2022-03-21  8483  		"BPF_LDX_MEM | BPF_DW, small positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8484  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8485  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8486  			BPF_STX_MEM(BPF_DW, R1, R2, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8487  			BPF_LDX_MEM(BPF_DW, R0, R1, 256),
f516420f683d147 Xu Kuohai          2022-03-21  8488  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8489  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8490  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8491  		},
f516420f683d147 Xu Kuohai          2022-03-21  8492  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8493  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8494  		{ { 512, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8495  		.stack_depth = 8,
f516420f683d147 Xu Kuohai          2022-03-21  8496  	},
f516420f683d147 Xu Kuohai          2022-03-21  8497  	{
f516420f683d147 Xu Kuohai          2022-03-21  8498  		"BPF_LDX_MEM | BPF_DW, large positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8499  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8500  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8501  			BPF_STX_MEM(BPF_DW, R1, R2, 32760),
f516420f683d147 Xu Kuohai          2022-03-21  8502  			BPF_LDX_MEM(BPF_DW, R0, R1, 32760),
f516420f683d147 Xu Kuohai          2022-03-21  8503  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8504  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8505  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8506  		},
f516420f683d147 Xu Kuohai          2022-03-21  8507  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8508  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8509  		{ { 32768, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8510  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8511  	},
f516420f683d147 Xu Kuohai          2022-03-21  8512  	{
f516420f683d147 Xu Kuohai          2022-03-21  8513  		"BPF_LDX_MEM | BPF_DW, unaligned positive offset",
f516420f683d147 Xu Kuohai          2022-03-21  8514  		.u.insns_int = {
f516420f683d147 Xu Kuohai          2022-03-21  8515  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
f516420f683d147 Xu Kuohai          2022-03-21  8516  			BPF_STX_MEM(BPF_DW, R1, R2, 13),
f516420f683d147 Xu Kuohai          2022-03-21  8517  			BPF_LDX_MEM(BPF_DW, R0, R1, 13),
f516420f683d147 Xu Kuohai          2022-03-21  8518  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
f516420f683d147 Xu Kuohai          2022-03-21  8519  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
f516420f683d147 Xu Kuohai          2022-03-21  8520  			BPF_EXIT_INSN(),
f516420f683d147 Xu Kuohai          2022-03-21  8521  		},
f516420f683d147 Xu Kuohai          2022-03-21  8522  		INTERNAL | FLAG_LARGE_MEM,
f516420f683d147 Xu Kuohai          2022-03-21  8523  		{ },
f516420f683d147 Xu Kuohai          2022-03-21  8524  		{ { 32, 0 } },
f516420f683d147 Xu Kuohai          2022-03-21  8525  		.stack_depth = 0,
f516420f683d147 Xu Kuohai          2022-03-21  8526  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8527  	/* BPF_LDX_MEMSX B/H/W */
daabb2b098e0475 Puranjay Mohan     2023-09-07  8528  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8529  		"BPF_LDX_MEMSX | BPF_B",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8530  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8531  			BPF_LD_IMM64(R1, 0xdead0000000000f0ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8532  			BPF_LD_IMM64(R2, 0xfffffffffffffff0ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8533  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8534  #ifdef __BIG_ENDIAN
daabb2b098e0475 Puranjay Mohan     2023-09-07  8535  			BPF_LDX_MEMSX(BPF_B, R0, R10, -1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8536  #else
daabb2b098e0475 Puranjay Mohan     2023-09-07  8537  			BPF_LDX_MEMSX(BPF_B, R0, R10, -8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8538  #endif
daabb2b098e0475 Puranjay Mohan     2023-09-07  8539  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8540  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8541  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8542  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8543  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8544  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8545  		{ { 0, 0 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8546  		.stack_depth = 8,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8547  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8548  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8549  		"BPF_LDX_MEMSX | BPF_H",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8550  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8551  			BPF_LD_IMM64(R1, 0xdead00000000f123ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8552  			BPF_LD_IMM64(R2, 0xfffffffffffff123ULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8553  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8554  #ifdef __BIG_ENDIAN
daabb2b098e0475 Puranjay Mohan     2023-09-07  8555  			BPF_LDX_MEMSX(BPF_H, R0, R10, -2),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8556  #else
daabb2b098e0475 Puranjay Mohan     2023-09-07  8557  			BPF_LDX_MEMSX(BPF_H, R0, R10, -8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8558  #endif
daabb2b098e0475 Puranjay Mohan     2023-09-07  8559  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8560  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8561  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8562  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8563  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8564  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8565  		{ { 0, 0 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8566  		.stack_depth = 8,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8567  	},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8568  	{
daabb2b098e0475 Puranjay Mohan     2023-09-07  8569  		"BPF_LDX_MEMSX | BPF_W",
daabb2b098e0475 Puranjay Mohan     2023-09-07  8570  		.u.insns_int = {
daabb2b098e0475 Puranjay Mohan     2023-09-07  8571  			BPF_LD_IMM64(R1, 0x00000000deadbeefULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8572  			BPF_LD_IMM64(R2, 0xffffffffdeadbeefULL),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8573  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8574  #ifdef __BIG_ENDIAN
daabb2b098e0475 Puranjay Mohan     2023-09-07  8575  			BPF_LDX_MEMSX(BPF_W, R0, R10, -4),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8576  #else
daabb2b098e0475 Puranjay Mohan     2023-09-07  8577  			BPF_LDX_MEMSX(BPF_W, R0, R10, -8),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8578  #endif
daabb2b098e0475 Puranjay Mohan     2023-09-07  8579  			BPF_JMP_REG(BPF_JNE, R0, R2, 1),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8580  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8581  			BPF_EXIT_INSN(),
daabb2b098e0475 Puranjay Mohan     2023-09-07  8582  		},
daabb2b098e0475 Puranjay Mohan     2023-09-07  8583  		INTERNAL,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8584  		{ },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8585  		{ { 0, 0 } },
daabb2b098e0475 Puranjay Mohan     2023-09-07  8586  		.stack_depth = 8,
daabb2b098e0475 Puranjay Mohan     2023-09-07  8587  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8588  	/* BPF_STX_MEM B/H/W/DW */
caaaa1667bf198c Johan Almbladh     2021-10-01  8589  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8590  		"BPF_STX_MEM | BPF_B",
caaaa1667bf198c Johan Almbladh     2021-10-01  8591  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8592  			BPF_LD_IMM64(R1, 0x8090a0b0c0d0e0f0ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8593  			BPF_LD_IMM64(R2, 0x0102030405060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8594  			BPF_LD_IMM64(R3, 0x8090a0b0c0d0e008ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8595  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8596  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8597  			BPF_STX_MEM(BPF_B, R10, R2, -1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8598  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8599  			BPF_STX_MEM(BPF_B, R10, R2, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8600  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8601  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8602  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8603  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8604  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8605  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8606  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8607  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8608  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8609  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8610  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8611  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8612  		"BPF_STX_MEM | BPF_B, MSB set",
caaaa1667bf198c Johan Almbladh     2021-10-01  8613  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8614  			BPF_LD_IMM64(R1, 0x8090a0b0c0d0e0f0ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8615  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8616  			BPF_LD_IMM64(R3, 0x8090a0b0c0d0e088ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8617  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8618  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8619  			BPF_STX_MEM(BPF_B, R10, R2, -1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8620  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8621  			BPF_STX_MEM(BPF_B, R10, R2, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8622  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8623  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8624  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8625  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8626  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8627  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8628  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8629  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8630  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8631  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8632  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8633  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8634  		"BPF_STX_MEM | BPF_H",
caaaa1667bf198c Johan Almbladh     2021-10-01  8635  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8636  			BPF_LD_IMM64(R1, 0x8090a0b0c0d0e0f0ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8637  			BPF_LD_IMM64(R2, 0x0102030405060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8638  			BPF_LD_IMM64(R3, 0x8090a0b0c0d00708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8639  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8640  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8641  			BPF_STX_MEM(BPF_H, R10, R2, -2),
caaaa1667bf198c Johan Almbladh     2021-10-01  8642  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8643  			BPF_STX_MEM(BPF_H, R10, R2, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8644  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8645  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8646  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8647  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8648  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8649  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8650  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8651  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8652  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8653  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8654  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8655  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8656  		"BPF_STX_MEM | BPF_H, MSB set",
caaaa1667bf198c Johan Almbladh     2021-10-01  8657  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8658  			BPF_LD_IMM64(R1, 0x8090a0b0c0d0e0f0ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8659  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8660  			BPF_LD_IMM64(R3, 0x8090a0b0c0d08788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8661  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8662  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8663  			BPF_STX_MEM(BPF_H, R10, R2, -2),
caaaa1667bf198c Johan Almbladh     2021-10-01  8664  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8665  			BPF_STX_MEM(BPF_H, R10, R2, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8666  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8667  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8668  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8669  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8670  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8671  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8672  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8673  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8674  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8675  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8676  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8677  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8678  		"BPF_STX_MEM | BPF_W",
caaaa1667bf198c Johan Almbladh     2021-10-01  8679  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8680  			BPF_LD_IMM64(R1, 0x8090a0b0c0d0e0f0ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8681  			BPF_LD_IMM64(R2, 0x0102030405060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8682  			BPF_LD_IMM64(R3, 0x8090a0b005060708ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8683  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8684  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8685  			BPF_STX_MEM(BPF_W, R10, R2, -4),
caaaa1667bf198c Johan Almbladh     2021-10-01  8686  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8687  			BPF_STX_MEM(BPF_W, R10, R2, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8688  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8689  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8690  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8691  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8692  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8693  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8694  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8695  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8696  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8697  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8698  	},
caaaa1667bf198c Johan Almbladh     2021-10-01  8699  	{
caaaa1667bf198c Johan Almbladh     2021-10-01  8700  		"BPF_STX_MEM | BPF_W, MSB set",
caaaa1667bf198c Johan Almbladh     2021-10-01  8701  		.u.insns_int = {
caaaa1667bf198c Johan Almbladh     2021-10-01  8702  			BPF_LD_IMM64(R1, 0x8090a0b0c0d0e0f0ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8703  			BPF_LD_IMM64(R2, 0x8182838485868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8704  			BPF_LD_IMM64(R3, 0x8090a0b085868788ULL),
caaaa1667bf198c Johan Almbladh     2021-10-01  8705  			BPF_STX_MEM(BPF_DW, R10, R1, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8706  #ifdef __BIG_ENDIAN
caaaa1667bf198c Johan Almbladh     2021-10-01  8707  			BPF_STX_MEM(BPF_W, R10, R2, -4),
caaaa1667bf198c Johan Almbladh     2021-10-01  8708  #else
caaaa1667bf198c Johan Almbladh     2021-10-01  8709  			BPF_STX_MEM(BPF_W, R10, R2, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8710  #endif
caaaa1667bf198c Johan Almbladh     2021-10-01  8711  			BPF_LDX_MEM(BPF_DW, R0, R10, -8),
caaaa1667bf198c Johan Almbladh     2021-10-01  8712  			BPF_JMP_REG(BPF_JNE, R0, R3, 1),
caaaa1667bf198c Johan Almbladh     2021-10-01  8713  			BPF_ALU64_IMM(BPF_MOV, R0, 0),
caaaa1667bf198c Johan Almbladh     2021-10-01  8714  			BPF_EXIT_INSN(),
caaaa1667bf198c Johan Almbladh     2021-10-01  8715  		},
caaaa1667bf198c Johan Almbladh     2021-10-01  8716  		INTERNAL,
caaaa1667bf198c Johan Almbladh     2021-10-01  8717  		{ },
caaaa1667bf198c Johan Almbladh     2021-10-01  8718  		{ { 0, 0 } },
caaaa1667bf198c Johan Almbladh     2021-10-01  8719  		.stack_depth = 8,
caaaa1667bf198c Johan Almbladh     2021-10-01  8720  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8721  	/* BPF_ST(X) | BPF_MEM | BPF_B/H/W/DW */
cffc642d93f9324 Michael Holzheu    2015-05-11  8722  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8723  		"ST_MEM_B: Store/Load byte: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8724  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8725  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8726  			BPF_ST_MEM(BPF_B, R10, -40, 0xff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8727  			BPF_LDX_MEM(BPF_B, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8728  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8729  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8730  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8731  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8732  		{ { 0, 0xff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8733  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8734  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8735  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8736  		"ST_MEM_B: Store/Load byte: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  8737  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8738  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8739  			BPF_ST_MEM(BPF_H, R10, -40, 0x7f),
cffc642d93f9324 Michael Holzheu    2015-05-11  8740  			BPF_LDX_MEM(BPF_H, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8741  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8742  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8743  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8744  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8745  		{ { 0, 0x7f } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8746  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8747  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8748  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8749  		"STX_MEM_B: Store/Load byte: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8750  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8751  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  8752  			BPF_LD_IMM64(R1, 0xffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  8753  			BPF_STX_MEM(BPF_B, R10, R1, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8754  			BPF_LDX_MEM(BPF_B, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8755  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8756  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8757  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8758  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8759  		{ { 0, 0xff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8760  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8761  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8762  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8763  		"ST_MEM_H: Store/Load half word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8764  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8765  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8766  			BPF_ST_MEM(BPF_H, R10, -40, 0xffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8767  			BPF_LDX_MEM(BPF_H, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8768  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8769  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8770  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8771  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8772  		{ { 0, 0xffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8773  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8774  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8775  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8776  		"ST_MEM_H: Store/Load half word: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  8777  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8778  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8779  			BPF_ST_MEM(BPF_H, R10, -40, 0x7fff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8780  			BPF_LDX_MEM(BPF_H, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8781  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8782  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8783  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8784  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8785  		{ { 0, 0x7fff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8786  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8787  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8788  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8789  		"STX_MEM_H: Store/Load half word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8790  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8791  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  8792  			BPF_LD_IMM64(R1, 0xffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  8793  			BPF_STX_MEM(BPF_H, R10, R1, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8794  			BPF_LDX_MEM(BPF_H, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8795  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8796  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8797  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8798  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8799  		{ { 0, 0xffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8800  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8801  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8802  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8803  		"ST_MEM_W: Store/Load word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8804  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8805  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8806  			BPF_ST_MEM(BPF_W, R10, -40, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8807  			BPF_LDX_MEM(BPF_W, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8808  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8809  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8810  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8811  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8812  		{ { 0, 0xffffffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8813  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8814  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8815  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8816  		"ST_MEM_W: Store/Load word: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  8817  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8818  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8819  			BPF_ST_MEM(BPF_W, R10, -40, 0x7fffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8820  			BPF_LDX_MEM(BPF_W, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8821  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8822  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8823  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8824  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8825  		{ { 0, 0x7fffffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8826  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8827  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8828  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8829  		"STX_MEM_W: Store/Load word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8830  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8831  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  8832  			BPF_LD_IMM64(R1, 0xffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  8833  			BPF_STX_MEM(BPF_W, R10, R1, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8834  			BPF_LDX_MEM(BPF_W, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8835  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8836  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8837  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8838  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8839  		{ { 0, 0xffffffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8840  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8841  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8842  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8843  		"ST_MEM_DW: Store/Load double word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8844  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8845  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8846  			BPF_ST_MEM(BPF_DW, R10, -40, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8847  			BPF_LDX_MEM(BPF_DW, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8848  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8849  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8850  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8851  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8852  		{ { 0, 0xffffffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8853  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8854  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8855  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8856  		"ST_MEM_DW: Store/Load double word: max negative 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  8857  		.u.insns_int = {
56cbaa45dde2356 Michael Holzheu    2015-05-13  8858  			BPF_LD_IMM64(R2, 0xffff00000000ffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  8859  			BPF_LD_IMM64(R3, 0xffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  8860  			BPF_ST_MEM(BPF_DW, R10, -40, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8861  			BPF_LDX_MEM(BPF_DW, R2, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8862  			BPF_JMP_REG(BPF_JEQ, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  8863  			BPF_MOV32_IMM(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  8864  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8865  			BPF_MOV32_IMM(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8866  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8867  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8868  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8869  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8870  		{ { 0, 0x1 } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8871  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8872  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8873  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8874  		"ST_MEM_DW: Store/Load double word: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  8875  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8876  			BPF_ALU32_IMM(BPF_MOV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  8877  			BPF_ST_MEM(BPF_DW, R10, -40, 0x7fffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  8878  			BPF_LDX_MEM(BPF_DW, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8879  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8880  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8881  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8882  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8883  		{ { 0, 0x7fffffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8884  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8885  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  8886  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  8887  		"STX_MEM_DW: Store/Load double word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  8888  		.u.insns_int = {
cffc642d93f9324 Michael Holzheu    2015-05-11  8889  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  8890  			BPF_LD_IMM64(R1, 0xffffffffffffffffLL),
ae7f47041d928b1 Johan Almbladh     2021-07-21  8891  			BPF_STX_MEM(BPF_DW, R10, R1, -40),
ae7f47041d928b1 Johan Almbladh     2021-07-21  8892  			BPF_LDX_MEM(BPF_DW, R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  8893  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  8894  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  8895  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  8896  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  8897  		{ { 0, 0xffffffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  8898  		.stack_depth = 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  8899  	},
e5009b4636cb593 Johan Almbladh     2021-08-09  8900  	{
e5009b4636cb593 Johan Almbladh     2021-08-09  8901  		"STX_MEM_DW: Store double word: first word in memory",
e5009b4636cb593 Johan Almbladh     2021-08-09  8902  		.u.insns_int = {
e5009b4636cb593 Johan Almbladh     2021-08-09  8903  			BPF_LD_IMM64(R0, 0),
e5009b4636cb593 Johan Almbladh     2021-08-09  8904  			BPF_LD_IMM64(R1, 0x0123456789abcdefLL),
e5009b4636cb593 Johan Almbladh     2021-08-09  8905  			BPF_STX_MEM(BPF_DW, R10, R1, -40),
e5009b4636cb593 Johan Almbladh     2021-08-09  8906  			BPF_LDX_MEM(BPF_W, R0, R10, -40),
e5009b4636cb593 Johan Almbladh     2021-08-09  8907  			BPF_EXIT_INSN(),
e5009b4636cb593 Johan Almbladh     2021-08-09  8908  		},
e5009b4636cb593 Johan Almbladh     2021-08-09  8909  		INTERNAL,
e5009b4636cb593 Johan Almbladh     2021-08-09  8910  		{ },
e5009b4636cb593 Johan Almbladh     2021-08-09  8911  #ifdef __BIG_ENDIAN
e5009b4636cb593 Johan Almbladh     2021-08-09  8912  		{ { 0, 0x01234567 } },
e5009b4636cb593 Johan Almbladh     2021-08-09  8913  #else
e5009b4636cb593 Johan Almbladh     2021-08-09  8914  		{ { 0, 0x89abcdef } },
e5009b4636cb593 Johan Almbladh     2021-08-09  8915  #endif
e5009b4636cb593 Johan Almbladh     2021-08-09  8916  		.stack_depth = 40,
e5009b4636cb593 Johan Almbladh     2021-08-09  8917  	},
e5009b4636cb593 Johan Almbladh     2021-08-09  8918  	{
e5009b4636cb593 Johan Almbladh     2021-08-09  8919  		"STX_MEM_DW: Store double word: second word in memory",
e5009b4636cb593 Johan Almbladh     2021-08-09  8920  		.u.insns_int = {
e5009b4636cb593 Johan Almbladh     2021-08-09  8921  			BPF_LD_IMM64(R0, 0),
e5009b4636cb593 Johan Almbladh     2021-08-09  8922  			BPF_LD_IMM64(R1, 0x0123456789abcdefLL),
e5009b4636cb593 Johan Almbladh     2021-08-09  8923  			BPF_STX_MEM(BPF_DW, R10, R1, -40),
e5009b4636cb593 Johan Almbladh     2021-08-09  8924  			BPF_LDX_MEM(BPF_W, R0, R10, -36),
e5009b4636cb593 Johan Almbladh     2021-08-09  8925  			BPF_EXIT_INSN(),
e5009b4636cb593 Johan Almbladh     2021-08-09  8926  		},
e5009b4636cb593 Johan Almbladh     2021-08-09  8927  		INTERNAL,
e5009b4636cb593 Johan Almbladh     2021-08-09  8928  		{ },
e5009b4636cb593 Johan Almbladh     2021-08-09  8929  #ifdef __BIG_ENDIAN
e5009b4636cb593 Johan Almbladh     2021-08-09  8930  		{ { 0, 0x89abcdef } },
e5009b4636cb593 Johan Almbladh     2021-08-09  8931  #else
e5009b4636cb593 Johan Almbladh     2021-08-09  8932  		{ { 0, 0x01234567 } },
e5009b4636cb593 Johan Almbladh     2021-08-09  8933  #endif
e5009b4636cb593 Johan Almbladh     2021-08-09  8934  		.stack_depth = 40,
e5009b4636cb593 Johan Almbladh     2021-08-09  8935  	},
91c960b0056672e Brendan Jackman    2021-01-14  8936  	/* BPF_STX | BPF_ATOMIC | BPF_W/DW */
85f68fe89832057 Daniel Borkmann    2017-05-01  8937  	{
85f68fe89832057 Daniel Borkmann    2017-05-01  8938  		"STX_XADD_W: X + 1 + 1 + 1 + ...",
85f68fe89832057 Daniel Borkmann    2017-05-01  8939  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  8940  		INTERNAL,
85f68fe89832057 Daniel Borkmann    2017-05-01  8941  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  8942  		{ { 0, 4134 } },
85f68fe89832057 Daniel Borkmann    2017-05-01  8943  		.fill_helper = bpf_fill_stxw,
85f68fe89832057 Daniel Borkmann    2017-05-01  8944  	},
85f68fe89832057 Daniel Borkmann    2017-05-01  8945  	{
85f68fe89832057 Daniel Borkmann    2017-05-01  8946  		"STX_XADD_DW: X + 1 + 1 + 1 + ...",
85f68fe89832057 Daniel Borkmann    2017-05-01  8947  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  8948  		INTERNAL,
85f68fe89832057 Daniel Borkmann    2017-05-01  8949  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  8950  		{ { 0, 4134 } },
85f68fe89832057 Daniel Borkmann    2017-05-01  8951  		.fill_helper = bpf_fill_stxdw,
85f68fe89832057 Daniel Borkmann    2017-05-01  8952  	},
e4517b3637c648b Johan Almbladh     2021-08-09  8953  	/*
e4517b3637c648b Johan Almbladh     2021-08-09  8954  	 * Exhaustive tests of atomic operation variants.
e4517b3637c648b Johan Almbladh     2021-08-09  8955  	 * Individual tests are expanded from template macros for all
e4517b3637c648b Johan Almbladh     2021-08-09  8956  	 * combinations of ALU operation, word size and fetching.
e4517b3637c648b Johan Almbladh     2021-08-09  8957  	 */
89b63462765cc03 Johan Almbladh     2021-10-01  8958  #define BPF_ATOMIC_POISON(width) ((width) == BPF_W ? (0xbaadf00dULL << 32) : 0)
89b63462765cc03 Johan Almbladh     2021-10-01  8959  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
