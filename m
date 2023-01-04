Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851EBA45
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Jan 2023 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672868654; x=1704404654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hP/rJ/ksEuji6NA942LSOy8lofS26dFnD5j2JlF0pYk=;
  b=nZtN9WCPPYI5E+a2oCm9zJQ/njcCNpivzmIUoqJjrCwoBr+V0iOUN8uD
   UiAZF/syCKGmbFoD3rlg97/AZ909dD1j13m5Zx0E25pwt4Eyr1eYZPauc
   dtPSzxibd3G6Ez5DOPN52nnSRZYg1BGz44QH1hVy3f2heXBW0Y/8hdhTg
   9QZrphpqpYYAY32iCxhVPVYMz9ol40iDfMvyr8zHVsAnuvhk7SDNGikdN
   wZbfapqQwCKMUwDUsTPJEQsgrQvGGUW9UFE8Fi78Sb0syfO0UcAz4RgTw
   PV6QzLMA8ZhvtqBoh5ZzNCAJKpl32vdA0jB72peZr1hAS3y3tSoGjS14A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="386487516"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
   d="scan'208";a="386487516"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 13:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829295953"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
   d="scan'208";a="829295953"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2023 13:44:12 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDBYR-0000nv-1X;
	Wed, 04 Jan 2023 21:44:11 +0000
Date: Thu, 5 Jan 2023 05:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 24/26] drivers/gpu/drm/drm_bridge.c:671:4:
 warning: Assignment of function parameter has no effect outside the
 function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Message-ID: <202301050530.QTOO09wJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/drm_bridge.c:671:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Maxime Ripard <maxime@cerno.tech>
CC: Frieder Schrempf <frieder.schrempf@kontron.de>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   51342cc021400841b461cc579f76db24cdb482fc
commit: 4fb912e5e19075874379cfcf074d90bd51ebf8ea [24/26] drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4fb912e5e19075874379cfcf074d90bd51ebf8ea
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/radeon/radeon_device.c:1581:22: warning: Local variable 'robj' shadows outer variable [shadowVariable]
      struct radeon_bo *robj = gem_to_radeon_bo(radeon_crtc->cursor_bo);
                        ^
   drivers/gpu/drm/radeon/radeon_device.c:1578:21: note: Shadowed declaration
     struct radeon_bo *robj;
                       ^
   drivers/gpu/drm/radeon/radeon_device.c:1581:22: note: Shadow variable
      struct radeon_bo *robj = gem_to_radeon_bo(radeon_crtc->cursor_bo);
                        ^
   drivers/gpu/drm/drm_bridge.c:1098:7: warning: Local variable 'ret' shadows outer variable [shadowVariable]
     int ret;
         ^
   drivers/gpu/drm/drm_bridge.c:1086:6: note: Shadowed declaration
    int ret;
        ^
   drivers/gpu/drm/drm_bridge.c:1098:7: note: Shadow variable
     int ret;
         ^
>> drivers/gpu/drm/drm_modes.c:422:7: warning: Local variable 'porches_rem' shadows outer variable [shadowVariable]
     int porches_rem = porches - hfp_min - hbp_min;
         ^
   drivers/gpu/drm/drm_modes.c:344:6: note: Shadowed declaration
    int porches_rem;
        ^
   drivers/gpu/drm/drm_modes.c:422:7: note: Shadow variable
     int porches_rem = porches - hfp_min - hbp_min;
         ^
   drivers/gpu/drm/drm_modes.c:2439:16: warning: Local variable 'len' shadows outer variable [shadowVariable]
     unsigned int len = strlen(mode_option);
                  ^
   drivers/gpu/drm/drm_modes.c:2370:6: note: Shadowed declaration
    int len, ret;
        ^
   drivers/gpu/drm/drm_modes.c:2439:16: note: Shadow variable
     unsigned int len = strlen(mode_option);
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/radeon/radeon_pm.c:157:11: warning: Uninitialized variable: bo->tbo [uninitvar]
     if (bo->tbo.resource->mem_type == TTM_PL_VRAM)
             ^
   drivers/gpu/drm/radeon/radeon_pm.c:153:16: note: Assuming condition is false
    if (list_empty(&rdev->gem.objects))
                  ^
   drivers/gpu/drm/radeon/radeon_pm.c:157:11: note: Uninitialized variable: bo->tbo
     if (bo->tbo.resource->mem_type == TTM_PL_VRAM)
             ^
