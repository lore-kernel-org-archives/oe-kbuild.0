Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9EB624
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 00:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674434149; x=1705970149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OyXBtDEk6CuVLwG2wFLbk2ZARwePWujWq7CpWGM9KnM=;
  b=fwq74BnjWB7EZ6RjQ3lGM0SQbfiG+xkL37kzmPaL9RCnDxD+JKLrVOf9
   sUAZ4WBTT/6bLpq1hSCk8vZvp9JSF50Akn/cwP+Lc2E+XEYbHauqS1zUv
   WujQdRcdbwuQ0jMixAGwYXdHT8VtCM0NHZdCIbNF95FxF9DshEOmbGxj4
   iZfiXNaqkkauZ+GL1yUKHxqXadWT+mU/DSMkRsTKU3IMDxNZj0P62DwlK
   sCO6gN1RosdLznvwattMMd6sb2aSy9UA9L9DRMk3ZjZGZoPfmUPI6Clar
   AJrd4PBVUe7ijOnGzXgfjp8u19WD6XnFONdus9oJigki9HSnDRgEuMZZt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305616668"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="305616668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 16:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="750148716"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="750148716"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2023 16:35:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJkoM-0005Jc-1m;
	Mon, 23 Jan 2023 00:35:46 +0000
Date: Mon, 23 Jan 2023 08:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: warning: Value
 stored to 'dsc_common_mode' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301230823.3GoEOFPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: warning: Value stored to 'dsc_common_mode' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vinod Koul <vkoul@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: 58dca9810749480737869d02bef4704756372194 drm/msm/disp/dpu1: Add support for DSC in encoder
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-c006-20230118 (https://download.01.org/0day-ci/archive/20230123/202301230823.3GoEOFPA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=58dca9810749480737869d02bef4704756372194
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58dca9810749480737869d02bef4704756372194
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   ~~~~~~~^~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:202:8: note: Excessive padding in 'struct max9485_clk' (11 padding bytes, where 3 is optimal). Optimal fields order: name, ops, parent_index, enable_bit, consider reordering the fields or adding explicit padding members
   struct max9485_clk {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/msm/adreno/adreno_device.c:459:7: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(compat, "qcom,adreno-%u.%u", &r, &patch) == 2 ||
                       ^~~~~~
   drivers/gpu/drm/msm/adreno/adreno_device.c:459:7: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(compat, "qcom,adreno-%u.%u", &r, &patch) == 2 ||
                       ^~~~~~
   drivers/gpu/drm/msm/adreno/adreno_device.c:460:7: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                       sscanf(compat, "amd,imageon-%u.%u", &r, &patch) == 2) {
                       ^~~~~~
   drivers/gpu/drm/msm/adreno/adreno_device.c:460:7: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
                       sscanf(compat, "amd,imageon-%u.%u", &r, &patch) == 2) {
                       ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/msm/adreno/adreno_gpu.c:29:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &gpu->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/adreno_gpu.c:29:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &gpu->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:778:2: warning: Value stored to 'priv' is never read [clang-analyzer-deadcode.DeadStores]
           priv = dev->dev_private;
           ^      ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:778:2: note: Value stored to 'priv' is never read
           priv = dev->dev_private;
           ^      ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1550:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
           ^~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1550:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
           ^~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:592:2: warning: Value stored to 'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode = &crtc_state->mode;
           ^      ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:592:2: note: Value stored to 'mode' is never read
           mode = &crtc_state->mode;
           ^      ~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: warning: Value stored to 'dsc_common_mode' is never read [clang-analyzer-deadcode.DeadStores]
           dsc_common_mode = 0;
           ^                 ~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: note: Value stored to 'dsc_common_mode' is never read
           dsc_common_mode = 0;
           ^                 ~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1945:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
           ^~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1945:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
           ^~~~~~~~
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/mfd/tc3589x.c:193:17: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   status &= ~(1 << bit);
                                 ^  ~~~
   drivers/mfd/tc3589x.c:185:6: note: Assuming 'status' is >= 0
           if (status < 0)
               ^~~~~~~~~~
   drivers/mfd/tc3589x.c:185:2: note: Taking false branch
           if (status < 0)
           ^
   drivers/mfd/tc3589x.c:188:2: note: Loop condition is true.  Entering loop body
           while (status) {
           ^
   drivers/mfd/tc3589x.c:189:13: note: Calling '__ffs'
                   int bit = __ffs(status);
                             ^~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is true
           if ((word & 0xffffffff) == 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:19:3: note: The value 32 is assigned to 'num'
                   num += 32;
                   ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is false
           if ((word & 0xffff) == 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking false branch
           if ((word & 0xffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is false
           if ((word & 0xff) == 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking false branch
           if ((word & 0xff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is false
           if ((word & 0xf) == 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking false branch
           if ((word & 0xf) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is false
           if ((word & 0x3) == 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking false branch
           if ((word & 0x3) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is false
           if ((word & 0x1) == 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking false branch
           if ((word & 0x1) == 0)
           ^
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 32 (loaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/mfd/tc3589x.c:189:13: note: Returning from '__ffs'
                   int bit = __ffs(status);
                             ^~~~~~~~~~~~~
   drivers/mfd/tc3589x.c:189:3: note: 'bit' initialized to 32
                   int bit = __ffs(status);
                   ^~~~~~~
   drivers/mfd/tc3589x.c:193:17: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int'
                   status &= ~(1 << bit);
                                 ^  ~~~
   drivers/mfd/tc3589x.c:193:17: warning: The result of the left shift is undefined due to shifting by '33', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   status &= ~(1 << bit);
                                 ^  ~~~
   drivers/mfd/tc3589x.c:185:6: note: Assuming 'status' is >= 0
           if (status < 0)

vim +/dsc_common_mode +1782 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

58dca981074948 Vinod Koul 2022-04-06  1757  
58dca981074948 Vinod Koul 2022-04-06  1758  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
58dca981074948 Vinod Koul 2022-04-06  1759  				 struct msm_display_dsc_config *dsc)
58dca981074948 Vinod Koul 2022-04-06  1760  {
58dca981074948 Vinod Koul 2022-04-06  1761  	/* coding only for 2LM, 2enc, 1 dsc config */
58dca981074948 Vinod Koul 2022-04-06  1762  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
58dca981074948 Vinod Koul 2022-04-06  1763  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul 2022-04-06  1764  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul 2022-04-06  1765  	int this_frame_slices;
58dca981074948 Vinod Koul 2022-04-06  1766  	int intf_ip_w, enc_ip_w;
58dca981074948 Vinod Koul 2022-04-06  1767  	int dsc_common_mode;
58dca981074948 Vinod Koul 2022-04-06  1768  	int pic_width;
58dca981074948 Vinod Koul 2022-04-06  1769  	u32 initial_lines;
58dca981074948 Vinod Koul 2022-04-06  1770  	int i;
58dca981074948 Vinod Koul 2022-04-06  1771  
58dca981074948 Vinod Koul 2022-04-06  1772  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
58dca981074948 Vinod Koul 2022-04-06  1773  		hw_pp[i] = dpu_enc->hw_pp[i];
58dca981074948 Vinod Koul 2022-04-06  1774  		hw_dsc[i] = dpu_enc->hw_dsc[i];
58dca981074948 Vinod Koul 2022-04-06  1775  
58dca981074948 Vinod Koul 2022-04-06  1776  		if (!hw_pp[i] || !hw_dsc[i]) {
58dca981074948 Vinod Koul 2022-04-06  1777  			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
58dca981074948 Vinod Koul 2022-04-06  1778  			return;
58dca981074948 Vinod Koul 2022-04-06  1779  		}
58dca981074948 Vinod Koul 2022-04-06  1780  	}
58dca981074948 Vinod Koul 2022-04-06  1781  
58dca981074948 Vinod Koul 2022-04-06 @1782  	dsc_common_mode = 0;
58dca981074948 Vinod Koul 2022-04-06  1783  	pic_width = dsc->drm->pic_width;
58dca981074948 Vinod Koul 2022-04-06  1784  
58dca981074948 Vinod Koul 2022-04-06  1785  	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
58dca981074948 Vinod Koul 2022-04-06  1786  	if (enc_master->intf_mode == INTF_MODE_VIDEO)
58dca981074948 Vinod Koul 2022-04-06  1787  		dsc_common_mode |= DSC_MODE_VIDEO;
58dca981074948 Vinod Koul 2022-04-06  1788  
58dca981074948 Vinod Koul 2022-04-06  1789  	this_frame_slices = pic_width / dsc->drm->slice_width;
58dca981074948 Vinod Koul 2022-04-06  1790  	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
58dca981074948 Vinod Koul 2022-04-06  1791  
58dca981074948 Vinod Koul 2022-04-06  1792  	/*
58dca981074948 Vinod Koul 2022-04-06  1793  	 * dsc merge case: when using 2 encoders for the same stream,
58dca981074948 Vinod Koul 2022-04-06  1794  	 * no. of slices need to be same on both the encoders.
58dca981074948 Vinod Koul 2022-04-06  1795  	 */
58dca981074948 Vinod Koul 2022-04-06  1796  	enc_ip_w = intf_ip_w / 2;
58dca981074948 Vinod Koul 2022-04-06  1797  	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
58dca981074948 Vinod Koul 2022-04-06  1798  
58dca981074948 Vinod Koul 2022-04-06  1799  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
58dca981074948 Vinod Koul 2022-04-06  1800  		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
58dca981074948 Vinod Koul 2022-04-06  1801  }
58dca981074948 Vinod Koul 2022-04-06  1802  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
