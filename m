Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577F5673
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhJUEQmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705169596; x=1736705596;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CNpT004NW5s/haV8y3r0JBIpbaVvDig69P5f5Eyiwm0=;
  b=QhJUEQmVXo6hnz6q/9iu8J3XNMd0VWbCEceFEwLvUkvEGF8qRGN7dxJ6
   F0MMDVPhRZC3yxHWmt/T5xxOstvtRXSf30cxJD6ekrKuEo+638PQSJpPI
   ULjPwrcfbXi7ckC/ICN1QU0JpUdSje1ZlffX9dfKyu3rFgI/hFL+axQkE
   A4PCDLC2HRDqfK3ssa9rzK3pIz6/Kt4eB3J0J3+h16NaMmZt66cAQJ3j7
   phQQdNWWw1oSHUppAG0BFarQF64pU6ODvzTQYhsXbKr+fYFTTZoXJx9sB
   xbfkewkE1rpShV9AWUJ4RaCs1631W6L9ZNHfYV3TICRjIs9B/+qJU+SxQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="389844443"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="389844443"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 10:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1030239625"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="1030239625"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2024 10:13:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOiVL-000Amf-1H;
	Sat, 13 Jan 2024 18:13:11 +0000
Date: Sun, 14 Jan 2024 02:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-5.10 19/41]
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c:8900:9-11: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202401140227.EDAjt8bg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   d792f1069f29dea2bc8a6a8a18267084a94095e2
commit: 69dd7c7f496ef8bc5b6d3d8bbc5c336a1982e563 [19/41] UPSTREAM: wifi: rt2x00: add RXIQ calibration for MT7620
:::::: branch date: 26 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-103-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140227.EDAjt8bg-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401140227.EDAjt8bg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ralink/rt2x00/rt2800lib.c:8900:9-11: WARNING: possible condition with no effect (if == else)

vim +8900 drivers/net/wireless/ralink/rt2x00/rt2800lib.c

