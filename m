Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB21C155
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 19:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687806027; x=1719342027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xw7id7VumSj1m4jiLWS7tDqoUwIqsAJWwJU4qCM+JI4=;
  b=oIlu/KjJkLk/0yV9FRR8vZRnodnbPGz74CSpXKoEsK3RPfbpn/fZDNVU
   YQNmRmZfSN4p0RX4kk/MnLeMZMQ51naZN4NLlUDvn5VESnxkGyJrvrA4U
   aronkLou9BrJ6+BomLuJPFjQ+YGJavzaSPKoKEmvfKTc11uU1c0EGgOpF
   taJ7e2vDGgEsUOymEpDdKlOFkYMCdqo87AH9DySeY7Ta2cx8vqW6zCWFq
   6mCkxwiCD13JcLeU8F77tb+OVFxq28vQbYjWYxE3dLcLgyFgPdqQW4iGr
   r78xkdAgg+07BHr3/iKsGWgQQSJhpj13sabnLL9oBSZ61JEywEScdXmdQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="358858254"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="358858254"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 12:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="829338004"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="829338004"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2023 12:00:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDrRi-000Atp-06;
	Mon, 26 Jun 2023 19:00:18 +0000
Date: Tue, 27 Jun 2023 02:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v1 8/8] drm/etnaviv: Add a helper to get a pointer to the
 first available node
Message-ID: <202306270248.XrbZD2BL-lkp@intel.com>
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
In-Reply-To: <20230623100822.274706-9-sui.jingfeng@linux.dev>
References: <20230623100822.274706-9-sui.jingfeng@linux.dev>
TO: Sui Jingfeng <sui.jingfeng@linux.dev>
TO: Lucas Stach <l.stach@pengutronix.de>
TO: Russell King <linux+etnaviv@armlinux.org.uk>
TO: Christian Gmeiner <christian.gmeiner@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
CC: etnaviv@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: loongson-kernel@lists.loongnix.cn
CC: Sui Jingfeng <suijingfeng@loongson.cn>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4 next-20230626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-etnaviv-Using-the-size_t-variable-to-store-the-number-of-pages/20230623-181944
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230623100822.274706-9-sui.jingfeng%40linux.dev
patch subject: [PATCH v1 8/8] drm/etnaviv: Add a helper to get a pointer to the first available node
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r053-20230625 (https://download.01.org/0day-ci/archive/20230627/202306270248.XrbZD2BL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270248.XrbZD2BL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306270248.XrbZD2BL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_drv.c:616:3-14: ERROR: probable double put.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
