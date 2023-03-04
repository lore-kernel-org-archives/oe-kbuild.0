Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F15D2916
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 21:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677965709; x=1709501709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxTLkJx4J3oZnl123PR99kybKxbLrN4zBnbuRPATHbY=;
  b=VuA96x6k9mR3+hCpcsqkPRdRgERNZAtmDZ92XLn/zteahrrjjDQpvspC
   LTtE05MwXpMFM34RWFpuSZxf+e8yJj5oUJsQXY0sHp5/motc9pjVh/ken
   wp/YXvNKZkovldU8ij0GdiCJYN+Tei29bzbe5VLgyrMuGpeF2J3VI32cg
   W771aWq1Gr5gHI8gaMDl0rsgL2YOwDIoLoOH6U5jqBUrpuWAvPi52kOTu
   BHbwfjaD0yolmcz60EKxIJ5QwTzspyIWmnF12G8A/snp3CXGhNW1wfbeg
   5UibogHORb6P2nNe7C5T0+r++k0Ni1Wq6mMsO8Qogiwiv58x8uF+yIrXe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="400129865"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="400129865"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 13:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="799589114"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="799589114"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2023 13:35:07 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYZX0-0002N4-0t;
	Sat, 04 Mar 2023 21:35:06 +0000
Date: Sun, 5 Mar 2023 05:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ksmbd/misc.c:188:3: warning: Call to function 'strcpy' is
 insecure as it does not provide bounding of the memory buffer. Replace
 unbounded copy functions with analogous functions that support length
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-...
Message-ID: <202303050501.Pn4ckHYC-lkp@intel.com>
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
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: 50f500b7f6335404b18bbffa93e3a905a08d061a ksmbd: remove filename in ksmbd_file
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050501.Pn4ckHYC-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202303050501.Pn4ckHYC-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:1751:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
           ^~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:1759:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
           ^~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:1759:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
           ^~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:1836:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dev->edid, vivid_hdmi_edid, sizeof(vivid_hdmi_edid));
           ^~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:1836:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dev->edid, vivid_hdmi_edid, sizeof(vivid_hdmi_edid));
           ^~~~~~
   Suppressed 59 warnings (58 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/power/supply/ds2781_battery.c:459:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/power/supply/ds2781_battery.c:459:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/power/supply/ds2781_battery.c:512:8: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret = sprintf(buf, "%d\n", sense_resistor);
                 ^~~~~~~
   drivers/power/supply/ds2781_battery.c:512:8: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           ret = sprintf(buf, "%d\n", sense_resistor);
                 ^~~~~~~
   drivers/power/supply/ds2781_battery.c:550:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rsgain);
                  ^~~~~~~
   drivers/power/supply/ds2781_battery.c:550:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rsgain);
                  ^~~~~~~
   drivers/power/supply/ds2781_battery.c:593:8: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret = sprintf(buf, "%d\n", sfr & DS2781_SFR_PIOSC);
                 ^~~~~~~
   drivers/power/supply/ds2781_battery.c:593:8: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           ret = sprintf(buf, "%d\n", sfr & DS2781_SFR_PIOSC);
                 ^~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/i2c/mt9v111.c:492:13: warning: Although the value stored to 'vb' is used in the enclosing expression, the value is never actually read from 'vb' [clang-analyzer-deadcode.DeadStores]
           best_fps = vb = hb = 0;
                      ^    ~~~~~~
   drivers/media/i2c/mt9v111.c:492:13: note: Although the value stored to 'vb' is used in the enclosing expression, the value is never actually read from 'vb'
           best_fps = vb = hb = 0;
                      ^    ~~~~~~
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/i2c/ov5640.c:1007:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5640.c:1007:2: note: Value stored to 'ret' is never read
           ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
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
