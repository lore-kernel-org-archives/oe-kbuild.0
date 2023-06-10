Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523023C5
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 18:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686421511; x=1717957511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W10dBL91u/X6WuAdxbmCyo+AZQed08ne4enjSqtb9fE=;
  b=QFN+wRoWbN1MPRkUdAN6dcy5l2AAqIdcMPjG9a+h/VBs1ZkoGfSsrNkH
   Y8GGczWeMCeIpF2gWR6QLR8lAvkpMP7YS4l3uLox/oXdgU5VPUaLSJdXb
   nrAwKaG473Yk82S/w4Rea3aR49Y6N9eIzAD8qCSXwIhLZ6mRw5rtXuPAy
   kNRDxl8jbPkxI3A77ecB0vaVQ1syyYRslRBTibHoL18qoEWbkQnGM5tnM
   Pe48DYotNMMXRd8PUJI2Dz+cU7LLgyEyWftYUIfeqHTXskE+M3Fqb1xpC
   Dj39K0kMyHch2bkXybqc3S8Q2caPu/llMj8celpHAIi9dDZubUbvYf/vq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="342477887"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="342477887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 11:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="710710432"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="710710432"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 11:25:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q83Gv-000ALo-13;
	Sat, 10 Jun 2023 18:25:09 +0000
Date: Sun, 11 Jun 2023 02:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:32:1: warning:
 no previous prototype for 'bpf_testmod_test_struct_arg_1'
