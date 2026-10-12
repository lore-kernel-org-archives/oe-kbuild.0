Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACB3C9EF1
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831265; cv=none; b=tdNAUHjaHwNbVSxpQvFA0IFfU8VauEVGlrWs9bvkyZOdiVU+BGVjGmpBrCEN3MDAVxg8uPcY6LvvHLbxiSsET9KretLsL09KvLPqQo/YcNE9cgSFYxEP+FYWBH8FwKhszwX/mYJHjoYhXXTDKQwnkyOio8Cq+9akyut/iRCJo4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831265; c=relaxed/simple;
	bh=qR3iaVqYItZJBNDxglxo7EEqUMzdu5y+Sxa4f4o9p3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y6UERzwR8L0xfvRwCeXWVE9zosjsQXt3c1M34zHk7p118lrrXH5tucEIaAhmuibnqjutjWVhFoupXenLxJeU11MChK1UKz5NcBkTZsSxdAI4rDZr0ofQg1w5ojtppLLJQRmCYa0N8EVsm9QXhsB00rHnW81f3T6R6YrHIBt/iak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCGVBOSt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCGVBOSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791831257; x=1823367257;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qR3iaVqYItZJBNDxglxo7EEqUMzdu5y+Sxa4f4o9p3k=;
  b=DCGVBOStW9nCANTnEWPpf+5xXH5/7UA/EYM3aaUBMUTgai5uRiKBRe+q
   Hj+luKvDmAnZKKWg+eR49TguN3s3j0AOwNMzy2xbFedUCwPpYPZTbGFeK
   2hyHi3A8+pZ8W0D3rRHmSP0AQ+JbB5TvAjIEXvrqJLZCIMdjqMKUwGXZp
   w7ob9csOc50IZKN8UblrQJ7OxQ4HNbkdB0ZraenPqbsddcPyYR7efUNzy
   PrjumkyYMaBBKNIRhK/tDChNO9WZkWSy08YQxD1HT2kcMXdk2qD7mIFyx
   Tu4RYPUbV09CU7Z1EfbLTujw2rmPP8DC3JCiKiguOae7jd4aZ1+VrXk2k
   w==;
X-CSE-ConnectionGUID: gsHQcuQTTZCkSAk2pGnfEQ==
X-CSE-MsgGUID: 4MYQUhpiQYOhmFERrCPY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="534523"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="534523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 11:54:16 -0700
X-CSE-ConnectionGUID: qTFg+37JQt282mcjjOVVuQ==
X-CSE-MsgGUID: n50ypcCDQ0G5kSbTaDNxfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1082899"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 11:54:15 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGLA5-00000000A9j-0VHt;
	Mon, 12 Oct 2026 18:54:13 +0000
Date: Mon, 12 Oct 2026 20:53:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 134/323]
 arch/arm64/boot/dts/qcom/nord-rrd.dtb:
 /soc@0/system-cache-controller@21800000: failed to match any schema with
 compatible: ['qcom,nord-llcc']
