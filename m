Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08651DDE3
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Jul 2023 21:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690838610; x=1722374610;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yRoyPKBci1HnVa7jmCSA+lPgdfVMP5Z4usWd4xolUw0=;
  b=aiUmXn7C908ltT9+0/xVSCAYZG+p9SbvwJBCNFhvcPNMLxMfiQPgi3D/
   7nVx521dVTkszpiqIsFJZUaZAPS/zU82Z1SdICw6biauZAcMY00nClQfz
   DgpNq1qZWKEj5oQ9shwc1FphialbfkT+/s/T7/novvp7Y4DzeV6fAa+wE
   Zyo04dFTQ6k8MQFbmxItfh5OeBGWnjKmo8tk5yhPkXAIV2j+PGyoDTScY
   nhv1gXGQaPOOxKPZQZf1fsZoArgcCsB+48CapLOFj5ukGyYpmc5c0qmTU
   sONiTK+9OgZ3O/8lWHhekWlxVuSJNgSiW8bSvsvSUEmCSr85os/X/bVPa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455504945"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="455504945"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 14:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871806928"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2023 14:23:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQaMS-0005NX-0B;
	Mon, 31 Jul 2023 21:23:28 +0000
Date: Tue, 1 Aug 2023 05:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202308010503.8XSvuAs8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/usb/cdc_ncm.c:166:15: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc4 next-20230731]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-i061-20230730 (https://download.01.org/0day-ci/archive/20230801/202308010503.8XSvuAs8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010503.8XSvuAs8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308010503.8XSvuAs8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/usb/cdc_ncm.c:166:15: sparse: sparse: bad integer constant expression
>> drivers/net/usb/cdc_ncm.c:166:15: sparse: sparse: static assertion failed: "clamp() low limit (u32)(min) greater than high limit (u32)(max)"
   drivers/net/usb/cdc_ncm.c:194:15: sparse: sparse: bad integer constant expression
   drivers/net/usb/cdc_ncm.c:194:15: sparse: sparse: static assertion failed: "clamp() low limit (u32)(min) greater than high limit (u32)(max)"
   drivers/net/usb/cdc_ncm.c:472:27: sparse: sparse: bad integer constant expression
>> drivers/net/usb/cdc_ncm.c:472:27: sparse: sparse: static assertion failed: "clamp() low limit (u16)(512) greater than high limit (u16)(ctx->tx_max)"
   drivers/net/usb/cdc_ncm.c:618:34: sparse: sparse: bad integer constant expression
>> drivers/net/usb/cdc_ncm.c:618:34: sparse: sparse: static assertion failed: "clamp() low limit (u32)(cdc_ncm_min_dgram_size(dev)) greater than high limit (u32)(8192)"
--
>> drivers/media/platform/xilinx/xilinx-dma.c:548:22: sparse: sparse: bad integer constant expression
>> drivers/media/platform/xilinx/xilinx-dma.c:548:22: sparse: sparse: static assertion failed: "clamp() low limit min_width greater than high limit max_width"
   drivers/media/platform/xilinx/xilinx-dma.c:560:29: sparse: sparse: bad integer constant expression
>> drivers/media/platform/xilinx/xilinx-dma.c:560:29: sparse: sparse: static assertion failed: "clamp() low limit min_bpl greater than high limit max_bpl"

vim +166 drivers/net/usb/cdc_ncm.c

6c4e548ff36672 Bjørn Mork 2014-05-16  149  
289507d3364f96 Bjørn Mork 2014-05-30  150  static u32 cdc_ncm_check_rx_max(struct usbnet *dev, u32 new_rx)
5aa73d5d72bddf Bjørn Mork 2014-05-16  151  {
5aa73d5d72bddf Bjørn Mork 2014-05-16  152  	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
5aa73d5d72bddf Bjørn Mork 2014-05-16  153  	u32 val, max, min;
5aa73d5d72bddf Bjørn Mork 2014-05-16  154  
5aa73d5d72bddf Bjørn Mork 2014-05-16  155  	/* clamp new_rx to sane values */
5aa73d5d72bddf Bjørn Mork 2014-05-16  156  	min = USB_CDC_NCM_NTB_MIN_IN_SIZE;
5aa73d5d72bddf Bjørn Mork 2014-05-16  157  	max = min_t(u32, CDC_NCM_NTB_MAX_SIZE_RX, le32_to_cpu(ctx->ncm_parm.dwNtbInMaxSize));
5aa73d5d72bddf Bjørn Mork 2014-05-16  158  
5aa73d5d72bddf Bjørn Mork 2014-05-16  159  	/* dwNtbInMaxSize spec violation? Use MIN size for both limits */
5aa73d5d72bddf Bjørn Mork 2014-05-16  160  	if (max < min) {
5aa73d5d72bddf Bjørn Mork 2014-05-16  161  		dev_warn(&dev->intf->dev, "dwNtbInMaxSize=%u is too small. Using %u\n",
5aa73d5d72bddf Bjørn Mork 2014-05-16  162  			 le32_to_cpu(ctx->ncm_parm.dwNtbInMaxSize), min);
5aa73d5d72bddf Bjørn Mork 2014-05-16  163  		max = min;
5aa73d5d72bddf Bjørn Mork 2014-05-16  164  	}
5aa73d5d72bddf Bjørn Mork 2014-05-16  165  
5aa73d5d72bddf Bjørn Mork 2014-05-16 @166  	val = clamp_t(u32, new_rx, min, max);
289507d3364f96 Bjørn Mork 2014-05-30  167  	if (val != new_rx)
289507d3364f96 Bjørn Mork 2014-05-30  168  		dev_dbg(&dev->intf->dev, "rx_max must be in the [%u, %u] range\n", min, max);
289507d3364f96 Bjørn Mork 2014-05-30  169  
289507d3364f96 Bjørn Mork 2014-05-30  170  	return val;
289507d3364f96 Bjørn Mork 2014-05-30  171  }
289507d3364f96 Bjørn Mork 2014-05-30  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