69dd7c7f496ef8 Tomislav Požega 2022-09-17  8692  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8693  static void rt2800_rxiq_calibration(struct rt2x00_dev *rt2x00dev)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8694  {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8695  	u8 rfb0r1, rfb0r2, rfb0r42;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8696  	u8 rfb4r0, rfb4r19;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8697  	u8 rfb5r3, rfb5r4, rfb5r17, rfb5r18, rfb5r19, rfb5r20;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8698  	u8 rfb6r0, rfb6r19;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8699  	u8 rfb7r3, rfb7r4, rfb7r17, rfb7r18, rfb7r19, rfb7r20;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8700  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8701  	u8 bbp1, bbp4;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8702  	u8 bbpr241, bbpr242;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8703  	u32 i;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8704  	u8 ch_idx;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8705  	u8 bbpval;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8706  	u8 rfval, vga_idx = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8707  	int mi = 0, mq = 0, si = 0, sq = 0, riq = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8708  	int sigma_i, sigma_q, r_iq, g_rx;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8709  	int g_imb;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8710  	int ph_rx;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8711  	u32 savemacsysctrl = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8712  	u32 orig_RF_CONTROL0 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8713  	u32 orig_RF_BYPASS0 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8714  	u32 orig_RF_CONTROL1 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8715  	u32 orig_RF_BYPASS1 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8716  	u32 orig_RF_CONTROL3 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8717  	u32 orig_RF_BYPASS3 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8718  	u32 bbpval1 = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8719  	static const u8 rf_vga_table[] = {0x20, 0x21, 0x22, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f};
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8720  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8721  	savemacsysctrl = rt2800_register_read(rt2x00dev, MAC_SYS_CTRL);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8722  	orig_RF_CONTROL0 = rt2800_register_read(rt2x00dev, RF_CONTROL0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8723  	orig_RF_BYPASS0 = rt2800_register_read(rt2x00dev, RF_BYPASS0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8724  	orig_RF_CONTROL1 = rt2800_register_read(rt2x00dev, RF_CONTROL1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8725  	orig_RF_BYPASS1 = rt2800_register_read(rt2x00dev, RF_BYPASS1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8726  	orig_RF_CONTROL3 = rt2800_register_read(rt2x00dev, RF_CONTROL3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8727  	orig_RF_BYPASS3 = rt2800_register_read(rt2x00dev, RF_BYPASS3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8728  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8729  	bbp1 = rt2800_bbp_read(rt2x00dev, 1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8730  	bbp4 = rt2800_bbp_read(rt2x00dev, 4);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8731  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8732  	rt2800_register_write(rt2x00dev, MAC_SYS_CTRL, 0x0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8733  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8734  	if (unlikely(rt2800_wait_bbp_rf_ready(rt2x00dev, MAC_STATUS_CFG_BBP_RF_BUSY)))
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8735  		rt2x00_warn(rt2x00dev, "Timeout waiting for MAC status in RXIQ calibration\n");
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8736  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8737  	bbpval = bbp4 & (~0x18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8738  	bbpval = bbp4 | 0x00;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8739  	rt2800_bbp_write(rt2x00dev, 4, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8740  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8741  	bbpval = rt2800_bbp_read(rt2x00dev, 21);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8742  	bbpval = bbpval | 1;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8743  	rt2800_bbp_write(rt2x00dev, 21, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8744  	bbpval = bbpval & 0xfe;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8745  	rt2800_bbp_write(rt2x00dev, 21, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8746  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8747  	rt2800_register_write(rt2x00dev, RF_CONTROL1, 0x00000202);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8748  	rt2800_register_write(rt2x00dev, RF_BYPASS1, 0x00000303);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8749  	if (test_bit(CAPABILITY_EXTERNAL_PA_TX0, &rt2x00dev->cap_flags))
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8750  		rt2800_register_write(rt2x00dev, RF_CONTROL3, 0x0101);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8751  	else
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8752  		rt2800_register_write(rt2x00dev, RF_CONTROL3, 0x0000);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8753  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8754  	rt2800_register_write(rt2x00dev, RF_BYPASS3, 0xf1f1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8755  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8756  	rfb0r1 = rt2800_rfcsr_read_bank(rt2x00dev, 0, 1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8757  	rfb0r2 = rt2800_rfcsr_read_bank(rt2x00dev, 0, 2);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8758  	rfb0r42 = rt2800_rfcsr_read_bank(rt2x00dev, 0, 42);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8759  	rfb4r0 = rt2800_rfcsr_read_bank(rt2x00dev, 4, 0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8760  	rfb4r19 = rt2800_rfcsr_read_bank(rt2x00dev, 4, 19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8761  	rfb5r3 = rt2800_rfcsr_read_bank(rt2x00dev, 5, 3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8762  	rfb5r4 = rt2800_rfcsr_read_bank(rt2x00dev, 5, 4);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8763  	rfb5r17 = rt2800_rfcsr_read_bank(rt2x00dev, 5, 17);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8764  	rfb5r18 = rt2800_rfcsr_read_bank(rt2x00dev, 5, 18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8765  	rfb5r19 = rt2800_rfcsr_read_bank(rt2x00dev, 5, 19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8766  	rfb5r20 = rt2800_rfcsr_read_bank(rt2x00dev, 5, 20);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8767  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8768  	rfb6r0 = rt2800_rfcsr_read_bank(rt2x00dev, 6, 0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8769  	rfb6r19 = rt2800_rfcsr_read_bank(rt2x00dev, 6, 19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8770  	rfb7r3 = rt2800_rfcsr_read_bank(rt2x00dev, 7, 3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8771  	rfb7r4 = rt2800_rfcsr_read_bank(rt2x00dev, 7, 4);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8772  	rfb7r17 = rt2800_rfcsr_read_bank(rt2x00dev, 7, 17);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8773  	rfb7r18 = rt2800_rfcsr_read_bank(rt2x00dev, 7, 18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8774  	rfb7r19 = rt2800_rfcsr_read_bank(rt2x00dev, 7, 19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8775  	rfb7r20 = rt2800_rfcsr_read_bank(rt2x00dev, 7, 20);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8776  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8777  	rt2800_rfcsr_write_chanreg(rt2x00dev, 0, 0x87);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8778  	rt2800_rfcsr_write_chanreg(rt2x00dev, 19, 0x27);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8779  	rt2800_rfcsr_write_dccal(rt2x00dev, 3, 0x38);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8780  	rt2800_rfcsr_write_dccal(rt2x00dev, 4, 0x38);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8781  	rt2800_rfcsr_write_dccal(rt2x00dev, 17, 0x80);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8782  	rt2800_rfcsr_write_dccal(rt2x00dev, 18, 0xC1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8783  	rt2800_rfcsr_write_dccal(rt2x00dev, 19, 0x60);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8784  	rt2800_rfcsr_write_dccal(rt2x00dev, 20, 0x00);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8785  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8786  	rt2800_bbp_write(rt2x00dev, 23, 0x0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8787  	rt2800_bbp_write(rt2x00dev, 24, 0x0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8788  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8789  	rt2800_bbp_dcoc_write(rt2x00dev, 5, 0x0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8790  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8791  	bbpr241 = rt2800_bbp_read(rt2x00dev, 241);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8792  	bbpr242 = rt2800_bbp_read(rt2x00dev, 242);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8793  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8794  	rt2800_bbp_write(rt2x00dev, 241, 0x10);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8795  	rt2800_bbp_write(rt2x00dev, 242, 0x84);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8796  	rt2800_bbp_write(rt2x00dev, 244, 0x31);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8797  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8798  	bbpval = rt2800_bbp_dcoc_read(rt2x00dev, 3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8799  	bbpval = bbpval & (~0x7);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8800  	rt2800_bbp_dcoc_write(rt2x00dev, 3, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8801  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8802  	rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00000004);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8803  	udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8804  	rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00000006);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8805  	usleep_range(1, 200);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8806  	rt2800_register_write(rt2x00dev, RF_BYPASS0, 0x00003376);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8807  	rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00001006);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8808  	udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8809  	if (test_bit(CAPABILITY_EXTERNAL_PA_TX0, &rt2x00dev->cap_flags)) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8810  		rt2800_bbp_write(rt2x00dev, 23, 0x06);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8811  		rt2800_bbp_write(rt2x00dev, 24, 0x06);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8812  	} else {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8813  		rt2800_bbp_write(rt2x00dev, 23, 0x02);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8814  		rt2800_bbp_write(rt2x00dev, 24, 0x02);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8815  	}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8816  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8817  	for (ch_idx = 0; ch_idx < 2; ch_idx = ch_idx + 1) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8818  		if (ch_idx == 0) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8819  			rfval = rfb0r1 & (~0x3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8820  			rfval = rfb0r1 | 0x1;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8821  			rt2800_rfcsr_write_bank(rt2x00dev, 0, 1, rfval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8822  			rfval = rfb0r2 & (~0x33);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8823  			rfval = rfb0r2 | 0x11;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8824  			rt2800_rfcsr_write_bank(rt2x00dev, 0, 2, rfval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8825  			rfval = rfb0r42 & (~0x50);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8826  			rfval = rfb0r42 | 0x10;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8827  			rt2800_rfcsr_write_bank(rt2x00dev, 0, 42, rfval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8828  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8829  			rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00001006);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8830  			udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8831  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8832  			bbpval = bbp1 & (~0x18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8833  			bbpval = bbpval | 0x00;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8834  			rt2800_bbp_write(rt2x00dev, 1, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8835  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8836  			rt2800_bbp_dcoc_write(rt2x00dev, 1, 0x00);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8837  		} else {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8838  			rfval = rfb0r1 & (~0x3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8839  			rfval = rfb0r1 | 0x2;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8840  			rt2800_rfcsr_write_bank(rt2x00dev, 0, 1, rfval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8841  			rfval = rfb0r2 & (~0x33);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8842  			rfval = rfb0r2 | 0x22;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8843  			rt2800_rfcsr_write_bank(rt2x00dev, 0, 2, rfval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8844  			rfval = rfb0r42 & (~0x50);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8845  			rfval = rfb0r42 | 0x40;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8846  			rt2800_rfcsr_write_bank(rt2x00dev, 0, 42, rfval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8847  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8848  			rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00002006);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8849  			udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8850  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8851  			bbpval = bbp1 & (~0x18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8852  			bbpval = bbpval | 0x08;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8853  			rt2800_bbp_write(rt2x00dev, 1, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8854  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8855  			rt2800_bbp_dcoc_write(rt2x00dev, 1, 0x01);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8856  		}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8857  		usleep_range(500, 1500);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8858  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8859  		vga_idx = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8860  		while (vga_idx < 11) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8861  			rt2800_rfcsr_write_dccal(rt2x00dev, 3, rf_vga_table[vga_idx]);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8862  			rt2800_rfcsr_write_dccal(rt2x00dev, 4, rf_vga_table[vga_idx]);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8863  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8864  			rt2800_bbp_dcoc_write(rt2x00dev, 0, 0x93);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8865  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8866  			for (i = 0; i < 10000; i++) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8867  				bbpval = rt2800_bbp_read(rt2x00dev, 159);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8868  				if ((bbpval & 0xff) == 0x93)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8869  					usleep_range(50, 100);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8870  				else
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8871  					break;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8872  				}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8873  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8874  			if ((bbpval & 0xff) == 0x93) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8875  				rt2x00_warn(rt2x00dev, "Fatal Error: Calibration doesn't finish");
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8876  				goto restore_value;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8877  			}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8878  			for (i = 0; i < 5; i++) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8879  				u32 bbptemp = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8880  				u8 value = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8881  				int result = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8882  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8883  				rt2800_bbp_write(rt2x00dev, 158, 0x1e);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8884  				rt2800_bbp_write(rt2x00dev, 159, i);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8885  				rt2800_bbp_write(rt2x00dev, 158, 0x22);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8886  				value = rt2800_bbp_read(rt2x00dev, 159);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8887  				bbptemp = bbptemp + (value << 24);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8888  				rt2800_bbp_write(rt2x00dev, 158, 0x21);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8889  				value = rt2800_bbp_read(rt2x00dev, 159);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8890  				bbptemp = bbptemp + (value << 16);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8891  				rt2800_bbp_write(rt2x00dev, 158, 0x20);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8892  				value = rt2800_bbp_read(rt2x00dev, 159);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8893  				bbptemp = bbptemp + (value << 8);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8894  				rt2800_bbp_write(rt2x00dev, 158, 0x1f);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8895  				value = rt2800_bbp_read(rt2x00dev, 159);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8896  				bbptemp = bbptemp + value;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8897  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8898  				if (i < 2 && (bbptemp & 0x800000))
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8899  					result = (bbptemp & 0xffffff) - 0x1000000;
69dd7c7f496ef8 Tomislav Požega 2022-09-17 @8900  				else if (i == 4)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8901  					result = bbptemp;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8902  				else
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8903  					result = bbptemp;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8904  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8905  				if (i == 0)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8906  					mi = result / 4096;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8907  				else if (i == 1)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8908  					mq = result / 4096;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8909  				else if (i == 2)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8910  					si = bbptemp / 4096;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8911  				else if (i == 3)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8912  					sq = bbptemp / 4096;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8913  				else
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8914  					riq = result / 4096;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8915  			}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8916  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8917  			bbpval1 = si - mi * mi;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8918  			rt2x00_dbg(rt2x00dev,
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8919  				   "RXIQ si=%d, sq=%d, riq=%d, bbpval %d, vga_idx %d",
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8920  				   si, sq, riq, bbpval1, vga_idx);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8921  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8922  			if (bbpval1 >= (100 * 100))
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8923  				break;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8924  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8925  			if (bbpval1 <= 100)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8926  				vga_idx = vga_idx + 9;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8927  			else if (bbpval1 <= 158)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8928  				vga_idx = vga_idx + 8;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8929  			else if (bbpval1 <= 251)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8930  				vga_idx = vga_idx + 7;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8931  			else if (bbpval1 <= 398)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8932  				vga_idx = vga_idx + 6;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8933  			else if (bbpval1 <= 630)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8934  				vga_idx = vga_idx + 5;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8935  			else if (bbpval1 <= 1000)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8936  				vga_idx = vga_idx + 4;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8937  			else if (bbpval1 <= 1584)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8938  				vga_idx = vga_idx + 3;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8939  			else if (bbpval1 <= 2511)
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8940  				vga_idx = vga_idx + 2;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8941  			else
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8942  				vga_idx = vga_idx + 1;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8943  		}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8944  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8945  		sigma_i = rt2800_do_sqrt_accumulation(100 * (si - mi * mi));
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8946  		sigma_q = rt2800_do_sqrt_accumulation(100 * (sq - mq * mq));
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8947  		r_iq = 10 * (riq - (mi * mq));
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8948  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8949  		rt2x00_dbg(rt2x00dev, "Sigma_i=%d, Sigma_q=%d, R_iq=%d", sigma_i, sigma_q, r_iq);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8950  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8951  		if (sigma_i <= 1400 && sigma_i >= 1000 &&
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8952  		    (sigma_i - sigma_q) <= 112 &&
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8953  		    (sigma_i - sigma_q) >= -112 &&
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8954  		    mi <= 32 && mi >= -32 &&
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8955  		    mq <= 32 && mq >= -32) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8956  			r_iq = 10 * (riq - (mi * mq));
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8957  			rt2x00_dbg(rt2x00dev, "RXIQ Sigma_i=%d, Sigma_q=%d, R_iq=%d\n",
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8958  				   sigma_i, sigma_q, r_iq);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8959  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8960  			g_rx = (1000 * sigma_q) / sigma_i;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8961  			g_imb = ((-2) * 128 * (1000 - g_rx)) / (1000 + g_rx);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8962  			ph_rx = (r_iq * 2292) / (sigma_i * sigma_q);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8963  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8964  			if (ph_rx > 20 || ph_rx < -20) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8965  				ph_rx = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8966  				rt2x00_warn(rt2x00dev, "RXIQ calibration FAIL");
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8967  			}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8968  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8969  			if (g_imb > 12 || g_imb < -12) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8970  				g_imb = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8971  				rt2x00_warn(rt2x00dev, "RXIQ calibration FAIL");
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8972  			}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8973  		} else {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8974  			g_imb = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8975  			ph_rx = 0;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8976  			rt2x00_dbg(rt2x00dev, "RXIQ Sigma_i=%d, Sigma_q=%d, R_iq=%d\n",
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8977  				   sigma_i, sigma_q, r_iq);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8978  			rt2x00_warn(rt2x00dev, "RXIQ calibration FAIL");
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8979  		}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8980  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8981  		if (ch_idx == 0) {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8982  			rt2800_bbp_write(rt2x00dev, 158, 0x37);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8983  			rt2800_bbp_write(rt2x00dev, 159, g_imb & 0x3f);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8984  			rt2800_bbp_write(rt2x00dev, 158, 0x35);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8985  			rt2800_bbp_write(rt2x00dev, 159, ph_rx & 0x3f);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8986  		} else {
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8987  			rt2800_bbp_write(rt2x00dev, 158, 0x55);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8988  			rt2800_bbp_write(rt2x00dev, 159, g_imb & 0x3f);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8989  			rt2800_bbp_write(rt2x00dev, 158, 0x53);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8990  			rt2800_bbp_write(rt2x00dev, 159, ph_rx & 0x3f);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8991  		}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8992  	}
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8993  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8994  restore_value:
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8995  	rt2800_bbp_write(rt2x00dev, 158, 0x3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8996  	bbpval = rt2800_bbp_read(rt2x00dev, 159);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8997  	rt2800_bbp_write(rt2x00dev, 159, (bbpval | 0x07));
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8998  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  8999  	rt2800_bbp_write(rt2x00dev, 158, 0x00);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9000  	rt2800_bbp_write(rt2x00dev, 159, 0x00);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9001  	rt2800_bbp_write(rt2x00dev, 1, bbp1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9002  	rt2800_bbp_write(rt2x00dev, 4, bbp4);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9003  	rt2800_bbp_write(rt2x00dev, 241, bbpr241);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9004  	rt2800_bbp_write(rt2x00dev, 242, bbpr242);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9005  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9006  	rt2800_bbp_write(rt2x00dev, 244, 0x00);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9007  	bbpval = rt2800_bbp_read(rt2x00dev, 21);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9008  	bbpval |= 0x1;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9009  	rt2800_bbp_write(rt2x00dev, 21, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9010  	usleep_range(10, 200);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9011  	bbpval &= 0xfe;
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9012  	rt2800_bbp_write(rt2x00dev, 21, bbpval);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9013  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9014  	rt2800_rfcsr_write_bank(rt2x00dev, 0, 1, rfb0r1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9015  	rt2800_rfcsr_write_bank(rt2x00dev, 0, 2, rfb0r2);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9016  	rt2800_rfcsr_write_bank(rt2x00dev, 0, 42, rfb0r42);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9017  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9018  	rt2800_rfcsr_write_bank(rt2x00dev, 4, 0, rfb4r0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9019  	rt2800_rfcsr_write_bank(rt2x00dev, 4, 19, rfb4r19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9020  	rt2800_rfcsr_write_bank(rt2x00dev, 5, 3, rfb5r3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9021  	rt2800_rfcsr_write_bank(rt2x00dev, 5, 4, rfb5r4);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9022  	rt2800_rfcsr_write_bank(rt2x00dev, 5, 17, rfb5r17);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9023  	rt2800_rfcsr_write_bank(rt2x00dev, 5, 18, rfb5r18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9024  	rt2800_rfcsr_write_bank(rt2x00dev, 5, 19, rfb5r19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9025  	rt2800_rfcsr_write_bank(rt2x00dev, 5, 20, rfb5r20);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9026  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9027  	rt2800_rfcsr_write_bank(rt2x00dev, 6, 0, rfb6r0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9028  	rt2800_rfcsr_write_bank(rt2x00dev, 6, 19, rfb6r19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9029  	rt2800_rfcsr_write_bank(rt2x00dev, 7, 3, rfb7r3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9030  	rt2800_rfcsr_write_bank(rt2x00dev, 7, 4, rfb7r4);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9031  	rt2800_rfcsr_write_bank(rt2x00dev, 7, 17, rfb7r17);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9032  	rt2800_rfcsr_write_bank(rt2x00dev, 7, 18, rfb7r18);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9033  	rt2800_rfcsr_write_bank(rt2x00dev, 7, 19, rfb7r19);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9034  	rt2800_rfcsr_write_bank(rt2x00dev, 7, 20, rfb7r20);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9035  
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9036  	rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00000006);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9037  	udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9038  	rt2800_register_write(rt2x00dev, RF_CONTROL0, 0x00000004);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9039  	udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9040  	rt2800_register_write(rt2x00dev, RF_CONTROL0, orig_RF_CONTROL0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9041  	udelay(1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9042  	rt2800_register_write(rt2x00dev, RF_BYPASS0, orig_RF_BYPASS0);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9043  	rt2800_register_write(rt2x00dev, RF_CONTROL1, orig_RF_CONTROL1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9044  	rt2800_register_write(rt2x00dev, RF_BYPASS1, orig_RF_BYPASS1);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9045  	rt2800_register_write(rt2x00dev, RF_CONTROL3, orig_RF_CONTROL3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9046  	rt2800_register_write(rt2x00dev, RF_BYPASS3, orig_RF_BYPASS3);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9047  	rt2800_register_write(rt2x00dev, MAC_SYS_CTRL, savemacsysctrl);
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9048  }
69dd7c7f496ef8 Tomislav Požega 2022-09-17  9049  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
