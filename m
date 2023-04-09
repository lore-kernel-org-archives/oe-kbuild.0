Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD76619A
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uv2N5zDc4dPX/VEJAPzff5xe+2DXJkIqQFnRAgbhBCg=;
  b=kUlekT1t5WbEDdF0wRtCdRawV4eS8q7cxqnYYLp/T1e2TwuGNSn+Bqce
   PTNVzH/AGgHlo/HJCRsTRfxQFGMl96HyiSkqVaexoHgf92a6lahXXKnq/
   pSZpDtzHRXF8zNxy+XKcxNpWJu7+RBPB5eSPzp7IB7wTwVS6rrzQZSMIe
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,330,1673910000"; 
   d="scan'208";a="102190185"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 07:56:45 +0200
Date: Sun, 9 Apr 2023 07:56:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
cc: Guenter Roeck <groeck@google.com>
Subject: [chrome-os:chromeos-6.1 39/76] sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33:
 WARNING: Function "for_each_available_child_of_node" should have of_node_put()
 before return around line 51. (fwd)
Message-ID: <alpine.DEB.2.22.394.2304090756060.3028@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 9 Apr 2023 05:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 39/76]
    sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function
    "for_each_available_child_of_node" should have of_node_put() before return
    around line 51.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   ba182faf669dff6e8eaef91b0df486c9056c3fcd
commit: 0337be4af39a82189af689b7884f475d317ed65b [39/76] UPSTREAM: ASoC: mediatek: common: add soundcard driver common code
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-c033-20230409 (https://download.01.org/0day-ci/archive/20230409/202304090504.2K8L6soj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304090504.2K8L6soj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 51.
   sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 59.
   sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 63.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
