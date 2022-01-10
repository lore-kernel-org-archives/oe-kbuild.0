Content-Type: multipart/mixed; boundary="===============3681460749336192726=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: warning: Value stored to 'pf_q' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 10 Jan 2022 12:44:36 +0800
Message-ID: <202201101200.Zy2802DX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3681460749336192726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: 65662a8dcdd01342b71ee44234bcfd0162e195af i40e: Fix logic of disabli=
ng queues
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-c007-20220101 (https://download.01.org/0day-ci/ar=
chive/20220110/202201101200.Zy2802DX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D65662a8dcdd01342b71ee44234bcfd0162e195af
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 65662a8dcdd01342b71ee44234bcfd0162e195af
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/nfc/nci/hci.c:620:6: note: Assuming 'conn_info' is non-null
           if (!conn_info)
               ^~~~~~~~~~
   net/nfc/nci/hci.c:620:2: note: Taking false branch
           if (!conn_info)
           ^
   net/nfc/nci/hci.c:633:6: note: Assuming 'r' is not equal to NCI_STATUS_OK
           if (r =3D=3D NCI_STATUS_OK) {
               ^~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:633:2: note: Taking false branch
           if (r =3D=3D NCI_STATUS_OK) {
           ^
   net/nfc/nci/hci.c:643:2: note: Returning without writing to '*'
           return r;
           ^
   net/nfc/nci/hci.c:743:6: note: Returning from 'nci_hci_get_param'
           r =3D nci_hci_get_param(ndev, NCI_HCI_ADMIN_GATE,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/nci/hci.c:745:6: note: Assuming 'r' is >=3D 0
           if (r < 0)
               ^~~~~
   net/nfc/nci/hci.c:745:2: note: Taking false branch
           if (r < 0)
           ^
   net/nfc/nci/hci.c:748:6: note: Access to field 'len' results in a derefe=
rence of an undefined pointer value (loaded from variable 'skb')
           if (skb->len &&
               ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/codecs/cs35l33.c:1161:3: warning: Value stored to 'pdata' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1161:3: note: Value stored to 'pdata' is neve=
r read
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/soc/codecs/cs42l42.c:581:8: warning: Excessive padding in 'struct =
cs42l42_pll_params' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   sclk, =

   pll_div_frac, =

   mclk_int, =

   mclk_div, =

   mclk_src_sel, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   n, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:581:8: note: Excessive padding in 'struct cs4=
2l42_pll_params' (4 padding bytes, where 0 is optimal). Optimal fields orde=
r: sclk, pll_div_frac, mclk_int, mclk_div, mclk_src_sel, sclk_prediv, pll_d=
iv_int, pll_mode, pll_divout, pll_cal_ratio, n, consider reordering the fie=
lds or adding explicit padding members
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1404:28: warning: Value stored to 'component'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct snd_soc_component *component =3D cs42l42->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1404:28: note: Value stored to 'component' du=
ring its initialization is never read
           struct snd_soc_component *component =3D cs42l42->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
>> drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: warning: Value store=
d to 'pf_q' is never read [clang-analyzer-deadcode.DeadStores]
           pf_q =3D vsi->base_queue;
           ^      ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: note: Value stored t=
o 'pf_q' is never read
           pf_q =3D vsi->base_queue;
           ^      ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:7949:3: warning: Value store=
d to 'need_reset' is never read [clang-analyzer-deadcode.DeadStores]
                   need_reset =3D false;
                   ^            ~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:7949:3: note: Value stored t=
o 'need_reset' is never read
                   need_reset =3D false;
                   ^            ~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9179:6: warning: Value store=
d to 'queue' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 queue =3D le32_to_cpu(data->prtdcb_rupto);
               ^~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9179:6: note: Value stored t=
o 'queue' during its initialization is never read
           u32 queue =3D le32_to_cpu(data->prtdcb_rupto);
               ^~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9828:4: warning: Value store=
d to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D i40e_vc_process_vf_msg(pf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9828:4: note: Value stored t=
o 'ret' is never read
                           ret =3D i40e_vc_process_vf_msg(pf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:10707:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D i40e_setup_misc_vector(pf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:10707:3: note: Value stored =
to 'ret' is never read
                   ret =3D i40e_setup_misc_vector(pf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:14131:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D i40e_vsi_config_rss(vsi);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:14131:3: note: Value stored =
to 'ret' is never read
                   ret =3D i40e_vsi_config_rss(vsi);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:2716:4: warning: Value st=
ored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D i40e_led_get_phy(hw, &temp_status,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:2716:4: note: Value store=
d to 'ret' is never read
                           ret =3D i40e_led_get_phy(hw, &temp_status,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/net/ethernet/qlogic/qed/qed_debug.c:1019:3: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
                   strcpy(dump_buf, str);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:1019:3: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
                   strcpy(dump_buf, str);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2428:4: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
                           strcpy(buf + strlen(buf), name);
                           ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2428:4: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
                           strcpy(buf + strlen(buf), name);
                           ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2430:4: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
                           strcpy(buf, name);
                           ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2430:4: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
                           strcpy(buf, name);
                           ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2460:3: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
                   strcpy(buf + strlen(buf), mem_group);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2460:3: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
                   strcpy(buf + strlen(buf), mem_group);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2462:3: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
                   strcpy(buf, mem_group);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2462:3: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
                   strcpy(buf, mem_group);
                   ^~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4087:2: warning: Value store=
d to 'byte_buf' is never read [clang-analyzer-deadcode.DeadStores]
           byte_buf +=3D sizeof(signature);
           ^           ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:4087:2: note: Value stored t=
o 'byte_buf' is never read
           byte_buf +=3D sizeof(signature);
           ^           ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5527:8: warning: Excessive p=
adding in 'struct igu_fifo_addr_data' (8 padding bytes, where 0 is optimal)=
. =

   Optimal fields order: =

   desc, =

   vf_desc, =

   type, =

   start_addr, =

   end_addr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct igu_fifo_addr_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:5527:8: note: Excessive padd=
ing in 'struct igu_fifo_addr_data' (8 padding bytes, where 0 is optimal). O=
ptimal fields order: desc, vf_desc, type, start_addr, end_addr, consider re=
ordering the fields or adding explicit padding members
   struct igu_fifo_addr_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:8012:3: warning: Value store=
d to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D (feature_size + REGDUMP_HEADER_SIZE);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_debug.c:8012:3: note: Value stored t=
o 'offset' is never read

vim +/pf_q +4643 drivers/net/ethernet/intel/i40e/i40e_main.c

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4616  =

3aa7b74dbeedfb Filip Sadowski       2016-10-11  4617  /**
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4618   * i40e_vsi_stop_ring=
s - Stop a VSI's rings
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4619   * @vsi: the VSI bein=
g configured
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4620   **/
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4621  void i40e_vsi_stop_ri=
ngs(struct i40e_vsi *vsi)
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4622  {
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4623  	struct i40e_pf *pf =
=3D vsi->back;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4624  	int pf_q, err, q_end;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4625  =

3480756f2cb93c Jacob Keller         2017-04-13  4626  	/* When port TX is s=
uspended, don't wait */
0da36b9774cc24 Jacob Keller         2017-04-19  4627  	if (test_bit(__I40E_=
PORT_SUSPENDED, vsi->back->state))
3480756f2cb93c Jacob Keller         2017-04-13  4628  		return i40e_vsi_sto=
p_rings_no_wait(vsi);
3480756f2cb93c Jacob Keller         2017-04-13  4629  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4630  	q_end =3D vsi->base_=
queue + vsi->num_queue_pairs;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4631  	for (pf_q =3D vsi->b=
ase_queue; pf_q < q_end; pf_q++)
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4632  		i40e_pre_tx_queue_c=
fg(&pf->hw, (u32)pf_q, false);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4633  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4634  	for (pf_q =3D vsi->b=
ase_queue; pf_q < q_end; pf_q++) {
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4635  		err =3D i40e_contro=
l_wait_rx_q(pf, pf_q, false);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4636  		if (err)
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4637  			dev_info(&pf->pdev=
->dev,
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4638  				 "VSI seid %d Rx =
ring %d dissable timeout\n",
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4639  				 vsi->seid, pf_q);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4640  	}
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4641  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4642  	msleep(I40E_DISABLE_=
TX_GAP_MSEC);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29 @4643  	pf_q =3D vsi->base_q=
ueue;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4644  	for (pf_q =3D vsi->b=
ase_queue; pf_q < q_end; pf_q++)
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4645  		wr32(&pf->hw, I40E_=
QTX_ENA(pf_q), 0);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4646  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4647  	i40e_vsi_wait_queues=
_disabled(vsi);
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4648  }
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4649  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3681460749336192726==--