--
>> drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:685:26: warning: Parameter 'property' can be declared as pointer to const [constParameter]
       struct drm_property *property,
                            ^
>> drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:111:9: warning: Signed integer overflow for expression '0xa<<28'. [integerOverflow]
     & 0xa << 28;
           ^
--
>> drivers/gpu/drm/nouveau/nouveau_bo.c:935:20: warning: Uninitialized variables: vma.vmm, vma.refs, vma.head, vma.addr, vma.mem, vma.fence [uninitvar]
      nouveau_vma_map(vma, mem);
                      ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:927:18: note: Assuming condition is false
    if (bo->destroy != nouveau_bo_del_ttm)
                    ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:935:20: note: Uninitialized variables: vma.vmm, vma.refs, vma.head, vma.addr, vma.mem, vma.fence
      nouveau_vma_map(vma, mem);
                      ^
--
>> drivers/gpu/drm/drm_bridge.c:671:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
      bridge = limit;
      ^
   drivers/gpu/drm/drm_bridge.c:1290:59: warning: Parameter 'np' can be declared as pointer to const [constParameter]
   struct drm_bridge *of_drm_find_bridge(struct device_node *np)
                                                             ^
--
>> drivers/gpu/drm/ttm/ttm_bo.c:1173:28: warning: Local variable 'ctx' shadows outer argument [shadowArgument]
     struct ttm_operation_ctx ctx = { false, false };
                              ^
   drivers/gpu/drm/ttm/ttm_bo.c:1133:76: note: Shadowed declaration
   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
                                                                              ^
   drivers/gpu/drm/ttm/ttm_bo.c:1173:28: note: Shadow variable
     struct ttm_operation_ctx ctx = { false, false };
                              ^
--

vim +671 drivers/gpu/drm/drm_bridge.c

