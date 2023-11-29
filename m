Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC261A714
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIYM7ymT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701253036; x=1732789036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=njIeB7TLP4TEnW6+xV/6so1+ItY4Lvw5ULNi49R2vVA=;
  b=SIYM7ymTJ7wZDhIEHqgimm1qGXfWD1SD0KDoITkm7VUYt8annmjVGAfW
   XF1XN04cKxGlMUxNQLP/L6t1Dm7+zogQ83hPVfNT2eaR4gcBhb68sFaK/
   4Pqb+U7NC+liAnEoBbnayANL1dFPTM/2IL0WbN6UyPNd1JJccEuQbh45F
   Fgqvy+sxfyL6aqYPjBnw6PvxUWwf5qCTW7cA8oDyuiptKPwbvZ6sIM7Hf
   LNj8dXSp0eZ2QMw7evstrDIapg+kHWhMV9l5qJMq8dSqrmuupNdcQII2h
   +9Yivo2yHOcF8A6LuILStBhst7YQSY++6WuwUe1sIWRxB/fI+GrfCl7Z4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6353705"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6353705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="745215655"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="745215655"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 02:17:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Hcn-00003U-1c;
	Wed, 29 Nov 2023 10:17:04 +0000
Date: Wed, 29 Nov 2023 18:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
Message-ID: <202311291447.R4I3Miat-lkp@intel.com>
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
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-20-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-20-c7602158306e@kernel.org>
TO: Maxime Ripard <mripard@kernel.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on sunxi/sunxi/for-next drm/drm-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Add-atomic-helpers/20231128-193409
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-20-c7602158306e%40kernel.org
patch subject: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-r071-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291447.R4I3Miat-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291447.R4I3Miat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311291447.R4I3Miat-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vc4/vc4_hdmi.c:729 vc4_hdmi_write_infoframe() error: uninitialized symbol 'ret'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/ret +729 drivers/gpu/drm/vc4/vc4_hdmi.c

