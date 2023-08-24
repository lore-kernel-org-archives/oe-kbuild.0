Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F4134CC
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Aug 2023 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692899434; x=1724435434;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q8NV3jRWRPDWRyhkyKNsJNipF2wN67sX/DTQw+1EkhY=;
  b=gIiZqHaq3/FHHpQNxasaforpc75DRrh6ehEL8MnE2SnS9Wsw5vCjnqBd
   zD7vxDMFKvVHf8ZeeumX0aoktXhzPZGKDmE8Csz1eulKtLjUyXrIqqKvU
   dqf4aPYYxwGft03BQRVNkpW+5pShITiWDj3yeMKtLIyHa4dYlU8Cqa84V
   HOf8GHJHKJjD6aBWV9dRIiVlRpW88e05Hkq1t0wTnQ7kFS+stCwqOBLZ8
   6bBT1MUhS7QamOJuf0wEbYKfvDZL7vBoPcfW2TPjl/N1uFsn/7mYVCS08
   +ME6gwHgbS+xTtJZGHzGOWUW27CE+zPbkfXQsRKI8Gsl8VyaZD2aiLkTZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="378296585"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378296585"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 10:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860804313"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="860804313"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 10:50:31 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZETX-0002si-0a;
	Thu, 24 Aug 2023 17:50:31 +0000
Date: Fri, 25 Aug 2023 01:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:visionfive 49/56] checkpatch: WARNING: struct
 snd_soc_component_driver should normally be const
Message-ID: <202308250110.TZmgMBwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Walker Chen <walker.chen@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Michael Yan <michael.yan@starfivetech.com>
CC: Jenny Zhang <jenny.zhang@starfivetech.com>
INFO skip CC for checkpatch warnings

tree:   https://github.com/esmil/linux visionfive
head:   c44f4dcb3a1f8876ab931434b13a6db4f8e1ce39
commit: 3776c54b8370534f2a3913ef32ef4668c179a877 [49/56] ASoC: starfive: Add StarFive JH7100 audio drivers
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308250110.TZmgMBwy-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Missing commit description - Add an appropriate one

WARNING: please write a help paragraph that fully describes the config symbol
#61: sound/soc/starfive/Kconfig:17:
+config SND_STARFIVE_SPDIF
+	tristate "starfive spdif"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select REGMAP_MMIO
+	help
+	  Say Y or M if you want to add support for codecs attached to the
+	  I2S interface on VIC vic_starlight board. You will also need to select
+	  the drivers for the rest of VIC audio subsystem.
+

WARNING: please write a help paragraph that fully describes the config symbol
#71: sound/soc/starfive/Kconfig:27:
+config SND_STARFIVE_SPDIF_PCM
+	bool "PCM PIO extension for spdif driver"
+	depends on SND_STARFIVE_SPDIF
+	help
+	 Say Y or N if you want to add a custom ALSA extension that registers
+	 a PCM and uses PIO to transfer data.
+

WARNING: please write a help paragraph that fully describes the config symbol
#78: sound/soc/starfive/Kconfig:34:
+config SND_STARFIVE_PWMDAC
+	tristate "starfive pwmdac Device Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	 Say Y or M if you want to add support for sf pwmdac driver.
+

WARNING: please write a help paragraph that fully describes the config symbol
#85: sound/soc/starfive/Kconfig:41:
+config SND_STARFIVE_PWMDAC_PCM
+	bool "PCM PIO extension for pwmdac driver"
+	depends on SND_STARFIVE_PWMDAC
+	help
+	 Say Y or N if you want to add a custom ALSA extension that registers
+	 a PCM and uses PIO to transfer data.
+

WARNING: please write a help paragraph that fully describes the config symbol
#92: sound/soc/starfive/Kconfig:48:
+config SND_STARFIVE_PDM
+	tristate "starfive pdm Device Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	 Say Y or M if you want to add support for sf pdm driver.
+

WARNING: please write a help paragraph that fully describes the config symbol
#99: sound/soc/starfive/Kconfig:55:
+config SND_STARFIVE_I2SVAD
+	tristate "starfive I2SVAD Device Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	 Say Y or M if you want to add support for I2SVAD driver for
+	 starfive I2SVAD device.
+

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#145: 
new file mode 100644

WARNING: space prohibited between function name and open parenthesis '('
#170: sound/soc/starfive/i2svad-pcm.c:21:
+	const u##sample_bits (*p)[2] = (void *)runtime->dma_area; \

