Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411A17C8
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 06:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674973436; x=1706509436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wZvvgL0T8yuXYQelaRPFll+kKvfAa+M3Xp/VDYo6Vk=;
  b=IrkhzJgVv2yLq89am17JJI8CqkJiPCO6oKB+qrHz3S29NHYfblJqSNHm
   hULvNYI0n492uOYee/Kj8yvU6NcKAHz2s99qxAW2fVogMUWyIbRFoB8W7
   VlWWhREgl7GHhIa0V0y3pi8GUxZLSnh0Yn3mfPDREnhrbfPAeIf8HWSoC
   oQ5gYG7nRP1C/IOnqjvEw0S2hWLa1OXEXxNYayFibr4fFiDcjC7rKKPUi
   5+VhBDxhc/doXInt9b55cJsBtNLJcKY8VcCZ1k+EaoQ/bPXdbtrkE70uJ
   J/ivBbffLNQ6GkmvJXiIkoUDfnDNfPTyShSPR3lSbDpTaGHr6UzjDC0nB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="389748407"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="389748407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 22:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909117931"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="909117931"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 22:23:54 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM16S-0002Wa-37;
	Sun, 29 Jan 2023 06:23:48 +0000
Date: Sun, 29 Jan 2023 14:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 06/11] tpm: Add full HMAC and encrypt/decrypt session
 handling code
Message-ID: <202301291449.E9ZLao2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/char/tpm/tpm2-sessions.c:395:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230124175516.5984-7-James.Bottomley@HansenPartnership.com>
References: <20230124175516.5984-7-James.Bottomley@HansenPartnership.com>
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
TO: linux-integrity@vger.kernel.org
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: keyrings@vger.kernel.org
CC: Ard Biesheuvel <ardb@kernel.org>

