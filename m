Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668FC442D
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680448870; x=1711984870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEeC1dC5oNJrWKF+wLp/jk1DMhsJTeklDbY03cQRGkY=;
  b=CcG9Auqr/DRiCkxAoXFbu9PeCj8bG8ot+8ZB5po915sVwqYkfdBsb91R
   rgcEp/Iw6qtrhECzIPMUdJW2b8NLebjv/z31v1Q+ER1fbXb8bGXL+2XT1
   JLtFeP+fMXu47FwPtXti2kOMjxbLLXQ1GOAU+tPSaars2beLseHsDd1FN
   Y3V4oOsspYc3aohyqSHTUN/IfFq3zmQbYMiS+z3/kKbm2lid10tBBH+8p
   gKPQbXoX7UF9Xpamnq7g900oZEbTCiPByAqrNAOSeWTkdFofhRzKxb0BT
   5krS8j/2RUDTQhEpnn7HtIJVSMlRtdGVQAxtB2Xn71lStcH81zF/HDVJz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322136559"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="322136559"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 08:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="662938672"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="662938672"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Apr 2023 08:21:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pizVz-000NTd-0C;
	Sun, 02 Apr 2023 15:21:07 +0000
Date: Sun, 2 Apr 2023 23:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/drm/display/drm_dp_helper.h:1832:9: warning: Array access
 (from variable 'dsc_dpcd') results in a null pointer dereference
 [clang-analyzer-core.NullDereference]
