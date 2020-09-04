Content-Type: multipart/mixed; boundary="===============8912598964768534035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.c:11880:5: warning: Variable 'rc' is reassigned a value before the old one has been used.
Date: Sat, 05 Sep 2020 05:36:19 +0800
Message-ID: <202009050514.Dri6MeDL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8912598964768534035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vasundhara Volam <vasundhara-v.volam@broadcom.com>
CC: Michael Chan <michael.chan@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59126901f200f5fc907153468b03c64e0081b6e6
commit: b014232f7f56f6db10b8540b0b97ae8c7eeef28e bnxt_en: Rename switch_id =
to dsn
date:   7 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/net/ethernet/broadcom/bnxt/bnxt.c:7862:9: warning: Identical con=
dition 'rc', second condition is always false [identicalConditionAfterEarly=
Exit]
    return rc;
           ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:7854:6: note: first condition
    if (rc)
        ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:7862:9: note: second condition
    return rc;
           ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9679:18: warning: Variable 'of=
f' is reassigned a value before the old one has been used. [redundantAssign=
ment]
    for (i =3D 1, off =3D 0; i < vnic->uc_filter_count; i++, off +=3D ETH_A=
LEN) {
                    ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9673:8: note: Variable 'off' i=
s reassigned a value before the old one has been used.
      off +=3D ETH_ALEN;
          ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9679:18: note: Variable 'off' =
is reassigned a value before the old one has been used.
    for (i =3D 1, off =3D 0; i < vnic->uc_filter_count; i++, off +=3D ETH_A=
LEN) {
                    ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:11880:5: warning: Variable 'rc=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
    rc =3D bnxt_probe_phy(bp, true);
       ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11873:6: note: Variable 'rc' i=
s reassigned a value before the old one has been used.
     rc =3D bnxt_pcie_dsn_get(bp, bp->dsn);
        ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11880:5: note: Variable 'rc' i=
s reassigned a value before the old one has been used.
    rc =3D bnxt_probe_phy(bp, true);
       ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:4444:7: warning: Local variabl=
e i shadows outer variable [shadowVar]
     int i;
         ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:4418:10: note: Shadowed declar=
ation
    int rc, i;
            ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:4444:7: note: Shadow variable
     int i;
         ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:7897:7: warning: Local variabl=
e i shadows outer variable [shadowVar]
     int i, off, count;
         ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:7893:11: note: Shadowed declar=
ation
    int tcs, i;
             ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:7897:7: note: Shadow variable
     int i, off, count;
         ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:970:7: warning: Local =
variable i shadows outer variable [shadowVar]
     int i;
         ^
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:930:6: note: Shadowed =
declaration
    int i, rc =3D -EINVAL;
        ^
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:970:7: note: Shadow va=
riable
     int i;
         ^
--
>> drivers/net/ethernet/broadcom/tg3.c:4559:7: warning: Variable 'err' is r=
eassigned a value before the old one has been used. 'break;' missing? [redu=
ndantAssignInSwitch]
     err =3D 0;
         ^
   drivers/net/ethernet/broadcom/tg3.c:4527:7: note: Variable 'err' is reas=
signed a value before the old one has been used. 'break;' missing?
     err =3D -EIO;
         ^
   drivers/net/ethernet/broadcom/tg3.c:4559:7: note: Variable 'err' is reas=
signed a value before the old one has been used. 'break;' missing?
     err =3D 0;
         ^
>> drivers/net/ethernet/broadcom/tg3.c:5766:19: warning: Variable 'current_=
link_up' is reassigned a value before the old one has been used. [redundant=
Assignment]
     current_link_up =3D tg3_setup_fiber_hw_autoneg(tp, mac_status);
                     ^
   drivers/net/ethernet/broadcom/tg3.c:5761:18: note: Variable 'current_lin=
k_up' is reassigned a value before the old one has been used.
    current_link_up =3D false;
                    ^
   drivers/net/ethernet/broadcom/tg3.c:5766:19: note: Variable 'current_lin=
k_up' is reassigned a value before the old one has been used.
     current_link_up =3D tg3_setup_fiber_hw_autoneg(tp, mac_status);
                     ^
>> drivers/net/ethernet/broadcom/tg3.c:13015:6: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
    err =3D -EIO;
        ^
   drivers/net/ethernet/broadcom/tg3.c:12936:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D -EIO;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13015:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D -EIO;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13011:7: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   drivers/net/ethernet/broadcom/tg3.c:13002:7: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
     err =3D -EIO;
         ^
   drivers/net/ethernet/broadcom/tg3.c:13011:7: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
     err =3D 0;
         ^
   drivers/net/ethernet/broadcom/tg3.c:13058:6: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13015:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D -EIO;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13058:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D 0;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13625:6: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13447:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D -EIO;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13625:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D 0;
        ^
   drivers/net/ethernet/broadcom/tg3.c:13660:6: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
    err =3D tg3_reset_hw(tp, true);
        ^
   drivers/net/ethernet/broadcom/tg3.c:13642:0: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    int err =3D -EIO;
   ^
   drivers/net/ethernet/broadcom/tg3.c:13660:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D tg3_reset_hw(tp, true);
        ^
>> drivers/net/ethernet/broadcom/tg3.c:6220:3: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     tw32(TG3_EAV_REF_CLK_CORRECT_CTL,
     ^
   drivers/net/ethernet/broadcom/tg3.c:6315:4: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      tw32(TG3_EAV_WATCHDOG0_MSB,
      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db014232f7f56f6db10b8540b0b97ae8c7eeef28e
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout b014232f7f56f6db10b8540b0b97ae8c7eeef28e
vim +/rc +11880 drivers/net/ethernet/broadcom/bnxt/bnxt.c

03213a996531e50 Jiri Pirko          2019-04-03  11764  =

c0c050c58d84099 Michael Chan        2015-10-22  11765  static int bnxt_init=
_one(struct pci_dev *pdev, const struct pci_device_id *ent)
c0c050c58d84099 Michael Chan        2015-10-22  11766  {
c0c050c58d84099 Michael Chan        2015-10-22  11767  	static int version_=
printed;
c0c050c58d84099 Michael Chan        2015-10-22  11768  	struct net_device *=
dev;
c0c050c58d84099 Michael Chan        2015-10-22  11769  	struct bnxt *bp;
6e6c5a57fbe1c77 Michael Chan        2016-01-02  11770  	int rc, max_irqs;
c0c050c58d84099 Michael Chan        2015-10-22  11771  =

4e00338a61998de Ray Jui             2017-02-20  11772  	if (pci_is_bridge(p=
dev))
fa853dda19a1878 Prashant Sreedharan 2016-07-18  11773  		return -ENODEV;
fa853dda19a1878 Prashant Sreedharan 2016-07-18  11774  =

c0c050c58d84099 Michael Chan        2015-10-22  11775  	if (version_printed=
++ =3D=3D 0)
c0c050c58d84099 Michael Chan        2015-10-22  11776  		pr_info("%s", vers=
ion);
c0c050c58d84099 Michael Chan        2015-10-22  11777  =

c0c050c58d84099 Michael Chan        2015-10-22  11778  	max_irqs =3D bnxt_g=
et_max_irq(pdev);
c0c050c58d84099 Michael Chan        2015-10-22  11779  	dev =3D alloc_ether=
dev_mq(sizeof(*bp), max_irqs);
c0c050c58d84099 Michael Chan        2015-10-22  11780  	if (!dev)
c0c050c58d84099 Michael Chan        2015-10-22  11781  		return -ENOMEM;
c0c050c58d84099 Michael Chan        2015-10-22  11782  =

c0c050c58d84099 Michael Chan        2015-10-22  11783  	bp =3D netdev_priv(=
dev);
9c1fabdf424f273 Michael Chan        2018-10-14  11784  	bnxt_set_max_func_i=
rqs(bp, max_irqs);
c0c050c58d84099 Michael Chan        2015-10-22  11785  =

c0c050c58d84099 Michael Chan        2015-10-22  11786  	if (bnxt_vf_pciid(e=
nt->driver_data))
c0c050c58d84099 Michael Chan        2015-10-22  11787  		bp->flags |=3D BNX=
T_FLAG_VF;
c0c050c58d84099 Michael Chan        2015-10-22  11788  =

2bcfa6f6e7cf867 Michael Chan        2015-12-27  11789  	if (pdev->msix_cap)
c0c050c58d84099 Michael Chan        2015-10-22  11790  		bp->flags |=3D BNX=
T_FLAG_MSIX_CAP;
c0c050c58d84099 Michael Chan        2015-10-22  11791  =

c0c050c58d84099 Michael Chan        2015-10-22  11792  	rc =3D bnxt_init_bo=
ard(pdev, dev);
c0c050c58d84099 Michael Chan        2015-10-22  11793  	if (rc < 0)
c0c050c58d84099 Michael Chan        2015-10-22  11794  		goto init_err_free;
c0c050c58d84099 Michael Chan        2015-10-22  11795  =

c0c050c58d84099 Michael Chan        2015-10-22  11796  	dev->netdev_ops =3D=
 &bnxt_netdev_ops;
c0c050c58d84099 Michael Chan        2015-10-22  11797  	dev->watchdog_timeo=
 =3D BNXT_TX_TIMEOUT;
c0c050c58d84099 Michael Chan        2015-10-22  11798  	dev->ethtool_ops =
=3D &bnxt_ethtool_ops;
c0c050c58d84099 Michael Chan        2015-10-22  11799  	pci_set_drvdata(pde=
v, dev);
c0c050c58d84099 Michael Chan        2015-10-22  11800  =

3e8060fa837630f Prashant Sreedharan 2016-07-18  11801  	rc =3D bnxt_alloc_h=
wrm_resources(bp);
3e8060fa837630f Prashant Sreedharan 2016-07-18  11802  	if (rc)
17086399c113d93 Sathya Perla        2017-02-20  11803  		goto init_err_pci_=
clean;
3e8060fa837630f Prashant Sreedharan 2016-07-18  11804  =

3e8060fa837630f Prashant Sreedharan 2016-07-18  11805  	mutex_init(&bp->hwr=
m_cmd_lock);
ba642ab773db97c Michael Chan        2019-08-29  11806  	mutex_init(&bp->lin=
k_lock);
3e8060fa837630f Prashant Sreedharan 2016-07-18  11807  =

7c3809181468a21 Michael Chan        2019-07-29  11808  	rc =3D bnxt_fw_init=
_one_p1(bp);
e605db801bdeb9d Deepak Khungar      2017-05-29  11809  	if (rc)
e605db801bdeb9d Deepak Khungar      2017-05-29  11810  		goto init_err_pci_=
clean;
e605db801bdeb9d Deepak Khungar      2017-05-29  11811  =

e38287b72ec5455 Michael Chan        2018-10-14  11812  	if (BNXT_CHIP_P5(bp=
))
e38287b72ec5455 Michael Chan        2018-10-14  11813  		bp->flags |=3D BNX=
T_FLAG_CHIP_P5;
e38287b72ec5455 Michael Chan        2018-10-14  11814  =

7c3809181468a21 Michael Chan        2019-07-29  11815  	rc =3D bnxt_fw_init=
_one_p2(bp);
3c2217a675bac22 Michael Chan        2017-03-08  11816  	if (rc)
3c2217a675bac22 Michael Chan        2017-03-08  11817  		goto init_err_pci_=
clean;
3c2217a675bac22 Michael Chan        2017-03-08  11818  =

c0c050c58d84099 Michael Chan        2015-10-22  11819  	dev->hw_features =
=3D NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM | NETIF_F_SG |
c0c050c58d84099 Michael Chan        2015-10-22  11820  			   NETIF_F_TSO | =
NETIF_F_TSO6 |
c0c050c58d84099 Michael Chan        2015-10-22  11821  			   NETIF_F_GSO_UD=
P_TUNNEL | NETIF_F_GSO_GRE |
7e13318daa4a67b Tom Herbert         2016-05-18  11822  			   NETIF_F_GSO_IP=
XIP4 |
152971ee75fddbc Alexander Duyck     2016-05-02  11823  			   NETIF_F_GSO_UD=
P_TUNNEL_CSUM | NETIF_F_GSO_GRE_CSUM |
152971ee75fddbc Alexander Duyck     2016-05-02  11824  			   NETIF_F_GSO_PA=
RTIAL | NETIF_F_RXHASH |
3e8060fa837630f Prashant Sreedharan 2016-07-18  11825  			   NETIF_F_RXCSUM=
 | NETIF_F_GRO;
3e8060fa837630f Prashant Sreedharan 2016-07-18  11826  =

e38287b72ec5455 Michael Chan        2018-10-14  11827  	if (BNXT_SUPPORTS_T=
PA(bp))
3e8060fa837630f Prashant Sreedharan 2016-07-18  11828  		dev->hw_features |=
=3D NETIF_F_LRO;
c0c050c58d84099 Michael Chan        2015-10-22  11829  =

c0c050c58d84099 Michael Chan        2015-10-22  11830  	dev->hw_enc_feature=
s =3D
c0c050c58d84099 Michael Chan        2015-10-22  11831  			NETIF_F_IP_CSUM |=
 NETIF_F_IPV6_CSUM | NETIF_F_SG |
c0c050c58d84099 Michael Chan        2015-10-22  11832  			NETIF_F_TSO | NET=
IF_F_TSO6 |
c0c050c58d84099 Michael Chan        2015-10-22  11833  			NETIF_F_GSO_UDP_T=
UNNEL | NETIF_F_GSO_GRE |
152971ee75fddbc Alexander Duyck     2016-05-02  11834  			NETIF_F_GSO_UDP_T=
UNNEL_CSUM | NETIF_F_GSO_GRE_CSUM |
7e13318daa4a67b Tom Herbert         2016-05-18  11835  			NETIF_F_GSO_IPXIP=
4 | NETIF_F_GSO_PARTIAL;
152971ee75fddbc Alexander Duyck     2016-05-02  11836  	dev->gso_partial_fe=
atures =3D NETIF_F_GSO_UDP_TUNNEL_CSUM |
152971ee75fddbc Alexander Duyck     2016-05-02  11837  				    NETIF_F_GSO_=
GRE_CSUM;
c0c050c58d84099 Michael Chan        2015-10-22  11838  	dev->vlan_features =
=3D dev->hw_features | NETIF_F_HIGHDMA;
c0c050c58d84099 Michael Chan        2015-10-22  11839  	dev->hw_features |=
=3D NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX |
c0c050c58d84099 Michael Chan        2015-10-22  11840  			    NETIF_F_HW_VL=
AN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX;
e38287b72ec5455 Michael Chan        2018-10-14  11841  	if (BNXT_SUPPORTS_T=
PA(bp))
1054aee82321483 Michael Chan        2017-12-16  11842  		dev->hw_features |=
=3D NETIF_F_GRO_HW;
c0c050c58d84099 Michael Chan        2015-10-22  11843  	dev->features |=3D =
dev->hw_features | NETIF_F_HIGHDMA;
1054aee82321483 Michael Chan        2017-12-16  11844  	if (dev->features &=
 NETIF_F_GRO_HW)
1054aee82321483 Michael Chan        2017-12-16  11845  		dev->features &=3D=
 ~NETIF_F_LRO;
c0c050c58d84099 Michael Chan        2015-10-22  11846  	dev->priv_flags |=
=3D IFF_UNICAST_FLT;
c0c050c58d84099 Michael Chan        2015-10-22  11847  =

c0c050c58d84099 Michael Chan        2015-10-22  11848  #ifdef CONFIG_BNXT_S=
RIOV
c0c050c58d84099 Michael Chan        2015-10-22  11849  	init_waitqueue_head=
(&bp->sriov_cfg_wait);
4ab0c6a8ffd7d25 Sathya Perla        2017-07-24  11850  	mutex_init(&bp->sri=
ov_lock);
c0c050c58d84099 Michael Chan        2015-10-22  11851  #endif
e38287b72ec5455 Michael Chan        2018-10-14  11852  	if (BNXT_SUPPORTS_T=
PA(bp)) {
309369c9b3f6a86 Michael Chan        2016-06-13  11853  		bp->gro_func =3D b=
nxt_gro_func_5730x;
67912c366d4bb0a Michael Chan        2019-07-29  11854  		if (BNXT_CHIP_P4(b=
p))
94758f8de037cf5 Michael Chan        2016-06-13  11855  			bp->gro_func =3D =
bnxt_gro_func_5731x;
67912c366d4bb0a Michael Chan        2019-07-29  11856  		else if (BNXT_CHIP=
_P5(bp))
67912c366d4bb0a Michael Chan        2019-07-29  11857  			bp->gro_func =3D =
bnxt_gro_func_5750x;
e38287b72ec5455 Michael Chan        2018-10-14  11858  	}
e38287b72ec5455 Michael Chan        2018-10-14  11859  	if (!BNXT_CHIP_P4_P=
LUS(bp))
434c975a8fe2f70 Michael Chan        2017-05-29  11860  		bp->flags |=3D BNX=
T_FLAG_DOUBLE_DB;
309369c9b3f6a86 Michael Chan        2016-06-13  11861  =

a588e4580a7ecb7 Michael Chan        2016-12-07  11862  	bp->ulp_probe =3D b=
nxt_ulp_probe;
a588e4580a7ecb7 Michael Chan        2016-12-07  11863  =

a22a6ac2ff8080c Michael Chan        2017-08-23  11864  	rc =3D bnxt_init_ma=
c_addr(bp);
a22a6ac2ff8080c Michael Chan        2017-08-23  11865  	if (rc) {
a22a6ac2ff8080c Michael Chan        2017-08-23  11866  		dev_err(&pdev->dev=
, "Unable to initialize mac address.\n");
a22a6ac2ff8080c Michael Chan        2017-08-23  11867  		rc =3D -EADDRNOTAV=
AIL;
a22a6ac2ff8080c Michael Chan        2017-08-23  11868  		goto init_err_pci_=
clean;
a22a6ac2ff8080c Michael Chan        2017-08-23  11869  	}
c0c050c58d84099 Michael Chan        2015-10-22  11870  =

2e9217d1e8b72dd Vasundhara Volam    2019-05-22  11871  	if (BNXT_PF(bp)) {
03213a996531e50 Jiri Pirko          2019-04-03  11872  		/* Read the adapte=
r's DSN to use as the eswitch switch_id */
b014232f7f56f6d Vasundhara Volam    2020-01-27  11873  		rc =3D bnxt_pcie_d=
sn_get(bp, bp->dsn);
2e9217d1e8b72dd Vasundhara Volam    2019-05-22  11874  	}
567b2abe6855178 Satish Baddipadige  2016-06-13  11875  =

7eb9bb3a0c7c297 Michael Chan        2017-10-26  11876  	/* MTU range: 60 - =
FW defined max */
7eb9bb3a0c7c297 Michael Chan        2017-10-26  11877  	dev->min_mtu =3D ET=
H_ZLEN;
7eb9bb3a0c7c297 Michael Chan        2017-10-26  11878  	dev->max_mtu =3D bp=
->max_mtu;
7eb9bb3a0c7c297 Michael Chan        2017-10-26  11879  =

ba642ab773db97c Michael Chan        2019-08-29 @11880  	rc =3D bnxt_probe_p=
hy(bp, true);
d5430d31ca72ec3 Michael Chan        2017-08-28  11881  	if (rc)
d5430d31ca72ec3 Michael Chan        2017-08-28  11882  		goto init_err_pci_=
clean;
d5430d31ca72ec3 Michael Chan        2017-08-28  11883  =

c61fb99cae51958 Michael Chan        2017-02-06  11884  	bnxt_set_rx_skb_mod=
e(bp, false);
c0c050c58d84099 Michael Chan        2015-10-22  11885  	bnxt_set_tpa_flags(=
bp);
c0c050c58d84099 Michael Chan        2015-10-22  11886  	bnxt_set_ring_param=
s(bp);
702c221ca64060b Michael Chan        2017-05-29  11887  	rc =3D bnxt_set_dfl=
t_rings(bp, true);
bdbd1eb59c565c5 Michael Chan        2016-12-29  11888  	if (rc) {
bdbd1eb59c565c5 Michael Chan        2016-12-29  11889  		netdev_err(bp->dev=
, "Not enough rings available.\n");
bdbd1eb59c565c5 Michael Chan        2016-12-29  11890  		rc =3D -ENOMEM;
17086399c113d93 Sathya Perla        2017-02-20  11891  		goto init_err_pci_=
clean;
bdbd1eb59c565c5 Michael Chan        2016-12-29  11892  	}
c0c050c58d84099 Michael Chan        2015-10-22  11893  =

ba642ab773db97c Michael Chan        2019-08-29  11894  	bnxt_fw_init_one_p3=
(bp);
2bcfa6f6e7cf867 Michael Chan        2015-12-27  11895  =

c0c050c58d84099 Michael Chan        2015-10-22  11896  	if (dev->hw_feature=
s & NETIF_F_HW_VLAN_CTAG_RX)
c0c050c58d84099 Michael Chan        2015-10-22  11897  		bp->flags |=3D BNX=
T_FLAG_STRIP_VLAN;
c0c050c58d84099 Michael Chan        2015-10-22  11898  =

7809592d3e2ec79 Michael Chan        2016-12-07  11899  	rc =3D bnxt_init_in=
t_mode(bp);
c0c050c58d84099 Michael Chan        2015-10-22  11900  	if (rc)
17086399c113d93 Sathya Perla        2017-02-20  11901  		goto init_err_pci_=
clean;
c0c050c58d84099 Michael Chan        2015-10-22  11902  =

832aed16ce7af2a Michael Chan        2018-03-09  11903  	/* No TC has been s=
et yet and rings may have been trimmed due to
832aed16ce7af2a Michael Chan        2018-03-09  11904  	 * limited MSIX, so=
 we re-initialize the TX rings per TC.
832aed16ce7af2a Michael Chan        2018-03-09  11905  	 */
832aed16ce7af2a Michael Chan        2018-03-09  11906  	bp->tx_nr_rings_per=
_tc =3D bp->tx_nr_rings;
832aed16ce7af2a Michael Chan        2018-03-09  11907  =

c213eae8d3cd4c0 Michael Chan        2017-10-13  11908  	if (BNXT_PF(bp)) {
c213eae8d3cd4c0 Michael Chan        2017-10-13  11909  		if (!bnxt_pf_wq) {
c213eae8d3cd4c0 Michael Chan        2017-10-13  11910  			bnxt_pf_wq =3D
c213eae8d3cd4c0 Michael Chan        2017-10-13  11911  				create_singlethr=
ead_workqueue("bnxt_pf_wq");
c213eae8d3cd4c0 Michael Chan        2017-10-13  11912  			if (!bnxt_pf_wq) {
c213eae8d3cd4c0 Michael Chan        2017-10-13  11913  				dev_err(&pdev->d=
ev, "Unable to create workqueue.\n");
c213eae8d3cd4c0 Michael Chan        2017-10-13  11914  				goto init_err_pc=
i_clean;
c213eae8d3cd4c0 Michael Chan        2017-10-13  11915  			}
c213eae8d3cd4c0 Michael Chan        2017-10-13  11916  		}
2ae7408fedfee97 Sathya Perla        2017-08-28  11917  		bnxt_init_tc(bp);
c213eae8d3cd4c0 Michael Chan        2017-10-13  11918  	}
2ae7408fedfee97 Sathya Perla        2017-08-28  11919  =

cda2cab07711839 Vasundhara Volam    2020-01-27  11920  	bnxt_dl_register(bp=
);
cda2cab07711839 Vasundhara Volam    2020-01-27  11921  =

7809592d3e2ec79 Michael Chan        2016-12-07  11922  	rc =3D register_net=
dev(dev);
7809592d3e2ec79 Michael Chan        2016-12-07  11923  	if (rc)
cda2cab07711839 Vasundhara Volam    2020-01-27  11924  		goto init_err_clea=
nup;
7809592d3e2ec79 Michael Chan        2016-12-07  11925  =

cda2cab07711839 Vasundhara Volam    2020-01-27  11926  	if (BNXT_PF(bp))
cda2cab07711839 Vasundhara Volam    2020-01-27  11927  		devlink_port_type_=
eth_set(&bp->dl_port, bp->dev);
937f188c1f4f89b Vasundhara Volam    2019-12-10  11928  	bnxt_dl_fw_reporter=
s_create(bp);
4ab0c6a8ffd7d25 Sathya Perla        2017-07-24  11929  =

c0c050c58d84099 Michael Chan        2015-10-22  11930  	netdev_info(dev, "%=
s found at mem %lx, node addr %pM\n",
c0c050c58d84099 Michael Chan        2015-10-22  11931  		    board_info[ent=
->driver_data].name,
c0c050c58d84099 Michael Chan        2015-10-22  11932  		    (long)pci_reso=
urce_start(pdev, 0), dev->dev_addr);
af125b754e2f09e Bjorn Helgaas       2018-03-30  11933  	pcie_print_link_sta=
tus(pdev);
90c4f788f6c08aa Ajit Khaparde       2016-05-15  11934  =

c0c050c58d84099 Michael Chan        2015-10-22  11935  	return 0;
c0c050c58d84099 Michael Chan        2015-10-22  11936  =

cda2cab07711839 Vasundhara Volam    2020-01-27  11937  init_err_cleanup:
cda2cab07711839 Vasundhara Volam    2020-01-27  11938  	bnxt_dl_unregister(=
bp);
2ae7408fedfee97 Sathya Perla        2017-08-28  11939  	bnxt_shutdown_tc(bp=
);
7809592d3e2ec79 Michael Chan        2016-12-07  11940  	bnxt_clear_int_mode=
(bp);
7809592d3e2ec79 Michael Chan        2016-12-07  11941  =

17086399c113d93 Sathya Perla        2017-02-20  11942  init_err_pci_clean:
bdb3860236b3ec8 Vasundhara Volam    2019-11-23  11943  	bnxt_hwrm_func_drv_=
unrgtr(bp);
f9099d611449836 Vasundhara Volam    2019-04-25  11944  	bnxt_free_hwrm_shor=
t_cmd_req(bp);
a2bf74f4e1b8239 Venkat Duvvuru      2018-10-05  11945  	bnxt_free_hwrm_reso=
urces(bp);
98f04cf0f1fc26e Michael Chan        2018-10-14  11946  	bnxt_free_ctx_mem(b=
p);
98f04cf0f1fc26e Michael Chan        2018-10-14  11947  	kfree(bp->ctx);
98f04cf0f1fc26e Michael Chan        2018-10-14  11948  	bp->ctx =3D NULL;
07f83d72d238f5d Michael Chan        2019-08-29  11949  	kfree(bp->fw_health=
);
07f83d72d238f5d Michael Chan        2019-08-29  11950  	bp->fw_health =3D N=
ULL;
17086399c113d93 Sathya Perla        2017-02-20  11951  	bnxt_cleanup_pci(bp=
);
c0c050c58d84099 Michael Chan        2015-10-22  11952  =

c0c050c58d84099 Michael Chan        2015-10-22  11953  init_err_free:
c0c050c58d84099 Michael Chan        2015-10-22  11954  	free_netdev(dev);
c0c050c58d84099 Michael Chan        2015-10-22  11955  	return rc;
c0c050c58d84099 Michael Chan        2015-10-22  11956  }
c0c050c58d84099 Michael Chan        2015-10-22  11957  =


:::::: The code at line 11880 was first introduced by commit
:::::: ba642ab773db97c32293547485f562d2dfc06666 bnxt_en: Prepare bnxt_init_=
one() to be called multiple times.

:::::: TO: Michael Chan <michael.chan@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8912598964768534035==--