WARNING: space prohibited between function name and open parenthesis '('
#190: sound/soc/starfive/i2svad-pcm.c:41:
+	u##sample_bits (*p)[2] = (void *)runtime->dma_area; \

ERROR: space required after that ',' (ctx:VxV)
#453: sound/soc/starfive/i2svad.c:49:
+	u32 sp_value,sp_en;
 	            ^

ERROR: space required after that ',' (ctx:VxV)
#454: sound/soc/starfive/i2svad.c:50:
+	u32 sl_value,sl_en;
 	            ^

ERROR: space required after that ',' (ctx:VxO)
#456: sound/soc/starfive/i2svad.c:52:
+	regmap_read(vad->vad_map, VAD_SPINT,&sp_value);
 	                                   ^

ERROR: space required before that '&' (ctx:OxV)
#456: sound/soc/starfive/i2svad.c:52:
+	regmap_read(vad->vad_map, VAD_SPINT,&sp_value);
 	                                    ^

ERROR: space required after that ',' (ctx:VxO)
#457: sound/soc/starfive/i2svad.c:53:
+	regmap_read(vad->vad_map, VAD_SPINT_EN,&sp_en);
 	                                      ^

ERROR: space required before that '&' (ctx:OxV)
#457: sound/soc/starfive/i2svad.c:53:
+	regmap_read(vad->vad_map, VAD_SPINT_EN,&sp_en);
 	                                       ^