Message-ID: <202610122026.da2uhZ1B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Shawn Guo <shengchao.guo@oss.qualcomm.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-7.4
head:   d053e38e614fb2e383b298ce8fc308a780d7f209
commit: dfd81990d6129052e391968afed2fb2f27f8353d [134/323] arm64: dts: qcom=
: nord: Add LLCC node
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2403-20261001 (https://download.01.org/0day-ci/arc=
hive/20261012/202610122026.da2uhZ1B-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e=
4505dd447d115d85fdea45cd71030ac1d86ee)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261012/202610122026.da2uhZ1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610122026.da2uhZ1B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qup1_se3_01' is not one of ['aoss_cti', 'atest_char', 'atest_usb20', '=
atest_usb21', 'aud_intfc0_clk', 'aud_intfc0_data', 'aud_intfc0_ws', 'aud_in=
tfc10_clk', 'aud_intfc10_data', 'aud_intfc10_ws', 'aud_intfc1_clk', 'aud_in=
tfc1_data', 'aud_intfc1_ws', 'aud_intfc2_clk', 'aud_intfc2_data', 'aud_intf=
c2_ws', 'aud_intfc3_clk', 'aud_intfc3_data', 'aud_intfc3_ws', 'aud_intfc4_c=
lk', 'aud_intfc4_data', 'aud_intfc4_ws', 'aud_intfc5_clk', 'aud_intfc5_data=
', 'aud_intfc5_ws', 'aud_intfc6_clk', 'aud_intfc6_data', 'aud_intfc6_ws', '=
aud_intfc7_clk', 'aud_intfc7_data', 'aud_intfc7_ws', 'aud_intfc8_clk', 'aud=
_intfc8_data', 'aud_intfc8_ws', 'aud_intfc9_clk', 'aud_intfc9_data', 'aud_i=
ntfc9_ws', 'aud_mclk0_mira', 'aud_mclk0_mirb', 'aud_mclk1_mira', 'aud_mclk1=
_mirb', 'aud_mclk2_mira', 'aud_mclk2_mirb', 'aud_refclk0', 'aud_refclk1', '=
bist_done', 'ccu_async_in', 'ccu_i2c_scl', 'ccu_i2c_sda', 'ccu_timer', 'cli=
nk_debug', 'dbg_out', 'dbg_out_clk', 'ddr_bist_complete', 'ddr_bist_fail', =
'ddr_bist_start', 'ddr_bist_stop', 'ddr_pxi', 'dp_rx0', 'dp_rx00', 'dp_rx01=
', 'dp_rx0_mute', 'dp_rx1', 'dp_rx10', 'dp_rx11', 'dp_rx1_mute', 'edp0_hot'=
, 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'edp2_hot', 'edp2_lcd', 'edp3_hot', '=
edp3_lcd', 'emac0_mcg', 'emac0_mdc', 'emac0_mdio', 'emac0_ptp', 'emac1_mcg'=
, 'emac1_mdc', 'emac1_mdio', 'emac1_ptp', 'gcc_gp1_clk', 'gcc_gp2_clk', 'gc=
c_gp3_clk', 'gcc_gp4_clk', 'gcc_gp5_clk', 'gcc_gp6_clk', 'gcc_gp7_clk', 'gc=
c_gp8_clk', 'jitter_bist', 'lbist_pass', 'mbist_pass', 'mdp0_vsync_out', 'm=
dp1_vsync_out', 'mdp_vsync_e', 'mdp_vsync_p', 'mdp_vsync_s', 'pcie0_clk_req=
_n', 'pcie1_clk_req_n', 'pcie2_clk_req_n', 'pcie3_clk_req_n', 'phase_flag',=
 'pll_bist_sync', 'pll_clk_aux', 'prng_rosc0', 'prng_rosc1', 'pwrbrk_i_n', =
'qdss', 'qdss_cti', 'qspi', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3',=
 'qup0_se4', 'qup0_se5', 'qup1_se0', 'qup1_se1', 'qup1_se3', 'qup1_se2', 'q=
up1_se4', 'qup1_se5', 'qup1_se6', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2=
_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'sailss_ospi', 'sdc4_clk', 'sdc4=
_cmd', 'sdc4_data', 'smb_alert', 'smb_alert_n', 'smb_clk', 'smb_dat', 'tb_t=
rig_sdc4', 'tmess_prng0', 'tmess_prng1', 'tsc_timer', 'tsense_pwm', 'usb0_h=
s', 'usb0_phy_ps', 'usb1_hs', 'usb1_phy_ps', 'usb2_hs', 'usxgmii0_phy', 'us=
xgmii1_phy', 'vsense_trigger_mirnat', 'wcn_sw', 'wcn_sw_ctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.y=
aml
   arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):=
 qup-uart9-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'drive-strength', 'function', 'pins' do not match any o=
