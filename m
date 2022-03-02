Content-Type: multipart/mixed; boundary="===============0985973320678978257=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4154/9592] drivers/net/ethernet/intel/ice/ice_vf_vsi_vlan_ops.c:115:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 02 Mar 2022 13:34:38 +0800
Message-ID: <202203021353.2Ef6lCCa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0985973320678978257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Brett Creeley <brett.creeley@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e6ada6df471f847da3b09b357e246c62335bc0bb
commit: cc71de8fa13395d106ad8c542eadabe13315d081 [4154/9592] ice: Add suppo=
rt for VIRTCHNL_VF_OFFLOAD_VLAN_V2
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220301 (https://download.01.org/0day-ci/arc=
hive/20220302/202203021353.2Ef6lCCa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dcc71de8fa13395d106ad8c542eadabe13315d081
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cc71de8fa13395d106ad8c542eadabe13315d081
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^    ~
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:657:4: warning: Value sto=
red to 'hi' is never read [clang-analyzer-deadcode.DeadStores]
                           hi =3D t4_read_reg(padap, LE_DB_TID_HASHBASE_A) =
/ 4;
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:657:4: note: Value stored=
 to 'hi' is never read
                           hi =3D t4_read_reg(padap, LE_DB_TID_HASHBASE_A) =
/ 4;
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:660:4: warning: Value sto=
red to 'hi' is never read [clang-analyzer-deadcode.DeadStores]
                           hi =3D t4_read_reg(padap, LE_DB_HASH_TID_BASE_A);
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:660:4: note: Value stored=
 to 'hi' is never read
                           hi =3D t4_read_reg(padap, LE_DB_HASH_TID_BASE_A);
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3598:2: warning: Undefine=
d or garbage value returned to caller [clang-analyzer-core.uninitialized.Un=
defReturn]
           return rc;
           ^      ~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3572:2: note: 'rc' declar=
ed without an initial value
           int rc;
           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3576:14: note: Assuming '=
i' is >=3D 'count'
           for (i =3D 0; i < count; i +=3D SF_PAGE_SIZE) {
                       ^~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3576:2: note: Loop condit=
ion is false. Execution continues on line 3598
           for (i =3D 0; i < count; i +=3D SF_PAGE_SIZE) {
           ^
   drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3598:2: note: Undefined o=
r garbage value returned to caller
           return rc;
           ^      ~~
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/net/ethernet/qualcomm/emac/emac-ethtool.c:98:3: warning: Call to=
 function 'strcpy' is insecure as it does not provide bounding of the memor=
y buffer. Replace unbounded copy functions with analogous functions that su=
pport length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.=
insecureAPI.strcpy]
                   strcpy(data, "single-pause-mode");
                   ^~~~~~
   drivers/net/ethernet/qualcomm/emac/emac-ethtool.c:98:3: note: Call to fu=
nction 'strcpy' is insecure as it does not provide bounding of the memory b=
uffer. Replace unbounded copy functions with analogous functions that suppo=
rt length arguments such as 'strlcpy'. CWE-119
                   strcpy(data, "single-pause-mode");
                   ^~~~~~
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (8 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/net/ethernet/intel/ice/ice_vf_vsi_vlan_ops.c:115:17: warning: Va=
lue stored to 'dev' during its initialization is never read [clang-analyzer=
-deadcode.DeadStores]
           struct device *dev =3D ice_pf_to_dev(vf->pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_vf_vsi_vlan_ops.c:115:17: note: Value=
 stored to 'dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(vf->pf);
                          ^~~
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:1360:2: warning: Value =
stored to 'dev' is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D ice_pf_to_dev(pf);
           ^
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:1360:2: note: Value sto=
red to 'dev' is never read
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/net/ethernet/jme.c:446:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "Forced: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:446:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "Forced: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:464:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "ANed: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:464:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "ANed: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:483:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "10 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:483:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "10 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:487:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "100 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:487:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "100 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:491:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "1000 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:491:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "1000 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:534:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(linkmsg, (phylink & PHY_LINK_DUPLEX) ?
                   ^~~~~~
   drivers/net/ethernet/jme.c:534:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(linkmsg, (phylink & PHY_LINK_DUPLEX) ?
                   ^~~~~~
   drivers/net/ethernet/jme.c:537:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(linkmsg, (phylink & PHY_LINK_MDI_STAT) ?
                   ^~~~~~
   drivers/net/ethernet/jme.c:537:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(linkmsg, (phylink & PHY_LINK_MDI_STAT) ?
                   ^~~~~~
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/media/v4l2-core/v4l2-dev.c:1053:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-dev.c:1053:2: note: Value stored to 'ret' i=
s never read

vim +/dev +115 drivers/net/ethernet/intel/ice/ice_vf_vsi_vlan_ops.c

cc71de8fa13395d Brett Creeley 2021-12-02   98  =

cc71de8fa13395d Brett Creeley 2021-12-02   99  /**
cc71de8fa13395d Brett Creeley 2021-12-02  100   * ice_vf_vsi_cfg_dvm_legacy=
_vlan_mode - Config VLAN mode for old VFs in DVM
cc71de8fa13395d Brett Creeley 2021-12-02  101   * @vsi: VF's VSI being conf=
igured
cc71de8fa13395d Brett Creeley 2021-12-02  102   *
cc71de8fa13395d Brett Creeley 2021-12-02  103   * This should only be calle=
d when Double VLAN Mode (DVM) is enabled, there
cc71de8fa13395d Brett Creeley 2021-12-02  104   * is not a port VLAN enable=
d on this VF, and the VF negotiates
cc71de8fa13395d Brett Creeley 2021-12-02  105   * VIRTCHNL_VF_OFFLOAD_VLAN.
cc71de8fa13395d Brett Creeley 2021-12-02  106   *
cc71de8fa13395d Brett Creeley 2021-12-02  107   * This function sets up the=
 VF VSI's inner and outer ice_vsi_vlan_ops and also
cc71de8fa13395d Brett Creeley 2021-12-02  108   * initializes software only=
 VLAN mode (i.e. allow all VLANs). Also, use no-op
cc71de8fa13395d Brett Creeley 2021-12-02  109   * implementations for any f=
unctions that may be called during the lifetime of
cc71de8fa13395d Brett Creeley 2021-12-02  110   * the VF so these methods d=
o nothing and succeed.
cc71de8fa13395d Brett Creeley 2021-12-02  111   */
cc71de8fa13395d Brett Creeley 2021-12-02  112  void ice_vf_vsi_cfg_dvm_lega=
cy_vlan_mode(struct ice_vsi *vsi)
cc71de8fa13395d Brett Creeley 2021-12-02  113  {
cc71de8fa13395d Brett Creeley 2021-12-02  114  	struct ice_vf *vf =3D &vsi-=
>back->vf[vsi->vf_id];
cc71de8fa13395d Brett Creeley 2021-12-02 @115  	struct device *dev =3D ice_=
pf_to_dev(vf->pf);
cc71de8fa13395d Brett Creeley 2021-12-02  116  	struct ice_vsi_vlan_ops *vl=
an_ops;
cc71de8fa13395d Brett Creeley 2021-12-02  117  =

cc71de8fa13395d Brett Creeley 2021-12-02  118  	if (!ice_is_dvm_ena(&vsi->b=
ack->hw) || ice_vf_is_port_vlan_ena(vf))
cc71de8fa13395d Brett Creeley 2021-12-02  119  		return;
cc71de8fa13395d Brett Creeley 2021-12-02  120  =

cc71de8fa13395d Brett Creeley 2021-12-02  121  	vlan_ops =3D &vsi->outer_vl=
an_ops;
cc71de8fa13395d Brett Creeley 2021-12-02  122  =

cc71de8fa13395d Brett Creeley 2021-12-02  123  	/* Rx VLAN filtering always=
 disabled to allow software offloaded VLANs
cc71de8fa13395d Brett Creeley 2021-12-02  124  	 * for VFs that only suppor=
t VIRTCHNL_VF_OFFLOAD_VLAN and don't have a
cc71de8fa13395d Brett Creeley 2021-12-02  125  	 * port VLAN configured
cc71de8fa13395d Brett Creeley 2021-12-02  126  	 */
cc71de8fa13395d Brett Creeley 2021-12-02  127  	vlan_ops->dis_rx_filtering =
=3D ice_vsi_dis_rx_vlan_filtering;
cc71de8fa13395d Brett Creeley 2021-12-02  128  	/* Don't fail when attempti=
ng to enable Rx VLAN filtering */
cc71de8fa13395d Brett Creeley 2021-12-02  129  	vlan_ops->ena_rx_filtering =
=3D noop_vlan;
cc71de8fa13395d Brett Creeley 2021-12-02  130  =

cc71de8fa13395d Brett Creeley 2021-12-02  131  	/* Tx VLAN filtering always=
 disabled to allow software offloaded VLANs
cc71de8fa13395d Brett Creeley 2021-12-02  132  	 * for VFs that only suppor=
t VIRTCHNL_VF_OFFLOAD_VLAN and don't have a
cc71de8fa13395d Brett Creeley 2021-12-02  133  	 * port VLAN configured
cc71de8fa13395d Brett Creeley 2021-12-02  134  	 */
cc71de8fa13395d Brett Creeley 2021-12-02  135  	vlan_ops->dis_tx_filtering =
=3D ice_vsi_dis_tx_vlan_filtering;
cc71de8fa13395d Brett Creeley 2021-12-02  136  	/* Don't fail when attempti=
ng to enable Tx VLAN filtering */
cc71de8fa13395d Brett Creeley 2021-12-02  137  	vlan_ops->ena_tx_filtering =
=3D noop_vlan;
cc71de8fa13395d Brett Creeley 2021-12-02  138  =

cc71de8fa13395d Brett Creeley 2021-12-02  139  	if (vlan_ops->dis_rx_filter=
ing(vsi))
cc71de8fa13395d Brett Creeley 2021-12-02  140  		dev_dbg(dev, "Failed to di=
sable Rx VLAN filtering for old VF without VIRTCHNL_VF_OFFLOAD_VLAN_V2 supp=
ort\n");
cc71de8fa13395d Brett Creeley 2021-12-02  141  	if (vlan_ops->dis_tx_filter=
ing(vsi))
cc71de8fa13395d Brett Creeley 2021-12-02  142  		dev_dbg(dev, "Failed to di=
sable Tx VLAN filtering for old VF without VIRTHCNL_VF_OFFLOAD_VLAN_V2 supp=
ort\n");
cc71de8fa13395d Brett Creeley 2021-12-02  143  =

cc71de8fa13395d Brett Creeley 2021-12-02  144  	/* All outer VLAN offloads =
must be disabled */
cc71de8fa13395d Brett Creeley 2021-12-02  145  	vlan_ops->dis_stripping =3D=
 ice_vsi_dis_outer_stripping;
cc71de8fa13395d Brett Creeley 2021-12-02  146  	vlan_ops->dis_insertion =3D=
 ice_vsi_dis_outer_insertion;
cc71de8fa13395d Brett Creeley 2021-12-02  147  =

cc71de8fa13395d Brett Creeley 2021-12-02  148  	if (vlan_ops->dis_stripping=
(vsi))
cc71de8fa13395d Brett Creeley 2021-12-02  149  		dev_dbg(dev, "Failed to di=
sable outer VLAN stripping for old VF without VIRTCHNL_VF_OFFLOAD_VLAN_V2 s=
upport\n");
cc71de8fa13395d Brett Creeley 2021-12-02  150  =

cc71de8fa13395d Brett Creeley 2021-12-02  151  	if (vlan_ops->dis_insertion=
(vsi))
cc71de8fa13395d Brett Creeley 2021-12-02  152  		dev_dbg(dev, "Failed to di=
sable outer VLAN insertion for old VF without VIRTCHNL_VF_OFFLOAD_VLAN_V2 s=
upport\n");
cc71de8fa13395d Brett Creeley 2021-12-02  153  =

cc71de8fa13395d Brett Creeley 2021-12-02  154  	/* All inner VLAN offloads =
must be disabled */
cc71de8fa13395d Brett Creeley 2021-12-02  155  	vlan_ops =3D &vsi->inner_vl=
an_ops;
cc71de8fa13395d Brett Creeley 2021-12-02  156  =

cc71de8fa13395d Brett Creeley 2021-12-02  157  	vlan_ops->dis_stripping =3D=
 ice_vsi_dis_outer_stripping;
cc71de8fa13395d Brett Creeley 2021-12-02  158  	vlan_ops->dis_insertion =3D=
 ice_vsi_dis_outer_insertion;
cc71de8fa13395d Brett Creeley 2021-12-02  159  =

cc71de8fa13395d Brett Creeley 2021-12-02  160  	if (vlan_ops->dis_stripping=
(vsi))
cc71de8fa13395d Brett Creeley 2021-12-02  161  		dev_dbg(dev, "Failed to di=
sable inner VLAN stripping for old VF without VIRTCHNL_VF_OFFLOAD_VLAN_V2 s=
upport\n");
cc71de8fa13395d Brett Creeley 2021-12-02  162  =

cc71de8fa13395d Brett Creeley 2021-12-02  163  	if (vlan_ops->dis_insertion=
(vsi))
cc71de8fa13395d Brett Creeley 2021-12-02  164  		dev_dbg(dev, "Failed to di=
sable inner VLAN insertion for old VF without VIRTCHNL_VF_OFFLOAD_VLAN_V2 s=
upport\n");
cc71de8fa13395d Brett Creeley 2021-12-02  165  }
cc71de8fa13395d Brett Creeley 2021-12-02  166  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0985973320678978257==--

