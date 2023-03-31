Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455F15A8
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 02:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680228100; x=1711764100;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=InzHYiCKEI/F+/1gzfx9/6JmjXJ12W2yFhG0FOgSKlQ=;
  b=WFYGvhv8zjCVmkMmj/pitQ3QGk0v+4n7bsgAwNyLsemCg9vmSipE8UiT
   elrrYUWRU38DkLEi/xD7nxV5tt/U2xON/EAVPCoPuMYRzBoQ5buX2HC4p
   uS+NDhK51hOKVPaCUH1VInRsLRYsQ9fHGcYdkDrIQjeF4AwRd9JKhdYeu
   9hKNWhFBEUvCn5hthEwD4UJqAcZ0Rf9kU0ZhRHVo+hWuBdpr0Objc7l3z
   xjU7nDx9GbSYSWdynY8pZ8YWU4+QT+BR5Caz0LoUqYVgHboysLv2QO1z5
   l3GPKk2JV221QF577qmJasrJcxKPIznHz6nJjMSAz5MaxaoWr22ybg2NX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338831073"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="338831073"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 19:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="684922542"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="684922542"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Mar 2023 19:01:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi44t-000LPT-0t;
	Fri, 31 Mar 2023 02:01:19 +0000
Date: Fri, 31 Mar 2023 10:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/base/regmap/regmap-spi-avmm.c:324:9: warning: use of NULL
 'pb_eop' where non-null expected [CWE-476]
Message-ID: <202303310938.qKUBoxg9-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/base/regmap/regmap-spi-avmm.c:324:9: warning: use of NULL 'pb_eop' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Lee Jones <lee@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Russ Weight <russell.h.weight@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>