Hi James,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus zohar-integrity/next-integrity linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Bottomley/tpm-move-buffer-handling-from-static-inlines-to-real-functions/20230125-020146
patch link:    https://lore.kernel.org/r/20230124175516.5984-7-James.Bottomley%40HansenPartnership.com
patch subject: [PATCH v2 06/11] tpm: Add full HMAC and encrypt/decrypt session handling code
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-c005-20230123 (https://download.01.org/0day-ci/archive/20230129/202301291449.E9ZLao2b-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/dc0fc74718b4a786aba4a954233e8ab3afdcc03c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review James-Bottomley/tpm-move-buffer-handling-from-static-inlines-to-real-functions/20230125-020146
        git checkout dc0fc74718b4a786aba4a954233e8ab3afdcc03c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/wait.h:1208:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_function)
                             ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/compression.c:1657:30: note: Calling 'get_workspace'
           struct list_head *ws_list = get_workspace(0, 0);
                                       ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1097:2: note: Control jumps to 'case BTRFS_COMPRESS_NONE:'  at line 1098
           switch (type) {
           ^
   fs/btrfs/compression.c:1098:35: note: Calling 'btrfs_get_workspace'
           case BTRFS_COMPRESS_NONE: return btrfs_get_workspace(type, level);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1037:6: note: Assuming the condition is false
           if (!list_empty(idle_ws)) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1037:2: note: Taking false branch
           if (!list_empty(idle_ws)) {
           ^
   fs/btrfs/compression.c:1045:6: note: Assuming the condition is true
           if (atomic_read(total_ws) > cpus) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1045:2: note: Taking true branch
           if (atomic_read(total_ws) > cpus) {
           ^
   fs/btrfs/compression.c:1046:3: note: Dereference of null pointer
                   DEFINE_WAIT(wait);
                   ^
   include/linux/wait.h:1208:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_function)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/sched/mm.h:321:23: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/compression.c:1657:30: note: Calling 'get_workspace'
           struct list_head *ws_list = get_workspace(0, 0);
                                       ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1097:2: note: Control jumps to 'case BTRFS_COMPRESS_NONE:'  at line 1098
           switch (type) {
           ^
   fs/btrfs/compression.c:1098:35: note: Calling 'btrfs_get_workspace'
           case BTRFS_COMPRESS_NONE: return btrfs_get_workspace(type, level);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1037:6: note: Assuming the condition is false
           if (!list_empty(idle_ws)) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1037:2: note: Taking false branch
           if (!list_empty(idle_ws)) {
           ^
   fs/btrfs/compression.c:1045:6: note: Assuming the condition is false
           if (atomic_read(total_ws) > cpus) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1045:2: note: Taking false branch
           if (atomic_read(total_ws) > cpus) {
           ^
   fs/btrfs/compression.c:1063:14: note: Calling 'memalloc_nofs_save'
           nofs_flag = memalloc_nofs_save();
                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:321:23: note: Dereference of null pointer
           unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
>> drivers/char/tpm/tpm2-sessions.c:395:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^                       ~
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:57:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   drivers/char/tpm/tpm2-sessions.c:388:9: note: Assuming 'passphrase' is null
           while (passphrase && passphraselen > 0
                  ^~~~~~~~~~
   drivers/char/tpm/tpm2-sessions.c:388:20: note: Left side of '&&' is false
           while (passphrase && passphraselen > 0
                             ^
   drivers/char/tpm/tpm2-sessions.c:394:6: note: Assuming 'passphraselen' is not equal to 0
           if (passphraselen)
               ^~~~~~~~~~~~~
   drivers/char/tpm/tpm2-sessions.c:394:2: note: Taking true branch
           if (passphraselen)
           ^
   drivers/char/tpm/tpm2-sessions.c:395:3: note: '__ret_cond' is false
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/char/tpm/tpm2-sessions.c:395:3: note: Left side of '&&' is false
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:27: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                           ^
   drivers/char/tpm/tpm2-sessions.c:395:3: note: Taking false branch
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:3: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                   ^
   drivers/char/tpm/tpm2-sessions.c:395:3: note: Taking false branch
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:3: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                   ^
   drivers/char/tpm/tpm2-sessions.c:395:3: note: Null pointer passed as 2nd argument to memory copy function
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^                       ~
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:57:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
>> drivers/char/tpm/tpm2-sessions.c:758:2: warning: Value stored to 'attrs' is never read [clang-analyzer-deadcode.DeadStores]
           attrs = *s++;
           ^       ~~~~
   drivers/char/tpm/tpm2-sessions.c:758:2: note: Value stored to 'attrs' is never read
           attrs = *s++;
           ^       ~~~~
   Suppressed 24 warnings (10 in non-user code, 14 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/pci/endpoint/functions/pci-epf-vntb.c:907:15: warning: Access to field 'num_mws' results in a dereference of a null pointer (loaded from variable 'ntb') [clang-analyzer-core.NullDereference]
           ntb->num_mws = val;
           ~~~          ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:896:2: note: 'ntb' initialized to a null pointer value
           struct epf_ntb *ntb = to_epf_ntb(group);
           ^~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:901:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:901:2: note: Taking false branch
           if (ret)
           ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:904:6: note: Assuming 'val' is <= MAX_MW
           if (val > MAX_MW)
               ^~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:904:2: note: Taking false branch
           if (val > MAX_MW)
           ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:907:15: note: Access to field 'num_mws' results in a dereference of a null pointer (loaded from variable 'ntb')
           ntb->num_mws = val;
           ~~~          ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:913:1: warning: Access to field 'spad_count' results in a dereference of a null pointer (loaded from variable 'ntb') [clang-analyzer-core.NullDereference]
   EPF_NTB_W(spad_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:839:13: note: expanded from macro 'EPF_NTB_W'
           ntb->_name = val;                                               \
           ~~~        ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:913:1: note: 'ntb' initialized to a null pointer value
   EPF_NTB_W(spad_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:831:2: note: expanded from macro 'EPF_NTB_W'
           struct epf_ntb *ntb = to_epf_ntb(group);                        \
           ^~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:913:1: note: Assuming 'ret' is 0
   EPF_NTB_W(spad_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:836:6: note: expanded from macro 'EPF_NTB_W'
           if (ret)                                                        \
               ^~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:913:1: note: Taking false branch
   EPF_NTB_W(spad_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:836:2: note: expanded from macro 'EPF_NTB_W'
           if (ret)                                                        \
           ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:913:1: note: Access to field 'spad_count' results in a dereference of a null pointer (loaded from variable 'ntb')
   EPF_NTB_W(spad_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:839:13: note: expanded from macro 'EPF_NTB_W'
           ntb->_name = val;                                               \
           ~~~        ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:915:1: warning: Access to field 'db_count' results in a dereference of a null pointer (loaded from variable 'ntb') [clang-analyzer-core.NullDereference]
   EPF_NTB_W(db_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:839:13: note: expanded from macro 'EPF_NTB_W'
           ntb->_name = val;                                               \
           ~~~        ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:915:1: note: 'ntb' initialized to a null pointer value
   EPF_NTB_W(db_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:831:2: note: expanded from macro 'EPF_NTB_W'
           struct epf_ntb *ntb = to_epf_ntb(group);                        \
           ^~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:915:1: note: Assuming 'ret' is 0
   EPF_NTB_W(db_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:836:6: note: expanded from macro 'EPF_NTB_W'
           if (ret)                                                        \
               ^~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:915:1: note: Taking false branch
   EPF_NTB_W(db_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:836:2: note: expanded from macro 'EPF_NTB_W'
           if (ret)                                                        \
           ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:915:1: note: Access to field 'db_count' results in a dereference of a null pointer (loaded from variable 'ntb')
   EPF_NTB_W(db_count)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:839:13: note: expanded from macro 'EPF_NTB_W'
           ntb->_name = val;                                               \
           ~~~        ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:918:1: warning: Access to field 'vbus_number' results in a dereference of a null pointer (loaded from variable 'ntb') [clang-analyzer-core.NullDereference]
   EPF_NTB_W(vbus_number)
   ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:839:13: note: expanded from macro 'EPF_NTB_W'
           ntb->_name = val;                                               \
           ~~~        ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:918:1: note: 'ntb' initialized to a null pointer value
   EPF_NTB_W(vbus_number)

vim +395 drivers/char/tpm/tpm2-sessions.c

dc0fc74718b4a7 James Bottomley 2023-01-24  350  
dc0fc74718b4a7 James Bottomley 2023-01-24  351  /**
dc0fc74718b4a7 James Bottomley 2023-01-24  352   * tpm_buf_append_hmac_session() append a TPM session element
dc0fc74718b4a7 James Bottomley 2023-01-24  353   * @buf: The buffer to be appended
dc0fc74718b4a7 James Bottomley 2023-01-24  354   * @auth: the auth structure allocated by tpm2_start_auth_session()
dc0fc74718b4a7 James Bottomley 2023-01-24  355   * @attributes: The session attributes
dc0fc74718b4a7 James Bottomley 2023-01-24  356   * @passphrase: The session authority (NULL if none)
dc0fc74718b4a7 James Bottomley 2023-01-24  357   * @passphraselen: The length of the session authority (0 if none)
dc0fc74718b4a7 James Bottomley 2023-01-24  358   *
dc0fc74718b4a7 James Bottomley 2023-01-24  359   * This fills in a session structure in the TPM command buffer, except
dc0fc74718b4a7 James Bottomley 2023-01-24  360   * for the HMAC which cannot be computed until the command buffer is
dc0fc74718b4a7 James Bottomley 2023-01-24  361   * complete.  The type of session is controlled by the @attributes,
dc0fc74718b4a7 James Bottomley 2023-01-24  362   * the main ones of which are TPM2_SA_CONTINUE_SESSION which means the
dc0fc74718b4a7 James Bottomley 2023-01-24  363   * session won't terminate after tpm_buf_check_hmac_response(),
dc0fc74718b4a7 James Bottomley 2023-01-24  364   * TPM2_SA_DECRYPT which means this buffers first parameter should be
dc0fc74718b4a7 James Bottomley 2023-01-24  365   * encrypted with a session key and TPM2_SA_ENCRYPT, which means the
dc0fc74718b4a7 James Bottomley 2023-01-24  366   * response buffer's first parameter needs to be decrypted (confusing,
dc0fc74718b4a7 James Bottomley 2023-01-24  367   * but the defines are written from the point of view of the TPM).
dc0fc74718b4a7 James Bottomley 2023-01-24  368   *
dc0fc74718b4a7 James Bottomley 2023-01-24  369   * Any session appended by this command must be finalized by calling
dc0fc74718b4a7 James Bottomley 2023-01-24  370   * tpm_buf_fill_hmac_session() otherwise the HMAC will be incorrect
dc0fc74718b4a7 James Bottomley 2023-01-24  371   * and the TPM will reject the command.
dc0fc74718b4a7 James Bottomley 2023-01-24  372   *
dc0fc74718b4a7 James Bottomley 2023-01-24  373   * As with most tpm_buf operations, success is assumed because failure
dc0fc74718b4a7 James Bottomley 2023-01-24  374   * will be caused by an incorrect programming model and indicated by a
dc0fc74718b4a7 James Bottomley 2023-01-24  375   * kernel message.
dc0fc74718b4a7 James Bottomley 2023-01-24  376   */
dc0fc74718b4a7 James Bottomley 2023-01-24  377  void tpm_buf_append_hmac_session(struct tpm_buf *buf, struct tpm2_auth *auth,
dc0fc74718b4a7 James Bottomley 2023-01-24  378  				 u8 attributes, u8 *passphrase,
dc0fc74718b4a7 James Bottomley 2023-01-24  379  				 int passphraselen)
dc0fc74718b4a7 James Bottomley 2023-01-24  380  {
dc0fc74718b4a7 James Bottomley 2023-01-24  381  	u8 nonce[SHA256_DIGEST_SIZE];
dc0fc74718b4a7 James Bottomley 2023-01-24  382  	u32 len;
dc0fc74718b4a7 James Bottomley 2023-01-24  383  
dc0fc74718b4a7 James Bottomley 2023-01-24  384  	/*
dc0fc74718b4a7 James Bottomley 2023-01-24  385  	 * The Architecture Guide requires us to strip trailing zeros
dc0fc74718b4a7 James Bottomley 2023-01-24  386  	 * before computing the HMAC
dc0fc74718b4a7 James Bottomley 2023-01-24  387  	 */
dc0fc74718b4a7 James Bottomley 2023-01-24  388  	while (passphrase && passphraselen > 0
dc0fc74718b4a7 James Bottomley 2023-01-24  389  	       && passphrase[passphraselen - 1] == '\0')
dc0fc74718b4a7 James Bottomley 2023-01-24  390  		passphraselen--;
dc0fc74718b4a7 James Bottomley 2023-01-24  391  
dc0fc74718b4a7 James Bottomley 2023-01-24  392  	auth->attrs = attributes;
dc0fc74718b4a7 James Bottomley 2023-01-24  393  	auth->passphraselen = passphraselen;
dc0fc74718b4a7 James Bottomley 2023-01-24  394  	if (passphraselen)
dc0fc74718b4a7 James Bottomley 2023-01-24 @395  		memcpy(auth->passphrase, passphrase, passphraselen);
dc0fc74718b4a7 James Bottomley 2023-01-24  396  
dc0fc74718b4a7 James Bottomley 2023-01-24  397  	if (auth->session != tpm_buf_length(buf)) {
dc0fc74718b4a7 James Bottomley 2023-01-24  398  		/* we're not the first session */
dc0fc74718b4a7 James Bottomley 2023-01-24  399  		len = get_unaligned_be32(&buf->data[auth->session]);
dc0fc74718b4a7 James Bottomley 2023-01-24  400  		if (4 + len + auth->session != tpm_buf_length(buf)) {
dc0fc74718b4a7 James Bottomley 2023-01-24  401  			WARN(1, "session length mismatch, cannot append");
dc0fc74718b4a7 James Bottomley 2023-01-24  402  			return;
dc0fc74718b4a7 James Bottomley 2023-01-24  403  		}
dc0fc74718b4a7 James Bottomley 2023-01-24  404  
dc0fc74718b4a7 James Bottomley 2023-01-24  405  		/* add our new session */
dc0fc74718b4a7 James Bottomley 2023-01-24  406  		len += 9 + 2 * SHA256_DIGEST_SIZE;
dc0fc74718b4a7 James Bottomley 2023-01-24  407  		put_unaligned_be32(len, &buf->data[auth->session]);
dc0fc74718b4a7 James Bottomley 2023-01-24  408  	} else {
dc0fc74718b4a7 James Bottomley 2023-01-24  409  		tpm_buf_append_u32(buf, 9 + 2 * SHA256_DIGEST_SIZE);
dc0fc74718b4a7 James Bottomley 2023-01-24  410  	}
dc0fc74718b4a7 James Bottomley 2023-01-24  411  
dc0fc74718b4a7 James Bottomley 2023-01-24  412  	/* random number for our nonce */
dc0fc74718b4a7 James Bottomley 2023-01-24  413  	get_random_bytes(nonce, sizeof(nonce));
dc0fc74718b4a7 James Bottomley 2023-01-24  414  	memcpy(auth->our_nonce, nonce, sizeof(nonce));
dc0fc74718b4a7 James Bottomley 2023-01-24  415  	tpm_buf_append_u32(buf, auth->handle);
dc0fc74718b4a7 James Bottomley 2023-01-24  416  	/* our new nonce */
dc0fc74718b4a7 James Bottomley 2023-01-24  417  	tpm_buf_append_u16(buf, SHA256_DIGEST_SIZE);
dc0fc74718b4a7 James Bottomley 2023-01-24  418  	tpm_buf_append(buf, nonce, SHA256_DIGEST_SIZE);
dc0fc74718b4a7 James Bottomley 2023-01-24  419  	tpm_buf_append_u8(buf, auth->attrs);
dc0fc74718b4a7 James Bottomley 2023-01-24  420  	/* and put a placeholder for the hmac */
dc0fc74718b4a7 James Bottomley 2023-01-24  421  	tpm_buf_append_u16(buf, SHA256_DIGEST_SIZE);
dc0fc74718b4a7 James Bottomley 2023-01-24  422  	tpm_buf_append(buf, nonce, SHA256_DIGEST_SIZE);
dc0fc74718b4a7 James Bottomley 2023-01-24  423  }
dc0fc74718b4a7 James Bottomley 2023-01-24  424  EXPORT_SYMBOL(tpm_buf_append_hmac_session);
dc0fc74718b4a7 James Bottomley 2023-01-24  425  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
