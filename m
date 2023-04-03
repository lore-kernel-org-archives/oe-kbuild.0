Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA47E
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Apr 2023 01:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680484541; x=1712020541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0EgZdd1kTg2/IWRgLi1ywvp1VDpAhcu5moRaMxsNwc=;
  b=KOtAqMderUG2EEYFwfITcyv+AW8rXEEO6DJJI3/5s2CZiuyhHFfElP6N
   Og4zxfPZoz9/kOIr+zJqPgYvinzqjnF+VAQLoCundq5C+WY8rGihm3DF1
   EUWlOjiy+xLpeEwL6Sfo0nKJAOKkS0FJkQ5n/sy0i2BWFwLF3/BH2rKYP
   Hib1ozhCoRDROm5oY7fVukOhM8ahkHibsQoDrCq9em4UquCWy/JmI5I4/
   5tHCZgzhqMVp7tDZ1AcOJlY4Ebja3qgl4j7ZyBjCtuDAgvC4OdmHAV4hZ
   Cyr5OSj7gAtlkRHvgzrsOmJwX24CXcFHPw+/hGx2K4RJAaZyBKb0NzgWx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="404539146"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="404539146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 18:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="716116190"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="716116190"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Apr 2023 18:15:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj8nJ-000Nrx-2p;
	Mon, 03 Apr 2023 01:15:37 +0000
Date: Mon, 3 Apr 2023 09:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/display/drm_dp_helper.c:3677:4: warning: Undefined
 or garbage value returned to caller
 [clang-analyzer-core.uninitialized.UndefReturn]
Message-ID: <202304030925.5h82jtsi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/display/drm_dp_helper.c:3677:4: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e364e56293bb98cae1b55fd835f5991c4e96e7d
commit: 1e0f66420b13fdd45754be0f15220a9185d59aa4 drm/display: Introduce a DRM display-helper module
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20230327 (https://download.01.org/0day-ci/archive/20230403/202304030925.5h82jtsi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e0f66420b13fdd45754be0f15220a9185d59aa4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1e0f66420b13fdd45754be0f15220a9185d59aa4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304030925.5h82jtsi-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                                  ^~~~
   include/linux/spinlock.h:324:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:123:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &offset, 1);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:123:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, &offset, 1);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:124:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data + 1, buffer, size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:124:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data + 1, buffer, size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/gpu/drm/display/drm_dp_helper.c:480:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:480:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:693:2: warning: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS + 1],
           ^~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:693:2: note: Call to function 'memmove' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memmove_s' in case of C11
           memmove(&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS + 1],
           ^~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:872:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:872:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:931:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:931:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1370:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(id, 0, sizeof(id));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1370:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(id, 0, sizeof(id));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1813:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1813:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/display/drm_dp_helper.c:3677:4: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                           return buf[0];
                           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3813:6: note: Assuming 'panel' is non-null
           if (!panel || !panel->dev || !aux)
               ^~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3813:6: note: Left side of '||' is false
   drivers/gpu/drm/display/drm_dp_helper.c:3813:16: note: Assuming field 'dev' is non-null
           if (!panel || !panel->dev || !aux)
                         ^~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3813:6: note: Left side of '||' is false
           if (!panel || !panel->dev || !aux)
               ^
   drivers/gpu/drm/display/drm_dp_helper.c:3813:31: note: Assuming 'aux' is non-null
           if (!panel || !panel->dev || !aux)
                                        ^~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3813:2: note: Taking false branch
           if (!panel || !panel->dev || !aux)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3818:6: note: 'ret' is >= 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/display/drm_dp_helper.c:3818:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3821:2: note: Taking false branch
           if (!drm_edp_backlight_supported(edp_dpcd)) {
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3827:6: note: Assuming 'bl' is non-null
           if (!bl)
               ^~~
   drivers/gpu/drm/display/drm_dp_helper.c:3827:2: note: Taking false branch
           if (!bl)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3832:8: note: Calling 'drm_edp_backlight_init'
           ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3712:6: note: Assuming the condition is false
           if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3712:2: note: Taking false branch
           if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3714:6: note: Assuming the condition is true
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3714:2: note: Taking true branch
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3716:6: note: Assuming the condition is false
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3716:2: note: Taking false branch
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3720:11: note: Field 'aux_set' is true
           if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP)) {
                    ^
   drivers/gpu/drm/display/drm_dp_helper.c:3720:19: note: Left side of '&&' is false
           if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP)) {
                            ^
   drivers/gpu/drm/display/drm_dp_helper.c:3727:8: note: Calling 'drm_edp_backlight_probe_max'
           ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3558:11: note: Field 'aux_set' is true
           if (!bl->aux_set)
                    ^
   drivers/gpu/drm/display/drm_dp_helper.c:3558:2: note: Taking false branch
           if (!bl->aux_set)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3562:6: note: Assuming 'ret' is equal to 1
           if (ret != 1) {
               ^~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3562:2: note: Taking false branch
           if (ret != 1) {
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3570:7: note: 'driver_pwm_freq_hz' is 0
           if (!driver_pwm_freq_hz)
                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3570:2: note: Taking true branch
           if (!driver_pwm_freq_hz)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3571:3: note: Returning without writing to 'bl->aux_set', which participates in a condition later
                   return 0;
                   ^
   drivers/gpu/drm/display/drm_dp_helper.c:3571:3: note: Returning without writing to 'bl->lsb_reg_used', which participates in a condition later
   drivers/gpu/drm/display/drm_dp_helper.c:3727:8: note: Returning from 'drm_edp_backlight_probe_max'
           ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3728:6: note: 'ret' is >= 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/display/drm_dp_helper.c:3728:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3731:8: note: Calling 'drm_edp_backlight_probe_state'
           ret = drm_edp_backlight_probe_state(aux, bl, current_mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3654:6: note: Assuming 'ret' is equal to 1
           if (ret != 1) {
               ^~~~~~~~

vim +3677 drivers/gpu/drm/display/drm_dp_helper.c

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3644  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3645  static inline int
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3646  drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3647  			      u8 *current_mode)
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3648  {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3649  	int ret;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3650  	u8 buf[2];
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3651  	u8 mode_reg;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3652  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3653  	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3654  	if (ret != 1) {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3655  		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3656  			    aux->name, ret);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3657  		return ret < 0 ? ret : -EIO;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3658  	}
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3659  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3660  	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3661  	if (!bl->aux_set)
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3662  		return 0;
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3663  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3664  	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3665  		int size = 1 + bl->lsb_reg_used;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3666  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3667  		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3668  		if (ret != size) {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3669  			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight level: %d\n",
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3670  				    aux->name, ret);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3671  			return ret < 0 ? ret : -EIO;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3672  		}
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3673  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3674  		if (bl->lsb_reg_used)
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3675  			return (buf[0] << 8) | buf[1];
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3676  		else
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14 @3677  			return buf[0];
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3678  	}
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3679  
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3680  	/*
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3681  	 * If we're not in DPCD control mode yet, the programmed brightness value is meaningless and
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3682  	 * the driver should assume max brightness
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3683  	 */
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3684  	return bl->max;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3685  }
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3686  

:::::: The code at line 3677 was first introduced by commit
:::::: 867cf9cd73c3d31666e4b480aa4f52828d25ac94 drm/dp: Extract i915's eDP backlight code into DRM helpers

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