ERROR: space required before the open brace '{'
#458: sound/soc/starfive/i2svad.c:54:
+	if (sp_value&sp_en){

ERROR: space required after that ',' (ctx:VxO)
#466: sound/soc/starfive/i2svad.c:62:
+	regmap_read(vad->vad_map, VAD_SLINT,&sl_value);
 	                                   ^

ERROR: space required before that '&' (ctx:OxV)
#466: sound/soc/starfive/i2svad.c:62:
+	regmap_read(vad->vad_map, VAD_SLINT,&sl_value);
 	                                    ^

ERROR: space required after that ',' (ctx:VxO)
#467: sound/soc/starfive/i2svad.c:63:
+	regmap_read(vad->vad_map, VAD_SLINT_EN,&sl_en);
 	                                      ^

ERROR: space required before that '&' (ctx:OxV)
#467: sound/soc/starfive/i2svad.c:63:
+	regmap_read(vad->vad_map, VAD_SLINT_EN,&sl_en);
 	                                       ^

ERROR: space required before the open brace '{'
#468: sound/soc/starfive/i2svad.c:64:
+	if (sl_value&sl_en){

ERROR: space required after that ',' (ctx:VxV)
#475: sound/soc/starfive/i2svad.c:71:
+static int vad_trigger(struct vad_params *vad,int cmd)
                                              ^

ERROR: that open brace { should be on the previous line
#483: sound/soc/starfive/i2svad.c:79:
+		if(vad->vswitch)
+		{

ERROR: space required before the open parenthesis '('
#483: sound/soc/starfive/i2svad.c:79:
+		if(vad->vswitch)

ERROR: that open brace { should be on the previous line
#975: sound/soc/starfive/i2svad.c:571:
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	{

ERROR: space required after that ',' (ctx:VxV)
#977: sound/soc/starfive/i2svad.c:573:
+		vad_trigger(&(dev->vad),cmd);
 		                       ^

WARNING: DT compatible string "starfive,sf-i2svad" appears un-documented -- check ./Documentation/devicetree/bindings/
#1420: sound/soc/starfive/i2svad.c:1016:
+	{ .compatible = "starfive,sf-i2svad", },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#1445: sound/soc/starfive/i2svad.c:1041:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/i2svad.h', please use '/*' instead
#1453: sound/soc/starfive/i2svad.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1453: sound/soc/starfive/i2svad.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: line length of 106 exceeds 100 columns
#1508: sound/soc/starfive/i2svad.h:56:
+#define VAD_N_LOW_CONT_FRAMES			0x808  /* low-energy transition range threshold ——NL*/

WARNING: line length of 107 exceeds 100 columns
#1510: sound/soc/starfive/i2svad.h:58:
+#define VAD_N_HIGH_CONT_FRAMES			0x810  /* high-energy transition range threshold——NH */

WARNING: line length of 101 exceeds 100 columns
#1512: sound/soc/starfive/i2svad.h:60:
+#define VAD_N_SPEECH_LOW_HIGH_FRAMES		0x818  /* low-energy voice range threshold——NVL*/

WARNING: line length of 110 exceeds 100 columns
#1515: sound/soc/starfive/i2svad.h:63:
+#define VAD_N_ALPHA				0x824  /* low-energy threshold scaling factor,12bit(0~0xFFF)*/

WARNING: line length of 111 exceeds 100 columns
#1516: sound/soc/starfive/i2svad.h:64:
+#define VAD_N_BETA				0x828  /* high-energy threshold scaling factor,12bit(0~0xFFF)*/

WARNING: line length of 102 exceeds 100 columns
#1518: sound/soc/starfive/i2svad.h:66:
+#define VAD_LR_SEL				0x840  /* L/R channel data selection for processing */

WARNING: line length of 102 exceeds 100 columns
#1523: sound/soc/starfive/i2svad.h:71:
+#define VAD_ADDR_START				0x854  /* vad memory start address, align with 64bit*/

WARNING: line length of 155 exceeds 100 columns
#1524: sound/soc/starfive/i2svad.h:72:
+#define VAD_ADDR_WRAP				0x858  /* vad memory highest address for Push, align with 64bit,(addr_wrap-1) is the max physical address*/

WARNING: 'interrup' may be misspelled - perhaps 'interrupt'?
#1526: sound/soc/starfive/i2svad.h:74:
+#define VAD_SPINT_CLR				0x860  /* clear vad_spint interrup status*/
                      				                          ^^^^^^^^

WARNING: line length of 110 exceeds 100 columns
#1527: sound/soc/starfive/i2svad.h:75:
+#define VAD_SPINT_EN				0x864  /* disable/enable vad_spint from vad_flag rising edge*/

WARNING: 'interrup' may be misspelled - perhaps 'interrupt'?
#1528: sound/soc/starfive/i2svad.h:76:
+#define VAD_SLINT_CLR				0x868  /* clear vad_slint interrup status*/
                      				                          ^^^^^^^^

WARNING: line length of 112 exceeds 100 columns
#1529: sound/soc/starfive/i2svad.h:77:
+#define VAD_SLINT_EN				0x86C  /* disable/enable  vad_slint from vad_flag falling edge*/

WARNING: please, no space before tabs
#1722: sound/soc/starfive/pdm.c:18:
+#define AUDIOC_CLK ^I(12288000)$

WARNING: please, no space before tabs
#1723: sound/soc/starfive/pdm.c:19:
+#define PDM_MUL ^I(128)$

ERROR: space required after that ',' (ctx:VxV)
#1746: sound/soc/starfive/pdm.c:42:
+	int mclk_div,bclk_div,lrclk_div;
 	            ^

ERROR: space required after that ',' (ctx:VxV)
#1746: sound/soc/starfive/pdm.c:42:
+	int mclk_div,bclk_div,lrclk_div;
 	                     ^

WARNING: Block comments use * on subsequent lines
#1750: sound/soc/starfive/pdm.c:46:
+	/*
+	audio source clk:4, mclk:3M

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1782: sound/soc/starfive/pdm.c:78:
+		printk(KERN_ERR "sample rate:%d\n", clk);

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1792: sound/soc/starfive/pdm.c:88:
+		printk(KERN_ERR "bit weight:%d\n", weight);

WARNING: Comparisons should place the constant on the right side of the test
#1796: sound/soc/starfive/pdm.c:92:
+	if (24 == weight) {

WARNING: braces {} are not necessary for single statement blocks
#1796: sound/soc/starfive/pdm.c:92:
+	if (24 == weight) {
+		weight = 32;
+	}

WARNING: please, no space before tabs
#1962: sound/soc/starfive/pdm.c:258:
+^I^I.rates^I^I= ^ISF_PCM_RATE,$

WARNING: please, no space before tabs
#1963: sound/soc/starfive/pdm.c:259:
+^I^I.formats^I= ^ISNDRV_PCM_FMTBIT_S16_LE|\$

WARNING: Avoid unnecessary line continuations
#1963: sound/soc/starfive/pdm.c:259:
+		.formats	= 	SNDRV_PCM_FMTBIT_S16_LE|\

WARNING: DT compatible string "starfive,sf-pdm" appears un-documented -- check ./Documentation/devicetree/bindings/
#2048: sound/soc/starfive/pdm.c:344:
+	{.compatible = "starfive,sf-pdm",},

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#2066: sound/soc/starfive/pdm.c:362:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/pdm.h', please use '/*' instead
#2073: sound/soc/starfive/pdm.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#2073: sound/soc/starfive/pdm.h:1:
+// SPDX-License-Identifier: GPL-2.0

ERROR: space required after that ',' (ctx:VxV)
#2147: sound/soc/starfive/pwmdac-pcm.c:26:
+		iowrite32(basedat,dev->pwmdac_base + PWMDAC_WDATA);
 		                 ^

ERROR: space required after that ',' (ctx:VxV)
#2170: sound/soc/starfive/pwmdac-pcm.c:49:
+		iowrite32(basedat,dev->pwmdac_base + PWMDAC_WDATA);
 		                 ^

WARNING: struct snd_soc_component_driver should normally be const
#2391: sound/soc/starfive/pwmdac-transmitter.c:31:
+static struct snd_soc_component_driver soc_codec_pwmdac_dit = {

WARNING: please, no space before tabs
#2403: sound/soc/starfive/pwmdac-transmitter.c:43:
+^I.playback ^I= {$

WARNING: DT compatible string "linux,pwmdac-dit" appears un-documented -- check ./Documentation/devicetree/bindings/
#2422: sound/soc/starfive/pwmdac-transmitter.c:62:
+	{ .compatible = "linux,pwmdac-dit", },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#2440: sound/soc/starfive/pwmdac-transmitter.c:80:
+MODULE_LICENSE("GPL v2");

WARNING: 'unsinged' may be misspelled - perhaps 'unsigned'?
#2486: sound/soc/starfive/pwmdac.c:39:
+	{ .name = "unsinged", .vals = UNSINGED_DATA },
 	           ^^^^^^^^

WARNING: braces {} are not necessary for single statement blocks
#2513: sound/soc/starfive/pwmdac.c:66:
+	if (uinfo->value.enumerated.item >= items) {
+		uinfo->value.enumerated.item = items - 1;
+	}

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2516: sound/soc/starfive/pwmdac.c:69:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2571: sound/soc/starfive/pwmdac.c:124:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Block comments use * on subsequent lines
#2603: sound/soc/starfive/pwmdac.c:156:
+/*
+static int pwmdac_datan_info(struct snd_kcontrol *kcontrol,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2651: sound/soc/starfive/pwmdac.c:204:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2692: sound/soc/starfive/pwmdac.c:245:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2734: sound/soc/starfive/pwmdac.c:287:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Block comments should align the * on each line
#2777: sound/soc/starfive/pwmdac.c:330:
+ * 32bit-4byte
+*/

WARNING: Missing a blank line after declarations
#2781: sound/soc/starfive/pwmdac.c:334:
+	u32 date;
+	date = pwmdc_read_reg(dev->pwmdac_base, PWMDAC_CTRL);

ERROR: space prohibited before that close parenthesis ')'
#2782: sound/soc/starfive/pwmdac.c:335:
+	pwmdc_write_reg(dev->pwmdac_base, PWMDAC_CTRL, date | BIT(0) );

WARNING: Block comments should align the * on each line
#2787: sound/soc/starfive/pwmdac.c:340:
+ * 32bit-4byte
+*/

WARNING: Missing a blank line after declarations
#2791: sound/soc/starfive/pwmdac.c:344:
+	u32 date;
+	date = pwmdc_read_reg(dev->pwmdac_base, PWMDAC_CTRL);

ERROR: space prohibited after that '~' (ctx:WxW)
#2792: sound/soc/starfive/pwmdac.c:345:
+	pwmdc_write_reg(dev->pwmdac_base, PWMDAC_CTRL, date & ~ BIT(0));
 	                                                      ^

WARNING: Block comments should align the * on each line
#2798: sound/soc/starfive/pwmdac.c:351:
+ * 10:10-bit
+*/

ERROR: space prohibited before that ',' (ctx:WxW)
#2805: sound/soc/starfive/pwmdac.c:358:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: space required before the open brace '{'
#2807: sound/soc/starfive/pwmdac.c:360:
+	else if(data == 10){

ERROR: space required before the open parenthesis '('
#2807: sound/soc/starfive/pwmdac.c:360:
+	else if(data == 10){

ERROR: else should follow close brace '}'
#2807: sound/soc/starfive/pwmdac.c:360:
+	}
+	else if(data == 10){

ERROR: space prohibited before that ',' (ctx:WxW)
#2809: sound/soc/starfive/pwmdac.c:362:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

WARNING: Block comments should align the * on each line
#2817: sound/soc/starfive/pwmdac.c:370:
+ * 10:center
+*/

ERROR: space prohibited before that ',' (ctx:WxW)
#2822: sound/soc/starfive/pwmdac.c:375:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2825: sound/soc/starfive/pwmdac.c:378:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: else should follow close brace '}'
#2827: sound/soc/starfive/pwmdac.c:380:
+	}
+	else if (data == 1) { //right

ERROR: space prohibited before that ',' (ctx:WxW)
#2829: sound/soc/starfive/pwmdac.c:382:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: else should follow close brace '}'
#2831: sound/soc/starfive/pwmdac.c:384:
+	}
+	else if (data == 2) { //center

ERROR: space prohibited before that ',' (ctx:WxW)
#2833: sound/soc/starfive/pwmdac.c:386:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2842: sound/soc/starfive/pwmdac.c:395:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2843: sound/soc/starfive/pwmdac.c:396:
+	pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, (value & 0xF) | ((data - 1) << 4));
 	                                 ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2851: sound/soc/starfive/pwmdac.c:404:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2867: sound/soc/starfive/pwmdac.c:420:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

WARNING: braces {} are not necessary for any arm of this statement
#2868: sound/soc/starfive/pwmdac.c:421:
+	if (data == UNSINGED_DATA) {
[...]
+	else if (data == INVERTER_DATA_MSB) {
[...]

ERROR: else should follow close brace '}'
#2871: sound/soc/starfive/pwmdac.c:424:
+	}
+	else if (data == INVERTER_DATA_MSB) {

ERROR: space required after that ',' (ctx:VxV)
#2874: sound/soc/starfive/pwmdac.c:427:
+	pwmdc_write_reg(dev->pwmdac_base,PWMDAC_CTRL, value);
 	                                ^

ERROR: space required after that ',' (ctx:VxV)
#2877: sound/soc/starfive/pwmdac.c:430:
+static int pwmdac_data_shift(struct sf_pwmdac_dev *dev,u8 data)
                                                       ^

WARNING: braces {} are not necessary for single statement blocks
#2881: sound/soc/starfive/pwmdac.c:434:
+	if ((data < PWMDAC_DATA_LEFT_SHIFT_BIT_0) || (data > PWMDAC_DATA_LEFT_SHIFT_BIT_7)) {
+		return -1;
+	}

ERROR: space prohibited before that ',' (ctx:WxW)
#2885: sound/soc/starfive/pwmdac.c:438:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited after that '~' (ctx:WxW)
#2886: sound/soc/starfive/pwmdac.c:439:
+	value &= ( ~ ( PWMDAC_DATA_LEFT_SHIFT_BIT_ALL << 15 ) );
 	           ^

ERROR: space prohibited after that open parenthesis '('
#2886: sound/soc/starfive/pwmdac.c:439:
+	value &= ( ~ ( PWMDAC_DATA_LEFT_SHIFT_BIT_ALL << 15 ) );

ERROR: space prohibited before that close parenthesis ')'
#2886: sound/soc/starfive/pwmdac.c:439:
+	value &= ( ~ ( PWMDAC_DATA_LEFT_SHIFT_BIT_ALL << 15 ) );

ERROR: space prohibited before that ',' (ctx:WxW)
#2888: sound/soc/starfive/pwmdac.c:441:
+	pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 	                                 ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2896: sound/soc/starfive/pwmdac.c:449:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_SATAE);
 	                                        ^

WARNING: braces {} are not necessary for single statement blocks
#2914: sound/soc/starfive/pwmdac.c:467:
+	if (dev->shift) {
+		pwmdac_data_shift(dev, dev->shift);
+	}

WARNING: line length of 104 exceeds 100 columns
#2967: sound/soc/starfive/pwmdac.c:520:
+	if ((dev->mode == shift_8Bit_unsigned_dataShift) || (dev->mode == shift_8Bit_inverter_dataShift)

WARNING: line length of 116 exceeds 100 columns
#2968: sound/soc/starfive/pwmdac.c:521:
+		|| (dev->mode == shift_10Bit_unsigned_dataShift) || (dev->mode == shift_10Bit_inverter_dataShift)) {

ERROR: spaces required around that '==' (ctx:VxV)
#2993: sound/soc/starfive/pwmdac.c:546:
+		if (get_pwmdac_fifo_state(pwmdac_dev)==0) {
 		                                     ^

WARNING: braces {} are not necessary for single statement blocks
#2993: sound/soc/starfive/pwmdac.c:546:
+		if (get_pwmdac_fifo_state(pwmdac_dev)==0) {
+			sf_pwmdac_pcm_push_tx(pwmdac_dev);
+		}

WARNING: braces {} are not necessary for single statement blocks
#3018: sound/soc/starfive/pwmdac.c:571:
+			if (IS_ERR(dev->tx_thread)) {
+				return PTR_ERR(dev->tx_thread);
+			}

ERROR: space required before the open parenthesis '('
#3032: sound/soc/starfive/pwmdac.c:585:
+			if(dev->tx_thread) {

WARNING: braces {} are not necessary for single statement blocks
#3032: sound/soc/starfive/pwmdac.c:585:
+			if(dev->tx_thread) {
+				dev->tx_thread_exit = 1;
+			}

WARNING: line length of 103 exceeds 100 columns
#3146: sound/soc/starfive/pwmdac.c:699:
+		return dev_err_probe(&pdev->dev, ret, "failed to set 4096kHz rate for clk_dac_mclk\n");

ERROR: code indent should use tabs where possible
#3248: sound/soc/starfive/pwmdac.c:801:
+        }$

WARNING: please, no spaces at the start of a line
#3248: sound/soc/starfive/pwmdac.c:801:
+        }$

WARNING: DT compatible string "starfive,pwmdac" appears un-documented -- check ./Documentation/devicetree/bindings/
#3287: sound/soc/starfive/pwmdac.c:840:
+	{ .compatible = "starfive,pwmdac",	 },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#3307: sound/soc/starfive/pwmdac.c:860:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/pwmdac.h', please use '/*' instead
#3316: sound/soc/starfive/pwmdac.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#3316: sound/soc/starfive/pwmdac.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: missing space after enum definition
#3345: sound/soc/starfive/pwmdac.h:30:
+enum pwmdac_lr_change{

WARNING: missing space after enum definition
#3350: sound/soc/starfive/pwmdac.h:35:
+enum pwmdac_d_mode{

WARNING: missing space after enum definition
#3355: sound/soc/starfive/pwmdac.h:40:
+enum pwmdac_shift_bit{

WARNING: missing space after enum definition
#3360: sound/soc/starfive/pwmdac.h:45:
+enum pwmdac_duty_cycle{

WARNING: missing space after enum definition
#3367: sound/soc/starfive/pwmdac.h:52:
+enum pwmdac_sample_count{

WARNING: missing space after enum definition
#3393: sound/soc/starfive/pwmdac.h:78:
+enum data_shift{

WARNING: missing space after enum definition
#3405: sound/soc/starfive/pwmdac.h:90:
+enum pwmdac_config_list{

WARNING: Comparisons should place the constant on the right side of the test
#3509: sound/soc/starfive/spdif-pcm.c:27:
+		if (SNDRV_PCM_FORMAT_S16_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3514: sound/soc/starfive/spdif-pcm.c:32:
+		} else if (SNDRV_PCM_FORMAT_S24_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3517: sound/soc/starfive/spdif-pcm.c:35:
+		} else if (SNDRV_PCM_FORMAT_S32_LE == format) {

WARNING: braces {} are not necessary for single statement blocks
#3527: sound/soc/starfive/spdif-pcm.c:45:
+		if (++tx_ptr >= runtime->buffer_size) {
+			tx_ptr = 0;
+		}

WARNING: Comparisons should place the constant on the right side of the test
#3549: sound/soc/starfive/spdif-pcm.c:67:
+		if (SNDRV_PCM_FORMAT_S16_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3552: sound/soc/starfive/spdif-pcm.c:70:
+		} else if (SNDRV_PCM_FORMAT_S24_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3555: sound/soc/starfive/spdif-pcm.c:73:
+		} else if (SNDRV_PCM_FORMAT_S32_LE == format) {

WARNING: braces {} are not necessary for any arm of this statement
#3734: sound/soc/starfive/spdif-pcm.c:252:
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
[...]
+	else {
[...]

ERROR: else should follow close brace '}'
#3737: sound/soc/starfive/spdif-pcm.c:255:
+	}
+	else {

WARNING: braces {} are not necessary for single statement blocks
#3823: sound/soc/starfive/spdif.c:47:
+	if (stat & SPDIF_PARITY_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3827: sound/soc/starfive/spdif.c:51:
+	if (stat & SPDIF_UNDERR_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3831: sound/soc/starfive/spdif.c:55:
+	if (stat & SPDIF_OVRERR_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3835: sound/soc/starfive/spdif.c:59:
+	if (stat & SPDIF_SYNCERR_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3839: sound/soc/starfive/spdif.c:63:
+	if (stat & SPDIF_LOCK_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3843: sound/soc/starfive/spdif.c:67:
+	if (stat & SPDIF_BEGIN_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3847: sound/soc/starfive/spdif.c:71:
+	if (stat & SPDIF_RIGHT_LEFT) {
+		irq_valid = true;
+	}

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#3905: sound/soc/starfive/spdif.c:129:
+		printk(KERN_ERR "%s L.%d cmd:%d\n", __func__, __LINE__, cmd);

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#3950: sound/soc/starfive/spdif.c:174:
+		printk(KERN_ERR "channel:%d\n", channels, rate);

WARNING: braces {} are not necessary for single statement blocks
#3957: sound/soc/starfive/spdif.c:181:
+	if (rate < 3) {
+		return -EINVAL;
+	}

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#3971: sound/soc/starfive/spdif.c:195:
+	#if 0

WARNING: Avoid unnecessary line continuations
#4054: sound/soc/starfive/spdif.c:278:
+		.formats = SNDRV_PCM_FMTBIT_S16_LE \

WARNING: Avoid unnecessary line continuations
#4063: sound/soc/starfive/spdif.c:287:
+		.formats = SNDRV_PCM_FMTBIT_S16_LE \

WARNING: DT compatible string "starfive,sf-spdif" appears un-documented -- check ./Documentation/devicetree/bindings/
#4144: sound/soc/starfive/spdif.c:368:
+	{ .compatible = "starfive,sf-spdif", },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#4160: sound/soc/starfive/spdif.c:384:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/spdif.h', please use '/*' instead
#4167: sound/soc/starfive/spdif.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#4167: sound/soc/starfive/spdif.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: 'defualt' may be misspelled - perhaps 'default'?
#4192: sound/soc/starfive/spdif.h:26:
+#define SPDIF_SFR_ENABLE	(1<<8)	///0:SFR reg reset to defualt value; auto set back to '1' after reset
                         	      	                      ^^^^^^^

WARNING: line length of 109 exceeds 100 columns
#4192: sound/soc/starfive/spdif.h:26:
+#define SPDIF_SFR_ENABLE	(1<<8)	///0:SFR reg reset to defualt value; auto set back to '1' after reset

WARNING: line length of 113 exceeds 100 columns
#4193: sound/soc/starfive/spdif.h:27:
+#define SPDIF_ENABLE		(1<<9)	///0:enables SPDIF module

WARNING: line length of 137 exceeds 100 columns
#4194: sound/soc/starfive/spdif.h:28:
+#define SPDIF_FIFO_ENABLE	(1<<10)	///0:FIFO pointers are reset to zero,threshold levels for FIFO are unchaned; auto set back to '1'

WARNING: line length of 118 exceeds 100 columns
#4195: sound/soc/starfive/spdif.h:29:
+#define SPDIF_CLK_ENABLE	(1<<11)	///1:block feeds the modules

WARNING: line length of 125 exceeds 100 columns
#4197: sound/soc/starfive/spdif.h:31:
+#define SPDIF_PARITCHECK	(1<<13)	///0:check on a parity error

WARNING: line length of 169 exceeds 100 columns
#4198: sound/soc/starfive/spdif.h:32:
+#define SPDIF_PARITYGEN		(1<<14)	///0:parity bit generated inside the core and added to a transmitted sub-frame

WARNING: line length of 136 exceeds 100 columns
#4199: sound/soc/starfive/spdif.h:33:
+#define SPDIF_VALIDITYCHECK	(1<<15)	///0:validity bit rx is checked

WARNING: line length of 118 exceeds 100 columns
#4201: sound/soc/starfive/spdif.h:35:
+#define SPDIF_DUPLICATE		(1<<17)	///only tx -single-channel mode; 0: left(primary) channel

WARNING: line length of 155 exceeds 100 columns
#4202: sound/soc/starfive/spdif.h:36:
+#define SPDIF_SETPREAMBB	(1<<18)	///only tx; 0:first preamble B is tx after preambleddel(INT_REG)

WARNING: line length of 119 exceeds 100 columns
#4203: sound/soc/starfive/spdif.h:37:
+#define SPDIF_USE_FIFO_IF	(1<<19)	///0:FIFO enable, APB access to FIFO disable;

WARNING: line length of 113 exceeds 100 columns
#4217: sound/soc/starfive/spdif.h:51:
+#define SPDIF_MASK_ENABLE	(SPDIF_PARITY_MASK | SPDIF_UNDERR_MASK | SPDIF_OVRERR_MASK | SPDIF_EMPTY_MASK |	\

WARNING: line length of 137 exceeds 100 columns
#4218: sound/soc/starfive/spdif.h:52:
+							 SPDIF_AEMPTY_MASK | SPDIF_FULL_MASK | SPDIF_AFULL_MASK | SPDIF_SYNCERR_MASK |	\

WARNING: line length of 113 exceeds 100 columns
#4219: sound/soc/starfive/spdif.h:53:
+							 SPDIF_LOCK_MASK | SPDIF_BEGIN_MASK | SPDIF_INTEREQ_MAKS)

WARNING: line length of 107 exceeds 100 columns
#4221: sound/soc/starfive/spdif.h:55:
+#define SPDIF_MASK_FIFO		(SPDIF_EMPTY_MASK | SPDIF_AEMPTY_MASK | SPDIF_FULL_MASK | SPDIF_AFULL_MASK)

WARNING: line length of 113 exceeds 100 columns
#4237: sound/soc/starfive/spdif.h:71:
+#define SPDIF_INT_REG_BIT	(SPDIF_PARITYO | SPDIF_TDATA_UNDERR | SPDIF_RDATA_OVRERR | SPDIF_FIFO_EMPTY |	\

WARNING: line length of 137 exceeds 100 columns
#4238: sound/soc/starfive/spdif.h:72:
+							 SPDIF_FIOF_AEMPTY | SPDIF_FIFO_FULL | SPDIF_FIFO_AFULL | SPDIF_SYNCERR | 	\

WARNING: please, no space before tabs
#4238: sound/soc/starfive/spdif.h:72:
+^I^I^I^I^I^I^I SPDIF_FIOF_AEMPTY | SPDIF_FIFO_FULL | SPDIF_FIFO_AFULL | SPDIF_SYNCERR | ^I\$

WARNING: line length of 107 exceeds 100 columns
#4242: sound/soc/starfive/spdif.h:76:
+#define SPDIF_FIFO_INT_STATUS	(SPDIF_FIFO_EMPTY | SPDIF_FIOF_AEMPTY | SPDIF_FIFO_FULL | SPDIF_FIFO_AFULL)

WARNING: 'reciever' may be misspelled - perhaps 'receiver'?
#4252: sound/soc/starfive/spdif.h:86:
+#define SPDIF_INT_LOCK		5	// reciever has become synchronized with input data stream
                       		 	   ^^^^^^^^

WARNING: 'recieve' may be misspelled - perhaps 'receive'?
#4253: sound/soc/starfive/spdif.h:87:
+#define SPDIF_INT_BLOCK_BEGIN	6	// start a new block in recieve data, written into FIFO
                              	 	                        ^^^^^^^

WARNING: line length of 126 exceeds 100 columns
#4271: sound/soc/starfive/spdif.h:105:
+#define SPDIF_RIGHT_LEFT	(1<<31)	// 1:right channel received and tx into FIFO

WARNING: line length of 121 exceeds 100 columns
#4273: sound/soc/starfive/spdif.h:107:
+#define SPDIF_STAT		(SPDIF_PARITY_FLAG | SPDIF_UNDERR_FLAG | SPDIF_OVRERR_FLAG | SPDIF_EMPTY_FLAG |		\

WARNING: line length of 137 exceeds 100 columns
#4274: sound/soc/starfive/spdif.h:108:
+						 SPDIF_AEMPTY_FLAG | SPDIF_FULL_FLAG | SPDIF_AFULL_FLAG | SPDIF_SYNCERR_FLAG | 		\

WARNING: please, no space before tabs
#4274: sound/soc/starfive/spdif.h:108:
+^I^I^I^I^I^I SPDIF_AEMPTY_FLAG | SPDIF_FULL_FLAG | SPDIF_AFULL_FLAG | SPDIF_SYNCERR_FLAG | ^I^I\$

WARNING: line length of 103 exceeds 100 columns
#4275: sound/soc/starfive/spdif.h:109:
+						 SPDIF_LOCK_FLAG | SPDIF_BEGIN_FLAG | SPDIF_RIGHT_LEFT)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
