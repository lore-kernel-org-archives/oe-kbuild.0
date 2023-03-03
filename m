Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C89A950
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Mar 2023 22:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677883170; x=1709419170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ezUcDU7Sy6ZBUxxLpHe5z72KwlQ8TQ0IhEX9+scJ1Uk=;
  b=KDyI0oGFrhjUVY11fMfbqLbOmiijnaAxKUQe9O2Tb+JZjc8AeBDxvSDa
   2FIwsoGu50R2SpcN/yoVNuD8+4vLmCUF1uVpJEuXv/bHeSUvu1Pygvsjh
   1MidB2AwfchOYYwAfpuPO/yUp8EV/TlSl5YoAerRyGuSaFx2DkWLZlAeH
   x1jNZkXCF5FdXBg3dqv2NTSVs4XCA+RFwg2wyRsRR1mQvewl9TsH6ZTzV
   r1ZM4ruIF1/4lCgB8y9R50XRuPRCB5yHh6ZPn+aDSca+YIfKN2NcnD8dL
   uB21cHHQDqAh5pJKABmqA/KBVRBmP2WTs0KNC/UvSYZ/TqKq1IN4XWdRZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399990329"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="399990329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 14:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849640990"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="849640990"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Mar 2023 14:39:27 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYE3i-0001hS-3A;
	Fri, 03 Mar 2023 22:39:26 +0000
