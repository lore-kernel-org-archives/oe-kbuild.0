Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151F1851
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688836473; x=1720372473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cxZFck3FFi0FYebfdfBeRR3sU3APrl/eVHfdFgu26k=;
  b=gaiyv49Rkt5OJ9qosmi5lALBTfXTeGcvIpx2QatIVYCMq0lbOsI1C6Z6
   6/OuPpKleVDoMzkHVPrg9EKwVnL+/+W6BCYJhI5C5I/LZHTylgdOgh9Uk
   Rno7kyXBn1dB+XyDIClGYiIXw/BZfD+lXMfqq7Gjkw54IRN3BAdWXMGby
   TQELBf5OSw/JYNRbei+uGPU3AYZfqZB19oNdgfBiPZ9h8VNygFaUBS1ki
   sibgpzQ3JH7PYfwk9+xK/CGnoYB4YfeaIzQOgdbJqjhAyPQMEtRfiFjbt
   JRhlfsJl9f58he6cm9u4eHOGHW8y0w2KLwhEjRCQrYiDloXbbNYnLIA08
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="348883321"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="348883321"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 10:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="785672664"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="785672664"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2023 10:14:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIBVv-0002ou-02;
	Sat, 08 Jul 2023 17:14:31 +0000
Date: Sun, 9 Jul 2023 01:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sashal-stable:pending-6.1 203/372]
 drivers/gpu/drm/drm_bridge.c:766:37-41: ERROR: invalid reference to the
 index variable of the iterator on line 756
