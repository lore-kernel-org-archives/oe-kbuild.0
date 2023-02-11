Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5B2F27
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Feb 2023 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676129298; x=1707665298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qC7nI/U1HgGAhytXrCP5F1dbKLzvbI3Jno2u+4I2Xq8=;
  b=PAnZ9XOgE5B4hwojELJ6rtBLVINFSD5tyv7hQawb2VQWDn0/m8o2tfZ6
   SvhVdmjbELcmzhLtr1IvkNgYbPTSGvuDTsjRWG3xLl1JBnIYN5NFybIEw
   nTmZqu0ga7uAFUhQRc4m2i33Gmv84IWGZ9bu1T9oWIHZ6GHECqmUoNjeE
   b8+IdkWX4P2xwJqBbSu8dChmYdj5s3oH3hS2fCsCgxQDrQSr2W3QA7+7L
   LLhlxp+nXlDOAElX1n2eG+mqQoDLXi4gFQjv08p3KYO0CFRChjLMzZzON
   ertE59SUe8rcsmE9OwLwVuhA+SC3z1tK1Rc6k3ftrPY3RxqvTuTB1d9/L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="328315510"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="328315510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 07:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="700773188"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="700773188"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Feb 2023 07:28:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQrnS-0006d7-3A;
	Sat, 11 Feb 2023 15:28:14 +0000
Date: Sat, 11 Feb 2023 23:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10688/12152]
 fs/notify/fanotify/fanotify_user.c:873:21: warning: Value stored to
 'info_buf' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302112310.VDfNOOBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/notify/fanotify/fanotify_user.c:873:21: warning: Value stored to 'info_buf' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Richard Guy Briggs <rgb@redhat.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: 70529a199574c15a40f46b14256633b02ba10ca2 [10688/12152] fanotify: define struct members to hold response decision context