4fb912e5e19075 Dave Stevenson  2022-12-05  602  
5ade071ba13e3b Sean Paul       2019-06-11  603  /**
ea099adfdf4bf3 Boris Brezillon 2019-12-03  604   * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
ea099adfdf4bf3 Boris Brezillon 2019-12-03  605   *					  in the encoder chain
5ade071ba13e3b Sean Paul       2019-06-11  606   * @bridge: bridge control structure
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  607   * @old_state: old atomic state
5ade071ba13e3b Sean Paul       2019-06-11  608   *
5ade071ba13e3b Sean Paul       2019-06-11  609   * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
5ade071ba13e3b Sean Paul       2019-06-11  610   * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
5ade071ba13e3b Sean Paul       2019-06-11  611   * starting from the first bridge to the last. These are called after completing
5ade071ba13e3b Sean Paul       2019-06-11  612   * &drm_encoder_helper_funcs.atomic_disable
5ade071ba13e3b Sean Paul       2019-06-11  613   *
4fb912e5e19075 Dave Stevenson  2022-12-05  614   * If a bridge sets @pre_enable_prev_first, then the @post_disable for that
4fb912e5e19075 Dave Stevenson  2022-12-05  615   * bridge will be called before the previous one to reverse the @pre_enable
4fb912e5e19075 Dave Stevenson  2022-12-05  616   * calling direction.
4fb912e5e19075 Dave Stevenson  2022-12-05  617   *
5ade071ba13e3b Sean Paul       2019-06-11  618   * Note: the bridge passed should be the one closest to the encoder
5ade071ba13e3b Sean Paul       2019-06-11  619   */
ea099adfdf4bf3 Boris Brezillon 2019-12-03  620  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  621  					  struct drm_atomic_state *old_state)
5ade071ba13e3b Sean Paul       2019-06-11  622  {
05193dc3819702 Boris Brezillon 2019-12-03  623  	struct drm_encoder *encoder;
4fb912e5e19075 Dave Stevenson  2022-12-05  624  	struct drm_bridge *next, *limit;
05193dc3819702 Boris Brezillon 2019-12-03  625  
5ade071ba13e3b Sean Paul       2019-06-11  626  	if (!bridge)
5ade071ba13e3b Sean Paul       2019-06-11  627  		return;
5ade071ba13e3b Sean Paul       2019-06-11  628  
05193dc3819702 Boris Brezillon 2019-12-03  629  	encoder = bridge->encoder;
4fb912e5e19075 Dave Stevenson  2022-12-05  630  
05193dc3819702 Boris Brezillon 2019-12-03  631  	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
4fb912e5e19075 Dave Stevenson  2022-12-05  632  		limit = NULL;
4fb912e5e19075 Dave Stevenson  2022-12-05  633  
4fb912e5e19075 Dave Stevenson  2022-12-05  634  		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
4fb912e5e19075 Dave Stevenson  2022-12-05  635  			next = list_next_entry(bridge, chain_node);
4fb912e5e19075 Dave Stevenson  2022-12-05  636  
4fb912e5e19075 Dave Stevenson  2022-12-05  637  			if (next->pre_enable_prev_first) {
4fb912e5e19075 Dave Stevenson  2022-12-05  638  				/* next bridge had requested that prev
4fb912e5e19075 Dave Stevenson  2022-12-05  639  				 * was enabled first, so disabled last
4fb912e5e19075 Dave Stevenson  2022-12-05  640  				 */
4fb912e5e19075 Dave Stevenson  2022-12-05  641  				limit = next;
4fb912e5e19075 Dave Stevenson  2022-12-05  642  
4fb912e5e19075 Dave Stevenson  2022-12-05  643  				/* Find the next bridge that has NOT requested
4fb912e5e19075 Dave Stevenson  2022-12-05  644  				 * prev to be enabled first / disabled last
4fb912e5e19075 Dave Stevenson  2022-12-05  645  				 */
4fb912e5e19075 Dave Stevenson  2022-12-05  646  				list_for_each_entry_from(next, &encoder->bridge_chain,
4fb912e5e19075 Dave Stevenson  2022-12-05  647  							 chain_node) {
4fb912e5e19075 Dave Stevenson  2022-12-05  648  					if (next->pre_enable_prev_first) {
4fb912e5e19075 Dave Stevenson  2022-12-05  649  						next = list_prev_entry(next, chain_node);
4fb912e5e19075 Dave Stevenson  2022-12-05  650  						limit = next;
4fb912e5e19075 Dave Stevenson  2022-12-05  651  						break;
4fb912e5e19075 Dave Stevenson  2022-12-05  652  					}
4fb912e5e19075 Dave Stevenson  2022-12-05  653  				}
4fb912e5e19075 Dave Stevenson  2022-12-05  654  
4fb912e5e19075 Dave Stevenson  2022-12-05  655  				/* Call these bridges in reverse order */
4fb912e5e19075 Dave Stevenson  2022-12-05  656  				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
4fb912e5e19075 Dave Stevenson  2022-12-05  657  								 chain_node) {
4fb912e5e19075 Dave Stevenson  2022-12-05  658  					if (next == bridge)
4fb912e5e19075 Dave Stevenson  2022-12-05  659  						break;
4fb912e5e19075 Dave Stevenson  2022-12-05  660  
4fb912e5e19075 Dave Stevenson  2022-12-05  661  					drm_atomic_bridge_call_post_disable(next,
4fb912e5e19075 Dave Stevenson  2022-12-05  662  									    old_state);
4fb912e5e19075 Dave Stevenson  2022-12-05  663  				}
4fb912e5e19075 Dave Stevenson  2022-12-05  664  			}
4fb912e5e19075 Dave Stevenson  2022-12-05  665  		}
4fb912e5e19075 Dave Stevenson  2022-12-05  666  
4fb912e5e19075 Dave Stevenson  2022-12-05  667  		drm_atomic_bridge_call_post_disable(bridge, old_state);
4fb912e5e19075 Dave Stevenson  2022-12-05  668  
4fb912e5e19075 Dave Stevenson  2022-12-05  669  		if (limit)
4fb912e5e19075 Dave Stevenson  2022-12-05  670  			/* Jump all bridges that we have already post_disabled */
4fb912e5e19075 Dave Stevenson  2022-12-05 @671  			bridge = limit;
4fb912e5e19075 Dave Stevenson  2022-12-05  672  	}
4fb912e5e19075 Dave Stevenson  2022-12-05  673  }
4fb912e5e19075 Dave Stevenson  2022-12-05  674  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
4fb912e5e19075 Dave Stevenson  2022-12-05  675  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