Message-ID: <202306110247.E7uusHIr-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yonghong Song <yhs@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Yonghong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   64569520920a3ca5d456ddd9f4f95fc6ea9b8b45
commit: 1642a3945e223a922312fab2401ecdf58b3825b9 selftests/bpf: Add struct argument tests with fentry/fexit programs.
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1642a3945e223a922312fab2401ecdf58b3825b9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1642a3945e223a922312fab2401ecdf58b3825b9
        make W=1 O=/tmp/kselftest headers
        make W=1 O=/tmp/kselftest -C tools/testing/selftests
        make W=1 O=/tmp/kselftest -C tools/testing/selftests/bpf

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306110247.E7uusHIr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:32:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_1' [-Wmissing-prototypes]
      32 | bpf_testmod_test_struct_arg_1(struct bpf_testmod_struct_arg_2 a, int b, int c) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:38:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_2' [-Wmissing-prototypes]
      38 | bpf_testmod_test_struct_arg_2(int a, struct bpf_testmod_struct_arg_2 b, int c) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:44:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_3' [-Wmissing-prototypes]
      44 | bpf_testmod_test_struct_arg_3(int a, int b, struct bpf_testmod_struct_arg_2 c) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:50:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_4' [-Wmissing-prototypes]
      50 | bpf_testmod_test_struct_arg_4(struct bpf_testmod_struct_arg_1 a, int b,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:57:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_5' [-Wmissing-prototypes]
      57 | bpf_testmod_test_struct_arg_5(void) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:63:1: warning: no previous prototype for 'bpf_testmod_test_mod_kfunc' [-Wmissing-prototypes]
      63 | bpf_testmod_test_mod_kfunc(int i)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:81:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_1' [-Wmissing-prototypes]
      81 | bpf_testmod_test_btf_type_tag_user_1(struct bpf_testmod_btf_type_tag_1 __user *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:89:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_2' [-Wmissing-prototypes]
      89 | bpf_testmod_test_btf_type_tag_user_2(struct bpf_testmod_btf_type_tag_2 *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:94:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_1' [-Wmissing-prototypes]
      94 | bpf_testmod_test_btf_type_tag_percpu_1(struct bpf_testmod_btf_type_tag_1 __percpu *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:99:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_2' [-Wmissing-prototypes]
      99 | bpf_testmod_test_btf_type_tag_percpu_2(struct bpf_testmod_btf_type_tag_3 *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:103:14: warning: no previous prototype for 'bpf_testmod_loop_test' [-Wmissing-prototypes]
     103 | noinline int bpf_testmod_loop_test(int n)
         |              ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:115:30: warning: no previous prototype for 'bpf_testmod_return_ptr' [-Wmissing-prototypes]
     115 | __weak noinline struct file *bpf_testmod_return_ptr(int arg)
         |                              ^~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:132:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
     132 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:176:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
     176 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_testmod_test_struct_arg_1 +32 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c

1642a3945e223a Yonghong Song   2022-08-31  30  
1642a3945e223a Yonghong Song   2022-08-31  31  noinline int
1642a3945e223a Yonghong Song   2022-08-31 @32  bpf_testmod_test_struct_arg_1(struct bpf_testmod_struct_arg_2 a, int b, int c) {
1642a3945e223a Yonghong Song   2022-08-31  33  	bpf_testmod_test_struct_arg_result = a.a + a.b  + b + c;
1642a3945e223a Yonghong Song   2022-08-31  34  	return bpf_testmod_test_struct_arg_result;
1642a3945e223a Yonghong Song   2022-08-31  35  }
1642a3945e223a Yonghong Song   2022-08-31  36  
1642a3945e223a Yonghong Song   2022-08-31  37  noinline int
1642a3945e223a Yonghong Song   2022-08-31 @38  bpf_testmod_test_struct_arg_2(int a, struct bpf_testmod_struct_arg_2 b, int c) {
1642a3945e223a Yonghong Song   2022-08-31  39  	bpf_testmod_test_struct_arg_result = a + b.a + b.b + c;
1642a3945e223a Yonghong Song   2022-08-31  40  	return bpf_testmod_test_struct_arg_result;
1642a3945e223a Yonghong Song   2022-08-31  41  }
1642a3945e223a Yonghong Song   2022-08-31  42  
1642a3945e223a Yonghong Song   2022-08-31  43  noinline int
1642a3945e223a Yonghong Song   2022-08-31 @44  bpf_testmod_test_struct_arg_3(int a, int b, struct bpf_testmod_struct_arg_2 c) {
1642a3945e223a Yonghong Song   2022-08-31  45  	bpf_testmod_test_struct_arg_result = a + b + c.a + c.b;
1642a3945e223a Yonghong Song   2022-08-31  46  	return bpf_testmod_test_struct_arg_result;
1642a3945e223a Yonghong Song   2022-08-31  47  }
1642a3945e223a Yonghong Song   2022-08-31  48  
1642a3945e223a Yonghong Song   2022-08-31  49  noinline int
1642a3945e223a Yonghong Song   2022-08-31 @50  bpf_testmod_test_struct_arg_4(struct bpf_testmod_struct_arg_1 a, int b,
1642a3945e223a Yonghong Song   2022-08-31  51  			      int c, int d, struct bpf_testmod_struct_arg_2 e) {
1642a3945e223a Yonghong Song   2022-08-31  52  	bpf_testmod_test_struct_arg_result = a.a + b + c + d + e.a + e.b;
1642a3945e223a Yonghong Song   2022-08-31  53  	return bpf_testmod_test_struct_arg_result;
1642a3945e223a Yonghong Song   2022-08-31  54  }
1642a3945e223a Yonghong Song   2022-08-31  55  
1642a3945e223a Yonghong Song   2022-08-31  56  noinline int
1642a3945e223a Yonghong Song   2022-08-31 @57  bpf_testmod_test_struct_arg_5(void) {
1642a3945e223a Yonghong Song   2022-08-31  58  	bpf_testmod_test_struct_arg_result = 1;
1642a3945e223a Yonghong Song   2022-08-31  59  	return bpf_testmod_test_struct_arg_result;
1642a3945e223a Yonghong Song   2022-08-31  60  }
430d97a8a7bf15 Andrii Nakryiko 2021-01-11  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