:::::: branch date: 35 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20230210 (https://download.01.org/0day-ci/archive/20230211/202302112310.VDfNOOBm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=70529a199574c15a40f46b14256633b02ba10ca2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 70529a199574c15a40f46b14256633b02ba10ca2
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302112310.VDfNOOBm-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   fs/notify/fanotify/fanotify_user.c:425:2: note: Taking false branch
           pr_debug("%s: fh_len=%zu name_len=%zu, info_len=%zu, count=%zu\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
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
   fs/notify/fanotify/fanotify_user.c:425:2: note: Loop condition is false.  Exiting loop
           pr_debug("%s: fh_len=%zu name_len=%zu, info_len=%zu, count=%zu\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
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
   fs/notify/fanotify/fanotify_user.c:428:19: note: Left side of '||' is false
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
                            ^
   fs/notify/fanotify/fanotify_user.c:428:41: note: Assuming 'len' is <= 'count'
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
                                                  ^
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:428:2: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
           ^
   fs/notify/fanotify/fanotify_user.c:435:2: note: Control jumps to 'case 1:'  at line 436
           switch (info_type) {
           ^
   fs/notify/fanotify/fanotify_user.c:438:3: note: Taking false branch
                   if (WARN_ON_ONCE(name_len))
                   ^
   fs/notify/fanotify/fanotify_user.c:440:3: note:  Execution continues on line 451
                   break;
                   ^
   fs/notify/fanotify/fanotify_user.c:454:6: note: Assuming the condition is false
           if (copy_to_user(buf, &info, sizeof(info)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:454:2: note: Taking false branch
           if (copy_to_user(buf, &info, sizeof(info)))
           ^
   fs/notify/fanotify/fanotify_user.c:459:2: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(handle)))
           ^
   fs/notify/fanotify/fanotify_user.c:462:23: note: Access to field 'type' results in a dereference of a null pointer (loaded from variable 'fh')
           handle.handle_type = fh->type;
                                ^~
   fs/notify/fanotify/fanotify_user.c:649:3: warning: Value stored to 'buf' is never read [clang-analyzer-deadcode.DeadStores]
                   buf += ret;
                   ^      ~~~
   fs/notify/fanotify/fanotify_user.c:649:3: note: Value stored to 'buf' is never read
                   buf += ret;
                   ^      ~~~
   fs/notify/fanotify/fanotify_user.c:650:3: warning: Value stored to 'count' is never read [clang-analyzer-deadcode.DeadStores]
                   count -= ret;
                   ^        ~~~
   fs/notify/fanotify/fanotify_user.c:650:3: note: Value stored to 'count' is never read
                   count -= ret;
                   ^        ~~~
>> fs/notify/fanotify/fanotify_user.c:873:21: warning: Value stored to 'info_buf' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char __user *info_buf = buf + sizeof(struct fanotify_response);
                              ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:873:21: note: Value stored to 'info_buf' during its initialization is never read
           const char __user *info_buf = buf + sizeof(struct fanotify_response);
                              ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1813:14: warning: Access to field 'i_mode' results in a dereference of a null pointer (loaded from variable 'inode') [clang-analyzer-core.NullDereference]
               (mnt || S_ISDIR(inode->i_mode)) &&
                       ^
   include/uapi/linux/stat.h:23:22: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) == S_IFDIR)
                             ^~
   fs/notify/fanotify/fanotify_user.c:1636:2: note: 'inode' initialized to a null pointer value
           struct inode *inode = NULL;
           ^~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1650:2: note: Taking false branch
           pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   fs/notify/fanotify/fanotify_user.c:1650:2: note: Loop condition is false.  Exiting loop
           pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   fs/notify/fanotify/fanotify_user.c:1650:2: note: Taking false branch
           pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
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
   fs/notify/fanotify/fanotify_user.c:1650:2: note: Loop condition is false.  Exiting loop
           pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
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
   fs/notify/fanotify/fanotify_user.c:1654:6: note: Assuming the condition is false
           if (upper_32_bits(mask))
               ^
   include/linux/kernel.h:74:27: note: expanded from macro 'upper_32_bits'
   #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
                             ^~~~~~~~~~~~~~~~~~~~~~~~

vim +/info_buf +873 fs/notify/fanotify/fanotify_user.c

a1014f10232239 Eric Paris         2009-12-17  867  
b2d879096ac799 Eric Paris         2009-12-17  868  static ssize_t fanotify_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
b2d879096ac799 Eric Paris         2009-12-17  869  {
70529a199574c1 Richard Guy Briggs 2023-02-03  870  	struct fanotify_response response;
b2d879096ac799 Eric Paris         2009-12-17  871  	struct fsnotify_group *group;
b2d879096ac799 Eric Paris         2009-12-17  872  	int ret;
70529a199574c1 Richard Guy Briggs 2023-02-03 @873  	const char __user *info_buf = buf + sizeof(struct fanotify_response);
70529a199574c1 Richard Guy Briggs 2023-02-03  874  	size_t info_len;
b2d879096ac799 Eric Paris         2009-12-17  875  
6685df31255493 Miklos Szeredi     2017-10-30  876  	if (!IS_ENABLED(CONFIG_FANOTIFY_ACCESS_PERMISSIONS))
6685df31255493 Miklos Szeredi     2017-10-30  877  		return -EINVAL;
6685df31255493 Miklos Szeredi     2017-10-30  878  
b2d879096ac799 Eric Paris         2009-12-17  879  	group = file->private_data;
b2d879096ac799 Eric Paris         2009-12-17  880  
70529a199574c1 Richard Guy Briggs 2023-02-03  881  	pr_debug("%s: group=%p count=%zu\n", __func__, group, count);
70529a199574c1 Richard Guy Briggs 2023-02-03  882  
5e23663b49e1e8 Fabian Frederick   2020-05-12  883  	if (count < sizeof(response))
5e23663b49e1e8 Fabian Frederick   2020-05-12  884  		return -EINVAL;
5e23663b49e1e8 Fabian Frederick   2020-05-12  885  
70529a199574c1 Richard Guy Briggs 2023-02-03  886  	if (copy_from_user(&response, buf, sizeof(response)))
b2d879096ac799 Eric Paris         2009-12-17  887  		return -EFAULT;
b2d879096ac799 Eric Paris         2009-12-17  888  
70529a199574c1 Richard Guy Briggs 2023-02-03  889  	info_len = count - sizeof(response);
70529a199574c1 Richard Guy Briggs 2023-02-03  890  
70529a199574c1 Richard Guy Briggs 2023-02-03  891  	ret = process_access_response(group, &response, info_buf, info_len);
b2d879096ac799 Eric Paris         2009-12-17  892  	if (ret < 0)
b2d879096ac799 Eric Paris         2009-12-17  893  		count = ret;
70529a199574c1 Richard Guy Briggs 2023-02-03  894  	else
70529a199574c1 Richard Guy Briggs 2023-02-03  895  		count = sizeof(response) + ret;
b2d879096ac799 Eric Paris         2009-12-17  896  
b2d879096ac799 Eric Paris         2009-12-17  897  	return count;
b2d879096ac799 Eric Paris         2009-12-17  898  }
b2d879096ac799 Eric Paris         2009-12-17  899  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
