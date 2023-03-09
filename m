Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A0C28E
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678391920; x=1709927920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RFjHAvXLASyyOSuU/NQ56cDdghqCl/F606OMqZe7lv8=;
  b=LgaOkHcytKC+/ajvfz0RiR0x5wHZJgGFjntawpLMqUqV4hqk5Ma3bI6f
   ML5LnByh1PQYku07Lrp1z4IGf12l3wdOWTd8WQAf8cCvXlDX5SSFq88yT
   Vov/KzWAVed2486RR//wfnnBMO02GVyW9CbmrZuiHmYn38VBFE7401Msl
   pgCLaJrzciyJC/9N1SQBEQ/L2TazjKirJPFprpmsBJpogoK+dvBUNwL2Y
   SrzrNKzATTt34JTLZM5OEYJZAe/qidoKl0fYFHgbdaZ9qIp9uCSQorLz3
   LjD2tTiWu8QWvmhJwba6FF6uR+OIHUjfoQh9CU4KWFOoNMGIA3QmDdaf+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338919945"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="338919945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 11:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="707752477"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="707752477"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2023 11:58:39 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paMPO-0003Bb-0h;
	Thu, 09 Mar 2023 19:58:38 +0000
Date: Fri, 10 Mar 2023 03:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/erofs/super.c:748:27: warning: Value stored to 'ctx' during its
 initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303100313.UgUH3LS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/erofs/super.c:748:27: warning: Value stored to 'ctx' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeffle Xu <jefflexu@linux.alibaba.com>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: 9c0cc9c729657446ed001a99488a9d82f5124af4 erofs: add 'fsid' mount option
date:   10 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230308 (https://download.01.org/0day-ci/archive/20230310/202303100313.UgUH3LS9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c0cc9c729657446ed001a99488a9d82f5124af4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9c0cc9c729657446ed001a99488a9d82f5124af4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303100313.UgUH3LS9-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/fuse/dev.c:1679:6: note: Assuming 'file_size' is >= field 'offset'
           if (outarg->offset > file_size)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1679:2: note: Taking false branch
           if (outarg->offset > file_size)
           ^
   fs/fuse/dev.c:1681:11: note: Assuming the condition is false
           else if (outarg->offset + num > file_size)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1681:7: note: Taking false branch
           else if (outarg->offset + num > file_size)
                ^
   fs/fuse/dev.c:1685:14: note: Assuming '__UNIQUE_ID___x254' is >= '__UNIQUE_ID___y255'
           num_pages = min(num_pages, fc->max_pages);
                       ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/fuse/dev.c:1685:14: note: '?' condition is false
           num_pages = min(num_pages, fc->max_pages);
                       ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/fuse/dev.c:1689:7: note: Calling 'kzalloc'
           ra = kzalloc(args_size, GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Uninitialized value stored to field 'num_pages'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1689:7: note: Returning from 'kzalloc'
           ra = kzalloc(args_size, GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1690:6: note: Assuming 'ra' is non-null
           if (!ra)
               ^~~
   fs/fuse/dev.c:1690:2: note: Taking false branch
           if (!ra)
           ^
   fs/fuse/dev.c:1706:9: note: Assuming 'num' is not equal to 0
           while (num && ap->num_pages < num_pages) {
                  ^~~
   fs/fuse/dev.c:1706:9: note: Left side of '&&' is true
   fs/fuse/dev.c:1706:30: note: The left operand of '<' is a garbage value
           while (num && ap->num_pages < num_pages) {
                         ~~~~~~~~~~~~~ ^
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/erofs/super.c:94:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vi, 0, offsetof(struct erofs_inode, vfs_inode));
           ^~~~~~
   fs/erofs/super.c:94:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(vi, 0, offsetof(struct erofs_inode, vfs_inode));
           ^~~~~~
   fs/erofs/super.c:157:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + i, ptr + erofs_blkoff(*offset), cnt);
                   ^~~~~~
   fs/erofs/super.c:157:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + i, ptr + erofs_blkoff(*offset), cnt);
                   ^~~~~~
   fs/erofs/super.c:352:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sb->s_uuid, dsb->uuid, sizeof(dsb->uuid));
           ^~~~~~
   fs/erofs/super.c:352:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&sb->s_uuid, dsb->uuid, sizeof(dsb->uuid));
           ^~~~~~
