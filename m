Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEEE429CD0
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757738; cv=none; b=iCSbzr2F+P414ufPFA0Py7eMqA7wbnPpsjenhfDcyjCZB5MwYSy8RpUridL9kLZWSuYD+r4/n6DaJ9GGNcbgK0HyN8GqqOEozbL6cHdKflpW5dnpQvE3GFvzKDnSqHL507jcGA8PsaKsP/mcyul1a/rSztrVeXP0JbsJiGBVau4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757738; c=relaxed/simple;
	bh=r8tFJ7JTnUYkILa2XmD7s4AcUuS6VdtJS21ldXE5O+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UuyUYBkzqTCoRZdMh07OmO6DpHPq+aSt5R0pIeVHzXEXyQEWmkUKu7bvQ782ZeRzbCNbKHPVLdlwHxeISEqAD1ntrqaE/hKt8ZwsXwUuOaSFgzG4+85ZwoJTkb2fesVkSph1BMmj8wZnI/bBl6d+y7OI5ahlyEXEBrTWiaBOT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnMAcFyN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnMAcFyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790757735; x=1822293735;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r8tFJ7JTnUYkILa2XmD7s4AcUuS6VdtJS21ldXE5O+k=;
  b=NnMAcFyNU4SusllBbRZ3U8Zt7YR2hFr9JFuUsSRz08Py/QQQMLb+Qil8
   msFR4SkyaVUej9cc3B8+Dwn5cOdo38XherHrONrkFsCZfrehVHHafSjt7
   ac9BNaeHpcF3d/GM5YoHCL6kBiWeOBRZ/kR3lE6Rt8o3rexaeyuebHgpX
   IhvyaShJcXyNHvwiKbrY/30xrrPjrWxCeuGiJGMnySTzrqK2MO/Fs3Ruv
   p5QKny94RZKvH1erZZfLEksztGTGd25MdTzfbdSrMkfl02d1VJL0Y9oN0
   Jh2tpR8mk93gBts2L+YsnrIYojpyeLiPEIAv9MDOvKqIMMKtXbAq2BtWK
   g==;
X-CSE-ConnectionGUID: JbHPCV5qTsSXnlEBARJ4PA==
X-CSE-MsgGUID: Jbc12UP9RDeEsiQvH0De5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100819748"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="100819748"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:42:13 -0700
X-CSE-ConnectionGUID: AlYZpAJaTLGILIAzWcFc5w==
X-CSE-MsgGUID: MeN/u+BYSxWhrAX6ghOwGw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 01:42:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBptC-000000001nj-0NUE;
	Wed, 30 Sep 2026 08:42:10 +0000
Date: Wed, 30 Sep 2026 10:41:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 118/291]
 arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):
 qup-i2c9-default-state: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202609301033.3yOcH9lt-lkp@intel.com>
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
TO: Shawn Guo <shengchao.guo@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-7.4
head:   300f5c59beb257550ae3863aeeed2ba63871dae8
commit: 32afff1e816e10185bb571aa9d89dc2eb061d548 [118/291] arm64: dts: qcom=
: Add device tree for Nord RRD board
:::::: branch date: 10 hours ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/arc=
hive/20260930/202609301033.3yOcH9lt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260930/202609301033.3yOcH9lt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609301033.3yOcH9lt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):=
 qup-i2c9-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any o=
f the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	'qup1_se2_01' is not one of ['aoss_cti', 'atest_char', 'atest_usb20', '=
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
>> arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):=
 qup-i2c10-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any o=
f the regexes: '-pins$', '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):=
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
>> arch/arm64/boot/dts/qcom/nord-rrd.dtb: pinctrl@f100000 (qcom,nord-tlmm):=
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
