Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93241373
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679228648; x=1710764648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqCXFOUY8n36E8HYzXZ5oNAjsaA7FOJTsg0niXf2/GA=;
  b=EEdmBOTQ64d+xcactmXjPSWgNo5WCdraOyFFhQIU3/s0tZc5n3pwjeGU
   tnubNvPvgkI0zk0XCOv5ZGi5VBQ+8rOjkodoKARVxOKu80gE99tmxffjK
   3Be3yf9BHLHMfW7+NSALw+VEO/5118IHJ6Hahpu86TnV421z1WyzjyXBE
   kZoq9aumPkVVBHwMUM1HWqsAolFzIbS2vKTlu44hOzll9j0b7Q9inhhpS
   mBtKJlQgcDSKlRRzqQlMWr2QZ1Qj2IYdqHGJJ/QsnEuXekUsnNJ5PX3Qw
   MSgsObXfpJRpT7hF7BUVO9RTyqjJ324uBU3g04hwMAyrlpI9K/6OELwW/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="336001172"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="336001172"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 05:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="926679237"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="926679237"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2023 05:24:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pds50-000AWY-0e;
	Sun, 19 Mar 2023 12:24:06 +0000
Date: Sun, 19 Mar 2023 20:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 07/13] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <202303192055.7yJgw1E3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/clk/clk-fsl-lynx-10g.c:273:19: warning: Value stored to 'clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230313161138.3598068-8-sean.anderson@seco.com>
References: <20230313161138.3598068-8-sean.anderson@seco.com>
TO: Sean Anderson <sean.anderson@seco.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: linux-phy@lists.infradead.org
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Camelia Alexandra Groza <camelia.groza@nxp.com>
CC: Madalin Bucur <madalin.bucur@nxp.com>
CC: Bagas Sanjaya <bagasdotme@gmail.com>
CC: Ioana Ciornei <ioana.ciornei@nxp.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: Sean Anderson <sean.anderson@seco.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on brgl/gpio/for-next clk/clk-next linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230314-001522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230313161138.3598068-8-sean.anderson%40seco.com
patch subject: [PATCH v11 07/13] phy: fsl: Add Lynx 10G SerDes driver
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20230318 (https://download.01.org/0day-ci/archive/20230319/202303192055.7yJgw1E3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/90cd7f9d314637a1b610cf895137b83c89a53d7e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230314-001522
        git checkout 90cd7f9d314637a1b610cf895137b83c89a53d7e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303192055.7yJgw1E3-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/target/target_core_sbc.c:1047:12: note: Field 'execute_cmd' is non-null
           if (!cmd->execute_cmd)
                     ^
   drivers/target/target_core_sbc.c:1047:2: note: Taking false branch
           if (!cmd->execute_cmd)
           ^
   drivers/target/target_core_sbc.c:1050:6: note: Assuming the condition is false
           if (cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_sbc.c:1050:2: note: Taking false branch
           if (cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) {
           ^
   drivers/target/target_core_sbc.c:1066:9: note: 2nd function call argument is an uninitialized value
           return target_cmd_size_check(cmd, size);
                  ^                          ~~~~
   drivers/target/target_core_sbc.c:1107:2: warning: Value stored to 'dl' is never read [clang-analyzer-deadcode.DeadStores]
           dl = get_unaligned_be16(&buf[0]);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_sbc.c:1107:2: note: Value stored to 'dl' is never read
           dl = get_unaligned_be16(&buf[0]);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/scsi/scsi_logging.c:75:3: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
                   off += vscnprintf(logbuf + off, logbuf_len - off, fmt, args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:75:3: note: Value stored to 'off' is never read
                   off += vscnprintf(logbuf + off, logbuf_len - off, fmt, args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:100:3: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
                   off += vscnprintf(logbuf + off, logbuf_len - off, fmt, args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:100:3: note: Value stored to 'off' is never read
                   off += vscnprintf(logbuf + off, logbuf_len - off, fmt, args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:206:3: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
                   off += scnprintf(logbuf + off, logbuf_len - off, "\n");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:206:3: note: Value stored to 'off' is never read
                   off += scnprintf(logbuf + off, logbuf_len - off, "\n");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:328:2: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
           off += scsi_format_sense_hdr(logbuf + off, logbuf_len - off, sshdr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:328:2: note: Value stored to 'off' is never read
           off += scsi_format_sense_hdr(logbuf + off, logbuf_len - off, sshdr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:336:2: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
           off += scsi_format_extd_sense(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:336:2: note: Value stored to 'off' is never read
           off += scsi_format_extd_sense(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:432:2: warning: Value stored to 'off' is never read [clang-analyzer-deadcode.DeadStores]
           off += scnprintf(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:432:2: note: Value stored to 'off' is never read
           off += scnprintf(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/clk-fsl-lynx-10g.c:273:19: warning: Value stored to 'clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct lynx_clk *clk = lynx_pll_to_clk(hw);
                            ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-fsl-lynx-10g.c:273:19: note: Value stored to 'clk' during its initialization is never read
           struct lynx_clk *clk = lynx_pll_to_clk(hw);
                            ^~~   ~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/clk/clk-aspeed.c:609:2: warning: Value stored to 'hw' is never read [clang-analyzer-deadcode.DeadStores]
           hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, clkin);
           ^
   drivers/clk/clk-aspeed.c:609:2: note: Value stored to 'hw' is never read
   drivers/clk/clk-aspeed.c:662:2: warning: Value stored to 'hw' is never read [clang-analyzer-deadcode.DeadStores]
           hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
           ^
   drivers/clk/clk-aspeed.c:662:2: note: Value stored to 'hw' is never read
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results in a dereference of a null pointer (loaded from variable 'prev') [clang-analyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null pointer value
           const struct max9485_rate *curr, *prev = NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to 0
           for (curr = max9485_rates; curr->out != 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Execution continues on line 199
           for (curr = max9485_rates; curr->out != 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/soc/qcom/rpmh.c:94:3: warning: Argument to kfree() is the address of a local stack variable, which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(rpm_msg);
                   ^
   drivers/soc/qcom/rpmh.c:262:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/soc/qcom/rpmh.c:262:2: note: Taking false branch
           if (ret)
           ^
   drivers/soc/qcom/rpmh.c:265:8: note: Calling '__rpmh_write'
           ret = __rpmh_write(dev, state, &rpm_msg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:179:14: note: 'i' is < field 'num_cmds'
           for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^
   drivers/soc/qcom/rpmh.c:179:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:181:3: note: Taking false branch
                   if (IS_ERR(req))
                   ^
   drivers/soc/qcom/rpmh.c:179:14: note: Assuming 'i' is < field 'num_cmds'
           for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:179:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:181:3: note: Taking false branch
                   if (IS_ERR(req))
                   ^
   drivers/soc/qcom/rpmh.c:179:14: note: Assuming 'i' is >= field 'num_cmds'
           for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:179:2: note: Loop condition is false. Execution continues on line 185
           for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:185:6: note: 'state' is not equal to RPMH_ACTIVE_ONLY_STATE
           if (state == RPMH_ACTIVE_ONLY_STATE) {
               ^~~~~
   drivers/soc/qcom/rpmh.c:185:2: note: Taking false branch
           if (state == RPMH_ACTIVE_ONLY_STATE) {
           ^
   drivers/soc/qcom/rpmh.c:191:3: note: Calling 'rpmh_tx_done'

vim +/clk +273 drivers/clk/clk-fsl-lynx-10g.c

91fc603231db36 Sean Anderson 2023-03-13  268  
91fc603231db36 Sean Anderson 2023-03-13  269  static int lynx_pll_determine_rate(struct clk_hw *hw,
91fc603231db36 Sean Anderson 2023-03-13  270  				   struct clk_rate_request *req)
91fc603231db36 Sean Anderson 2023-03-13  271  {
91fc603231db36 Sean Anderson 2023-03-13  272  	int frate_sel, rfclk_sel;
91fc603231db36 Sean Anderson 2023-03-13 @273  	struct lynx_clk *clk = lynx_pll_to_clk(hw);
91fc603231db36 Sean Anderson 2023-03-13  274  	u32 ratio;
91fc603231db36 Sean Anderson 2023-03-13  275  
91fc603231db36 Sean Anderson 2023-03-13  276  	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
91fc603231db36 Sean Anderson 2023-03-13  277  		(u64)req->rate * HZ_PER_KHZ, req->best_parent_rate);
91fc603231db36 Sean Anderson 2023-03-13  278  
91fc603231db36 Sean Anderson 2023-03-13  279  	frate_sel = lynx_frate_to_sel(req->rate);
91fc603231db36 Sean Anderson 2023-03-13  280  	if (frate_sel < 0)
91fc603231db36 Sean Anderson 2023-03-13  281  		return frate_sel;
91fc603231db36 Sean Anderson 2023-03-13  282  
91fc603231db36 Sean Anderson 2023-03-13  283  	/* Try the current parent rate */
91fc603231db36 Sean Anderson 2023-03-13  284  	rfclk_sel = lynx_rfclk_to_sel(req->best_parent_rate);
91fc603231db36 Sean Anderson 2023-03-13  285  	if (rfclk_sel >= 0) {
91fc603231db36 Sean Anderson 2023-03-13  286  		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
91fc603231db36 Sean Anderson 2023-03-13  287  		if (ratio) {
91fc603231db36 Sean Anderson 2023-03-13  288  			req->rate = mult_frac(req->best_parent_rate, ratio,
91fc603231db36 Sean Anderson 2023-03-13  289  					      HZ_PER_KHZ);
91fc603231db36 Sean Anderson 2023-03-13  290  			return 0;
91fc603231db36 Sean Anderson 2023-03-13  291  		}
91fc603231db36 Sean Anderson 2023-03-13  292  	}
91fc603231db36 Sean Anderson 2023-03-13  293  
91fc603231db36 Sean Anderson 2023-03-13  294  	/* Try all possible parent rates */
91fc603231db36 Sean Anderson 2023-03-13  295  	for (rfclk_sel = 0;
91fc603231db36 Sean Anderson 2023-03-13  296  	     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
91fc603231db36 Sean Anderson 2023-03-13  297  	     rfclk_sel++) {
91fc603231db36 Sean Anderson 2023-03-13  298  		unsigned long new_parent_rate;
91fc603231db36 Sean Anderson 2023-03-13  299  
91fc603231db36 Sean Anderson 2023-03-13  300  		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
91fc603231db36 Sean Anderson 2023-03-13  301  		if (!ratio)
91fc603231db36 Sean Anderson 2023-03-13  302  			continue;
91fc603231db36 Sean Anderson 2023-03-13  303  
91fc603231db36 Sean Anderson 2023-03-13  304  		/* Ensure the reference clock can produce this rate */
91fc603231db36 Sean Anderson 2023-03-13  305  		new_parent_rate = rfclk_sel_map[rfclk_sel];
91fc603231db36 Sean Anderson 2023-03-13  306  		new_parent_rate = clk_hw_round_rate(req->best_parent_hw,
91fc603231db36 Sean Anderson 2023-03-13  307  						    new_parent_rate);
91fc603231db36 Sean Anderson 2023-03-13  308  		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
91fc603231db36 Sean Anderson 2023-03-13  309  			continue;
91fc603231db36 Sean Anderson 2023-03-13  310  
91fc603231db36 Sean Anderson 2023-03-13  311  		req->rate = mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
91fc603231db36 Sean Anderson 2023-03-13  312  		req->best_parent_rate = new_parent_rate;
91fc603231db36 Sean Anderson 2023-03-13  313  		return 0;
91fc603231db36 Sean Anderson 2023-03-13  314  	}
91fc603231db36 Sean Anderson 2023-03-13  315  
91fc603231db36 Sean Anderson 2023-03-13  316  	return -EINVAL;
91fc603231db36 Sean Anderson 2023-03-13  317  }
91fc603231db36 Sean Anderson 2023-03-13  318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