>> fs/erofs/super.c:748:27: warning: Value stored to 'ctx' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct erofs_fs_context *ctx = fc->fs_private;
                                    ^~~   ~~~~~~~~~~~~~~
   fs/erofs/super.c:748:27: note: Value stored to 'ctx' during its initialization is never read
           struct erofs_fs_context *ctx = fc->fs_private;
                                    ^~~   ~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   51 warnings generated.
   fs/erofs/inode.c:45:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   fs/erofs/inode.c:45:3: note: Value stored to 'err' is never read
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   fs/erofs/inode.c:53:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   fs/erofs/inode.c:53:3: note: Value stored to 'err' is never read
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   fs/erofs/inode.c:69:5: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                                   err = -ENOMEM;
                                   ^     ~~~~~~~
   fs/erofs/inode.c:69:5: note: Value stored to 'err' is never read
                                   err = -ENOMEM;
                                   ^     ~~~~~~~
   fs/erofs/inode.c:72:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(copied, dic, gotten);
                           ^~~~~~
   fs/erofs/inode.c:72:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(copied, dic, gotten);
                           ^~~~~~
   fs/erofs/inode.c:82:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)copied + gotten, kaddr, *ofs);
                           ^~~~~~
   fs/erofs/inode.c:82:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)copied + gotten, kaddr, *ofs);
                           ^~~~~~
   fs/erofs/inode.c:167:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   fs/erofs/inode.c:167:3: note: Value stored to 'err' is never read
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   fs/erofs/inode.c:176:4: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err = -EOPNOTSUPP;
                           ^     ~~~~~~~~~~~
   fs/erofs/inode.c:176:4: note: Value stored to 'err' is never read
                           err = -EOPNOTSUPP;
                           ^     ~~~~~~~~~~~
   fs/erofs/inode.c:201:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = -EFSCORRUPTED;
           ^     ~~~~~~~~~~~~~
   fs/erofs/inode.c:201:2: note: Value stored to 'err' is never read
           err = -EFSCORRUPTED;
           ^     ~~~~~~~~~~~~~
   fs/erofs/inode.c:236:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lnk, kaddr + m_pofs, inode->i_size);
           ^~~~~~
   fs/erofs/inode.c:236:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lnk, kaddr + m_pofs, inode->i_size);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   crypto/curve25519-generic.c:18:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(secret, buf, CURVE25519_KEY_SIZE);
                   ^~~~~~
   crypto/curve25519-generic.c:18:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(secret, buf, CURVE25519_KEY_SIZE);
                   ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   crypto/ecdh.c:40:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->private_key, params.key, params.key_size);
           ^~~~~~
   crypto/ecdh.c:40:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->private_key, params.key, params.key_size);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   crypto/ecdh_helper.c:17:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, sz);
           ^~~~~~
   crypto/ecdh_helper.c:17:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, sz);
           ^~~~~~
   crypto/ecdh_helper.c:23:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, sz);
           ^~~~~~
   crypto/ecdh_helper.c:23:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, sz);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/ctx +748 fs/erofs/super.c

f57a3fe44995a38 Chao Yu   2020-05-29  745  
f57a3fe44995a38 Chao Yu   2020-05-29  746  static int erofs_fc_get_tree(struct fs_context *fc)
f57a3fe44995a38 Chao Yu   2020-05-29  747  {
9c0cc9c72965744 Jeffle Xu 2022-04-25 @748  	struct erofs_fs_context *ctx = fc->fs_private;
9c0cc9c72965744 Jeffle Xu 2022-04-25  749  
9c0cc9c72965744 Jeffle Xu 2022-04-25  750  	if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) && ctx->opt.fsid)
9c0cc9c72965744 Jeffle Xu 2022-04-25  751  		return get_tree_nodev(fc, erofs_fc_fill_super);
9c0cc9c72965744 Jeffle Xu 2022-04-25  752  
f57a3fe44995a38 Chao Yu   2020-05-29  753  	return get_tree_bdev(fc, erofs_fc_fill_super);
f57a3fe44995a38 Chao Yu   2020-05-29  754  }
f57a3fe44995a38 Chao Yu   2020-05-29  755  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
