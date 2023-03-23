Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8792BA54
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 17:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679593959; x=1711129959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZRJIi3j1rNpkqoddfpD53L/72UH5uIuVE7zDKmzZMIA=;
  b=c3LMuITN63lfngo5qtLp7mSlFBgBoT3OO4Il77jw9+qQnhxKKpngBDZ/
   gPLdttIZyr1Cm9Zu+7sOnYbfXqCygNU4qOAyxOmJltfKrjBj8CV5H+zEV
   sNWKCdd5IIuxgkXFapLoYZO0zoS2LQCHOUglAU3yoJrmZf2DdA7Tot1Wg
   Pphem96+R/fCgzUftmvy7MqyoCz5JOZTOB6F4Iiecr66IIK+dc+yr/i+S
   Ul/zGfpZ6q6ZUkTJrLNJzc9QCODb4O2sL9Ezs4W7LfuaEOf0nhmJYZzTe
   +UUHfW6pIhw74XLmRFqzuLvj1gNvaLGh8Oq/GPVLDZ4ETIfRMHYsBlvOO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402154254"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402154254"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806354466"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="806354466"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 10:52:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfP77-000Eaq-0e;
	Thu, 23 Mar 2023 17:52:37 +0000
Date: Fri, 24 Mar 2023 01:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Message-ID: <202303240148.lKRnUqW9-lkp@intel.com>
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
In-Reply-To: <20230321102855.346732-3-benjamin.gaignard@collabora.com>
References: <20230321102855.346732-3-benjamin.gaignard@collabora.com>
TO: Benjamin Gaignard <benjamin.gaignard@collabora.com>
TO: tfiga@chromium.org
TO: m.szyprowski@samsung.com
TO: mchehab@kernel.org
TO: ming.qian@nxp.com
TO: shijie.qin@nxp.com
TO: eagle.zhou@nxp.com
TO: bin.liu@mediatek.com
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: tiffany.lin@mediatek.com
TO: andrew-ct.chen@mediatek.com
TO: yunfei.dong@mediatek.com
TO: stanimir.k.varbanov@gmail.com
TO: quic_vgarodia@quicinc.com
TO: agross@kernel.org
TO: andersson@kernel.org
TO: konrad.dybcio@linaro.org
TO: ezequiel@vanguardiasur.com.ar
TO: p.zabel@pengutronix.de
TO: daniel.almeida@collabora.com
TO: hverkuil-cisco@xs4all.nl
TO: laurent.pinchart@ideasonboard.com
TO: jernel@kernel.org
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: kernel@collabora.com

Hi Benjamin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3-rc3 next-20230323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230321102855.346732-3-benjamin.gaignard%40collabora.com
patch subject: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic allocated
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-m041-20230319 (https://download.01.org/0day-ci/archive/20230324/202303240148.lKRnUqW9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240148.lKRnUqW9-lkp@intel.com/

smatch warnings:
include/media/videobuf2-core.h:1272 vb2_queue_add_buffer() warn: sleeping in atomic context
drivers/media/common/videobuf2/videobuf2-core.c:2456 vb2_core_queue_init() warn: Please consider using kcalloc instead of kmalloc_array

vim +1272 include/media/videobuf2-core.h

3dd8c097541794 Ezequiel Garcia   2019-06-10  1257  
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1258  /**
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1259   * vb2_queue_add_buffer() - add a buffer to a queue
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1260   * @q:	pointer to &struct vb2_queue with videobuf2 queue.
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1261   * @vb:	pointer to &struct vb2_buffer to be added to the queue.
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1262   */
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1263  static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1264  {
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1265  	bool ret = false;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1266  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1267  	spin_lock(&q->bufs_lock);
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1268  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1269  	if (vb->index >= q->max_num_bufs) {
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1270  		struct vb2_buffer **tmp;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1271  
487d3f14d12ecf Benjamin Gaignard 2023-03-21 @1272  		tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1273  		if (!tmp)
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1274  			goto realloc_failed;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1275  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1276  		q->max_num_bufs *= 2;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1277  		q->bufs = tmp;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1278  	}
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1279  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1280  	if (vb->index < q->max_num_bufs) {
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1281  		q->bufs[vb->index] = vb;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1282  		ret = true;
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1283  	}
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1284  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1285  realloc_failed:
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1286  	spin_unlock(&q->bufs_lock);
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1287  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1288  	return ret;
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1289  }
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