f the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	'qup1_se2_23' is not one of ['aoss_cti', 'atest_char', 'atest_usb20', '=
atest_usb21', 'aud_intfc0_clk', 'aud_intfc0_data', 'aud_intfc0_ws', 'aud_in=
tfc10_clk', 'aud_intfc10_data', 'aud_intfc10_ws', 'aud_intfc1_clk', 'aud_in=
tfc1_data', 'aud_intfc1_ws', 'aud_intfc2_clk', 'aud_intfc2_data', 'aud_intf=
c2_ws', 'aud_intfc3_clk', 'aud_intfc3_data', 'aud_intfc3_ws', 'aud_intfc4_c=
lk', 'aud_intfc4_data', 'aud_intfc4_ws', 'aud_intfc5_clk', 'aud_intfc5_data=
', 'aud_intfc5_ws', 'aud_intfc6_clk', 'aud_intfc6_data', 'aud_intfc6_ws', '=
aud_intfc7_clk', 'aud_intfc7_data', 'aud_intfc7_ws', 'aud_intfc8_clk', 'aud=
_intfc8_data', 'aud_intfc8_ws', 'aud_intfc9_clk', 'aud_intfc9_data', 'aud_i=
ntfc9_ws', 'aud_mclk0_mira', 'aud_mclk0_mirb', 'aud_mclk1_mira', 'aud_mclk1=
_mirb', 'aud_mclk2_mira', 'aud_mclk2_mirb', 'aud_refclk0', 'aud_refclk1', '=
bist_done', 'ccu_async_in', 'ccu_i2c_scl', 'ccu_i2c_sda', 'ccu_timer', 'cli=
nk_debug', 'dbg_out', 'dbg_out_clk', 'ddr_bist_complete', 'ddr_bist_fail', =
'ddr_bist_start', 'ddr_bist_stop', 'ddr_pxi', 'dp_rx0', 'dp_rx00', 'dp_rx01=
', 'dp_rx0_mute', 'dp_rx1', 'dp_rx10', 'dp_rx11', 'dp_rx1_mute', 'edp0_hot'=
, 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'edp2_hot', 'edp2_lcd', 'edp3_hot', '=
edp3_lcd', 'emac0_mcg', 'emac0_mdc', 'emac0_mdio', 'emac0_ptp', 'emac1_mcg'=
, 'emac1_mdc', 'emac1_mdio', 'emac1_ptp', 'gcc_gp1_clk', 'gcc_gp2_clk', 'gc=
c_gp3_clk', 'gcc_gp4_clk', 'gcc_gp5_clk', 'gcc_gp6_clk', 'gcc_gp7_clk', 'gc=
c_gp8_clk', 'jitter_bist', 'lbist_pass', 'mbist_pass', 'mdp0_vsync_out', 'm=
dp1_vsync_out', 'mdp_vsync_e', 'mdp_vsync_p', 'mdp_vsync_s', 'pcie0_clk_req=
_n', 'pcie1_clk_req_n', 'pcie2_clk_req_n', 'pcie3_clk_req_n', 'phase_flag',=
 'pll_bist_sync', 'pll_clk_aux', 'prng_rosc0', 'prng_rosc1', 'pwrbrk_i_n', =
'qdss', 'qdss_cti', 'qspi', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3',=
 'qup0_se4', 'qup0_se5', 'qup1_se0', 'qup1_se1', 'qup1_se3', 'qup1_se2', 'q=
up1_se4', 'qup1_se5', 'qup1_se6', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2=
_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'sailss_ospi', 'sdc4_clk', 'sdc4=
_cmd', 'sdc4_data', 'smb_alert', 'smb_alert_n', 'smb_clk', 'smb_dat', 'tb_t=
rig_sdc4', 'tmess_prng0', 'tmess_prng1', 'tsc_timer', 'tsense_pwm', 'usb0_h=
s', 'usb0_phy_ps', 'usb1_hs', 'usb1_phy_ps', 'usb2_hs', 'usxgmii0_phy', 'us=
xgmii1_phy', 'vsense_trigger_mirnat', 'wcn_sw', 'wcn_sw_ctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.y=
aml
   arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):=
 qup-uart10-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'drive-strength', 'function', 'pins' do not match any o=
