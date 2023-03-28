Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3871EBB
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Mar 2023 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679985663; x=1711521663;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mcYtIJfi5WwG5jPEOl37BWtE40KLn66K4AVoQ4Iywco=;
  b=HWJ10FgHR8UlJUeOChJ2h4M1ztyP1aQHLmTkrNmyalRTOeWjkFAo+fOL
   S3BIRJ3oItRuCs8tu/SYrhSJxF3tP63HriA5KQiGvxxLfr+U4iB5n96xP
   rsvQTiBpPo6NkJw7UjHwB58YOn+yvRj6h5I9pO5GLmq+6QBzA+IQPce1K
   fvM+Xl9RSp2p0s8gO2ev8qv1/qFN3XbnDQ+MR/hekTQmf34vdHhOLdsvq
   i226ptuOHUbFUQTboKgXz/uL92FXDD3OfBaLjJ4DMBikEWVVwsWgO2NmV
   eaW7S4sUeqFk6Nywq2mPDk6mSJA5d0lQg6QYfrLJqRaZVD+XAoFLFACbU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337989888"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="337989888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 23:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="857946884"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="857946884"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Mar 2023 23:40:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph30m-000ILL-2U;
	Tue, 28 Mar 2023 06:40:52 +0000
Date: Tue, 28 Mar 2023 14:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <202303281400.NHh6MgV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/usb/gadget/function/f_fs.c:1325:38: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230322092118.9213-4-paul@crapouillou.net>
References: <20230322092118.9213-4-paul@crapouillou.net>
TO: Paul Cercueil <paul@crapouillou.net>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
CC: Paul Cercueil <paul@crapouillou.net>
CC: michael.hennerich@analog.com
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: nuno.sa@analog.com
CC: linaro-mm-sig@lists.linaro.org
CC: linux-media@vger.kernel.org

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.3-rc4 next-20230327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230322-172408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230322092118.9213-4-paul%40crapouillou.net
patch subject: [PATCH v2 3/3] usb: gadget: functionfs: Add DMABUF import interface
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281400.NHh6MgV2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/80c5660d9135823b24d5d7adf0e32e201189822e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230322-172408
        git checkout 80c5660d9135823b24d5d7adf0e32e201189822e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303281400.NHh6MgV2-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/usb/gadget/function/rndis.c:1113:14: note: Value stored to 's' during its initialization is never read
                            ({ char *s = "?";
                                     ^   ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/gadget/function/f_mass_storage.c:932:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc = invalidate_mapping_pages(inode->i_mapping, 0, -1);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:932:2: note: Value stored to 'rc' is never read
           rc = invalidate_mapping_pages(inode->i_mapping, 0, -1);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1664:3: warning: Value stored to 'sdinfo' is never read [clang-analyzer-deadcode.DeadStores]
                   sdinfo = curlun->sense_data_info;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1664:3: note: Value stored to 'sdinfo' is never read
                   sdinfo = curlun->sense_data_info;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1673:3: warning: Value stored to 'sd' is never read [clang-analyzer-deadcode.DeadStores]
                   sd = SS_INVALID_COMMAND;
                   ^
   drivers/usb/gadget/function/f_mass_storage.c:1673:3: note: Value stored to 'sd' is never read
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/usb/gadget/function/f_fs.c:1267:3: warning: Argument to kfree() is the address of the local variable 'io_data', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(p);
                   ^     ~
   drivers/usb/gadget/function/f_fs.c:1241:2: note: Loop condition is false.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENTER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:1243:2: note: Taking false branch
           if (!is_sync_kiocb(kiocb)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1260:9: note: Field 'aio' is false
           if (p->aio)
                  ^
   drivers/usb/gadget/function/f_fs.c:1260:2: note: Taking false branch
           if (p->aio)
           ^
   drivers/usb/gadget/function/f_fs.c:1264:2: note: Taking false branch
           if (res == -EIOCBQUEUED)
           ^
   drivers/usb/gadget/function/f_fs.c:1266:6: note: Assuming field 'aio' is true
           if (p->aio)
               ^~~~~~
   drivers/usb/gadget/function/f_fs.c:1266:2: note: Taking true branch
           if (p->aio)
           ^
   drivers/usb/gadget/function/f_fs.c:1267:3: note: Argument to kfree() is the address of the local variable 'io_data', which is not memory allocated by malloc()
                   kfree(p);
                   ^     ~
   drivers/usb/gadget/function/f_fs.c:1315:3: warning: Argument to kfree() is the address of the local variable 'io_data', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(p);
                   ^     ~
   drivers/usb/gadget/function/f_fs.c:1278:2: note: Loop condition is false.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENTER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:1280:2: note: Taking false branch
           if (!is_sync_kiocb(kiocb)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1292:9: note: Field 'aio' is false
           if (p->aio) {
                  ^
   drivers/usb/gadget/function/f_fs.c:1292:2: note: Taking false branch
           if (p->aio) {
           ^
   drivers/usb/gadget/function/f_fs.c:1306:9: note: Field 'aio' is false
           if (p->aio)
                  ^
   drivers/usb/gadget/function/f_fs.c:1306:2: note: Taking false branch
           if (p->aio)
           ^
   drivers/usb/gadget/function/f_fs.c:1310:2: note: Taking false branch
           if (res == -EIOCBQUEUED)
           ^
   drivers/usb/gadget/function/f_fs.c:1313:6: note: Assuming field 'aio' is true
           if (p->aio) {
               ^~~~~~
   drivers/usb/gadget/function/f_fs.c:1313:2: note: Taking true branch
           if (p->aio) {
           ^
   drivers/usb/gadget/function/f_fs.c:1315:3: note: Argument to kfree() is the address of the local variable 'io_data', which is not memory allocated by malloc()
                   kfree(p);
                   ^     ~
>> drivers/usb/gadget/function/f_fs.c:1325:38: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           struct dma_buf_attachment *attach = priv->attach;
                                               ^
   drivers/usb/gadget/function/f_fs.c:1697:2: note: Loop condition is false.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENTER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:1699:14: note: Assuming field 'state' is equal to FFS_ACTIVE
           if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1699:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/usb/gadget/function/f_fs.c:1699:2: note: Taking false branch
           if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
           ^
   drivers/usb/gadget/function/f_fs.c:1702:2: note: Control jumps to 'case 1074030468:'  at line 1714
           switch (code) {
           ^
   drivers/usb/gadget/function/f_fs.c:1718:7: note: Assuming the condition is false
                   if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1718:3: note: Taking false branch
                   if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
                   ^
   drivers/usb/gadget/function/f_fs.c:1723:10: note: Calling 'ffs_dmabuf_detach'
                   return ffs_dmabuf_detach(file, fd);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1519:2: note: Taking false branch
           if (IS_ERR(dmabuf))
           ^
   drivers/usb/gadget/function/f_fs.c:1524:2: note: Taking false branch
           if (IS_ERR(attach)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1529:2: note: Calling 'ffs_dmabuf_put'
           ffs_dmabuf_put(attach);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1347:2: note: Calling 'kref_put'
           kref_put(&priv->ref, ffs_dmabuf_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'ffs_dmabuf_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1328:2: note: Taking false branch
           pr_debug("FFS DMABUF release\n");
           ^
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:377:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/usb/gadget/function/f_fs.c:1328:2: note: Loop condition is false.  Exiting loop
           pr_debug("FFS DMABUF release\n");
           ^
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/usb/gadget/function/f_fs.c:1328:2: note: Taking true branch
           pr_debug("FFS DMABUF release\n");
           ^
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:222:2: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   drivers/usb/gadget/function/f_fs.c:1328:2: note: Loop condition is false.  Exiting loop
           pr_debug("FFS DMABUF release\n");
           ^
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:220:58: note: expanded from macro '__dynamic_func_call_cls'
   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
                                                            ^
   drivers/usb/gadget/function/f_fs.c:1333:2: note: Memory is released
           kfree(priv);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1347:2: note: Returning; memory was released
           kref_put(&priv->ref, ffs_dmabuf_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1529:2: note: Returning; memory was released
           ffs_dmabuf_put(attach);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1530:2: note: Calling 'ffs_dmabuf_put'
           ffs_dmabuf_put(attach);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1347:2: note: Calling 'kref_put'
           kref_put(&priv->ref, ffs_dmabuf_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'ffs_dmabuf_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1325:38: note: Use of memory after it is freed
           struct dma_buf_attachment *attach = priv->attach;
                                               ^~~~~~~~~~~~
>> drivers/usb/gadget/function/f_fs.c:1708:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = -EFAULT;
                           ^     ~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1708:4: note: Value stored to 'ret' is never read
                           ret = -EFAULT;
                           ^     ~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1719:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = -EFAULT;
                           ^     ~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1719:4: note: Value stored to 'ret' is never read
                           ret = -EFAULT;
                           ^     ~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1730:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = -EFAULT;
                           ^     ~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1730:4: note: Value stored to 'ret' is never read
                           ret = -EFAULT;
                           ^     ~~~~~~~
   include/linux/spinlock.h:325:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           return &lock->rlock;
           ^
   drivers/usb/gadget/function/f_fs.c:4044:2: note: Loop condition is false.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENTER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:4045:6: note: Assuming 'func' is not equal to field 'func'
           if (ffs->func == func) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:4045:2: note: Taking false branch
           if (ffs->func == func) {
           ^
   drivers/usb/gadget/function/f_fs.c:4053:6: note: Assuming the condition is true
           if (!--opts->refcnt)
               ^~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:4053:2: note: Taking true branch
           if (!--opts->refcnt)
           ^
   drivers/usb/gadget/function/f_fs.c:4054:3: note: Calling 'functionfs_unbind'
                   functionfs_unbind(ffs);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2323:2: note: Loop condition is false.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENTER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:2325:15: note: Assuming field 'gadget' is non-null
           if (!WARN_ON(!ffs->gadget)) {
                        ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2325:7: note: Taking false branch
           if (!WARN_ON(!ffs->gadget)) {
                ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/usb/gadget/function/f_fs.c:2325:2: note: Taking true branch
           if (!WARN_ON(!ffs->gadget)) {
           ^
   drivers/usb/gadget/function/f_fs.c:2334:3: note: Calling 'ffs_data_put'
                   ffs_data_put(ffs);
                   ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2138:2: note: Loop condition is false.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENTER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:2140:2: note: Taking true branch
           if (refcount_dec_and_test(&ffs->ref)) {
           ^
   drivers/usb/gadget/function/f_fs.c:2141:3: note: Loop condition is false.  Exiting loop
                   pr_info("%s(): freeing\n", __func__);
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:455:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:426:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:401:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/gadget/function/f_fs.c:2144:10: note: Assuming the condition is true
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||

vim +1325 drivers/usb/gadget/function/f_fs.c

2e4c7553cd6f9c6 drivers/usb/gadget/f_fs.c          Robert Baldyga 2014-02-10  1321  
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1322  static void ffs_dmabuf_release(struct kref *ref)
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1323  {
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1324  	struct ffs_dmabuf_priv *priv = container_of(ref, struct ffs_dmabuf_priv, ref);
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22 @1325  	struct dma_buf_attachment *attach = priv->attach;
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1326  	struct dma_buf *dmabuf = attach->dmabuf;
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1327  
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1328  	pr_debug("FFS DMABUF release\n");
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1329  	dma_buf_detach(attach->dmabuf, attach);
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1330  	dma_buf_put(dmabuf);
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1331  
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1332  	list_del(&priv->entry);
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1333  	kfree(priv);
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1334  }
80c5660d9135823 drivers/usb/gadget/function/f_fs.c Paul Cercueil  2023-03-22  1335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