Message-ID: <202304022352.hsZSKOMr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/drm/display/drm_dp_helper.h:1832:9: warning: Array access (from variable 'dsc_dpcd') results in a null pointer dereference [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: da68386d9edb1f57abf886febe5c5169ebd4d2c9 drm: Rename dp/ to display/
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20230327 (https://download.01.org/0day-ci/archive/20230402/202304022352.hsZSKOMr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da68386d9edb1f57abf886febe5c5169ebd4d2c9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout da68386d9edb1f57abf886febe5c5169ebd4d2c9
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304022352.hsZSKOMr-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                ^~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs.c:123:9: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           x += snprintf(buf + x, len - x, "64K, ");
                                ^~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs.c:123:9: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                           x += snprintf(buf + x, len - x, "64K, ");
                                ^~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs.c:125:9: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           x += snprintf(buf + x, len - x, "4K, ");
                                ^~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs.c:125:9: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                           x += snprintf(buf + x, len - x, "4K, ");
                                ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:147:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           drm_for_each_fb(drm_fb, dev) {
           ^
   include/drm/drm_framebuffer.h:293:12: note: expanded from macro 'drm_for_each_fb'
                fb = list_next_entry(fb, head))
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:147:2: note: Assuming the condition is false
           drm_for_each_fb(drm_fb, dev) {
           ^
   include/drm/drm_framebuffer.h:289:15: note: expanded from macro 'drm_for_each_fb'
           for (WARN_ON(!mutex_is_locked(&(dev)->mode_config.fb_lock)),            \
                ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:147:2: note: Taking false branch
           drm_for_each_fb(drm_fb, dev) {
           ^
   include/drm/drm_framebuffer.h:289:7: note: expanded from macro 'drm_for_each_fb'
           for (WARN_ON(!mutex_is_locked(&(dev)->mode_config.fb_lock)),            \
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:147:18: note: Value assigned to 'drm_fb'
           drm_for_each_fb(drm_fb, dev) {
                           ^
   include/drm/drm_framebuffer.h:290:7: note: expanded from macro 'drm_for_each_fb'
                fb = list_first_entry(&(dev)->mode_config.fb_list, \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:147:2: note: Loop condition is true.  Entering loop body
           drm_for_each_fb(drm_fb, dev) {
           ^
   include/drm/drm_framebuffer.h:289:2: note: expanded from macro 'drm_for_each_fb'
           for (WARN_ON(!mutex_is_locked(&(dev)->mode_config.fb_lock)),            \
           ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:149:7: note: Assuming 'fb' is equal to 'fbdev_fb'
                   if (fb == fbdev_fb)
                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:149:3: note: Taking true branch
                   if (fb == fbdev_fb)
                   ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:150:4: note:  Execution continues on line 147
                           continue;
                           ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:147:2: note: Dereference of null pointer
           drm_for_each_fb(drm_fb, dev) {
           ^
   include/drm/drm_framebuffer.h:293:12: note: expanded from macro 'drm_for_each_fb'
                fb = list_next_entry(fb, head))
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:624:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, bufsize,
           ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:624:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, bufsize,
           ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:1526:8: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret = sscanf(tmp, "%hu %hu %hu %hu %hu %hu %hu %hu",
                 ^~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:1526:8: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
           ret = sscanf(tmp, "%hu %hu %hu %hu %hu %hu %hu %hu",
                 ^~~~~~
>> include/drm/display/drm_dp_helper.h:1832:9: warning: Array access (from variable 'dsc_dpcd') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return dsc_dpcd[DP_DSC_SUPPORT - DP_DSC_SUPPORT] &
                  ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2050:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2050:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2058:7: note: Assuming field 'status' is equal to connector_status_connected
                   if (connector->status != connector_status_connected || !crtc) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2058:7: note: Left side of '||' is false
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2058:58: note: Assuming 'crtc' is non-null
                   if (connector->status != connector_status_connected || !crtc) {
                                                                          ^~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2058:3: note: Taking false branch
                   if (connector->status != connector_status_connected || !crtc) {
                   ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2063:7: note: Assuming the condition is false
                   if (ret == -EDEADLK) {
                       ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2063:3: note: Taking false branch
                   if (ret == -EDEADLK) {
                   ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2070:14: note: Assuming 'ret' is 0
                   } else if (ret) {
                              ^~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2070:10: note: Taking false branch
                   } else if (ret) {
                          ^
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2078:43: note: Passing null pointer value via 1st parameter 'dsc_dpcd'
                              str_yes_no(drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)));
                                                                  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:2078:18: note: Calling 'drm_dp_sink_supports_dsc'
                              str_yes_no(drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)));
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/display/drm_dp_helper.h:1832:9: note: Array access (from variable 'dsc_dpcd') results in a null pointer dereference
           return dsc_dpcd[DP_DSC_SUPPORT - DP_DSC_SUPPORT] &
                  ^~~~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/firewire/core-topology.c:260:5: warning: Array subscript is undefined [clang-analyzer-core.uninitialized.ArraySubscript]
                                   child->ports[child->color] = node;
                                   ^
   drivers/firewire/core-topology.c:518:6: note: Left side of '&&' is true
           if (!is_next_generation(generation, card->generation) &&
               ^
   drivers/firewire/core-topology.c:519:6: note: Assuming field 'local_node' is equal to NULL
               card->local_node != NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:518:2: note: Taking false branch
           if (!is_next_generation(generation, card->generation) &&
           ^
   drivers/firewire/core-topology.c:524:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&card->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/firewire/core-topology.c:524:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&card->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/firewire/core-topology.c:539:15: note: Calling 'build_tree'
           local_node = build_tree(card, self_ids, self_id_count);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:183:2: note: Calling 'INIT_LIST_HEAD'
           INIT_LIST_HEAD(&stack);
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:37:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   include/linux/list.h:37:2: note: Left side of '||' is false
--
                   ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
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
   drivers/hwmon/lm73.c:76:62: note: The result of the left shift is undefined because the left operand is negative
           value = clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) << 5;
                                                                       ^
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/leds/leds-bd2802.c:437:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret = sprintf(buf, "on\n");
                         ^~~~~~~
   drivers/leds/leds-bd2802.c:437:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   ret = sprintf(buf, "on\n");
                         ^~~~~~~
   drivers/leds/leds-bd2802.c:439:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret = sprintf(buf, "off\n");
                         ^~~~~~~
   drivers/leds/leds-bd2802.c:439:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   ret = sprintf(buf, "off\n");
                         ^~~~~~~
   drivers/leds/leds-bd2802.c:508:1: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   BD2802_CONTROL_ATTR(wave_pattern, "wave_pattern");
   ^
   drivers/leds/leds-bd2802.c:479:8: note: expanded from macro 'BD2802_CONTROL_ATTR'
           ret = sprintf(buf, "0x%02x\n", led->attr_name);                 \
                 ^~~~~~~
   drivers/leds/leds-bd2802.c:508:1: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
   BD2802_CONTROL_ATTR(wave_pattern, "wave_pattern");
   ^
   drivers/leds/leds-bd2802.c:479:8: note: expanded from macro 'BD2802_CONTROL_ATTR'
           ret = sprintf(buf, "0x%02x\n", led->attr_name);                 \
                 ^~~~~~~
   drivers/leds/leds-bd2802.c:509:1: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   BD2802_CONTROL_ATTR(rgb_current, "rgb_current");
   ^
   drivers/leds/leds-bd2802.c:479:8: note: expanded from macro 'BD2802_CONTROL_ATTR'
           ret = sprintf(buf, "0x%02x\n", led->attr_name);                 \
                 ^~~~~~~
   drivers/leds/leds-bd2802.c:509:1: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
   BD2802_CONTROL_ATTR(rgb_current, "rgb_current");
   ^
   drivers/leds/leds-bd2802.c:479:8: note: expanded from macro 'BD2802_CONTROL_ATTR'
           ret = sprintf(buf, "0x%02x\n", led->attr_name);                 \
                 ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/input/misc/kxtj9.c:299:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tj9->last_poll_interval);
                  ^~~~~~~
   drivers/input/misc/kxtj9.c:299:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tj9->last_poll_interval);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/input/misc/palmas-pwrbutton.c:122:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(config, 0, sizeof(*config));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/input/misc/palmas-pwrbutton.c:122:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(config, 0, sizeof(*config));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   61 warnings generated.
>> include/drm/display/drm_dp_helper.h:1877:9: warning: Array access (from variable 'dpcd') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return dpcd[DP_DOWN_STREAM_PORT_COUNT] &
                  ^
   drivers/gpu/drm/i915/display/intel_vrr.c:100:7: note: Calling 'intel_vrr_is_capable'
           if (!intel_vrr_is_capable(&connector->base))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_vrr.c:18:6: note: Assuming field 'connector_type' is equal to DRM_MODE_CONNECTOR_eDP
           if (connector->connector_type != DRM_MODE_CONNECTOR_eDP &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_vrr.c:18:58: note: Left side of '&&' is false
           if (connector->connector_type != DRM_MODE_CONNECTOR_eDP &&
                                                                   ^
   drivers/gpu/drm/i915/display/intel_vrr.c:29:9: note: Assuming field 'ver' is >= 11
           return HAS_VRR(i915) &&
                  ^
   drivers/gpu/drm/i915/i915_drv.h:1355:24: note: expanded from macro 'HAS_VRR'
   #define HAS_VRR(i915)   (DISPLAY_VER(i915) >= 11)
                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_drv.h:919:27: note: expanded from macro 'DISPLAY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_vrr.c:29:9: note: Left side of '&&' is true
           return HAS_VRR(i915) &&
                  ^
   drivers/gpu/drm/i915/i915_drv.h:1355:23: note: expanded from macro 'HAS_VRR'
   #define HAS_VRR(i915)   (DISPLAY_VER(i915) >= 11)
                           ^
   drivers/gpu/drm/i915/display/intel_vrr.c:30:47: note: Passing null pointer value via 1st parameter 'dpcd'
                   drm_dp_sink_can_do_video_without_timing_msa(intel_dp->dpcd) &&
                                                               ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_vrr.c:30:3: note: Calling 'drm_dp_sink_can_do_video_without_timing_msa'
                   drm_dp_sink_can_do_video_without_timing_msa(intel_dp->dpcd) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/display/drm_dp_helper.h:1877:9: note: Array access (from variable 'dpcd') results in a null pointer dereference
           return dpcd[DP_DOWN_STREAM_PORT_COUNT] &
                  ^~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/gpu/drm/i915/display/vlv_dsi.c:147:2: warning: Value stored to 'data' is never read [clang-analyzer-deadcode.DeadStores]
           data = packet.payload;
           ^      ~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/vlv_dsi.c:147:2: note: Value stored to 'data' is never read
           data = packet.payload;
           ^      ~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/vlv_dsi.c:1175:2: warning: Value stored to 'vbp' is never read [clang-analyzer-deadcode.DeadStores]
           vbp = intel_de_read(dev_priv, MIPI_VBP_COUNT(port));
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/vlv_dsi.c:1175:2: note: Value stored to 'vbp' is never read
           vbp = intel_de_read(dev_priv, MIPI_VBP_COUNT(port));
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/i3c/device.c:221:10: warning: The left operand of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           manuf = I3C_PID_MANUF_ID(devinfo.pid);
                   ^
   include/linux/i3c/device.h:79:40: note: expanded from macro 'I3C_PID_MANUF_ID'
   #define I3C_PID_MANUF_ID(pid)           (((pid) & GENMASK_ULL(47, 33)) >> 33)
                                              ~~~  ^
   drivers/i3c/device.c:219:2: note: Calling 'i3c_device_get_info'
           i3c_device_get_info(i3cdev, &devinfo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/device.c:64:7: note: 'info' is non-null
           if (!info)
                ^~~~
   drivers/i3c/device.c:64:2: note: Taking false branch
           if (!info)
           ^
   drivers/i3c/device.c:68:6: note: Assuming field 'desc' is null
           if (dev->desc)
               ^~~~~~~~~
   drivers/i3c/device.c:68:2: note: Taking false branch
           if (dev->desc)
           ^
   drivers/i3c/device.c:71:1: note: Returning without writing to '->pid'
   }
   ^
   drivers/i3c/device.c:219:2: note: Returning from 'i3c_device_get_info'
           i3c_device_get_info(i3cdev, &devinfo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/device.c:221:10: note: The left operand of '&' is a garbage value
           manuf = I3C_PID_MANUF_ID(devinfo.pid);
                   ^
   include/linux/i3c/device.h:79:40: note: expanded from macro 'I3C_PID_MANUF_ID'
   #define I3C_PID_MANUF_ID(pid)           (((pid) & GENMASK_ULL(47, 33)) >> 33)
                                              ~~~  ^
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/i3c/master.c:141:8: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret = sprintf(buf, "%x\n", desc->info.bcr);
                 ^~~~~~~
   drivers/i3c/master.c:141:8: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           ret = sprintf(buf, "%x\n", desc->info.bcr);
                 ^~~~~~~
   drivers/i3c/master.c:158:8: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret = sprintf(buf, "%x\n", desc->info.dcr);
                 ^~~~~~~
   drivers/i3c/master.c:158:8: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           ret = sprintf(buf, "%x\n", desc->info.dcr);

vim +/dsc_dpcd +1832 include/drm/display/drm_dp_helper.h

c726ad01d2e3e2 include/drm/drm_dp_helper.h Imre Deak       2016-10-24  1821  
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1822  /* DP/eDP DSC support */
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1823  u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1824  				   bool is_edp);
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1825  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
4d4101c8b32186 include/drm/drm_dp_helper.h Manasi Navare   2018-11-27  1826  int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
4d4101c8b32186 include/drm/drm_dp_helper.h Manasi Navare   2018-11-27  1827  					 u8 dsc_bpc[3]);
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1828  
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1829  static inline bool
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1830  drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1831  {
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30 @1832  	return dsc_dpcd[DP_DSC_SUPPORT - DP_DSC_SUPPORT] &
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1833  		DP_DSC_DECOMPRESSION_IS_SUPPORTED;
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1834  }
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1835  
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1836  static inline u16
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1837  drm_edp_dsc_sink_output_bpp(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1838  {
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1839  	return dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_LOW - DP_DSC_SUPPORT] |
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1840  		(dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] &
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1841  		 DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK <<
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1842  		 DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT);
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1843  }
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1844  
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1845  static inline u32
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1846  drm_dp_dsc_sink_max_slice_width(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1847  {
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1848  	/* Max Slicewidth = Number of Pixels * 320 */
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1849  	return dsc_dpcd[DP_DSC_MAX_SLICE_WIDTH - DP_DSC_SUPPORT] *
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1850  		DP_DSC_SLICE_WIDTH_MULTIPLIER;
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1851  }
0575650077eae2 include/drm/drm_dp_helper.h Manasi Navare   2018-10-30  1852  
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1853  /* Forward Error Correction Support on DP 1.4 */
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1854  static inline bool
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1855  drm_dp_sink_supports_fec(const u8 fec_capable)
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1856  {
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1857  	return fec_capable & DP_FEC_CAPABLE;
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1858  }
857d828374cc84 include/drm/drm_dp_helper.h Anusha Srivatsa 2018-11-01  1859  
99c830b8b7bef9 include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1860  static inline bool
99c830b8b7bef9 include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1861  drm_dp_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
99c830b8b7bef9 include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1862  {
99c830b8b7bef9 include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1863  	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
99c830b8b7bef9 include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1864  }
99c830b8b7bef9 include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1865  
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1866  static inline bool
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1867  drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1868  {
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1869  	return dpcd[DP_EDP_CONFIGURATION_CAP] &
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1870  			DP_ALTERNATE_SCRAMBLER_RESET_CAP;
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1871  }
7624629d06b01d include/drm/drm_dp_helper.h Thierry Reding  2019-10-21  1872  
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1873  /* Ignore MSA timing for Adaptive Sync support on DP 1.4 */
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1874  static inline bool
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1875  drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1876  {
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20 @1877  	return dpcd[DP_DOWN_STREAM_PORT_COUNT] &
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1878  		DP_MSA_TIMING_PAR_IGNORED;
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1879  }
24cfbec99647d2 include/drm/drm_dp_helper.h Manasi Navare   2020-06-20  1880  

:::::: The code at line 1832 was first introduced by commit
:::::: 0575650077eae2a431f33532de4e15405cc9f653 drm/dp: DRM DP helper/macros to get DP sink DSC parameters

:::::: TO: Manasi Navare <manasi.d.navare@intel.com>
:::::: CC: Manasi Navare <manasi.d.navare@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
