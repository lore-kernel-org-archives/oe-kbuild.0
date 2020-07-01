Content-Type: multipart/mixed; boundary="===============6915741546501874289=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-goldfish:android-3.18 9371/9999] drivers/net/ethernet/intel/i40e/i40e_main.c:1097:17: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Thu, 02 Jul 2020 07:05:50 +0800
Message-ID: <202007020743.4xRXTcX8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6915741546501874289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lee Jones <lee.jones@linaro.org>

tree:   https://android.googlesource.com/kernel/goldfish android-3.18
head:   3ed25d092507b3be51b5adfcda11b259407cf4ef
commit: 05560caa2c0d8a1cdf02080cf0779f0ecf6a2a80 [9371/9999] i40e: Workarou=
nd fix for mss < 256 issue
:::::: branch date: 32 hours ago
:::::: commit date: 8 weeks ago
compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:6516:6: note: Variable 'ret'=
 is reassigned a value before the old one has been used.
    ret =3D i40e_set_num_rings_in_vsi(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7826:6: warning: Variable 'r=
et' is reassigned a value before the old one has been used. 'break;' missin=
g? [redundantAssignInSwitch]
    ret =3D i40e_vsi_get_bw_info(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7641:0: note: Variable 'ret'=
 is reassigned a value before the old one has been used. 'break;' missing?
    int ret =3D -ENODEV;
   ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7826:6: note: Variable 'ret'=
 is reassigned a value before the old one has been used. 'break;' missing?
    ret =3D i40e_vsi_get_bw_info(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7826:6: warning: Variable 'r=
et' is reassigned a value before the old one has been used. 'break;' missin=
g? [redundantAssignInSwitch]
    ret =3D i40e_vsi_get_bw_info(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7705:9: note: Variable 'ret'=
 is reassigned a value before the old one has been used. 'break;' missing?
       ret =3D -ENOENT;
           ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7826:6: note: Variable 'ret'=
 is reassigned a value before the old one has been used. 'break;' missing?
    ret =3D i40e_vsi_get_bw_info(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7951:6: warning: Variable 'r=
et' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    ret =3D i40e_vsi_alloc_q_vectors(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7936:0: note: Variable 'ret'=
 is reassigned a value before the old one has been used.
    int ret =3D -ENOENT;
   ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:7951:6: note: Variable 'ret'=
 is reassigned a value before the old one has been used.
    ret =3D i40e_vsi_alloc_q_vectors(vsi);
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:8293:6: warning: Variable 'r=
et' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    ret =3D i;
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:8262:0: note: Variable 'ret'=
 is reassigned a value before the old one has been used.
    int ret =3D -ENOENT;
   ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:8293:6: note: Variable 'ret'=
 is reassigned a value before the old one has been used.
    ret =3D i;
        ^
>> drivers/net/ethernet/intel/i40e/i40e_main.c:1097:17: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
            (val & I40E_PRTPM_EEE_STAT_TX_LPI_STATUS_MASK) >>
                   ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:2823:2: warning: Shifting si=
gned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    wr32(hw, I40E_PFINT_DYN_CTL0, I40E_PFINT_DYN_CTL0_SW_ITR_INDX_MASK |
    ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:3104:14: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
        (icr0 & I40E_PFINT_ICR0_SWINT_MASK))
                ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:3672:7: warning: Shifting si=
gned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
         I40E_QINT_RQCTL_INTEVENT_MASK);
         ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:3687:7: warning: Shifting si=
gned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
         I40E_QINT_TQCTL_INTEVENT_MASK);
         ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:3710:5: warning: Shifting si=
gned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       I40E_QINT_RQCTL_INTEVENT_MASK);
       ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:3722:5: warning: Shifting si=
gned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       I40E_QINT_TQCTL_INTEVENT_MASK);
       ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:6180:12: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (reg & I40E_GL_MDET_TX_VALID_MASK) {
              ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:6196:12: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (reg & I40E_GL_MDET_RX_VALID_MASK) {
              ^
>> drivers/net/ethernet/intel/i40e/i40e_main.c:6297:29: warning: Same expre=
ssion in both branches of ternary operator. [duplicateExpressionTernary]
         ntohs(port), port ? i : i);
                               ^
>> drivers/net/ethernet/intel/i40e/i40e_main.c:9229:7: warning: Local varia=
ble val shadows outer variable [shadowVar]
     u32 val;
         ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:8958:6: note: Shadowed decla=
ration
    u32 val;
        ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:9229:7: note: Shadow variable
     u32 val;
         ^

git remote add android-goldfish https://android.googlesource.com/kernel/gol=
dfish
git remote update android-goldfish
git checkout 05560caa2c0d8a1cdf02080cf0779f0ecf6a2a80
vim +1097 drivers/net/ethernet/intel/i40e/i40e_main.c

7812fddc9cfbbdb Shannon Nelson      2014-04-23   897  =

7812fddc9cfbbdb Shannon Nelson      2014-04-23   898  /**
7812fddc9cfbbdb Shannon Nelson      2014-04-23   899   * i40e_update_pf_sta=
ts - Update the pf statistics counters.
7812fddc9cfbbdb Shannon Nelson      2014-04-23   900   * @pf: the PF to be =
updated
7812fddc9cfbbdb Shannon Nelson      2014-04-23   901   **/
7812fddc9cfbbdb Shannon Nelson      2014-04-23   902  static void i40e_upda=
te_pf_stats(struct i40e_pf *pf)
7812fddc9cfbbdb Shannon Nelson      2014-04-23   903  {
41c445ff0f482bb Jesse Brandeburg    2013-09-11   904  	struct i40e_hw_port_=
stats *osd =3D &pf->stats_offsets;
7812fddc9cfbbdb Shannon Nelson      2014-04-23   905  	struct i40e_hw_port_=
stats *nsd =3D &pf->stats;
7812fddc9cfbbdb Shannon Nelson      2014-04-23   906  	struct i40e_hw *hw =
=3D &pf->hw;
7812fddc9cfbbdb Shannon Nelson      2014-04-23   907  	u32 val;
7812fddc9cfbbdb Shannon Nelson      2014-04-23   908  	int i;
41c445ff0f482bb Jesse Brandeburg    2013-09-11   909  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   910  	i40e_stat_update48(h=
w, I40E_GLPRT_GORCH(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   911  			   I40E_GLPRT_GORC=
L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   912  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   913  			   &osd->eth.rx_by=
tes, &nsd->eth.rx_bytes);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   914  	i40e_stat_update48(h=
w, I40E_GLPRT_GOTCH(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   915  			   I40E_GLPRT_GOTC=
L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   916  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   917  			   &osd->eth.tx_by=
tes, &nsd->eth.tx_bytes);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   918  	i40e_stat_update32(h=
w, I40E_GLPRT_RDPC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   919  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   920  			   &osd->eth.rx_di=
scards,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   921  			   &nsd->eth.rx_di=
scards);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   922  	i40e_stat_update32(h=
w, I40E_GLPRT_TDPC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   923  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   924  			   &osd->eth.tx_di=
scards,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   925  			   &nsd->eth.tx_di=
scards);
532d283d590d6c0 Shannon Nelson      2014-04-23   926  =

532d283d590d6c0 Shannon Nelson      2014-04-23   927  	i40e_stat_update48(h=
w, I40E_GLPRT_UPRCH(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   928  			   I40E_GLPRT_UPRC=
L(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   929  			   pf->stat_offset=
s_loaded,
532d283d590d6c0 Shannon Nelson      2014-04-23   930  			   &osd->eth.rx_un=
icast,
532d283d590d6c0 Shannon Nelson      2014-04-23   931  			   &nsd->eth.rx_un=
icast);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   932  	i40e_stat_update48(h=
w, I40E_GLPRT_MPRCH(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   933  			   I40E_GLPRT_MPRC=
L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   934  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   935  			   &osd->eth.rx_mu=
lticast,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   936  			   &nsd->eth.rx_mu=
lticast);
532d283d590d6c0 Shannon Nelson      2014-04-23   937  	i40e_stat_update48(h=
w, I40E_GLPRT_BPRCH(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   938  			   I40E_GLPRT_BPRC=
L(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   939  			   pf->stat_offset=
s_loaded,
532d283d590d6c0 Shannon Nelson      2014-04-23   940  			   &osd->eth.rx_br=
oadcast,
532d283d590d6c0 Shannon Nelson      2014-04-23   941  			   &nsd->eth.rx_br=
oadcast);
532d283d590d6c0 Shannon Nelson      2014-04-23   942  	i40e_stat_update48(h=
w, I40E_GLPRT_UPTCH(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   943  			   I40E_GLPRT_UPTC=
L(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   944  			   pf->stat_offset=
s_loaded,
532d283d590d6c0 Shannon Nelson      2014-04-23   945  			   &osd->eth.tx_un=
icast,
532d283d590d6c0 Shannon Nelson      2014-04-23   946  			   &nsd->eth.tx_un=
icast);
532d283d590d6c0 Shannon Nelson      2014-04-23   947  	i40e_stat_update48(h=
w, I40E_GLPRT_MPTCH(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   948  			   I40E_GLPRT_MPTC=
L(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   949  			   pf->stat_offset=
s_loaded,
532d283d590d6c0 Shannon Nelson      2014-04-23   950  			   &osd->eth.tx_mu=
lticast,
532d283d590d6c0 Shannon Nelson      2014-04-23   951  			   &nsd->eth.tx_mu=
lticast);
532d283d590d6c0 Shannon Nelson      2014-04-23   952  	i40e_stat_update48(h=
w, I40E_GLPRT_BPTCH(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   953  			   I40E_GLPRT_BPTC=
L(hw->port),
532d283d590d6c0 Shannon Nelson      2014-04-23   954  			   pf->stat_offset=
s_loaded,
532d283d590d6c0 Shannon Nelson      2014-04-23   955  			   &osd->eth.tx_br=
oadcast,
532d283d590d6c0 Shannon Nelson      2014-04-23   956  			   &nsd->eth.tx_br=
oadcast);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   957  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   958  	i40e_stat_update32(h=
w, I40E_GLPRT_TDOLD(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   959  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   960  			   &osd->tx_droppe=
d_link_down,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   961  			   &nsd->tx_droppe=
d_link_down);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   962  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   963  	i40e_stat_update32(h=
w, I40E_GLPRT_CRCERRS(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   964  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   965  			   &osd->crc_error=
s, &nsd->crc_errors);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   966  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   967  	i40e_stat_update32(h=
w, I40E_GLPRT_ILLERRC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   968  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   969  			   &osd->illegal_b=
ytes, &nsd->illegal_bytes);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   970  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   971  	i40e_stat_update32(h=
w, I40E_GLPRT_MLFC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   972  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   973  			   &osd->mac_local=
_faults,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   974  			   &nsd->mac_local=
_faults);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   975  	i40e_stat_update32(h=
w, I40E_GLPRT_MRFC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   976  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   977  			   &osd->mac_remot=
e_faults,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   978  			   &nsd->mac_remot=
e_faults);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   979  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   980  	i40e_stat_update32(h=
w, I40E_GLPRT_RLEC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   981  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   982  			   &osd->rx_length=
_errors,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   983  			   &nsd->rx_length=
_errors);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   984  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   985  	i40e_stat_update32(h=
w, I40E_GLPRT_LXONRXC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   986  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   987  			   &osd->link_xon_=
rx, &nsd->link_xon_rx);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   988  	i40e_stat_update32(h=
w, I40E_GLPRT_LXONTXC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   989  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   990  			   &osd->link_xon_=
tx, &nsd->link_xon_tx);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   991  	i40e_update_prio_xof=
f_rx(pf);  /* handles I40E_GLPRT_LXOFFRXC */
41c445ff0f482bb Jesse Brandeburg    2013-09-11   992  	i40e_stat_update32(h=
w, I40E_GLPRT_LXOFFTXC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   993  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   994  			   &osd->link_xoff=
_tx, &nsd->link_xoff_tx);
41c445ff0f482bb Jesse Brandeburg    2013-09-11   995  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11   996  	for (i =3D 0; i < 8;=
 i++) {
41c445ff0f482bb Jesse Brandeburg    2013-09-11   997  		i40e_stat_update32(=
hw, I40E_GLPRT_PXONRXC(hw->port, i),
41c445ff0f482bb Jesse Brandeburg    2013-09-11   998  				   pf->stat_offse=
ts_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11   999  				   &osd->priority=
_xon_rx[i],
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1000  				   &nsd->priority=
_xon_rx[i]);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1001  		i40e_stat_update32(=
hw, I40E_GLPRT_PXONTXC(hw->port, i),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1002  				   pf->stat_offse=
ts_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1003  				   &osd->priority=
_xon_tx[i],
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1004  				   &nsd->priority=
_xon_tx[i]);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1005  		i40e_stat_update32(=
hw, I40E_GLPRT_PXOFFTXC(hw->port, i),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1006  				   pf->stat_offse=
ts_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1007  				   &osd->priority=
_xoff_tx[i],
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1008  				   &nsd->priority=
_xoff_tx[i]);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1009  		i40e_stat_update32(=
hw,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1010  				   I40E_GLPRT_RXO=
N2OFFCNT(hw->port, i),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1011  				   pf->stat_offse=
ts_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1012  				   &osd->priority=
_xon_2_xoff[i],
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1013  				   &nsd->priority=
_xon_2_xoff[i]);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1014  	}
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1015  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11  1016  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC64H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1017  			   I40E_GLPRT_PRC6=
4L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1018  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1019  			   &osd->rx_size_6=
4, &nsd->rx_size_64);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1020  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC127H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1021  			   I40E_GLPRT_PRC1=
27L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1022  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1023  			   &osd->rx_size_1=
27, &nsd->rx_size_127);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1024  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC255H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1025  			   I40E_GLPRT_PRC2=
55L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1026  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1027  			   &osd->rx_size_2=
55, &nsd->rx_size_255);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1028  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC511H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1029  			   I40E_GLPRT_PRC5=
11L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1030  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1031  			   &osd->rx_size_5=
11, &nsd->rx_size_511);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1032  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC1023H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1033  			   I40E_GLPRT_PRC1=
023L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1034  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1035  			   &osd->rx_size_1=
023, &nsd->rx_size_1023);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1036  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC1522H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1037  			   I40E_GLPRT_PRC1=
522L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1038  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1039  			   &osd->rx_size_1=
522, &nsd->rx_size_1522);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1040  	i40e_stat_update48(h=
w, I40E_GLPRT_PRC9522H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1041  			   I40E_GLPRT_PRC9=
522L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1042  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1043  			   &osd->rx_size_b=
ig, &nsd->rx_size_big);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1044  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11  1045  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC64H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1046  			   I40E_GLPRT_PTC6=
4L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1047  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1048  			   &osd->tx_size_6=
4, &nsd->tx_size_64);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1049  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC127H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1050  			   I40E_GLPRT_PTC1=
27L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1051  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1052  			   &osd->tx_size_1=
27, &nsd->tx_size_127);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1053  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC255H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1054  			   I40E_GLPRT_PTC2=
55L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1055  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1056  			   &osd->tx_size_2=
55, &nsd->tx_size_255);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1057  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC511H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1058  			   I40E_GLPRT_PTC5=
11L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1059  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1060  			   &osd->tx_size_5=
11, &nsd->tx_size_511);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1061  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC1023H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1062  			   I40E_GLPRT_PTC1=
023L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1063  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1064  			   &osd->tx_size_1=
023, &nsd->tx_size_1023);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1065  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC1522H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1066  			   I40E_GLPRT_PTC1=
522L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1067  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1068  			   &osd->tx_size_1=
522, &nsd->tx_size_1522);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1069  	i40e_stat_update48(h=
w, I40E_GLPRT_PTC9522H(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1070  			   I40E_GLPRT_PTC9=
522L(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1071  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1072  			   &osd->tx_size_b=
ig, &nsd->tx_size_big);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1073  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11  1074  	i40e_stat_update32(h=
w, I40E_GLPRT_RUC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1075  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1076  			   &osd->rx_unders=
ize, &nsd->rx_undersize);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1077  	i40e_stat_update32(h=
w, I40E_GLPRT_RFC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1078  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1079  			   &osd->rx_fragme=
nts, &nsd->rx_fragments);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1080  	i40e_stat_update32(h=
w, I40E_GLPRT_ROC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1081  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1082  			   &osd->rx_oversi=
ze, &nsd->rx_oversize);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1083  	i40e_stat_update32(h=
w, I40E_GLPRT_RJC(hw->port),
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1084  			   pf->stat_offset=
s_loaded,
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1085  			   &osd->rx_jabber=
, &nsd->rx_jabber);
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1086  =

433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1087  	/* FDIR stats */
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1088  	i40e_stat_update32(h=
w, I40E_GLQF_PCNT(pf->fd_atr_cnt_idx),
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1089  			   pf->stat_offset=
s_loaded,
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1090  			   &osd->fd_atr_ma=
tch, &nsd->fd_atr_match);
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1091  	i40e_stat_update32(h=
w, I40E_GLQF_PCNT(pf->fd_sb_cnt_idx),
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1092  			   pf->stat_offset=
s_loaded,
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1093  			   &osd->fd_sb_mat=
ch, &nsd->fd_sb_match);
433c47de1368cf0 Anjali Singhai Jain 2014-05-22  1094  =

bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1095  	val =3D rd32(hw, I40=
E_PRTPM_EEE_STAT);
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1096  	nsd->tx_lpi_status =
=3D
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06 @1097  		       (val & I40E_=
PRTPM_EEE_STAT_TX_LPI_STATUS_MASK) >>
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1098  			I40E_PRTPM_EEE_STA=
T_TX_LPI_STATUS_SHIFT;
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1099  	nsd->rx_lpi_status =
=3D
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1100  		       (val & I40E_=
PRTPM_EEE_STAT_RX_LPI_STATUS_MASK) >>
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1101  			I40E_PRTPM_EEE_STA=
T_RX_LPI_STATUS_SHIFT;
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1102  	i40e_stat_update32(h=
w, I40E_PRTPM_TLPIC,
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1103  			   pf->stat_offset=
s_loaded,
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1104  			   &osd->tx_lpi_co=
unt, &nsd->tx_lpi_count);
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1105  	i40e_stat_update32(h=
w, I40E_PRTPM_RLPIC,
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1106  			   pf->stat_offset=
s_loaded,
bee5af7e21939c5 Anjali Singhai Jain 2014-03-06  1107  			   &osd->rx_lpi_co=
unt, &nsd->rx_lpi_count);
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1108  =

41c445ff0f482bb Jesse Brandeburg    2013-09-11  1109  	pf->stat_offsets_loa=
ded =3D true;
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1110  }
41c445ff0f482bb Jesse Brandeburg    2013-09-11  1111  =


:::::: The code at line 1097 was first introduced by commit
:::::: bee5af7e21939c54538b8d1555b4c568e9fbd235 i40e/i40evf: Add EEE LPI st=
ats

:::::: TO: Anjali Singhai Jain <anjali.singhai@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6915741546501874289==--