Hi Ilpo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62bad54b26db8bc98e28749cd76b2d890edb4258
commit: 603aed8ffd4c9cb633c05a514cfb5e8ca6b0751d mfd: intel-m10-bmc: Split into core and spi specific parts
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20230330 (https://download.01.org/0day-ci/archive/20230331/202303310938.qKUBoxg9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=603aed8ffd4c9cb633c05a514cfb5e8ca6b0751d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 603aed8ffd4c9cb633c05a514cfb5e8ca6b0751d
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303310938.qKUBoxg9-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/base/regmap/regmap-spi-avmm.c: In function 'br_pkt_phy_tx_prepare':
>> drivers/base/regmap/regmap-spi-avmm.c:324:9: warning: use of NULL 'pb_eop' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     324 |         memmove(&br->phy_buf[aligned_phy_len - move_size], pb_eop, move_size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'regmap_spi_avmm_read': events 1-6
       |
       |  602 | static int regmap_spi_avmm_read(void *context,
       |      |            ^~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'regmap_spi_avmm_read'
       |......
       |  606 |         if (reg_len != SPI_AVMM_REG_SIZE)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'reg_len == 4')...
       |......
       |  609 |         if (!IS_ALIGNED(val_len, SPI_AVMM_VAL_SIZE))
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (4) following 'false' branch...
       |      |         (3) ...to here
       |......
       |  612 |         return do_reg_access(context, true, *(u32 *)reg_buf, val_buf,
       |      |         ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |      |
       |      |         |      (6) calling 'do_reg_access' from 'regmap_spi_avmm_read'
       |      |         (5) ...to here
       |  613 |                              (val_len / SPI_AVMM_VAL_SIZE));
       |      |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'do_reg_access': events 7-8
              |
              |  546 | static int do_reg_access(void *context, bool is_read, unsigned int reg,
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'do_reg_access'
              |......
              |  556 |         ret = br_trans_tx_prepare(br, is_read, reg, value, count);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (8) calling 'br_trans_tx_prepare' from 'do_reg_access'
              |
              +--> 'br_trans_tx_prepare': events 9-13
                     |
                     |  178 | static int br_trans_tx_prepare(struct spi_avmm_bridge *br, bool is_read, u32 reg,
                     |      |            ^~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'br_trans_tx_prepare'
                     |......
                     |  187 |         if (is_read) {
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch (when 'is_read != 0')...
                     |  188 |                 if (count == 1)
                     |      |                 ~~
                     |      |                 |
                     |      |                 (11) ...to here
                     |......
                     |  207 |         if (!is_read) {
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'true' branch (when 'is_read != 0')...
                     |......
                     |  219 |         br->trans_len = trans_len;
                     |      |         ~~  
                     |      |         |
                     |      |         (13) ...to here
                     |
              <------+
              |
            'do_reg_access': events 14-17
              |
              |  556 |         ret = br_trans_tx_prepare(br, is_read, reg, value, count);
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (14) returning to 'do_reg_access' from 'br_trans_tx_prepare'
              |  557 |         if (ret)
              |      |            ~   
              |      |            |
              |      |            (15) following 'false' branch (when 'ret == 0')...
              |......
              |  560 |         ret = br_pkt_phy_tx_prepare(br);
              |      |         ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |     |
              |      |         |     (17) calling 'br_pkt_phy_tx_prepare' from 'do_reg_access'
              |      |         (16) ...to here
              |
              +--> 'br_pkt_phy_tx_prepare': events 18-27
                     |
                     |  247 | static int br_pkt_phy_tx_prepare(struct spi_avmm_bridge *br)
                     |      |            ^~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (18) entry to 'br_pkt_phy_tx_prepare'
                     |......
                     |  305 |         if (tb < tb_end)
                     |      |            ~
                     |      |            |
                     |      |            (19) following 'false' branch (when 'tb >= tb_end')...
                     |......
                     |  309 |         br->phy_len = pb - br->phy_buf;
                     |      |         ~~  
                     |      |         |

vim +/pb_eop +324 drivers/base/regmap/regmap-spi-avmm.c

7f9fb67358a2bc Xu Yilun 2020-08-19  223  
7f9fb67358a2bc Xu Yilun 2020-08-19  224  /*
7f9fb67358a2bc Xu Yilun 2020-08-19  225   * Convert transaction layer data (in br->trans_buf) to phy layer data, store
7f9fb67358a2bc Xu Yilun 2020-08-19  226   * them in br->phy_buf. Pad the phy_buf aligned with SPI's BPW. Store valid phy
7f9fb67358a2bc Xu Yilun 2020-08-19  227   * layer data length in br->phy_len.
7f9fb67358a2bc Xu Yilun 2020-08-19  228   *
7f9fb67358a2bc Xu Yilun 2020-08-19  229   * phy_buf len should be aligned with SPI's BPW. Spare bytes should be padded
7f9fb67358a2bc Xu Yilun 2020-08-19  230   * with PHY_IDLE, then the slave will just drop them.
7f9fb67358a2bc Xu Yilun 2020-08-19  231   *
7f9fb67358a2bc Xu Yilun 2020-08-19  232   * The driver will not simply pad 4a at the tail. The concern is that driver
7f9fb67358a2bc Xu Yilun 2020-08-19  233   * will not store MISO data during tx phase, if the driver pads 4a at the tail,
7f9fb67358a2bc Xu Yilun 2020-08-19  234   * it is possible that if the slave is fast enough to response at the padding
7f9fb67358a2bc Xu Yilun 2020-08-19  235   * time. As a result these rx bytes are lost. In the following case, 7a,7c,00
7f9fb67358a2bc Xu Yilun 2020-08-19  236   * will lost.
7f9fb67358a2bc Xu Yilun 2020-08-19  237   * MOSI ...|7a|7c|00|10| |00|00|04|02| |4b|7d|5a|7b| |40|4a|4a|4a| |XX|XX|...
7f9fb67358a2bc Xu Yilun 2020-08-19  238   * MISO ...|4a|4a|4a|4a| |4a|4a|4a|4a| |4a|4a|4a|4a| |4a|7a|7c|00| |78|56|...
7f9fb67358a2bc Xu Yilun 2020-08-19  239   *
7f9fb67358a2bc Xu Yilun 2020-08-19  240   * So the driver moves EOP and bytes after EOP to the end of the aligned size,
7f9fb67358a2bc Xu Yilun 2020-08-19  241   * then fill the hole with PHY_IDLE. As following:
7f9fb67358a2bc Xu Yilun 2020-08-19  242   * before pad ...|7a|7c|00|10| |00|00|04|02| |4b|7d|5a|7b| |40|
7f9fb67358a2bc Xu Yilun 2020-08-19  243   * after pad  ...|7a|7c|00|10| |00|00|04|02| |4b|7d|5a|4a| |4a|4a|7b|40|
7f9fb67358a2bc Xu Yilun 2020-08-19  244   * Then if the slave will not get the entire packet before the tx phase is
7f9fb67358a2bc Xu Yilun 2020-08-19  245   * over, it can't responsed to anything either.
7f9fb67358a2bc Xu Yilun 2020-08-19  246   */
7f9fb67358a2bc Xu Yilun 2020-08-19  247  static int br_pkt_phy_tx_prepare(struct spi_avmm_bridge *br)
7f9fb67358a2bc Xu Yilun 2020-08-19  248  {
7f9fb67358a2bc Xu Yilun 2020-08-19  249  	char *tb, *tb_end, *pb, *pb_limit, *pb_eop = NULL;
7f9fb67358a2bc Xu Yilun 2020-08-19  250  	unsigned int aligned_phy_len, move_size;
7f9fb67358a2bc Xu Yilun 2020-08-19  251  	bool need_esc = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  252  
7f9fb67358a2bc Xu Yilun 2020-08-19  253  	tb = br->trans_buf;
7f9fb67358a2bc Xu Yilun 2020-08-19  254  	tb_end = tb + br->trans_len;
7f9fb67358a2bc Xu Yilun 2020-08-19  255  	pb = br->phy_buf;
7f9fb67358a2bc Xu Yilun 2020-08-19  256  	pb_limit = pb + ARRAY_SIZE(br->phy_buf);
7f9fb67358a2bc Xu Yilun 2020-08-19  257  
7f9fb67358a2bc Xu Yilun 2020-08-19  258  	*pb++ = PKT_SOP;
7f9fb67358a2bc Xu Yilun 2020-08-19  259  
7f9fb67358a2bc Xu Yilun 2020-08-19  260  	/*
7f9fb67358a2bc Xu Yilun 2020-08-19  261  	 * The driver doesn't support multiple channels so the channel number
7f9fb67358a2bc Xu Yilun 2020-08-19  262  	 * is always 0.
7f9fb67358a2bc Xu Yilun 2020-08-19  263  	 */
7f9fb67358a2bc Xu Yilun 2020-08-19  264  	*pb++ = PKT_CHANNEL;
7f9fb67358a2bc Xu Yilun 2020-08-19  265  	*pb++ = 0x0;
7f9fb67358a2bc Xu Yilun 2020-08-19  266  
7f9fb67358a2bc Xu Yilun 2020-08-19  267  	for (; pb < pb_limit && tb < tb_end; pb++) {
7f9fb67358a2bc Xu Yilun 2020-08-19  268  		if (need_esc) {
7f9fb67358a2bc Xu Yilun 2020-08-19  269  			*pb = *tb++ ^ 0x20;
7f9fb67358a2bc Xu Yilun 2020-08-19  270  			need_esc = false;
7f9fb67358a2bc Xu Yilun 2020-08-19  271  			continue;
7f9fb67358a2bc Xu Yilun 2020-08-19  272  		}
7f9fb67358a2bc Xu Yilun 2020-08-19  273  
7f9fb67358a2bc Xu Yilun 2020-08-19  274  		/* EOP should be inserted before the last valid char */
7f9fb67358a2bc Xu Yilun 2020-08-19  275  		if (tb == tb_end - 1 && !pb_eop) {
7f9fb67358a2bc Xu Yilun 2020-08-19  276  			*pb = PKT_EOP;
7f9fb67358a2bc Xu Yilun 2020-08-19  277  			pb_eop = pb;
7f9fb67358a2bc Xu Yilun 2020-08-19  278  			continue;
7f9fb67358a2bc Xu Yilun 2020-08-19  279  		}
7f9fb67358a2bc Xu Yilun 2020-08-19  280  
7f9fb67358a2bc Xu Yilun 2020-08-19  281  		/*
7f9fb67358a2bc Xu Yilun 2020-08-19  282  		 * insert an ESCAPE char if the data value equals any special
7f9fb67358a2bc Xu Yilun 2020-08-19  283  		 * char.
7f9fb67358a2bc Xu Yilun 2020-08-19  284  		 */
7f9fb67358a2bc Xu Yilun 2020-08-19  285  		switch (*tb) {
7f9fb67358a2bc Xu Yilun 2020-08-19  286  		case PKT_SOP:
7f9fb67358a2bc Xu Yilun 2020-08-19  287  		case PKT_EOP:
7f9fb67358a2bc Xu Yilun 2020-08-19  288  		case PKT_CHANNEL:
7f9fb67358a2bc Xu Yilun 2020-08-19  289  		case PKT_ESC:
7f9fb67358a2bc Xu Yilun 2020-08-19  290  			*pb = PKT_ESC;
7f9fb67358a2bc Xu Yilun 2020-08-19  291  			need_esc = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  292  			break;
7f9fb67358a2bc Xu Yilun 2020-08-19  293  		case PHY_IDLE:
7f9fb67358a2bc Xu Yilun 2020-08-19  294  		case PHY_ESC:
7f9fb67358a2bc Xu Yilun 2020-08-19  295  			*pb = PHY_ESC;
7f9fb67358a2bc Xu Yilun 2020-08-19  296  			need_esc = true;
7f9fb67358a2bc Xu Yilun 2020-08-19  297  			break;
7f9fb67358a2bc Xu Yilun 2020-08-19  298  		default:
7f9fb67358a2bc Xu Yilun 2020-08-19  299  			*pb = *tb++;
7f9fb67358a2bc Xu Yilun 2020-08-19  300  			break;
7f9fb67358a2bc Xu Yilun 2020-08-19  301  		}
7f9fb67358a2bc Xu Yilun 2020-08-19  302  	}
7f9fb67358a2bc Xu Yilun 2020-08-19  303  
7f9fb67358a2bc Xu Yilun 2020-08-19  304  	/* The phy buffer is used out but transaction layer data remains */
7f9fb67358a2bc Xu Yilun 2020-08-19  305  	if (tb < tb_end)
7f9fb67358a2bc Xu Yilun 2020-08-19  306  		return -ENOMEM;
7f9fb67358a2bc Xu Yilun 2020-08-19  307  
7f9fb67358a2bc Xu Yilun 2020-08-19  308  	/* Store valid phy data length for spi transfer */
7f9fb67358a2bc Xu Yilun 2020-08-19  309  	br->phy_len = pb - br->phy_buf;
7f9fb67358a2bc Xu Yilun 2020-08-19  310  
7f9fb67358a2bc Xu Yilun 2020-08-19  311  	if (br->word_len == 1)
7f9fb67358a2bc Xu Yilun 2020-08-19  312  		return 0;
7f9fb67358a2bc Xu Yilun 2020-08-19  313  
7f9fb67358a2bc Xu Yilun 2020-08-19  314  	/* Do phy buf padding if word_len > 1 byte. */
7f9fb67358a2bc Xu Yilun 2020-08-19  315  	aligned_phy_len = ALIGN(br->phy_len, br->word_len);
7f9fb67358a2bc Xu Yilun 2020-08-19  316  	if (aligned_phy_len > sizeof(br->phy_buf))
7f9fb67358a2bc Xu Yilun 2020-08-19  317  		return -ENOMEM;
7f9fb67358a2bc Xu Yilun 2020-08-19  318  
7f9fb67358a2bc Xu Yilun 2020-08-19  319  	if (aligned_phy_len == br->phy_len)
7f9fb67358a2bc Xu Yilun 2020-08-19  320  		return 0;
7f9fb67358a2bc Xu Yilun 2020-08-19  321  
7f9fb67358a2bc Xu Yilun 2020-08-19  322  	/* move EOP and bytes after EOP to the end of aligned size */
7f9fb67358a2bc Xu Yilun 2020-08-19  323  	move_size = pb - pb_eop;
7f9fb67358a2bc Xu Yilun 2020-08-19 @324  	memmove(&br->phy_buf[aligned_phy_len - move_size], pb_eop, move_size);
7f9fb67358a2bc Xu Yilun 2020-08-19  325  
7f9fb67358a2bc Xu Yilun 2020-08-19  326  	/* fill the hole with PHY_IDLEs */
7f9fb67358a2bc Xu Yilun 2020-08-19  327  	memset(pb_eop, PHY_IDLE, aligned_phy_len - br->phy_len);
7f9fb67358a2bc Xu Yilun 2020-08-19  328  
7f9fb67358a2bc Xu Yilun 2020-08-19  329  	/* update the phy data length */
7f9fb67358a2bc Xu Yilun 2020-08-19  330  	br->phy_len = aligned_phy_len;
7f9fb67358a2bc Xu Yilun 2020-08-19  331  
7f9fb67358a2bc Xu Yilun 2020-08-19  332  	return 0;
7f9fb67358a2bc Xu Yilun 2020-08-19  333  }
7f9fb67358a2bc Xu Yilun 2020-08-19  334  

:::::: The code at line 324 was first introduced by commit
:::::: 7f9fb67358a2bcaacbdfeee12e0f19e98c8bdf55 regmap: add Intel SPI Slave to AVMM Bus Bridge support

:::::: TO: Xu Yilun <yilun.xu@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