Message-ID: <202307090156.Q8tDQfOV-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   73a7788a3288bd71ad780326a7320681482a03be
commit: 3bcd91df87394559cf72a6c21eb473055aab1228 [203/372] drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: um-randconfig-r064-20230705 (https://download.01.org/0day-ci/archive/20230709/202307090156.Q8tDQfOV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090156.Q8tDQfOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307090156.Q8tDQfOV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_bridge.c:766:37-41: ERROR: invalid reference to the index variable of the iterator on line 756

vim +766 drivers/gpu/drm/drm_bridge.c

3bcd91df873945 Dave Stevenson  2022-12-05  712  
5ade071ba13e3b Sean Paul       2019-06-11  713  /**
ea099adfdf4bf3 Boris Brezillon 2019-12-03  714   * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
ea099adfdf4bf3 Boris Brezillon 2019-12-03  715   *					  in the encoder chain
5ade071ba13e3b Sean Paul       2019-06-11  716   * @bridge: bridge control structure
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  717   * @old_state: old atomic state
5ade071ba13e3b Sean Paul       2019-06-11  718   *
5ade071ba13e3b Sean Paul       2019-06-11  719   * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
5ade071ba13e3b Sean Paul       2019-06-11  720   * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
5ade071ba13e3b Sean Paul       2019-06-11  721   * starting from the first bridge to the last. These are called after completing
5ade071ba13e3b Sean Paul       2019-06-11  722   * &drm_encoder_helper_funcs.atomic_disable
5ade071ba13e3b Sean Paul       2019-06-11  723   *
3bcd91df873945 Dave Stevenson  2022-12-05  724   * If a bridge sets @pre_enable_prev_first, then the @post_disable for that
3bcd91df873945 Dave Stevenson  2022-12-05  725   * bridge will be called before the previous one to reverse the @pre_enable
3bcd91df873945 Dave Stevenson  2022-12-05  726   * calling direction.
3bcd91df873945 Dave Stevenson  2022-12-05  727   *
5ade071ba13e3b Sean Paul       2019-06-11  728   * Note: the bridge passed should be the one closest to the encoder
5ade071ba13e3b Sean Paul       2019-06-11  729   */
ea099adfdf4bf3 Boris Brezillon 2019-12-03  730  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  731  					  struct drm_atomic_state *old_state)
5ade071ba13e3b Sean Paul       2019-06-11  732  {
05193dc3819702 Boris Brezillon 2019-12-03  733  	struct drm_encoder *encoder;
3bcd91df873945 Dave Stevenson  2022-12-05  734  	struct drm_bridge *next, *limit;
05193dc3819702 Boris Brezillon 2019-12-03  735  
5ade071ba13e3b Sean Paul       2019-06-11  736  	if (!bridge)
5ade071ba13e3b Sean Paul       2019-06-11  737  		return;
5ade071ba13e3b Sean Paul       2019-06-11  738  
05193dc3819702 Boris Brezillon 2019-12-03  739  	encoder = bridge->encoder;
3bcd91df873945 Dave Stevenson  2022-12-05  740  
05193dc3819702 Boris Brezillon 2019-12-03  741  	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
3bcd91df873945 Dave Stevenson  2022-12-05  742  		limit = NULL;
3bcd91df873945 Dave Stevenson  2022-12-05  743  
3bcd91df873945 Dave Stevenson  2022-12-05  744  		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
3bcd91df873945 Dave Stevenson  2022-12-05  745  			next = list_next_entry(bridge, chain_node);
3bcd91df873945 Dave Stevenson  2022-12-05  746  
3bcd91df873945 Dave Stevenson  2022-12-05  747  			if (next->pre_enable_prev_first) {
3bcd91df873945 Dave Stevenson  2022-12-05  748  				/* next bridge had requested that prev
3bcd91df873945 Dave Stevenson  2022-12-05  749  				 * was enabled first, so disabled last
3bcd91df873945 Dave Stevenson  2022-12-05  750  				 */
3bcd91df873945 Dave Stevenson  2022-12-05  751  				limit = next;
3bcd91df873945 Dave Stevenson  2022-12-05  752  
3bcd91df873945 Dave Stevenson  2022-12-05  753  				/* Find the next bridge that has NOT requested
3bcd91df873945 Dave Stevenson  2022-12-05  754  				 * prev to be enabled first / disabled last
3bcd91df873945 Dave Stevenson  2022-12-05  755  				 */
3bcd91df873945 Dave Stevenson  2022-12-05 @756  				list_for_each_entry_from(next, &encoder->bridge_chain,
3bcd91df873945 Dave Stevenson  2022-12-05  757  							 chain_node) {
3bcd91df873945 Dave Stevenson  2022-12-05  758  					if (next->pre_enable_prev_first) {
3bcd91df873945 Dave Stevenson  2022-12-05  759  						next = list_prev_entry(next, chain_node);
3bcd91df873945 Dave Stevenson  2022-12-05  760  						limit = next;
3bcd91df873945 Dave Stevenson  2022-12-05  761  						break;
3bcd91df873945 Dave Stevenson  2022-12-05  762  					}
3bcd91df873945 Dave Stevenson  2022-12-05  763  				}
3bcd91df873945 Dave Stevenson  2022-12-05  764  
3bcd91df873945 Dave Stevenson  2022-12-05  765  				/* Call these bridges in reverse order */
3bcd91df873945 Dave Stevenson  2022-12-05 @766  				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
3bcd91df873945 Dave Stevenson  2022-12-05  767  								 chain_node) {
3bcd91df873945 Dave Stevenson  2022-12-05  768  					if (next == bridge)
3bcd91df873945 Dave Stevenson  2022-12-05  769  						break;
3bcd91df873945 Dave Stevenson  2022-12-05  770  
3bcd91df873945 Dave Stevenson  2022-12-05  771  					drm_atomic_bridge_call_post_disable(next,
3bcd91df873945 Dave Stevenson  2022-12-05  772  									    old_state);
3bcd91df873945 Dave Stevenson  2022-12-05  773  				}
3bcd91df873945 Dave Stevenson  2022-12-05  774  			}
3bcd91df873945 Dave Stevenson  2022-12-05  775  		}
3bcd91df873945 Dave Stevenson  2022-12-05  776  
3bcd91df873945 Dave Stevenson  2022-12-05  777  		drm_atomic_bridge_call_post_disable(bridge, old_state);
3bcd91df873945 Dave Stevenson  2022-12-05  778  
3bcd91df873945 Dave Stevenson  2022-12-05  779  		if (limit)
3bcd91df873945 Dave Stevenson  2022-12-05  780  			/* Jump all bridges that we have already post_disabled */
3bcd91df873945 Dave Stevenson  2022-12-05  781  			bridge = limit;
3bcd91df873945 Dave Stevenson  2022-12-05  782  	}
3bcd91df873945 Dave Stevenson  2022-12-05  783  }
3bcd91df873945 Dave Stevenson  2022-12-05  784  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
3bcd91df873945 Dave Stevenson  2022-12-05  785  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