f the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	'qup1_se3_23' is not one of ['aoss_cti', 'atest_char', 'atest_usb20', '=
atest_usb21', 'aud_intfc0_clk', 'aud_intfc0_data', 'aud_intfc0_ws', 'aud_in=
tfc10_clk', 'aud_intfc10_data', 'aud_intfc10_ws', 'aud_intfc1_clk', 'aud_in=
tfc1_data', 'aud_intfc1_ws', 'aud_intfc2_clk', 'aud_intfc2_data', 'aud_intf=
c2_ws', 'aud_intfc3_clk', 'aud_intfc3_data', 'aud_intfc3_ws', 'aud_intfc4_c=
lk', 'aud_intfc4_data', 'aud_intfc4_ws', 'aud_intfc5_clk', 'aud_intfc5_data=
', 'aud_intfc5_ws', 'aud_intfc6_clk', 'aud_intfc6_data', 'aud_intfc6_ws', '=
aud_intfc7_clk', 'aud_intfc7_data', 'aud_intfc7_ws', 'aud_intfc8_clk', 'aud=
_intfc8_data', 'aud_intfc8_ws', 'aud_intfc9_clk', 'aud_intfc9_data', 'aud_i=
ntfc9_ws', 'aud_mclk0_mira', 'aud_mclk0_mirb', 'aud_mclk1_mira', 'aud_mclk1=
_mirb', 'aud_mclk2_mira', 'aud_mclk2_mirb', 'aud_refclk0', 'aud_refclk1', '=
bist_done', 'ccu_async_in', 'ccu_i2c_scl', 'ccu_i2c_sda', 'ccu_timer', 'cli=
nk_debug', 'dbg_out', 'dbg_out_clk', 'ddr_bist_complete', 'ddr_bist_fail', =
'ddr_bist_start', 'ddr_bist_stop', 'ddr_pxi', 'dp_rx0', 'dp_rx00', 'dp_rx01=
', 'dp_rx0_mute', 'dp_rx1', 'dp_rx10', 'dp_rx11', 'dp_rx1_mute', 'edp0_hot'=
, 'edp0_lcd', 'edp1_hot', 'edp1_lcd', 'edp2_hot', 'edp2_lcd', 'edp3_hot', '=
edp3_lcd', 'emac0_mcg', 'emac0_mdc', 'emac0_mdio', 'emac0_ptp', 'emac1_mcg'=
, 'emac1_mdc', 'emac1_mdio', 'emac1_ptp', 'gcc_gp1_clk', 'gcc_gp2_clk', 'gc=
c_gp3_clk', 'gcc_gp4_clk', 'gcc_gp5_clk', 'gcc_gp6_clk', 'gcc_gp7_clk', 'gc=
c_gp8_clk', 'jitter_bist', 'lbist_pass', 'mbist_pass', 'mdp0_vsync_out', 'm=
dp1_vsync_out', 'mdp_vsync_e', 'mdp_vsync_p', 'mdp_vsync_s', 'pcie0_clk_req=
_n', 'pcie1_clk_req_n', 'pcie2_clk_req_n', 'pcie3_clk_req_n', 'phase_flag',=
 'pll_bist_sync', 'pll_clk_aux', 'prng_rosc0', 'prng_rosc1', 'pwrbrk_i_n', =
'qdss', 'qdss_cti', 'qspi', 'qup0_se0', 'qup0_se1', 'qup0_se2', 'qup0_se3',=
 'qup0_se4', 'qup0_se5', 'qup1_se0', 'qup1_se1', 'qup1_se3', 'qup1_se2', 'q=
up1_se4', 'qup1_se5', 'qup1_se6', 'qup2_se0', 'qup2_se1', 'qup2_se2', 'qup2=
_se3', 'qup2_se4', 'qup2_se5', 'qup2_se6', 'sailss_ospi', 'sdc4_clk', 'sdc4=
_cmd', 'sdc4_data', 'smb_alert', 'smb_alert_n', 'smb_clk', 'smb_dat', 'tb_t=
rig_sdc4', 'tmess_prng0', 'tmess_prng1', 'tsc_timer', 'tsense_pwm', 'usb0_h=
s', 'usb0_phy_ps', 'usb1_hs', 'usb1_phy_ps', 'usb2_hs', 'usxgmii0_phy', 'us=
xgmii1_phy', 'vsense_trigger_mirnat', 'wcn_sw', 'wcn_sw_ctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.y=
aml
>> arch/arm64/boot/dts/qcom/nord-rrd.dtb: /soc@0/system-cache-controller@21=
800000: failed to match any schema with compatible: ['qcom,nord-llcc']
--
>> arch/arm64/boot/dts/qcom/nord-ride.dtb: /soc@0/system-cache-controller@2=
1800000: failed to match any schema with compatible: ['qcom,nord-llcc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