Date: Sat, 4 Mar 2023 06:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ksmbd/misc.c:188:3: warning: Call to function 'strcpy' is
 insecure as it does not provide bounding of the memory buffer. Replace
 unbounded copy functions with analogous functions that support length
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-...
Message-ID: <202303040627.sI4R0m4s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ksmbd/misc.c:188:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>
CC: Hyunchul Lee <hyc.lee@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a3f9a6b0265b64c02226fcabb5e9a958307913b
commit: 50f500b7f6335404b18bbffa93e3a905a08d061a ksmbd: remove filename in ksmbd_file
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040627.sI4R0m4s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=50f500b7f6335404b18bbffa93e3a905a08d061a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 50f500b7f6335404b18bbffa93e3a905a08d061a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303040627.sI4R0m4s-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3491:6: note: Assuming 'rev' is not equal to 8210
           if (rev != 0x2012) {
               ^~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3491:2: note: Taking true branch
           if (rev != 0x2012) {
           ^
   drivers/media/i2c/adv7842.c:3492:3: note: Loop condition is false.  Exiting loop
                   v4l2_info(sd, "got rev=0x%04x on first read attempt\n", rev);
                   ^
   include/media/v4l2-common.h:67:2: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
           ^
   include/media/v4l2-common.h:58:2: note: expanded from macro 'v4l2_printk'
           printk(level "%s: " fmt, (dev)->name , ## arg)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/i2c/adv7842.c:3493:9: note: Calling 'adv_smbus_read_byte_data_check'
                   rev = adv_smbus_read_byte_data_check(client, 0xea, false) << 8 |
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:277:6: note: Assuming the condition is false
           if (!i2c_smbus_xfer(client->adapter, client->addr, client->flags,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:277:2: note: Taking false branch
           if (!i2c_smbus_xfer(client->adapter, client->addr, client->flags,
           ^
   drivers/media/i2c/adv7842.c:281:6: note: 'check' is false
           if (check)
               ^~~~~
   drivers/media/i2c/adv7842.c:281:2: note: Taking false branch
           if (check)
           ^
   drivers/media/i2c/adv7842.c:284:2: note: Returning the value -5
           return -EIO;
           ^~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3493:9: note: Returning from 'adv_smbus_read_byte_data_check'
                   rev = adv_smbus_read_byte_data_check(client, 0xea, false) << 8 |
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3493:61: note: The result of the left shift is undefined because the left operand is negative
                   rev = adv_smbus_read_byte_data_check(client, 0xea, false) << 8 |
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 62 warnings (54 in non-user code, 8 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/media/i2c/rj54n1cb0c.c:687:3: warning: Value stored to 'input_w' is never read [clang-analyzer-deadcode.DeadStores]
                   input_w = output_w;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:687:3: note: Value stored to 'input_w' is never read
                   input_w = output_w;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:688:3: warning: Value stored to 'input_h' is never read [clang-analyzer-deadcode.DeadStores]
                   input_h = output_h;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:688:3: note: Value stored to 'input_h' is never read
                   input_h = output_h;
                   ^         ~~~~~~~~
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:350:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(fw_name, sizeof(fw_name), "SlimISP_%.2s.bin",
           ^~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:350:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(fw_name, sizeof(fw_name), "SlimISP_%.2s.bin",
           ^~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:678:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = s5c73m3_write(state, 0x30100120, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:678:2: note: Value stored to 'ret' is never read
           ret = s5c73m3_write(state, 0x30100120, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:679:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = s5c73m3_write(state, 0x30100124, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:679:2: note: Value stored to 'ret' is never read
           ret = s5c73m3_write(state, 0x30100124, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:682:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = s5c73m3_write(state, 0x00010418, 0x0008);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:682:2: note: Value stored to 'ret' is never read
           ret = s5c73m3_write(state, 0x00010418, 0x0008);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:1481:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = media_create_pad_link(&state->sensor_sd.entity,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:1481:2: note: Value stored to 'ret' is never read
           ret = media_create_pad_link(&state->sensor_sd.entity,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   103 warnings generated.
>> fs/ksmbd/misc.c:188:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(nt_pathname, "/");
                   ^~~~~~
   fs/ksmbd/misc.c:188:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(nt_pathname, "/");
                   ^~~~~~
>> fs/ksmbd/misc.c:189:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(nt_pathname, &ab_pathname[share_path_len]);
           ^~~~~~
   fs/ksmbd/misc.c:189:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(nt_pathname, &ab_pathname[share_path_len]);
           ^~~~~~
   fs/ksmbd/misc.c:272:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_name, share->path, path_len);
           ^~~~~~
   fs/ksmbd/misc.c:272:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_name, share->path, path_len);
           ^~~~~~
   fs/ksmbd/misc.c:278:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_name + path_len + no_slash, name, name_len);
           ^~~~~~
   fs/ksmbd/misc.c:278:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_name + path_len + no_slash, name, name_len);
           ^~~~~~
   Suppressed 99 warnings (98 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   125 warnings generated.
   fs/ksmbd/oplock.c:99:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:99:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:104:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lease->parent_lease_key, lctx->parent_lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:104:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lease->parent_lease_key, lctx->parent_lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:412:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
                   ^~~~~~
   fs/ksmbd/oplock.c:412:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
                   ^~~~~~
   fs/ksmbd/oplock.c:434:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
                   ^~~~~~
   fs/ksmbd/oplock.c:434:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
                   ^~~~~~
   fs/ksmbd/oplock.c:454:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
                   ^~~~~~
   fs/ksmbd/oplock.c:454:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(lease->lease_key, lctx->lease_key, SMB2_LEASE_KEY_SIZE);
                   ^~~~~~
   fs/ksmbd/oplock.c:633:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rsp_hdr, 0, sizeof(struct smb2_hdr) + 2);
           ^~~~~~
   fs/ksmbd/oplock.c:633:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rsp_hdr, 0, sizeof(struct smb2_hdr) + 2);
           ^~~~~~
   fs/ksmbd/oplock.c:646:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rsp_hdr->Signature, 0, 16);
           ^~~~~~
   fs/ksmbd/oplock.c:646:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rsp_hdr->Signature, 0, 16);
           ^~~~~~
   fs/ksmbd/oplock.c:740:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rsp_hdr, 0, sizeof(struct smb2_hdr) + 2);
           ^~~~~~
   fs/ksmbd/oplock.c:740:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rsp_hdr, 0, sizeof(struct smb2_hdr) + 2);
           ^~~~~~
   fs/ksmbd/oplock.c:753:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rsp_hdr->Signature, 0, 16);
           ^~~~~~
   fs/ksmbd/oplock.c:753:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rsp_hdr->Signature, 0, 16);
           ^~~~~~
   fs/ksmbd/oplock.c:764:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rsp->LeaseKey, br_info->lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:764:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rsp->LeaseKey, br_info->lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:809:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(br_info->lease_key, lease->lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:809:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(br_info->lease_key, lease->lease_key, SMB2_LEASE_KEY_SIZE);
           ^~~~~~
   fs/ksmbd/oplock.c:1018:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lease2->lease_key, lease1->lease_key,
           ^~~~~~
   fs/ksmbd/oplock.c:1018:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lease2->lease_key, lease1->lease_key,
           ^~~~~~
   fs/ksmbd/oplock.c:1044:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lb->client_guid, opinfo->conn->ClientGUID,
           ^~~~~~
   fs/ksmbd/oplock.c:1044:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lb->client_guid, opinfo->conn->ClientGUID,
           ^~~~~~
   fs/ksmbd/oplock.c:1341:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, sizeof(struct create_lease_v2));

vim +188 fs/ksmbd/misc.c

e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  151  
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  152  /**
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  153   * convert_to_nt_pathname() - extract and return windows path string
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  154   *      whose share directory prefix was removed from file path
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  155   * @filename : unix filename
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  156   * @sharepath: share path string
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  157   *
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  158   * Return : windows path string or error
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  159   */
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  160  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  161  char *convert_to_nt_pathname(struct ksmbd_share_config *share,
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  162  			     struct path *path)
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  163  {
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  164  	char *pathname, *ab_pathname, *nt_pathname;
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  165  	int share_path_len = share->path_sz;
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  166  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  167  	pathname = kmalloc(PATH_MAX, GFP_KERNEL);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  168  	if (!pathname)
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  169  		return ERR_PTR(-EACCES);
87ffb310d5e8a4 fs/ksmbd/misc.c Dan Carpenter 2021-09-30  170  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  171  	ab_pathname = d_path(path, pathname, PATH_MAX);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  172  	if (IS_ERR(ab_pathname)) {
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  173  		nt_pathname = ERR_PTR(-EACCES);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  174  		goto free_pathname;
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  175  	}
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  176  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  177  	if (strncmp(ab_pathname, share->path, share_path_len)) {
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  178  		nt_pathname = ERR_PTR(-EACCES);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  179  		goto free_pathname;
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  180  	}
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  181  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  182  	nt_pathname = kzalloc(strlen(&ab_pathname[share_path_len]) + 2, GFP_KERNEL);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  183  	if (!nt_pathname) {
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  184  		nt_pathname = ERR_PTR(-ENOMEM);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  185  		goto free_pathname;
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  186  	}
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  187  	if (ab_pathname[share_path_len] == '\0')
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24 @188  		strcpy(nt_pathname, "/");
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24 @189  	strcat(nt_pathname, &ab_pathname[share_path_len]);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  190  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  191  	ksmbd_conv_path_to_windows(nt_pathname);
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  192  
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  193  free_pathname:
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  194  	kfree(pathname);
50f500b7f63354 fs/ksmbd/misc.c Namjae Jeon   2022-02-24  195  	return nt_pathname;
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  196  }
e2f34481b24db2 fs/cifsd/misc.c Namjae Jeon   2021-03-16  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