cd00ed5187bff0 Maxime Ripard 2022-07-11  654  
05f440faa3b81a Maxime Ripard 2023-11-28  655  static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
05f440faa3b81a Maxime Ripard 2023-11-28  656  				    enum hdmi_infoframe_type type,
05f440faa3b81a Maxime Ripard 2023-11-28  657  				    const u8 *infoframe, size_t len)
21317b3fba5428 Eric Anholt   2016-09-29  658  {
05f440faa3b81a Maxime Ripard 2023-11-28  659  	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
05f440faa3b81a Maxime Ripard 2023-11-28  660  	struct drm_device *drm = connector->dev;
05f440faa3b81a Maxime Ripard 2023-11-28  661  	u32 packet_id = type - 0x80;
311e305fdb4e82 Maxime Ripard 2020-09-03  662  	const struct vc4_hdmi_register *ram_packet_start =
311e305fdb4e82 Maxime Ripard 2020-09-03  663  		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
311e305fdb4e82 Maxime Ripard 2020-09-03  664  	u32 packet_reg = ram_packet_start->offset + VC4_HDMI_PACKET_STRIDE * packet_id;
b6079d1578dc4b Dom Cobley    2022-06-13  665  	u32 packet_reg_next = ram_packet_start->offset +
b6079d1578dc4b Dom Cobley    2022-06-13  666  		VC4_HDMI_PACKET_STRIDE * (packet_id + 1);
311e305fdb4e82 Maxime Ripard 2020-09-03  667  	void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
311e305fdb4e82 Maxime Ripard 2020-09-03  668  						       ram_packet_start->reg);
b6079d1578dc4b Dom Cobley    2022-06-13  669  	uint8_t buffer[VC4_HDMI_PACKET_STRIDE] = {};
81fb55e500a82a Maxime Ripard 2021-10-25  670  	unsigned long flags;
05f440faa3b81a Maxime Ripard 2023-11-28  671  	ssize_t i;
21317b3fba5428 Eric Anholt   2016-09-29  672  	int ret;
cd00ed5187bff0 Maxime Ripard 2022-07-11  673  	int idx;
cd00ed5187bff0 Maxime Ripard 2022-07-11  674  
cd00ed5187bff0 Maxime Ripard 2022-07-11  675  	if (!drm_dev_enter(drm, &idx))
05f440faa3b81a Maxime Ripard 2023-11-28  676  		return 0;
05f440faa3b81a Maxime Ripard 2023-11-28  677  
05f440faa3b81a Maxime Ripard 2023-11-28  678  	if (len > sizeof(buffer))
05f440faa3b81a Maxime Ripard 2023-11-28  679  		goto out;
05f440faa3b81a Maxime Ripard 2023-11-28  680  
05f440faa3b81a Maxime Ripard 2023-11-28  681  	memcpy(buffer, infoframe, len);
21317b3fba5428 Eric Anholt   2016-09-29  682  
311e305fdb4e82 Maxime Ripard 2020-09-03  683  	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
21317b3fba5428 Eric Anholt   2016-09-29  684  		    VC4_HDMI_RAM_PACKET_ENABLE),
21317b3fba5428 Eric Anholt   2016-09-29  685  		  "Packet RAM has to be on to store the packet.");
21317b3fba5428 Eric Anholt   2016-09-29  686  
05f440faa3b81a Maxime Ripard 2023-11-28  687  	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
21317b3fba5428 Eric Anholt   2016-09-29  688  	if (ret) {
21317b3fba5428 Eric Anholt   2016-09-29  689  		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
cd00ed5187bff0 Maxime Ripard 2022-07-11  690  		goto out;
21317b3fba5428 Eric Anholt   2016-09-29  691  	}
21317b3fba5428 Eric Anholt   2016-09-29  692  
81fb55e500a82a Maxime Ripard 2021-10-25  693  	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  694  
21317b3fba5428 Eric Anholt   2016-09-29  695  	for (i = 0; i < len; i += 7) {
311e305fdb4e82 Maxime Ripard 2020-09-03  696  		writel(buffer[i + 0] << 0 |
21317b3fba5428 Eric Anholt   2016-09-29  697  		       buffer[i + 1] << 8 |
311e305fdb4e82 Maxime Ripard 2020-09-03  698  		       buffer[i + 2] << 16,
311e305fdb4e82 Maxime Ripard 2020-09-03  699  		       base + packet_reg);
21317b3fba5428 Eric Anholt   2016-09-29  700  		packet_reg += 4;
21317b3fba5428 Eric Anholt   2016-09-29  701  
311e305fdb4e82 Maxime Ripard 2020-09-03  702  		writel(buffer[i + 3] << 0 |
21317b3fba5428 Eric Anholt   2016-09-29  703  		       buffer[i + 4] << 8 |
21317b3fba5428 Eric Anholt   2016-09-29  704  		       buffer[i + 5] << 16 |
311e305fdb4e82 Maxime Ripard 2020-09-03  705  		       buffer[i + 6] << 24,
311e305fdb4e82 Maxime Ripard 2020-09-03  706  		       base + packet_reg);
21317b3fba5428 Eric Anholt   2016-09-29  707  		packet_reg += 4;
21317b3fba5428 Eric Anholt   2016-09-29  708  	}
21317b3fba5428 Eric Anholt   2016-09-29  709  
b6079d1578dc4b Dom Cobley    2022-06-13  710  	/*
b6079d1578dc4b Dom Cobley    2022-06-13  711  	 * clear remainder of packet ram as it's included in the
b6079d1578dc4b Dom Cobley    2022-06-13  712  	 * infoframe and triggers a checksum error on hdmi analyser
b6079d1578dc4b Dom Cobley    2022-06-13  713  	 */
b6079d1578dc4b Dom Cobley    2022-06-13  714  	for (; packet_reg < packet_reg_next; packet_reg += 4)
b6079d1578dc4b Dom Cobley    2022-06-13  715  		writel(0, base + packet_reg);
b6079d1578dc4b Dom Cobley    2022-06-13  716  
311e305fdb4e82 Maxime Ripard 2020-09-03  717  	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
311e305fdb4e82 Maxime Ripard 2020-09-03  718  		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) | BIT(packet_id));
81fb55e500a82a Maxime Ripard 2021-10-25  719  
81fb55e500a82a Maxime Ripard 2021-10-25  720  	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  721  
311e305fdb4e82 Maxime Ripard 2020-09-03  722  	ret = wait_for((HDMI_READ(HDMI_RAM_PACKET_STATUS) &
21317b3fba5428 Eric Anholt   2016-09-29  723  			BIT(packet_id)), 100);
21317b3fba5428 Eric Anholt   2016-09-29  724  	if (ret)
21317b3fba5428 Eric Anholt   2016-09-29  725  		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
cd00ed5187bff0 Maxime Ripard 2022-07-11  726  
cd00ed5187bff0 Maxime Ripard 2022-07-11  727  out:
cd00ed5187bff0 Maxime Ripard 2022-07-11  728  	drm_dev_exit(idx);
05f440faa3b81a Maxime Ripard 2023-11-28 @729  	return ret;
21317b3fba5428 Eric Anholt   2016-09-29  730  }
21317b3fba5428 Eric Anholt   2016-09-29  731  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
