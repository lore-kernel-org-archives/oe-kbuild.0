Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97855101D7
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jun 2023 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685630067; x=1717166067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2y82lG3ZJa0BNddsRHZ9tbvxSy4KrCoAXSOSx4pRFg=;
  b=PFUOTDrzfIbEgy5SZCr2QAVewi1vvmQ7Wx45sE7eGGR45m3yq1d7J3yn
   R4jwc5lKFV8OeyIz2IlyxMFpY8rxddyptMAAyJidqzevVgIMNwCYdEye3
   EJXFP7+CrA0nWTuehopTAt8UyVIFKeLR5tBZavyrYcnRCAbm5aKsDbWx2
   qgObkqN2+2vOHdNIh/Bz3jdqkk05hJf/dauohdn2oHd525pREMT7BNh03
   neNu+RVR+Wgx2sNgj3PLatp9KCPVUbc6Z7S2qTL94144LTw2SNYVFkI5a
   gQ1P0LIaUU2kPxZZyxyNt1Xa4eHq5mYkPT4/LT0VK9+NtlpWcpfaOdzll
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355585921"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="355585921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737123566"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="737123566"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 07:34:22 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4jNe-0002NM-0i;
	Thu, 01 Jun 2023 14:34:22 +0000
Date: Thu, 1 Jun 2023 22:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-5.15 15/20]
 drivers/gpu/drm/drm_bridge.c:656:37-41: ERROR: invalid reference to the
 index variable of the iterator on line 646
Message-ID: <202306011950.9HQ3HdZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   df046a4b25bdf916c4cfaf0e0aaafb2950d62412
commit: 27c34754f4710a915d73ba73cb8fda076f75bef1 [15/20] UPSTREAM: drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-c001-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011950.9HQ3HdZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306011950.9HQ3HdZc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_bridge.c:656:37-41: ERROR: invalid reference to the index variable of the iterator on line 646

vim +656 drivers/gpu/drm/drm_bridge.c

27c34754f4710a Dave Stevenson  2022-12-05  602  
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
27c34754f4710a Dave Stevenson  2022-12-05  614   * If a bridge sets @pre_enable_prev_first, then the @post_disable for that
27c34754f4710a Dave Stevenson  2022-12-05  615   * bridge will be called before the previous one to reverse the @pre_enable
27c34754f4710a Dave Stevenson  2022-12-05  616   * calling direction.
27c34754f4710a Dave Stevenson  2022-12-05  617   *
5ade071ba13e3b Sean Paul       2019-06-11  618   * Note: the bridge passed should be the one closest to the encoder
5ade071ba13e3b Sean Paul       2019-06-11  619   */
ea099adfdf4bf3 Boris Brezillon 2019-12-03  620  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  621  					  struct drm_atomic_state *old_state)
5ade071ba13e3b Sean Paul       2019-06-11  622  {
05193dc3819702 Boris Brezillon 2019-12-03  623  	struct drm_encoder *encoder;
27c34754f4710a Dave Stevenson  2022-12-05  624  	struct drm_bridge *next, *limit;
05193dc3819702 Boris Brezillon 2019-12-03  625  
5ade071ba13e3b Sean Paul       2019-06-11  626  	if (!bridge)
5ade071ba13e3b Sean Paul       2019-06-11  627  		return;
5ade071ba13e3b Sean Paul       2019-06-11  628  
05193dc3819702 Boris Brezillon 2019-12-03  629  	encoder = bridge->encoder;
27c34754f4710a Dave Stevenson  2022-12-05  630  
05193dc3819702 Boris Brezillon 2019-12-03  631  	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
27c34754f4710a Dave Stevenson  2022-12-05  632  		limit = NULL;
27c34754f4710a Dave Stevenson  2022-12-05  633  
27c34754f4710a Dave Stevenson  2022-12-05  634  		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
27c34754f4710a Dave Stevenson  2022-12-05  635  			next = list_next_entry(bridge, chain_node);
27c34754f4710a Dave Stevenson  2022-12-05  636  
27c34754f4710a Dave Stevenson  2022-12-05  637  			if (next->pre_enable_prev_first) {
27c34754f4710a Dave Stevenson  2022-12-05  638  				/* next bridge had requested that prev
27c34754f4710a Dave Stevenson  2022-12-05  639  				 * was enabled first, so disabled last
27c34754f4710a Dave Stevenson  2022-12-05  640  				 */
27c34754f4710a Dave Stevenson  2022-12-05  641  				limit = next;
27c34754f4710a Dave Stevenson  2022-12-05  642  
27c34754f4710a Dave Stevenson  2022-12-05  643  				/* Find the next bridge that has NOT requested
27c34754f4710a Dave Stevenson  2022-12-05  644  				 * prev to be enabled first / disabled last
27c34754f4710a Dave Stevenson  2022-12-05  645  				 */
27c34754f4710a Dave Stevenson  2022-12-05 @646  				list_for_each_entry_from(next, &encoder->bridge_chain,
27c34754f4710a Dave Stevenson  2022-12-05  647  							 chain_node) {
27c34754f4710a Dave Stevenson  2022-12-05  648  					if (next->pre_enable_prev_first) {
27c34754f4710a Dave Stevenson  2022-12-05  649  						next = list_prev_entry(next, chain_node);
27c34754f4710a Dave Stevenson  2022-12-05  650  						limit = next;
27c34754f4710a Dave Stevenson  2022-12-05  651  						break;
27c34754f4710a Dave Stevenson  2022-12-05  652  					}
27c34754f4710a Dave Stevenson  2022-12-05  653  				}
27c34754f4710a Dave Stevenson  2022-12-05  654  
27c34754f4710a Dave Stevenson  2022-12-05  655  				/* Call these bridges in reverse order */
27c34754f4710a Dave Stevenson  2022-12-05 @656  				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
27c34754f4710a Dave Stevenson  2022-12-05  657  								 chain_node) {
27c34754f4710a Dave Stevenson  2022-12-05  658  					if (next == bridge)
27c34754f4710a Dave Stevenson  2022-12-05  659  						break;
27c34754f4710a Dave Stevenson  2022-12-05  660  
27c34754f4710a Dave Stevenson  2022-12-05  661  					drm_atomic_bridge_call_post_disable(next,
27c34754f4710a Dave Stevenson  2022-12-05  662  									    old_state);
27c34754f4710a Dave Stevenson  2022-12-05  663  				}
27c34754f4710a Dave Stevenson  2022-12-05  664  			}
27c34754f4710a Dave Stevenson  2022-12-05  665  		}
27c34754f4710a Dave Stevenson  2022-12-05  666  
27c34754f4710a Dave Stevenson  2022-12-05  667  		drm_atomic_bridge_call_post_disable(bridge, old_state);
27c34754f4710a Dave Stevenson  2022-12-05  668  
27c34754f4710a Dave Stevenson  2022-12-05  669  		if (limit)
27c34754f4710a Dave Stevenson  2022-12-05  670  			/* Jump all bridges that we have already post_disabled */
27c34754f4710a Dave Stevenson  2022-12-05  671  			bridge = limit;
27c34754f4710a Dave Stevenson  2022-12-05  672  	}
27c34754f4710a Dave Stevenson  2022-12-05  673  }
27c34754f4710a Dave Stevenson  2022-12-05  674  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
27c34754f4710a Dave Stevenson  2022-12-05  675  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
