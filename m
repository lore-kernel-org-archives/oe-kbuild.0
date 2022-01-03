Content-Type: multipart/mixed; boundary="===============8353458450870873858=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: warning: Value stored to 'pf_q' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 04 Jan 2022 02:08:43 +0800
Message-ID: <202201040200.QGI49OIz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8353458450870873858==
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
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: 65662a8dcdd01342b71ee44234bcfd0162e195af i40e: Fix logic of disabli=
ng queues
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20220101 (https://download.01.org/0day-ci/ar=
chive/20220104/202201040200.QGI49OIz-lkp(a)intel.com/config)
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
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:899:8: note: 'plltype' is equal to SSB_PLLTYPE_1
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                        ^~~~~~~
   drivers/ssb/main.c:899:34: note: Left side of '||' is true
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                                                  ^
   drivers/ssb/main.c:904:8: note: Calling 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:828:2: note: 'Default' branch taken. Execution contin=
ues on line 842
           switch (v) {
           ^
   drivers/ssb/main.c:842:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:904:8: note: Returning from 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:904:3: note: The value 0 is assigned to 'm3'
                   m3 =3D clkfactor_f6_resolve(m3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:906:3: note: Control jumps to 'case 1:'  at line 913
                   switch (mc) {
                   ^
   drivers/ssb/main.c:914:18: note: Division by zero
                           return (clock / (m1 * m2 * m3));
                                   ~~~~~~^~~~~~~~~~~~~~~~
   drivers/ssb/main.c:916:18: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                           return (clock / (m1 * m3));
                                   ~~~~~~^~~~~~~~~~~
   drivers/ssb/main.c:853:2: note: Control jumps to 'case 65536:'  at line =
858
           switch (plltype) {
           ^
   drivers/ssb/main.c:864:3: note:  Execution continues on line 877
                   break;
                   ^
   drivers/ssb/main.c:877:2: note: Control jumps to the 'default' case at l=
ine 882
           switch (plltype) {
           ^
   drivers/ssb/main.c:885:6: note: Assuming 'clock' is not equal to 0
           if (!clock)
               ^~~~~~
   drivers/ssb/main.c:885:2: note: Taking false branch
           if (!clock)
           ^
   drivers/ssb/main.c:893:2: note: Control jumps to 'case 65536:'  at line =
894
           switch (plltype) {
           ^
   drivers/ssb/main.c:898:8: note: Calling 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:828:2: note: 'Default' branch taken. Execution contin=
ues on line 842
           switch (v) {
           ^
   drivers/ssb/main.c:842:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:898:8: note: Returning from 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:898:3: note: The value 0 is assigned to 'm1'
                   m1 =3D clkfactor_f6_resolve(m1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:899:8: note: 'plltype' is equal to SSB_PLLTYPE_1
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                        ^~~~~~~
   drivers/ssb/main.c:899:34: note: Left side of '||' is true
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                                                  ^
   drivers/ssb/main.c:904:8: note: Calling 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:828:2: note: 'Default' branch taken. Execution contin=
ues on line 842
           switch (v) {
           ^
   drivers/ssb/main.c:842:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:904:8: note: Returning from 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:904:3: note: The value 0 is assigned to 'm3'
                   m3 =3D clkfactor_f6_resolve(m3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:906:3: note: Control jumps to 'case 17:'  at line 915
                   switch (mc) {
                   ^
   drivers/ssb/main.c:916:18: note: Division by zero
                           return (clock / (m1 * m3));
                                   ~~~~~~^~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   sound/soc/intel/atom/sst/sst_acpi.c:315:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(ctx->firmware_name, mach->fw_filename);
           ^~~~~~
   sound/soc/intel/atom/sst/sst_acpi.c:315:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(ctx->firmware_name, mach->fw_filename);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/virtio/virtio_ctl_msg.c:239:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&snd->ctl_msgs)) {

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
--===============8353458450870873858==--

